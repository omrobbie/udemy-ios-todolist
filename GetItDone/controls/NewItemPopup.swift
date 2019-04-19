//
//  NewItemPopup.swift
//  GetItDone
//
//  Created by omrobbie on 20/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class NewItemPopup: GDGradient {

    let cancel = GDButton(title: "   Cancel   ", type: .roundedText, radius: 4)
    let add = GDButton(title: "   Add   ", type: .roundedText, radius: 4)

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)

        self.layer.cornerRadius = 16

        let inset: CGFloat = 14

        addSubview(cancel)
        cancel.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
        cancel.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
        cancel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        addSubview(add)
        add.rightAnchor.constraint(equalTo: rightAnchor, constant: inset * -1).isActive = true
        add.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
        add.heightAnchor.constraint(equalToConstant: 20).isActive = true

        cancel.addTarget(self, action: #selector(self.handleCancel), for: .touchUpInside)
        add.addTarget(self, action: #selector(self.handleAdd), for: .touchUpInside)
    }

    @objc func handleCancel() {
        print("Trying to handle cancel")
    }

    @objc func handleAdd() {
        print("Tdying to handle add")
    }
}
