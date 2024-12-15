//
//  CapsuleButton.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-14.
//

import SwiftUI

enum ButtonType {
    case primary, secondary
}

struct CapsuleButton: View {
    var onClick: () -> Void = {}
    var label = ""
    var buttonType: ButtonType = .primary

    var body: some View {
        Button {
            onClick()
        } label: {
            Text(label)
                .font(.title3)
                .bold()
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
        }
        .foregroundColor(buttonType == .primary ? .white : .accent)
        .background(buttonType == .primary ? .accent : Color.clear)
        .clipShape(Capsule())
        .overlay(
            Capsule()
                .stroke(
                    buttonType == .primary
                        ? .accent : .accent.opacity(0.6),
                    lineWidth: 2
                )
        )
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    VStack(spacing: 16) {
        CapsuleButton(
            onClick: { print("Primary clicked") }, label: "Primary Button",
            buttonType: .primary)
        CapsuleButton(
            onClick: { print("Secondary clicked") }, label: "Secondary Button",
            buttonType: .secondary)
    }
}
