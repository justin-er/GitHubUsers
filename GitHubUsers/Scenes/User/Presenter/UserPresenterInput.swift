//
//  UserInfoPresenterInput.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol UserPresenterInput {
    var delegate: UserPresenterDelegate? { get set }
    
    func getUser(username: String)
    func getAvatar(user: UserViewModel)
    func addUserToFavorites(user: UserViewModel)
}
