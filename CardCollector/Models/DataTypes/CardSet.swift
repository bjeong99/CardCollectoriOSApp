//
//  CardSet.swift
//  CardCollector
//
//  Created by Brian Jeong on 3/4/25.
//

import Foundation

struct CardSet: Codable {
    let id: String
    let name: String
    let series: String
    let printedTotal: Int
    let total: Int
    let legalities: CardSetLegality?
    let ptcgoCode: String?
    let releaseDate: String
    let updatedAt: String
    let images: CardSetImage
}
