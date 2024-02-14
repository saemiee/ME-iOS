//
//  MyView.swift
//  ME
//
//  Created by 새미 on 2/14/24.
//

import UIKit

final class MyView: UIView {

    // MARK: - Properties
    private let kcalLabel = UILabel().then {
        $0.text = "활동량"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    private let kcal = UILabel().then {
        $0.text = "300 Kcal"
        $0.textColor = .meYellow
        $0.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
    private let pointLabel = UILabel().then {
        $0.text = "포인트"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    private let point = UILabel().then {
        $0.text = "30 Point"
        $0.textColor = .meYellow
        $0.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
    private let bestWorkoutLabel = UILabel().then {
        $0.text = "가장 많이 한 운동"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    private let bestWorkout = UILabel().then {
        $0.text = "사이클링"
        $0.textColor = .meYellow
        $0.font = .systemFont(ofSize: 14, weight: .bold)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
    }
    
}
