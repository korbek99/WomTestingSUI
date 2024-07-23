//
//  DataCoreViewModel.swift
//  WomTestingSUI
//
//  Created by Jose David Bustos H on 22-07-24.
//

import Foundation
class DataCoreViewModel {
    
    public func saveFavoriteTrack(_ track: Track) {
        var favorites = UserDefaults.standard.array(forKey: "favoriteTracks") as? [Data] ?? []
        if let encodedTrack = try? JSONEncoder().encode(track) {
            favorites.append(encodedTrack)
            UserDefaults.standard.set(favorites, forKey: "favoriteTracks")
            NotificationCenter.default.post(name: NSNotification.Name("FavoriteAdded"), object: nil)
            print("Track saved to favorites.")
        }
    }
    
    public func removeFavoriteTrack(_ track: Track) {
        var favorites = UserDefaults.standard.array(forKey: "favoriteTracks") as? [Data] ?? []
        if let encodedTrack = try? JSONEncoder().encode(track),
           let index = favorites.firstIndex(of: encodedTrack) {
            favorites.remove(at: index)
            UserDefaults.standard.set(favorites, forKey: "favoriteTracks")
            NotificationCenter.default.post(name: NSNotification.Name("FavoriteRemoved"), object: nil)
            print("Track removed from favorites.")
        }
    }
    
    public func checkIfFavorite(track: Track) -> Bool {
        var isFavorite: Bool = false
        let favorites = UserDefaults.standard.array(forKey: "favoriteTracks") as? [Data] ?? []
        if let encodedTrack = try? JSONEncoder().encode(track),
           favorites.contains(encodedTrack) {
            isFavorite = true
        } else {
            isFavorite = false
        }
        return isFavorite
    }
}
