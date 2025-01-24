//
//  DNICompatibleView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 17/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct DNICompatibleModalView: View {
    @Binding var contentHeight: CGFloat
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image("info_red")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64, height: 64)
                        Spacer()
                    }
                    .padding(.leading)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        AccessibleText(content: NSLocalizedString("dni_compatible_view_title", bundle: Bundle.main, comment: ""))
                            .titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
                            .accessibilityAddTraits(.isHeader)
                            .padding(.bottom)
                        
                        (
                            Text(NSLocalizedString("dni_compatible_view_description_1", bundle: Bundle.main, comment: ""))
                                .regularStyle(foregroundColor: ColorConstants.Text.secondary)
                            + Text(NSLocalizedString("dni_compatible_view_description_2", bundle: Bundle.main, comment: ""))
                                .regularBoldStyle(foregroundColor: ColorConstants.Text.secondary)
                            + Text(NSLocalizedString("dni_compatible_view_description_3", bundle: Bundle.main, comment: ""))
                                .regularStyle(foregroundColor: ColorConstants.Text.secondary)
                            + Text(NSLocalizedString("dni_compatible_view_description_4", bundle: Bundle.main, comment: ""))
                                .regularBoldStyle(foregroundColor: ColorConstants.Text.secondary)
                            + Text(NSLocalizedString("dni_compatible_view_description_5", bundle: Bundle.main, comment: ""))
                                .regularStyle(foregroundColor: ColorConstants.Text.secondary)
                        )
                        .accessibilityLabel(Text(NSLocalizedString("dni_compatible_view_description_1", bundle: Bundle.main, comment: "") + NSLocalizedString("dni_compatible_view_description_2", bundle: Bundle.main, comment: "")  + NSLocalizedString("dni_compatible_view_description_3", bundle: Bundle.main, comment: "")  + NSLocalizedString("dni_compatible_view_description_4", bundle: Bundle.main, comment: "")  + NSLocalizedString("dni_compatible_view_description_5", bundle: Bundle.main, comment: "") ))
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    VStack(spacing: 10) {
                        Button(action: {
                            if let url = URL(string: NSLocalizedString("dni_portal_url", bundle: Bundle.main, comment: "")) {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            AccessibleText(content: NSLocalizedString("dni_compatible_view_web_portal_button", bundle: Bundle.main, comment: ""))
                                .regularBoldStyle(foregroundColor: ColorConstants.Background.buttonEnabled)
                                .underline()
                        }
                        .padding([.horizontal,.bottom])
                        
                        
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            AccessibleText(content: NSLocalizedString("dni_compatible_view_button_title", bundle: Bundle.main, comment: ""))
                        }
                        .buttonStyle(CustomButtonStyle(isEnabled: true))
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
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
