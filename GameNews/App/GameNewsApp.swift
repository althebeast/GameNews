//
//  GameNewsApp.swift
//  GameNews
//
//  Created by Alperen Sarışan on 7.09.2024.
//

import SwiftUI

@main
struct GameNewsApp: App {
    
    @StateObject var articleViewModel: ArticleViewModel = ArticleViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
            .environmentObject(articleViewModel)
        }
    }
}
