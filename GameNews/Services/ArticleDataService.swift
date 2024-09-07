//
//  ArticleDataService.swift
//  GameNews
//
//  Created by Alperen Sarışan on 7.09.2024.
//

import Foundation

struct ArticleDataService {
    
    private var apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    private var format = "format=json"
    private var sort = "sort=publish_date:desc"
    private var limit = "limit=10"
    
    func getArticles() async -> [ArticleModel] {
        
        guard apiKey != nil else {
            return [ArticleModel]()
        }
        
        let urlString = "https://www.gamespot.com/api/articles/?\(format)&\(sort)&\(limit)&&api_key=\(apiKey!)"
        let url = URL(string: urlString)
        
        if let url {
            
            let request = URLRequest(url: url)
            let session = URLSession.shared
            
            do {
                
                let (data, response) = try await session.data(for: request)
                
                let decoder = JSONDecoder()
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                decoder.dateDecodingStrategy = .formatted(formatter)
                let articles = try decoder.decode(ArticleResults.self, from: data)
                
                print(response)
                return articles.results
                
            } catch {
                print(error)
            }
        }
        
        return [ArticleModel]()
    }
    
}
