//
//  AllOnboarding.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 14.04.2024.
//

import SwiftUI

enum myTabs : CaseIterable {
    case one
    case two
    case three
    case four
    case five

}

struct AllOnboardingViews: View {
    @State var currentTab : myTabs = .one
    @Binding var showOnboarding : Bool
    var body: some View {
        ZStack{
            Color.init("#18171F").ignoresSafeArea()
            switch currentTab {
            case .one:
                OnBoarding1(currentPage: $currentTab)
                    .transition(.move(edge: .trailing))
            case .two:
                OnBoarding2(currentPage: $currentTab)
                    .transition(.move(edge: .trailing))
            case .three:
                OnBoarding3(currentPage: $currentTab)
                    .transition(.move(edge: .trailing))
            case .four:
                OnBoarding4(currentPage: $currentTab)
                    .transition(.move(edge: .trailing))
            case .five:
                OnBoarding5(showOnb: $showOnboarding)
                    .transition(.move(edge: .trailing))
            }
        }
        .animation(.bouncy(duration: 0.4), value: currentTab)
    }
}
