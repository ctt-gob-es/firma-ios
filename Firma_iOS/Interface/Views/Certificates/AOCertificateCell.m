    //
    //  AOCertificateCell.m
    //  Firma_iOS
    //
    //  Created by Rocio Tovar on 24/3/15.
    //  Copyright (c) 2015 Atos. All rights reserved.
    //

#import "AOCertificateCell.h"
#import "ColorChart.h"
#import "QuartzUtils.h"
#import "UIFont+Utils.h"

static const NSTimeInterval kCertificateCellDate15DaysTimeInterval = -(15*24*60*60);

@interface AOCertificateCell ()
{
    CALayer *_expirationIconLayer;
}

@property (nonatomic, strong) IBOutlet UILabel *subjectLabel;
@property (nonatomic, strong) IBOutlet UILabel *issuerLabel;
@property (nonatomic, strong) IBOutlet UILabel *issuerValue;
@property (nonatomic, strong) IBOutlet UILabel *purposeLabel;
@property (nonatomic, strong) IBOutlet UILabel *purposeValue;
@property (nonatomic, strong) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) IBOutlet UILabel *expirationLabel;

@end

@implementation AOCertificateCell
    // TODO test Function to get cell height
- (CGFloat) getCellHeight {
        // Fonts
    UIFont *subjectFont = [[UIFont alloc] mediumSystemFontScaled];
    UIFont *dataFont = [[UIFont alloc] smallSystemFontScaled];
    
        // Variables
    CGFloat MARGIN_BETWEEN_ELEMENTS = 3;
    
    CGFloat verticalMargins = 3 * MARGIN_BETWEEN_ELEMENTS;
    
        // Width
    CGFloat subjectLabelWidth = _subjectLabel.bounds.size.width;
    CGFloat issuerValueWidth = _issuerValue.bounds.size.width;
    CGFloat purposeValueWidth = _purposeValue.bounds.size.width;
    CGFloat dateLabelWidth = _dateLabel.bounds.size.width;
    
        // Height
    CGFloat subjectHeight = [_subjectLabel.text usedSizeForMaxWidth:subjectLabelWidth withFont:subjectFont].height;
    CGFloat issuerHeight = [_issuerValue.text usedSizeForMaxWidth:issuerValueWidth withFont:dataFont].height;
    CGFloat purposeHeight = [_purposeValue.text usedSizeForMaxWidth:purposeValueWidth withFont:dataFont].height;
    CGFloat dateHeight = [_dateLabel.text usedSizeForMaxWidth:dateLabelWidth withFont:dataFont].height;
    
    return verticalMargins + subjectHeight + issuerHeight + purposeHeight + dateHeight;
}

- (void)setCertificateInfo:(AOCertificateInfo *)certificateInfo forEditingCell:(BOOL)isEditing
{
    UIFont *dataFont = [[UIFont alloc] smallSystemFontScaled];
    
        // Subject
    [_subjectLabel setText:certificateInfo.subject];
    _subjectLabel.font = [[UIFont alloc] mediumSystemFontScaled];
    
        // Issuer
    [_issuerLabel setText:@"issuer_label".localized];
    _issuerLabel.font = dataFont;
    [_issuerValue setText:certificateInfo.issuer];
    _issuerValue.font = dataFont;
    
        // Purpose
    [_purposeLabel setText:@"use_label".localized];
    [_purposeValue setText:[certificateInfo getPurposeString]];
    _purposeLabel.font = dataFont;
    
        // Date
    [_dateLabel setText:[NSString stringWithFormat: @"valid_from_to".localized,[certificateInfo getCreationDateString], [certificateInfo getExpirationDateString]]];
    _dateLabel.font = dataFont;
    
        // Expiration
    _expirationLabel.font = dataFont;
    
    if (isEditing) {
        [_expirationLabel setHidden:YES];
    } else {
        [self setupBackgroundForExpirationDate:certificateInfo.expirationDate];
    }
}

- (void)setupBackgroundForExpirationDate:(NSDate *)expirationDate
{
    NSTimeInterval secondsToExpirationDate = [[NSDate date] timeIntervalSinceDate:expirationDate];
    UIColor *color;
    
    if (secondsToExpirationDate > 0) {
        color = COLOR_PRIORITY_RED;
    } else if (secondsToExpirationDate > kCertificateCellDate15DaysTimeInterval) {
        color = COLOR_PRIORITY_YELLOW;
    } else {
        color = nil;
    }
    
    if (color) {
        CGFloat frameOriginXOffset = 10;
        CGFloat frameOriginYOffset = 20;
        CGFloat frameSizeWidthMultiplier = 0.01;
        CGFloat frameSizeHeightMultiplier = 0.01;
        _expirationIconLayer = [QuartzUtils circleWithColor:color andRect: CGRectMake(_expirationLabel.frame.origin.x + frameOriginXOffset, _expirationLabel.frame.origin.y + frameOriginYOffset, (_expirationLabel.frame.size.width * frameSizeWidthMultiplier), (_expirationLabel.frame.size.height * frameSizeHeightMultiplier))];
        [self.contentView.layer insertSublayer:_expirationIconLayer atIndex:0];
        [_expirationLabel setHidden:NO];
    } else {
        [_expirationLabel setHidden:YES];
    }
}

@end
