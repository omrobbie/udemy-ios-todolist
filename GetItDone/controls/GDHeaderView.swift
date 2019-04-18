//
//  GDHeaderView.swift
//  GetItDone
//
//  Created by omrobbie on 19/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class GDHeaderView: UIView {

    let bg = GDGradient()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(frame: CGRect = .zero, title: String = "Header") {
        super.init(frame: frame)

        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }

        setupLayout()
    }

    func setupLayout() {
        addSubview(bg)
        bg.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bg.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
