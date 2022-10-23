//
//  UserProfileTargetType.swift
//  UserProfileApp
//
//  Created by arifinfrds.engineer on 23/10/22.
//

import Foundation
import Moya

enum UserProfileTargetType: TargetType {
    
    case fetchUserProfile(id: Int)
    
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        switch self {
        case .fetchUserProfile(let id):
            return "/users/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchUserProfile:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchUserProfile:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .fetchUserProfile:
            return nil
        }
    }
}
