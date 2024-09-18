//
//  DisplayCrypto.swift
//  CryptoApp
//
//  Created by Rodrigo Adauto Ortiz on 11/05/24.
//

import Foundation


enum PriceChangeColor: String {
    case positive
    case negative
    case none
}

struct DisplayCrypto {
    let id, symbol, name: String
    let image: String
    let currentPrice: String
    let marketCapRank: String
    let priceChangePercentage24H: String
    let colorPriceChangePercentage24H: PriceChangeColor
    
    init(crypto: Crypto) {
        self.id = crypto.id
        self.symbol = crypto.symbol
        self.name = crypto.name
        self.image = crypto.image
        self.currentPrice = crypto.currentPrice
        self.marketCapRank = crypto.marketCapRank
        let priceChangeString = crypto.priceChangePercentage24H.roundDecimals(with: 2).description
        if priceChangeString.contains(where: { character in
            character == "-"
        }) {
            self.priceChangePercentage24H = priceChangeString
            self.colorPriceChangePercentage24H = .negative
        } else {
            self.priceChangePercentage24H = "+\(priceChangeString)"
            self.colorPriceChangePercentage24H = .positive
        }
    }
    
}
