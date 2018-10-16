//
//  PodcastListViewModel.swift
//  SkyriseApp
//
//  Created by Krygu on 14/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import Foundation
import UIKit

enum PodcastListEmptyViewState {
    case noData
    case failure(WSError)
    case none
}

class PodcastListViewModel {
    
    //MARK: Properties
    var podcastViewModels: [PodcastViewModel] = [PodcastViewModel]()
    var authorPicker: AuthorPicker = AuthorPicker()
    var dataProvider: DataProvider<PodcastList>?
    let onDataUpdated: () -> Void
    var emptyViewMessage: String {
        switch emptyViewState {
        case .noData:
            return "noPodcasts".localized()
        case .failure(let error):
            return error.localizedDescription
        case .none:
            return ""
        }
    }
    private var emptyViewState: PodcastListEmptyViewState = .none
    
    //MARK: Initializer
    init(onDataUpdated: @escaping () -> Void) {
        self.onDataUpdated = onDataUpdated
        self.prepareDataProvider()
    }
    
    //MARK: Podcasts management methods
    private func prepareDataProvider() {
        let webService = WebService<PodcastList>(feed: PodcastFeed(termToSearch: authorPicker.pick()))
        self.dataProvider = DataProvider(webService: webService, onDataUpdate: { [weak self] result in
            switch result {
            case .success(let podcastList):
                self?.emptyViewState = .noData
                let podcasts = podcastList.results
                self?.podcastViewModels = podcasts.map(PodcastViewModel.init)
                self?.onDataUpdated()
            case .failure(let error):
                self?.emptyViewState = .failure(error)
                self?.podcastViewModels = []
                self?.onDataUpdated()
            }
        })
    }
    
    func fetchData() {
        self.dataProvider?.getData()
    }
    
    func podcastViewModel(at index: Int) -> PodcastViewModel {
        return podcastViewModels[index]
    }
    
}
