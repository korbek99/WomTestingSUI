//
//  TrackDetailView.swift
//  WomTestingSUI
//
//  Created by Jose David Bustos H on 22-07-24.
//
import SwiftUI

struct TrackDetailView: View {
    var track: Track
    let datacoreViewModel = DataCoreViewModel()
    
    @State private var isFavorite: Bool = false
    
    var body: some View {
        VStack {
            RemoteImage(url: URL(string: track.artworkUrl100))
                .frame(width: 200, height: 200)
            
            Text(track.artistName)
                .font(.largeTitle)
                .padding(.top, 10)
            
            Text(track.collectionName)
                .font(.title)
                .padding(.top, 5)
            
            Text(track.trackName)
                .font(.title2)
                .padding(.top, 5)
            
            Spacer()
            
            Button(action: {
                favoriteButtonTapped()
            }) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(isFavorite ? .red : .gray)
            }
            .padding()
        }
        .padding()
        .navigationTitle("Details")
        .onAppear {
            checkIfFavorite()
        }
    }
    
    private func favoriteButtonTapped() {
        if isFavorite {
            datacoreViewModel.removeFavoriteTrack(track)
        } else {
            datacoreViewModel.saveFavoriteTrack(track)
        }
        isFavorite.toggle()
    }

    private func checkIfFavorite() {
        isFavorite = datacoreViewModel.checkIfFavorite(track: track)
    }
}

