//
//  SuccessView.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/21/23.
//

import SwiftUI

private enum Constants {
    static let orderHasBeenPaid  = "Заказ оплачен"
    static let orderIsAccepted = "Ваш заказ принят в работу"
    static let confirmation = "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). \n Как только мы получим ответ от туроператора, вам на почту придет уведомление."
    static let superText = "Супер!"
}

struct SuccessView: View {
    var body: some View {
        
        VStack(alignment: .center) {
            Image("partyPopper", bundle: .main)
                .padding(.top, Offsets.offset138)
                .padding(.bottom, Offsets.offset32)
            Text(Constants.orderIsAccepted)
                .font(.system(size: Fonts.font22))
                .fontWeight(.medium)
            Text(Constants.confirmation)
                .multilineTextAlignment(.center)
                .font(.system(size: Fonts.font16))
                .foregroundStyle(.gray)
                .padding(.horizontal)
                .padding(.top, Offsets.offset5)
            Spacer()
            ZStack {
                NavigationLink(destination: EmptyView()) {
                    Text(Constants.superText)
                        .padding(.vertical, Offsets.offset16)
                        .frame(maxWidth: .infinity)
                        .font(.system(size: Fonts.font16))
                }
                .background(
                    RoundedRectangle(cornerRadius: CornerRadius.cr15)
                        .foregroundStyle(.generalBlue)
                )
                .frame(height: Sizes.size48)
                .foregroundStyle(.white)
                .padding(.horizontal)
                .padding(.bottom, Offsets.offset28)
                .padding(.top, Offsets.offset12)
                
            }
            .frame(height: Sizes.size88)
            .background(.white)
            .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(.borderGray), alignment: .top)
        }
        .navigationTitle(Constants.orderHasBeenPaid)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    SuccessView()
}
