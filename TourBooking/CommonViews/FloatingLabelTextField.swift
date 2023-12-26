//
//  FloatingLabelTextField.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/23/23.
//

import SwiftUI

struct FloatingLabelTextField: View {
    
    var placeholder: String
    @Binding var text: String
    var keyboardtype: UIKeyboardType?
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            Text(self.placeholder)
                .font(.system(size: self.text.isEmpty ? 17 : 12))
                .foregroundColor(.gray)
                .offset(x: 0, y: self.text.isEmpty ? 0 : -16)
                .scaleEffect(self.text.isEmpty ? 1 : 0.8, anchor: .topLeading)
            
            TextField("", text: self.$text)
                .keyboardType(keyboardtype != nil ? keyboardtype! : .default)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
    }
}
