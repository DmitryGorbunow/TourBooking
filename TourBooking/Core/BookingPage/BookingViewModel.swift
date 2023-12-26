//
//  BoockingViewModel.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/21/23.
//

import Combine
import Foundation

private enum Constants {
    static let firstTourist = "Первый турист"
    static let tourist = "турист"
    static let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    static let format = "SELF MATCHES %@"
    static let first = "Первый"
    static let second = "Второй"
    static let third = "Третий"
    static let fourth = "Четвертый"
    static let fifth = "Пятый"
}

final class BookingViewModel: ObservableObject {
    @Published var reservation: Reservation?
    @Published var phoneNumber: String = ""
    @Published var email: String = ""
    @Published var isPhoneNumberValid: Bool = false
    @Published var isEmailValid: Bool = false
    @Published var isAllFieldsValid: Bool = false
    @Published var tourists: [Tourist] = [
        Tourist(
            number: Constants.firstTourist,
            name: "",
            lastName: "",
            birthDate: "",
            citizenship: "",
            passportNumber: "",
            passportExpirationDate: ""
        )
    ]
    
    private var cancellables: Set<AnyCancellable> = []
    private let networkManager = NetworkManager()
    
    func fetchData() {
        networkManager.fetchReservation()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching hotel data: \(error)")
                }
            }, receiveValue: { reservation in
                
                self.reservation = reservation
            })
            .store(in: &cancellables)
    }
    
    func addTourist() {
        let newElement = Tourist(
            number: "\(numberString(for: tourists.count)) турист",
            name: "",
            lastName: "",
            birthDate: "",
            citizenship: "",
            passportNumber: "",
            passportExpirationDate: ""
        )
        tourists.append(newElement)
    }
    
    func calculateFinalCost() -> Int {
        guard let bookingData = reservation else { return 0 }
        return (bookingData.tourPrice + bookingData.fuelCharge + bookingData.serviceCharge) * tourists.count
    }
    
    private func numberString(for index: Int) -> String {
        let number = index + 1
        switch number {
        case 1: return Constants.first
        case 2: return Constants.second
        case 3: return Constants.third
        case 4: return Constants.fourth
        case 5: return Constants.fifth
        default: return "\(number)-й"
        }
    }
    
    func validatePhoneNumber(_ phoneNumber: String) {
        isPhoneNumberValid = Validator.isTextValid(phoneNumber)
        applyPhoneMask(phoneNumber)
    }
    
    func validateEmail(_ email: String) {
        isEmailValid = Validator.isValidEmail(for: email)
    }
    
    func checkFields() {
        if tourists.allSatisfy({ $0.areFieldsValid() }) && isPhoneNumberValid && isEmailValid {
            isAllFieldsValid = true
        } else {
            isAllFieldsValid = false
        }
    }
    
    private func applyPhoneMask(_ phoneNumber: String) {
        if phoneNumber.count == 1 && phoneNumber != "+" {
            self.phoneNumber = "+7(" + self.phoneNumber
        } else if phoneNumber.count == 7 {
            self.phoneNumber.insert(")", at: self.phoneNumber.index(self.phoneNumber.startIndex, offsetBy: 6))
        } else if phoneNumber.count == 10 {
            self.phoneNumber.insert("-", at: self.phoneNumber.index(self.phoneNumber.startIndex, offsetBy: 10))
        } else if phoneNumber.count == 13 {
            self.phoneNumber.insert("-", at: self.phoneNumber.index(self.phoneNumber.startIndex, offsetBy: 13))
        } else if phoneNumber.count > 16 {
            self.phoneNumber.removeLast()
        }
    }
}
