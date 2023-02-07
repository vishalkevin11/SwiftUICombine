//
//  PostsViewModel.swift
//  SwiftUICombine
//
//  Created by Kevin.Saldanha on 06/02/23.
//

import Combine
import Foundation
import SwiftUI


class PostsViewModel: ObservableObject {
    @Published var posts: [PostsModel] = []
    
    private var cancellables:[AnyCancellable] = []
    
    let postService = PostService()
    
    func fetchPosts() {
        postService.fetchPosts()
            .sink { postError in
                print("Post Error \(postError)")
            } receiveValue: { [weak self] postArray in
                print("Length \(postArray.count)")
                self?.posts = postArray
            }
            .store(in: &cancellables)
    }
}
