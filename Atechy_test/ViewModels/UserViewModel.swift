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
    @Published var error = ""
    //@Published var user:UserData
    private var cancellableSet: Set<AnyCancellable> = []
//    init(sessionStore:SessionStore) {
//        self.session = sessionStore
//    }
    func signUp () {
        loading = true
        error = ""
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
    // password validation 
    enum PasswordCheck {
        case valid
        case empty
        case noMatch
        case notStrongEnough
    }
    private var arePasswordsEqualPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($password, $confirmPassword)
          .debounce(for: 0.2, scheduler: RunLoop.main)
          .map { password, passwordAgain in
            return password == passwordAgain
          }
          .eraseToAnyPublisher()
    }
      
    private var isPasswordEmptyPublisher: AnyPublisher<Bool, Never> {
        $password
          .debounce(for: 0.8, scheduler: RunLoop.main)
          .removeDuplicates()
          .map { password in
            return password == ""
          }
          .eraseToAnyPublisher()
    }
    private var isPasswordValidPublisher: AnyPublisher<PasswordCheck, Never> {
        Publishers.CombineLatest(isPasswordEmptyPublisher, arePasswordsEqualPublisher)
          .map { passwordIsEmpty, passwordsAreEqual in
            if (passwordIsEmpty) {
              return .empty
            }
            else if (!passwordsAreEqual) {
              return .noMatch
            }
            else {
              return .valid
            }
          }
          .eraseToAnyPublisher()
      }
    init() {
        isPasswordValidPublisher
          .receive(on: RunLoop.main)
          .map { passwordCheck in
            switch passwordCheck {
            case .empty:
              return "Password must not be empty"
            case .noMatch:
              return "Passwords don't match"
            default:
              return ""
            }
          }
          .assign(to: \.error, on: self)
          .store(in: &cancellableSet)
    }
    
}
