//
//  ArticleView.swift
//  Newsium
//
//  Created by Vishal Paliwal on 14/09/24.
//

import SwiftUI

struct ArticleView: View {
    
    var article: Articles?
    let animation: Namespace.ID
    var onTap: (_ article: Articles) -> Void

    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                
                if let article = article, let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
                    AsyncImage(url: url, content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: urlToImage, in: animation, anchor: .top)
                    }, placeholder: {
                        ZStack {
                            Image(systemName: "text.below.photo.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .foregroundStyle(.thinMaterial)
                        }
                    })
                }
                
                ZStack {
                    
                    Text(article?.title ?? "")
                        .font(.title)
                        .fontWeight(.regular)
                        .foregroundStyle(.black)
                        .lineLimit(2)
                        .padding()
                        .zIndex(1.0)
                        .matchedGeometryEffect(id: article?.title ?? "", in: animation, anchor: .top)

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
        .onTapGesture {
            if let article = article {
                self.onTap(article)
            }
        }
    }
}

//#Preview {
//    ArticleView()
//}
