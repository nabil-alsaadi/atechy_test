//
//  CustomField.swift
//  Atechy_test
//
//  Created by nabil on 5/10/21.
//

import SwiftUI

struct CustomFieldWithIconView: View {
    @Binding var value: String
    var label: String = ""
    var secure: Bool = false
    var body: some View {
        
        HStack(spacing: 0) {
            if secure {
                Image("lock_icon")
                    //.resizable()
                    .frame(width: 8.0, height: 10.0,alignment: .center)
                    //.clipped()
                    .padding(.leading, 30)
                SecureField(label, text: $value)
                .frame(height: 50)
                .padding(.leading, 9.0)
            }
            else {
                Image("Email_Icon")
                    //.resizable()
                    .frame(width: 11.0, height: 8.0,alignment: .center)
                    //.clipped()
                    .padding(.leading, 30)
                TextField(label, text: $value)
                .frame(height: 50)
                .padding(.leading, 9.0)
            }
            
            
            
        }
        .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.BorderGrey, lineWidth: 0.25)
                )
        .padding(.horizontal, 17)
        .padding(.top, 30)
        
    }
}

struct CustomFieldWithIconView_Previews: PreviewProvider {
    static var previews: some View {
        CustomFieldWithIconView(value: .constant(""))
    }
}
