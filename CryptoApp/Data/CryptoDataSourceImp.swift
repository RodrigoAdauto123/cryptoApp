//
//  CryptoDataSourceImp.swift
//  CryptoApp
//
//  Created by Rodrigo Adauto Ortiz on 8/05/24.
//

import Foundation

enum CryptoError: Error {
    case backend(Int)
    case networking
    case parsing
    case url
    case dataError
}

class CryptoDataSourceImp: CryptoDataSource {
    
    func listCrypto() async -> Result<[CryptoDTO], Error> {
        if let responseSuccess = UserDefaults.standard.data(forKey: "CryptoList") {
            guard let cryptoList = try? JSONDecoder().decode([CryptoDTO].self, from: responseSuccess)
            else {
                return .failure(CryptoError.parsing)
            }
            return .success(cryptoList)
        }
        let url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
        let response = await DataProvider.doRequestAsync(with: url, decodable: [CryptoDTO].self, httpRequest: .GET)
        saveCryptoList(response: response)
        return response
    }
    
    private func saveCryptoList(response:  Result<[CryptoDTO], Error>) {
        if case .success(let cryptoList) = response {
            guard let cryptoData = try? JSONEncoder().encode(cryptoList) else { return }
            UserDefaults.standard.setValue(cryptoData, forKey: "CryptoList")
        }
    }
    
}
