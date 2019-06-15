//
//  GDNewItemPopup.swift
//  GetItDone
//
//  Created by omrobbie on 20/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class GDNewItemPopup: GDGradient {

    let cancel = GDButton(title: "   Cancel   ", type: .roundedText, radius: 4)
    let add = GDButton(title: "   Add   ", type: .roundedText, radius: 4)
    let textField = GDTextField(placeholder: " go buy Ikea frames ")

    var delegate: GDNewItemPopupDelegate?

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)

        self.layer.cornerRadius = 16
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        let inset: CGFloat = 12

        addSubview(cancel)
        cancel.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
        cancel.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
        cancel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        addSubview(add)
        add.rightAnchor.constraint(equalTo: rightAnchor, constant: inset * -1).isActive = true
        add.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
        add.heightAnchor.constraint(equalToConstant: 20).isActive = true

        addSubview(textField)
        textField.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor, constant: inset * -1).isActive = true
        textField.topAnchor.constraint(equalTo: add.bottomAnchor, constant: 12).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 28).isActive = true

        cancel.addTarget(self, action: #selector(self.handleCancel), for: .touchUpInside)
        add.addTarget(self, action: #selector(self.handleAdd), for: .touchUpInside)
    }

    @objc func handleCancel() {
        textField.resignFirstResponder()
    }

    @objc func handleAdd() {
        if let delegate = self.delegate, let textFieldText = self.textField.text {
            delegate.addItemToList(text: textFieldText)
        }
    }
}
