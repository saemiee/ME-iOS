//
//  MainViewController.swift
//  ME
//
//  Created by 새미 on 2/7/24.
//

import UIKit

final class MainViewController: BaseViewController {
    
    // MARK: - Properties
    let introLabel = UILabel().then {
        $0.text = "새미님\n오늘도 활기찬 하루 보내세요!"
        $0.font = .systemFont(ofSize: 24, weight: .regular)
        $0.numberOfLines = 2
        $0.setLineSpacing(spacing: 5)
        $0.textAlignment = .left
        $0.asFont(targetString: "새미", font: .systemFont(ofSize: 24, weight: .bold))
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
    }
    
    private let myView = MyView()
    
    private let workoutLabel = UILabel().then {
        $0.text = "운동"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
    }
    
    private lazy var moreWorkoutButton = UIButton().then {
        $0.setTitle("더 보기", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.backgroundColor = .clear
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.addTarget(self, action: #selector(moreWorkoutButtonTapped), for: .touchUpInside)
    }
    
    private let flowLayout = UICollectionViewFlowLayout().then {
        $0.minimumLineSpacing = 15
        $0.minimumInteritemSpacing = 15
    }
    
    private lazy var workoutCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout).then {
        $0.isScrollEnabled = false
        $0.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.contentInset = .zero
        $0.backgroundColor = .clear
        $0.clipsToBounds = true
    }

    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        workoutCollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .meBackground
        setCollectionView()
    }
    
    // MARK: - Collection Setting
    private func setCollectionView() {
        workoutCollectionView.dataSource = self
        workoutCollectionView.delegate = self
        
        workoutCollectionView.register(MainWorkoutCollectionViewCell.self, forCellWithReuseIdentifier: MainWorkoutCollectionViewCell.identifier)
    }
    
    // MARK: - NavigationBar Setting
    override func setupNavBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: Configure UI
    override func configureUI() {
    }
    
    // MARK: Add View
    override func addView() {
        [introLabel, myView, workoutLabel, moreWorkoutButton, workoutCollectionView].forEach { view.addSubview($0) }
    }
    
    // MARK: Layout
    override func setLayout() {
        introLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.top.equalToSuperview().inset(131)
        }
        
        myView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.top.equalTo(introLabel.snp.bottom).offset(19)
            $0.bottom.equalToSuperview().inset(480)
        }
        
        workoutLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.top.equalTo(myView.snp.bottom).offset(50)
        }
        
        moreWorkoutButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(24)
            $0.top.equalTo(myView.snp.bottom).offset(50)
        }
        
        workoutCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.top.equalTo(workoutLabel.snp.bottom).offset(20)
            $0.bottom.equalToSuperview().inset(134)
        }
    }
    
    // MARK: - Selectors
    @objc func moreWorkoutButtonTapped() {
        let workoutVC = WorkoutViewController()
        self.navigationController?.pushViewController(workoutVC, animated: true)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainWorkoutCollectionViewCell.identifier, for: indexPath) as! MainWorkoutCollectionViewCell
        
        return cell
    }
}


extension MainViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let screenWidth = UIScreen.main.bounds.width
      let cellWidth = (screenWidth - 63) / 2

      return CGSize(width: cellWidth, height: 74)
  }
}
