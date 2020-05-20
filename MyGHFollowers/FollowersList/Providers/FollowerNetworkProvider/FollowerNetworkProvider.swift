//
//  RemoteFollowersProvider.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 05.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class FollowerNetworkProvider: FollowerNetworkProviderInput {
	
	func fetchFollowers(of username: String, pageNumber: Int, completion: Completion?) {
        
		let endPoint = "\(NetworkSettings.baseUrl)\(username)/followers?per_page=50&page=\(pageNumber)"
        
        guard let url = URL(string: endPoint) else {
            completion?(Result.failure(FollowerError.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                completion?(Result.failure(FollowerError.unableToComplete))
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
				if response.statusCode == 404 {
					completion?(Result.failure(FollowerError.invalidUsername))
				} else {
					completion?(Result.failure(FollowerError.unableToComplete))
				}
				
                return
            }
            
            guard let data = data else {
                completion?(Result.failure(FollowerError.unableToComplete))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let followers = try decoder.decode([FollowerNetowrkModel].self, from: data)
                completion?(Result.success(followers))
            } catch {
                completion?(Result.failure(FollowerError.unableToComplete))
            }
        }
        
        task.resume()
    }
}

