//
//  ReportErrorUseCase.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 30/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class ReportErrorUseCase {
    private let reportErrorRest: ReportErrorRest = ReportErrorRest()

    func reportErrorAsync(
	   urlServlet: String?,
	   docId: String?,
	   error: String,
	   completion: @escaping (Result<Data, Error>) -> Void
    ) {
	   reportErrorRest.reportError(
		  urlServlet: urlServlet,
		  docId: docId,
		  error: error,
		  completion: completion
	   )
    }
}
