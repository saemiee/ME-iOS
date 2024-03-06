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
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        
    }
    
    private func setLayout() {
        
    }
}
