//
//  RoomView.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/15/23.
//

import SwiftUI

private enum Constants {
    static let room = "Номер"
    static let moreInformation = "Подробнее о номере"
    static let chooseRoom = "Выбрать номер"
}

struct RoomsView: View {
    
    @ObservedObject var viewModel = RoomViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            if let roomsData = viewModel.room {
                VStack {
                    ForEach(roomsData.rooms, id: \.id) { room in
                        RoomView(room: room)
                    }
                }
                .background(.generalGrayBackground)
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
    
    struct RoomView: View {
        
        let room: RoomElement
        
        var body: some View {
            VStack(alignment: .leading, spacing: Offsets.offset8) {
                ImagesTabView(imageUrls: room.imageUrls)
                
                Text(room.name)
                    .font(.system(size: Fonts.font22))
                    .fontWeight(.medium)
                
                LazyVGrid(columns: [GridItem(.flexible(), spacing: Offsets.offset8, alignment: .leading), GridItem(.flexible(), spacing: Offsets.offset8, alignment: .leading)], spacing: Offsets.offset10) {
                    ForEach(room.peculiarities, id: \.self) { peculiarity in
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
                
                Button(action: {}, label: {
                    HStack(spacing: 2) {
                        Text(Constants.moreInformation)
                        Image(systemName: "chevron.right")
                    }
                    .font(.system(size: Fonts.font16))
                    .fontWeight(.medium)
                    .foregroundColor(.generalBlue)
                    .padding(.horizontal, Offsets.offset10)
                    .padding(.vertical, Offsets.offset5)
                    .background(.blueBackground)
                    .cornerRadius(CornerRadius.cr5)
                })
                .disabled(true)
                
                HStack(alignment: .firstTextBaseline) {
                    Text("\(room.price) ₽")
                        .font(.system(size: Fonts.font30))
                        .fontWeight(.semibold)
                    
                    Text(room.pricePer.lowercased())
                        .foregroundStyle(.gray)
                        .font(.system(size: Fonts.font16))
                }
                .padding(.vertical, Offsets.offset8)
                
                NavigationLink(destination: BookingView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: BackButton())) {
                    Text(Constants.chooseRoom)
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
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: CornerRadius.cr12)
                    .foregroundStyle(.white)
            )
        }
    }
}

#Preview {
    RoomsView()
}

