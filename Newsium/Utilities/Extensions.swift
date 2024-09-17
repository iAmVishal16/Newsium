//
//  Extensions.swift
//  Newsium
//
//  Created by Vishal Paliwal on 16/09/24.
//

import Foundation
import SwiftUI

extension Animation {
    static var hero: Animation {
        .interactiveSpring(response: 0.6, dampingFraction: 0.85, blendDuration: 0.25)
    }
}

extension Date {
    func toString(format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
