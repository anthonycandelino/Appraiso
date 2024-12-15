//
//  BackButton.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-15.
//

import SwiftUI

struct BackButton: View {
    var onClick: DismissAction

    var body: some View {
        Button(action: {
            onClick()
        }) {
            Image(systemName: "chevron.left")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.primary)
        }
    }
}
