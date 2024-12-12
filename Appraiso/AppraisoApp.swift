//
//  AppraisoApp.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-11.
//

import SwiftUI

@main
struct AppNameApp: App {
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                ContentView()  // Show the main app after login
            } else {
                LoginView()    // Show login screen
            }
        }
    }
}
