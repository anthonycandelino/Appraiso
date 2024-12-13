//
//  AuthViewModel.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-12.
//

import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    private var authListener: AuthStateDidChangeListenerHandle?

    init() {
        checkAuthenticationStatus()
    }

    private func checkAuthenticationStatus() {
        authListener = Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            guard let self = self else { return }

            if let user = user {
                // Force reload the user to ensure their account still exists
                user.reload { error in
                    if let error = error {
                        print("Error reloading user: \(error.localizedDescription)")
                        // If reload fails, sign the user out
                        self.signOut()
                    } else if Auth.auth().currentUser == nil {
                        // If currentUser is nil, the user no longer exists
                        self.signOut()
                    } else {
                        // User is still valid
                        self.isLoggedIn = true
                    }
                }
            } else {
                // No user logged in
                self.isLoggedIn = false
            }
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.isLoggedIn = false
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }

    deinit {
        if let listener = authListener {
            Auth.auth().removeStateDidChangeListener(listener)
        }
    }
}
