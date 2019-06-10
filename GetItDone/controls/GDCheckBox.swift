//
//  GDCheckBox.swift
//  GetItDone
//
//  Created by omrobbie on 10/06/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class GDCheckBox: UIButton {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false

        layer.borderWidth = 1
        layer.borderColor = UIColor.grayZero.cgColor
    }
}
