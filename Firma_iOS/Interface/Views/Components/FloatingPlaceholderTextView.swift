import SwiftUI

struct FloatingPlaceholderTextField: View {
    @State var placeholder: String
    @State var errorplaceholder: String
    @Binding var text: String
    @Binding var showError: Bool
    @State var imageName: String
    @State var isSecureTextEntry: Bool
    @State var validation: (_ :String) -> Bool
    @State private var isFocused: Bool = false
    @State var isSecureTextShown: Bool = false
    @State var keyboardType: UIKeyboardType = .default
    
    @FocusState private var isInputFocused: Bool
    
    var body: some View {
	   VStack(alignment: .leading) {
		  VStack(alignment: .leading, spacing: 0) {
			 AccessibleText(content: placeholder)
				.regularStyle(foregroundColor: ColorConstants.Text.secondary)
				.padding(.horizontal)
				.offset(y: isFocused || !text.isEmpty ? 0 : 20)
				.scaleEffect(isFocused || !text.isEmpty ? 0.75 : 1.0, anchor: .zero)
				.padding(.top, 4)
			 
			 HStack {
				if isSecureTextEntry && !isSecureTextShown {
				    SecureField("", text: $text, onCommit: {
					   isFocused = false
				    })
				    .onTapGesture {
					   isFocused = true
				    }
				    .font(.custom("NunitoSans10pt-Regular", size: 16))
				    .foregroundColor(.primary)
				    .padding(.horizontal)
				    .textInputAutocapitalization(.none)
				    .autocapitalization(.none)
				    .focused($isInputFocused)
				} else {
				    TextField("",
						    text: $text,
						    onEditingChanged: { editing in
					   isFocused = editing
					   if text != "" {
						  showError = !validation(text)
					   } else {
						  showError = false
					   }
				    })
				    .font(.custom("NunitoSans10pt-Regular", size: 16))
				    .foregroundColor(.primary)
				    .focused($isInputFocused)
				    .padding(.horizontal)
				    .textInputAutocapitalization(.none)
				    .autocapitalization(.none)
				    .keyboardType(keyboardType)
				    .onChange(of: text) { newValue in
					   if newValue != "" {
						  showError = !validation(newValue)
					   } else {
						  showError = false
					   }
				    }
				    .toolbar {
					   ToolbarItemGroup(placement: .keyboard) {
						  Spacer()
						  Button("OK") {
							 isFocused = false
							 if text != "" {
								showError = !validation(text)
							 } else {
								showError = false
							 }
							 isInputFocused = false
						  }
					   }
				    }
				}
				
				if isSecureTextEntry && !text.isEmpty {
				    Button(action: {
					   isSecureTextShown.toggle()
				    }) {
					   Image("eye")
						  .foregroundColor(.gray)
				    }
				    .padding(.trailing, 10)
				}
			 }
			 .padding(.bottom, 2)
			 
			 if showError {
				HStack {
				    Image(systemName: imageName)
					   .foregroundColor(ColorConstants.Status.error)
				    AccessibleText(content: errorplaceholder)
					   .semiboldStyleSmall(foregroundColor: ColorConstants.Status.error)
				    Spacer()
				}
				.padding(.horizontal)
				.padding(.bottom, 4)
			 }
		  }
		  .onTapGesture {
			 isInputFocused = true
		  }
		  .background(
			 RoundedRectangle(cornerRadius: 8)
				.stroke(showError ? ColorConstants.Status.error : (isFocused ? ColorConstants.Text.secondary : ColorConstants.Text.secondary), lineWidth: 1)
		  )
	   }
    }
}
