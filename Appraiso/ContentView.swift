//
//  ContentView.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                AppraisalListView()
                VStack {
                    Spacer()
                    HStack {
                        Image(systemName: "camera.viewfinder")
                            .font(.system(size: 40))
                            .foregroundColor(.background)
                            .padding()
                            .background(.accent)
                            .clipShape(Circle())
                            .onTapGesture {}
                    }
                }
            }
            .navigationTitle("Your Items")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AccountView()) {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 24))
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
