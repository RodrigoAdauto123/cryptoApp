//
//  CryptoListUseCase.swift
//  CryptoApp
//
//  Created by Rodrigo Adauto Ortiz on 9/05/24.
//

import Foundation

protocol CryptoListUseCase {
    func getListCrypto() async -> Result<[Crypto], Error>
}
