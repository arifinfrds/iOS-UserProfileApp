//
//  UserProfile.swift
//  UserProfileApp
//
//  Created by arifinfrds.engineer on 23/10/22.
//

import Foundation

struct UserProfile: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String
}
