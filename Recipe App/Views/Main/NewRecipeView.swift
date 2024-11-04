//
//  NewRecipeView.swift
//  Recipe App
//
//  Created by Andrei Tone on 12.08.2024.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var showAddRecipe = false
    
    var body: some View {
        NavigationView {
            Button("Add recipe manually"){
                showAddRecipe = true
            }
            .navigationTitle("New Recipe")
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showAddRecipe, content: {
            AddRecipeView()
        })
    }
}

#Preview {
    NewRecipeView()
        .environmentObject(RecipesViewModel())
}
