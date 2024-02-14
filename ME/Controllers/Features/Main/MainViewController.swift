//
//  MainViewController.swift
//  ME
//
//  Created by 새미 on 2/7/24.
//

import UIKit

final class MainViewController: BaseViewController {
    
    // MARK: - Properties
    private let myLabel = UILabel().then {
        $0.text = "MY"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 22, weight: .bold)
    }
    
    private let workoutLabel = UILabel().then {
        $0.text = "운동"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 22, weight: .bold)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
