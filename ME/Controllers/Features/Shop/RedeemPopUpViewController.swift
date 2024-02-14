//
//  RedeemPopUpViewController.swift
//  ME
//
//  Created by 새미 on 2/8/24.
//

import UIKit

final class RedeemPopUpViewController: BaseViewController {
    
    // MARK: - Properties
    var product: Product? {
        didSet {
            guard let product = product else { return }
            self.brandLabel.text = product.brandName
            self.productLabel.text = product.productName
            self.pointLabel.text = "\(product.price) p"
        }
    }
    
    private let titleLabel = UILabel().then {
        $0.textColor = .white
        $0.text = "포인트 교환"
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    
    private let productFrame = UIView().then {
        $0.backgroundColor = .meGray
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
    }
    
    let brandLabel = UILabel().then {
        $0.textColor = .meLightGray
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textAlignment = .left
    }
    
    let productLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.textAlignment = .left
    }
    
    let pointLabel = UILabel().then {
        $0.textColor = .meOrange
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.textAlignment = .right
    }
    
    private let myPointLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.text = "내 포인트"
    }
    
    let myPoint = UILabel().then {
        $0.textColor = .meLightGray
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textAlignment = .right
        $0.text = "160000 p"
    }
    
    private let cancelButton = PopupButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0), title: "취소")
    
    private let divLine = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let checkButton = PopupButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0), title: "확인")

    // MARK: - Life Cycel
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Configure UI
    override func configureUI() {
    
    }

    
    // MARK: - Add View
    override func addView() {
        
    }
    
    
    // MARK: - Layout
    override func setLayout() {
        
    }
}
