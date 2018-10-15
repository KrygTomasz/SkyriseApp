//
//  Podcast.swift
//  SkyriseApp
//
//  Created by Krygu on 13/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import Foundation

class Podcast: Codable {
    
    var artistName: String?
    var collectionName: String?
    var trackName: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var trackPrice: Double?
    var currency: String?
    
    init(artistName: String?, collectionName: String?, trackName: String?, artworkUrl60: String?, artworkUrl100: String?, trackPrice: Double?, currency: String?) {
        self.artistName = artistName
        self.collectionName = collectionName
        self.trackName = trackName
        self.artworkUrl60 = artworkUrl60
        self.artworkUrl100 = artworkUrl100
        self.trackPrice = trackPrice
        self.currency = currency
    }
    
}
