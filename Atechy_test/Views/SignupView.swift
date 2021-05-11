//
//  SignupView.swift
//  Atechy_test
//
//  Created by nabil on 5/11/21.
//


import SwiftUI

struct SignupView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @Binding var isPresented : Bool
    var body: some View {
        GeometryReader { metrics in
        VStack(alignment:.center) {
            
            HStack {
                Image("Teamio_logo")
                    .resizable()
                    .frame(width: 150, height: 30, alignment: .center)
                    
            }
            
            .frame(height: DesignUtilities.getAutoHeight(viewHeight: 225), alignment: .center)
            
            
            
            Text("Create your Account")
                .font(Font.custom("Hellix", size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color.titleColor)
            CustomFieldView(value: $name, label: "Name", secure: false)
            CustomFieldView(value: $email, label: "Email", secure: false)
            CustomFieldView(value: $password, label: "Password", secure: true)
            CustomFieldView(value: $confirmPassword, label: "Confirm password", secure: true)
            VStack {
                CustomButtonView(title: "Sign up") {
                    
                }
                    
                HStack(spacing:0) {
                    Text("Already have account? ")
                        .font(Font.custom("Hellix", size: 14))
                        .fontWeight(.regular)
                    Button(action: {
                        // What to perform
                        self.isPresented = false
                    }) {
                        Text("Sign in")
                            .font(Font.custom("Hellix", size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                }
                .padding(.top,36)
            }
            .padding(.top,DesignUtilities.getAutoHeight(viewHeight: 57))
            
            
            
            
        }
        
        
    }
        .ignoresSafeArea()
    }
    
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        
        SignupView(isPresented: .constant(false))
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
                        .previewDisplayName("iPhone 12 Pro Max")
    }
}
