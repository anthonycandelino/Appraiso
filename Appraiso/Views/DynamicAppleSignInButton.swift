//
//  DynamicAppleSignInButton.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-14.
//

import AuthenticationServices
import SwiftUI

struct DynamicAppleSignInButton: View {
    @Environment(\.colorScheme) private var colorScheme
    var isAccountCreated = false
    
    var label : SignInWithAppleButton.Label {
        isAccountCreated ? .signIn : .signUp
    }

    var body: some View {
        VStack {
            if colorScheme == .dark {
                SignInWithAppleButton(
                    label,
                    onRequest: { _ in
                        print(">>> WIP")
                    },
                    onCompletion: { _ in
                        print(">>> WIP")
                    }
                )
                .signInWithAppleButtonStyle(.white)
                .frame(height: 50)
                .cornerRadius(25)
            } else {
                SignInWithAppleButton(
                    label,
                    onRequest: { _ in
                        print(">>> WIP")
                    },
                    onCompletion: { _ in
                        print(">>> WIP")
                    }
                )
                .signInWithAppleButtonStyle(.black)
                .frame(height: 50)
                .cornerRadius(25)
            }
        }
    }
}

#Preview {
    DynamicAppleSignInButton()
}
