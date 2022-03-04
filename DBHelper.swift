//
//  DBHelper.swift
//  CASH
//
//  Created by stephen weber on 3/4/22.
//

import Foundation
import UIKit
import CoreData

class DBHelper {
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    static var inst = DBHelper()
    
    func addData(n: String, m: String) {
        let client = NSEntityDescription.insertNewObject(forEntityName: "ClientsData", into: context!) as! ClientsData
        client.email = n
        client.password = m
        
        do {
            try context?.save()
            print("logging in ...data saved.")
        } catch  {
            print("data not saved")
        }
    }
    func getData() -> [ClientsData] {
        
        var client = [ClientsData]()
        
        let fReq = NSFetchRequest<NSFetchRequestResult>(entityName: "ClientsData")
        
        do {
            try client = context?.fetch(fReq) as! [ClientsData]
            print("Got client's record....")
        } catch  {
            print("Failed to get data record of client")
        }

        return client
        
    }
    
}
