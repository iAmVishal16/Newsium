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
