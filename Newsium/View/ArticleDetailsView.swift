//
//  ArticleDetailsView.swift
//  Newsium
//
//  Created by Vishal Paliwal on 15/09/24.
//

import SwiftUI

struct ArticleDetailsView: View {
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    Image("PHNews")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: proxy.size.width, height: 425)
                    
                    Text("Smart speaker wars: As Amazon moves up, Sonos moves out")
                        .font(.title).bold()
                        .padding(.horizontal, 8)
                        .padding(.top, 16)
                        .lineSpacing(5)

                    Text("Voice agents like Alexa have already caused Sonos to rethink its product line. Now, it's looking beyond the home as Amazon starts to go for its throat with the Echo Studio. Holding the Tokyo Olympics any time before a vaccine is found will be “very unrealistic,” according to a leading global health expert. Professor Devi Sridhar said that the development of the vaccine will be key to when the Olympics can be held.\r\nSridhar,")
                        .font(.body)
                        .padding(.horizontal, 24)
                        .padding(.top)
                        .lineSpacing(10.0)
                    
                    VPButtonView(title: "Read More")
                        .frame(width: 300)
                        .padding(.top, 48)

    //                Spacer()
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .overlay(alignment: .topTrailing) {
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .frame(width: 24, height: 24)
                .padding(.trailing, 24)
                .foregroundStyle(.regularMaterial.opacity(0.8))
        }
    }
}

#Preview {
    ArticleDetailsView()
}
