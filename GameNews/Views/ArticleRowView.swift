//
//  ArticleRowView.swift
//  GameNews
//
//  Created by Alperen Sarışan on 7.09.2024.
//

import SwiftUI
import CachedAsyncImage

struct ArticleRowView: View {
    
    var article: ArticleModel
    
    var newDate:DateFormatter {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.dateStyle = .medium
        dateFormatter.timeZone = .current
        
        return dateFormatter
    }
    
    var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    
                    NavigationLink(destination: ArticleDetailView(article: article)) {
                        if let url = URL(string: article.image?.squareTiny ?? "") {
                            
                            CachedAsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .frame(width: 120, height: 120)
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
                        
                        Text("\(article.title).")
                            .padding(.horizontal)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 5)
                HStack {
                    Image(systemName: "clock")
                        .foregroundStyle(.white.opacity(0.6))
                    Text(article.publishDate)
                        .foregroundStyle(.white.opacity(0.6))
                }
            }
    }
}
