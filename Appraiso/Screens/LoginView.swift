//
//  LoginView.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-11.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var authViewModel = AuthViewModel()

    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                
                Button("Log In") {
                    login(email: email, password: password) { result in
                        switch result {
                        case .success:
                            print("User logged in successfully")
                        case .failure(let error):
                            errorMessage = error.localizedDescription
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                
                NavigationLink("Create Account", destination: CreateAccountView())
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
}
