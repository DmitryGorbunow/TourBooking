//
//  ContentView.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/15/23.
//

import SwiftUI
import Combine

private enum Constants {
    static let hotel = "Отель"
    static let chooseRoom = "К выбору номера"
}

struct HotelView: View {
    
    @ObservedObject var viewModel = HotelViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    if let hotelData = viewModel.hotel {
                        HotelGeneralInformationView(rating: hotelData.rating, ratingName: hotelData.ratingName, name: hotelData.name, address: hotelData.adress, price: hotelData.minimalPrice, priceForIt: hotelData.priceForIt, imageUrls: hotelData.imageUrls)
                        
                        HotelAdditionalInformationView(aboutTheHotel: hotelData.aboutTheHotel)
                        
                        ZStack {
                            NavigationLink(destination: RoomsView()
                                .navigationTitle(hotelData.name)
                                .navigationBarBackButtonHidden(true)
                                .navigationBarItems(leading: BackButton())) {
                                Text(Constants.chooseRoom)
                                    .padding(.vertical)
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
                    } else {
                        ProgressView()
                    }
                }
                .background(.generalGrayBackground)
                
            }
            .navigationTitle(Constants.hotel)
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea(edges: .bottom)
            .onAppear {
                viewModel.fetchData()
            }
        }
    }
}

#Preview {
    HotelView()
}


