//
//  ArticlesResponse.swift
//  Newsium
//
//  Created by Vishal Paliwal on 14/09/24.
//


import Foundation
struct ArticlesResponse : Codable {
	let status : String?
	let totalResults : Int?
	let articles : [Articles]?
}
