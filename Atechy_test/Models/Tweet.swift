//
//  Tweet.swift
//  Atechy_test
//
//  Created by nabil on 5/11/21.
//

import Foundation
import SwiftUI

struct Tweet: Hashable, Codable , Identifiable {
    var id: Int
    var name: String
    var username : String
    var message : String
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
