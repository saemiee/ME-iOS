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
        addView()
        setLayout()
    }
    
    func configureUI(){
        view.backgroundColor = .meBackground
        addView()
        setLayout()
    }
    
    func addView() {}
    func setLayout() {}
}
