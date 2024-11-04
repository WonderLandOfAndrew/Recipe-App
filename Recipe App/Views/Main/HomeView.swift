//
//  HomeView.swift
//  Recipe App
//
//  Created by Andrei Tone on 12.08.2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                RecipeList(recipes: recipesVM.recipes)
            }
            .navigationTitle("My Recipes")
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    HomeView()
        .environmentObject(RecipesViewModel())
}
