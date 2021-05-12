//
//  LoginSignupViewModel.swift
//  Atechy_test
//
//  Created by nabil on 5/12/21.
//

import Foundation
import SwiftUI
import Combine

class UserViewModel: ObservableObject {
    
    var session: SessionStore?
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var name: String = ""
    @Published var confirmPassword: String = ""
    @Published var loading = false
    @Published var hasError = false
    @Published var error = ""
    private var cancellableSet: Set<AnyCancellable> = []
    func signUp () {
        validate()
        if !hasError {
            loading = true
            session?.signUp(email: email, password: password) { (result, error) in
                self.loading = false
                if let error = error {
                    self.error = error.localizedDescription
                } else {
                    self.email = ""
                    self.password = ""
                }
            }
        }
        
    }
    func validate() {
        if email.isEmpty {
            hasError = true
            error = "email must not be empty"
        }
        else if password.isEmpty {
            hasError = true
            error = "password must not be empty"
        }
        else if password != confirmPassword {
            hasError = true
            error = "password don't match"
        }
        else {
            hasError = false
            error = ""
        }
         
    }

    
}
