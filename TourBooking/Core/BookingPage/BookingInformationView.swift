//
//  BookingInformationView.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/21/23.
//

import SwiftUI

private enum Constants {
    static let departure = "Вылет из"
    static let country = "Страна, город"
    static let date = "Даты"
    static let numberOfNights = "Кол-во ночей"
    static let hotel = "Отель"
    static let room = "Номер"
    static let nutrition = "Питание"
}

struct BookingInformationView: View {
    
    let departure: String
    let arrivalCountry: String
    let startDate: String
    let endDate: String
    let numberOfNights: Int
    let hotelName: String
    let room: String
    let nutrition: String
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: Offsets.offset16) {
            BookingInformationItemView(title: Constants.departure, info: departure)
            BookingInformationItemView(title: Constants.country, info: arrivalCountry)
            BookingInformationItemView(title: Constants.date, info: startDate + " – " + endDate)
            BookingInformationItemView(title: Constants.numberOfNights, info: numberOfNights.description)
            BookingInformationItemView(title: Constants.hotel, info: hotelName)
            BookingInformationItemView(title: Constants.room, info: room)
            BookingInformationItemView(title: Constants.nutrition, info: nutrition)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: CornerRadius.cr12)
                .foregroundStyle(.white)
        )
    }
}

private struct BookingInformationItemView: View {
    let title: String
    let info: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(.gray)
                .frame(maxWidth: Sizes.size150, alignment: .leading)
            Text(info)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.system(size: Fonts.font16))
    }
}

#Preview {
    BookingView()
}
