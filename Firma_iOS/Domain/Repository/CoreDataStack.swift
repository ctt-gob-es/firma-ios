//
//  CoreDataStack.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 30/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()

    private init() {}

    lazy var persistentContainer: NSPersistentContainer = {
	   let container = NSPersistentContainer(name: "AOCoreDataModel")
	   container.loadPersistentStores { (storeDescription, error) in
		  if let error = error as NSError? {
			 fatalError("Unresolved error \(error), \(error.userInfo)")
		  }
	   }
	   return container
    }()

    var context: NSManagedObjectContext {
	   return persistentContainer.viewContext
    }

    func saveContext() {
	   let context = persistentContainer.viewContext
	   if context.hasChanges {
		  do {
			 try context.save()
			 print("Success saving in Core Data")
		  } catch {
			 let nserror = error as NSError
			 fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
		  }
	   } else {
		  print("No changes to save")
	   }
    }
}
