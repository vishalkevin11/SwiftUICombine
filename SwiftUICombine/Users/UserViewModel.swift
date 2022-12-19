//
//  UserViewModel.swift
//  SwiftUICombine
//
//  Created by Kevin.Saldanha on 19/12/22.
//

import Combine
import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    var cancellables = [AnyCancellable]()
    //
   // var users = CurrentValueSubject<[User], Never>([])
    
    func getUserData() {
        UserService.shared.getUserData()
            .sink { _ in
                
            } receiveValue: { users in
                print("Users Count \(users.count)")
                self.users = users
            }
            .store(in: &cancellables)
    }
}
