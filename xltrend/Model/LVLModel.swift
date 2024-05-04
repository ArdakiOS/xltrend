//
//  File.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 14.04.2024.
//

import Foundation

struct LVLModel : Codable {
    var prg : Int
    var correctAnsNum : Int
    let questions : [String]
    let answers : [String]
    let texts : [String]
    let qtexts : [String]
    let up : [Bool]
}
