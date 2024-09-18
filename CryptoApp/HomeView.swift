//
//  HomeView.swift
//  CryptoApp
//
//  Created by Rodrigo Adauto Ortiz on 12/05/24.
//

import SwiftUI

enum Categories: String, Identifiable, CaseIterable {
    case Favorite = "Favoritos", Popular = "Populares",
         Winner = "Ganadores", Losser = "Perdedores",
         New = "Nuevo"
    var id: Self { self }
}

struct HomeView: View {
    @State private var selectedCategory = "Favoritos"
    @State private var searchText: String = .empty
    
    var body: some View {
        TabView {
            VStack {
                ToolBar(searchText: $searchText)
                    .padding(.bottom, 20)
                BalanceHomeView()
                Picker("Categories", selection: $selectedCategory) {
                    ForEach(Categories.allCases) { category in
                        Text(category.rawValue).tag(category.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: .infinity, alignment: .center)
                if selectedCategory == "Favoritos" {
                    CryptoListFactory.createCryptoList()
                        .frame(width: .infinity, height: 500)
                        .scrollDisabled(true)
                }
                Button("Ver más") {
                    print("action button")
                }
                .foregroundStyle(.yellow)
                .bold()
                Spacer()
            }
            .tabItem { Text("Principal") }
            .padding()
            
            Text("aASDAS")
                .tabItem {
                    Text("Mercados")
                }
            
            Text("Testing")
                .tabItem {
                    Text("Operaciones")
                }
            
            Text("Testing")
                .tabItem {
                    Text("Futuros")
                }
            
            Text("Testing")
                .tabItem {
                    Text("Billetera")
                }
        }
        
    }
}

struct BalanceHomeView: View {
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Saldo total(USD)")
                    .font(.subheadline)
                Text("$4.32")
                    .font(.title2)
            }
            Spacer()
            Button {
                print("Button pressed")
            } label: {
                Text("Depositar")
                    .padding(.vertical,10)
                    .padding(.horizontal, 20)
                    .frame(alignment: .center)
                    .foregroundStyle(Color.black)
            }
            .background(Color.yellow)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        
    }
}


struct ToolBar: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "globe.central.south.asia.fill")
                .foregroundStyle(Color.green)
            TextField("Buscador", text: $searchText)
                .padding(7)
                .padding(.horizontal, 30)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(alignment: .leading) {
                    Image(systemName: "magnifyingglass")
                        .padding(.leading, 10)
                        .foregroundStyle(Color(.systemGray2))
                        .frame(minWidth: .zero, maxWidth: .infinity,
                               alignment: .leading)
                }
            
            Button(action: {
                
            }) {
                Image("qr", bundle: nil)
                    .resizable()
                    .foregroundColor(.gray)
                    .imageScale(.medium)
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundStyle(Color.gray)
            }
            
            Button(action: {
                
            }) {
                Image(systemName: "gearshape.fill")
                    .foregroundStyle(Color.gray)
                    .imageScale(.medium)
            }
            
            Button(action: {
                
            }) {
                Image(systemName: "bell.fill")
                    .foregroundStyle(Color.gray)
                    .imageScale(.medium)
            }
            
            Button(action: {
                
            }) {
                Image(systemName: "person.crop.circle")
                    .foregroundStyle(Color.gray)
                    .imageScale(.medium)
            }
        }
        
    }
}


#Preview {
    HomeView()
}
