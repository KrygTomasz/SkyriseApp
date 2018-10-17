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
    private var dataProvider: DataProvider<PodcastList>?
    private var emptyViewState: PodcastListEmptyViewState = .none
    private var artistPicker: ArtistPicker = ArtistPicker()
    private let onDataUpdated: () -> Void
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
    var emptyViewImage: UIImage? {
        switch emptyViewState {
        case .noData:
            return UIImage(named: "podcastIcon")
        case .failure(_):
            return UIImage(named: "errorIcon")
        case .none:
            return nil
        }
    }
    
    //MARK: Initializer
    init(onDataUpdated: @escaping () -> Void) {
        self.onDataUpdated = onDataUpdated
        self.prepareDataProvider()
    }
    
    //MARK: Podcasts management methods
    private func prepareDataProvider() {
        let webService = WebService<PodcastList>(feed: PodcastFeed(termToSearch: artistPicker.pick()))
        self.dataProvider = DataProvider(webService: webService, onDataUpdate: { [weak self] result in
            switch result {
            case .success(let podcastList):
                self?.emptyViewState = .noData
                let podcasts = podcastList.results
                self?.podcastViewModels = podcasts.map(PodcastViewModel.init)
            case .failure(let error):
                self?.emptyViewState = .failure(error)
                self?.podcastViewModels = []
            }
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
