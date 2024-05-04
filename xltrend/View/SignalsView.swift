//
//  SignalsView.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 14.04.2024.
//

import SwiftUI

struct SignalsView: View {
    @StateObject var vm = SignalsVM()
    @ObservedObject var balanceVM : BalanceVM
    @State var boughtSignal = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timePassed : Double = 0
    @State var percent : Double = 0
    var body: some View {
        ZStack{
            Color("#161827").ignoresSafeArea()
            VStack{
                Text("Signals")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                Rectangle()
                    .fill(Color("#3C3C435C"))
                    .frame(height: 2)
                    .padding(.bottom)
                HStack(spacing: 0){
                    Text("Balance: ")
                        .foregroundStyle(Color("#A5ADC2"))
                    Text("\(balanceVM.balance)XP")
                        .foregroundStyle(.white)
                }
                .font(.system(size: 16))
                .fontWeight(.bold)
                .frame(width: 343, height: 45)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("#3C3C435C"))
                )
                
                Spacer()
                
                if boughtSignal {
                    if vm.hotSignal != nil{
                        VStack{
                            HStack{
                                Image(vm.hotSignal!.img)
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                Spacer()
                                Text(vm.hotSignal!.name)
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                Spacer()
                                Text(vm.hotSignal!.time)
                                    .font(.system(size: 14))
                                Spacer()
                                if vm.hotSignal!.buy {
                                    HStack(spacing: 5){
                                        Image(systemName: "arrow.up.circle")
                                        Text("Buy")
                                    }
                                    .foregroundStyle(.green)
                                    .font(.system(size: 16))
                                }
                                else {
                                    HStack(spacing: 5){
                                        Image(systemName: "arrow.down.circle")
                                        Text("Sell")
                                    }
                                    .foregroundStyle(.red)
                                    .font(.system(size: 16))
                                }
                                
                            }
                            .padding(.horizontal)
                            .frame(width: 311, height: 52)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color("#212331"))
                            )
                            ZStack(alignment: .trailing){
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.white)
                                    .frame(width: 311, height: 4)
                                ZStack(alignment: .leading){
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color("#FF262C"))
                                        .frame(width: 311 * CGFloat(timePassed / vm.hotSignal!.timeRemaining), height: 4)
                                    ZStack{
                                        Circle()
                                            .fill(Color("#FF262C"))
                                            .frame(width: 16, height: 16)
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 4)
                                    }
                                }
                                
                            }
                            .onReceive(timer, perform: { _ in
                                timePassed -= 1
                            })
                            
                            Button {
                                boughtSignal = false
                                vm.hotSignal = nil
                            } label: {
                                Text("Back")
                                    .foregroundStyle(Color("#222222"))
                                    .frame(width: 311, height: 46)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color("#FDDA27"))
                                    )
                            }
                            
                        }
                        .frame(width: 343, height: 168)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("#FDDA27"))
                        )
                    }
                }
                else{
                    VStack{
                        Text("We give you 3 free signals daily, but you can also spend your earned points in the game on a HOT signal")
                            .frame(width: 311, height: 66)
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                        Button {
                            vm.createHotSignal()
                            balanceVM.buySignal()
                            timePassed = vm.hotSignal!.timeRemaining
                            boughtSignal = true
                            
                        } label: {
                            Text("HOT Signal - 3")
                                .foregroundStyle(Color("#222222"))
                                .frame(width: 311, height: 46)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color("#FDDA27"))
                                )
                        }
                        .disabled(balanceVM.balance < 3)

                    }
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .frame(width: 343, height: 168)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("#FDDA27"), lineWidth: 1)
                    )
                }
                
                Spacer()
                
                VStack{
                    Text("Free signals")
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                    
                    FreeSignals(vm: vm)
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 251)
                .background(
                    ZStack(alignment: .top){
                        Rectangle()
                            .fill(Color("#212331")).ignoresSafeArea()
                            .offset(y: 30)
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color("#212331"))
                    }
                )
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    NavView(selectedPage: .signals)
}

struct FreeSignals : View {
    @ObservedObject var vm : SignalsVM
    var body: some View {
        ForEach(vm.freeSignals, id: \.self) { sig in
            HStack{
                Image(sig.img)
                    .resizable()
                    .frame(width: 32, height: 32)
                Spacer()
                Text(sig.name)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                Spacer()
                Text(sig.time)
                    .font(.system(size: 14))
                Spacer()
                if sig.buy {
                    HStack(spacing: 5){
                        Image(systemName: "arrow.up.circle")
                        Text("Buy")
                    }
                    .foregroundStyle(.green)
                    .font(.system(size: 16))
                }
                else {
                    HStack(spacing: 5){
                        Image(systemName: "arrow.down.circle")
                        Text("Sell")
                    }
                    .foregroundStyle(.red)
                    .font(.system(size: 16))
                }
                
            }
            .padding(.horizontal)
            .frame(width: 343, height: 52)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("#FDDA27"), lineWidth: 1)
            )
        }
        
    }
}
