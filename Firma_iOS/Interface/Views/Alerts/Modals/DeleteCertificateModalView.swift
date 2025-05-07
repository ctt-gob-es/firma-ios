//
//  DeleteCertificateModal.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 15/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct DeleteCertificateModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var contentHeight: CGFloat
    @Binding var shouldReload: Bool
    
    var certificate: AOCertificateInfo
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack(spacing: 10) {
                    HStack {
                        Image("trash")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64, height: 64)
                        
                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        let accesibilityText =
                        "\(NSLocalizedString("delete_certificate_subtitle", bundle: Bundle.main, comment: "")) \(certificate.subject ?? "") \(NSLocalizedString("delete_certificate_subtitle_2", bundle: Bundle.main, comment: "")) \(certificate.issuer ?? ""))"
                         
                        AccessibleText(content: NSLocalizedString("delete_certificate_title", bundle: Bundle.main, comment: ""))
                            .titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
                            .accessibilityAddTraits(.isHeader)
                            .padding(.bottom)
                        
                        (
                            Text(NSLocalizedString("delete_certificate_subtitle", bundle: Bundle.main, comment: "") + " ")
                                .regularStyle(foregroundColor: ColorConstants.Text.secondary)
                            + Text(certificate.subject)
                                .regularBoldStyle(foregroundColor: ColorConstants.Text.secondary)
                            + Text(" " + NSLocalizedString("delete_certificate_subtitle_2", bundle: Bundle.main, comment: "") + " ")
                                .regularStyle(foregroundColor: ColorConstants.Text.secondary)
                            + Text(certificate.issuer)
                                .regularBoldStyle(foregroundColor: ColorConstants.Text.secondary)
                            + Text("?")
                                .regularStyle(foregroundColor: ColorConstants.Text.secondary)
                        )
                        .accessibilityLabel(Text(accesibilityText))
                        
                        AccessibleText(content: NSLocalizedString("delete_certificate_description", bundle: Bundle.main, comment: ""))
                            .regularStyle(foregroundColor: ColorConstants.Text.secondary)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 10) {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            AccessibleText(content: NSLocalizedString("delete_certificate_cancel_button_title", bundle: Bundle.main, comment: ""))
                                .regularBoldStyle(foregroundColor: ColorConstants.Background.buttonEnabled)
                                .underline()
                        }
                        
                        Button(action: {
                            if SwiftCertificateUtils.deleteCertificate(certificate) == noErr {
                                self.shouldReload = true
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }) {
                            AccessibleText(content: NSLocalizedString("delete_certificate_button_title", bundle: Bundle.main, comment: ""))
                        }
                        .buttonStyle(CustomButtonStyle(isEnabled: true))
                    }
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
