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
    
    var newDate:DateFormatter {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.dateStyle = .medium
        dateFormatter.timeZone = .current
        
        return dateFormatter
    }
    
    var body: some View {
        
            VStack {
                
                if let url = URL(string: article.image?.original ?? "") {
                    
                    CachedAsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay {
                                LinearGradient(stops: [
                                    Gradient.Stop(color: .clear, location: 0.8),
                                    Gradient.Stop(color: .black, location: 1)
                                ],
                                               startPoint: .top,
                                               endPoint: .bottom)
                            }
                    } placeholder: {
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    }
                    .frame(maxHeight: 215)
                    .background(Color.gray.opacity(0.3))
                    .clipped()
                }
                
                
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
                    
                    Text(newDate.string(from: article.publishDate))
                        .font(.headline)
                        .padding(.bottom, 10)
                        .foregroundStyle(.white.opacity(0.6))
                }
                
                    Text(article.body.withoutHtmlTags())
                        .lineSpacing(10)
                        .padding(.bottom, 15)
                
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

extension String {
    func withoutHtmlTags() -> String {
        let str = self.replacingOccurrences(of: "<style>[^>]+</style>", with: "", options: .regularExpression, range: nil)
        return str.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
