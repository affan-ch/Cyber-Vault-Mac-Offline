//
//  UnlockView.swift
//  Cyber Vault
//
//  Created by Affan Ali on 05/06/2025.
//

import SwiftUI

struct UnlockView: View {
    @ObservedObject var authManager: AuthenticationManager
    @State private var manualPassword: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lock.shield.fill")
                .resizable()
                .frame(width: 90, height: 80)
                .foregroundColor(.blue)

            Text("Passwords Is Locked")
                .font(.title2)
                .bold()

            Text("Use Touch ID or your master password")

            Button("Unlock with Touch ID or Password") {
                authManager.authenticateWithBiometrics()
            }
            .keyboardShortcut(.defaultAction)
            .padding(.top, 10)

            Divider()
                .frame(width: 200)

            SecureField("Enter master password", text: $manualPassword)
                .textFieldStyle(.roundedBorder)
                .frame(width: 200)

            Button("Unlock with Password") {
                authManager.authenticateWithPassword(manualPassword)
            }

            if authManager.authFailed {
                Text("Authentication Failed")
                    .foregroundColor(.red)
                    .font(.caption)
            }
        }
        .padding()
        .frame(minWidth: 400, minHeight: 400)
        .onAppear {
            // Optionally auto-trigger biometric on launch:
            // authManager.authenticateWithBiometrics()
        }
    }
}
