//
//  Validator.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/25/23.
//

import Foundation

struct Validator {
    static func isValidEmail(for email: String) -> Bool {
        let email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.{1}[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func isTextValid(_ value: String) -> Bool {
        return value.count > 1
    }
}
