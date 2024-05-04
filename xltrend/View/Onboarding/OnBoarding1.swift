//
//  OnBoarding1.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 14.04.2024.
//

import SwiftUI


struct OnBoarding1: View {
    @Binding var currentPage : myTabs
    var body: some View {
        ZStack{
            Color("#18171F").ignoresSafeArea()
            VStack(spacing: 0){
                Text("Welcome!")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .frame(width: 343, alignment: .center)
                    .padding(.bottom, 8)
                
                Spacer()
                
                Text("Our application will introduce you to\nthe market, suitable for both\nbeginners and experienced traders")
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                    .fontWeight(.semibold)
                    .frame(width: 343, alignment: .center)
                
                
                
                
                Spacer()
                Image("Onb1")
                    .resizable()
                    .frame(width: 363, height: 280)
                    .padding(.leading)
                
                Spacer()
                
                Text("Let's introduce you\nto the functionality, you will like it!")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    ATTObserver().requestTrackingAuthorization{
                        currentPage = .two
                    }
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

