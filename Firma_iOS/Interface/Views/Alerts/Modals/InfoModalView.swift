//
//  InfoModalView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 12/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
import SwiftUI

struct InfoModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var contentHeight: CGFloat
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack(spacing: 20) {
                    HStack {
                        AccessibleText(content: NSLocalizedString("info_view_title", bundle: Bundle.main, comment: ""))
                            .mediumBoldStyle(foregroundColor: ColorConstants.Text.primary)
                            .accessibilityAddTraits(.isHeader)
                        Spacer()
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            ExitButton()
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        AccessibleText(content: NSLocalizedString("info_view_description", bundle: Bundle.main, comment: ""))
                            .regularStyle(foregroundColor: ColorConstants.Text.secondary)
                        
                        AccessibleText(content: NSLocalizedString("info_view_certificate_title", bundle: Bundle.main, comment: ""))
                            .mediumBoldStyle(foregroundColor: ColorConstants.Text.primary)
                        
                        HStack(alignment: .top) {
                            IconView(iconName: "button_share")
                            AccessibleText(content: NSLocalizedString("info_view_certificate_description_one", bundle: Bundle.main, comment: ""))
                                .regularStyle(foregroundColor: ColorConstants.Text.primary)
                        }
                        
                        HStack(alignment: .top) {
                            IconView(iconName: "button_document")
                            AccessibleText(content: NSLocalizedString("info_view_certificate_description_two", bundle: Bundle.main, comment: ""))
                                .regularStyle(foregroundColor: ColorConstants.Text.primary)
                        }
                    }
                    
                    Spacer()
                    
                    /*Button(action: {
                     if let url = URL(string: "https://www.fondoseuropeos.hacienda.gob.es/sitios/dgpmrr/es-es/Paginas/Inicio.aspx") {
                     UIApplication.shared.open(url)
                     }
                     }) {
                     AccessibleText(content: NSLocalizedString("info_view_more_info", bundle: Bundle.main, comment: ""))
                     .regularBoldStyle(foregroundColor: ColorConstants.Background.buttonEnabled)
                     .foregroundColor(ColorConstants.Background.buttonEnabled)
                     .underline()
                     .frame(maxWidth: .infinity, alignment: .center)
                     }*/
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        AccessibleText(content: NSLocalizedString("info_view_button_title", bundle: Bundle.main, comment: ""))
                    }
                    .buttonStyle(CustomButtonStyle(isEnabled: true))
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

struct IconView: View {
    let iconName: String
    
    var body: some View {
	   Image(iconName)
		  .resizable()
		  .scaledToFit()
		  .frame(width: 56, height: 56)
		  .foregroundColor(ColorConstants.Background.buttonEnabled)
		  .background(ColorConstants.Text.background)
		  .cornerRadius(8)
    }
}
