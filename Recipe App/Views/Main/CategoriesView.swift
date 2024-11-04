//
//  CategoriesView.swift
//  Recipe App
//
//  Created by Andrei Tone on 12.08.2024.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        NavigationView {
            List{
                ForEach(Category.allCases){ category in
                    NavigationLink{
                        CategoryView(category: category)
                    } label:{
                        Text(category.rawValue + "s")
                    }
                    
                    
                }
            }
                .navigationTitle("Categories")
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    CategoriesView()
        .environmentObject(RecipesViewModel())
}
