//
//  HotelViewModel.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/19/23.
//

import Combine

final class HotelViewModel: ObservableObject {
    @Published var hotel: Hotel?
    
    private var cancellables: Set<AnyCancellable> = []
    private let networkManager = NetworkManager()

    func fetchData() {
        networkManager.fetchHotel()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching hotel data: \(error)")
                }
            }, receiveValue: { hotel in
                
                self.hotel = hotel
            })
            .store(in: &cancellables)
    }
}

