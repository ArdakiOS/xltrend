//
//  TableCell.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 14.04.2024.
//

import SwiftUI

struct TableCell: View {
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
            Text("\(text.table[rowIdx][colIdx])%")
                .font(.system(size: 12))
                .frame(width: 70, height: 36, alignment: .center)
                .background(
                    ZStack{
                        if let ad = Double(text.table[rowIdx][colIdx]){
                            if ad > 0{
                                Rectangle()
                                    .fill(Color.init(red: 0.15, green: 0.4, blue: 0.29))
                            }
                            else if ad > 0.4 {
                                Rectangle()
                                    .fill(Color.init(red: 0.21, green: 0.71, blue: 0.47))
                            }
                            else if ad < 0{
                                Rectangle()
                                    .fill(Color.init(red: 0.44, green: 0.24, blue: 0.24))
                            }
                            
                            else if ad < -0.4 {
                                Rectangle()
                                    .fill(Color.init(red: 0.79, green: 0.38, blue: 0.38))
                            }
                        }
                        else {
                            Rectangle()
                                .fill(Color.init(red: 0.09, green: 0.09, blue: 0.11))
                            
                        }
                    }
                        .cornerRadius(10, corners: .bottomRight)
                )
            
            
        }
        else {
            if Double(text.table[rowIdx][colIdx]) != nil {
                Text("\(text.table[rowIdx][colIdx])%")
                    .font(.system(size: 12))
                    .fontWeight(.semibold)
                    .frame(width: 70, height: 36, alignment: .center)
                    .background(
                        ZStack{
                            if let ad = Double(text.table[rowIdx][colIdx]){
                                if ad > 0{
                                    Rectangle()
                                        .fill(Color.init(red: 0.15, green: 0.4, blue: 0.29))
                                }
                                else if ad > 0.4 {
                                    Rectangle()
                                        .fill(Color.init(red: 0.21, green: 0.71, blue: 0.47))
                                }
                                else if ad < 0{
                                    Rectangle()
                                        .fill(Color.init(red: 0.44, green: 0.24, blue: 0.24))
                                }
                                
                                else if ad < -0.4 {
                                    Rectangle()
                                        .fill(Color.init(red: 0.79, green: 0.38, blue: 0.38))
                                }
                            }
                            else {
                                Rectangle()
                                    .fill(Color.init(red: 0.09, green: 0.09, blue: 0.11))
                                
                            }
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
