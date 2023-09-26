    //
    //  NSString+Extension.m
    //  Cliente @firma
    //
    //  Created by Sergio Peñín on 08/01/2020.
    //  Copyright © 2020 Solid GEAR. All rights reserved.
    //

#import <Foundation/Foundation.h>
#import "NSString+Extension.h"
#import "ColorChart.h"

@implementation NSString (Common)

- (NSString *) localized {
    return NSLocalizedString(self, nil);
}

    // Function to apply a style to the text that simulates a link
- (NSMutableAttributedString *) linkStyle {
    NSMutableAttributedString *textFormatted = [[NSMutableAttributedString alloc] initWithString:self];
        // Text color
    [textFormatted addAttribute:NSForegroundColorAttributeName value: LINK_COLOR range:NSMakeRange(0, [textFormatted length])];
        // Underline
    [textFormatted addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [textFormatted length])];
    return textFormatted;
}


@end
