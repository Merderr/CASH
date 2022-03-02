//
//  ClientsData+CoreDataProperties.swift
//  CASH
//
//  Created by stephen weber on 3/2/22.
//
//

import Foundation
import CoreData


extension ClientsData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ClientsData> {
        return NSFetchRequest<ClientsData>(entityName: "ClientsData")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?

}

extension ClientsData : Identifiable {

}
