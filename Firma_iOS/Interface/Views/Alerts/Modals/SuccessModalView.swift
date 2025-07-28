//
//  SuccessModalView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 16/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct SuccessModalView: View {
    @Environment(\.presentationMode) var presentationMode

    @Binding var contentHeight: CGFloat
    var title: String
    var description: String
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack(spacing: 10) {
                    HStack {
                        Image("tick")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64, height: 64)
                        Spacer()
                    }
                    .padding(.leading)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        AccessibleText(content: title)
                            .titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
                            .accessibilityAddTraits(.isHeader)
                            .padding(.bottom)
                        
                        AccessibleText(content: description)
                            .regularStyle(foregroundColor: ColorConstants.Text.secondary)
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    VStack(spacing: 10) {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            AccessibleText(content: NSLocalizedString("info_view_button_title", bundle: Bundle.main, comment: ""))
                        }
                        .buttonStyle(CustomButtonStyle(isEnabled: true))
                    }
                }.padding()
            }
            .background(GeometryReader { geometry in
                Color.white.onAppear {
                    // Medir la altura del contenido cuando se muestra
                    contentHeight = geometry.size.height
                }
            })
            .fixedSize(horizontal: false, vertical: true) // Ajuste del contenido
            .modifier(GetHeightModifier(height: $contentHeight)) // Modificar la altura
            .cornerRadius(10)
        }
    }
}

enum SuccessModalState {
    case successCertificateAdded
    case successCertificateSent
    case successCertificateDeleted
    case successSign
    case successSignBatch
    case successSignBatchWithError
    case successSignBatchWithAllError
    case successArhiveAdded
    
    var title: String {
	   switch self {
		  case .successCertificateAdded:
			 return NSLocalizedString("certificate_added_success_title",bundle: Bundle.main, comment: "")
		  case .successCertificateSent:
			 return NSLocalizedString("certificate_sent_success_title",bundle: Bundle.main, comment: "")
		  case .successCertificateDeleted:
			 return NSLocalizedString("certificate_delete_success_title",bundle: Bundle.main, comment: "")
            case .successSign, .successSignBatch, .successSignBatchWithError, .successSignBatchWithAllError:
			 return NSLocalizedString("sign_success_title",bundle: Bundle.main, comment: "")
		  case .successArhiveAdded:
			 return NSLocalizedString("save_success_title",bundle: Bundle.main, comment: "")
	   }
    }
    
    var description: String {
	   switch self {
		  case .successCertificateAdded:
			 return NSLocalizedString("certificate_added_success_description",bundle: Bundle.main, comment: "")
		  case .successCertificateSent:
			 return NSLocalizedString("certificate_sent_success_description",bundle: Bundle.main, comment: "")
		  case .successCertificateDeleted:
			 return NSLocalizedString("certificate_delete_success_description",bundle: Bundle.main, comment: "")
		  case .successSign:
			 return NSLocalizedString("sign_success_description",bundle: Bundle.main, comment: "")
            case .successSignBatch:
                return NSLocalizedString("batch_signs_all_ok",bundle: Bundle.main, comment: "")
            case .successSignBatchWithError:
                return NSLocalizedString("batch_signs_ok_with_signs_error",bundle: Bundle.main, comment: "")
            case .successSignBatchWithAllError:
                return NSLocalizedString("batch_signs_ok_with_all_signs_error",bundle: Bundle.main, comment: "")
		  case .successArhiveAdded:
			 return NSLocalizedString("save_success_description",bundle: Bundle.main, comment: "")
	   }
    }
}
