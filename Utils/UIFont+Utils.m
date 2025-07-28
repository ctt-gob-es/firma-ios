    //
    //  UIFont+Utils.m
    //  Cliente @firma
    //
    //  Created by ABAMobile on 2/10/23.
    //  Copyright © 2023 Solid GEAR. All rights reserved.
    //

#import <Foundation/Foundation.h>
#import "UIFont+Utils.h"

@implementation UIFont (Utils)

- (UIFont *)scaledSystemFont:(CGFloat)iPhoneFontSize iPadFontSize:(CGFloat)iPadFontSize {
    CGFloat customFontSize = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ?iPadFontSize : iPhoneFontSize;
    UIFont *customFont = [UIFont systemFontOfSize:customFontSize];
    UIFontMetrics *customFontMetrics =[UIFontMetrics metricsForTextStyle:UIFontTextStyleBody];
    return [customFontMetrics scaledFontForFont:customFont];
}

- (UIFont *)largeSystemFontScaled {
    return [[UIFont alloc] scaledSystemFont:18 iPadFontSize:24];
}

- (UIFont *)mediumSystemFontScaled {
    return [[UIFont alloc] scaledSystemFont:14 iPadFontSize:19];
}

- (UIFont *)smallSystemFontScaled {
    return [[UIFont alloc] scaledSystemFont:12 iPadFontSize:17];
}

@end
