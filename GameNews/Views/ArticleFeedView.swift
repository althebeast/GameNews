//
//  ArticleFeedView.swift
//  GameNews
//
//  Created by Alperen Sarışan on 7.09.2024.
//

import SwiftUI

struct ArticleFeedView: View {
    
    @State private var articles = [ArticleModel]()
    
    var body: some View {
        NavigationStack {
            List(articles) { a in
                
                Text(a.title)
                
            }
            .task {
                self.articles = await ArticleDataService().getArticles()
        }
        }
    }
}

#Preview {
    ArticleFeedView()
}
