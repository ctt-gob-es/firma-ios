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
				
				Text("onboarding_title")
				    .titleStyle(
					   foregroundColor: ColorConstants.Text.primary,
					   alignment: .center
				    )
				    .accessibility(label: Text("onboarding_title"))
				    .accessibility(addTraits: .isHeader)
				
				Text("onboarding_message")
				    .regularStyle(
					   foregroundColor: ColorConstants.Text.onboarding,
					   alignment: .center
				    )
				    .accessibility(label: Text("onboarding_message"))
				
				Spacer()
				
				VStack {
				    NavigationLink(destination: PrivacyView()) {
					   Text("onboarding_button_title")
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
