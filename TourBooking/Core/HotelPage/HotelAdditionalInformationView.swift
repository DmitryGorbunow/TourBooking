//
//  HotelAdditionalInformationView.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/15/23.
//

import SwiftUI

private enum Constants {
    static let aboutHotel = "Об отеле"
}

struct HotelAdditionalInformationView: View {
    
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    let aboutTheHotel: AboutTheHotel
    
    var body: some View {
        VStack(alignment: .leading, spacing: Offsets.offset16) {
            Text(Constants.aboutHotel)
                .font(.system(size: Fonts.font22))
                .fontWeight(.medium)
            
            LazyVGrid(columns: [GridItem(.flexible(), spacing: Offsets.offset8, alignment: .leading), GridItem(.flexible(), spacing: Offsets.offset8, alignment: .leading)], spacing: Offsets.offset10) {
                ForEach(aboutTheHotel.peculiarities, id: \.self) { peculiarity in
                    Text(peculiarity)
                        .padding(Offsets.offset8)
                        .background(.additionalGrayBackground)
                        .cornerRadius(CornerRadius.cr5)
                        .font(.system(size: Fonts.font16))
                        .fontWeight(.medium)
                        .lineLimit(1)
                        .foregroundColor(.gray)
                }
            }
            
            Text(aboutTheHotel.description)
                .font(.system(size: Fonts.font16))
                .foregroundColor(.black.opacity(0.9))
            
            HotelСonveniencesView()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: CornerRadius.cr12)
                .foregroundStyle(.white)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    HotelView()
}
