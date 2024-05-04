//
//  NavView.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 13.04.2024.
//

import SwiftUI

enum NavTabs : String, CaseIterable {
    case home = "Home"
    case signals = "Signals"
    case analytics = "Analytics"
    case settings = "Settings"
}

struct NavView: View {
    @State var selectedPage : NavTabs = .home
    @State var showOnboarding = UserDefaults.standard.object(forKey: "showOnb") as? Bool ?? true
    @StateObject var balanceVM = BalanceVM()
    var body: some View {
        if showOnboarding{
            AllOnboardingViews(showOnboarding: $showOnboarding)
        }
        else{
            ZStack {
                Color("#161827").ignoresSafeArea()
                VStack{
                    switch selectedPage {
                    case .home:
                        HomeView(balance: balanceVM)
                    case .signals:
                        SignalsView(balanceVM: balanceVM)
                    case .analytics:
                        AnalyticsView()
                    case .settings:
                        SettingsView()
                    }
                    NavTabBar(selected: $selectedPage)
                        .frame(height: 90)
                }
                
            }
        }
    }
}

#Preview {
    NavView()
}
