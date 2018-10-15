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
            return "wrongUrl".localized()
        case .serviceError:
            return "serviceError".localized()
        case .invalidData:
            return "invalidData".localized()
        case .jsonDecodingFailure:
            return "jsonDecodingFailure".localized()
        }
    }
}
