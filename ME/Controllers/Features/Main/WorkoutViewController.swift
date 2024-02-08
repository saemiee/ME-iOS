//
//  WorkoutViewController.swift
//  ME
//
//  Created by 새미 on 2/7/24.
//

import UIKit

final class WorkoutViewController: BaseViewController {
    
    // MARK: - Properties
    var workoutList: [Workout] = []
    
    var workoutDataManager = WorkoutDataManager()
    
    private let flowLayout = UICollectionViewFlowLayout().then {
      $0.scrollDirection = .vertical
      $0.minimumLineSpacing = 18.0
      $0.minimumInteritemSpacing = 0
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout).then {
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        $0.scrollIndicatorInsets = UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 4)
        $0.contentInset = .zero
        $0.backgroundColor = .clear
        $0.clipsToBounds = true
    }
    
    private let mainLabel = UILabel().then {
        $0.text = "오늘도 운동으로 활기찬 하루를 보내보세요 !"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
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
        title = "운동"
    }
    
    // MARK: - Data Setting
    func setDatas() {
        workoutDataManager.makeWorkoutData()
        workoutList = workoutDataManager.getWorkoutData()
    }
    
    // MARK: - Collection Setting
    func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(WorkoutCollectionViewCell.self, forCellWithReuseIdentifier: WorkoutCollectionViewCell.identifier)
    }
    
    // MARK: - Add View
    override func addView() {
        [mainLabel, collectionView].forEach { view.addSubview($0) }
    }
    
    // MARK: - Layout
    override func setLayout() {
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(15)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(self.mainLabel.snp.bottom).offset(33)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

// MARK: - Extension
extension WorkoutViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.workoutList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WorkoutCollectionViewCell.identifier, for: indexPath) as! WorkoutCollectionViewCell
        
        cell.workoutImage.image = workoutList[indexPath.row].workoutImage
        cell.workoutLabel.text = workoutList[indexPath.row].workout
        cell.kcalLabel.text = "\(workoutList[indexPath.row].kcal) Kcal"
        cell.pointLabel.text = " \(workoutList[indexPath.row].point) p"

        return cell
    }
}

extension WorkoutViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: 350, height: 66)
  }
}
