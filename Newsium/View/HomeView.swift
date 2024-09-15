//
//  ContentView.swift
//  Newsium
//
//  Created by Vishal Paliwal on 14/09/24.
//

import SwiftUI


struct HomeView: View {
    
    @State var viewModel: ViewModel

    
    var body: some View {
        
        // MARK: List of News Articles
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    let count = viewModel.articles.count > 0 ? viewModel.articles.count : 10
                    ForEach(0 ..< count) { item in
                        ArticleView(article: viewModel.articles[item])
                            .frame(height: 425)
                            .padding(.bottom)
                    }
                }
            }
            .navigationTitle("Newsium")
        }
        .onAppear {
            viewModel.requestArticles(for: "general")
        }
    }
}

#Preview {
    HomeView(viewModel: HomeView.ViewModel())
}
