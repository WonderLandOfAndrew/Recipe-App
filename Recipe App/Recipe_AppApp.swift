//
//  Recipe_AppApp.swift
//  Recipe App
//
//  Created by Andrei Tone on 11.08.2024.
//

import SwiftUI

@main
struct Recipe_AppApp: App {
    @StateObject var recipesViewModel = RecipesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipesViewModel)
        }
    }
}
