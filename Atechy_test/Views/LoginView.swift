//
//  LoginView.swift
//  Atechy_test
//
//  Created by nabil on 5/10/21.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var SignupPresented :Bool = false
    @State var logged: Bool = false
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
                
            CustomFieldWithIconView(value: $email, label: "Email", secure: false)
            CustomFieldWithIconView(value: $password, label: "Password", secure: true)
            
            VStack {
                NavigationLink(
                    destination: HomeView(),
                    isActive: $logged,
                    label: {
                        CustomButtonView(title: "Sign in") {
                            self.logged = true
                        }
                    })
                
                    
                HStack(spacing:0) {
                    Text("Don’t have a Teamio account yet? ")
                        .font(Font.custom("Hellix", size: 14))
                        .fontWeight(.regular)
                    
                    Button(action: {
                        // What to perform
                        self.SignupPresented.toggle()
                    }) {
                        Text("Sign up")
                            .font(Font.custom("Hellix", size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                    .fullScreenCover(isPresented: $SignupPresented, content: {
                        SignupView(isPresented: $SignupPresented)
                    })
                }
                .padding(.top,36)
            }
            .padding(.top,DesignUtilities.getAutoHeight(viewHeight: 89))
            
            
            Spacer()
            
        }
        .navigationBarHidden(true)
        
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

