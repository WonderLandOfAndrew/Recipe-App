//
//  AddRecipeView.swift
//  Recipe App
//
//  Created by Andrei Tone on 16.08.2024.
//

import SwiftUI

struct AddRecipeView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    @State private var name: String = ""
    @State private var selectedCategory: Category = Category.main
    @State private var description: String = ""
    @State private var ingredients: String = ""
    @State private var directions: String = ""
    @State private var navigateToRecipe = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Recipe Name", text: $name)
                }
                
                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases){category in
                            Text(category.rawValue)
                                .tag(category)
                            
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                }
                
                Section(header: Text("ingridients")) {
                    TextEditor(text: $ingredients)
                }
                
                Section(header: Text("Directions")) {
                    TextEditor(text: $directions)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {dismiss()}, label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    })
                }
                
                ToolbarItem {
                    
                    NavigationLink(isActive: $navigateToRecipe) {
                        RecipeView(recipe: recipesVM.recipes.sorted{ $0.datePublished > $1.datePublished}[0])
                            .navigationBarBackButtonHidden(true)
                        
                    } label: {
                        Button(action: {
                            saveRecipe()
                            navigateToRecipe = true}, label: {
                            Label("Done", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                        })
                        
                    }
                    .disabled(name.isEmpty)
                }
            })
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    AddRecipeView()
            .environmentObject(RecipesViewModel())
}

extension AddRecipeView {
    private func saveRecipe() {
        let now = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let datePublished = dateFormatter.string(from: now)
        print(datePublished)
        let recipe = Recipe(name: name, image: "", description: description, ingredients: ingredients, directions: directions, category: selectedCategory.rawValue, datePublished: datePublished, url: "")
        
        recipesVM.addRecipe(recipe: recipe)
    }
}
