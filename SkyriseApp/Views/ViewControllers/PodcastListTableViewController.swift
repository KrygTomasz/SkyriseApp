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
    private var dataSource: TableViewDataSource<PodcastTableViewCell, PodcastViewModel>!
    private let podcastCellIdentifier: String = "PodcastTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        podcastListViewModel = PodcastListViewModel(onDataUpdated: {
            DispatchQueue.main.async {
                self.prepareDataSource()
            }
        })
        prepareTableView()
        prepareDataSource()
        podcastListViewModel.fetchData()
    }
    
    private func prepareTableView() {
        registerCells()
        tableView.keyboardDismissMode = .interactive
        tableView.backgroundColor = .backgroundColor
        tableView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
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
    
    private func configureCell(_ cell: PodcastTableViewCell, using viewModel: PodcastViewModel) {
        cell.trackNameLabel.text = viewModel.trackName
        cell.artistNameLabel.text = viewModel.artistName
        viewModel.loadSmallImage { [weak cell] coverImage in
            DispatchQueue.main.async {
                cell?.coverImageView.image = coverImage
            }
        }
    }
    
    private func goToPodcastDetails(using podcastViewModel: PodcastViewModel) {
        let podcastDetailsViewModel = PodcastDetailsViewModel(using: podcastViewModel)
        let vc = PodcastDetailsViewController.getInstance(using: podcastDetailsViewModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = podcastListViewModel.podcastViewModel(at: indexPath.row)
        goToPodcastDetails(using: model)
    }
    
}
