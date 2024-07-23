//
//  FavoriteView.swift
//  WomTestingSUI
//
//  Created by Jose David Bustos H on 22-07-24.
//
import SwiftUI

struct FavoriteView: View {
    @State private var favoriteTracks: [Track] = []

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(favoriteTracks) { track in
                        HStack {
                            RemoteImage(url: URL(string: track.artworkUrl100))
                                .frame(width: 100, height: 100)
                            
                            VStack(alignment: .leading) {
                                Text(track.artistName)
                                    .font(.headline)
                                Text(track.collectionName)
                                    .font(.subheadline)
                                Text(track.trackName)
                                    .font(.body)
                            }
                            .padding(.leading, 8)
                        }
                    }
                    .onDelete(perform: delete)
                }
                .navigationTitle("Favorites")
            }
            .onAppear {
                loadFavoriteTracks()
            }
        }
    }

    private func loadFavoriteTracks() {
        let favorites = UserDefaults.standard.array(forKey: "favoriteTracks") as? [Data] ?? []
        favoriteTracks = favorites.compactMap { data in
            try? JSONDecoder().decode(Track.self, from: data)
        }
    }
    
    private func delete(at offsets: IndexSet) {
        var favorites = UserDefaults.standard.array(forKey: "favoriteTracks") as? [Data] ?? []
        for index in offsets {
            let trackToRemove = favoriteTracks[index]
            if let encodedTrack = try? JSONEncoder().encode(trackToRemove),
               let itemIndex = favorites.firstIndex(of: encodedTrack) {
                favorites.remove(at: itemIndex)
            }
        }

        UserDefaults.standard.set(favorites, forKey: "favoriteTracks")
        favoriteTracks.remove(atOffsets: offsets)
    }
}

