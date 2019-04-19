//
//  ListViewController.swift
//  GetItDone
//
//  Created by omrobbie on 18/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, GDHeaderViewDelegate {

    let header = GDHeaderView()
    let popup = NewItemPopup()

    override func viewDidLoad() {
        super.viewDidLoad()

        header.delegate = self
        view.backgroundColor = .white

        view.addSubview(header)
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 120).isActive = true

        view.addSubview(popup)
        popup.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        popup.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        popup.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        popup.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    func addItem() {
        print("Trying to add item from header")
    }
}
