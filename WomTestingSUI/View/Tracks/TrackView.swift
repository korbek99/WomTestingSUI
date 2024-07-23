//
//  TrackView.swift
//  WomTestingSUI
//
//  Created by Jose David Bustos H on 22-07-24.
//
import SwiftUI

struct TrackView: View {
    @StateObject private var viewModel = TrackViewModel()
    @State private var searchText = ""
    @State private var showError = false
    @State private var showErrorAlert = false
    @State private var errorMessage = ""

    private var filteredTracks: [Track] {
        if searchText.isEmpty {
            return viewModel.indicadores
        } else {
            return viewModel.indicadores.filter { $0.artistName.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
//                if viewModel.indicadores.isEmpty {
//                                    Text("Cargando...")
//                                        .font(.headline)
//                } else {
                    List(filteredTracks) { track in
                        NavigationLink(destination: TrackDetailView(track: track)) {
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
                    }
                    .alert(isPresented: $showError) {
                        Alert(
                            title: Text("Error"),
                            message: Text("No se pudieron cargar los datos. Inténtalo de nuevo más tarde."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                //}
               
            }
            .navigationTitle("Tracks")
        }
        .onAppear {
            viewModel.fetchIndicadores()
        }
        .onChange(of: viewModel.hasError) { hasError in
            if hasError {
                showError = true
            }
        }
    }
}

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        var parent: SearchBar
        
        init(parent: SearchBar) {
            self.parent = parent
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            parent.text = searchText
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            parent.text = ""
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator
        searchBar.placeholder = "Search by Artist"
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}

struct TrackView_Previews: PreviewProvider {
    static var previews: some View {
        TrackView()
    }
}
