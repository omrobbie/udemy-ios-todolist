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

    lazy var bg: UIView = {
        let view = GDGradient()
        view.layer.cornerRadius = tbInset

        return view
    }()

    let listTable = GDTableView()

    let CELL_ID = "cell_id"

    let tbInset: CGFloat = 16

    var listData = [ToDo]()

    var keyboardHeight: CGFloat = 346

    var bgBottom: NSLayoutConstraint!

    var toDoToUpdate: ToDo?

    override func viewDidLoad() {
        super.viewDidLoad()

        header.delegate = self
        popup.delegate = self
        popup.textField.delegate = self

        listTable.delegate = self
        listTable.dataSource = self
        listTable.register(GDListCell.self, forCellReuseIdentifier: CELL_ID)

        view.backgroundColor = .white

        view.addSubview(header)
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 120).isActive = true

        view.addSubview(bg)
        bg.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20).isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        bgBottom = bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        bgBottom.isActive = true
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true

        view.addSubview(listTable)
        listTable.topAnchor.constraint(equalTo: bg.topAnchor, constant: tbInset).isActive = true
        listTable.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: tbInset * -1).isActive = true
        listTable.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: tbInset * -1).isActive = true
        listTable.leftAnchor.constraint(equalTo: bg.leftAnchor, constant: tbInset).isActive = true

        view.addSubview(popup)
        popup.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        popup.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        popup.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        popup.heightAnchor.constraint(equalToConstant: 80).isActive = true

        listData = CoreDataManager.shared.fetchToDos()

        updateHeaderItemsLeft()
        openAddItemPopup()
    }

    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @objc func keyboardWillShow(notification: Notification) {
        let keyboardSize = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size

        self.keyboardHeight = keyboardSize.height
    }

    func openAddItemPopup() {
        popup.animatePopup()
    }

    func addItemToList(text: String) {
        if notInList(text: text) {
            CoreDataManager.shared.createToDo(id: Double(listData.count), title: text, status: false)
            listData = CoreDataManager.shared.fetchToDos()
            listTable.reloadData()
            updateHeaderItemsLeft()
            popup.textField.text = ""
            popup.animatePopup()
        }
    }

    func updateHeaderItemsLeft() {
        header.itemLeft = 0

        listData.forEach { (toDo) in
            if !toDo.status {
                header.itemLeft += 1
            }
        }
    }

    func notInList(text: String) -> Bool {
        var isNotInList = true

        listData.forEach { (toDo) in
            if toDo.title == text {
                isNotInList = false
            }
        }

        return isNotInList
    }
}

extension ListViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        var heightToAnimate = -keyboardHeight - 20

        if textField == popup.textField {
            popup.animateView(transform: CGAffineTransform(translationX: 0, y: -self.keyboardHeight), duration: 0.7)
            heightToAnimate -= 80
        } else {
            toDoToUpdate = CoreDataManager.shared.fetchToDo(title: textField.text!)
        }

        bgBottom.constant = heightToAnimate

        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        bgBottom.constant = -100

        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()
        }

        if textField == popup.textField {
            popup.animateView(transform: CGAffineTransform(translationX: 0, y: 0), duration: 0.55)
        } else {
            if let toDoToUpdate = toDoToUpdate {
                CoreDataManager.shared.deleteToDo(id: toDoToUpdate.id)
                CoreDataManager.shared.createToDo(id: toDoToUpdate.id, title: toDoToUpdate.title!, status: toDoToUpdate.status)
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource, GDListCellDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "To Do"
        }

        return "Done"
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleForHeader = GDLabel(color: .white, size: 20, frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))

        if section == 0 {
            titleForHeader.text = "To Do"
        } else {
            titleForHeader.text = "Done"
        }

        return titleForHeader
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0

        listData.forEach { (toDo) in
            if section == 0 && !toDo.status {
                count += 1
            } else if section == 1 && toDo.status {
                count += 1
            }
        }

        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! GDListCell

        cell.delegate = self
        cell.textField.delegate = self

        var itemsForSection: [ToDo] = []

        self.listData.forEach { (toDo) in
            if indexPath.section == 0 && !toDo.status {
                itemsForSection.append(toDo)
            } else if indexPath.section == 1 && toDo.status {
                itemsForSection.append(toDo)
            }
        }

        cell.toDo = itemsForSection[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }

    func toggleToDo() {
        listData = CoreDataManager.shared.fetchToDos()
        listTable.reloadData()
        updateHeaderItemsLeft()
    }
}
