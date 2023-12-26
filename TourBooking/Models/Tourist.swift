//
//  Tourist.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/22/23.
//

import Foundation

struct Tourist: Identifiable {
    let id = UUID()
    let number: String
    var name: String
    var lastName: String
    var birthDate: String
    var citizenship: String
    var passportNumber: String
    var passportExpirationDate: String
    
    func areFieldsValid() -> Bool {
        Validator.isTextValid(name) && Validator.isTextValid(lastName) &&
        Validator.isTextValid(birthDate) && Validator.isTextValid(citizenship) &&
        Validator.isTextValid(passportNumber) && Validator.isTextValid(passportExpirationDate)
    }
}
