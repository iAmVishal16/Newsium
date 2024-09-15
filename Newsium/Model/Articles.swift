//
//  Articles.swift
//  Newsium
//
//  Created by Vishal Paliwal on 14/09/24.
//

import Foundation
struct Articles : Codable {
	let source : Source?
	let author : String?
	let title : String?
	let description : String?
	let url : String?
	let urlToImage : String?
	let publishedAt : String?
	let content : String?
}
