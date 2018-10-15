//
//  PodcastListViewModel.swift
//  SkyriseApp
//
//  Created by Krygu on 14/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import Foundation
import UIKit

class PodcastListViewModel {
    
    //MARK: Properties
    var podcastViewModels: [PodcastViewModel] = [PodcastViewModel]()
    var authorPicker: AuthorPicker = AuthorPicker()
    var dataProvider: DataProvider<PodcastList>?
    let onDataUpdated: () -> Void
    
    //MARK: Initializer
    init(onDataUpdated: @escaping () -> Void) {
        self.onDataUpdated = onDataUpdated
        self.prepareDataProvider()
    }
    
    //MARK: Podcasts management methods
    private func prepareDataProvider() {
        let webService = WebService<PodcastList>(feed: PodcastFeed(termToSearch: authorPicker.pick()))
        self.dataProvider = DataProvider(webService: webService, onDataUpdate: { [weak self] podcastList in
            let podcasts = podcastList.results
            self?.podcastViewModels = podcasts.map(PodcastViewModel.init)
            self?.onDataUpdated()
        })
    }
    
    func fetchData() {
        self.dataProvider?.getData()
    }
    
    func podcastViewModel(at index: Int) -> PodcastViewModel {
        return podcastViewModels[index]
    }
    
}
