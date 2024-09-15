//
//  NetworkServiceProtocol.swift
//  MassPhotos
//
//  Created by Vishal Paliwal on 18/01/24.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func getArticles(for category: String) -> Future<ArticlesResponse, Error>
}
