//
//  CryptoListRepository.swift
//  CryptoApp
//
//  Created by Rodrigo Adauto Ortiz on 9/05/24.
//

import Foundation

protocol CryptoListRepository {
    func fetchListCrypto() async -> Result<[Crypto], Error> 
}
