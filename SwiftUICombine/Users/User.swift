//
//  User.swift
//  SwiftUICombine
//
//  Created by Kevin.Saldanha on 19/12/22.
//

import Foundation

struct User: Decodable, Identifiable {
    var id: Int
    var name: String
    var email: String
}
