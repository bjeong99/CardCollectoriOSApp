//
//  SetListViewViewModel.swift
//  CardCollector
//
//  Created by Brian Jeong on 3/6/25.
//

import Foundation
import UIKit

protocol SetListViewViewModelDelegate: AnyObject {
    func didLoadInitialCardSets()
}

final class SetListViewViewModel: NSObject {
    
    public weak var delegate: SetListViewViewModelDelegate?
    
    private var cardSets: [CardSet] = [] {
        didSet {
            cellViewModels.removeAll()
            for cardSet in cardSets {
                cellViewModels.append(
                    CardSetCollectionViewCellViewModel(setName: cardSet.name, setSeries: cardSet.series, setImageUrl: URL(string: cardSet.images.logo))
                )
            }
        }
    }
    
    private var cellViewModels: [CardSetCollectionViewCellViewModel] = []
    
    public func fetchSets(searchText: String? = nil) {
        let request = (searchText != nil) ? CardRequest.searchCardSetsRequest(searchString: searchText!) : CardRequest.listCardSetsRequest
        CardService.shared.execute(request, expecting: GetAllSetsResponse.self) { [weak self] result in
            switch result {
            case .success(let responseModel):
                let results = responseModel.data
                print(results.count)
                self?.cardSets = results
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCardSets()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension SetListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardSetCollectionViewCell.cellIdentifier, for: indexPath
        ) as? CardSetCollectionViewCell else {
            fatalError("Unsupported Cell")
        }
        let viewModel = cellViewModels[indexPath.row]
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30)/2
        return CGSize(
            width: width,
            height: width * 1.5
        )
    }
}
