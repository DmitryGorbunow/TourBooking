//
//  BookingView.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/15/23.
//

import SwiftUI

private enum Constants {
    static let booking = "Бронирование"
    static let toPay = "Оплатить"
    static let ruble = "₽"
    static let alertTitle = "Ошибка"
    static let alertMessage = "Заполните все данные"
    static let alertOK = "OK"
}

struct BookingView: View {
    
    @ObservedObject var viewModel = BookingViewModel()
    @State private var goNext = false
    @State private var showAlert = false
    
    var body: some View {
        
        ScrollView {
            if let bookingData = viewModel.reservation {
                VStack {
                    HotelInformationView(rating: bookingData.horating, ratingName: bookingData.ratingName, name: bookingData.hotelName, address: bookingData.hotelAdress)
                    
                    BookingInformationView(departure: bookingData.departure, arrivalCountry: bookingData.arrivalCountry, startDate: bookingData.tourDateStart, endDate: bookingData.tourDateStop, numberOfNights: bookingData.numberOfNights, hotelName: bookingData.hotelName, room: bookingData.room, nutrition: bookingData.nutrition)
                    
                    BuyerInfoView(viewModel: viewModel)
                    
                    ForEach(viewModel.tourists.indices, id: \.self) { index in
                        TouristsInfoView(tourist: $viewModel.tourists[index])
                    }
                    
                    AddTouristView(onButtonTap: viewModel.addTourist)
                    
                    TotalPriceView(tourPrice: bookingData.tourPrice, fuelCharge: bookingData.fuelCharge, serviceCharge: bookingData.serviceCharge, touristsCount: viewModel.tourists.count, finalCost: viewModel.calculateFinalCost())
                    
                    ZStack {
                        NavigationLink(isActive: $goNext) {
                            SuccessView()
                                .navigationBarBackButtonHidden(true)
                                .navigationBarItems(leading: BackButton())
                        } label: {
                            Button {
                                viewModel.checkFields()
                                if viewModel.isAllFieldsValid {
                                    goNext = true
                                    showAlert = false
                                } else {
                                    goNext = false
                                    showAlert = true
                                }
                            } label: {
                                Text("\(Constants.toPay) \(viewModel.calculateFinalCost()) \(Constants.ruble)")
                                    .padding(.vertical, Offsets.offset16)
                                    .frame(maxWidth: .infinity)
                                    .font(.system(size: Fonts.font16))
                                    .foregroundColor(.white)
                            }
                        }
                        .background(RoundedRectangle(cornerRadius: CornerRadius.cr15).foregroundStyle(.generalBlue))
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
                .background(.generalGrayBackground)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(Constants.alertTitle), message: Text(Constants.alertMessage), dismissButton: .default(Text(Constants.alertOK)))
                }
            }
        }
        .navigationTitle(Constants.booking)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .bottom)
        .onAppear {
            viewModel.fetchData()
        }
    }
}

#Preview {
    BookingView()
}


