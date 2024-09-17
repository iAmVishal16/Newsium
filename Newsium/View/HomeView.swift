//
//  ContentView.swift
//  Newsium
//
//  Created by Vishal Paliwal on 14/09/24.
//

import SwiftUI


struct HomeView: View {
    
    @StateObject var viewModel: ViewModel

    @State private var isShowDetails: Bool = false
    @State private var selectedCategory = "General"

    @Namespace var animation
    
    var body: some View {
        
        // MARK: List of News Articles
        if isShowDetails, let selectedArticle = viewModel.selectedArticle {
            ArticleDetailsView(animation: animation, isShowDetails: $isShowDetails, article: selectedArticle)
        } else {
            VStack {
                
                CategorySelectionView(selectedCategory: $selectedCategory, viewModel: viewModel)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(0 ..< viewModel.articles.count, id: \.self) { item in
                            ArticleView(article: viewModel.articles[item], animation: animation) { article in
                                withAnimation(.hero) {
                                    self.viewModel.selectedArticle = article
                                    self.isShowDetails = true
                                }
                            }
                            .overlay(alignment: .bottomTrailing) {
                                let article = viewModel.articles[item]

                                Button {
//                                    viewModel.articles[item].isBookMarked = true
                                } label: {
                                    Image(systemName: "bookmark.fill")
                                        .resizable()
                                        .frame(width: 20, height: 25)
                                        .foregroundStyle(
                                            /*article.isBookMarked ? .accent :*/ .white.opacity(0.5)
                                        )
                                        .padding(.bottom, 118)
                                        .padding(.trailing, 32)
                                        .zIndex(1.0)
                                }

                            }
                            .overlay(alignment: .topTrailing, content: {
                                let article = viewModel.articles[item]

                                Text(article.publishedAt.toString(format: "EEE, d MMM"))
                                    .padding(.trailing, 32)
                                    .padding(.top)
                                    .shadow(radius: 5)
                            })
                            .overlay(alignment: .bottomLeading, content: {
                                let article = viewModel.articles[item]

                                if let author = article.author {
                                    ZStack(content: {
                                        Text(author)
                                            .font(.caption)
                                            .foregroundStyle(.white)
                                            .padding()
                                            .background(.ultraThinMaterial)
                                            .clipShape(Capsule())
                                            .padding(.bottom, 108)
                                            .padding(.leading, 32)
                                    })
                                }

                            })
                            .tag(item)
                            .frame(height: 425)
                            .padding(.bottom)
                            .redacted(reason: self.viewModel.isLoading ? .placeholder : [])
                        }
                    }
                }
            }
            .onAppear {
                if self.viewModel.articles.count == 0 {
                    viewModel.requestArticles(for: selectedCategory.lowercased())
                }
            }
        }
    }
    
    
}

#Preview {
    HomeView(viewModel: HomeView.ViewModel())
}
