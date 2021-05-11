//
//  Utilities.swift
//  Atechy_test
//
//  Created by nabil on 5/11/21.
//

import Foundation
import UIKit
let DesignHeight = CGFloat(812)
class DesignUtilities {
    static func getAutoHeight(viewHeight:Int) -> CGFloat {
        let screenHeight = UIScreen.screenHeight
        let res = CGFloat(screenHeight) * (CGFloat(viewHeight) / DesignHeight)
        return res
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
