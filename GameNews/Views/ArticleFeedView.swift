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
                
                ArticleRowView(article: a)
                
                Divider()
                    .overlay(.white.opacity(0.7))
                
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
            .task {
                self.articles = await ArticleDataService().getArticles()
        }
            .refreshable {
                Task {
                    self.articles = await ArticleDataService().getArticles()
                }
            }
            .navigationTitle("Feed")
        }
    }
}

#Preview {
    ArticleFeedView()
        .preferredColorScheme(.dark)
}
