//
//  RMService.swift
//  CardCollector
//
//  Created by Brian Jeong on 3/4/25.
//

import Foundation

/// Primary API service object to get Pokemon Card data
final class CardService {
    
    /// Shared singleton instance
    static let shared = CardService()
    
    
    /// Privatized constructor
    private init() {}
    
    
    /// Send API call
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Completion lambda
    public func execute(_ request: CardRequest, completion: @escaping () -> Void) {
        
    }
}
