//
//  AuthViewModel.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-12.
//

import FirebaseAuth
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var user: User? = nil
    @Published var isLoggedIn: Bool = false

    init() {
        // Listen for changes in authentication state
        _ = Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                self.user = user
                self.isLoggedIn = true
            } else {
                self.user = nil
                self.isLoggedIn = false
            }
        }
    }
}
