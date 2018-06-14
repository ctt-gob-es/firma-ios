//
//  CommonAlert.m
//  Cliente @firma
//
//  Created by Sergio PH on 08/06/2018.
//  Copyright © 2018 Solid GEAR. All rights reserved.
//

#import "CommonAlert.h"

@implementation CommonAlert


+ (void) createAlertWithTitle:(NSString*)title message:(NSString*)message cancelButtonTitle:(NSString*)cancelButtonTitle showOn:(UIViewController*)viewController {
    [self createAlertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle showOn:viewController onComplete:nil];
}

+ (void) createAlertWithTitle:(NSString*)title message:(NSString*)message cancelButtonTitle:(NSString*)cancelButtonTitle showOn:(UIViewController*)viewController onComplete:(void(^)(void))onComplete {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (![cancelButtonTitle isEqualToString:@""]){
        UIAlertAction* cancelButton = [UIAlertAction actionWithTitle: cancelButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (onComplete != nil) {
                onComplete();
            }
        }];
        [alert addAction:cancelButton];
    }
    [viewController presentViewController:alert animated:true completion:nil];
}

@end
