//
//  NetworkMangerTests.swift
//  MyGHFollowersTests
//
//  Created by Amirreza Eghtedari on 27.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import XCTest
@testable import MyGHFollowers

class RemoteFollowersProviderTest: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchFollowers() throws {
        let loadingFollowersExpectation = expectation(description: "Waiting for fetching followers")
        
		let provider = FollowerNetwrokProvider()
		provider.fetchFollowers(of: "octocat", pageNumber: 1) { result in
            switch result {
            case let .failure(error):
                print(error)
                XCTFail()
            case let .success(followers):
                print("Followers count:", followers.count)
                for follower in followers {
                    print(follower.login)
                }
            }
            loadingFollowersExpectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
