//
//  CurveView.swift
//  FoodUI
//
//  Created by Kunal Chavan on 03/10/22.
//

import UIKit

class CurveView: UIView {

    override func draw(_ rect: CGRect) {
        let offset: CGFloat = (self.frame.width * 1.5)
        let bounds: CGRect = self.bounds

        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width , height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset , height: bounds.size.height)
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)

        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath

        self.layer.mask = maskLayer
    }
}

class CustomTabbarView: UIView {
    override func draw(_ rect: CGRect) {
        let y: CGFloat = 20
        let curveTo: CGFloat = 0

        let myBezier = UIBezierPath()
        myBezier.move(to: CGPoint(x: 0, y: y))
        myBezier.addQuadCurve(to: CGPoint(x: rect.width, y: y), controlPoint: CGPoint(x: rect.width / 2, y: curveTo))

        myBezier.addLine(to: CGPoint(x: rect.width, y: rect.height))
        myBezier.addLine(to: CGPoint(x: 0, y: rect.height))
        myBezier.close()

        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = myBezier.cgPath

        self.layer.mask = maskLayer
    }
}

extension UICollectionViewCell {
    func shadowDecorate() {
        let radius: CGFloat = 10
        contentView.layer.cornerRadius = radius
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true

        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        layer.backgroundColor = UIColor.clear.cgColor

        contentView.layer.masksToBounds = true
        layer.cornerRadius = 10
        
    }
}
