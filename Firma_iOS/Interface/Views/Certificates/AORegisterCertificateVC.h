//
//  AORegisterCertificateVC.h
//  Firma_iOS
//
//  Created by Rocio Tovar on 25/3/15.
//  Copyright (c) 2015 Atos. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AORegisterCertificateVCDelegate <NSObject>

@required
- (void)certificateAdded;

@end

@interface AORegisterCertificateVC : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) id<AORegisterCertificateVCDelegate> delegate;
@property (strong, nonatomic) NSString *selectedCertificate;
@property (strong, nonatomic) IBOutlet UILabel *selectedCertificateLabel;
@property (strong, nonatomic) IBOutlet UILabel *messageLabel;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UILabel *registerCertificateDescriptionLabel;
@property (strong, nonatomic) IBOutlet UIButton *registerCertificateRegisterButtonTitle;
@property (weak, nonatomic) IBOutlet UINavigationItem *registerCertificateNavigationItem;

@end
