//
//  NavTabBar.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 15.04.2024.
//

import SwiftUI

struct NavTabBar: View {
    @Binding var selected : NavTabs
    var body: some View {
        VStack(spacing: 0){
            Rectangle()
                .fill(Color("#3C3C435C"))
                .frame(height: 1)
            GeometryReader{ geo in
                HStack(spacing: 0){
                    
                    ForEach(NavTabs.allCases, id: \.self){tab in
                        Button(action: {
                            withAnimation(.bouncy(duration: 0.5)) {
                                selected = tab
                            }
                        }, label: {
                            VStack(spacing : 4){
                                Image(tab.rawValue)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                Text(tab.rawValue)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 12))
                            }
                        })
                        .padding(.top)
                        .foregroundColor(tab == selected ? Color("#FDDA27") : Color("#909198"))
                        .frame(width: geo.size.width/4)
                        
                    }
                }
                .background(
                    Color("#161827")
                )
            }
        }
    }
}
