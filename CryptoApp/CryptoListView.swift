//
//  ContentView.swift
//  CryptoApp
//
//  Created by Rodrigo Adauto Ortiz on 8/05/24.
//

import SwiftUI

struct CryptoListView: View {
    @ObservedObject private var viewModel: CryptoListViewModelImp
    
    
    init(viewModel: CryptoListViewModelImp) {
        self.viewModel = viewModel
    }
    var body: some View {
        VStack(content: {
//            Text("Lista de criptomonedas")
//                .font(.title2)
            NavigationView(content: {
                VStack {
                    HStack {
                        Text("Nombre")
                            .font(.system(size: 12))
                            .opacity(0.5)
                        Spacer()
                        Text("Ultimo precio")
                            .font(.system(size: 12))
                            .opacity(0.5)
                            .frame(alignment: .leading)
                            .padding(.horizontal, 10)
                        Text("Cambio 24h")
                            .font(.system(size: 12))
                            .opacity(0.5)
                            .padding(.horizontal, 15)
                    }
                    .padding()
                    List {
                        ForEach(viewModel.listCrypto, id: \.id) { crypto in
                            NavigationLink(destination: Text("Destination")) {
                                CryptoDetailHome(crypto: crypto)
                            }
                        }
                    }
                    
//                    .toolbar {
//                        ToolbarItem(placement: .topBarLeading) {
//                            HStack {
//                                Button(action: {}) {
//                                    Image(systemName: "line.horizontal.3")
//                                }
//                                Spacer()
//                                TextField("Buscar", text: .constant(""))
//                                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                            }
//                        }
//                        ToolbarItem {
//                            Button(action: {
//                            }) {
//                                Image(systemName: "plus")
//                            }
//                        }
//                    }
                    Spacer()
                }
                .ignoresSafeArea(.all, edges: .bottom)
                
            })
            .listStyle(.inset)
            .navigationTitle("Lista de criptomonedas")
            .padding(.horizontal, 10)
        })
        .onAppear(perform: {
            viewModel.fetchCryptoList()
        })
    }
}

#Preview {
    CryptoListFactory.createCryptoList()
}

struct CryptoDetailHome: View {
    
    var crypto: DisplayCrypto
    
    var body: some View {
        HStack {
            Text(crypto.symbol)
                .font(.system(size: 20))
                .bold()
                .textCase(.uppercase)
            Spacer()
            VStack {
                Text(crypto.currentPrice)
                    .font(.system(size: 15))
                    .bold()
                Text("$\(crypto.currentPrice)")
                    .font(.system(size: 10))
                    .opacity(0.7)
            }
            
            Text("\(crypto.priceChangePercentage24H)%")
                .font(.system(size: 18))
                .bold()
                .foregroundStyle(Color.white)
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background(crypto.colorPriceChangePercentage24H == .positive ? Color.green : Color.red)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        
    }
}
