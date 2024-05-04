//
//  ContentView.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 13.04.2024.
//

import SwiftUI

struct EntryView: View {
    @State var rot : Double = 0
    var body: some View {
        if rot < 480 {
            LoadView(rot: $rot)
        }
        else{
            NavView()
        }
    }
}

#Preview {
    EntryView()
}
