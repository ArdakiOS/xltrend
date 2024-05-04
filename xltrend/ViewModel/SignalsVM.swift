//
//  SignalsVM.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 14.04.2024.
//

import Foundation

class SignalsVM : ObservableObject {
    @Published var freeSignals : [SignalModel] = []
    @Published var hotSignal : HotSignalModel?
    
    var pairs = ["AUD/CHF", "AUD/JPY", "AUD/USD", "CAD/CHF", "CAD/JPY", "EUR/CAD", "EUR/CHF", "EUR/JPY", "EUR/GBP", "EUR/USD","GBP/AUD", "GBP/CHF", "GBP/JPY", "GBP/USD", "USD/CAD", "USD/CHF", "USD/JPY"]
    var usedInFree : [String] = []
    
    init(){
        createFreeSignal()
    }
    
    func createFreeSignal() {
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd MMMM" // Specify the format you want
            return formatter
        }()
        
        let currentDate = Date()
        let dateString = dateFormatter.string(from: currentDate)
        
        if let today = UserDefaults.standard.data(forKey: dateString){
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([SignalModel].self, from: today)
                DispatchQueue.main.async{
                    self.freeSignals = decodedData
                }
            }
            catch{
                
            }
        }
        else{
            for _ in 1...3 {
                pairs.append(contentsOf: usedInFree)
                let random = Int.random(in: 0...pairs.count-1)
                let pair = pairs.remove(at: random)
                let randHour = Int.random(in: 0...24)
                let randMin = Int.random(in: 0...60)
                var stringHour = ""
                var stringMin = ""
                if randHour <= 9 {
                    stringHour = "0" + String(randHour)
                }
                else {
                    stringHour = String(randHour)
                }
                
                if randMin <= 9 {
                    stringMin = "0" + String(randMin)
                }
                else {
                    stringMin = String(randMin)
                }
                
                let finalTime = stringHour + ":" + stringMin
                usedInFree.append(pair)
                let randBuy = Bool.random()
                let entry = SignalModel(img: pair.replacingOccurrences(of: "/", with: ""), name: pair, time: finalTime, buy: randBuy)
                freeSignals.append(entry)
            }
            
            do{
                let encoder = JSONEncoder()
                let encodedData = try encoder.encode(freeSignals)
                UserDefaults.standard.setValue(encodedData, forKey: dateString)
            }
            catch{
                print("ERROR IN ENCODING SIGNALS")
            }
        }
    }
    
    func createHotSignal() {
        let randIdx = Int.random(in: 0...pairs.count - 1)
        
        let timeFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter
        }()
        
        let currentDate = Date()
        let randTime = Int.random(in: 3...5)
        let futureDate = Calendar.current.date(byAdding: .minute, value: randTime, to: currentDate)!
        let futureTimeString = timeFormatter.string(from: futureDate)
        
        let entry = HotSignalModel(img: pairs[randIdx].replacingOccurrences(of: "/", with: ""), name: pairs[randIdx], time: futureTimeString, buy: Bool.random(), timeRemaining: Double(randTime * 60))
        
        self.hotSignal = entry
        
    }
}
