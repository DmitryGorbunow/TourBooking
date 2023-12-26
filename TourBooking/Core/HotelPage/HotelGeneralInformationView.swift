//
//  HotelGeneralInformationView.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/15/23.
//

import SwiftUI

struct HotelGeneralInformationView: View {
    
    let rating: Int
    let ratingName: String
    let name: String
    let address: String
    let price: Int
    let priceForIt: String
    let imageUrls: [String]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: Offsets.offset16) {
            
            ImagesTabView(imageUrls: imageUrls)
            
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
            
            HStack(alignment: .firstTextBaseline) {
                Text("от \(price) ₽")
                    .font(.system(size: Fonts.font30))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text(priceForIt.lowercased())
                    .font(.system(size: Fonts.font16))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: CornerRadius.cr12)
                .foregroundStyle(.white)
        )
    }
}

#Preview {
    HotelView()
}
