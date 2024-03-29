//
//  AORegisteredCertificatesTVC.h
//  Firma_iOS
//
//  Created by Rocio Tovar on 24/3/15.
//  Copyright (c) 2015 Atos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlertProgressBar.h"

typedef NS_ENUM (NSInteger, AORegisteredCertificatesTVCMode)
{
    AORegisteredCertificatesTVCModeSign,
    AORegisteredCertificatesTVCModeManagement
};

@interface AORegisteredCertificatesTVC : UITableViewController <NSURLConnectionDelegate, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>

@property (nonatomic, assign) AORegisteredCertificatesTVCMode mode;
@property (nonatomic, strong) NSString *startURL;
@property (strong, nonatomic) NSMutableArray *_certificatesArray;
@property (strong, nonatomic) IBOutlet UITableView *editTableView;
@property (strong, nonatomic) IBOutlet UILabel *certificatesDescriptionLabel;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backBarButtonItem;
@property(nonatomic, assign) int numberOfRetries;
@property (strong, nonatomic) AlertProgressBar *alertpb;

@end
