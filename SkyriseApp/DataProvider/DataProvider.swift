//
//  DataProvider.swift
//  SkyriseApp
//
//  Created by Krygu on 14/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import Foundation

class DataProvider<Model: Codable> {
    
    //MARK: Properties
    var webService: WebService<Model>?
    var onDataUpdate: (Model) -> Void
    
    //MARK: Initializer
    init(webService: WebService<Model>?, onDataUpdate: @escaping (Model) -> Void) {
        self.webService = webService
        self.onDataUpdate = onDataUpdate
    }
    
    //MARK: Data fetch methods
    func getData() {
        ProgressHUD.shared.showActivityIndicator(title: "\("downloading".localized())...")
        webService?.downloadData() { [weak self] result in
            DispatchQueue.main.async {
                ProgressHUD.shared.hideActivityIndicator()
            }
            switch result {
            case .failure(let error):
                break
            case .success(let data):
                self?.onDataUpdate(data)
            }
        }
    }
    
}
