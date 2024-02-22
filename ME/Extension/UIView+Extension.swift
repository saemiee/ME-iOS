//
//  UIView+Extension.swift
//  ME
//
//  Created by 새미 on 2/22/24.
//

import UIKit

extension UIView {
    func setDynamicBackgroundColor(darkModeColor: UIColor, lightModeColor: UIColor) {
        self.backgroundColor = UIColor { traitCollection -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return darkModeColor
            } else {
                return lightModeColor
            }
        }
    }
    
//    func addDynamicBorderColor(darkModeColor: UIColor, lightModeColor: UIColor, width: CGFloat) {
//        self.layer.borderWidth = width
//        self.layer.masksToBounds = true
//    
//        self.layer.borderColor = UIColor { traitCollection -> UIColor in
//            if traitCollection.userInterfaceStyle == .dark {
//                return darkModeColor
//            } else {
//                return lightModeColor
//            }
//        }.cgColor
//    }
}
