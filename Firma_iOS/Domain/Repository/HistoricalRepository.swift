//
//  HistoricalRepository.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 30/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import CoreData

protocol HistoricalRepositoryProtocol {
    func saveHistory(archiveName: String, date: Date, completion: @escaping (Result<Void, Error>) -> Void)
    func fetchHistory(completion: @escaping (Result<[History], Error>) -> Void)
    func deleteHistory(history: History, completion: @escaping (Result<Void, Error>) -> Void)
    func deleteAllHistory(completion: @escaping (Result<Void, Error>) -> Void)
}

class HistoricalRepository: HistoricalRepositoryProtocol {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = CoreDataStack.shared.context) {
	   self.context = context
    }

    func saveHistory(archiveName: String, date: Date, completion: @escaping (Result<Void, Error>) -> Void) {
	   let history = History(context: context)
	   history.archiveName = archiveName
	   history.date = date

	   do {
		  try context.save()
		  completion(.success(()))
	   } catch {
		  completion(.failure(error))
	   }
    }

    func fetchHistory(completion: @escaping (Result<[History], Error>) -> Void) {
	   let fetchRequest: NSFetchRequest<History> = History.fetchRequest()

	   do {
		  let historyList = try context.fetch(fetchRequest)
		  completion(.success(historyList))
	   } catch {
		  completion(.failure(error))
	   }
    }

    func deleteHistory(history: History, completion: @escaping (Result<Void, Error>) -> Void) {
	   context.delete(history)
	   do {
		  try context.save()
		  completion(.success(()))
	   } catch {
		  completion(.failure(error))
	   }
    }
    
    func deleteAllHistory(completion: @escaping (Result<Void, Error>) -> Void) {
	   let fetchRequest: NSFetchRequest<NSFetchRequestResult> = History.fetchRequest()
	   let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

	   do {
		  try context.execute(batchDeleteRequest)
		  try context.save()
		  completion(.success(()))
	   } catch {
		  completion(.failure(error))
	   }
    }
}
