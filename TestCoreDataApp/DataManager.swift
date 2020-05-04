//
//  DataManager.swift
//  TestCoreDataApp
//
//  Created by user167484 on 4/18/20.
//  Copyright © 2020 Allen Savio. All rights reserved.
//

import Foundation
import CoreData
import UIKit

enum Models: String {
    case user = "User"
    
}

class DataManager {
    static let shared = DataManager()
    private init() {}
    
    var context: NSManagedObjectContext? {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        return context
    }
    
    typealias DataCompletion<T: NSManagedObject> = (_ entity: T, _ context: NSManagedObjectContext) -> Void
    func saveEntity<T: NSManagedObject>(success: DataCompletion<T>) {
        guard let context = context else { return }
        defer {
            print("In defer closure")
            try? context.save()
        }
        let entityDescription = T.entity()
        let entity = T(entity: entityDescription, insertInto: context)
        success(entity, context)
    }
    
    func fetchEntities<T: NSManagedObject>() -> [T] {
        guard let context = context else { return [] }
        let entityDesc = T.entity()
        print("Entity Desc nmae is \(entityDesc.name)")
        let fetchRequest = NSFetchRequest<T>(entityName: entityDesc.name!)
        do {
            let fetchedResults = try context.fetch(fetchRequest)
            return fetchedResults
        } catch let error as NSError {
            // something went wrong, print the error.
            print(error.description)
        }
        return []
    }
    
}
