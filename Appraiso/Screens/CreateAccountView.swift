//
//  CreateAccountView.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-11.
//

import SwiftUI

struct CreateAccountView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var isTermsAccepted = false
    @State private var isShowingTerms = false

    // TODO make form validation for length, correct email format, password format
    var isFormValid: Bool {
        !name.isEmpty && !email.isEmpty && !password.isEmpty && !isTermsAccepted
    }

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Spacer()
            Spacer()

            HStack {
                Text("Create Your Account")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }

            TextInputField(
                text: $name,
                placeholder: "Full Name",
                shouldValidate: true,
                label: "Name"
            )

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
                    .foregroundStyle(Color.red.mix(with: .black, by: 0.25))
            }

            HStack(spacing: 3) {
                Text("I understand the")
                
                Button("Terms and Conditions") { isShowingTerms.toggle()}
                .buttonStyle(.borderless)
                .foregroundStyle(.accent)
                .padding(.trailing, 5)
                .sheet(isPresented: $isShowingTerms) {
                    Text("TODO: ADD TERMS AND CONDITIONS HERE")
                    Button("Dismiss") {
                        isShowingTerms = false
                    }
                }

                Image(
                    systemName: isTermsAccepted
                        ? "checkmark.square.fill" : "square"
                )
                .foregroundColor(
                    isTermsAccepted ? .primary : .gray
                )
                .onTapGesture {
                    isTermsAccepted.toggle()
                }
                
                Spacer()
            }

            CapsuleButton(onClick: onCreateAccount, label: "Sign Up")
                .disabled(!isFormValid)
                .opacity(isFormValid ? 1 : 0.4)

            Text("Or")
                .font(.subheadline)
            DynamicAppleSignInButton()

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

    private func onCreateAccount() {
        createAccount(email: email, password: password) { result in
            switch result {
            case .success:
                print("User created successfully")
            case .failure(let error):
                errorMessage = error.localizedDescription
            }
        }
    }
}

#Preview {
    CreateAccountView()
}
