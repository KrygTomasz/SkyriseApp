//
//  PodcastDetailsViewController.swift
//  SkyriseApp
//
//  Created by Krygu on 13/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import UIKit

class PodcastDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PodcastDetailsViewController {
    
    static func getInstance() -> PodcastDetailsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let podcastDetailsVC = storyboard.instantiateViewController(withIdentifier: "PodcastDetailsViewController") as? PodcastDetailsViewController else {
            fatalError("Cannot instantiate PodcastDetailsViewController")
        }
        return podcastDetailsVC
    }
    
}
