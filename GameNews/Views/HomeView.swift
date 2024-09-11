//
//  HomeView.swift
//  GameNews
//
//  Created by Alperen Sarışan on 7.09.2024.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
            TabView {
                ArticleFeedView()
                    .tabItem {
                        Label("Feed", systemImage: "newspaper")
                    }
            }
            .ignoresSafeArea()
            .preferredColorScheme(.dark)
            .navigationTitle("Feed")
    }
}

#Preview {
    NavigationStack {
        HomeView()
            .environmentObject(ArticleViewModel())
    }
}
