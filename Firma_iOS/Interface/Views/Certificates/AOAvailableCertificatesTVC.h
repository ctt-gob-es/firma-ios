//
//  AOAvailableCertificatesTVC.h
//  Firma_iOS
//
//  Created by Rocio Tovar on 25/3/15.
//  Copyright (c) 2015 Atos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AORegisterCertificateVC.h"

@interface AOAvailableCertificatesTVC : UITableViewController<AORegisterCertificateVCDelegate, UIDocumentMenuDelegate, UIDocumentPickerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *availableCertificatesDescriptionLabel;

@property (weak, nonatomic) IBOutlet UIButton *filesAppButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *filesAppButtonHeightConstraint;
@property (strong,nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;


@end
