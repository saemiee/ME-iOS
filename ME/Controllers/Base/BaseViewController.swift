//
//  BaseViewController.swift
//  ME
//
//  Created by 새미 on 2/7/24.
//

import UIKit

import SnapKit
import Then

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setDarkMode()
        setupNavBar()
        addView()
        setLayout()
    }
    
    func setupNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.tintColor = .meOrange
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func configureUI(){
        view.backgroundColor = .meBackground
        addView()
        setLayout()
    }
    
    func setDarkMode() {}
    func addView() {}
    func setLayout() {}
}
