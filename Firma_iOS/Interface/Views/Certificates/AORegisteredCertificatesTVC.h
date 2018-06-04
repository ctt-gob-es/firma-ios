//
//  AORegisteredCertificatesTVC.h
//  Firma_iOS
//
//  Created by Rocio Tovar on 24/3/15.
//  Copyright (c) 2015 Atos. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, AORegisteredCertificatesTVCMode)
{
    AORegisteredCertificatesTVCModeSign,
    AORegisteredCertificatesTVCModeManagement
};

@interface AORegisteredCertificatesTVC : UITableViewController <NSURLConnectionDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) AORegisteredCertificatesTVCMode mode;
@property (nonatomic, strong) NSString *startURL;
@property (strong, nonatomic) NSMutableArray *_certificatesArray;
@property (strong, nonatomic) IBOutlet UITableView *editTableView;


@end
