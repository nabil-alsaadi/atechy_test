//
//  LoginViewModel.swift
//  Atechy_test
//
//  Created by nabil on 5/12/21.
//


import Foundation
import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    
    var session: SessionStore?
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loading = false
    @Published var error = ""
    private var cancellableSet: Set<AnyCancellable> = []
    func signIn () {
        loading = true
        error = ""
        session?.signIn(email: email, password: password) { (result, error) in
            self.loading = false
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    // password validation
      
    private var isPasswordEmptyPublisher: AnyPublisher<Bool, Never> {
        $password
          .debounce(for: 0.8, scheduler: RunLoop.main)
          .removeDuplicates()
          .map { password in
            return password == ""
          }
          .eraseToAnyPublisher()
    }
    
    init() {
        isPasswordEmptyPublisher
          .receive(on: RunLoop.main)
          .map { empty in
            if empty {
                return "Password must not be empty"
            }
            else {
                return ""
            }
          }
          .assign(to: \.error, on: self)
          .store(in: &cancellableSet)
    }
    
}
