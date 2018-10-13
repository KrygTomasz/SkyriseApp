//
//  WSResult.swift
//  SkyriseApp
//
//  Created by Krygu on 13/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import Foundation

enum WSResult<T, E> where E: Error {
    case success(T)
    case failure(E)
}
