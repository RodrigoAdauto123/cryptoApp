//
//  CryptoListFactory.swift
//  CryptoApp
//
//  Created by Rodrigo Adauto Ortiz on 13/05/24.
//

import Foundation

class CryptoListFactory {
    static func createCryptoList() -> CryptoListView {
    return CryptoListView(viewModel: createViewModel())
    }
    
    private static func createViewModel() -> CryptoListViewModelImp {
        return CryptoListViewModelImp(useCase: createUseCase())
    }
    
    private static func createUseCase() -> CryptoListUseCase {
        return CryptoListUseCaseImp(repository: createRepository())
    }
    
    private static func createRepository() -> CryptoListRepository {
        return CryptoListRepositoryImp(dataSource: CryptoDataSourceImp())
    }
}
