//
//  UserData.swift
//  Atechy_test
//
//  Created by nabil on 5/12/21.
//

import Foundation
import SwiftUI

struct UserData: Hashable, Codable , Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var email : String
    //var password:String
    private var imageName: String
    
    init(id:String,email:String,name:String) {
        self.id = id
        self.name = email
        self.email = email
        //self.password = password
        imageName = "Avatar"
    }
}
