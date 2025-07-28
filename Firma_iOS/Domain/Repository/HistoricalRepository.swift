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
    func saveHistory(history: HistoryModel, completion: @escaping (Result<Void, AppError>) -> Void)
    func fetchHistory(completion: @escaping (Result<[History], Error>) -> Void)
    func deleteHistory(history: History, completion: @escaping (Result<Void, Error>) -> Void)
    func deleteAllHistory(completion: @escaping (Result<Void, Error>) -> Void)
}

class HistoricalRepository: HistoricalRepositoryProtocol {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = CoreDataStack.shared.context) {
	   self.context = context
    }

    func saveHistory(history: HistoryModel, completion: @escaping (Result<Void, AppError>) -> Void) {
	   let historyCoreData = History(context: context)
	   historyCoreData.date = history.date
	   historyCoreData.signType = history.signType.rawValue
	   historyCoreData.externalApp = history.externalApp
	   historyCoreData.dataType = history.dataType.rawValue
	   historyCoreData.filename = history.filename
	   historyCoreData.returnURL = history.returnURL
	   historyCoreData.operation = history.operation

	   do {
		  try context.save()
		  completion(.success(()))
            //completion(.failure(AppError.saveHistorySign))
	   } catch {
            completion(.failure(AppError.saveHistorySign))
	   }
    }

    func fetchHistory(completion: @escaping (Result<[History], Error>) -> Void) {
	   let fetchRequest: NSFetchRequest<History> = History.fetchRequest()

        // Agregar un NSSortDescriptor para ordenar por el campo "date" en orden descendente
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]

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
