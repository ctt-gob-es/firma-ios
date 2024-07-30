//
//  HistoricalView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 30/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

struct HistoricalView: View {
    @ObservedObject var viewModel = HistoricalViewModel()
    
    var body: some View {
	   VStack {
		  if viewModel.historyList.isEmpty {
			 VStack {
				Spacer()
				
				NoDataView(
				    title: NSLocalizedString("historical_archives_no_data_title", bundle: Bundle.main, comment: ""),
				    description: NSLocalizedString("historical_archives_no_data_description", bundle: Bundle.main, comment: "")
				)
				
				Spacer()
			 }
		  } else {
			 List {
				ForEach(viewModel.historyList, id: \.self) { history in
				    VStack(alignment: .leading, spacing: 6) {
					   AccessibleText(content: (history.archiveName ?? ""))
						  .mediumBoldStyle(foregroundColor: ColorConstants.Text.primary)
					   if let date = history.date {
						  HStack {
							 Image(systemName: "calendar.badge.clock")
								.foregroundColor(ColorConstants.Text.accent)
							 AccessibleText(content: date.shortFormatted)
								.regularStyle(foregroundColor: ColorConstants.Text.secondary)
						  }
					   }
				    }
				}
				.onDelete(perform: delete)
			 }
			 .navigationBarTitle(NSLocalizedString("historical_view_title", bundle: Bundle.main, comment: ""))
			 .navigationBarItems(trailing: HStack(spacing: 4) {
				NavigationBarButton(imageName: "trash.circle.fill", isNativeIcon: true, action: {
				    viewModel.deleteAllHistory()
				})
			 })
		  }
	   }
    }

    private func delete(at offsets: IndexSet) {
	   offsets.forEach { index in
		  let history = viewModel.historyList[index]
		  viewModel.deleteHistory(history: history)
	   }
    }
}
