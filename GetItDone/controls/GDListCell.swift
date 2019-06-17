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
    let textField = GDTextField(placeholder: "ToDo", radius: 0, inset: 14)

    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    let box = GDCheckBox()

    var delegate: GDListCellDelegate?

    var toDo: ToDo? {
        didSet {
            if let toDo = toDo {
//                print(toDo.id)
//                print(toDo.title)
//                print(toDo.status)

                box.toggled = toDo.status
//                box.id = toDo.id
                textField.text = toDo.title
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

        view.backgroundColor = .white

        addSubview(view)
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor, constant: 3).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        addSubview(textField)
        textField.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true
        textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        addSubview(box)
        box.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
        box.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        box.widthAnchor.constraint(equalToConstant: 22).isActive = true
        box.heightAnchor.constraint(equalTo: box.widthAnchor).isActive = true

        box.addTarget(self, action: #selector(toggleStatus), for: .touchUpInside)
    }

    @objc func toggleStatus() {
//        if let status = toggled, let delegate = self.delegate, let id = id {
//            toggled = !status
//            delegate.toggleToDo(id: id, status: !status)
//        }

        if let delegate = self.delegate, let toDo = self.toDo {
//            let newTodo = ToDo(id: toDo.id, title: textField.text!, status: !toDo.status)
//            delegate.toggleToDo(toDo: newTodo)
            CoreDataManager.shared.deleteToDo(id: toDo.id)
            CoreDataManager.shared.createToDo(id: toDo.id, title: textField.text!, status: !toDo.status)
            delegate.toggleToDo()
        }
    }
}
