//
//  CommonAlert.m
//  Cliente @firma
//
//  Created by Sergio PH on 08/06/2018.
//  Copyright © 2018 Atos. All rights reserved.
//

#import "CommonAlert.h"

@implementation CommonAlert

+ (void) createAlertWithTitle:(NSString*)title message:(NSString*)message cancelButtonTitle:(NSString*)cancelButtonTitle showOn:(UIViewController*)viewController {
    [self createAlertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle withImageView:nil showOn:viewController];
}

+ (void) createAlertWithTitle:(NSString*)title message:(NSString*)message cancelButtonTitle:(NSString*)cancelButtonTitle withImageView:(UIImageView*)imageView showOn:(UIViewController*)viewController {
    [self createAlertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle withImageView:imageView showOn:viewController onComplete:nil];
}

+ (void) createAlertWithTitle:(NSString*)title message:(NSString*)message cancelButtonTitle:(NSString*)cancelButtonTitle withImageView:(UIImageView*)imageView showOn:(UIViewController*)viewController onComplete:(void(^)(void))onComplete {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (![cancelButtonTitle isEqualToString:@""]){
        UIAlertAction* cancelButton = [UIAlertAction actionWithTitle: cancelButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (onComplete != nil) {
                onComplete();
            }
        }];
        [alert addAction:cancelButton];
    }
    if (imageView.image != nil) {
        [alert.view addSubview:imageView];
    }
    [viewController presentViewController:alert animated:true completion:nil];
}

@end
