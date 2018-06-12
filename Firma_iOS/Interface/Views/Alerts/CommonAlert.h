//
//  CommonAlert.h
//  Cliente @firma
//
//  Created by Sergio PH on 08/06/2018.
//  Copyright © 2018 Atos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonAlert : NSObject

+ (void) createAlertWithTitle:(NSString*)title message:(NSString*)message cancelButtonTitle:(NSString*)cancelButtonTitle showOn:(UIViewController*)viewController ;
+ (void) createAlertWithTitle:(NSString*)title message:(NSString*)message cancelButtonTitle:(NSString*)cancelButtonTitle withImageView:(UIImageView*)imageView showOn:(UIViewController*)viewController ;

+ (void) createAlertWithTitle:(NSString*)title message:(NSString*)message cancelButtonTitle:(NSString*)cancelButtonTitle withImageView:(UIImageView*)imageView showOn:(UIViewController*)viewController onComplete:(void(^)(void))someBlock;


@end
