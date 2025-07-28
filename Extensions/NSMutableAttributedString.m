    //
    //  NSMutableAttributedString.m
    //  Cliente @firma
    //
    //  Created by ABAMobile on 29/9/23.
    //  Copyright © 2023 Solid GEAR. All rights reserved.
    //

#import <Foundation/Foundation.h>
#import "NSMutableAttributedString+Extension.h"

@implementation NSMutableAttributedString (Common)

    // Method to align text
- (NSMutableAttributedString *)align:(NSTextAlignment)textAlignment {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:textAlignment];
    [self addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
    return self;
}

@end
