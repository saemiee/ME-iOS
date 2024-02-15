//
//  WorkoutCard.swift
//  ME
//
//  Created by 새미 on 2/15/24.
//

import UIKit

import SnapKit
import Then

final class WorkoutCard: UIView {
    
    // MARK: - Properties
    private let workoutImage = UIImageView().then {
        $0.image = UIImage.init( systemName: "figure.open.water.swim", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        $0.tintColor = .yellow
    }
    
    private let workoutLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.text = "수영"
    }
    
    private let kcalLabel = UILabel().then {
        $0.textColor = .yellow
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        $0.text = "1000 Kcal"
    }
    
    lazy var stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
        $0.spacing = 7
    }
    
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
        [workoutLabel, kcalLabel].forEach { self.stackView.addArrangedSubview($0) }
        [workoutImage, stackView].forEach { self.addSubview($0) }
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        self.backgroundColor = .meGray
        self.layer.cornerRadius = 6
        self.layer.masksToBounds = true
    }
    
    private func setLayout() {
        workoutImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
        }
        
        workoutLabel.snp.makeConstraints {
            $0.height.equalTo(14)
        }
                
        kcalLabel.snp.makeConstraints {
            $0.height.equalTo(15)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.equalTo(workoutImage.snp.trailing).offset(12)
            $0.centerY.equalToSuperview()
        }
    }
}
