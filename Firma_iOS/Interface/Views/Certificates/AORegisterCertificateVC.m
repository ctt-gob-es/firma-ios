    //
    //  AORegisterCertificateVC.m
    //  Firma_iOS
    //
    //  Created by Rocio Tovar on 25/3/15.
    //  Copyright (c) 2015 Atos. All rights reserved.
    //

#import "AORegisterCertificateVC.h"
#import "CertificateUtils.h"
#import "ColorChart.h"
#import "CommonAlert.h"
#import "GlobalConstants.h"
#import "UIFont+Utils.h"

@interface AORegisterCertificateVC ()
{
    NSString *_password;
    NSString *_message;
}

@end

@implementation AORegisterCertificateVC

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setTintColor:THEME_COLOR];
    self.registerCertificateNavigationItem.title= @"register_certificate_title".localized;
    
        // Selected certicate
    [_selectedCertificateLabel setText:_selectedCertificate];
    _selectedCertificateLabel.font = [[UIFont alloc] largeSystemFontScaled];
    
        // Password (label and textField)
    NSString *passwordTextFieldLabel = @"register_certificate_description_label".localized;
    [self.registerCertificateDescriptionLabel setText: passwordTextFieldLabel];
        // Allow the screen reader to associate the label with the text field
    self.registerCertificateDescriptionLabel.isAccessibilityElement = false;
        // Password textField
    self.passwordTextField.accessibilityLabel = passwordTextFieldLabel;
    self.passwordTextField.layer.cornerRadius = 4.0f;
    self.passwordTextField.clipsToBounds = true;
    self.passwordTextField.layer.borderWidth = 1.0f;
    self.passwordTextField.layer.borderColor = COMPONENTS_BORDER_COLOR.CGColor;
    self.passwordTextField.font = [[UIFont alloc] mediumSystemFontScaled];
    
        // Register button
    [self.registerCertificateRegisterButtonTitle setTitle:@"register_cretificate_register_button_title".localized forState:normal];
    [self.registerCertificateRegisterButtonTitle.titleLabel setFont:[[UIFont alloc] mediumSystemFontScaled]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

#pragma mark - User Interaction

- (IBAction)didClickRegister:(id)sender
{
    _password = _passwordTextField.text;
    
    if (!_password || [_password isEqualToString:@""]) {
        [self showMessage:@"enter_your_certificate_password".localized isError:true];
    } else {
        [self registerWithCertificate];
    }
}

- (IBAction)didClickCancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Certificates Methods

- (void)showMessage: (NSString *) message isError:(Boolean *) isError {
    self.registerCertificateDescriptionLabel.textColor =  isError ? [UIColor redColor] : COLOR_DARK_GREEN;
    self.registerCertificateDescriptionLabel.text = message;
        // Indicate the message in the accesibilityLabel of the TextField so that VoiceOver can detect it
    self.passwordTextField.accessibilityLabel = message;
        // Notify voice over that there was a change to the text field's accessibility label
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, self.passwordTextField);
}

- (void)registerWithCertificate
{
    OSStatus status = noErr;
    
#if TARGET_IPHONE_SIMULATOR
        // Load certificate from bundle
    status = [[CertificateUtils sharedWrapper] loadCertKeyChainWithName:_selectedCertificate password:_password fromDocument:NO];
#else
        // Load certificate from Documents directory
    status = [[CertificateUtils sharedWrapper] loadCertKeyChainWithName:_selectedCertificate password:_password fromDocument:YES];
#endif
    bool isError = true;
    if (status != noErr) {
        switch (status) {
            case errSecItemNotFound:
                _message = @"certificate_not_found".localized;
                break;
            case errSecAuthFailed:
                _message = @"wrong_password".localized;
                break;
            case errSecDuplicateItem:
                _message = @"certificate_already_loaded".localized;
                break;
            default:
                _message = [NSString stringWithFormat: @"an_error_occurred_with_number".localized, (int)status];
                break;
        }
    } else {
        _message = @"certificate_successfully_loaded".localized;
        isError = false;
        
        [CommonAlert createAlertWithTitle: @"certificate_loaded".localized message:_message cancelButtonTitle: OK showOn:self onComplete:^{
            if (self->_delegate) {
                [self->_delegate certificateAdded];
            }
        }];
    }
    
    [self showMessage:_message isError: isError];
    
    return;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
