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
  
  func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}
