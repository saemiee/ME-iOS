//
//  RedeemSuccessPopup.swift
//  ME
//
//  Created by 새미 on 3/6/24.
//

import UIKit

import SnapKit
import Then

final class RedeemSuccessPopup: UIView {
    
    // MARK: - Properties
    var product: Product? {
        didSet {
            guard let product = product else { return }
            self.brandLabel.text = product.brandName
            self.productLabel.text = product.productName
            self.productPointLabel.text = "\(product.price) p"
        }
    }
    
    private let titleLabel = UILabel().then {
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
        $0.text = "포인트 교환"
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    
    private let productFrame = UIView().then {
        $0.setDynamicBackgroundColor(darkModeColor: .meDarkGray, lightModeColor: .white)
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
    }
    
    let brandLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textAlignment = .left
    }
    
    let productLabel = UILabel().then {
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.textAlignment = .left
    }
    
    let productPointLabel = UILabel().then {
        $0.textColor = .meOrange
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.textAlignment = .right
    }
    
    private let myPointLabel = UILabel().then {
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.text = "내 포인트"
    }
    
    let myPoint = UILabel().then {
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textAlignment = .right
        $0.text = "160000 p"
    }
    
    let cancelButton = PopupButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0), title: "취소")
    
    private let divLine = UIView().then {
        $0.backgroundColor = .meLightGray
    }
    
    let redeemButton = PopupButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0), title: "확인")
    
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
        [titleLabel, productFrame, myPointLabel, myPoint, cancelButton, divLine, redeemButton].forEach { self.addSubview($0) }
        [brandLabel, productLabel, productPointLabel].forEach { productFrame.addSubview($0) }
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        self.backgroundColor = .meBackground
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(23)
            $0.leading.equalToSuperview().inset(18)
            $0.height.equalTo(17)
        }
        
        productFrame.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(23)
            $0.top.equalTo(titleLabel.snp.bottom).offset(18)
            $0.height.equalTo(68)
        }
        
        brandLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(13)
            $0.top.equalToSuperview().inset(15)
            $0.height.equalTo(14)
        }
        
        productLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(13)
            $0.top.equalTo(brandLabel.snp.bottom).offset(7)
        }
        
        productPointLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }
        
        myPointLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(138)
            $0.top.equalTo(productFrame.snp.bottom).offset(17)
        }
        
        myPoint.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(23)
            $0.top.equalTo(productFrame.snp.bottom).offset(17)
        }
        
        divLine.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.width.equalTo(1)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        cancelButton.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview()
            $0.trailing.equalTo(divLine.snp.leading)
            $0.height.equalTo(44)
        }
        
        redeemButton.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview()
            $0.leading.equalTo(divLine.snp.trailing)
            $0.height.equalTo(44)
        }
    }
}
