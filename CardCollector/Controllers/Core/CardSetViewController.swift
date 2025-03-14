//
//  CardSetViewController.swift
//  CardCollector
//
//  Created by Brian Jeong on 3/4/25.
//

import UIKit


/// Controller to show sets
final class CardSetViewController: UIViewController {

    private let setListView = SetListView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Sets"
        
        view.addSubview(setListView)
        NSLayoutConstraint.activate([
            setListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            setListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            setListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            setListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
