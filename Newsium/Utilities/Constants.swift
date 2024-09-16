//
//  Constants.swift
//  Newsium
//
//  Created by Vishal Paliwal on 15/09/24.
//

import Foundation

struct API {
    static let domain = "https://newsapi.org"
    static let endpoint = "/v2/"
    static let key = "39009ac20a1e49f8982a2e5a81297667"
    
    private struct Routes {
        static let articlesAPI = "top-headlines"
    }
    
    static let articlesRequestURL =  domain + endpoint + Routes.articlesAPI
}

struct Constants {
    
    struct AppDefaults {

    }
}
