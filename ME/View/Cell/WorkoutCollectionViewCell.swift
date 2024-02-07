//
//  WorkoutCollectionViewCell.swift
//  ME
//
//  Created by 새미 on 2/7/24.
//

import UIKit

import SnapKit
import Then

final class WorkoutCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "workoutCell"
    
    private let circle = UIView().then {
        $0.backgroundColor = .meDarkGray
    }
    
    let workoutImage = UIImageView().then {
        $0.tintColor = .meYellow
    }
    
    let workoutLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    let kcalLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.textAlignment = .left
    }
    
    let pointLabel = UILabel().then {
        $0.textColor = .meOrange
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textAlignment = .left
    }
    
    private lazy var stackView = UIStackView().then {
        $0.spacing = 1
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
    }
    
    // MARK: - Initailization
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .meGray
        addView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Add View
    func addView() {
        [workoutLabel, kcalLabel].forEach { self.stackView.addArrangedSubview($0) }
        [circle, workoutImage, stackView, pointLabel].forEach { self.contentView.addSubview($0) }
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 7
        self.clipsToBounds = true
        
        circle.layer.cornerRadius = circle.frame.width / 2
        circle.layer.cornerRadius = circle.frame.height / 2
        
        circle.snp.makeConstraints {
            $0.width.height.equalTo(48)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
        }
        
        workoutImage.snp.makeConstraints {
            $0.centerX.centerY.equalTo(circle.snp.center)
        }
        
        workoutLabel.snp.makeConstraints {
            $0.height.equalTo(20)
        }
        
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.equalTo(40)
            $0.leading.equalTo(circle.snp.trailing).offset(10)
        }
        
        pointLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(30)
        }
    }
}
