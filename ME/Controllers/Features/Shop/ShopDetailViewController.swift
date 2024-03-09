//
//  ShopDetailViewController.swift
//  ME
//
//  Created by 새미 on 2/8/24.
//

import UIKit

final class ShopDetailViewController: BaseViewController {
    
    // MARK: - Properties
    let popupVC = RedeemSuccessPopup()
    
    var product: Product? {
        didSet {
            guard let product = product else { return }
            productImage.image = product.productImage
            productLabel.text = product.productName
            brandLabel.text = product.brandName
            priceLabel.text = "\(product.price) p"
            notice.text = product.notice
        }
    }
    
    private let scrollView = UIScrollView()
    
    private let background = VignettingView()
    
    let productImage = UIImageView()
    
    let brandLabel = UILabel().then {
        $0.setDynamicTextColor(darkModeColor: .meLightGray, lightModeColor: .gray)
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    let productLabel = UILabel().then {
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
        $0.font = UIFont.systemFont(ofSize: 22, weight: .medium)
    }
    
    let priceLabel = UILabel().then {
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
        $0.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    }
    
    private let divLine = UIView().then {
        $0.backgroundColor = .meGray
    }
    
    private let noticeLabel = UILabel().then {
        $0.setDynamicTextColor(darkModeColor: .meLightGray, lightModeColor: .gray)
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        $0.text = "유의사항"
    }
    
    let notice = UILabel().then {
        $0.setDynamicTextColor(darkModeColor: .meLightGray, lightModeColor: .gray)
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textAlignment = .left
    }
    
    private lazy var buyButton = MECustomButton(frame: CGRect(x: 0, y: 0, width: 0, height: 57), title: "교환하기").then {
        $0.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Selector
    @objc func buyButtonTapped() {
        redeemSuccess()
    }
    
    // MARK: - Life Cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.updateContentSize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Configure UI
    override func configureUI(){
        view.backgroundColor = .meBackground
        notice.setLineSpacing(spacing: 4)
    }
    
    // MARK: - Add View
    override func addView() {
        [background, productImage, brandLabel, productLabel, priceLabel, divLine, noticeLabel, notice, buyButton].forEach { self.scrollView.addSubview($0) }
        view.addSubview(scrollView)
    }
    
    // MARK: - Layout
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        background.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(340)
        }
        
        productImage.snp.makeConstraints {
            $0.top.equalTo(background.snp.top).offset(27)
            $0.bottom.equalTo(background.snp.bottom).offset(-27)
            $0.leading.equalTo(background.snp.leading).offset(16)
            $0.trailing.equalTo(background.snp.trailing).offset(-16)
        }
        
        brandLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30)
            $0.top.equalTo(background.snp.bottom).offset(31.22)
        }
        
        productLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30)
            $0.top.equalTo(brandLabel.snp.bottom).offset(6)
        }
        
        priceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30)
            $0.top.equalTo(productLabel.snp.bottom).offset(23)
        }
        
        divLine.snp.makeConstraints {
            $0.width.equalTo(340)
            $0.height.equalTo(0.5)
            $0.top.equalTo(priceLabel.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
        }
        
        noticeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30)
            $0.top.equalTo(divLine.snp.bottom).offset(19)
        }
        
        notice.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30)
            $0.top.equalTo(noticeLabel.snp.bottom).offset(6)
            $0.width.equalTo(340)
        }
        
        buyButton.snp.makeConstraints {
            $0.top.equalTo(notice.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(340)
            $0.height.equalTo(57)
        }
    }
    
    // MARK: - Redeem Seccess
    func redeemSuccess() {
        let redeemVC = RedeemPopupViewController(product: product)
        
        redeemVC.modalPresentationStyle = .overFullScreen
        present(redeemVC, animated: false)
    }
}
