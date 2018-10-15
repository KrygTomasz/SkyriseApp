//
//  PodcastDetailsViewModel.swift
//  SkyriseApp
//
//  Created by Krygu on 15/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import Foundation
import UIKit

class PodcastDetailsViewModel {
    
    //MARK: Properties
    private let podcastViewModel: PodcastViewModel
    
    var trackName: String {
        guard let track = podcastViewModel.trackName else {
            return "–"
        }
        return track
    }
    
    var collectionName: String {
        if collectionIsHidden {
            return ""
        }
        return podcastViewModel.collectionName ?? ""
    }
    
    var artistName: String {
        if artistIsHidden {
            return ""
        }
        return podcastViewModel.artistName ?? ""
    }
    
    var priceText: String {
        guard
            let price = podcastViewModel.trackPrice,
            let currency = podcastViewModel.currency
            else {
                return "–"
        }
        return "\(price) \(currency)"
    }
    
    var collectionIsHidden: Bool {
        guard let _ = podcastViewModel.collectionName else {
            return true
        }
        return false
    }
    
    var artistIsHidden: Bool {
        guard let _ = podcastViewModel.artistName else {
            return true
        }
        return false
    }
    
    //MARK: Initializer
    init(using podcastViewModel: PodcastViewModel) {
        self.podcastViewModel = podcastViewModel
    }
    
    //MARK: Image loading method
    func loadImage(completion: @escaping (UIImage?) -> Void) {
        self.podcastViewModel.loadBigImage(completion: completion)
    }
    
}
