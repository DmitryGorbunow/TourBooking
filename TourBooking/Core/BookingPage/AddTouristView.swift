//
//  AddTouristView.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/23/23.
//

import SwiftUI

private enum Constants {
    static let addTourist = "Добавить туриста"
}

struct AddTouristView: View {
    
    let onButtonTap: () -> ()
    
    var body: some View {
        HStack {
            Text(Constants.addTourist)
                .font(.system(size: Fonts.font22))
                .fontWeight(.medium)
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: CornerRadius.cr6)
                    .frame(width: Sizes.size32, height: Sizes.size32)
                    .foregroundStyle(.generalBlue)
                Image(systemName: "plus")
                    .foregroundStyle(.white)
                    .onTapGesture {
                        onButtonTap()
                    }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: CornerRadius.cr12)
                .foregroundStyle(.white)
        )
    }
}

#Preview {
    BookingView()
}
