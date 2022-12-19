//
//  UserService.swift
//  SwiftUICombine
//
//  Created by Kevin.Saldanha on 19/12/22.
//

import Combine
import Foundation


enum NetworkServiceError: Error {
    case noData
    case basFormat
}



class NetworkService {
    
    static let shared = NetworkService()
    private init() {}
    
    
    func fetchUsers<T:Decodable>() -> AnyPublisher<[T], Error> {
        return URLSession.shared.dataTaskPublisher(for: URL(string: "https://jsonplaceholder.typicode.com/users/")!)
            .tryMap{ (data: Data, response: URLResponse) -> [T] in
//                if response.statusCode != 200 {
//                    throw UserServiceError.noData
//                    return
//                }
                let allUsers = try JSONDecoder().decode([T].self, from: data)
                print("allUsers \(allUsers.count)")
                return allUsers
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
}
