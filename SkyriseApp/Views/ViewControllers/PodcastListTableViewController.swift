//
//  PodcastListTableViewController.swift
//  SkyriseApp
//
//  Created by Krygu on 13/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import UIKit

class PodcastListTableViewController: UITableViewController {

    private var podcastListViewModel: PodcastListViewModel!
    private var webService: WebService<PodcastList>!
    private var dataSource: TableViewDataSource<PodcastTableViewCell, PodcastViewModel>!
    private var dataProvider: DataProvider<PodcastList>!
    private let podcastCellIdentifier: String = "PodcastTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        self.podcastListViewModel = PodcastListViewModel()
        prepareDataSource()
        prepareDataProvider()
        dataProvider.getData()
    }
    
    private func registerCells() {
        let podcastCellNib = UINib(nibName: podcastCellIdentifier, bundle: nil)
        tableView.register(podcastCellNib, forCellReuseIdentifier: podcastCellIdentifier)
    }
    
    private func prepareDataSource() {
        self.dataSource = TableViewDataSource(cellIdentifier: self.podcastCellIdentifier, viewModels: self.podcastListViewModel.podcastViewModels, configureCell: self.configureCell)
        self.tableView.dataSource = self.dataSource
        self.tableView.reloadData()
    }
    
    private func prepareDataProvider() {
        self.webService = WebService<PodcastList>(feed: PodcastFeed(termToSearch: "depechemode"))
        self.dataProvider = DataProvider(webService: self.webService, onDataUpdate: { [weak self] podcastList in
            let podcasts = podcastList.results
            self?.podcastListViewModel.podcastViewModels = podcasts.map(PodcastViewModel.init)
            DispatchQueue.main.async {
                self?.prepareDataSource()
            }
        })
    }
    
    private func configureCell(_ cell: PodcastTableViewCell, using viewModel: PodcastViewModel) {
        cell.trackNameLabel.text = viewModel.trackName
        cell.artistNameLabel.text = viewModel.artistName
    }
    
    private func goToPodcastDetails() {
        let vc = PodcastDetailsViewController.getInstance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToPodcastDetails()
    }
    
}
