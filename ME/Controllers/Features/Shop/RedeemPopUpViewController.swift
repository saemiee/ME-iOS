//
//  RedeemPopupViewController.swift
//  ME
//
//  Created by 새미 on 3/6/24.
//

import UIKit

final class RedeemPopupViewController: BaseViewController {
    
    let successPopupView = RedeemSuccessPopup()
    let falsePopupView = LackOfPointsPopup()
    
    var product: Product?
    
    convenience init(product: Product?) {
        self.init()
        self.product = product
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        self.view.backgroundColor = .black.withAlphaComponent(0.6)
        setupData()
        setLayout()
        actionButton()
    }
    
    private func setupData() {
        successPopupView.product = self.product
    }
    
    // MARK: - Layout
    override func setLayout() {
//        view.addSubview(successPopupView)
//        
//        successPopupView.snp.makeConstraints {
//            $0.centerX.centerY.equalToSuperview()
//            $0.height.equalTo(235)
//            $0.width.equalTo(278)
//        }
        view.addSubview(falsePopupView)
        
        falsePopupView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(145)
            $0.width.equalTo(262)
        }
        
        
    }
    
    func actionButton() {
//        successPopupView.cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
//        successPopupView.redeemButton.addTarget(self, action: #selector(change), for: .touchUpInside)
    }
    
    @objc func cancel() {
        dismiss(animated: false)
    }
    
    @objc func change() {
        // 교환
    }
}
    
