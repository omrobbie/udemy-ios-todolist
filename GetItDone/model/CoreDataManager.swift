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

    func createToDo(id: Double, title: String, status: Bool) {
        let context = persistentContainer.viewContext
        let toDo = NSEntityDescription.insertNewObject(forEntityName: "ToDo", into: context)

        toDo.setValue(id, forKey: "id")
        toDo.setValue(title, forKey: "title")
        toDo.setValue(status, forKey: "status")

        do {
            try context.save()
        } catch let error {
            print("Failed to save context with new toDo: ", error)
        }
    }

    func fetchToDo(title: String) -> ToDo? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ToDo>(entityName: "ToDo")

        var toDo: ToDo?

        do {
            let toDos = try context.fetch(fetchRequest)

            toDos.forEach { (fetchToDo) in
                if fetchToDo.title == title {
                    toDo = fetchToDo
                }
            }
        } catch let error {
            print("Failed to fetch request from context: ", error)
        }

        return toDo
    }

    func fetchToDos() -> [ToDo] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ToDo>(entityName: "ToDo")

        do {
            let toDos = try context.fetch(fetchRequest)
            return toDos
        } catch let error {
            print("Failed to fetch request from context: ", error)
            return []
        }
    }

    func deleteToDo(id: Double) {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ToDo>(entityName: "ToDo")

        do {
            let toDos = try context.fetch(fetchRequest)

            toDos.forEach { (fetchToDo) in
                if fetchToDo.id == id {
                    context.delete(fetchToDo)
                }
            }
        } catch let error {
            print("Failed to delete toDos from context: ", error)
        }
    }
}
