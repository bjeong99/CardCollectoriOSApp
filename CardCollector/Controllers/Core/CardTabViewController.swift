//
//  ViewController.swift
//  CardCollector
//
//  Created by Brian Jeong on 3/4/25.
//

import UIKit


/// Controller to house tabs
final class CardTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpTabs()
    }
    
    private func setUpTabs() {
        let setVC = CardSetViewController()
        let portfolioVC = CardPortfolioViewController()
        let settingsVC = CardSettingsViewController()
        
        setVC.navigationItem.largeTitleDisplayMode = .automatic
        portfolioVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: setVC)
        let nav2 = UINavigationController(rootViewController: portfolioVC)
        let nav3 = UINavigationController(rootViewController: settingsVC)
        
        nav1.tabBarItem = UITabBarItem(
            title: "Sets",
            image: UIImage(systemName: "square.3.layers.3d.down.right"),
            tag: 1
        )
        
        nav2.tabBarItem = UITabBarItem(
            title: "Your Portfolio",
            image: UIImage(systemName: "list.bullet.rectangle"),
            tag: 2
        )
        
        nav3.tabBarItem = UITabBarItem(
            title: "Settings",
            image: UIImage(systemName: "gear"),
            tag: 3
        )
        
        for nav in [nav1, nav2, nav3] {
            nav.navigationBar.prefersLargeTitles = true
        }
        setViewControllers(
            [nav1, nav2, nav3],
            animated: true)
    }
}

