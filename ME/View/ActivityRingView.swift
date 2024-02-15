//
//  ActivityRingView.swift
//  ME
//
//  Created by 새미 on 2/14/24.
//

import UIKit

final class ActivityRingView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: rect.midX, y: rect.midY)

        let outerPath = UIBezierPath(arcCenter: center, radius: 65, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        
        let innerPath = UIBezierPath(arcCenter: center, radius: 40, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        
        outerPath.append(innerPath)
        outerPath.usesEvenOddFillRule = true
        
        UIColor.meOrange.withAlphaComponent(0.3).set()
        outerPath.fill()
    }
}
