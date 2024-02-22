//
//  MainWorkoutCollectionViewCell.swift
//  ME
//
//  Created by 새미 on 2/22/24.
//

import UIKit

import SnapKit
import Then

final class MainWorkoutCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "mainWorkoutCell"
    
    private let workoutImage = UIImageView().then {
        $0.image = UIImage.init( systemName: "figure.open.water.swim", withConfiguration: UIImage.SymbolConfiguration(pointSize: 26))
        $0.tintColor = .meGray
    }
    
    let workoutLabel = UILabel().then {
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.text = "수영"
    }
    
    let kcalLabel = UILabel().then {
        $0.textColor = .meOrange
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.text = "1000 Kcal"
    }
    
    lazy var stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
        $0.spacing = 3
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
        self.setDynamicBackgroundColor(darkModeColor: .meDarkGray, lightModeColor: .white)
        self.layer.cornerRadius = 7
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.meGray.cgColor
    }
    
    private func setLayout() {
        workoutImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(25)
            $0.centerY.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.leading.equalTo(workoutImage.snp.trailing).offset(15)
            $0.centerY.equalToSuperview()
        }
    }
}
