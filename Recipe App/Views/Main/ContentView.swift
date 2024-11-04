//
//  ContentView.swift
//  Recipe App
//
//  Created by Andrei Tone on 11.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabBar()
    }
}

#Preview {
    ContentView()
        .environmentObject(RecipesViewModel())
}
