//
//  BuyerInfoView.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/21/23.
//

import SwiftUI

private enum Constants {
    static let aboutBuyer = "Информация о покупателе"
    static let number = "Номер телефона"
    static let email = "Почта"
    static let description = "Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту"
}

struct BuyerInfoView: View {
    
    @ObservedObject var viewModel: BookingViewModel
    
    init(viewModel: BookingViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: Offsets.offset20) {
            Text(Constants.aboutBuyer)
                .font(.system(size: Fonts.font22))
                .fontWeight(.medium)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: Offsets.offset8) {
                
                CustomTextField(text: $viewModel.phoneNumber, isValidated: Validator.isTextValid(viewModel.phoneNumber), title: Constants.number)
                    .onChange(of: viewModel.phoneNumber) { newValue in
                        viewModel.validatePhoneNumber(newValue)
                    }
                
                CustomTextField(text: $viewModel.email, isValidated: Validator.isValidEmail(for: viewModel.email), title: Constants.email)
                    .onChange(of: viewModel.email) { newValue in
                        viewModel.validateEmail(newValue)
                    }
                
                Text(Constants.description)
                    .font(.system(size: Fonts.font14))
                    .foregroundStyle(.gray)
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
