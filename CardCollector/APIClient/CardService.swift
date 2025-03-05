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
    
    /// Custom Errors
    enum CardServiceError: Error {
        case FailedToCreateRequest
        case FailedToGetData
    }
    
    /// Send API call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back
    ///   - completion: Completion lambda
    public func execute<T: Codable>(
        _ request: CardRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void) {
            guard let urlRequest = self.request(cardRequest: request) else {
                completion(.failure(CardServiceError.FailedToCreateRequest))
                return
            }
            
            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                // ternary to check that data is not empty and error is null
                guard let data = data, error == nil else {
                    completion(.failure(error ?? CardServiceError.FailedToGetData))
                    return
                }
                // decode data
                do {
                    let result = try JSONDecoder().decode(type.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
    }
    
    // MARK: - Private
    private func request(cardRequest: CardRequest) -> URLRequest? {
        guard let url = cardRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = cardRequest.httpMethod
        return request
    }
}
