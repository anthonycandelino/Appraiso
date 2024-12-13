//
//  AppraisoApp.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-11.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct AppNameApp: App {
    @StateObject private var authViewModel = AuthViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            if authViewModel.isLoggedIn {
                ContentView()  // Show the main app after login
            } else {
                LoginView()    // Show login screen
            }
        }
    }
}
