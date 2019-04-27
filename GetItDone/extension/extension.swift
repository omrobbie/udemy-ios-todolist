//
//  extension.swift
//  GetItDone
//
//  Created by omrobbie on 11/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

extension UIColor {

    static var blueZero: UIColor {return UIColor.init(hex: 0x64E4FF)}
    static var blueOne: UIColor {return UIColor.init(hex: 0x3A7BD5)}

    static var grayZero: UIColor {return UIColor.init(hex: 0x9b9b9b)}
    static var grayOne: UIColor {return UIColor.init(hex: 0x424242)}

    convenience init(red: Int, green: Int, blue: Int) {
        self.init(
            red: CGFloat(red)/255.0,
            green: CGFloat(green)/255.0,
            blue: CGFloat(blue)/255.0,
            alpha: 1.0
        )
    }

    convenience init(hex: Int) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF
        )
    }
}

extension UIView {

    func checkIfAutoLayout() {
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }
    }

    func animateView(transform: CGAffineTransform, duration: Double) {
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
            self.transform = transform
        }, completion: nil)
    }
}
