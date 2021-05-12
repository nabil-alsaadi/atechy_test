//
//  LoginView.swift
//  Atechy_test
//
//  Created by nabil on 5/10/21.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var session: SessionStore
    @ObservedObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
        VStack(alignment:.center) {
            
            HStack {
                Image("Teamio_logo")
                    .resizable()
                    .frame(width: 150, height: 30, alignment:.center)
                    
            }
            .frame(height: DesignUtilities.getAutoHeight(viewHeight: 225), alignment: .center)
            
            
            
            Text("Sign in to your Account")
                .font(Font.custom("Hellix", size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color.titleColor)
                
            CustomFieldWithIconView(value: $loginViewModel.email, label: "Email", secure: false)
            CustomFieldWithIconView(value: $loginViewModel.password , label: "Password", secure: true)
            if (loginViewModel.error != "") {
                Text(loginViewModel.error)
                    .font(Font.custom("Hellix", size: 14))
                    .foregroundColor(Color.red)
                    .padding(.top,10)
            }
            
            VStack {
                if loginViewModel.loading {
                    ProgressView()
                }
                else {
                    CustomButtonView(title: "Sign in") {
                        loginViewModel.signIn()
                    }
                }
                
                
                HStack(spacing:0) {
                    NavigationLink(destination: SignupView()) {
                        HStack(spacing:0) {
                        Text("Don’t have a Teamio account yet? ")
                            .font(Font.custom("Hellix", size: 14))
                            .fontWeight(.regular)
                            .foregroundColor(.black)
                            Text("Sign up")
                                .font(Font.custom("Hellix", size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                    }
                    
                }
                .padding(.top,36)
            }
            .padding(.top,DesignUtilities.getAutoHeight(viewHeight: 89))
            
            
            Spacer()
            
        }
        .navigationBarHidden(true)
        
    }
    .onAppear {
        self.loginViewModel.session = session
    }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
                        .previewDisplayName("iPhone 12 Pro Max")
    }
}

