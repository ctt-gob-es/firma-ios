//
//  HistoricalViewModel.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 30/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

class HistoricalViewModel: ObservableObject {
    @Published var historyList: [History] = []
    private let historicalUseCase = HistoricalUseCase()

    init() {
	   fetchHistory()
    }

    func fetchHistory() {
	   historicalUseCase.fetchHistory { [weak self] result in
		  switch result {
		  case .success(let historyList):
			 DispatchQueue.main.async {
				self?.historyList = historyList
			 }
		  case .failure(let error):
			 print("Failed to fetch history: \(error)")
		  }
	   }
    }

    func deleteHistory(history: History) {
	   historicalUseCase.deleteHistory(history: history) { [weak self] result in
		  switch result {
		  case .success:
			 self?.fetchHistory()
		  case .failure(let error):
			 print("Failed to delete history: \(error)")
		  }
	   }
    }

    func deleteAllHistory() {
	   historicalUseCase.deleteAllHistory { [weak self] result in
		  switch result {
		  case .success:
			 self?.fetchHistory()
		  case .failure(let error):
			 print("Failed to delete all history: \(error)")
		  }
	   }
    }
}
