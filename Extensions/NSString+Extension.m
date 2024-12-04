    //
    //  NSString+Extension.m
    //  Cliente @firma
    //
    //  Created by Sergio Peñín on 08/01/2020.
    //  Copyright © 2020 Solid GEAR. All rights reserved.
    //

#import <Foundation/Foundation.h>
#import "NSString+Extension.h"
#import "UIFont+Utils.h"

@implementation NSString (Common)

- (NSString *) localized {
    return NSLocalizedString(self, nil);
}

    // Method to detect HTML text
- (NSMutableAttributedString *)getHtml:(UIFont *)textFont {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]
                                                   initWithData: [self dataUsingEncoding:NSUnicodeStringEncoding]
                                                   options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType
                                                            }
                                                   documentAttributes: nil
                                                   error: nil
    ];
    
    [attributedString addAttribute:NSFontAttributeName value:textFont range:NSMakeRange(0, attributedString.length)];
    
    return attributedString;
}

    // Function to calculate the maximum width that a text occupies
- (CGSize)usedSizeForMaxWidth:(CGFloat)width withFont:(UIFont *)font
{
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString:self];
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize: CGSizeMake(width, MAXFLOAT)];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [layoutManager addTextContainer:textContainer];
    [textStorage addLayoutManager:layoutManager];
    [textStorage addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, [textStorage length])];
    [textContainer setLineFragmentPadding:0.0];
    
    [layoutManager glyphRangeForTextContainer:textContainer];
    CGRect frame = [layoutManager usedRectForTextContainer:textContainer];
    return CGSizeMake(ceilf(frame.size.width),ceilf(frame.size.height));
}


@end
