//
//  LoadView.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 13.04.2024.
//

import SwiftUI

struct LoadView: View {
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    @Binding var rot : Double
    var body: some View {
        ZStack{
            Color("#18171F").ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding(.top, 100)
                Spacer()
                Image("Load")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .rotationEffect(.degrees(rot))
                    .padding(.bottom, 100)
                    
            }
            .onReceive(timer, perform: { _ in
                withAnimation {
                    rot += 10
                }
            })
        }
    }
}
