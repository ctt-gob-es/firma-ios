import SwiftUI

struct OnboardingView: View {
    var body: some View {
	   NavigationView {
		  ZStack {
			 ColorConstants.Background.main.edgesIgnoringSafeArea(.all)
			 
			 VStack(spacing: 20) {
				Spacer()
				
				Image("onboarding")
				    .resizable()
				    .scaledToFit()
				    .frame(height: 200)
				
				AccessibleText(content: NSLocalizedString("onboarding_title",bundle: Bundle.main ,comment: ""))
				    .titleStyleBlack(
					   foregroundColor: ColorConstants.Text.primary,
					   alignment: .center
				    )
				    .accessibilityAddTraits(.isHeader)
				
				AccessibleText(content: NSLocalizedString("onboarding_message",bundle: Bundle.main ,comment: ""))
				    .regularStyle(
					   foregroundColor: ColorConstants.Text.onboarding,
					   alignment: .center
				    )
				
				Spacer()
				
				VStack {
				    NavigationLink(destination: IntroPolicyView()) {
					   AccessibleText(content: NSLocalizedString("onboarding_button_title",bundle: Bundle.main ,comment: ""))
					}
				    .buttonStyle(CustomButtonStyle(isEnabled: true))
				}
				.padding(.top)
				.background(Color.white)
			 }
			 
			 VStack {
				Spacer()
				Color.white
				    .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0)
			 }
			 .edgesIgnoringSafeArea(.bottom)
		  }
	   }
    }
}
