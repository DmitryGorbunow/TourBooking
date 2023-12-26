//
//  ImageSlider.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/19/23.
//

import SwiftUI

struct ImagesTabView: View {
    private enum Constants {
        static let unknownError = "Unknown error"
    }
    
    let imageUrls: [String]
    
    var body: some View {
        TabView {
            ForEach(imageUrls, id: \.self) { imageUrl in
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundStyle(.white)
                    AsyncImage(url: URL(string: imageUrl)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        case .failure:
                            Image(systemName: "photo")
                        @unknown default:
                            fatalError(Constants.unknownError)
                        }
                    }
                }
            }
        }
        .frame(height: 257)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#Preview {
    HotelView()
}
