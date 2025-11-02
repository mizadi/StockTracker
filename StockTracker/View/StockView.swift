//
//  StockView.swift
//  StockTracker
//
//  Created by Adi Mizrahi on 02/11/2025.
//


import SwiftUI
import Observation

struct StockView: View {
    // Read access wires observation, no @ObservedObject or @StateObject
    let stock: Stock

    var body: some View {
        VStack(spacing: 24) {
            Text(stock.symbol)
                .font(.largeTitle).bold()

            Text(stock.priceString)
                .font(.system(size: 48, weight: .semibold, design: .rounded))
                .monospacedDigit()

            Text("Updated \(stock.lastUpdated.formatted(date: .omitted, time: .standard))")
                .foregroundStyle(.secondary)

            if let last = stock.history.last {
                Text("Last change: \(String(format: "%.2f", last - (stock.history.dropLast().last ?? last)))")
                    .foregroundStyle(.secondary)
            }

            HStack {
                Button("Buy") { stock.price += 1 }
                Button("Sell") { stock.price = max(0, stock.price - 1) }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
