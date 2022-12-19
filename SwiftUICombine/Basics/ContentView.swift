//
//  ContentView.swift
//  SwiftUICombine
//
//  Created by Kevin.Saldanha on 16/12/22.
//

import SwiftUI
import Combine

// print the characters typed
// Count the characterss
// IF count reaches 3 then set valid value
// show check mark / cross symbol



class LoginViewModel: ObservableObject {
    @Published var nameText: String = ""
    @Published var count: Int = 0
    @Published var isValid: Bool = false
    @Published var showButton: Bool = false
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addCountPublisher()
        addButtonSubscriber()
    }
    
    func addCountPublisher() {
        //var subscriber =
        $nameText.debounce(for: .seconds(2), scheduler: DispatchQueue.main).sink { [weak self] str in
            if let self = self {
                self.count = self.nameText.count
                if self.count >= 3 {
                   // subscriber.cancel()
                    self.isValid = true
                } else {
                    self.isValid = false
                }
            }
        }
       .store(in: &cancellables)
    }
    
    func addButtonSubscriber() {
        $isValid.combineLatest($count).sink { [weak self] (valid, count) in
            guard let self = self else { return }
            if valid && count > 10 {
                self.showButton = true
            } else {
                self.showButton = false
            }
        }
        .store(in: &cancellables)
    }
}

struct ContentView: View {
    
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            TextField("Enter name", text: $loginViewModel.nameText)
                .overlay(alignment: .trailing, content: {
                    ZStack {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .opacity((loginViewModel.count == 0) ? 0.0 : (self.loginViewModel.isValid) ? 0.0 : 1.0)
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                            .opacity((loginViewModel.count == 0) ? 0.0 : (self.loginViewModel.isValid) ? 1.0 : 0.0)
                    }
                    
                })
            Text("\(loginViewModel.count)")
            Button("Submit") {
                
            }
            .opacity(loginViewModel.showButton ? 1.0 : 0.5)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
