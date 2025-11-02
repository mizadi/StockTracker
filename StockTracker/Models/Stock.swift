//
//  Stock.swift
//  StockTracker
//
//  Created by Adi Mizrahi on 02/11/2025.
//


import Observation
import Foundation

@Observable
final class Stock {
    var symbol: String
    var price: Double
    var lastUpdated: Date = .now

    // Derived value, changes whenever `price` changes
    var priceString: String { String(format: "$%.2f", price) }

    // Ignore fields that should not trigger view updates
    @ObservationIgnored
    private(set) var history: [Double] = []

    init(symbol: String, price: Double) {
        self.symbol = symbol
        self.price = price
    }

    func record() {
        history.append(price)
        lastUpdated = .now
    }
}
