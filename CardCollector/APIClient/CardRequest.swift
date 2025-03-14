//
//  CardRequest.swift
//  CardCollector
//
//  Created by Brian Jeong on 3/4/25.
//

import Foundation


/// Represents request to card API
final class CardRequest {
    
    /// API Constants
    private struct Constants {
        static let baseUrl = "https://api.pokemontcg.io/v2"
    }
    
    /// Desired endpoint
    private let endpoint: CardEndpoint
    
    /// Path components
    private let pathComponents: [String]
    
    /// Query parameters
    private let queryParameters: [URLQueryItem]
    
    /// Constructed URL
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
        }
        return string
    }
    
    /// URL object of  constructed url string
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// REST Method
    public let httpMethod = "GET"
    
    /// Initialiaze a request
    /// - Parameters:
    ///   - endpoint: desired endpoint from enum
    ///   - pathComponents: path components
    ///   - queryParameters: query parameters
    public init(
        endpoint: CardEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}

extension CardRequest {
    
    /// pre-set endpoint to get all sets
    static let listCardSetsRequest =
        CardRequest(
            endpoint: CardEndpoint.sets,
            queryParameters: [URLQueryItem(name: "orderBy", value: "-releaseDate")])
    
    static public func searchCardSetsRequest(searchString: String) -> CardRequest {
        return CardRequest(
            endpoint: CardEndpoint.sets,
            queryParameters: [
                URLQueryItem(name: "q", value: "name:\(searchString)*"),
                URLQueryItem(name: "orderBy", value: "-releaseDate")
            ])
    }
}
