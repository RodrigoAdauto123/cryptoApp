//
//  Crypto.swift
//  CryptoApp
//
//  Created by Rodrigo Adauto Ortiz on 9/05/24.
//

import Foundation

struct Crypto {
    let id, symbol, name: String
    let image: String
    let currentPrice: String
    let marketCapRank: String
    let totalVolume, high24H, low24H, priceChange24H: String
    let marketCapChange24H, marketCapChangePercentage24H, circulatingSupply: String
    let priceChangePercentage24H: Double
    let totalSupply, maxSupply: String?
    let roiPorcentage: String?
    let roiTime: String?
    let roiCurrency: String?
    
    
    init(cryptoDTO: CryptoDTO) {
        self.id = cryptoDTO.id
        self.symbol = cryptoDTO.symbol
        self.name = cryptoDTO.name
        self.image = cryptoDTO.image
        self.currentPrice = cryptoDTO.currentPrice.description
        self.marketCapRank = cryptoDTO.marketCapRank.description
        self.totalVolume = cryptoDTO.totalVolume.description
        self.high24H = cryptoDTO.high24H.description
        self.low24H = cryptoDTO.low24H.description
        self.priceChange24H = cryptoDTO.priceChange24H.description
        self.priceChangePercentage24H = cryptoDTO.priceChangePercentage24H
        self.marketCapChange24H = cryptoDTO.marketCapChange24H.description
        self.marketCapChangePercentage24H = cryptoDTO.marketCapChangePercentage24H.description
        self.circulatingSupply = cryptoDTO.circulatingSupply.description
        self.totalSupply = cryptoDTO.totalSupply?.description
        self.maxSupply = cryptoDTO.maxSupply?.description
        self.roiPorcentage = cryptoDTO.roi?.percentage.description
        self.roiTime = cryptoDTO.roi?.times.description
        self.roiCurrency = cryptoDTO.roi?.currency.rawValue
    }
    
    private func evaluatePriceChange(priceChange: String) {
        if priceChange.contains(where: { character in
            character == "-"
        }) {
            
        }
    }
}
