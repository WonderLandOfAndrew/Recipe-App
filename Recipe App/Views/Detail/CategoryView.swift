//
//  CategoryView.swift
//  Recipe App
//
//  Created by Andrei Tone on 15.08.2024.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    var category: Category
    
    //Computed property
    var recipe: [Recipe] {
        return recipesVM.recipes.filter{ $0.category == category.rawValue}
    }
    
    var body: some View {
         ScrollView {
            RecipeList(recipes: recipe)
        }
            .navigationTitle(category.rawValue + "s")
    }
}

#Preview {
    CategoryView(category: Category.dessert)
        .environmentObject(RecipesViewModel())
}
