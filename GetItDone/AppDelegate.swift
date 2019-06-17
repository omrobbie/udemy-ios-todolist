//
//  AppDelegate.swift
//  GetItDone
//
//  Created by omrobbie on 11/04/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)

            print("Font family \(family), names \(names)")
        }

        let vc = WelcomeController()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()

        return true
    }
}
