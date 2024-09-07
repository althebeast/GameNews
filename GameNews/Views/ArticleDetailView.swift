//
//  ArticleDetailView.swift
//  GameNews
//
//  Created by Alperen Sarışan on 8.09.2024.
//

import SwiftUI
import CachedAsyncImage

struct ArticleDetailView: View {
    
    var article: ArticleModel
    
    var body: some View {
        
            VStack {
                
                if let url = URL(string: article.image?.original ?? "") {
                    
                    CachedAsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    } placeholder: {
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    }
                }
                
                Spacer()
                ScrollView(showsIndicators: false) {
                
                Text(article.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 10)
                
                
                HStack {
                    Text(article.authors)
                        .font(.headline)
                        .padding(.bottom, 10)
                        .foregroundStyle(.white.opacity(0.6))
                    
                    Spacer()
                    
                    Text(article.publishDate)
                        .font(.headline)
                        .padding(.bottom, 10)
                        .foregroundStyle(.white.opacity(0.6))
                }
                
                Text(article.body)
                        .lineSpacing(10)
                
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}
