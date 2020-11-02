//
//  PersistenceProviderTests.swift
//  GitHubFollowersTests
//
//  Created by Amirreza Eghtedari on 11.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import XCTest
@testable import GitHubUsers

class PersistenceProviderTests: XCTestCase {

	var persistenceProvider: PersistenceProvider!
    
	override func setUpWithError() throws {
        
		persistenceProvider = UserDefaultsPersistenceProvider()
    }

    override func tearDownWithError() throws {
        
		persistenceProvider.deleteAll()
    }
	
	func testDeleteAll() throws {
		
		let follower1 	= Follower(login: "salam", avatarUrl: "salam.com")
		let follower2	= Follower(login: "dorood", avatarUrl: "dorood.com")
		
		persistenceProvider.add(favorite: follower1)
		persistenceProvider.add(favorite: follower2)
		
		XCTAssert(persistenceProvider.retreiveFavorites()?.count == 2)
		persistenceProvider.deleteAll()
		XCTAssert(persistenceProvider.retreiveFavorites() == nil)
	}

    func testAdd() throws {
        
		let follower = Follower(login: "salam", avatarUrl: "salam.com")
		persistenceProvider.add(favorite: follower)
		if let favorites = persistenceProvider.retreiveFavorites() {
			XCTAssert(favorites.contains(follower))
		} else {
			XCTFail()
		}
    }
	
	func testDelete() throws {
        
		let follower1 	= Follower(login: "salam", avatarUrl: "salam.com")
		let follower2	= Follower(login: "dorood", avatarUrl: "dorood.com")
		
		persistenceProvider.add(favorite: follower1)
		persistenceProvider.add(favorite: follower2)
		
		XCTAssert(persistenceProvider.retreiveFavorites()?.count == 2)
		
		persistenceProvider.delete(favorite: follower1)
		
		XCTAssert(persistenceProvider.retreiveFavorites()?.first?.login == "dorood")
    }
}
