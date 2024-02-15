//
//  MainViewController.swift
//  ME
//
//  Created by 새미 on 2/7/24.
//

import UIKit

final class MainViewController: BaseViewController {
    
    // MARK: - Properties
    private let introLabel = UILabel().then {
        $0.text = "새미님\n오늘도 활기찬 하루 보내세요!"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 24, weight: .regular)
        $0.numberOfLines = 2
        $0.setLineSpacing(spacing: 5)
        $0.textAlignment = .left
        $0.asFont(targetString: "새미", font: .systemFont(ofSize: 24, weight: .bold))
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
    
    // MARK: Configure UI
    override func configureUI() {
    }
    
    // MARK: Add View
    override func addView() {
        [introLabel].forEach { view.addSubview($0) }
    }
    
    // MARK: Layout
    override func setLayout() {
        introLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(173)
        }
    }
}
