//
//  Date+Extention.swift
//  Atechy_test
//
//  Created by nabil on 5/12/21.
//

import Foundation
extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
