//
//  MyView.swift
//  ME
//
//  Created by 새미 on 2/14/24.
//

import UIKit

import SnapKit
import Then

final class MyView: UIView {

    // MARK: - Properties
    private let kcalLabel = UILabel().then {
        $0.text = "활동량"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
    }
    
    let kcal = UILabel().then {
        $0.text = "300 Kcal"
        $0.textColor = .meOrange
        $0.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    private lazy var kcalStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
    }
    
    private let pointLabel = UILabel().then {
        $0.text = "포인트"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
    }
    
    let point = UILabel().then {
        $0.text = "30 Point"
        $0.textColor = .meOrange
        $0.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    private lazy var pointStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
    }
    
    private let bestWorkoutLabel = UILabel().then {
        $0.text = "가장 많이 한 운동"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
    }
    
    let bestWorkout = UILabel().then {
        $0.text = "사이클링"
        $0.textColor = .meOrange
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    private lazy var bestWorkoutStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
    }
    
    let activityRing = ActivityRingView()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: - Add View
    private func addView() {
        [kcalLabel, kcal].forEach { kcalStackView.addArrangedSubview($0) }
        [pointLabel, point].forEach { pointStackView.addArrangedSubview($0) }
        [bestWorkoutLabel, bestWorkout].forEach { bestWorkoutStackView.addArrangedSubview($0) }
        [kcalStackView, pointStackView, bestWorkoutStackView, activityRing].forEach {
            self.addSubview($0)
        }
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        self.setDynamicBackgroundColor(darkModeColor: .meDarkGray, lightModeColor: .white)

        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.meGray.cgColor
    }
    
    private func setLayout() {
        kcalStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(14)
            $0.top.equalToSuperview().inset(19)
        }
        
        pointStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
        }
        
        bestWorkoutStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(14)
            $0.bottom.equalToSuperview().inset(19)
        }
        
        activityRing.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(25)
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(132)
        }
    }
}
