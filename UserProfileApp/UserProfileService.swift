//
//  UserProfileService.swift
//  UserProfileApp
//
//  Created by arifinfrds.engineer on 23/10/22.
//

import Foundation
import Moya

protocol UserProfileService {
    func loadUserProfile(id: Int, completion: @escaping (Result<UserProfile, Error>) -> Void)
}

class RemoteUserProfileService: UserProfileService {
    
    private let provider = MoyaProvider<UserProfileTargetType>()
    
    func loadUserProfile(id: Int, completion: @escaping (Result<UserProfile, Error>) -> Void) {
        provider.request(.fetchUserProfile(id: id)) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let userProfile = try! JSONDecoder().decode(UserProfile.self, from: data)
                completion(.success(userProfile))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
