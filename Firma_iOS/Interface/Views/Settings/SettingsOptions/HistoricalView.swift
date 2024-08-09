//
//  HistoricalView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 30/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

struct HistoricalView: View {
    @ObservedObject var viewModel = HistoricalViewModel()
    @State var showDeleteModal: Bool = false
    
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
				    HistoricalCell(history: history)
				}
				.onDelete(perform: delete)
			 }
			 .navigationBarTitle(NSLocalizedString("historical_view_title", bundle: Bundle.main, comment: ""))
			 .navigationBarItems(trailing: HStack(spacing: 4) {
				NavigationBarButton(imageName: "trash.circle.fill", isNativeIcon: true, action: {
				    showDeleteModal.toggle()
				})
			 })
		  }
	   }
	   .sheet(isPresented: $showDeleteModal) {
		  DeleteHistoricalModalView(viewModel: viewModel)
			 .fixedSize(horizontal: false, vertical: true)
			 .modifier(GetHeightModifier(height: $viewModel.sheetHeight))
			 .presentationDetents([.height(viewModel.sheetHeight)])
			 .accessibility(addTraits: .isModal)
	   }
    }
    
    private func delete(at offsets: IndexSet) {
	   offsets.forEach { index in
		  let history = viewModel.historyList[index]
		  viewModel.deleteHistory(history: history)
	   }
    }
}

struct HistoricalCell: View {
    @State var history: History
    
    var body: some View {
	   HStack {
		  VStack(alignment: .leading, spacing: 6) {
			 
			 if let externalApp = history.externalApp {
				if externalApp != "" {
				    AccessibleText(content: externalApp)
					   .regularBoldStyle(foregroundColor: ColorConstants.Text.secondary)
					   .underline()
				}
			 }
			 
			 HStack {
				AccessibleText(content: history.filename ?? "")
				    .mediumBoldStyle(foregroundColor: ColorConstants.Text.primary)
				
				Spacer()
			 }
			 
			 HStack {
				if let signType = history.signType {
				    Image(systemName: "signature")
				    
				    AccessibleText(content: NSLocalizedString(signType, bundle: Bundle.main, comment: ""))
					   .mediumBoldStyle(foregroundColor: ColorConstants.Text.primary)
				}
			 }
			 
			 if let date = history.date {
				HStack {
				    Image(systemName: "calendar.badge.clock")
					   .foregroundColor(ColorConstants.Text.accent)
					   .accessibilityHidden(true)
				    
				    AccessibleText(content: date.shortFormatted)
					   .regularStyle(foregroundColor: ColorConstants.Text.secondary)
				    
				    Spacer()
				    
				    if let dataType = history.dataType {
					   AccessibleText(content: NSLocalizedString(dataType, bundle: Bundle.main, comment: ""))
						  .regularStyle(foregroundColor: ColorConstants.Text.secondary)
				    }
				}
			 }
		  }
	   }
    }
}
