//
//  BaseTextField.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/25/23.
//

import SwiftUI

struct CustomTextField: View {
    @FocusState var isFocused: Bool
    @Binding var text: String
    @State private var color: Color = .generalGrayBackground
    
    let isValidated: Bool
    let title: String
    var keyboardType: UIKeyboardType = .alphabet
    var capitalization: TextInputAutocapitalization = .words
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(color)
            VStack(spacing: 0) {
                if text.isEmpty {
                    if isFocused {
                        TextFieldTitleView(title: title)
                            .font(.system(size: 12))
                    } else {
                        TextFieldTitleView(title: title)
                            .font(.system(size: 17))
                            .offset(CGSize(width: 0, height: 10))
                    }
                } else {
                    TextFieldTitleView(title: title)
                        .font(.system(size: 12))
                }
                TextField("", text: $text)
                    .font(.system(size: 17))
                    .focused($isFocused)
                    .keyboardType(keyboardType)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(capitalization)
                    .onChange(of: text) { newValue in
                        color = isValidated ? .generalGrayBackground : .notValid
                    }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 52)
    }
}

private struct TextFieldTitleView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .foregroundStyle(.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
