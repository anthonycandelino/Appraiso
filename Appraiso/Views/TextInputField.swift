//
//  TextInputField.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-14.
//

import SwiftUI

enum InputType {
    case plain, email, secure
}

struct TextInputField: View {
    @Binding var text: String
    var placeholder: String
    var inputType: InputType = .plain
    var shouldValidate: Bool = true
    var label: String? = nil

    @FocusState private var isFocused: Bool
    @State private var hasInteracted: Bool = false

    var isValid: Bool {
        guard shouldValidate else { return true }
        switch inputType {
        case .email:
            return isValidEmail(text) || text.isEmpty
        case .secure, .plain:
            return !text.isEmpty
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let label = label {
                Text(label)
                    .font(.subheadline)
                    .foregroundColor(.primary.opacity(0.9))
            }

            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(uiColor: UIColor.tertiarySystemBackground))
                    .shadow(
                        color: Color.black.opacity(0.1),
                        radius: isFocused ? 4 : 2, x: 0, y: 2
                    )

                if inputType == .secure {
                    SecureField(placeholder, text: $text)
                        .foregroundColor(.primary)
                        .padding(12)
                        .focused($isFocused)
                        .onChange(of: isFocused) { _, newValue in
                            if !newValue { hasInteracted = true }
                        }
                } else {
                    TextField(placeholder, text: $text)
                        .foregroundColor(.primary)
                        .padding(12)
                        .keyboardType(
                            inputType == .email ? .emailAddress : .default
                        )
                        .autocapitalization(
                            inputType == .email ? .none : .sentences
                        )
                        .focused($isFocused)
                        .onChange(of: isFocused) { _, newValue in
                            if !newValue { hasInteracted = true }
                        }
                }
            }
            .frame(height: 50)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(
                        borderColor,
                        lineWidth: 1
                    )
            )
            .animation(.easeInOut(duration: 0.2), value: isFocused)

            if shouldValidate && !isValid && hasInteracted {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.horizontal, 4)
            }
        }
    }

    private var borderColor: Color {
        if isFocused {
            return .accent
        } else if shouldValidate && !isValid && hasInteracted {
            return .red
        } else {
            return Color.gray.opacity(0.5)
        }
    }

    private var errorMessage: String {
        switch inputType {
        case .email:
            return "Invalid email format"
        case .secure, .plain:
            return "Field cannot be empty"
        }
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailPredicate = NSPredicate(
            format: "SELF MATCHES %@",
            "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")
        return emailPredicate.evaluate(with: email)
    }
}

#Preview {
    @Previewable @State var text = ""
    @Previewable @State var email = ""
    @Previewable @State var password = ""
    @Previewable @State var optionalText = ""
    VStack(spacing: 20) {
        TextInputField(
            text: $text, placeholder: "Name", inputType: .plain,
            label: "Your Name")
        TextInputField(
            text: $email, placeholder: "Email", inputType: .email,
            label: "Email Address")
        TextInputField(
            text: $password, placeholder: "Password", inputType: .secure,
            label: "Password")
        TextInputField(
            text: $optionalText, placeholder: "Optional Field",
            inputType: .plain, shouldValidate: false, label: "Optional Field")
    }
    .padding()
}
