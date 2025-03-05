//
//  CardAttacks.swift
//  CardCollector
//
//  Created by Brian Jeong on 3/4/25.
//

import Foundation

struct CardAttack: Codable {
    let name: String
    let cost: [String]
    let convertedEnergyCost: Int
    let damage: String
    let text: String
}
