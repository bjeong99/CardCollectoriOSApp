//
//  CardSetViewController.swift
//  CardCollector
//
//  Created by Brian Jeong on 3/4/25.
//

import UIKit


/// Controller to show sets
final class CardSetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Sets"

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
