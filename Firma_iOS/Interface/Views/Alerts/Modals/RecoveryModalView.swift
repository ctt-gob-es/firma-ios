//
//  RecoveryModalView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 16/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct RecoveryModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var contentHeight: CGFloat
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading,spacing: 0) {
                        HStack(spacing: 0) {
                            Spacer()
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }) {
                                ExitButton()
                            }
                        }
                        HStack {
                            Image("img_logo_PRTR")
                        }
                        .padding(.horizontal)
                    }
                    
                    HStack {
                        AccessibleText(content: NSLocalizedString("garrapata_modal_description", bundle: Bundle.main, comment: ""))
                            .regularStyle(foregroundColor: ColorConstants.Text.primary)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                        .padding(.horizontal)
                    HStack {
                        Image("img_logo_ES_Financiado_UE")
                    }
                    .padding(.horizontal)
                    
                    Button(action: {
                        if let url = URL(string: NSLocalizedString("info_view_more_info_url", bundle: Bundle.main, comment: "")) {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        HStack {
                            Spacer()
                            AccessibleText(content: NSLocalizedString("recovery_button_title", bundle: Bundle.main, comment: ""))
                            Image("square_arrow")
                            Spacer()
                        }
                        
                    }
                    .buttonStyle(CustomButtonStyle(isEnabled: true))
                }
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
