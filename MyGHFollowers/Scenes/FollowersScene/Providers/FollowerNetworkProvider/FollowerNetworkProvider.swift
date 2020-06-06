//
//  RemoteFollowersProvider.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 05.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation
import os

class FollowerNetworkProvider: FollowerNetworkProviderInput {
	
	let session: URLSession
	
	init(session: URLSession) {
		self.session = session
	}
	
	func getAvatar(for follower: Follower, completion: @escaping (Result<Follower, AvatarNetworkError>) -> Void) {

		let endPoint = follower.avatarUrl
        
        guard let url = URL(string: endPoint) else {
			completion(Result.failure(AvatarNetworkError.invalidAvatarUrl))
            return
        }
		
        let task = session.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                completion(Result.failure(AvatarNetworkError.unableToComplete))
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
				if response.statusCode == 404 {
					completion(Result.failure(AvatarNetworkError.invalidAvatarUrl))
				} else {
					os_log("Network error: %d", response.statusCode)
					completion(Result.failure(AvatarNetworkError.unableToComplete))
				}
				
                return
            }
            
            guard let data = data else {
                completion(Result.failure(AvatarNetworkError.unableToComplete))
                return
            }
            
			follower.avatar = Avatar.data(data)
            completion(Result.success(follower))
        }
        
        task.resume()
	}
	
	
	func getFollowers(of username: String, pageNumber: Int, completion: Completion?) {
        
		let endPoint = "\(NetworkSettings.baseUrl)\(username)/followers?per_page=100&page=\(pageNumber)"
        
        guard let url = URL(string: endPoint) else {
            completion?(Result.failure(FollowerNetworkError.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                completion?(Result.failure(FollowerNetworkError.unableToComplete))
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
				if response.statusCode == 404 {
					completion?(Result.failure(FollowerNetworkError.invalidUsername))
				} else {
					os_log("Network error: %d", response.statusCode)
					completion?(Result.failure(FollowerNetworkError.unableToComplete))
				}
				
                return
            }
            
            guard let data = data else {
                completion?(Result.failure(FollowerNetworkError.unableToComplete))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let followers = try decoder.decode([FollowerNetowrkModel].self, from: data)
                completion?(Result.success(followers))
            } catch {
                completion?(Result.failure(FollowerNetworkError.unableToComplete))
            }
        }
        
        task.resume()
    }
}

