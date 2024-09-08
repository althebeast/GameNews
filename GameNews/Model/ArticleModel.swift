//
//  ArticleModel.swift
//  GameNews
//
//  Created by Alperen Sarışan on 7.09.2024.
//

import Foundation

struct ArticleModel: Decodable, Identifiable {
    
    let id = UUID()
    var publishDate: Date
    var authors: String
    var title: String
    var image: Images?
    var deck: String
    var body: String
    
    enum CodingKeys: String, CodingKey {
        
        case publishDate = "publish_date"
        
        case id
        case authors
        case title
        case image
        case deck
        case body
        
    }
    
}

struct Images: Decodable {
    
    var squareTiny: String
    var original: String
    
    enum CodingKeys: String, CodingKey {
        
        case squareTiny = "square_tiny"
        
        case original
        
    }
}
