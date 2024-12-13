//
//  AccountView.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-11.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        VStack {
            Text("Account")
                .font(.largeTitle)
                .padding()

            Button("Log Out") {
                logout { result in
                    switch result {
                    case .success:
                        print("User logged out successfully")
                    case .failure(let error):
                        print("Failed to log out: \(error.localizedDescription)")
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AccountView()
}
