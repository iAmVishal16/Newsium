//
//  HomeView-ViewModel.swift
//  Newsium
//
//  Created by Vishal Paliwal on 15/09/24.
//

import Foundation
import Combine

extension HomeView {
    
    class ViewModel: ObservableObject {
        private var networkService = NetworkService.shared
        
        @Published private(set) var articles: [Articles] = []
        @Published private(set) var isLoading = false
        
        private var bags = Set<AnyCancellable>()

        var selectedArticle: Articles?
        
        init() {
            
        }
        
        func requestArticles(for category: String, _ isLoadMore: Bool = false) {
            self.isLoading = true
            
            networkService.getArticles(for: category).sink { error in
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                
                print(error)
                    
            } receiveValue: { response in
                print(response.articles?.count ?? 0)
                
                guard let articles = response.articles else { return }
                
                DispatchQueue.main.async {
                    self.isLoading = false
                    if isLoadMore {
                        // TODO: will implement load more data here
                    } else {
                        self.articles = articles
                    }
                    
                }
            }
            .store(in: &bags)

        }
        
    }
}
