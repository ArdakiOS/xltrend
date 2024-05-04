//
//  HomeView.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 14.04.2024.
//

import SwiftUI

enum homeViewPages {
    case main, lvl1, lvl2, lvl3, lvl4
}

struct HomeView: View {
    @StateObject var vm = HomeVM()
    @ObservedObject var balance : BalanceVM
    @State var showQuestion = false
    @State var curLVL = 0
    
    @State var selectedAns : Bool?
    @State var correctAnsCount = 0
    @State var isFinish = false
    @State var isLeaving = false
    var body: some View {
        ZStack{
            Color("#161827").ignoresSafeArea()
            if !showQuestion{
                VStack{
                    Text("Trend prediction")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    Rectangle()
                        .fill(Color("#3C3C435C"))
                        .frame(height: 2)
                    
                    
                    Image("Trend")
                        .resizable()
                        .frame(width: 343, height: 240)
                        .padding(.vertical)
                    
                    Text("Read the situations and predict the price movements.")
                        .frame(width: 343)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    Button {
                        curLVL = 0
                        showQuestion = true
                    } label: {
                        HomeViewButton(lvl: 1, prg: vm.lvls[0].correctAnsNum, canStart: true)
                    }
                    
                    Button {
                        curLVL = 1
                        showQuestion = true
                    } label: {
                        HomeViewButton(lvl: 2, prg: vm.lvls[1].correctAnsNum, canStart: vm.lvls[0].correctAnsNum == 5)
                    }
                    .disabled(vm.lvls[0].correctAnsNum != 5)
                    
                    Button {
                        curLVL = 2
                        showQuestion = true
                    } label: {
                        HomeViewButton(lvl: 3, prg: vm.lvls[2].correctAnsNum, canStart: vm.lvls[1].correctAnsNum == 5)
                    }
                    .disabled(vm.lvls[1].correctAnsNum != 5)
                    
                    Button {
                         curLVL = 3
                        showQuestion = true
                    } label: {
                        HomeViewButton(lvl: 4, prg: vm.lvls[3].correctAnsNum, canStart: vm.lvls[2].correctAnsNum == 5)
                    }
                    .disabled(vm.lvls[2].correctAnsNum != 5)
                    Spacer()
                    
                    
                }
                .foregroundStyle(.white)
            }
            else{
                if isFinish{
                    VStack{
                        Text("Result")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                        Rectangle()
                            .fill(Color("#3C3C435C"))
                            .frame(height: 2)
                            .padding(.bottom)
                        
                        Spacer()
                        
                        Text("Perfect!")
                            .font(.system(size: 36))
                            .fontWeight(.bold)
                        
                        ZStack{
                            Ellipse()
                                .fill(Color("#FDDA27"))
                                .blur(radius: 38)
                                .opacity(0.25)
                            Image("Onb5")
                                .resizable()
                        }
                        .frame(width: 145, height: 161)
                        
                        Text("Your result \(correctAnsCount)/5")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button {
                            vm.lvls[curLVL].prg = 0
                            vm.change(idx: curLVL, correctAns: correctAnsCount)
                            correctAnsCount = 0
                            isFinish = false
                        } label: {
                            Text("Retry")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                                .frame(width: 343, height: 53)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("#FDDA27"))
                                )
                        }
                        
                        Button {
                            vm.change(idx: curLVL, correctAns: correctAnsCount)
                            isFinish = false
                            showQuestion = false
                        } label: {
                            Text("Next")
                                .foregroundStyle(.black)
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                                .frame(width: 343, height: 53)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color("#FDDA27"))
                                )
                        }

                        
                    }
                    .foregroundStyle(.white)
                }
                else{
                    VStack(spacing: 20){
                        ZStack(){
                            Text("Situation")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .padding(.leading, 25)
                            Button {
                                isLeaving = true
                            } label: {
                                Text("Back")
                            }
                            .frame(width: 343, alignment: .trailing)

                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        Rectangle()
                            .fill(Color("#3C3C435C"))
                            .frame(height: 2)
                            .padding(.bottom)
                        
                        HStack(spacing: 0){
                            Text("Balance:")
                                .foregroundStyle(Color("#A5ADC2"))
                            Text("\(balance.balance)XP")
                                .foregroundStyle(.white)
                        }
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .frame(width: 343, height: 45)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("#3C3C435C"))
                        )
                        
                        Text("Lvl \(curLVL + 1) Situation \(vm.lvls[curLVL].prg + 1)/5")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                        
                        VStack{
                            Text(vm.lvls[curLVL].texts[vm.lvls[curLVL].prg])
                                .font(.system(size: 16))
                                .frame(width: 343)
                                .multilineTextAlignment(.center)
                            
                            Text(vm.lvls[curLVL].qtexts[vm.lvls[curLVL].prg])
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            
                            if selectedAns != nil {
                                Image(vm.lvls[curLVL].answers[vm.lvls[curLVL].prg])
                                    .resizable()
                                    .frame(width: 343, height: 240)
                            }
                            else{
                                Image(vm.lvls[curLVL].questions[vm.lvls[curLVL].prg])
                                    .resizable()
                                    .frame(width: 343, height: 240)
                            }
                            Spacer()
                        }
                        .frame(height: 372)
                        
                        VStack{
                            if selectedAns == vm.lvls[curLVL].up[vm.lvls[curLVL].prg]{
                                Text("+15 XP")
                                    .foregroundStyle(.green)
                            }
                            else{
                                Text("-5 XP")
                                    .foregroundStyle(.red)
                            }
                            
                        }
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .opacity(selectedAns == nil ? 0 : 1)
                        .padding(.vertical)
                        
                        
                        HStack{
                            Button {
                                selectedAns = false
                                if selectedAns == vm.lvls[curLVL].up[vm.lvls[curLVL].prg] {
                                    balance.addToBalance()
                                    correctAnsCount += 1
                                }
                                else{
                                    if balance.balance >= 5{
                                        balance.removeFromBalance()
                                    }
                                }
                                if vm.lvls[curLVL].prg + 1 <= vm.lvls.count{
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                                        vm.lvls[curLVL].prg += 1
                                        selectedAns = nil
                                    }
                                }
                                else {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                                        isFinish = true
                                        selectedAns = nil
                                    }
                                }
                            } label: {
                                HStack{
                                    Image(systemName: "arrow.down.circle")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                    Text("Sell")
                                }
                                .frame(width: 165, height: 53)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color("#FF262C"))
                                )
                                .font(.system(size: 16))
                                .fontWeight(.medium)
                            }
                            
                            Button {
                                selectedAns = true
                                if selectedAns == vm.lvls[curLVL].up[vm.lvls[curLVL].prg] {
                                    balance.addToBalance()
                                    correctAnsCount += 1
                                }
                                else{
                                    if balance.balance >= 5{
                                        balance.removeFromBalance()
                                    }
                                }
                                if vm.lvls[curLVL].prg + 1 <= vm.lvls.count{
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                                        vm.lvls[curLVL].prg += 1
                                        selectedAns = nil
                                    }
                                }
                                else {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                                        isFinish = true
                                        selectedAns = nil
                                    }
                                }
                            } label: {
                                HStack{
                                    Image(systemName: "arrow.up.circle")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                    Text("Buy")
                                }
                                .frame(width: 165, height: 53)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color("#00A94E"))
                                )
                                .font(.system(size: 16))
                                .fontWeight(.medium)
                            }
                            
                        }
                        Spacer()
                    }
                    .foregroundStyle(.white)
                }
            }
            
            if isLeaving{
                Color.black.ignoresSafeArea().opacity(0.25)
                
                VStack{
                    Text("You really want to out?")
                        .frame(width: 150)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    HStack{
                        Button {
                            vm.change(idx: curLVL, correctAns: correctAnsCount)
                            showQuestion = false
                            isLeaving = false
                            correctAnsCount = 0
                            selectedAns = nil
                        } label: {
                            Text("Yes")
                                .frame(width: 148, height: 37)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color("#909198"))
                                )
                        }
                        
                        Button {
                            isLeaving = false
                        } label: {
                            Text("Stay")
                                .foregroundStyle(.black)
                                .frame(width: 148, height: 37)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color("#FDDA27"))
                                )
                        }

                    }
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                }
                .foregroundStyle(.white)
                .frame(width: 343, height: 179)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color("#161827"))
                )
                
            }
        }
        .animation(.easeInOut(duration: 0.4), value: showQuestion)
        .animation(.easeInOut(duration: 0.4), value: isFinish)
        .animation(.easeInOut(duration: 0.4), value: isLeaving)
        .animation(.easeInOut(duration: 0.4), value: vm.lvls[curLVL].prg)
    }
}

#Preview {
    NavView(selectedPage: .home)
}


struct HomeViewButton : View {
    let lvl : Int
    let prg : Int
    let canStart : Bool
    var body: some View {
        HStack{
            
            Text("Lvl \(lvl)")
            Spacer()
            if canStart{
                Text("\(prg)/5 questions")
            }
            else{
                Image("Lock")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            Spacer()
            Image(systemName: "chevron.right")
                
        }
        .padding(.horizontal)
        .frame(width: 343, height: 60)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(prg == 5 ? Color("#00A94E") : Color("#212331")))
    }
}

