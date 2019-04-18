//
//  GDLabel.swift
//  GetItDone
//
//  Created by omrobbie on 11/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class GDLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(title: String = "GDLabel", color: UIColor = .white, size: CGFloat = 16, textAlignment: NSTextAlignment = .left, frame: CGRect = .zero) {
        super.init(frame: frame)

        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }

        self.text = title
        self.textColor = color
        self.font = UIFont.init(name: "Raleway-v4020-Regular", size: size)
        self.textAlignment = textAlignment
    }
}
