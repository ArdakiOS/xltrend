//
//  BalanceVM.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 15.04.2024.
//

import Foundation

class BalanceVM : ObservableObject {
    @Published var balance = UserDefaults.standard.integer(forKey: "balance")
    
    func addToBalance() {
        balance += 15
        UserDefaults.standard.setValue(balance, forKey: "balance")
    }
    
    func removeFromBalance() {
        balance -= 5
        UserDefaults.standard.setValue(balance, forKey: "balance")
    }
    
    func buySignal() {
        balance -= 3
        UserDefaults.standard.setValue(balance, forKey: "balance")
    }
}
