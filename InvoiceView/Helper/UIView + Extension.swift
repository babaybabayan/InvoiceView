//
//  UIView + Extension.swift
//  InvoiceView
//
//  Created by Binar - Akbar on 12/02/22.
//

import Foundation
import UIKit

extension UIView {
    func addShadowWithoutBezierPath(withShadowColor color: UIColor = .black,
                                    withShadowOpacity opacity: Float = 0.2,
                                    shadowRadius: CGFloat = 4.0,
                                    shadowOffset: CGSize = CGSize(width: .zero, height: 2)) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = opacity
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            clipsToBounds = true
            layer.cornerRadius = radius
            layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
        } else {
            let path = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }
}
