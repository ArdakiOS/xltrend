//
//  HomeVM.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 14.04.2024.
//

import Foundation

class HomeVM : ObservableObject {
    @Published var lvls : [LVLModel] = [
        LVLModel(
            prg: 0,
            correctAnsNum: 1,
            questions: ["Q1", "Q2", "Q3", "Q4", "Q5"],
            answers: ["A1", "A2", "A3", "A4", "A5"],
            texts: [
                "The trade war between the U.S. and China is escalating. This may lead to a slowdown in the Chinese economy.",
                "The unemployment rate in the US has been falling for several months. The Swiss economy hasn't had any major changes during this time.",
                "Global demand for oil is falling together with its price, but OPEC (the 12 oil-exporting members) decided not to cut production despite the demands of its needier members in order to raise the price.",
                "It's June and the weather forecast predicts a big heat wave in Russia, Ukraine and Kazakhstan for the summer.",
                "New Zealand is struck by a massive earthquake. Many buildings are damaged. The total cost of rebuilding is estimated at US$40 billion (about 20% of New Zealand's GDP)."
            ],
            qtexts: [
                "Will AUD/USD go up or down?",
                "What will happen to USD/CHF rate?",
                "What will happen with USD/RUB rate?",
                "Will wheat commodity price go up or down?",
                "What will happen to USD/NZD rate?"
            ],
            up: [
                true, false, true, true, false
            ]),
        LVLModel(
            prg: 0,
            correctAnsNum: 1,
            questions: ["Q6", "Q7", "Q8", "Q9", "Q10"],
            answers: ["A6", "A7", "A8", "A9", "A10"],
            texts: [
                "Fronterra, the world's largest milk exporter (based in New Zealand) raised its forecast milk payout to New Zealand farmers more than economists expected.",
                "A terrorist group launches a series of coordinated attacks in the US.",
                "The euro rate starts to fall",
                "The Swiss National Bank (SNB) unexpectedly decided to end its three-year policy of fixing the ceiling value of the Swiss franc to the euro at 1.20.",
                "Japanese Prime Minister gets re-elected "
            ],
            qtexts: [
                "What will happen to NZD/USD?",
                "What will happen to EUR/USD rate?",
                "What will happen to Ferrari stock price?",
                "What will happen to EUR/CHF rate?",
                "What will happen to USD/JPY?"
            ],
            up: [
                true, false, false, true, false
            ]),
        LVLModel(
            prg: 0,
            correctAnsNum: 1,
            questions: ["Q11", "Q12", "Q13", "Q14", "Q15"],
            answers: ["A11", "A12", "A13", "A14", "A15"],
            texts: [
                "The Greek prime minister surprises the world by announcing they would hold a referendum on whether to accept a new aid package from the European Union or not.",
                "Oil price falls to a four-year low and is forecasted to stay low or decrease even more.",
                "Gas prices in the US start to rise sharply and increase by 41% in five months.",
                "Wind dries up in the North Sea / Arctic.",
                "U.S. President D. Trump tweeted that trade talks with China were \"moving along nicely\".",
            ],
            qtexts: [
                "What will happen to EUR/USD rate?",
                "What will happen with UK pound / Norwegian krone?",
                "Will the USD/CAD go up or down?",
                "What will happen to Natural gas prices in the UK and Europe?",
                "Will USD/CNY go up or down?",
            ],
            up: [
                false, false, true, true, true
            ]),
        LVLModel(
            prg: 0,
            correctAnsNum: 1,
            questions: ["Q16", "Q17", "Q18", "Q19", "Q20"],
            answers: ["A16", "A17", "A18", "A19", "A20"],
            texts: [
                "Bank of Israel reaches the limit of foreign currency purchase program",
                "UK inflation rate increases ",
                "South African Finance Minister to be arrested for fraud",
                "Industrial production in Sweden has dropped 5% compared to the previous year, according to a new report.",
                "The president of the US promises to boost economy",
            ],
            qtexts: [
                "What will happen to Israeli shekel Vs USD (NIS/USD)?",
                "What will happen to GBP/USD?",
                "What will happen to USD/ZAR?",
                "How will this influence EUR/SEK rate?",
                "What will happen to Malaysian ringgit Vs USD (RM/USD) ?",
            ],
            up: [
                false, false, false, false, false
            ])
    ]
    
    var currentLVLs : [Int] = []
    
    init(){
        getLvls()
    }
    
    func getLvls() {
        if let saved = UserDefaults.standard.data(forKey: "lvls1") {
            do{
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([Int].self, from: saved)
                DispatchQueue.main.async { [self] in
                    for i in lvls.indices {
                        lvls[i].correctAnsNum = decodedData[i]
                        currentLVLs = decodedData
                    }
                }
            }
            catch{
                print("ERROR IN HOMEVM DECODER")
            }
        }
        else {
            currentLVLs = [0, 0, 0, 0]
            do{
                let encoder = JSONEncoder()
                let encodedData = try encoder.encode(currentLVLs)
                UserDefaults.standard.setValue(encodedData, forKey: "lvls1")
            }
            catch {
                print("ERROR IN HOMEVM ENCODER")
            }
        }
    }
    
    func change(idx: Int, correctAns : Int){
        if lvls[idx].correctAnsNum < correctAns{
            lvls[idx].correctAnsNum = correctAns
            currentLVLs[idx] = correctAns
            do{
                let encoder = JSONEncoder()
                let encodedData = try encoder.encode(currentLVLs)
                UserDefaults.standard.setValue(encodedData, forKey: "lvls1")
            }
            catch {
                print("ERROR IN HOMEVM ENCODER")
            }
        }
    }
}






