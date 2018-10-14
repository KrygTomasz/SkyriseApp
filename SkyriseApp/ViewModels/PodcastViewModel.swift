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
    
    //MARK: Initializer
    init(podcast: Podcast) {
        self.artistName = podcast.artistName
        self.collectionName = podcast.collectionName
        self.trackName = podcast.trackName
    }
    
}
