//
//  HotelTableView.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/16/23.
//

import SwiftUI

private enum Constants {
    static let facilities = "Удобства"
    static let essentials = "Самое необходимое"
    static let included = "Что включено"
    static let notIncluded = "Что не включено"
}

struct HotelСonveniencesView: View {
    var body: some View {
        VStack {
            СonveniencesItemView(image: .emojiHappy, text: Constants.facilities)
            Divider()
                .padding(.leading, Offsets.offset69)
            СonveniencesItemView(image: .tickSquare, text: Constants.included)
            Divider()
                .padding(.leading, Offsets.offset69)
            СonveniencesItemView(image: .closeSquare, text: Constants.notIncluded)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: CornerRadius.cr12)
            .foregroundColor(.additionalGrayBackground)
        )
    }
}

struct СonveniencesItemView: View {
    
    let image: ImageResource
    let text: String
    
    var body: some View {
        HStack(spacing: Offsets.offset12) {
            Image(image)
            VStack(alignment: .leading) {
                Text(text)
                    .font(.system(size: Fonts.font16))
                    .fontWeight(.medium)
                Text(Constants.essentials)
                    .font(.system(size: Fonts.font14))
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Image(systemName: "chevron.right")
        }
    }
}

#Preview {
    HotelView()
}






