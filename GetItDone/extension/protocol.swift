//
//  protocol.swift
//  GetItDone
//
//  Created by omrobbie on 19/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

protocol GDHeaderViewDelegate {

    func openAddItemPopup()
}

protocol GDNewItemPopupDelegate {

    func addItemToList(text: String)
}

protocol GDListCellDelegate {

//    func toggleToDo(id: Int, status: Bool)
    func toggleToDo()
}
