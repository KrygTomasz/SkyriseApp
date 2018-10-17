//
//  ArtistPicker.swift
//  SkyriseApp
//
//  Created by Krygu on 15/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import Foundation

class ArtistPicker {
    
    //MARK: Properties
    private let defaults = UserDefaults()
    private let allArtists: [String] = ["depeche mode", "eminem", "nightwish", "acdc", "dawid podsiadło", "nicki minaj", "clean bandit", "pharrell williams", "ed sheeran", "adele", "taylor swift", "iggy azalea"]
    private var leftArtists: [String] = [] {
        didSet {
            defaults.set(leftArtists, forKey: "leftArtists")
        }
    }
    
    //MARK: Initializer
    init() {
        let all = defaults.object(forKey: "allArtists") as? [String] ?? []
        if all != allArtists {
            defaults.set(allArtists, forKey: "allArtists")
            self.leftArtists = self.allArtists
        } else {
            self.leftArtists = defaults.object(forKey: "leftArtists") as? [String] ?? []
        }
    }
    
    //MARK: Random pick method
    func pick() -> String {
        if leftArtists.isEmpty {
            leftArtists = allArtists
        }
        let random = Int.random(in: 0 ..< leftArtists.count)
        return leftArtists.remove(at: random)
    }
    
}
