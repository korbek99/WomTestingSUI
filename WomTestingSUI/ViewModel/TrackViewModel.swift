//
//  TrackViewModel.swift
//  WomTestingSUI
//
//  Created by Jose David Bustos H on 22-07-24.
//
import Foundation
import Combine

class TrackViewModel: ObservableObject {
    @Published var indicadores: [Track] = []
    @Published var hasError: Bool = false
    private let networkService = NetworkService()
    
    init() {
        fetchIndicadores()
    }
    
    func fetchIndicadores() {
        networkService.fetchIndicadores { [weak self] response in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let response = response, !response.isEmpty {
                    self.indicadores = response
                } else {
                    self.hasError = true 
                }
            }
        }
    }
}
