//
//  CouponCollectionViewCell.swift
//  ME
//
//  Created by 새미 on 3/6/24.
//

import UIKit

import SnapKit
import Then

final class CouponCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "CouponCell"
    
    let productImage = UIImageView()
    
    let brandName = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.setDynamicTextColor(darkModeColor: .meLightGray, lightModeColor: .gray)
    }
    
    let productLabel = UILabel().then {
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
        $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
        $0.numberOfLines = 2
        $0.textAlignment = .left
    }
    
    let expiryDateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.setDynamicTextColor(darkModeColor: .meLightGray, lightModeColor: .gray)
    }
    
    private let useButton = UseButton()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Add View
    private func addView() {
        [productImage, brandName, productLabel, expiryDateLabel, useButton].forEach { contentView.addSubview($0) }
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        self.setDynamicBackgroundColor(darkModeColor: .meDarkGray, lightModeColor: .white)
        self.layer.cornerRadius = 7
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.meGray.cgColor
        
        productImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(22)
            $0.centerY.equalToSuperview()
        }
        
        brandName.snp.makeConstraints {
            $0.leading.equalTo(productImage.snp.trailing).offset(14)
            $0.top.equalToSuperview().inset(15)
            $0.height.equalTo(14)
        }
        
        productLabel.snp.makeConstraints {
            $0.leading.equalTo(productImage.snp.trailing).offset(14)
            $0.top.equalTo(brandName.snp.bottom).offset(5)
            $0.height.equalTo(19)
        }
        
        expiryDateLabel.snp.makeConstraints {
            $0.leading.equalTo(productImage.snp.trailing).offset(14)
            $0.bottom.equalToSuperview().inset(14)
            $0.height.equalTo(14)
        }
    }
}
