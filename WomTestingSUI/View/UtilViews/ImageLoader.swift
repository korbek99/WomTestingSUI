//
//  ImageLoader.swift
//  WomTestingSUI
//
//  Created by Jose David Bustos H on 22-07-24.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage? = nil
    private var cancellable: AnyCancellable?
    
    func load(from url: URL) {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .map { UIImage(data: $0) }
            .replaceError(with: UIImage(systemName: "photo"))
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] image in
                self?.image = image
            })
    }
}



