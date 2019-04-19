//
//  GDTextField.swift
//  GetItDone
//
//  Created by omrobbie on 20/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class GDTextField: UITextField {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(frame: CGRect = .zero, placeholder: String = "Text Field", radius: CGFloat = 4) {
        super.init(frame: frame)
        checkIfAutoLayout()

        self.backgroundColor = .white
        self.layer.cornerRadius = radius
        self.placeholder = placeholder
    }
}
