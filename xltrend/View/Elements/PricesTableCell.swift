//
//  PricesTableCell.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 14.04.2024.
//

import SwiftUI

struct PricesTableCell: View {
    @State var rowIdx : Int
    @State var colIdx : Int
    @ObservedObject var text : AnalyticsVM
    var body: some View {
        if rowIdx == 0 && colIdx == 0 {
            Text(text.table[rowIdx][colIdx])
                .font(.system(size: 12))
                .frame(width: 70, height: 36, alignment: .center)
                .background(
                    ZStack{
                        Rectangle()
                            .fill(Color("#212331")).cornerRadius(10, corners: .topLeft)
                        
                    }
                )
        }
        else if rowIdx == 0 && colIdx == 4 {
            HStack{
                Image(text.table[rowIdx][colIdx])
                    .resizable()
                    .frame(width: 12, height: 12)
                Text(text.table[rowIdx][colIdx])
                    .font(.system(size: 12))
                
            }
            .frame(width: 70, height: 36, alignment: .center)
            .background(
                ZStack{
                    Rectangle()
                        .fill(Color("#212331")).cornerRadius(10, corners: .topLeft)
                    
                }
            )
        }
        else if rowIdx == 8 && colIdx == 0 {
            HStack{
                Image(text.table[rowIdx][colIdx])
                    .resizable()
                    .frame(width: 12, height: 12)
                Text(text.table[rowIdx][colIdx])
                    .font(.system(size: 12))
                
            }
            .frame(width: 70, height: 36, alignment: .center)
            .background(
                ZStack{
                    Rectangle()
                        .fill(Color("#212331")).cornerRadius(10, corners: .bottomLeft)
                }
            )
        }
        else if rowIdx == 8 && colIdx == 4 {
            Text("\(text.table[rowIdx][colIdx])")
                .font(.system(size: 12))
                .frame(width: 70, height: 36, alignment: .center)
                .background(
                    ZStack{
                        Rectangle()
                            .fill(Color("#212331"))
                        
                        
                    }
                        .cornerRadius(10, corners: .bottomRight)
                )
            
            
        }
        else {
            if Double(text.table[rowIdx][colIdx]) != nil {
                Text("\(text.table[rowIdx][colIdx])")
                    .font(.system(size: 12))
                    .fontWeight(.semibold)
                    .frame(width: 70, height: 36, alignment: .center)
                    .background(
                        ZStack{
                            
                            Rectangle()
                                .fill(Color("#212331"))
                            
                            
                            Rectangle()
                                .stroke(Color("#120D20"), lineWidth: 1)
                        }
                        
                    )
            }
            else {
                HStack{
                    Image(text.table[rowIdx][colIdx])
                        .resizable()
                        .frame(width: 12, height: 12)
                    Text(text.table[rowIdx][colIdx])
                        .font(.system(size: 12))
                    
                }
                .frame(width: 70, height: 36, alignment: .center)
                .background(
                    ZStack{
                        Rectangle()
                            .fill(Color("#212331"))
                        Rectangle()
                            .stroke(Color("#120D20"), lineWidth: 1)
                    }
                    
                )
            }
        }
    }
}
