//
//  PodcastTableViewCell.swift
//  SkyriseApp
//
//  Created by Krygu on 13/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import UIKit

class PodcastTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.borderWidth = Constants.containerBorderWidth
            containerView.layer.cornerRadius = Constants.containerCornerRadius
        }
    }
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    private struct Constants {
        static let containerCornerRadius: CGFloat = 5.0
        static let containerBorderWidth: CGFloat = 2.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            containerView.layer.borderColor = UIColor.tintColor.cgColor
        } else {
            containerView.layer.borderColor = UIColor.white.cgColor
        }
    }
    
}
