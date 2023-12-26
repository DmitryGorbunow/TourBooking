//
//  HotelInformationView.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/21/23.
//

import SwiftUI

struct HotelInformationView: View {
    
    let rating: Int
    let ratingName: String
    let name: String
    let address: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: Offsets.offset16) {
            ZStack {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellowText)
                    Text("\(rating) \(ratingName)")
                        .font(.system(size: Fonts.font16))
                        .fontWeight(.medium)
                        .foregroundColor(.yellowText)
                }
            }
            .padding(.horizontal, Offsets.offset10)
            .padding(.vertical, Offsets.offset5)
            .background(.yellowBackground)
            .cornerRadius(CornerRadius.cr5)
            
            Text(name)
                .font(.system(size: Fonts.font22))
                .fontWeight(.medium)
                .padding(.top, -Offsets.offset8)
            
            Button(action: {}, label: {
                Text(address)
                    .font(.system(size: Fonts.font14))
                    .fontWeight(.medium)
                    .foregroundColor(.generalBlue)
            })
            .disabled(true)
            .padding(.top, -Offsets.offset8)
            
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
