//
//  TotalPriceView.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/21/23.
//

import SwiftUI

private enum Constants {
    static let tour = "Тур"
    static let fuelCharge = "Топливный сбор"
    static let serviceCharge = "Сервисный сбор"
    static let toPay = "К оплате"
    static let ruble = "₽"
}

struct TotalPriceView: View {
    
    let tourPrice: Int
    let fuelCharge: Int
    let serviceCharge: Int
    let touristsCount: Int
    let finalCost: Int
    
    var body: some View {
        VStack(spacing: Offsets.offset16) {
            PriceItemView(title: Constants.tour, price: tourPrice * touristsCount)
            PriceItemView(title: Constants.fuelCharge, price: fuelCharge * touristsCount)
            PriceItemView(title: Constants.serviceCharge, price: serviceCharge * touristsCount)
            HStack {
                Text(Constants.toPay)
                    .font(.system(size: Fonts.font16))
                    .foregroundStyle(.gray)
                    .frame(maxWidth: Sizes.size150, alignment: .leading)
                Text("\(finalCost) \(Constants.ruble)")
                    .font(.system(size: Fonts.font16))
                    .fontWeight(.semibold)
                    .foregroundStyle(.generalBlue)
                    .frame(maxWidth: .infinity, alignment: .trailing)
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

private struct PriceItemView: View {
    let title: String
    let price: Int
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(.gray)
                .frame(maxWidth: Sizes.size150, alignment: .leading)
            Text("\(price) \(Constants.ruble)")
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

#Preview {
    BookingView()
}
