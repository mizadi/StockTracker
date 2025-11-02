//
//  StockService.swift
//  StockTracker
//
//  Created by Adi Mizrahi on 02/11/2025.
//


import Foundation

@MainActor
final class StockService {
    func startTicking(_ stock: Stock) {
        Task {
            while true {
                try? await Task.sleep(nanoseconds: 1_000_000_000) // 1s
                let delta = Double.random(in: -0.75...0.75)
                stock.price = max(0, stock.price + delta)
                stock.record()
            }
        }
    }
}
