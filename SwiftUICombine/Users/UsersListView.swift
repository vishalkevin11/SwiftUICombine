//
//  UsersListView.swift
//  SwiftUICombine
//
//  Created by Kevin.Saldanha on 19/12/22.
//

import Combine
import SwiftUI

struct UsersListView: View {
    
    @StateObject var userViewModel = UserViewModel()
    var body: some View {
        List(userViewModel.users) { user in
            VStack {
                Text("\(user.name)")
                Text("\(user.email)")
            }
        }
        .onAppear {
            userViewModel.getUserData()
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}
