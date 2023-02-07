//
//  PostsVIew.swift
//  SwiftUICombine
//
//  Created by Kevin.Saldanha on 06/02/23.
//

import SwiftUI

struct PostsView: View {
    @StateObject private var postViewModel = PostsViewModel()
    var body: some View {
        List(postViewModel.posts) { post in
            Text("\(post.title)")
        }
        .onAppear {
            postViewModel.fetchPosts()
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
