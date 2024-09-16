//
//  CategorySelectionView.swift
//  Newsium
//
//  Created by Vishal Paliwal on 16/09/24.
//

import SwiftUI

struct CategorySelectionView: View {
    
    let categories = ["General", "Business", "Entertainment", "Health", "Science", "Sports", "Technology"]
    
    @Binding var selectedCategory: String
    @ObservedObject var viewModel: HomeView.ViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(
                            .clear
                        )
                        .foregroundStyle (
                            selectedCategory == category ? Color.white : Color.gray.opacity(0.5)
                        )
                        .cornerRadius(10)
                        .onTapGesture {
                            selectedCategory = category
                            viewModel.requestArticles(for: selectedCategory.lowercased())
                        }
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 50)
    }
}
