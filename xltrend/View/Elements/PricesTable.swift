//
//  PricesTable.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 14.04.2024.
//

import SwiftUI

struct PricesTable: View {
    @StateObject var tableVM = AnalyticsVM(isHeatmap: false)
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<tableVM.table.count, id: \.self) { rowIndex in
                HStack(spacing: 0) {
                    ForEach(0..<tableVM.table[rowIndex].count/2 + 1, id: \.self) { columnIndex in
                        PricesTableCell(rowIdx: rowIndex, colIdx: columnIndex, text: tableVM)
                    }
                }
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(Color("#120D20"), lineWidth: 1)
        )
        
    }
}
