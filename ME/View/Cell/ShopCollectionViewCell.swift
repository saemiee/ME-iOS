//
//  ShopCollectionViewCell.swift
//  ME
//
//  Created by 새미 on 2/7/24.
//

import UIKit

import SnapKit
import Then

final class ShopCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "ShopCell"
    
    let vignettingView = VignettingView()

    let productImage = UIImageView()
    
    let brandNameLabel = UILabel().then {
        $0.setDynamicTextColor(darkModeColor: .meLightGray, lightModeColor: .gray)
        $0.font = UIFont.systemFont(ofSize: 12, weight: .light)
    }
    
    let productLabel = UILabel().then {
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
        $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
        $0.numberOfLines = 2
        $0.textAlignment = .left
    }
    
    let priceLabel = UILabel().then {
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }
    
    // MARK: - Initailization
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
        [vignettingView, productImage, brandNameLabel, productLabel, priceLabel].forEach { self.addSubview($0) }
    }
    
    // MARK: - Layout
    private func setLayout() {
        vignettingView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(188)
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        productImage.snp.makeConstraints {
            $0.top.equalTo(vignettingView.snp.top).offset(27)
            $0.bottom.equalTo(vignettingView.snp.bottom).offset(-27)
            $0.leading.equalTo(vignettingView.snp.leading).offset(16)
            $0.trailing.equalTo(vignettingView.snp.trailing).offset(-16)
        }
        
        brandNameLabel.snp.makeConstraints {
            $0.top.equalTo(vignettingView.snp.bottom).offset(12)
            $0.leading.equalToSuperview()
            $0.width.equalTo(166)
        }
        
        productLabel.snp.makeConstraints {
            $0.top.equalTo(brandNameLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(productLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
    }
}
