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
                                        .frame(width: 135, height: 135)
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        .overlay {
                                            LinearGradient(stops: [
                                                Gradient.Stop(color: .clear, location: 0.9),
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
                                .frame(maxWidth: 135, maxHeight: 160)
                                .background(Color.gray.opacity(0.3))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            }
                        
                        
                        Text("\(article.title).")
                            .padding(.horizontal)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        
                    }
                }
                .padding(.bottom, 5)
                HStack {
                    Image(systemName: "clock")
                        .font(.headline)
                        .foregroundStyle(.white.opacity(0.6))
                    Text(newDate.string(from: article.publishDate))
                        .font(.headline)
                        .foregroundStyle(.white.opacity(0.6))
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "g.circle")
                        Text("GameSpot")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.red.opacity(0.8))
                    }
                    
                    Spacer()
                        
                    ShareLink(item: URL(string: article.siteDetailURL)!) {
                        Image(systemName: "square.and.arrow.up")
                    }
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "heart")
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "bookmark")
                    })
                }
            }
    }
}
