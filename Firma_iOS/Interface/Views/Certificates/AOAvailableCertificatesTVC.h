//
//  AOAvailableCertificatesTVC.h
//  Firma_iOS
//
//  Created by Rocio Tovar on 25/3/15.
//  Copyright (c) 2015 Atos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AORegisterCertificateVC.h"
#import "HeaderCertificateCell.h"

@interface AOAvailableCertificatesTVC : UIViewController<AORegisterCertificateVCDelegate, UIDocumentMenuDelegate, UIDocumentPickerDelegate, UINavigationControllerDelegate, HeaderCertificateCellDelegate>
//@property (strong, nonatomic) IBOutlet UILabel *availableCertificatesDescriptionLabel;

//@property (weak, nonatomic) IBOutlet UIButton *filesAppButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *filesAppButtonHeightConstraint;
@property (strong,nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
