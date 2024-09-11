//
//  ArticleFeedView.swift
//  GameNews
//
//  Created by Alperen Sarışan on 7.09.2024.
//

import SwiftUI

struct ArticleFeedView: View {
    
    @EnvironmentObject var articleViewModel: ArticleViewModel
    
    let columns = [
            GridItem()
        ]
    
    var body: some View {
        GeometryReader { geo in
        ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns) {
                        ForEach(articleViewModel.articles) { a in
                            
                            ArticleRowView(article: a)
                                .background {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke()
                                        .frame(width: geo.size.width/1.02, height: 190)
                                }
                                .shadow(color: .white.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5)
                            
                        }
                        .padding(.vertical)
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding()
                    .task {
                        await articleViewModel.getData()
                }
                }
            }
            .refreshable {
                Task {
                    await articleViewModel.getData()
                }
            }
    }
}

#Preview {
    NavigationStack {
        ArticleFeedView()
            .preferredColorScheme(.dark)
        .environmentObject(ArticleViewModel())
    }
}
