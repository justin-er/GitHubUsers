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
	
	var isMoreFollowers: Bool = false
	
	private var username: String = ""
	private var pageNumber: Int = 1
	
	let session: URLSession
	let stringAnalyzer: StringAnalyzerInput
	
	init(session: URLSession, stringAnalyzer: StringAnalyzerInput) {
		self.session = session
		self.stringAnalyzer = stringAnalyzer
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
            
			guard let response = response as? HTTPURLResponse else {
				completion(Result.failure(AvatarNetworkError.unableToComplete))
				return
			}
				
			if response.statusCode != 200 {
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
	
	private func getFollowers(of username: String, pageNumber: Int, completion: Completion?) {
        
		let endPoint = "\(NetworkSettings.baseUrl)\(username)/followers?per_page=\(NetworkSettings.followersNumberPerPage)&page=\(pageNumber)"
        
        guard let url = URL(string: endPoint) else {
            completion?(Result.failure(FollowerNetworkError.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                completion?(Result.failure(FollowerNetworkError.unableToComplete))
                return
            }
			
			guard let response = response as? HTTPURLResponse else {
				completion?(Result.failure(FollowerNetworkError.unableToComplete))
				return
			}
				
			if response.statusCode != 200 {
				if response.statusCode == 404 {
					completion?(Result.failure(FollowerNetworkError.invalidUsername))
				} else {
					os_log("Network error: %d", response.statusCode)
					completion?(Result.failure(FollowerNetworkError.unableToComplete))
				}
				
				return
			}
			
			if let link = response.value(forHTTPHeaderField: "link") {
				self.isMoreFollowers = self.stringAnalyzer.lookFor(key: "rel=", value: "\"next\"", in: link)
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
	
	func getNextFollowers(completion: Completion?) {
		
		if self.isMoreFollowers {
			self.pageNumber += 1
			getFollowers(of: username, pageNumber: pageNumber, completion: completion)
		}
	}
	
	func getFollowers(of username: String, completion: Completion?) {
		
		self.username = username
		self.pageNumber = 1
		getFollowers(of: username, pageNumber: pageNumber, completion: completion)
	}
}

