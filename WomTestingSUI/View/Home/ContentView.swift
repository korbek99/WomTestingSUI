//
//  ContentView.swift
//  WomTestingSUI
//
//  Created by Jose David Bustos H on 22-07-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TrackView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            FavoriteView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
            
            InfoView()
                .tabItem {
                    Label("Favorites", systemImage: "info")
                }
        }
    }
}
