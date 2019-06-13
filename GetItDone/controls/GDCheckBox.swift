//
//  GDCheckBox.swift
//  GetItDone
//
//  Created by omrobbie on 10/06/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class GDCheckBox: UIButton {

    var delegate: GDListCellDelegate?

    var toggled: Bool? {
        didSet {
            if let toggled = toggled {
                if toggled {
                    backgroundColor = .green
                    setImage(UIImage(named: "done-icon"), for: .normal)
                } else {
                    backgroundColor = .clear
                    setImage(UIImage(), for: .normal)
                }
            }
        }
    }

    @objc func toggleStatus() {
        if let status = toggled, let delegate = self.delegate {
            toggled = !status
            delegate.toggleToDo(status: !status)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false

        layer.borderWidth = 1
        layer.borderColor = UIColor.grayZero.cgColor

        addTarget(self, action: #selector(toggleStatus), for: .touchUpInside)
    }
}
