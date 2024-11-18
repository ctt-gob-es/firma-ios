//
//  HistoricalUseCase.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 30/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import CoreData

class HistoricalUseCase {
    private let repository: HistoricalRepositoryProtocol

    init(repository: HistoricalRepositoryProtocol = HistoricalRepository()) {
	   self.repository = repository
    }

    func saveHistory(history: HistoryModel, completion: @escaping (Result<Void, ErrorInfo>) -> Void) {
	   repository.saveHistory(history: history, completion: completion)
    }

    func fetchHistory(completion: @escaping (Result<[History], Error>) -> Void) {
	   repository.fetchHistory(completion: completion)
    }

    func deleteHistory(history: History, completion: @escaping (Result<Void, Error>) -> Void) {
	   repository.deleteHistory(history: history, completion: completion)
    }

    func deleteAllHistory(completion: @escaping (Result<Void, Error>) -> Void) {
	   repository.deleteAllHistory(completion: completion)
    }
}
