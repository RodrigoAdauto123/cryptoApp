//
//  CryptoDataSource.swift
//  CryptoApp
//
//  Created by Rodrigo Adauto Ortiz on 9/05/24.
//

import Foundation

protocol CryptoDataSource {
    func listCrypto() async -> Result<[CryptoDTO], Error>
}
