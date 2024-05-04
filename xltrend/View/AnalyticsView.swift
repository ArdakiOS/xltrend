//
//  AnalyticsView.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 14.04.2024.
//

import SwiftUI

enum analyticsPages : String, CaseIterable{
    case heatmap = "Heatmap"
    case prices = "Prices"
}

struct AnalyticsView: View {
    @State var curPage = analyticsPages.heatmap
    var body: some View {
        ZStack{
            Color("#161827").ignoresSafeArea()
            VStack{
                Text("Analytics")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                Rectangle()
                    .fill(Color("#3C3C435C"))
                    .frame(height: 2)
                    .padding(.bottom)
                
                SegPicker(selectedPage: $curPage)
                    .frame(width: 351, height: 40)
                    .padding(.bottom, 30)
                switch curPage {
                case .heatmap:
                    HeatMapTable()
                case .prices:
                    PricesTable()
                }
                
                Spacer()
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    AnalyticsView()
}
