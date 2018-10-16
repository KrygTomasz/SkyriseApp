//
//  PodcastDetailsViewController.swift
//  SkyriseApp
//
//  Created by Krygu on 13/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import UIKit

class PodcastDetailsViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 12.0
        }
    }
    @IBOutlet weak var priceLabel: UILabel! {
        didSet {
            priceLabel.textColor = .lightGray
        }
    }
    @IBOutlet weak var coverContentView: UIView! {
        didSet {
            coverContentView.isHidden = true
        }
    }
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var collectionContentView: UIView!
    @IBOutlet weak var collectionTitleLabel: UILabel! {
        didSet {
            collectionTitleLabel.text = "from".localized()
        }
    }
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var artistContentView: UIView!
    @IBOutlet weak var artistTitleLabel: UILabel! {
        didSet {
            artistTitleLabel.text = "by".localized()
        }
    }
    @IBOutlet weak var artistNameLabel: UILabel!
    
    //MARK: Properties
    var podcastDetailsViewModel: PodcastDetailsViewModel?
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetUp()
    }
    
    //MARK: View configuration methods
    private func initialSetUp() {
        self.setUpNavigationBar(withTitle: "podcastDetails".localized())
        self.view.backgroundColor = .backgroundColor
        setUpData()
        hideEmptyViews()
    }
    
    private func setUpData() {
        guard let vm = podcastDetailsViewModel else { return }
        priceLabel.text = vm.priceText
        trackNameLabel.text = vm.trackName
        collectionNameLabel.text = vm.collectionName
        artistNameLabel.text = vm.artistName
        vm.loadImage { [weak self] coverImage in
            DispatchQueue.main.async {
                self?.setUpCover(coverImage)
            }
        }
    }
    
    private func hideEmptyViews() {
        guard let vm = podcastDetailsViewModel else { return }
        collectionContentView.isHidden = vm.collectionIsHidden
        artistContentView.isHidden = vm.artistIsHidden
    }
    
    private func setUpCover(_ image: UIImage?) {
        if let imageObj = image {
            self.coverImageView.image = imageObj
            self.coverContentView.isHidden = false
        } else {
            self.coverContentView.isHidden = true
        }
    }
    
}

//MARK: Constructor
extension PodcastDetailsViewController {
    
    static func getInstance(using podcastDetailsViewModel: PodcastDetailsViewModel) -> PodcastDetailsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let podcastDetailsVC = storyboard.instantiateViewController(withIdentifier: "PodcastDetailsViewController") as? PodcastDetailsViewController else {
            fatalError("Cannot instantiate PodcastDetailsViewController")
        }
        podcastDetailsVC.podcastDetailsViewModel = podcastDetailsViewModel
        return podcastDetailsVC
    }
    
}
