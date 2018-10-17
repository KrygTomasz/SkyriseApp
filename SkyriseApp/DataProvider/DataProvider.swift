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
    var onDataUpdate: (WSResult<Model, WSError>) -> Void
    
    //MARK: Initializer
    init(webService: WebService<Model>?, onDataUpdate: @escaping (WSResult<Model, WSError>) -> Void) {
        self.webService = webService
        self.onDataUpdate = onDataUpdate
    }
    
    //MARK: Data fetch methods
    func getData() {
        webService?.downloadData() { [weak self] result in
            self?.onDataUpdate(result)
        }
    }
    
}
