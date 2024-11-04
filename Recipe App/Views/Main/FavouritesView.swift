//
//  FavouritesView.swift
//  Recipe App
//
//  Created by Andrei Tone on 12.08.2024.
//

import SwiftUI

struct FavouritesView: View {
    var body: some View {
        NavigationView {
            Text("You haven't any recipe to your favourites yet.")
                .padding()
                .navigationTitle("Favourites")
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    FavouritesView()
        .environmentObject(RecipesViewModel())
}
