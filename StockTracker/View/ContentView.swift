//
//  ContentView.swift
//  StockTracker
//
//  Created by Adi Mizrahi on 02/11/2025.
//

import SwiftUI

struct ContentView: View {
    // Hold onto the reference so it lives for the app session
    @State private var stock = Stock(symbol: "AAPL", price: 189.10)
    private let service = StockService()

    var body: some View {
        NavigationStack {
            StockView(stock: stock)
                .navigationTitle("Stocks")
                .task {
                    // Start mutating, UI will follow because it reads stock.price
                    await service.startTicking(stock)
                }
        }
    }
}
