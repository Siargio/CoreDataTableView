//
//  UserInfo+CoreDataProperties.swift
//  CoreDataTableViewHW22
//
//  Created by Sergio on 17.11.22.
//
//

import Foundation
import CoreData

extension UserInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserInfo> {
        return NSFetchRequest<UserInfo>(entityName: "UserInfo")
    }

    @NSManaged public var name: String?
    @NSManaged public var birthDay: Date?
    @NSManaged public var gender: String?
}

extension UserInfo : Identifiable {

}
