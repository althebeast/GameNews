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
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(articles) { a in
                        
                            ArticleRowView(article: a)
                            
                            Divider()
                                .overlay(.white.opacity(0.7))
                        
                    }
                    .padding(.vertical, 5)
                    .buttonStyle(PlainButtonStyle())
                }
                .padding()
                .task {
                    self.articles = await ArticleDataService().getArticles()
                }
            }
            .refreshable {
                Task {
                    self.articles = await ArticleDataService().getArticles()
                }
            }
    }
}

#Preview {
    ArticleFeedView()
        .preferredColorScheme(.dark)
}
