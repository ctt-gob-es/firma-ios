//
//  CertificateCellView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 15/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct CertificateCellView: View {
    @EnvironmentObject private var appStatus : AppStatus
    var certificateInfo: AOCertificateInfo
    @Binding var isSelectable: Bool?
    var isSelected: Bool = false
    @State private var geometryHeight: CGFloat = 0

    var body: some View {
	   content
		  .padding()
		  .background(ColorConstants.Background.main)
		  .cornerRadius(10)
		  .contentShape(Rectangle())
    }

    @ViewBuilder
    private var content: some View {
	   let header = headerView()
	   let subject = certificateInfo.subject ?? ""
	   
	   if isSelectable ?? false {
		  Button {
			 appStatus.selectedCertificate = certificateInfo
		  } label: {
			 header
		  }
		  .buttonStyle(.plain)
		  .accessibilityElement(children: .ignore)
		  .accessibilityLabel(Text(combinedAXLabel()))
		  .accessibilityAddTraits(.isButton)
		  .accessibilityAddTraits(isSelected ? .isSelected : [])
	   } else {
		  VStack(alignment: .leading, spacing: 10) {
			 header
				.accessibilityElement(children: .ignore)
				.accessibilityLabel(Text(combinedAXLabel()))
				.accessibilityAddTraits(.isStaticText)

			 Button {
				appStatus.selectedCertificate = self.certificateInfo
				appStatus.showDeleteModal.toggle()
			 } label: {
				AccessibleText(content: NSLocalizedString("certificate_delete", bundle: .main, comment: ""))
				    .boldStyleSmall(foregroundColor: ColorConstants.Background.buttonEnabled)
				    .underline()
			 }
			 .buttonStyle(.plain)
			 .accessibilityLabel(
				Text(
				    String(
					   format: NSLocalizedString("button_delete_certificate",
										    tableName: "Accessibility",
										    bundle: .main,
										    comment: ""),
					   subject
				    )
				)
			 )
		  }
	   }
    }

    private func headerView() -> some View {
	   let badgeOption = SwiftCertificateUtils.getCertificateOption(certificate: certificateInfo)

	   return VStack(alignment: .leading, spacing: 10) {
		  if badgeOption != .valid {
			 HStack {
				AccessibleText(content: badgeOption.title)
				    .semiboldStyleSmall(foregroundColor: .white)
				    .padding(4)
				    .padding(.horizontal, 8)
				    .background(badgeOption == .almostExpired ? ColorConstants.Status.success : ColorConstants.Status.error)
				    .cornerRadius(geometryHeight / 2)
				    .background(
					   GeometryReader { g in
						  Color.clear.onAppear { geometryHeight = g.size.height }
					   }
				    )
				    .accessibilityHidden(true)
			 }
		  }

		  HStack {
			 VStack(alignment: .leading, spacing: 6) {
				HStack {
				    AccessibleText(content: certificateInfo.subject)
					   .titleStyleBold(foregroundColor: ColorConstants.Text.primary)
					   .accessibilityAddTraits(.isHeader)
				    Spacer()
				}
				HStack {
				    AccessibleText(content: "\(NSLocalizedString("certificate_issuer", bundle: .main, comment: "")) : \(certificateInfo.issuer ?? "")")
					   .regularStyle(foregroundColor: ColorConstants.Text.secondary)
				    Spacer()
				}
			 }
			 Spacer()
			 if isSelectable ?? false {
				Image(isSelected ? "circle-border-fill" : "circle")
				    .accessibilityHidden(true)
			 }
		  }

		  HStack {
			 VStack(alignment: .leading) {
				AccessibleText(content: NSLocalizedString("certificate_valid_date", bundle: .main, comment: ""))
				    .boldStyleSmall(foregroundColor: ColorConstants.Text.secondary)
				AccessibleText(content: certificateInfo.getExpirationDateString() ?? "")
				    .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
			 }
			 .frame(maxWidth: .infinity, alignment: .leading)

			 Spacer()

			 VStack(alignment: .leading) {
				AccessibleText(content: NSLocalizedString("certificate_use", bundle: .main, comment: ""))
				    .boldStyleSmall(foregroundColor: ColorConstants.Text.secondary)
				AccessibleText(content: certificateInfo.getPurposeString() ?? "")
				    .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
			 }
			 .frame(maxWidth: .infinity, alignment: .leading)
		  }
		  .frame(maxWidth: .infinity)
	   }
    }

    private func combinedAXLabel() -> String {
	   var parts: [String] = []

	   guard let subject = certificateInfo.subject else { return "" }
	   parts.append(subject)

	   if let issuer = certificateInfo.issuer, !issuer.isEmpty {
		  let issuerTitle = NSLocalizedString("certificate_issuer", bundle: .main, comment: "")
		  parts.append("\(issuerTitle): \(issuer)")
	   }

	   let validTitle = NSLocalizedString("certificate_valid_date", bundle: .main, comment: "")
	   parts.append("\(validTitle): \(certificateInfo.getExpirationDateString() ?? "")")

	   let useTitle = NSLocalizedString("certificate_use", bundle: .main, comment: "")
	   parts.append("\(useTitle): \(certificateInfo.getPurposeString() ?? "")")

	   let badgeOption = SwiftCertificateUtils.getCertificateOption(certificate: certificateInfo)
	   if badgeOption != .valid {
		  parts.insert(badgeOption.title, at: 0)
	   }

	   return parts.joined(separator: ". ")
    }
}
