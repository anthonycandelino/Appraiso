//
//  LaunchView.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-14.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        VStack {
            Spacer()

            Image("Rounded Icon")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .shadow(color: .gray.opacity(0.5), radius: 7, x: 0, y: 3)
                .padding(.vertical, 25)

            Text("APPRAISO")
                .font(.largeTitle)
                .fontWeight(.heavy)

            Text("Snap it. Appraise it. Sell it.")
                .font(.title3)

            Spacer()

            NavigationLink(destination: CreateAccountView()) {
                CapsuleButton(label: "Sign up", buttonType: .primary)
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal)
            NavigationLink(destination: LoginView()) {
                CapsuleButton(label: "Log in", buttonType: .secondary)
                    .frame(maxWidth: .infinity)
            }
            .padding()
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    LaunchView()
}
