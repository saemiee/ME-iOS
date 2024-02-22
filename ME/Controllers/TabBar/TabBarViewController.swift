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
        let myVC = SettingViewController()
    
        mainVC.title = "ME"
        shopVC.title = "상점"
        myVC.title = "마이페이지"
        
        mainVC.tabBarItem.image = UIImage.init(systemName: "house")
        shopVC.tabBarItem.image = UIImage.init(systemName: "bag")
        myVC.tabBarItem.image = UIImage.init(systemName: "person.fill")
        
        let navigationMain = UINavigationController(rootViewController: mainVC)
        let navigationShop = UINavigationController(rootViewController: shopVC)
        let navigationMy = UINavigationController(rootViewController: myVC)
        
        navigationMain.navigationBar.prefersLargeTitles = true
        navigationShop.navigationBar.prefersLargeTitles = true
        navigationMy.navigationBar.prefersLargeTitles = true
        
        setViewControllers([navigationMain, navigationShop, navigationMy], animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.tintColor = .meYellow
        tabBar.backgroundColor = .clear
    }
}
