//
//  CustomFieldView.swift
//  Atechy_test
//
//  Created by nabil on 5/11/21.
//

import SwiftUI

struct CustomFieldView: View {
    @Binding var value: String
    var label: String = ""
    var secure: Bool = false
    var body: some View {
        
        HStack(spacing: 0) {
            if secure {
                SecureField(label, text: $value)
                .frame(height: 50)
                .padding(.leading, 30)
            }
            else {
                TextField(label, text: $value)
                .frame(height: 50)
                .padding(.leading, 30)
            }
            
            
            
        }
        .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.BorderGrey, lineWidth: 0.25)
                )
        .padding(.horizontal, 17)
        .padding(.top, 20)
        
    }
}

struct CustomFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomFieldView(value: .constant(""))
    }
}
