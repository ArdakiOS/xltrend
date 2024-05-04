//
//  SignalModel.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 14.04.2024.
//

import Foundation

struct SignalModel : Hashable, Codable {
    let img : String
    let name : String
    let time : String
    let buy : Bool
}

struct HotSignalModel {
    let img : String
    let name : String
    let time : String
    let buy : Bool
    let timeRemaining : Double
}
