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
    [_selectedCertificateLabel setText:_selectedCertificate];
    [_passwordTextField becomeFirstResponder];
    [self.registerCertificateDescriptionLabel setText: @"register_certificate_description_label".localized];
    [self.registerCertificateRegisterButtonTitle setTitle:@"register_cretificate_register_button_title".localized forState:normal];
    self.registerCertificateNavigationItem.title= @"register_certificate_title".localized;
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
        _registerCertificateDescriptionLabel.text = @"enter_your_certificate_password".localized;
    } else {
        [self registerWithCertificate];
    }
}

- (IBAction)didClickCancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Certificates Methods

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
    
    UIFont *currentFont = _registerCertificateDescriptionLabel.font;
    UIFont *newFont = [UIFont fontWithName:[NSString stringWithFormat:@"%@-Bold",currentFont.fontName] size:currentFont.pointSize];
    _registerCertificateDescriptionLabel.font = newFont;
    _registerCertificateDescriptionLabel.textColor = [UIColor redColor];
    _registerCertificateDescriptionLabel.text = _message;
        
    return;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
