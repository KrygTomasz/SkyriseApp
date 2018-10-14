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
            containerView.layer.cornerRadius = 5.0
        }
    }
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            containerView.layer.borderWidth = 2.0
            containerView.layer.borderColor = UIColor.tintColor.cgColor
        } else {
            containerView.layer.borderWidth = 0.0
            containerView.layer.borderColor = UIColor.white.cgColor
        }
    }
    
}
