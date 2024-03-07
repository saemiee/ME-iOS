//
//  MyPageButton.swift
//  ME
//
//  Created by 새미 on 3/7/24.
//

import UIKit

final class MyPageButton: UIButton {

    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        setButton(withTitle: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setButton(withTitle title: String) {
        self.setDynamicBackgroundColor(darkModeColor: .meDarkGray, lightModeColor: .white)
        self.setTitle(title, for: .normal)
        self.setTitleColorForMode(darkModeColor: .white, lightModeColor: .black)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        layer.masksToBounds = true
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.meGray.cgColor
        contentHorizontalAlignment = .left
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 27, bottom: 0, right: 0)
    }
}
