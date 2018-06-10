//
//  CommonAlert.m
//  Cliente @firma
//
//  Created by Sergio PH on 08/06/2018.
//  Copyright © 2018 Atos. All rights reserved.
//

#import "CommonAlert.h"

@implementation CommonAlert

+ (void) createAlertWithTitle:(NSString*)title message:(NSString*)message cancelButtonTitle:(NSString*)cancelButtonTitle {
    [self createAlertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle withImageView:nil];
}

+ (void) createAlertWithTitle:(NSString*)title message:(NSString*)message cancelButtonTitle:(NSString*)cancelButtonTitle withImageView:(UIImageView*) imageView {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (![cancelButtonTitle isEqualToString:@""]){
        UIAlertAction* cancelButton = [UIAlertAction
                                    actionWithTitle:cancelButtonTitle
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                    }];
        [alert addAction:cancelButton];
    }
    if (imageView.image != nil){
        [alert.view addSubview:imageView];
    }

    [[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentViewController:alert animated:true completion:nil];
}

@end
