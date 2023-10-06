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
    
        // Password (label and textField)
    NSString *passwordTextFieldLabel = @"register_certificate_description_label".localized;
    [self.registerCertificateDescriptionLabel setText: passwordTextFieldLabel];
        // Allow the screen reader to associate the label with the text field
    self.registerCertificateDescriptionLabel.isAccessibilityElement = false;
    self.passwordTextField.accessibilityLabel = passwordTextFieldLabel;
        // Password textField
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
        [self showError:@"enter_your_certificate_password".localized];
    } else {
        [self registerWithCertificate];
    }
}

- (IBAction)didClickCancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Certificates Methods

- (void)showError: (NSString *) errorMessage {
    _registerCertificateDescriptionLabel.font = newFont;*/
    _registerCertificateDescriptionLabel.textColor = [UIColor redColor];
    _registerCertificateDescriptionLabel.text = errorMessage;
        // Indicate the error in the accesibilityLabel of the TextField so that VoicOver can detect it
    self.passwordTextField.accessibilityLabel = errorMessage;
        // Put focus on the text field
    [_passwordTextField becomeFirstResponder];
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
        
        [CommonAlert createAlertWithTitle: @"certificate_loaded".localized message:_message cancelButtonTitle: OK showOn:self onComplete:^{
            if (self->_delegate) {
                [self->_delegate certificateAdded];
            }
        }];
    }
    
    [self showError:_message];
    
    return;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
