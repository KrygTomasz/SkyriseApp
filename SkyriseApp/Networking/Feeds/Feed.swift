//
//  Feed.swift
//  SkyriseApp
//
//  Created by Krygu on 13/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import Foundation

protocol Feed {
    var base: String { get }
    var path: String { get }
    func getURL() -> URL?
}
