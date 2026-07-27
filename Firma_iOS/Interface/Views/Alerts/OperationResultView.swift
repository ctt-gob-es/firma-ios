//
//  OperationResultView.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 14/7/26.
//  Copyright © 2026 Solid GEAR. All rights reserved.
//

import SwiftUI

struct OperationResultView: View {
    @EnvironmentObject var appStatus: AppStatus

    let content: OperationResultContent

    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            VStack(spacing: 20) {
                Image(content.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 96, height: 96)
                    .accessibilityHidden(true)

                VStack(alignment: .leading, spacing: 12) {
                    AccessibleText(content: content.title)
                        .titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
                        .accessibilityAddTraits(.isHeader)

                    AccessibleText(content: content.description)
                        .regularStyle(foregroundColor: ColorConstants.Text.secondary)

                    AccessibleText(content: content.continuationText)
                        .regularStyle(foregroundColor: ColorConstants.Text.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)

            Spacer()

            VStack(spacing: 10) {
                if content.showRetryButton {
                    Button(action: {
                        appStatus.showOperationResultScreen = false
                    }) {
                        AccessibleText(content: NSLocalizedString("retry_button_title", bundle: Bundle.main, comment: ""))
                    }
                    .buttonStyle(BorderedButtonStyle())
                }

                Button(action: {
                    appStatus.showOperationResultScreen = false
                    NotificationCenter.default.post(name: .CloseSignMode, object: nil, userInfo: nil)
                }) {
                    AccessibleText(content: NSLocalizedString("open_autofirma_button_title", bundle: Bundle.main, comment: ""))
                }
                .buttonStyle(CustomButtonStyle(isEnabled: true))
            }
            .padding(.bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ColorConstants.Background.main.edgesIgnoringSafeArea(.all))
    }
}
