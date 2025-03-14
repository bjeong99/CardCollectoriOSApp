//
//  CardSetCollectionViewCellViewModel.swift
//  CardCollector
//
//  Created by Brian Jeong on 3/6/25.
//

import Foundation

final class CardSetCollectionViewCellViewModel {
    private let setName: String
    private let setSeries: String
    private let setImageUrl: URL?
    
    init(
        setName: String,
        setSeries: String,
        setImageUrl: URL?
    ) {
        self.setName = setName
        self.setSeries = setSeries
        self.setImageUrl = setImageUrl
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = setImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
