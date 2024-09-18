//
//  CryptoListUseCaseImp.swift
//  CryptoApp
//
//  Created by Rodrigo Adauto Ortiz on 9/05/24.
//

import Foundation

class CryptoListUseCaseImp: CryptoListUseCase {
    let repository: CryptoListRepository
    init(repository: CryptoListRepository) {
        self.repository = repository
    }
    
    func getListCrypto() async -> Result<[Crypto], Error> {
        return await repository.fetchListCrypto()
    }
    
}

