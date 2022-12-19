//
//  UserService.swift
//  SwiftUICombine
//
//  Created by Kevin.Saldanha on 19/12/22.
//

import Combine
import Foundation

class UserService {
    
    static let shared = UserService()
    private init() {
        
    }
    let networkService = NetworkService.shared
    
    func getUserData() -> AnyPublisher<[User], Error> {
         return networkService.fetchUsers()
            .eraseToAnyPublisher()
    }
}
