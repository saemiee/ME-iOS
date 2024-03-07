//
//  SettingViewController.swift
//  ME
//
//  Created by 새미 on 2/7/24.
//

import UIKit

final class MyPageViewController: BaseViewController {
    
    // MARK: - Properties
    let nameLabel = UILabel().then {
        $0.text = "안녕하세요 새미님"
        $0.font = .systemFont(ofSize: 26, weight: .regular)
        $0.textAlignment = .left
        $0.asFont(targetString: "새미", font: .systemFont(ofSize: 26, weight: .bold))
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
    }
    
    private let pointView = MeBackgroundView()
    
    private let pointLabel = UILabel().then {
        $0.text = "내 포인트"
        $0.textColor = .meOrange
        $0.font = .systemFont(ofSize: 14, weight: .light)
    }
    
    let myPoint = UILabel().then {
        $0.text = "10000 p"
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
        $0.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
    private let couponBoxView = MeBackgroundView()
    
    private let couponLabel = UILabel().then {
        $0.text = "쿠폰함"
        $0.textColor = .meOrange
        $0.font = .systemFont(ofSize: 14, weight: .light)
    }
    
    private lazy var couponBoxButton = UIButton().then {
        $0.backgroundColor = .clear
        $0.setTitle("내 쿠폰함 보기", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.setTitleColorForMode(darkModeColor: .white, lightModeColor: .black)
        $0.addTarget(self, action: #selector(couponBoxButtonTapped), for: .touchUpInside)
    }
    
    private let accountLabel = UILabel().then {
        $0.text = "계정"
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    private lazy var logoutButton = MyPageButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0), title: "로그아웃").then {
        $0.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    }
    
    private lazy var withdrawalButton = MyPageButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0), title: "탈퇴하기").then {
        $0.addTarget(self, action: #selector(withdrawalButtonTapped), for: .touchUpInside)
    }
    
    private let meLabel = UILabel().then {
        $0.text = "ME"
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    private let meButton = MyPageButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0), title: "ME 사용법")
    
    // MARK: - Selector
    @objc func couponBoxButtonTapped() {
        let couponBoxVC = CouponBoxViewController()
        self.navigationController?.pushViewController(couponBoxVC, animated: true)
    }
    
    @objc func logoutButtonTapped() {
        let alert = UIAlertController(title: "로그아웃", message: "정말 로그아웃 하시겠습니까?", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "로그아웃", style: .default)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(confirm)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    @objc func withdrawalButtonTapped() {
        let alert = UIAlertController(title: "탙퇴하기", message: "탈퇴 시 모든 포인트가 소멸됩니다.", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "탈퇴하기", style: .default)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(confirm)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    // MARK:  - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Add View
    override func addView() {
        [nameLabel, pointView, couponBoxView, accountLabel, logoutButton, withdrawalButton, meLabel, meButton].forEach { view.addSubview($0) }
        [pointLabel, myPoint].forEach { self.pointView.addSubview($0) }
        [couponLabel, couponBoxButton].forEach { self.couponBoxView.addSubview($0) }
    }
    
    // MARK: - Layout
    override func setLayout() {
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(190)
            $0.leading.equalToSuperview().inset(22)
            $0.height.equalTo(22)
        }
        
        pointView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(22)
            $0.height.equalTo(82)
            $0.trailing.equalTo(view.snp.centerX).offset(-10)
            $0.top.equalTo(nameLabel.snp.bottom).offset(22)
        }
        
        pointLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16)
            $0.height.equalTo(22)
        }
        
        myPoint.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(15)
            $0.height.equalTo(22)
            $0.leading.equalToSuperview().inset(16)
        }
        
        couponBoxView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(82)
            $0.top.equalTo(nameLabel.snp.bottom).offset(22)
            $0.leading.equalTo(view.snp.centerX).offset(10)
        }
        
        couponLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16)
            $0.height.equalTo(22)
        }
        
        couponBoxButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(15)
            $0.height.equalTo(22)
            $0.leading.equalToSuperview().inset(16)
        }
        
        accountLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(22)
            $0.top.equalTo(pointView.snp.bottom).offset(56)
            $0.height.equalTo(22)
        }
        
        logoutButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(53)
            $0.top.equalTo(accountLabel.snp.bottom).offset(15)
        }
    
        withdrawalButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(53)
            $0.top.equalTo(logoutButton.snp.bottom).offset(18)
        }
        
        meLabel.snp.makeConstraints {
            $0.top.equalTo(withdrawalButton.snp.bottom).offset(53)
            $0.leading.equalToSuperview().inset(22)
            $0.height.equalTo(22)
        }
        
        meButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(53)
            $0.top.equalTo(meLabel.snp.bottom).offset(15)
        }
    }
}
