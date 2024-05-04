//
//  OnBoarding3.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 14.04.2024.
//

import SwiftUI

struct OnBoarding3: View {
    @Binding var currentPage : myTabs
    var body: some View {
        ZStack{
            Color("#18171F").ignoresSafeArea()
            VStack(spacing: 0){
                Text("Game")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .frame(width: 343, alignment: .center)
                
                Spacer()
                ZStack{
                    Ellipse()
                        .fill(Color("#FDDA27"))
                        .blur(radius: 38)
                        .opacity(0.25)
                    Image("Onb3")
                        .resizable()
                }
                .frame(width: 343, height: 390)
                Spacer()
                
                Text("Our mini-game in the app will help you train your sense of foresight")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .frame(width: 343)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    currentPage = .four
                }, label: {
                    Text("Continue")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(maxWidth: 343, maxHeight: 53)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("#FDDA27"))
                        }
                })
                
            }
            .padding(.vertical)
            .foregroundColor(.white)
        }
        
    }
}
