//
//  MeBackgroundVIew.swift
//  ME
//
//  Created by 새미 on 3/7/24.
//

import UIKit

final class MeBackgroundView: UIView {

    override func layoutSubviews() {
        self.setDynamicBackgroundColor(darkModeColor: .meDarkGray, lightModeColor: .white)

        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.meGray.cgColor
    }

}
