//
//  WSError.swift
//  SkyriseApp
//
//  Created by Krygu on 13/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import Foundation

enum WSError: Error {
    case wrongUrl
    case serviceError
    case invalidData
    case jsonDecodingFailure
    
    var localizedDescription: String {
        switch self {
        case .wrongUrl:
            return "wrongUrl"
        case .serviceError:
            return "serviceError"
        case .invalidData:
            return "invalidData"
        case .jsonDecodingFailure:
            return "jsonDecodingFailure"
        }
    }
}
