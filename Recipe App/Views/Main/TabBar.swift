//
//  TabBar.swift
//  Recipe App
//
//  Created by Andrei Tone on 14.08.2024.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            CategoriesView()
                .tabItem {
                    Label("Categories", systemImage: "square.fill.text.grid.1x2")
                }
            
            AddRecipeView()
                .tabItem {
                    Label("New", systemImage: "plus")
                }
            
            FavouritesView()
                .tabItem {
                    Label("Fvourites", systemImage: "heart")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    TabBar()
        .environmentObject(RecipesViewModel())
}
