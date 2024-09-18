//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Rodrigo Adauto Ortiz on 8/05/24.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    var body: some Scene {
        WindowGroup {
            CryptoListFactory.createCryptoList()
        }
    }
}
