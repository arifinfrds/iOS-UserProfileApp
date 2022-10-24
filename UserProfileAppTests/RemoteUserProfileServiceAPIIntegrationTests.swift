//
//  RemoteUserProfileServiceAPIIntegrationTests.swift
//  UserProfileAppTests
//
//  Created by arifinfrds.engineer on 17/10/22.
//

import XCTest
@testable import UserProfileApp

final class RemoteUserProfileServiceAPIIntegrationTests: XCTestCase {

    func test_loadUserProfile_shouldGotUserProfile() {
        let sut = RemoteUserProfileService()
        var receivedUserProfile: UserProfile?
        
        let exp = expectation(description: "Wait for loadUserProfile completion")
        sut.loadUserProfile(id: 1) { result in
            switch result {
            case .success(let userProfile):
                receivedUserProfile = userProfile
                exp.fulfill()
            case .failure(let error):
                XCTFail("Expect to success, got failure with error: \(error)")
            }
        }
        wait(for: [exp], timeout: 4.0)
        
        XCTAssertNotNil(receivedUserProfile)
    }
}
