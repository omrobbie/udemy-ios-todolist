//
//  ViewController.swift
//  GetItDone
//
//  Created by omrobbie on 11/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {
    
    let bg : UIView = {
        let view = GDGradient()
        view.layer.cornerRadius = 6
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(bg)
        bg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
    }
}
