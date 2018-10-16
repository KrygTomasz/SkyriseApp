//
//  PodcastListTableViewController.swift
//  SkyriseApp
//
//  Created by Krygu on 13/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import UIKit
import UIEmptyState

protocol PodcastListViewControllerDelegate: class {
    func podcastListViewDidSelect(viewModel: PodcastViewModel)
}

class PodcastListTableViewController: UITableViewController {
    
    //MARK: Properties
    private var podcastListViewModel: PodcastListViewModel!
    private var dataSource: TableViewDataSource<PodcastTableViewCell, PodcastViewModel>!
    weak var delegate: PodcastListViewControllerDelegate?
    
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
        setUpEmptyState()
        tableView.keyboardDismissMode = .interactive
        tableView.backgroundColor = .backgroundColor
        tableView.contentInset = UIEdgeInsets(top: Constants.topInset, left: Constants.leftInset, bottom: Constants.bottomInset, right: Constants.rightInset)
    }
    
    private func registerCells() {
        tableView.registerCell(identifier: Constants.podcastCellIdentifier)
    }
    
    private func setUpEmptyState() {
        self.emptyStateDelegate = self
        self.emptyStateDataSource = self
    }
    
    private func setUpDataSource() {
        self.dataSource = TableViewDataSource(cellIdentifier: Constants.podcastCellIdentifier, viewModels: self.podcastListViewModel.podcastViewModels, configureCell: self.configureCell)
        self.tableView.dataSource = self.dataSource
        self.tableView.reloadData()
        self.reloadEmptyStateForTableView(self.tableView)
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
        delegate?.podcastListViewDidSelect(viewModel: model)
    }
    
}

//MARK: UIEmptyStateDelegates
extension PodcastListTableViewController: UIEmptyStateDelegate, UIEmptyStateDataSource {
    
    var emptyStateTitle: NSAttributedString {
        return NSAttributedString(string: podcastListViewModel.emptyViewMessage, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    var emptyStateImage: UIImage? {
        let image = UIImage(named: "podcastIcon")?.withRenderingMode(.alwaysTemplate)
        return image
    }
    
    var emptyStateImageViewTintColor: UIColor? {
        return UIColor.white
    }
    
}

//MARK: Constructor
extension PodcastListTableViewController {
    
    static func getInstance() -> PodcastListTableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "PodcastListTableViewController") as? PodcastListTableViewController else {
            fatalError("Cannot instantiate PodcastDetailsViewController")
        }
        return vc
    }
    
}
