//
//  AppraisalListView.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-11.
//

import SwiftUI

struct AppraisalListView: View {
    let scannedItems = [ScannedItem(name: "Item 1", description: "something", image: UIImage(imageLiteralResourceName: "item1")), ScannedItem(name: "Item 2", description: "something", image: UIImage(imageLiteralResourceName: "item2")), ScannedItem(name: "Item 1", description: "something", image: UIImage(imageLiteralResourceName: "item1")), ScannedItem(name: "Item 2", description: "something", image: UIImage(imageLiteralResourceName: "item2")), ScannedItem(name: "Item 1", description: "something", image: UIImage(imageLiteralResourceName: "item1")), ScannedItem(name: "Item 2", description: "something", image: UIImage(imageLiteralResourceName: "item2")), ScannedItem(name: "Item 1", description: "something", image: UIImage(imageLiteralResourceName: "item1")), ScannedItem(name: "Item 2", description: "something", image: UIImage(imageLiteralResourceName: "item2")), ScannedItem(name: "Item 1", description: "something", image: UIImage(imageLiteralResourceName: "item1")), ScannedItem(name: "Item 2", description: "something", image: UIImage(imageLiteralResourceName: "item2")), ScannedItem(name: "Item 1", description: "something", image: UIImage(imageLiteralResourceName: "item1")), ScannedItem(name: "Item 2", description: "something", image: UIImage(imageLiteralResourceName: "item2")), ScannedItem(name: "Item 1", description: "something", image: UIImage(imageLiteralResourceName: "item1")), ScannedItem(name: "Item 2", description: "something", image: UIImage(imageLiteralResourceName: "item2"))]
    
    var body: some View {
        VStack {
            List(scannedItems) { item in
                NavigationLink(destination: Text(item.name)) {
                    HStack(spacing: 10) {
                        Image(uiImage: item.image)
                            .resizable()
                            .scaledToFill()
                            .padding(0.0)
                            .clipped()
                            .frame(width: 55, height: 50, alignment: .center)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Text(item.name)
                    }
                }
            }
            .listStyle(.plain)
            .padding(.top)

            // Load user's previously appraised items
            // if items are empty, show hint to scan an item to get started

            Spacer()
        }
    }
}

#Preview {
    AppraisalListView()
}
