//
//  UIViewController+Extensions.swift
//  SkyriseApp
//
//  Created by Krygu on 15/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    //MARK: Preparing NavigationBar
    func setUpNavigationBar(withTitle title: String) {
        navigationItem.title = title
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .backgroundColor
    }
    
}
