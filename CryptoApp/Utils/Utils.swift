//
//  Utils.swift
//  CryptoApp
//
//  Created by Rodrigo Adauto Ortiz on 11/05/24.
//

import Foundation

extension Double {
    func roundDecimals(with number: Int) -> Double {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = number
        formatter.minimumFractionDigits = number
        let roundedString = formatter.string(from: NSNumber(value: self)) ?? .empty
        return Double(roundedString) ?? .zero
    }
}

extension String {
    static let empty = ""
}
