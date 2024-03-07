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
  
  func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}
