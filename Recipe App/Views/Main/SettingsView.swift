//
//  SettingsView.swift
//  Recipe App
//
//  Created by Andrei Tone on 12.08.2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Text("v1.0.0")
                .navigationTitle("Settings")
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    SettingsView()
        .environmentObject(RecipesViewModel())
}
