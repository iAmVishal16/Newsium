//
//  Constants.swift
//  Newsium
//
//  Created by Vishal Paliwal on 15/09/24.
//

import Foundation

struct API {
    static let endpoint = "https://saurav.tech/NewsAPI"
    static let key = ""
    
    private struct Routes {
        static let articlesAPI = "/top-headlines/category/general/in.json"
    }
    
    static let articlesRequestURL = endpoint + Routes.articlesAPI
}

struct Constants {
    
    struct AppDefaults {

    }
}
