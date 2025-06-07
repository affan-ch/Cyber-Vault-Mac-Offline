//
//  AuthenticationManager.swift
//  Cyber Vault
//
//  Created by Affan Ali on 05/06/2025.
//

import Foundation
import LocalAuthentication

class AuthenticationManager: ObservableObject {
    @Published var isUnlocked = false
    @Published var authFailed = false

    private let fallbackPassword = "zsdw321"

    func authenticateWithBiometrics() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthentication,
                                   localizedReason: "Unlock your password manager") { success, _ in
                DispatchQueue.main.async {
                    self.isUnlocked = success
                    self.authFailed = !success
                }
            }
        } else {
            DispatchQueue.main.async {
                self.authFailed = true
            }
        }
    }

    func authenticateWithPassword(_ input: String) {
        if input == fallbackPassword {
            isUnlocked = true
            authFailed = false
        } else {
            authFailed = true
        }
    }
}

