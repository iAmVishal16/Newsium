//
//  HomeView-ViewModel.swift
//  Newsium
//
//  Created by Vishal Paliwal on 15/09/24.
//

import Foundation
import Combine

extension HomeView {
    @Observable
    class ViewModel {
        private var networkService = NetworkService.shared
        
        private(set) var articles: [Articles] = []
        private(set) var isLoading = false
        private var bags = Set<AnyCancellable>()

        init() {
            
        }
        
        func requestArticles(for category: String, _ isLoadMore: Bool = false) {
            self.isLoading = true
            
            networkService.getArticles(for: category).sink { error in
                self.isLoading = false
                print(error)
            } receiveValue: { response in
                print(response.articles?.count ?? 0)
                
                self.isLoading = false
                guard let articles = response.articles else { return }
                
                DispatchQueue.main.async {
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
