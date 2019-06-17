//
//  GDGradient.swift
//  GetItDone
//
//  Created by omrobbie on 11/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class GDGradient: UIView {

    var hexColors:[CGColor] = [
        UIColor.blueZero.cgColor,
        UIColor.blueOne.cgColor
    ]

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)

        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }

        if let layer = self.layer as? CAGradientLayer {
            layer.colors = self.hexColors
            layer.locations = [0.0, 1.2]
        }
    }

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
}
