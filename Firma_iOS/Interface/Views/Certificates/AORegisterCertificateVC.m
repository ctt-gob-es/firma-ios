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
        _messageLabel.text = NSLocalizedString(@"enter_your_certificate_password", nil);
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
                _message = NSLocalizedString(@"certificate_not_found", nil);
                break;
            case errSecAuthFailed:
                _message = NSLocalizedString(@"wrong_password", nil);
                break;
            case errSecDuplicateItem:
                _message = NSLocalizedString(@"certificate_already_loaded",nil);
                break;
            default:
                _message = [NSString stringWithFormat:NSLocalizedString(@"an_error_occurred_with_number", nil), (int)status];
                break;
        }
    } else {
        //test THIS
        _message = NSLocalizedString(@"certificate_successfully_loaded", nil);
        if (_delegate) {
            [_delegate certificateAdded];
        }
        //test THIS
        [CommonAlert createAlertWithTitle: NSLocalizedString(@"certificate_loaded", nil) message:_message cancelButtonTitle:@"OK" showOn:self];
    }
    
    UIFont *currentFont = _messageLabel.font;
    UIFont *newFont = [UIFont fontWithName:[NSString stringWithFormat:@"%@-Bold",currentFont.fontName] size:currentFont.pointSize];
    _messageLabel.font = newFont;
    _messageLabel.textColor = [UIColor redColor];
    _messageLabel.text = _message;
    
    NSLog(@"Message -> %@", _message);
    NSLog(@"MessageLabel -> %@", _messageLabel.text);
    
    return;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
