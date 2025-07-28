//
//  FindDNIModalView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 17/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct FindDNIModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var contentHeight: CGFloat
    @State var model : NFCViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image("search")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64, height: 64)
                        Spacer()
                    }
                    .padding(.leading)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        AccessibleText(content: NSLocalizedString("find_dni_view_title", bundle: Bundle.main, comment: ""))
                            .titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
                            .accessibilityAddTraits(.isHeader)
                            .padding(.bottom)
                        
                        AccessibleText(content: NSLocalizedString("find_dni_view_description", bundle: Bundle.main, comment: ""))
                            .regularStyle(foregroundColor: ColorConstants.Text.primary)
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Spacer()
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: ColorConstants.Text.primary))
                        Spacer()
                    }
                    .padding(.vertical)
                    
                    /*VStack(spacing: 10) {
                     Button(action: {
                     self.presentationMode.wrappedValue.dismiss()
                     }) {
                     AccessibleText(content: NSLocalizedString("cancel_button_title", bundle: Bundle.main, comment: ""))
                     }
                     .buttonStyle(CustomButtonStyle(isEnabled: true))
                     }
                     .frame(maxWidth: .infinity, alignment: .center)*/
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        model.signWithDNIe()
                    }
                }
            }.background(GeometryReader { geometry in
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
