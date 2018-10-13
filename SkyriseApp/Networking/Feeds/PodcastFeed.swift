//
//  PodcastFeed.swift
//  SkyriseApp
//
//  Created by Krygu on 13/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import Foundation

class PodcastFeed: Feed {
    
    private var termToSearch: String = ""
    
    init(termToSearch: String) {
        self.termToSearch = termToSearch.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: " ", with: "+")
    }
    
    var base: String {
        return "https://itunes.apple.com"
    }
    
    var path: String {
        return "/search?term=\(termToSearch)"
    }
    
    func getURL() -> URL? {
        let fullAddress = base+path
        guard
            let encodedAddress = fullAddress.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
            let url = URL(string: encodedAddress)
            else {
                return nil
        }
        return url
    }
    
}
