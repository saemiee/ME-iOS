//
//  CouponBoxViewController.swift
//  ME
//
//  Created by 새미 on 3/6/24.
//

import UIKit

final class CouponBoxViewController: BaseViewController {
    
    // MARK: - Properties
    var productDataManager = ProductDataManager()
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init()).then {
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        $0.backgroundColor = .clear
        $0.clipsToBounds = true
    }

    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatas()
        setCollectionView()
    }
    
    // MARK: - Navigation Bar Setting
    override func setupNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        appearance.shadowColor = .clear
        
        navigationItem.title = "쿠폰함"
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = .meOrange
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    // MARK: - Data Setting
    func setDatas() {
        productDataManager.makeProductData()
    }
    
    // MARK: - Collection Setting
    func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CouponCollectionViewCell.self, forCellWithReuseIdentifier: CouponCollectionViewCell.identifier)
    }
    
    // MARK: - Add View
    override func addView() {
        view.addSubview(collectionView)
    }
    
    // MARK: - Layout
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(-23)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(23)
        }
    }
}

extension CouponBoxViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productDataManager.getProductData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CouponCollectionViewCell.identifier, for: indexPath) as! CouponCollectionViewCell
        
        cell.productImage.image = productDataManager.getProductData()[indexPath.row].productImage
        cell.brandNameLabel.text = productDataManager.getProductData()[indexPath.row].brandName
        cell.productLabel.text = productDataManager.getProductData()[indexPath.row].productName
    
        return cell
    }
}

extension CouponBoxViewController: UICollectionViewDelegate {
    
}

extension CouponBoxViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = screenWidth - 46
        let cellHeight = 90.0
        let size = CGSize(width: cellWidth, height: cellHeight)
        
        return size
    }
}

