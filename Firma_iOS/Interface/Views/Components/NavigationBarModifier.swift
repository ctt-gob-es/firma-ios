//
//  NavigationBar.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

struct NavigationBarModifier: ViewModifier {
    var backgroundColor: UIColor?
    var titleColor: UIColor?
    
    init(backgroundColor: UIColor?, titleColor: UIColor?) {
	   self.backgroundColor = backgroundColor
	   self.titleColor = titleColor
	   let backImage = UIImage(named: "backbutton")?.withRenderingMode(.alwaysOriginal)
	   let appearance = UINavigationBarAppearance()
	   appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
	   appearance.configureWithOpaqueBackground()
	   appearance.backgroundColor = backgroundColor
	   appearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white, .font: UIFont(name: "Merriweather-Bold", size: 20)!, .baselineOffset: 4]
	   appearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]
	   appearance.shadowColor = .clear
	   
	   UINavigationBar.appearance().standardAppearance = appearance
	   UINavigationBar.appearance().compactAppearance = appearance
	   UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    func body(content: Content) -> some View {
	   content
    }
}

extension View {
    func navigationBarColor(_ backgroundColor: UIColor?, titleColor: UIColor?) -> some View {
	   self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }
}

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
	   super.viewWillLayoutSubviews()
	   navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
