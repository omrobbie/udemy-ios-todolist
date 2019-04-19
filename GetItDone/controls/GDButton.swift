//
//  GDButton.swift
//  GetItDone
//
//  Created by omrobbie on 17/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class GDButton: UIButton {

    var title: String!
    var type: ButtonOptions!
    var radius: CGFloat!

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(title: String = "Title", frame: CGRect = .zero, type: ButtonOptions = .roundedText, radius: CGFloat = 20) {
        super.init(frame: frame)

        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }

        self.title = title
        self.type = type
        self.radius = radius
        self.phaseTwo()
    }

    func phaseTwo() {
        self.setTitle(self.title, for: .normal)
        self.setTitleColor(.grayZero , for: .normal)
        self.backgroundColor = .white

        if let titleLabel = self.titleLabel {
            titleLabel.font = UIFont.init(name: "Raleway-v4020-Regular", size: 16)
        }

        switch self.type {
        case ButtonOptions.roundedText:
            self.roundedText()
        case ButtonOptions.squareIcon:
            self.squareIcon()
        default:
            break;
        }
    }

    func roundedText() {
        self.layer.cornerRadius = self.radius
    }

    func squareIcon() {
        if let titleLabel = self.titleLabel {
            titleLabel.font = UIFont.init(name: "Raleway-v4020-Regular", size: 24)
        }
    }
}
