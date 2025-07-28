//
//  CertificateInfoModalView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 16/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct CertificateInfoModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var contentHeight: CGFloat
    var title: String
    var message: String
    var onContinue: () -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack(spacing: 10) {
                    ZStack {
                        HStack(alignment: .top) {
                            Spacer()
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }) {
                                ExitButton()
                            }
                        }
                        .offset(y: -15)
                        
                        
                        HStack {
                            Image("info_red")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 64, height: 64)
                                .padding(.horizontal)
                            
                            Spacer()
                        }.padding(.top)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        AccessibleText(content: NSLocalizedString(title, bundle: Bundle.main, comment: ""))
                            .titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
                            .accessibilityAddTraits(.isHeader)
                            .padding(.bottom)
                        
                        AccessibleText(content: NSLocalizedString(message, bundle: Bundle.main, comment: ""))
                            .regularStyle(foregroundColor: ColorConstants.Text.secondary)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    VStack(spacing: 10) {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            AccessibleText(content: NSLocalizedString("cancel_button_title", bundle: Bundle.main, comment: ""))
                                .regularBoldStyle(foregroundColor: ColorConstants.Background.buttonEnabled)
                                .underline()
                        }
                        
                        Button(action: {
                            self.onContinue()
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            AccessibleText(content: NSLocalizedString("continue_button_title", bundle: Bundle.main, comment: ""))
                        }
                        .buttonStyle(CustomButtonStyle(isEnabled: true))
                    }
                    .padding(.bottom)
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
}
