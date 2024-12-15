//
//  LoginView.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-11.
//

import AuthenticationServices
import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Spacer()
            Spacer()

            HStack {
                Text("Welcome back!")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }

            TextInputField(
                text: $email,
                placeholder: "Email",
                inputType: .email,
                shouldValidate: true,
                label: "Email"
            )

            TextInputField(
                text: $password,
                placeholder: "*********",
                inputType: .secure,
                shouldValidate: true,
                label: "Password"
            )
            .padding(.bottom)

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(Color.red.mix(with: .black, by: 0.25))
            }

            CapsuleButton(onClick: onLogin, label: "Sign In")
            CapsuleButton(label: "Forgot Password?", buttonType: .secondary)  // TODO add forgot password logic
            Text("Or")
                .font(.subheadline)
            DynamicAppleSignInButton(isAccountCreated: true)

            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.primary)
                }
            }
        }
    }

    private func onLogin() {
        login(email: email, password: password) { result in
            switch result {
            case .success:
                print("User logged in successfully")
            case .failure:
                errorMessage = "Incorrect login credentials. Please try again."
            }
        }
    }
}

#Preview {
    LoginView()
}
