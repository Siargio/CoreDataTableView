//
//  ManagedModel.swift
//  CoreDataTableViewHW22
//
//  Created by Sergio on 17.11.22.
//

import CoreData

protocol ManagedModelProtocol {
    func saveContext()
    func fetchUsers() -> [UserInfo]?
    func deleteUser(userInfo: UserInfo)
    func saveUsers(name: String)
    func updateUsersInfo( userInfo: UserInfo,
                          name: String?,
                          birthDay: Date?,
                          gender: String?)
}

class ManagedModel: ManagedModelProtocol {

    // MARK: - Core Data stack

    private let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInfo")
    private lazy var context: NSManagedObjectContext = persistentContainer.viewContext

    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataTableViewHW22")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveUsers(name: String) {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "UserInfo", in: context) else { return }
        let newUserInfo = UserInfo(entity: entityDescription, insertInto: context)
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
        //        guard let models = try? context.fetch(fetchRequest) as? [UserInfo] else { return [] }
        //        return models

        //        let request: NSFetchRequest = UserInfo.fetchRequest()
        //        do {
        //            let result = try? self.context.fetch(request)
        //            return result
        //        }
        do {
            let models = try context.fetch(fetchRequest) as? [UserInfo]
            return models
        } catch {
            print(error)
            return nil
        }
    }

    func deleteUser(userInfo: UserInfo) {
        context.delete(userInfo)
        saveContext()
    }

    func updateUsersInfo(userInfo: UserInfo,
                         name: String?,
                         birthDay: Date?,
                         gender: String?) {

        userInfo.name = name
        userInfo.birthDay = birthDay
        userInfo.gender = gender
        saveContext()
    }
}
