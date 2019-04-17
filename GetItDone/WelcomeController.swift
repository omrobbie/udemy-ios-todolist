//
//  ViewController.swift
//  GetItDone
//
//  Created by omrobbie on 11/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {
    
    let bg:UIView = {
        let view = GDGradient()
        view.layer.cornerRadius = 6
        
        return view
    }()
    
    let titleLabel = GDLabel(title: "GET IT DONE!", size: 24, textAlignment: .center)
    
    let infoLabel:UILabel = {
        let label = GDLabel(title: "WELCOME, GET IT DONE IS A TO DO LIST.\nA REALLY DOPE TO-DO-LIST.", size: 14, textAlignment: .center)
        label.numberOfLines = 2
        
        return label
    }()
    
    let copyright = GDLabel(title: "© 2019 | omrobbie.com", color: .grayZero, size: 14, textAlignment: .center)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(bg)
        bg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        view.addSubview(titleLabel)
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: bg.topAnchor, constant: 60).isActive = true
        
        bg.addSubview(infoLabel)
        infoLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        infoLabel.centerYAnchor.constraint(equalTo: bg.centerYAnchor).isActive = true
        infoLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        bg.addSubview(copyright)
        copyright.widthAnchor.constraint(equalToConstant: 200).isActive = true
        copyright.heightAnchor.constraint(equalToConstant: 40).isActive = true
        copyright.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        copyright.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
}
