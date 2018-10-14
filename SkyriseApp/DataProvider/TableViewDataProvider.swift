//
//  TableViewDataProvider.swift
//  SkyriseApp
//
//  Created by Krygu on 14/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import Foundation

class DataProvider<Model: Codable> {
    
    var webService: WebService<Model>?
    var onDataUpdate: (Model) -> Void
    
    init(webService: WebService<Model>?, onDataUpdate: @escaping (Model) -> Void) {
        self.webService = webService
        self.onDataUpdate = onDataUpdate
    }
    
    func getData() {
        webService?.downloadData() { [weak self] result in
            switch result {
            case .failure(let error):
                break
            case .success(let data):
                self?.onDataUpdate(data)
            }
        }
    }
    
}
