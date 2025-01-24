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
                        HStack {
                            Image("documents")
                                .foregroundColor(ColorConstants.Background.buttonEnabled)
                            AccessibleText(content: NSLocalizedString("sign_with_certificate", bundle: Bundle.main, comment: ""))
                                .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onTapGesture {
                            self.presentationMode.wrappedValue.dismiss()
                            certificateSignAction.toggle()
                        }
                        
                        HStack {
                            Image("credit-card")
                                .foregroundColor(isNfcEnabled ? ColorConstants.Background.buttonEnabled : Color.gray)
                            AccessibleText(content: NSLocalizedString("sign_with_dni", bundle: Bundle.main, comment: ""))
                                .regularBoldStyle(foregroundColor: isNfcEnabled ? ColorConstants.Text.primary : Color.gray)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onTapGesture {
                            if isNfcEnabled {
                                self.presentationMode.wrappedValue.dismiss()
                                dniSignAction.toggle()
                            }
                        }
                        .disabled(!isNfcEnabled)
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
