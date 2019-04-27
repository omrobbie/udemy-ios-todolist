//
//  GDListCell.swift
//  GetItDone
//
//  Created by omrobbie on 28/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class GDListCell: UITableViewCell {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        textLabel?.textColor = .grayZero
        selectionStyle = .none
        backgroundColor = .white
    }
}
