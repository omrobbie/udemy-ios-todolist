//
//  GDTextField.swift
//  GetItDone
//
//  Created by omrobbie on 20/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class GDTextField: UITextField {

    var insets: UIEdgeInsets!

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(frame: CGRect = .zero, placeholder: String = "Text Field", radius: CGFloat = 4, inset: CGFloat = 0) {
        super.init(frame: frame)
        checkIfAutoLayout()

        self.backgroundColor = .white
        self.layer.cornerRadius = radius
        self.placeholder = placeholder
        self.insets = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: 0)
        self.textColor = .grayZero
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.insets)
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.insets)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.insets)
    }
}
