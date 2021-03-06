//
//  String+Extensions.swift
//  SkyriseApp
//
//  Created by Krygu on 15/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import Foundation

extension String {
    
    //MARK: Localized strings getter
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
}
