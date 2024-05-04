//
//  AnalyticsVM.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 14.04.2024.
//

import Foundation

class AnalyticsVM : ObservableObject {
    @Published var table : [[String]] = []
    
    let currencyX = ["EUR", "USD", "AUD", "GBP", "NZD", "CAD", "CHF", "JPY"]
    let isHeatmap : Bool
    
    init(isHeatmap: Bool) {
        self.isHeatmap = isHeatmap
        if isHeatmap{
            generateCurrencyMatrix(currencies: currencyX)
            startTimer()
        }
        else{
            generatePricesMatrix(currencies: currencyX)
            startPricesTimer()
        }
    }

    
    func generatePricesMatrix(currencies: [String], range: ClosedRange<Double> = 0.5...2){
        var matrix: [[String]] = [ [""] + currencies ] // Header row
        
        for i in 0..<currencies.count {
            var row: [String] = [currencies[i]] // Start each row with the currency code
            
            for j in 0..<currencies.count {
                if i == j {
                    row.append("") // Empty string for diagonal
                } else {
                    let randomValue = Double.random(in: range)
                    row.append(String(format: "%.4f", randomValue))
                }
            }
            
            matrix.append(row) // Add the completed row to the matrix
        }
        
        table = matrix
    }
    
    func generateCurrencyMatrix(currencies: [String], range: ClosedRange<Double> = -0.65...0.65){
        var matrix: [[String]] = [ [""] + currencies ] // Header row
        
        for i in 0..<currencies.count {
            var row: [String] = [currencies[i]] // Start each row with the currency code
            
            for j in 0..<currencies.count {
                if i == j {
                    row.append("") // Empty string for diagonal
                } else {
                    let randomValue = Double.random(in: range)
                    row.append(String(format: "%.2f", randomValue))
                }
            }
            
            matrix.append(row) // Add the completed row to the matrix
        }
        
        table = matrix
    }
    
    func changeCell() {
        let randX = Int.random(in: 1...4)
        let randY = Int.random(in: 1...8)
        if randX != randY{
            table[randX][randY] = String(format: "%.2f", Double.random(in: -0.65...0.65))
        }
        
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
                self?.changeCell()
            }
        }
    
    func changePricesCell() {
        let randX = Int.random(in: 1...4)
        let randY = Int.random(in: 1...8)
        if randX != randY{
            table[randX][randY] = String(format: "%.4f", Double.random(in: 0.5001...2.0001))
        }
        
    }
    
    private func startPricesTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
                self?.changePricesCell()
            }
        }
}
