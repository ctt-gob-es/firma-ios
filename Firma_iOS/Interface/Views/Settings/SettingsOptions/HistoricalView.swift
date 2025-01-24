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
    @State private var contentSheetHeight: CGFloat = 0
    @State var showDeleteModal: Bool = false
    
    var body: some View {
	   VStack() {
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
                .listStyle(PlainListStyle())
                .background(Color.white)
			 .navigationBarTitle(NSLocalizedString("historical_view_title", bundle: Bundle.main, comment: ""))
			 .navigationBarItems(trailing: HStack(spacing: 4) {
                    NavigationBarButton(imageName: "trash_gray", isNativeIcon: false, action: {
                        showDeleteModal.toggle()
                    })
			 })
		  }
	   }
        .sheet(isPresented: $showDeleteModal) {
            DeleteHistoricalModalView(contentHeight: $contentSheetHeight, viewModel: viewModel)
			 .presentationDetents([.height(contentSheetHeight)])
			 .accessibility(addTraits: .isModal)
			 .interactiveDismissDisabled(true)
	   }
    }
    
    private func delete(at offsets: IndexSet) {
	   offsets.forEach { index in
		  let history = viewModel.historyList[index]
		  viewModel.deleteHistory(history: history)
	   }
    }
}
