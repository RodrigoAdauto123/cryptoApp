//
//  CryptoListViewModelImp.swift
//  CryptoApp
//
//  Created by Rodrigo Adauto Ortiz on 9/05/24.
//

import Foundation

class CryptoListViewModelImp: ObservableObject {
    let useCase: CryptoListUseCase
    @Published var listCrypto: [DisplayCrypto] = []
    init(useCase: CryptoListUseCase) {
        self.useCase = useCase
    }
    
    func fetchCryptoList() {
        Task {
            let result = await useCase.getListCrypto()
            switch result {
            case .success(let cryptoList):
                listCrypto = cryptoList.map({ crypto in
                    DisplayCrypto(crypto: crypto)
                })
                print(listCrypto)
            case .failure(let failure):
                break
            }
        }
    }
}
