//
//  TabBarViewController.swift
//  ME
//
//  Created by 새미 on 2/7/24.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainVC = MainViewController()
        let shopVC = ShopViewController()
    
        mainVC.title = "ME"
        shopVC.title = "Shop"
        
        mainVC.tabBarItem.image = UIImage.init(systemName: "house")
        shopVC.tabBarItem.image = UIImage.init(systemName: "bag")
        
        let navigationMain = UINavigationController(rootViewController: mainVC)
        let navigationShop = UINavigationController(rootViewController: shopVC)
        
        navigationMain.navigationBar.prefersLargeTitles = true
        navigationShop.navigationBar.prefersLargeTitles = true
        
        setViewControllers([navigationMain, navigationShop], animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.tintColor = .meYellow
        tabBar.backgroundColor = .clear
    }
}
