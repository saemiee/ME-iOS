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
        let settingVC = SettingViewController()
    
        mainVC.title = "ME"
        shopVC.title = "Shop"
        settingVC.title = "설정"
        
        mainVC.tabBarItem.image = UIImage.init(systemName: "house")
        shopVC.tabBarItem.image = UIImage.init(systemName: "bag")
        settingVC.tabBarItem.image = UIImage.init(systemName: "person.fill")
        
        let navigationMain = UINavigationController(rootViewController: mainVC)
        let navigationShop = UINavigationController(rootViewController: shopVC)
        let navigationSetting = UINavigationController(rootViewController: settingVC)
        
        navigationMain.navigationBar.prefersLargeTitles = true
        navigationShop.navigationBar.prefersLargeTitles = true
        navigationSetting.navigationBar.prefersLargeTitles = true
        
        setViewControllers([navigationMain, navigationShop, navigationSetting], animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.tintColor = .meYellow
        tabBar.backgroundColor = .clear
    }
}
