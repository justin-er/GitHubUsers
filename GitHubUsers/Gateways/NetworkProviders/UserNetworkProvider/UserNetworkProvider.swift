//
//  UserInfoNetworkProvider.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation
import os

class UserNetworkProvider: UserNetworkProviderInput {
	
	let session: URLSession
	
	init(session: URLSession) {
		
		self.session = session
	}
	
	func getUser(username: String, completion: @escaping (Result<User, UserNetworkError>) -> Void) {
		
		let endPoint = "\(NetworkManager.baseUrl)\(username)"
        
        guard let url = URL(string: endPoint) else {
            completion(Result.failure(UserNetworkError.invalidUsername))
            return
        }
        
		let task = session.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                completion(Result.failure(UserNetworkError.unableToComplete))
                return
            }
			
			guard let response = response as? HTTPURLResponse else {
				completion(Result.failure(UserNetworkError.unableToComplete))
				return
			}
				
			if response.statusCode != 200 {
				if response.statusCode == 404 {
					completion(Result.failure(UserNetworkError.invalidUsername))
				} else {
					os_log("Network error: %d", response.statusCode)
					completion(Result.failure(UserNetworkError.unableToComplete))
				}
				
				return
			}
			
            guard let data = data else {
                completion(Result.failure(UserNetworkError.unableToComplete))
                return
            }
            
            do {
                let decoder = JSONDecoder()
				decoder.keyDecodingStrategy 	= .convertFromSnakeCase
				decoder.dateDecodingStrategy 	= .iso8601
				
				let user = try decoder.decode(User.self, from: data)
                completion(Result.success(user))
            } catch {
                completion(Result.failure(UserNetworkError.unableToComplete))
            }
        }
        
        task.resume()
	}
	
	func getAvatar(user: User, completion: @escaping (Result<(User, Data), UserNetworkError>) -> Void) {
		
		let endPoint = user.avatarUrl
        
        guard let url = URL(string: endPoint) else {
			completion(Result.failure(UserNetworkError.invalidAvatarUrl))
            return
        }
		
        let task = session.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                completion(Result.failure(UserNetworkError.unableToComplete))
                return
            }
            
			guard let response = response as? HTTPURLResponse else {
				completion(Result.failure(UserNetworkError.unableToComplete))
				return
			}
				
			if response.statusCode != 200 {
				if response.statusCode == 404 {
					completion(Result.failure(UserNetworkError.invalidAvatarUrl))
				} else {
					os_log("Network error: %d", response.statusCode)
					completion(Result.failure(UserNetworkError.unableToComplete))
				}
				
				return
			}
			
            guard let data = data else {
                completion(Result.failure(UserNetworkError.unableToComplete))
                return
            }
            
            completion(Result.success((user, data)))
        }
        
        task.resume()
	}
}
