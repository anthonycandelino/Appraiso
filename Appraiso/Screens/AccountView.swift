//
//  AccountView.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-11.
//

import SwiftUI

struct AccountView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    var body: some View {
        VStack {
            Text("Account")
                .font(.largeTitle)
                .padding()
            
            Button("LOGOUT") {
                isLoggedIn = false
            }
            .padding()
        }
    }
}

#Preview {
    AccountView()
}
