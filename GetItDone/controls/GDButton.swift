//
//  GDButton.swift
//  GetItDone
//
//  Created by omrobbie on 17/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class GDButton: UIButton {
    
    var title: String!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(title: String = "Title", frame: CGRect = .zero) {
        super.init(frame: frame)
        
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.title = title
        self.phaseTwo()
    }
    
    func phaseTwo() {
        self.setTitle(self.title, for: .normal)
        self.setTitleColor(.grayZero , for: .normal)
        self.layer.cornerRadius = 20
        self.backgroundColor = .white

        if let titleLabel = self.titleLabel {
            titleLabel.font = UIFont.init(name: "Raleway-v4020-Regular", size: 16)
        }
    }
}
