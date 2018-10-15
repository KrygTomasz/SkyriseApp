//
//  ImageDownloader.swift
//  SkyriseApp
//
//  Created by Krygu on 15/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import UIKit

class ImageDownloader {
    
    private static func getDataFromUrl(url: URL?, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        guard let url = url else {
            print("Getting data from url failed. Wrong format for URL address.")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
        }.resume()
    }
    
    static func downloadImage(from urlAddress: String?, completion: @escaping (UIImage?) -> Void) {
        guard
            let address = urlAddress,
            let url = URL(string: address)
            else { return }
        getDataFromUrl(url: url) { data, response, error in
            guard
                let data = data,
                error == nil
                else {
                    completion(nil)
                    return
            }
            completion(UIImage(data: data))
        }
    }
    
}
