//
//  AppraisoApp.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-11.
//

import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication
            .LaunchOptionsKey: Any]? = nil
    ) -> Bool {
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
            NavigationView {
                if authViewModel.isLoggedIn {
                    ContentView()
                } else {
                    LaunchView()
                }
            }
        }
    }
}
