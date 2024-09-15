//
//  NewsiumApp.swift
//  Newsium
//
//  Created by Vishal Paliwal on 14/09/24.
//

import SwiftUI

@main
struct NewsiumApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeView.ViewModel())
                .preferredColorScheme(.dark)
        }
    }
}
