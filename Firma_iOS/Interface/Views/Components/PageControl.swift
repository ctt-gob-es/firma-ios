//
//  PageControl.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 15/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

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
