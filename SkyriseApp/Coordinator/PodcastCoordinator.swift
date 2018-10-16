//
//  PodcastCoordinator.swift
//  SkyriseApp
//
//  Created by Krygu on 16/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import UIKit

class PodcastCoordinator: Coordinator {
    
    //MARK: Properties
    private let navigationController: UINavigationController
    
    //MARK: Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK: Show methods
    func start() {
        showPodcastList()
    }
    
    func showPodcastList() {
        let vc = PodcastListTableViewController.getInstance()
        vc.delegate = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showPodcastDetails(viewModel: PodcastDetailsViewModel) {
        let vc = PodcastDetailsViewController.getInstance(using: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
}

//MARK: PodcastListViewControllerDelegate
extension PodcastCoordinator: PodcastListViewControllerDelegate {
    func podcastListViewDidSelect(viewModel: PodcastViewModel) {
        let vm = PodcastDetailsViewModel(using: viewModel)
        self.showPodcastDetails(viewModel: vm)
    }
}
