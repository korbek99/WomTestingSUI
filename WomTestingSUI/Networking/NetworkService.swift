//
//  NetworkService.swift
//  WomTestingSUI
//
//  Created by Jose David Bustos H on 22-07-24.
//

import Foundation

class NetworkService {
    let utilEndpoint = UtilsEndpoints()
    func fetchIndicadores(completion: @escaping ([Track]?) -> Void) {
        let endpointData = utilEndpoint.getEndpoint(fromName: "crearIssue")!
//        var headers: [String: String] = ["Content-Type" : "application/json"]
//        headers["x-api-key"] = endpointData.APIKey
//        if let APIToken = endpointData.APIToken {
//            headers["x-api-token"] = APIToken
//        }
        let urlString = endpointData.url.absoluteString
     
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response received")
                completion(nil)
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                print("HTTP Error: \(httpResponse.statusCode)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            do {
                let trackResponse = try JSONDecoder().decode(TrackResponse.self, from: data)
                completion(trackResponse.results)
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()

    }
}
