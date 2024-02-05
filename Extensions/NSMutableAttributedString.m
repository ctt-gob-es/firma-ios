    //
    //  NSMutableAttributedString+Extension.m
    //  Cliente @firma
    //
    //  Created by ABAMobile on 29/9/23.
    //  Copyright © 2023 Solid GEAR. All rights reserved.
    //

#import <Foundation/Foundation.h>
#import "NSMutableAttributedString+Extension.h"
#import "UIImage+Utils.h"

@implementation NSMutableAttributedString (Common)

    // Method to align text
- (NSMutableAttributedString *)align:(NSTextAlignment)textAlignment {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:textAlignment];
    [self addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
    return self;
}

    // Method to add the indicated icon at the end of the text
- (nonnull NSMutableAttributedString *)addAttachment:(nonnull UIImage *)image accesibilityLabel:(nonnull NSString *)accessibilityLabel textFont:(nonnull UIFont *)textFont {
        // Create attachment
    NSTextAttachment *attachmentIcon = [[NSTextAttachment alloc] init];
    attachmentIcon.accessibilityLabel = accessibilityLabel;
    
        // Center attachment icon on line
    [attachmentIcon setBounds:CGRectMake(0, roundf(textFont.capHeight - image.size.height)/2.f, image.size.width, image.size.height)];
    
        // Set margins for the attachment
    CGFloat topMargin = 0;
    CGFloat bottomMargin = 0;
    CGFloat leftMargin = 5.0;
    CGFloat rightMargin = 0.0;
    
        // Create a UIImageView for the icon
    UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(leftMargin, topMargin, image.size.width, image.size.height)];
    iconImageView.image = image;
    
        // Create a custom view with margins around the attachment icon
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, image.size.width + leftMargin + rightMargin, image.size.height + topMargin + bottomMargin)];
    [customView addSubview:iconImageView];
    
        // Assign image to NSTextAttachment
    attachmentIcon.image = [[UIImage alloc] imageFromView:customView];
    
        //attachmentIcon.image = image;
    
        // Create a NSAttributedString with the attachment
    NSAttributedString *imageString = [NSAttributedString attributedStringWithAttachment:attachmentIcon];
        // Add attachment to the end of the text
    [self appendAttributedString:imageString];
    return self;
}

    // Method to add the external link icon at the end of the text
- (nonnull NSMutableAttributedString *)addExternalLinkIcon: (UIFont *)textFont {
    UIImage *image = [UIImage imageNamed:@"ic_external_link.png"];
    NSString *accessibilityLabel = @"external_link_icon_label".localized;
    [self addAttachment:image accesibilityLabel:accessibilityLabel textFont:textFont];
    return self;
}

@end
