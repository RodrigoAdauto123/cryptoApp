//
//  CryptoMapper.swift
//  CryptoApp
//
//  Created by Rodrigo Adauto Ortiz on 9/05/24.
//

import Foundation

struct CryptoMapper {
    static func mapToEntity(cryptoDTO: [CryptoDTO]) -> [Crypto] {
        let listCrypto = cryptoDTO.map {
            Crypto(cryptoDTO: $0)
        }
        return listCrypto
    }
}
