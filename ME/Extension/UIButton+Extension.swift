import UIKit

extension UIButton {
    enum BorderPosition {
        case top
        case bottom
        case left
        case right
    }
    
    func addBorder(positions: [BorderPosition], color: UIColor, width: CGFloat) {
        let borderLayer = CAShapeLayer()
        borderLayer.frame = bounds
        borderLayer.lineWidth = width
        borderLayer.strokeColor = color.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        
        let path = UIBezierPath()
        
        if positions.contains(.top) {
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: bounds.size.width, y: 0))
        }
        
        if positions.contains(.bottom) {
            path.move(to: CGPoint(x: 0, y: bounds.size.height))
            path.addLine(to: CGPoint(x: bounds.size.width, y: bounds.size.height))
        }
        
        if positions.contains(.left) {
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: bounds.size.height))
        }
        
        if positions.contains(.right) {
            path.move(to: CGPoint(x: bounds.size.width, y: 0))
            path.addLine(to: CGPoint(x: bounds.size.width, y: bounds.size.height))
        }
        
        borderLayer.path = path.cgPath
        layer.addSublayer(borderLayer)
    }
    
    func setTitleColorForMode(darkModeColor: UIColor, lightModeColor: UIColor) {
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
                return traitCollection.userInterfaceStyle == .dark ? darkModeColor : lightModeColor
            }
            setTitleColor(dynamicColor, for: .normal)
        } else {
            setTitleColor(lightModeColor, for: .normal)
        }
    }
}
