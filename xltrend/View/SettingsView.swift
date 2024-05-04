//
//  SettingsView.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 14.04.2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack{
            Color("#161827").ignoresSafeArea()
            VStack(alignment: .center){
                Text("Settings")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                Rectangle()
                    .fill(Color("#3C3C435C"))
                    .frame(height: 2)
                    .padding(.bottom)
                
                Button {
                    //
                } label: {
                    SettingsButton(img: "Prv", text: "Privacy Policy")
                }
                
                Button {
                    //
                } label: {
                    SettingsButton(img: "Sup", text: "Support")
                }

                Spacer()
            }
            
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    SettingsView()
}


struct SettingsButton: View {
    let img : String
    let text : String
    var body: some View {
        HStack{
            Image(img)
                .resizable()
                .frame(width: 24, height: 24)
            Text(text)
                .font(.system(size: 16))
                
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(.horizontal)
        .frame(width: 343, height: 48)
        .background(
            RoundedRectangle(cornerRadius: 10).fill(Color("#212331"))
        )
    }
}
