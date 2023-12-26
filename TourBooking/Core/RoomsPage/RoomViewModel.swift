//
//  RoomViewModel.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/21/23.
//

import Combine

final class RoomViewModel: ObservableObject {
    @Published var room: Room?
    
    private var cancellables: Set<AnyCancellable> = []
    private let networkManager = NetworkManager()

    func fetchData() {
        networkManager.fetchRooms()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching hotel data: \(error)")
                }
            }, receiveValue: { room in
                
                self.room = room
            })
            .store(in: &cancellables)
    }
}
