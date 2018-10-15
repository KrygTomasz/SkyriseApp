//
//  PodcastViewModel.swift
//  SkyriseApp
//
//  Created by Krygu on 14/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import Foundation
import UIKit

class PodcastViewModel {
    
    //MARK: Properties
    var artistName: String?
    var collectionName: String?
    var trackName: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var trackPrice: Double?
    var currency: String?
    
    //MARK: Initializer
    init(podcast: Podcast) {
        self.artistName = podcast.artistName
        self.collectionName = podcast.collectionName
        self.trackName = podcast.trackName
        self.artworkUrl60 = podcast.artworkUrl60
        self.artworkUrl100 = podcast.artworkUrl100
        self.trackPrice = podcast.trackPrice
        self.currency = podcast.currency
    }
    
}