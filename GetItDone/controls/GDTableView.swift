//
//  GDTableView.swift
//  GetItDone
//
//  Created by omrobbie on 28/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class GDTableView: UITableView {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        checkIfAutoLayout()

        backgroundColor = .clear
        separatorStyle = .none
    }
}
