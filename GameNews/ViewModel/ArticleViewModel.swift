//
//  ArticleViewModel.swift
//  GameNews
//
//  Created by Alperen Sarışan on 11.09.2024.
//

import Foundation

@MainActor class ArticleViewModel: ObservableObject {
    
    @Published var articles = [ArticleModel]()
    
    @MainActor
    func getData() async {
        self.articles = await ArticleDataService().getArticles()
    }
    
}
