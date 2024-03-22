//
//  LackOfPointsPopup.swift
//  ME
//
//  Created by 새미 on 3/22/24.
//

import UIKit

import SnapKit
import Then

final class LackOfPointsPopup: UIView {

    // MARK: - Properties
    private let titleLabel = UILabel().then {
        $0.text = "포인트가 부족합니다."
        $0.font = .systemFont(ofSize: 13, weight: .medium)
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
    }
    
    private let descriptionLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.text = "칼로리를 소모해 포인트를 적립하세요.\n아자잣 ~ !"
        $0.setDynamicTextColor(darkModeColor: .lightGray, lightModeColor: .darkGray)
        $0.font = .systemFont(ofSize: 11, weight: .regular)
    }
    
    private let divLine = UIView().then {
        $0.backgroundColor = .meGray
    }
    
    let checkButton = PopupButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0), title: "확인")
    
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
        [titleLabel, descriptionLabel, divLine, checkButton].forEach { self.addSubview($0) }
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        self.backgroundColor = .meBackground
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    // MARK: - Layout
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
        }
        
        divLine.snp.makeConstraints {
            $0.height.equalTo(0.5)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(checkButton.snp.top)
        }
        
        checkButton.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(40)
        }
    }
}
