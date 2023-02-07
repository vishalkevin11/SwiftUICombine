//
//  PostService.swift
//  SwiftUICombine
//
//  Created by Kevin.Saldanha on 06/02/23.
//

import Combine
import Foundation


enum PostsError: Error {
    //    typealias RawValue = Error
    
    case responseError
    case serverError
    
    func errorDescription(error: Error) -> String{
        switch self {
        case .responseError:
            return "Response is bad"
        case .serverError:
            return "Server not available"
        }
    }
}

class PostService {
    
    func fetchPosts() -> AnyPublisher<[PostsModel], PostsError> {
        return URLSession.shared.dataTaskPublisher(for: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
            .map({$0.data})
            .decode(type: [PostsModel].self, decoder: JSONDecoder())
            .mapError { error in
                return error as! PostsError
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
}
