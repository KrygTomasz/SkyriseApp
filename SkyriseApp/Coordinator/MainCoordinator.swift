//
//  MainCoordinator.swift
//  SkyriseApp
//
//  Created by Krygu on 16/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    //MARK: Properties
    private let window: UIWindow
    private let navigationController: UINavigationController
    private var podcastCoordinator: PodcastCoordinator!
    
    //MARK: Initializer
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        self.window.rootViewController = self.navigationController
    }
    
    //MARK: Show methods
    func start() {
        showPodcasts()
    }
    
    func showPodcasts() {
        self.podcastCoordinator = PodcastCoordinator(navigationController: self.navigationController)
        self.podcastCoordinator.start()
    }
    
}

