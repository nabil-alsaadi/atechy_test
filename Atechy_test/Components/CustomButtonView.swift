//
//  CustomButton.swift
//  Atechy_test
//
//  Created by nabil on 5/11/21.
//

import SwiftUI

struct CustomButtonView: View {
    var title: String = ""
    var action: () -> Void = {}
    var body: some View {
        Button(action: action) {
            HStack{
                Text(title)
                    .foregroundColor(.white)
                    .font(Font.custom("Hellix", size: 14))
                    .fontWeight(.semibold)
            }
            .frame(width: 156, height: 47, alignment: .center)
            //.background(Color.gradient1)
            .background(
                LinearGradient(gradient: Gradient(colors: [.gradient1 , .gradient2]), startPoint: .leading , endPoint: .topTrailing)
                
                )
            .cornerRadius(23.5)
        }
        
        
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView()
    }
}
