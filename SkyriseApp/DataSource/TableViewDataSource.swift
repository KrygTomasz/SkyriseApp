//
//  TableViewDataSource.swift
//  SkyriseApp
//
//  Created by Krygu on 14/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<Cell: UITableViewCell, ViewModel>: NSObject, UITableViewDataSource {
    
    //MARK: Properties
    private var cellIdentifier: String
    private var viewModels: [ViewModel]
    private var configureCell: (Cell, ViewModel) -> Void
    
    //MARK: Initializer
    init(cellIdentifier: String, viewModels: [ViewModel], configureCell: @escaping (Cell, ViewModel) -> Void) {
        self.cellIdentifier = cellIdentifier
        self.viewModels = viewModels
        self.configureCell = configureCell
    }
    
    //MARK: UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? Cell else {
            NSLog("TableViewDataSource couldn't dequeue cell for identifier: \(cellIdentifier)")
            return UITableViewCell()
        }
        let viewModel = viewModels[indexPath.row]
        self.configureCell(cell, viewModel)
        return cell
    }
    
}
