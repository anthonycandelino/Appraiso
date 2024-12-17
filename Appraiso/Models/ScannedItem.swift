//
//  ScannedItem.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-15.
//

import Foundation
import SwiftUI

class ScannedItem: Identifiable, ObservableObject {
    let id: UUID = UUID()
    
    @Published var name: String
    @Published var description: String
    @Published var value: Double?
    @Published var notes: String
    @Published var image: UIImage
    @Published var category: String?
    @Published var condition: String?
    let scannedDate: Date
    
    init(
        name: String,
        description: String,
        value: Double? = nil,
        notes: String = "",
        image: UIImage = UIImage(),
        scannedDate: Date = Date(),
        category: String? = nil,
        condition: String? = nil
    ) {
        self.name = name
        self.description = description
        self.value = value
        self.notes = notes
        self.image = image
        self.scannedDate = scannedDate
        self.category = category
        self.condition = condition
    }
}
