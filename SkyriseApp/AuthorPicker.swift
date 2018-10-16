//
//  AuthorPicker.swift
//  SkyriseApp
//
//  Created by Krygu on 15/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import Foundation

class AuthorPicker {
    
    //MARK: Properties
    private let defaults = UserDefaults()
    private let allAuthors: [String] = ["depeche mode", "eminem", "nightwish", "acdc", "dawid podsiadło", "nicki minaj", "clean bandit", "pharrell williams", "ed sheeran", "adele", "taylor swift", "iggy azalea"]
    private var leftAuthors: [String] = [] {
        didSet {
            defaults.set(leftAuthors, forKey: "leftAuthors")
        }
    }
    
    //MARK: Initializer
    init() {
        let all = defaults.object(forKey: "allAuthors") as? [String] ?? []
        if all != allAuthors {
            defaults.set(allAuthors, forKey: "allAuthors")
            self.leftAuthors = self.allAuthors
        } else {
            self.leftAuthors = defaults.object(forKey: "leftAuthors") as? [String] ?? []
        }
    }
    
    //MARK: Random pick method
    func pick() -> String {
        if leftAuthors.isEmpty {
            leftAuthors = allAuthors
        }
        let random = Int.random(in: 0 ..< leftAuthors.count)
        return leftAuthors.remove(at: random)
    }
    
}
