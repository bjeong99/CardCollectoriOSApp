//
//  CardPrice.swift
//  CardCollector
//
//  Created by Brian Jeong on 3/4/25.
//

import Foundation

struct CardPrice: Codable {
    let normal: Price
    let holofoil: Price
    let reverseHolofoil: Price
    let _1stEditionHolofoil: Price
    let _1stEditionNormal: Price
}

struct Price: Codable {
    let low: Double
    let mid: Double
    let high: Double
    let market: Double
    let directLow: Double
}
