//
//  UpdateAppView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 17/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct HomeErrorView: View {
    var state: HomeErrorState
    
    var body: some View {
	   VStack(spacing: 10) {
		  Spacer()
		  
		  Image(state.imageName)
			 .resizable()
			 .scaledToFit()
			 .frame(width: 72, height: 72)
			 .padding(.vertical, 16)
		  
		  AccessibleText(content: state.title)
			 .titleStyleBlack(
				foregroundColor: ColorConstants.Text.primary,
				alignment: .center
			 )
			 .padding(.horizontal)
		  
		  AccessibleText(content: state.description)
			 .regularStyle(
				foregroundColor: ColorConstants.Text.secondary,
				alignment: .center
			 )
			 .padding(.horizontal)
		  
		  Spacer()
		  
		  Button(action: {
			 state.action
		  }) {
			 AccessibleText(content: state.buttonTitle)
		  }
		  .buttonStyle(CustomButtonStyle(isEnabled: true))
	   }
    }
}

enum HomeErrorState {
    case updateNeeded
    case connectionError
    
    var title: String {
	   switch self {
		  case .updateNeeded:
			 return NSLocalizedString("home_update_app_title", bundle: Bundle.main, comment: "")
		  case .connectionError:
			 return NSLocalizedString("home_init_error_app_title", bundle: Bundle.main, comment: "")
	   }
    }
    
    var description: String {
	   switch self {
		  case .updateNeeded:
			 return NSLocalizedString("home_update_app_description", bundle: Bundle.main, comment: "")
		  case .connectionError:
			 return NSLocalizedString("home_init_error_app_description", bundle: Bundle.main, comment: "")
	   }
    }
    
    var imageName: String {
	   switch self {
		  case .updateNeeded:
			 return "download"

		  case .connectionError:
			 return "wifi"
	   }
    }
    
    var buttonTitle: String {
	   switch self {
		  case .updateNeeded:
			 return NSLocalizedString("home_update_app_button_title", bundle: Bundle.main, comment: "")
		  case .connectionError:
			 return NSLocalizedString("home_init_error_app_button_title", bundle: Bundle.main, comment: "")
	   }
    }
    
    var action: () {
	   switch self {
		  case .updateNeeded:
			 //TODO: implemenent Action
			 return
		  case .connectionError:
			 //TODO: implemenent Action
			 return
	   }
    }
}
