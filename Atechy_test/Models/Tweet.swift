//
//  Tweet.swift
//  Atechy_test
//
//  Created by nabil on 5/11/21.
//

import Foundation
import SwiftUI

struct Tweet: Hashable, Codable , Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var username : String
    var message : String
    private var imageName: String
    private var created_at : Double
    var image: Image {
        Image(imageName)
    }
    var date : Date {
        Date(timeIntervalSince1970: created_at)
    }
    
    init(message:String) {
        self.name = "test"
        self.username = "@test"
        self.message = message
        imageName = "Avatar"
        created_at = Date().timeIntervalSince1970
    }
}
