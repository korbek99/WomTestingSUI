//
//  RemoteImage.swift
//  WomTestingSUI
//
//  Created by Jose David Bustos H on 22-07-24.
//

import Foundation
import SwiftUI

struct RemoteImage: View {
    @StateObject private var imageLoader = ImageLoader()
    let url: URL?
    
    var body: some View {
        Group {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            if let url = url {
                imageLoader.load(from: url)
            }
        }
    }
}
