//
//  PodcastListTableViewController.swift
//  SkyriseApp
//
//  Created by Krygu on 13/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import UIKit

class PodcastListTableViewController: UITableViewController {
    
    //MARK: Properties
    private var podcastListViewModel: PodcastListViewModel!
    private var dataSource: TableViewDataSource<PodcastTableViewCell, PodcastViewModel>!
    
    private struct Constants {
        static let podcastCellIdentifier: String = "PodcastTableViewCell"
        static let topInset: CGFloat = 4
        static let leftInset: CGFloat = 0
        static let bottomInset: CGFloat = 4
        static let rightInset: CGFloat = 0
    }
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initalSetUp()
        podcastListViewModel.fetchData()
    }
    
    //MARK: View configuration methods
    private func initalSetUp() {
        ProgressHUD.shared.setUp(navigationController: self.navigationController)
        self.setUpNavigationBar(withTitle: "podcasts".localized())
        podcastListViewModel = PodcastListViewModel(onDataUpdated: {
            DispatchQueue.main.async {
                self.setUpDataSource()
            }
        })
        setUpTableView()
        setUpDataSource()
    }
    
    private func setUpTableView() {
        registerCells()
        tableView.keyboardDismissMode = .interactive
        tableView.backgroundColor = .backgroundColor
        tableView.contentInset = UIEdgeInsets(top: Constants.topInset, left: Constants.leftInset, bottom: Constants.bottomInset, right: Constants.rightInset)
    }
    
    private func registerCells() {
        tableView.registerCell(identifier: Constants.podcastCellIdentifier)
    }
    
    private func setUpDataSource() {
        self.dataSource = TableViewDataSource(cellIdentifier: Constants.podcastCellIdentifier, viewModels: self.podcastListViewModel.podcastViewModels, configureCell: self.configureCell)
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
    
}

//MARK: UITableViewDelegate
extension PodcastListTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = podcastListViewModel.podcastViewModel(at: indexPath.row)
        goToPodcastDetails(using: model)
    }
    
}
