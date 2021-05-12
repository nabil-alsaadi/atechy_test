//
//  SignupView.swift
//  Atechy_test
//
//  Created by nabil on 5/11/21.
//


import SwiftUI

struct SignupView: View {

    @EnvironmentObject var session: SessionStore
    @ObservedObject var userViewModel = UserViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        //GeometryReader { metrics in
        ScrollView {
            VStack(alignment:.center) {
                
                HStack {
                    Image("Teamio_logo")
                        .resizable()
                        .frame(width: 150, height: 30, alignment: .center)
                        
                }
                
                .frame(height: DesignUtilities.getAutoHeight(viewHeight: 200), alignment: .center)
                
                
                
                Text("Create your Account")
                    .font(Font.custom("Hellix", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color.titleColor)
                CustomFieldView(value: $userViewModel.name, label: "Name", secure: false)
                CustomFieldView(value: $userViewModel.email, label: "Email", secure: false)
                CustomFieldView(value: $userViewModel.password, label: "Password", secure: true)
                CustomFieldView(value: $userViewModel.confirmPassword, label: "Confirm password", secure: true)
                if (userViewModel.error != "") {
                    Text(verbatim: userViewModel.error)
                        .font(Font.custom("Hellix", size: 14))
                        .foregroundColor(Color.red)
                        .padding(.top,10)
                }
                VStack {
                    if userViewModel.loading {
                        ProgressView()
                    }
                    else {
                        CustomButtonView(title: "Sign up") {
                            userViewModel.signUp()
                        }
                    }
                        
                    HStack(spacing:0) {
                        Text("Already have account? ")
                            .font(Font.custom("Hellix", size: 14))
                            .fontWeight(.regular)
                        Button(action: {
                            // What to perform
                            //self.isPresented = false
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Sign in")
                                .font(Font.custom("Hellix", size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.vertical,36)
                }
                .padding(.top,DesignUtilities.getAutoHeight(viewHeight: 57))
                
                
                
                
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .onAppear {
            self.userViewModel.session = session
        }
    }
    
    
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {

        SignupView()
        .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
                        .previewDisplayName("iPhone 12 Pro Max")
    }
}
