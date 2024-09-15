//
//  ArticleView.swift
//  Newsium
//
//  Created by Vishal Paliwal on 14/09/24.
//

import SwiftUI

struct ArticleView: View {
    
    var article: Articles
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                Image("PHNews")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .redacted(reason: article == nil ? .placeholder : [])

                ZStack {
                    
                    Text(article.title ?? "")
                        .font(.title)
                        .fontWeight(.regular)
                        .foregroundStyle(.black)
                        .lineLimit(2)
                        .padding()
                        .zIndex(1.0)
                        .redacted(reason: article == nil ? .placeholder : [])

                    Rectangle()
                        .frame(height: 100)
                        .background(
                            .white
                        )
                        
                }
            }
            .frame(width: proxy.size.width, height: 425)
            .clipShape(RoundedRectangle(cornerRadius: 24))
        }
        .padding(.horizontal, 16)
    }
}

//#Preview {
//    ArticleView()
//}
