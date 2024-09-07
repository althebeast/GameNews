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
                    Image(systemName: "newspaper")
                    Text("Feed")
                }
                .preferredColorScheme(.dark)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    HomeView()
}
