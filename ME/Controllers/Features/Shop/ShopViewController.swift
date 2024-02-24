//
//  ShopViewController.swift
//  ME
//
//  Created by 새미 on 2/7/24.
//

import UIKit

final class ShopViewController: BaseViewController {

    // MARK: - Properties
    var productDataManager = ProductDataManager()
    
    private let mainLabel = UILabel().then {
        $0.text = "포인트를 다양한 기프티콘으로 교환해 보세요."
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init()).then {
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        $0.backgroundColor = .clear
        $0.clipsToBounds = true
    }
    
    // MARK: - Life Cycel
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatas()
        setCollectionView()
    }
    
    // MARK: - Data Setting
    func setDatas() {
        productDataManager.makeProductData()
    }
    
    // MARK: - Collection Setting
    func setCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        collectionView.register(ShopCollectionViewCell.self, forCellWithReuseIdentifier: ShopCollectionViewCell.identifier)
    }
    
    // MARK: - Add View
    override func addView() {
        [mainLabel, collectionView].forEach { view.addSubview($0) }
    }
    
    // MARK: - Layout
    override func setLayout() {
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(6)
            $0.leading.equalToSuperview().inset(15)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(self.mainLabel.snp.bottom).offset(16)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
}

// MARK: - Extension
extension ShopViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productDataManager.getProductData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopCollectionViewCell.identifier, for: indexPath) as! ShopCollectionViewCell
        
        cell.productImage.image = productDataManager.getProductData()[indexPath.row].productImage
        cell.brandNameLabel.text = productDataManager.getProductData()[indexPath.row].brandName
        cell.productLabel.text = productDataManager.getProductData()[indexPath.row].productName
        cell.priceLabel.text = "\(productDataManager.getProductData()[indexPath.row].price) p"
    
        return cell
    }
}

extension ShopViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = ShopDetailViewController()
        
        let currentItem = productDataManager.getProductData()[indexPath.row]
        
        detailVC.product = currentItem
        
        detailVC.modalPresentationStyle = .automatic
        present(detailVC, animated: true)
    }
}

extension ShopViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = (screenWidth - 60) / 2
        let cellHeight = cellWidth * 1.6
        let size = CGSize(width: cellWidth, height: cellHeight)
        
        return size
    }
}
