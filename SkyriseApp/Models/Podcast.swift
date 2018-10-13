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
    
    init(artistName: String?, collectionName: String?, trackName: String?) {
        self.artistName = artistName
        self.collectionName = collectionName
        self.trackName = trackName
    }
    
}
