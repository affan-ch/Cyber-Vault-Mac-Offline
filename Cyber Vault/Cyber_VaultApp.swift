//
//  Cyber_VaultApp.swift
//  Cyber Vault
//
//  Created by Affan Ali on 04/06/2025.
//

import SwiftUI

@main
struct Cyber_VaultApp: App {
    @StateObject private var authManager = AuthenticationManager()
    
    var body: some Scene {
        WindowGroup {
            if authManager.isUnlocked {
                ContentView()
            } else {
                UnlockView(authManager: authManager)
                    .background(.ultraThinMaterial)

            }
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        .windowResizability(.contentSize) // Optional: locks to content
    }
}
