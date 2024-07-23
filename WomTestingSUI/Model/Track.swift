//
//  Track.swift
//  WomTestingSUI
//
//  Created by Jose David Bustos H on 22-07-24.
//

import Foundation
extension Track: Identifiable {
    var id: Int { // Usa un identificador único que ya existe en el modelo
        return trackId
    }
}
struct TrackResponse: Codable {
    let resultCount: Int
    let results: [Track]
}

struct Track: Codable {
    let wrapperType: String
    let kind: String
    let artistId: Int
    let collectionId: Int
    let trackId: Int
    let artistName: String
    let collectionName: String
    let trackName: String
    let collectionCensoredName: String
    let trackCensoredName: String
    let artistViewUrl: String
    let collectionViewUrl: String
    let trackViewUrl: String
    let previewUrl: String
    let artworkUrl30: String
    let artworkUrl60: String
    let artworkUrl100: String
    let collectionPrice: Double?
    let trackPrice: Double?
    let releaseDate: String
    let collectionExplicitness: String
    let trackExplicitness: String
    let discCount: Int
    let discNumber: Int
    let trackCount: Int
    let trackNumber: Int
    let trackTimeMillis: Int
    let country: String
    let currency: String
    let primaryGenreName: String
    let isStreamable: Bool
}
