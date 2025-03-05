//
//  CardTCGPlayer.swift
//  CardCollector
//
//  Created by Brian Jeong on 3/4/25.
//

import Foundation

struct CardTCGPlayer: Codable {
    let url: String
    let updatedAt: String
    let prices: CardPrice
}
