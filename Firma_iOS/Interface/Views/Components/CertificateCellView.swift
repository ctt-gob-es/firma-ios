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
    var isSelected: Bool?
    @State private var geometryHeight: CGFloat = 0
    
    var body: some View {
	   VStack(alignment: .leading, spacing: 10) {
		  if SwiftCertificateUtils.getCertificateOption(certificate: certificateInfo) != .valid {
			 HStack {
				AccessibleText(content: SwiftCertificateUtils.getCertificateOption(certificate: certificateInfo).title)
				    .semiboldStyleSmall(foregroundColor: .white)
				    .padding(4)
				    .padding(.horizontal, 8)
				    .background(SwiftCertificateUtils.getCertificateOption(certificate: certificateInfo) == .almostExpired ? ColorConstants.Status.success : ColorConstants.Status.error)
				    .cornerRadius(geometryHeight / 2)
				    .background(
					   GeometryReader { geometry in
						  Color.clear
							 .onAppear {
								self.geometryHeight = geometry.size.height
							 }
					   }
				    )
			 }
		  }
		  
		  HStack {
			 VStack {
                    HStack {
                        AccessibleText(content: certificateInfo.subject)
                            .titleStyleBold(foregroundColor: ColorConstants.Text.primary)
                            .accessibilityAddTraits(.isHeader)
                        Spacer()
                    }
                    HStack {
                        AccessibleText(content: "\(NSLocalizedString("certificate_issuer", bundle: Bundle.main, comment: "")) : \(certificateInfo.issuer ?? "")")
                            .regularStyle(foregroundColor: ColorConstants.Text.secondary)
                        Spacer()
                    }
			 }
			 Spacer()
			 
			 if isSelectable ?? false {
				Spacer()
				if let isSelected = isSelected {
				    if isSelected {
					   Image("circle-border-fill")
				    } else {
					   Image("circle")
				    }
				}
			 }
		  }
		  
		  HStack {
			 VStack(alignment: .leading) {
				AccessibleText(content: NSLocalizedString("certificate_valid_date", bundle: Bundle.main, comment: ""))
				    .boldStyleSmall(foregroundColor: ColorConstants.Text.secondary)
				AccessibleText(content: certificateInfo.getExpirationDateString())
				    .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
			 }
			 .frame(maxWidth: .infinity, alignment: .leading)
			 
			 Spacer()
			 
			 VStack(alignment: .leading) {
				AccessibleText(content: NSLocalizedString("certificate_use", bundle: Bundle.main, comment: ""))
				    .boldStyleSmall(foregroundColor: ColorConstants.Text.secondary)
				AccessibleText(content: certificateInfo.getPurposeString())
				    .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
			 }
			 .frame(maxWidth: .infinity, alignment: .leading)
		  }
		  .frame(maxWidth: .infinity)
		  
		  if let isSelectable = isSelectable {
			 if isSelectable == false {
				Button(action: {
				    appStatus.selectedCertificate = self.certificateInfo
				    appStatus.showDeleteModal.toggle()
				}) {
				    AccessibleText(content: NSLocalizedString("certificate_delete", bundle: Bundle.main, comment: ""))
					   .boldStyleSmall(foregroundColor: ColorConstants.Background.buttonEnabled)
					   .underline()
				}
				.buttonStyle(PlainButtonStyle())
			 }
		  }
	   }
	   .onTapGesture {
		  if isSelectable ?? false {
			 appStatus.selectedCertificate = certificateInfo
		  }
	   }
	   .padding()
	   .background(ColorConstants.Background.main)
	   .cornerRadius(10)
	   .contentShape(Rectangle())
    }
}

