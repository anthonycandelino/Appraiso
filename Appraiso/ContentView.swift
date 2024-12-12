//
//  ContentView.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            CaptureView()
                .tabItem {
                    Label("Camera", systemImage: "camera")
                }

            HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock")
                }

            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView()
}
