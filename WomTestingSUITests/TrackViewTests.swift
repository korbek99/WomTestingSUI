//
//  TrackViewTests.swift
//  WomTestingSUITests
//
//  Created by Jose David Bustos H on 22-07-24.
import XCTest
@testable import WomTestingSUI

class TrackViewModelTests: XCTestCase {
    var viewModel: TrackViewModel!

    override func setUpWithError() throws {
        super.setUp()
        viewModel = TrackViewModel()
    }

    func testFilteringByArtistName() throws {
       
        let track1 = Track(wrapperType: "wrapper1", kind: "kind1", artistId: 1, collectionId: 1, trackId: 1, artistName: "Artist1", collectionName: "Collection1", trackName: "Track1", collectionCensoredName: "CollectionCensored1", trackCensoredName: "TrackCensored1", artistViewUrl: "url1", collectionViewUrl: "url1", trackViewUrl: "url1", previewUrl: "url1", artworkUrl30: "https://example.com/image1.jpg", artworkUrl60: "https://example.com/image1.jpg", artworkUrl100: "https://example.com/image1.jpg", collectionPrice: 1.0, trackPrice: 1.0, releaseDate: "2024-07-22", collectionExplicitness: "explicit1", trackExplicitness: "explicit1", discCount: 1, discNumber: 1, trackCount: 1, trackNumber: 1, trackTimeMillis: 1, country: "Country1", currency: "Currency1", primaryGenreName: "Genre1", isStreamable: true)
        
        let track2 = Track(wrapperType: "wrapper2", kind: "kind2", artistId: 2, collectionId: 2, trackId: 2, artistName: "Artist2", collectionName: "Collection2", trackName: "Track2", collectionCensoredName: "CollectionCensored2", trackCensoredName: "TrackCensored2", artistViewUrl: "url2", collectionViewUrl: "url2", trackViewUrl: "url2", previewUrl: "url2", artworkUrl30: "https://example.com/image2.jpg", artworkUrl60: "https://example.com/image2.jpg", artworkUrl100: "https://example.com/image2.jpg", collectionPrice: 2.0, trackPrice: 2.0, releaseDate: "2024-07-22", collectionExplicitness: "explicit2", trackExplicitness: "explicit2", discCount: 2, discNumber: 2, trackCount: 2, trackNumber: 2, trackTimeMillis: 2, country: "Country2", currency: "Currency2", primaryGenreName: "Genre2", isStreamable: true)
        
        viewModel.indicadores = [track1, track2]
        
//        // Act
//        viewModel.searchText = "Artist1"
//
//        // Assert
//        XCTAssertEqual(viewModel.filteredTracks.count, 1, "There should be 1 item in the filtered list")
//        XCTAssertEqual(viewModel.filteredTracks.first?.artistName, "Artist1", "The artist name should be 'Artist1'")
    }
    
    func testNoFilterShowsAllTracks() throws {
     
        let track1 = Track(wrapperType: "wrapper1", kind: "kind1", artistId: 1, collectionId: 1, trackId: 1, artistName: "Artist1", collectionName: "Collection1", trackName: "Track1", collectionCensoredName: "CollectionCensored1", trackCensoredName: "TrackCensored1", artistViewUrl: "url1", collectionViewUrl: "url1", trackViewUrl: "url1", previewUrl: "url1", artworkUrl30: "https://example.com/image1.jpg", artworkUrl60: "https://example.com/image1.jpg", artworkUrl100: "https://example.com/image1.jpg", collectionPrice: 1.0, trackPrice: 1.0, releaseDate: "2024-07-22", collectionExplicitness: "explicit1", trackExplicitness: "explicit1", discCount: 1, discNumber: 1, trackCount: 1, trackNumber: 1, trackTimeMillis: 1, country: "Country1", currency: "Currency1", primaryGenreName: "Genre1", isStreamable: true)
        let track2 = Track(wrapperType: "wrapper2", kind: "kind2", artistId: 2, collectionId: 2, trackId: 2, artistName: "Artist2", collectionName: "Collection2", trackName: "Track2", collectionCensoredName: "CollectionCensored2", trackCensoredName: "TrackCensored2", artistViewUrl: "url2", collectionViewUrl: "url2", trackViewUrl: "url2", previewUrl: "url2", artworkUrl30: "https://example.com/image2.jpg", artworkUrl60: "https://example.com/image2.jpg", artworkUrl100: "https://example.com/image2.jpg", collectionPrice: 2.0, trackPrice: 2.0, releaseDate: "2024-07-22", collectionExplicitness: "explicit2", trackExplicitness: "explicit2", discCount: 2, discNumber: 2, trackCount: 2, trackNumber: 2, trackTimeMillis: 2, country: "Country2", currency: "Currency2", primaryGenreName: "Genre2", isStreamable: true)
        
        viewModel.indicadores = [track1, track2]
        
//        // Act
//        viewModel.searchText = ""
//        
//        // Assert
//        XCTAssertEqual(viewModel.filteredTracks.count, 2, "There should be 2 items in the filtered list")
    }
}
