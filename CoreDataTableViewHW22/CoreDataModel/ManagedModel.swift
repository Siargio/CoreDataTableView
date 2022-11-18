//
//  ManagedModel.swift
//  CoreDataTableViewHW22
//
//  Created by Sergio on 17.11.22.
//

import Foundation
import CoreData

protocol ManagedModelProtocol: AnyObject {
    func saveContext()
    func fetchUsers() -> [UserInfo]?
    func deleteUser(userInfo: UserInfo)
    func saveUsers(name: String)
}

final class ManagedModel: ManagedModelProtocol {

    // MARK: - Core Data stack

    private let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInfo")
    private lazy var context: NSManagedObjectContext = persistentContainer.viewContext

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataTableViewHW22")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    var managedObject: UserInfo {//
        UserInfo(entity: entityForName(entityName: UserInfo.identifier), insertInto: context)
    }

    // MARK: - Entity

    private func entityForName(entityName: String) -> NSEntityDescription {
        guard let entityDescription = NSEntityDescription.entity(
            forEntityName: entityName,
            in: context) else { return NSEntityDescription() }
        return entityDescription
    }

    // MARK: - Core Data Saving support

    func saveUsers(name: String) {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "UserInfo", in: context) else { return }
        let newUserInfo = UserInfo(entity: entityDescription, insertInto: context)
        //let userInfo = UserInfo(context: context)
        newUserInfo.name = name
        saveContext()
    }

    func saveContext () {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

    func fetchUsers() -> [UserInfo]? {
        guard let models = try? context.fetch(fetchRequest) as? [UserInfo] else { return [] }
        return models
    }

    func deleteUser(userInfo: UserInfo) {
        context.delete(userInfo)
        saveContext()
    }
}
