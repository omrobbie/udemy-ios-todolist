//
//  GDListCell.swift
//  GetItDone
//
//  Created by omrobbie on 28/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class GDListCell: UITableViewCell {

//    let titleLabel = GDLabel(color: .grayZero, size: 14)
    let titleLabel = GDTextField(placeholder: "ToDo", radius: 0, inset: 14)

    var toDo: ToDo? {
        didSet {
            if let toDo = toDo {
//                print(toDo.id)
//                print(toDo.title)
//                print(toDo.status)

                self.titleLabel.text = toDo.title
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        backgroundColor = .clear

        addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        titleLabel.backgroundColor = .white
    }
}
