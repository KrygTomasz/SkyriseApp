//
//  WebService.swift
//  SkyriseApp
//
//  Created by Krygu on 13/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import Foundation

class WebService<Model: Codable> {
    
    typealias WebSericeDownloadDataCompletion = (WSResult<Model, WSError>) -> Void
    
    //MARK: Properties
    private var feed: Feed
    
    //MARK: Initializer
    init(feed: Feed) {
        self.feed = feed
    }
    
    //MARK: Data fetch methods
    func downloadData(completion: @escaping WebSericeDownloadDataCompletion) {
        guard let url = feed.getURL() else {
            completion(WSResult.failure(.wrongUrl))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                NSLog(error.localizedDescription)
                completion(WSResult.failure(.serviceError))
                return
            }
            guard let data = data else {
                completion(WSResult.failure(.invalidData))
                return
            }
            do {
                let model = try JSONDecoder().decode(Model.self, from: data)
                completion(WSResult.success(model))
                return
            } catch let jsonError {
                NSLog(jsonError.localizedDescription)
                completion(WSResult.failure(.jsonDecodingFailure))
                return
            }
            }.resume()
    }
    
}
