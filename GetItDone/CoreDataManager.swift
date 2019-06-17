//
//  CoreDataManager.swift
//  GetItDone
//
//  Created by omrobbie on 15/06/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import CoreData

struct CoreDataManager {

    static let shared = CoreDataManager()

    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "GetItDone")

        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                fatalError("Loading of store description failed: \(error)")
            }
        })
        return container
    }()
}
