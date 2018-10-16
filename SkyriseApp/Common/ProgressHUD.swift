//
//  ProgressHUD.swift
//  SkyriseApp
//
//  Created by Krygu on 16/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import Foundation
import MBProgressHUD

final class ProgressHUD {
    
    private init() {}
    
    static let shared = ProgressHUD()
    private var progressHUD : MBProgressHUD = MBProgressHUD()
    private weak var navigationController: UINavigationController?
    
    func setUp(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func showActivityIndicator(title: String) {
        if let navController = self.navigationController {
            self.progressHUD = MBProgressHUD.showAdded(to: navController.view, animated: true)
            self.progressHUD.mode = MBProgressHUDMode.indeterminate
            self.progressHUD.label.text = title
            self.progressHUD.activityIndicatorColor = UIColor.black
            self.progressHUD.label.textColor = UIColor.black
            self.progressHUD.dimBackground = true
        }
    }
    
    func hideActivityIndicator() {
        self.progressHUD.hide(animated: true)
    }
    
}
