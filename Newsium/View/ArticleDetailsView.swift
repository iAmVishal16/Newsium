//
//  ArticleDetailsView.swift
//  Newsium
//
//  Created by Vishal Paliwal on 15/09/24.
//

import SwiftUI

struct ArticleDetailsView: View {
    
    let animation: Namespace.ID

    @Binding var isShowDetails: Bool
    
    var article: Articles

    var body: some View {
        GeometryReader { proxy in
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    
                    if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
                        AsyncImage(url: url, content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: proxy.size.width, height: 425)
//                                .matchedGeometryEffect(id: "image", in: animation, anchor: .top)
                        }, placeholder: {
                            Image(systemName: "photo")
                        })
                    }
                    
                    Text(article.title ?? "")
                        .font(.title).bold()
                        .padding(.horizontal, 24)
                        .padding(.top, 16)
                        .lineSpacing(5)
//                        .matchedGeometryEffect(id: "title", in: animation, anchor: .top)


                    Text(article.content ?? "")
                        .font(.body)
                        .padding(.horizontal, 24)
                        .padding(.top)
                        .lineSpacing(10.0)
//                        .matchedGeometryEffect(id: "description", in: animation, anchor: .top)

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
                .onTapGesture {
                    self.isShowDetails = false
                }
        }
    }
}

//#Preview {
//    ArticleDetailsView()
//}
