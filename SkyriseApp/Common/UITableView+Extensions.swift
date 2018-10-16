//
//  UITableView+Extensions.swift
//  SkyriseApp
//
//  Created by Krygu on 16/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import UIKit

extension UITableView {
    
    //MARK: Cell registration method
    func registerCell(identifier: String, bundle: Bundle? = nil) {
        let cellNib = UINib(nibName: identifier, bundle: bundle)
        self.register(cellNib, forCellReuseIdentifier: identifier)
    }
    
}
