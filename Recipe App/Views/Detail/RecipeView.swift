//
//  RecipeView.swift
//  Recipe App
//
//  Created by Andrei Tone on 15.08.2024.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill) // Ensures the image fills the frame and is cropped if needed
                    .frame(height: 250) // Set the desired height for the image
                    .clipped() // Ensures any overflow is clipped, cropping the image
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
            }
            
            //.frame(maxWidth: UIScreen.main.bounds.width)
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 400)
            .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
            
            VStack(spacing: 30){
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    
                VStack(alignment: .leading, spacing: 30){
                    if !recipe.description.isEmpty{
                        Text(recipe.description)
                    }
                    
                    if !recipe.ingredients.isEmpty{
                        VStack(alignment: .leading, spacing: 20){
                            Text("Ingredients")
                                .font(.headline)
                            
                            Text(recipe.ingredients)
                        }
                    }
                    
                    if !recipe.directions.isEmpty{
                        VStack(alignment: .leading, spacing: 20){
                            Text("Directions")
                                .font(.headline)
                            
                            Text(recipe.directions)
                        }
                }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(.container, edges: .top)
        
    }
}


#Preview {
    RecipeView(recipe: Recipe.all[0])
}
