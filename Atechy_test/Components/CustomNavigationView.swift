//
//  CustomNavigationView.swift
//  Atechy_test
//
//  Created by nabil on 5/12/21.
//

import SwiftUI

struct CustomNavigationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack(spacing:0) {
            ZStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("Back")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 20, alignment: .center)
                            
                            //.background(Color.red)
                    }
                    .frame(width: 40,height: 40)
                    .padding(.leading,20)
                    Spacer()
                }
                
                
                HStack {
                    Image("Teamio_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 25, alignment: .center)
                }
                
                    
                
            }
            .frame(height: 60)
            Divider()
            
           
        }
        
        
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView()
    }
}
