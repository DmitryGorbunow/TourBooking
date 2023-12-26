//
//  BackButton.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/25/23.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(.backButton)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
            }
        }
    }
}

