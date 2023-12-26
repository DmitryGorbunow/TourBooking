//
//  TouristsInfoView.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/21/23.
//

import SwiftUI

private enum Constants {
    static let name = "Имя"
    static let lastName = "Фамилия"
    static let birthDate = "Дата рождения"
    static let citizenship = "Гражданство"
    static let passportNumber = "Номер загранпаспорта"
    static let passportExporationDate = "Срок действия загранпаспорта"
}

struct TouristsInfoView: View {
    
    @State private var isExpanded: Bool = false
    
    @Binding var tourist: Tourist
        
    var body: some View {
        VStack {
            DisclosureGroup(tourist.number, isExpanded: $isExpanded) {
                
                CustomTextField(text: $tourist.name, isValidated: Validator.isTextValid(tourist.name), title: Constants.name)
                
                CustomTextField(text: $tourist.lastName, isValidated: Validator.isTextValid(tourist.lastName), title: Constants.lastName)
                
                CustomTextField(text: $tourist.birthDate, isValidated: Validator.isTextValid(tourist.birthDate), title: Constants.birthDate)
                
                CustomTextField(text: $tourist.citizenship, isValidated: Validator.isTextValid(tourist.citizenship), title: Constants.citizenship)
                
                CustomTextField(text: $tourist.passportNumber, isValidated: Validator.isTextValid(tourist.passportNumber), title: Constants.passportNumber)
                
                CustomTextField(text: $tourist.passportExpirationDate, isValidated: Validator.isTextValid(tourist.passportExpirationDate), title: Constants.passportExporationDate)
            }
            .disclosureGroupStyle(TouristDisclosureStyle())
            .font(.system(size: Fonts.font22))
            .fontWeight(.medium)
            .tint(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: CornerRadius.cr12)
                .foregroundStyle(.white)
        )
        
    }
}

private struct TouristDisclosureStyle: DisclosureGroupStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            HStack {
                configuration.label
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: CornerRadius.cr6)
                        .frame(width: Sizes.size32, height: Sizes.size32)
                        .foregroundStyle(.blueBackground)
                    if configuration.isExpanded {
                        Image(systemName: "chevron.up")
                            .resizable()
                            .frame(width: Offsets.offset12, height: Offsets.offset6)
                            .foregroundStyle(.generalBlue)
                            .onTapGesture {
                                configuration.isExpanded.toggle()
                            }
                    } else {
                        Image(systemName: "chevron.down")
                            .resizable()
                            .frame(width: Offsets.offset12, height: Offsets.offset6)
                            .foregroundStyle(.generalBlue)
                            .onTapGesture {
                                configuration.isExpanded.toggle()
                            }
                    }
                }
            }
            
            if configuration.isExpanded {
                configuration.content
            }
        }
    }
}

#Preview {
    BookingView()
}
