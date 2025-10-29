//
//  SignModalView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 15/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct SignModalView: View {
    @Binding var contentHeight: CGFloat
    @Binding var certificateSignAction: Bool
    @Binding var dniSignAction: Bool
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isNfcEnabled = UserDefaults.standard.object(forKey: "isNfcEnabled") == nil ? true : UserDefaults.standard.bool(forKey: "isNfcEnabled")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack(spacing: 20) {
                    HStack {
                        AccessibleText(content: NSLocalizedString("sign_file_title", bundle: Bundle.main, comment: ""))
                            .mediumBoldStyle(foregroundColor: ColorConstants.Text.primary)
                            .accessibilityAddTraits(.isHeader)
                        Spacer()
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            ExitButton()
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
				    
				    // Certificate
				    Button(action: {
					   self.presentationMode.wrappedValue.dismiss()
					   certificateSignAction = true
				    }) {
					   HStack {
						  Image("documents")
							 .foregroundColor(ColorConstants.Background.buttonEnabled)
							 .accessibilityHidden(true)

						  AccessibleText(content: NSLocalizedString("sign_with_certificate", bundle: .main, comment: ""))
							 .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
							 .accessibilityHidden(true)
					   }
					   .frame(maxWidth: .infinity, alignment: .leading)
				    }
				    .buttonStyle(.plain)
				    .accessibilityElement(children: .ignore)
				    .accessibilityHint(Text(NSLocalizedString("sign_with_certificate.button.hint", tableName: "Accessibility", bundle: .main, comment: "")))

				    // DNIe
				    Button(action: {
					   if isNfcEnabled {
						  self.presentationMode.wrappedValue.dismiss()
						  dniSignAction = true
					   }
				    }) {
					   HStack {
						  Image("credit-card")
							 .foregroundColor(isNfcEnabled ? ColorConstants.Background.buttonEnabled : .gray)
							 .accessibilityHidden(true)

						  AccessibleText(content: NSLocalizedString("sign_with_dni", bundle: .main, comment: ""))
							 .regularBoldStyle(foregroundColor: isNfcEnabled ? ColorConstants.Text.primary : .gray)
							 .accessibilityHidden(true)
					   }
					   .frame(maxWidth: .infinity, alignment: .leading)
				    }
				    .buttonStyle(.plain)
				    .disabled(!isNfcEnabled)
				    .accessibilityElement(children: .ignore)
				    .accessibilityHint(
					   Text(
						  isNfcEnabled
						  ? NSLocalizedString("sign_with_dni.button.hint.enabled", tableName: "Accessibility", bundle: .main, comment: "")
						  : NSLocalizedString("sign_with_dni.button.hint.disabled", tableName: "Accessibility", bundle: .main, comment: "")
					   )
				    )
                    }
                    Spacer()
                }
                .padding()
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
