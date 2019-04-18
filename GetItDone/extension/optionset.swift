//
//  optionset.swift
//  GetItDone
//
//  Created by omrobbie on 19/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

struct ButtonOptions: OptionSet {
    let rawValue: Int

    static let roundedText = ButtonOptions(rawValue: 1 << 0)
    static let squareIcon = ButtonOptions(rawValue: 1 << 1)
}
