//
//  SetListViewViewModel.swift
//  CardCollector
//
//  Created by Brian Jeong on 3/6/25.
//

import Foundation
import UIKit

final class SetListViewViewModel: NSObject {
    func fetchSets() {
        CardService.shared.execute(CardRequest.listCardSetsRequest, expecting: GetAllSetsResponse.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension SetListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardSetCollectionViewCell.cellIdentifier, for: indexPath
        ) as? CardSetCollectionViewCell else {
            fatalError("Unsupported Cell")
        }
        let viewModel = CardSetCollectionViewCellViewModel(setName: "Brian", setSeries: "Jeong", setImageUrl: nil)
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
