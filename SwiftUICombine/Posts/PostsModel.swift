//
//  PostsModel.swift
//  SwiftUICombine
//
//  Created by Kevin.Saldanha on 06/02/23.
//

import SwiftUI

struct PostsModel: Decodable, Identifiable {
    var id: Int
    var title: String
    var body: String
}
