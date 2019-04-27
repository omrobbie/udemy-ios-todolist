//
//  ListViewController.swift
//  GetItDone
//
//  Created by omrobbie on 18/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, GDHeaderViewDelegate, GDNewItemPopupDelegate {

    let header = GDHeaderView(title: "Stuff to get done", subtitle: "4 left")
    let popup = GDNewItemPopup()

    let bg: UIView = {
        let view = GDGradient()
        view.layer.cornerRadius = 24

        return view
    }()

    let listTable = GDTableView()

    let CELL_ID = "cell_id"

    var keyboardHeight: CGFloat = 346

    override func viewDidLoad() {
        super.viewDidLoad()

        header.delegate = self
        popup.delegate = self
        popup.textField.delegate = self

        listTable.delegate = self
        listTable.dataSource = self
        listTable.register(UITableViewCell.self, forCellReuseIdentifier: CELL_ID)

        view.backgroundColor = .white

        view.addSubview(header)
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 120).isActive = true

        view.addSubview(bg)
        bg.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20).isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true

        view.addSubview(listTable)
        listTable.topAnchor.constraint(equalTo: bg.topAnchor, constant: 8).isActive = true
        listTable.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: -8).isActive = true
        listTable.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: -8).isActive = true
        listTable.leftAnchor.constraint(equalTo: bg.leftAnchor, constant: 8).isActive = true

        view.addSubview(popup)
        popup.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        popup.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        popup.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        popup.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: Notification) {
        let keyboardSize = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size

        self.keyboardHeight = keyboardSize.height
    }

    func openAddItemPopup() {
        print("Trying to add item from header")
    }
    func addItemToList(text: String) {
        print("Trying to add \(text) to the list")
    }
}

extension ListViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.popup.animateView(transform: CGAffineTransform(translationX: 0, y: -self.keyboardHeight), duration: 0.7)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        self.popup.animateView(transform: CGAffineTransform(translationX: 0, y: 0), duration: 0.55)
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath)
        cell.textLabel?.text = "This is cell"

        return cell
    }
}
