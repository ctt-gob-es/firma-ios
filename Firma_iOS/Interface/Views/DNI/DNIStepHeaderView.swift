//
//  DNIStepHeaderView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 17/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct DNIStepHeaderView: View {
    @Binding var step: ConnectionSteps
    var totalSteps: Int = 3
    var body: some View {
	   VStack(alignment: .leading, spacing: 10) {
		  VStack(alignment: .leading, spacing: 5) {
			 AccessibleText(content: NSLocalizedString("dni_connection_header_title", bundle: Bundle.main, comment: ""))
				.boldStyleSmall(foregroundColor: ColorConstants.Text.secondary)
				.accessibilityAddTraits(.isHeader)
			 
			 AccessibleText(content: step.title)
				.titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
				.accessibilityAddTraits(.isHeader)
			 
			 AccessibleText(content: NSLocalizedString("dni_connection_step", bundle: Bundle.main, comment: "") + " " + String(step.step) + " " +  NSLocalizedString("dni_connection_step_of", bundle: Bundle.main, comment: "") + " " + String(totalSteps))
				.regularStyle(foregroundColor: ColorConstants.Text.secondary)
				.accessibilityAddTraits(.isHeader)
		  }
		  .padding()
		  
		  HStack {
			 StepProgressView(currentStep: step.step, totalSteps: 3)
		  }
	   }
	   .background(ColorConstants.Background.main)
    }
}

struct StepProgressView: View {
    var currentStep: Int
    var totalSteps: Int
    
    var body: some View {
	   VStack {
		  HStack(spacing: 0) {
			 ForEach(1...totalSteps, id: \.self) { step in
				Rectangle()
				    .fill(step <= currentStep ? ColorConstants.Status.success : ColorConstants.Background.buttonDisabled)
				    .frame(maxWidth: .infinity, maxHeight: 4)
			 }
		  }
		  .frame(height: 4)
	   }
    }
}
