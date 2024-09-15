//
//  VPButtonView.swift
//  Newsium
//
//  Created by Vishal Paliwal on 15/09/24.
//

import SwiftUI

struct VPButtonView: View {
    
    var title: String
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Capsule()
                    .frame(width: proxy.size.width, height: 48)
                    .foregroundStyle(.accent)
                
                Text(title)
                    .foregroundStyle(.white)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    VPButtonView(title: "Getting Started")
}
