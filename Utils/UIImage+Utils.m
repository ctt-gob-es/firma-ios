    //
    //  UIImage+Utils.m
    //  Firma_iOS
    //
    //  Created by ABAMobile on 2/2/24.
    //  Copyright © 2024 Solid GEAR. All rights reserved.
    //

#import <Foundation/Foundation.h>
#import "UIImage+Utils.h"

@implementation UIImage (Utils)

    // Get an image from the view passed as parameter
- (UIImage *)imageFromView:(UIView *)view {
    UIGraphicsImageRenderer *renderer = [[UIGraphicsImageRenderer alloc] initWithSize:view.bounds.size];
    
    UIImage *image = [renderer imageWithActions:^(UIGraphicsImageRendererContext *context) {
        [view.layer renderInContext:context.CGContext];
    }];
    
    return image;
}

@end
