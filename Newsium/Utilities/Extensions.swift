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
