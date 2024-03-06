//
//  UseButton.swift
//  ME
//
//  Created by 새미 on 3/6/24.
//

import UIKit

final class UseButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setButton() {
        backgroundColor = .meOrange
        setTitle("사용하기", for: .normal)
        setTitleColor(UIColor.black, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        layer.masksToBounds = true
        layer.cornerRadius = 18
    }
}
