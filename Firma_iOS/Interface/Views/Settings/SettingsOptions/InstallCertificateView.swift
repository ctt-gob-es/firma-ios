//
//  InstallCertificate.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 12/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct InstallCertificateView: View {
    @State private var selectedTab = 0
    
    var body: some View {
	   TabView(selection: $selectedTab) {
		  ContentView(
			 imageName: "install_certificate_1",
			 title: LocalizedStringKey("install_certificate_title_one"),
			 description: LocalizedStringKey("install_certificate_description_one"),
			 buttonText: LocalizedStringKey("install_certificate_button_one_title"),
			 buttonAction: {
				selectedTab = 1
			 },
			 currentPage: selectedTab,
			 numberOfPages: 2
		  )
		  .tag(0)

		  ContentView(
			 imageName: "install_certificate_2",
			 title: LocalizedStringKey("install_certificate_title_two"),
			 description: LocalizedStringKey("install_certificate_description_two"),
			 buttonText: LocalizedStringKey("install_certificate_button_two_title"),
			 buttonAction: {
				// TODO:
			 },
			 currentPage: selectedTab,
			 numberOfPages: 2
		  )
		  .tag(1)
	   }
	   .navigationTitle("install_certificate_title")
	   .tabViewStyle(.page(indexDisplayMode: .never))
	   .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
    }
}

struct ContentView: View {
    let imageName: String
    let title: LocalizedStringKey
    let description: LocalizedStringKey
    let buttonText: LocalizedStringKey
    let buttonAction: () -> Void
    let currentPage: Int
    let numberOfPages: Int

    var body: some View {
	   VStack {
		  VStack(alignment: .leading) {
			 Text(title)
				.titleStyle(foregroundColor: .black)
			 
			 Text(description)
				.regularStyle(foregroundColor: .black)
				.multilineTextAlignment(.leading)
		  }
		  .frame(maxWidth: .infinity, alignment: .leading)

		  Image(imageName)
			 .resizable()
			 .scaledToFit()

		  Spacer()

		  PageControl(numberOfPages: numberOfPages, currentPage: .constant(currentPage))
			 .padding(.vertical)

		  Button(action: buttonAction) {
			 Text(buttonText)
		  }
		  .buttonStyle(CustomButtonStyle(isEnabled: true))
		  .padding(.bottom, 20)
	   }
	   .padding()
	   .background(Color.white)
    }
}

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int

    func makeUIView(context: Context) -> UIPageControl {
	   let control = UIPageControl()
	   control.numberOfPages = numberOfPages
	   control.currentPage = currentPage
	   control.pageIndicatorTintColor = UIColor(hex: "#5B5B5B", alpha: 1)
	   control.currentPageIndicatorTintColor = UIColor(hex: "#A6301E", alpha: 1)

	   // Personaliza los indicadores
	   control.setIndicatorImage(createCustomIndicatorImage(isCurrent: true), forPage: currentPage)
	   for page in 0..<numberOfPages {
		  if page != currentPage {
			 control.setIndicatorImage(createCustomIndicatorImage(isCurrent: false), forPage: page)
		  }
	   }

	   return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
	   uiView.currentPage = currentPage

	   // Actualiza las imágenes de los indicadores
	   uiView.setIndicatorImage(createCustomIndicatorImage(isCurrent: true), forPage: currentPage)
	   for page in 0..<numberOfPages {
		  if page != currentPage {
			 uiView.setIndicatorImage(createCustomIndicatorImage(isCurrent: false), forPage: page)
		  }
	   }
    }

    private func createCustomIndicatorImage(isCurrent: Bool) -> UIImage? {
	   let diameter: CGFloat = isCurrent ? 16 : 8
	   let frame = CGRect(x: 0, y: 0, width: diameter, height: diameter)
	   UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
	   let context = UIGraphicsGetCurrentContext()!

	   if isCurrent {
		  // Dibujar círculo de fondo
		  context.setFillColor(UIColor(hex: "#A6301E", alpha: 0.2).cgColor)
		  context.fillEllipse(in: frame)

		  // Dibujar círculo interior
		  let innerDiameter: CGFloat = 12
		  let innerFrame = CGRect(
			 x: (diameter - innerDiameter) / 2,
			 y: (diameter - innerDiameter) / 2,
			 width: innerDiameter,
			 height: innerDiameter
		  )
		  context.setFillColor(UIColor(hex: "#A6301E", alpha: 1).cgColor)
		  context.fillEllipse(in: innerFrame)
	   } else {
		  // Dibujar círculo sin interior
		  context.setFillColor(UIColor(hex: "#5B5B5B", alpha: 1).cgColor)
		  context.fillEllipse(in: frame)
	   }

	   let image = UIGraphicsGetImageFromCurrentImageContext()
	   UIGraphicsEndImageContext()

	   return image
    }
}
