//
//  SegPicker.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 14.04.2024.
//

import SwiftUI

struct SegPicker: View {
    @Binding var selectedPage : analyticsPages
    var body: some View {
        GeometryReader{ geo in
            HStack(spacing: 0){
                ForEach(analyticsPages.allCases, id: \.self){page in
                    Button(action: {
                        selectedPage = page
                    }, label: {
                        Text(page.rawValue)
                            .foregroundColor(page == selectedPage ? Color("#222222") : Color("#929D9E"))
                            .font(.system(size: 16))
                            .fontWeight(page == selectedPage ? .semibold : .regular)
                            .frame(width: geo.size.width/2, height: 40)
                            .background{
                                RoundedRectangle(cornerRadius: 10).fill(page == selectedPage ? Color("#FDDA27") : Color("#212331"))
                            }
                    })
                }
            }
            .animation(.smooth(duration: 0.7), value: selectedPage)
            .background {
                RoundedRectangle(cornerRadius: 12).fill(Color("#212331"))
            }
        }
        
    }
}
