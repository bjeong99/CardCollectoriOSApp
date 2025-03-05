//
//  CardEndpoint.swift
//  CardCollector
//
//  Created by Brian Jeong on 3/4/25.
//

import Foundation

// frozen annotation does ...

/// Represents unique API endpoints
@frozen enum CardEndpoint: String {
    /// Endpoint to get card data
    case cards
    /// Endpoint to get sets
    case sets
}
