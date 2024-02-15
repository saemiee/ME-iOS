//
//  MainViewController.swift
//  ME
//
//  Created by 새미 on 2/7/24.
//

import UIKit

final class MainViewController: BaseViewController {
    
    // MARK: - Properties
    private let introLabel = UILabel().then {
        $0.text = "새미님\n오늘도 활기찬 하루 보내세요!"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 24, weight: .regular)
        $0.numberOfLines = 2
        $0.setLineSpacing(spacing: 5)
        $0.textAlignment = .left
        $0.asFont(targetString: "새미", font: .systemFont(ofSize: 24, weight: .bold))
    }
    
    private let myView = MyView()
    
    private let workoutLabel = UILabel().then {
        $0.text = "운동"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 22, weight: .bold)
    }
    
    private let moreWorkoutButton = UIButton().then {
        $0.setTitle("더 보기", for: .normal)
        $0.setTitleColor(.meOrange, for: .normal)
        $0.backgroundColor = .clear
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    private let workoutBackground = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let workoutCard1 = WorkoutCard()
    private let workoutCard2 = WorkoutCard()
    private let workoutCard3 = WorkoutCard()
    private let workoutCard4 = WorkoutCard()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .meBackground
    }
    
    // MARK: Configure UI
    override func configureUI() {
    }
    
    // MARK: Add View
    override func addView() {
        [workoutCard1, workoutCard2, workoutCard3, workoutCard4].forEach { workoutBackground.addSubview($0)}
        [introLabel, myView, workoutLabel, moreWorkoutButton, workoutBackground].forEach { view.addSubview($0) }
    }
    
    // MARK: Layout
    override func setLayout() {
        introLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(173)
            $0.height.equalTo(70)
        }
        
        myView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(introLabel.snp.bottom).offset(22)
            $0.bottom.equalToSuperview().inset(400)
        }
        
        workoutLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(myView.snp.bottom).offset(52)
        }
        
        moreWorkoutButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(myView.snp.bottom).offset(52)
        }
        
        workoutBackground.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(workoutLabel.snp.bottom).offset(22)
            $0.bottom.equalToSuperview().inset(150)
        }
        
        workoutCard1.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.trailing.equalTo(workoutBackground.snp.centerX).offset(-7)
            $0.bottom.equalTo(workoutBackground.snp.centerY).offset(-7)
        }
        
        workoutCard2.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalTo(workoutBackground.snp.centerX).offset(7)
            $0.bottom.equalTo(workoutBackground.snp.centerY).offset(-7)
        }
        
        workoutCard3.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview()
            $0.trailing.equalTo(workoutBackground.snp.centerX).offset(-7)
            $0.top.equalTo(workoutBackground.snp.centerY).offset(7)
        }
        
        workoutCard4.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview()
            $0.leading.equalTo(workoutBackground.snp.centerX).offset(7)
            $0.top.equalTo(workoutBackground.snp.centerY).offset(7)
        }
    }
}
