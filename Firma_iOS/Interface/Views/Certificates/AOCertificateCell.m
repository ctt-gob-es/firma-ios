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
@property (weak, nonatomic) IBOutlet UIView *issuerView;
@property (nonatomic, strong) IBOutlet UILabel *issuerLabel;
@property (nonatomic, strong) IBOutlet UILabel *issuerValue;
@property (weak, nonatomic) IBOutlet UIView *purposeView;
@property (nonatomic, strong) IBOutlet UILabel *purposeLabel;
@property (nonatomic, strong) IBOutlet UILabel *purposeValue;
@property (weak, nonatomic) IBOutlet UIView *dateView;
@property (nonatomic, strong) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) IBOutlet UILabel *expirationLabel;

@end

@implementation AOCertificateCell

- (void)setCertificateInfo:(AOCertificateInfo *)certificateInfo forEditingCell:(BOOL)isEditing
{
    UIFont *dataFont = [[UIFont alloc] smallSystemFontScaled];
    
        // Subject
    [_subjectLabel setText:certificateInfo.subject];
    _subjectLabel.font = [[UIFont alloc] mediumSystemFontScaled];
    
        // Issuer
    _issuerView.accessibilityElements = @[_issuerLabel, _issuerValue];
    [_issuerLabel setText:@"issuer_label".localized];
    _issuerLabel.font = dataFont;
    [_issuerValue setText:certificateInfo.issuer];
    _issuerValue.font = dataFont;
    
        // Purpose
    _purposeView.accessibilityElements = @[_purposeLabel, _purposeValue];
    [_purposeLabel setText:@"use_label".localized];
    [_purposeValue setText:[certificateInfo getPurposeString]];
    _purposeLabel.font = dataFont;
    
        // Date
    _dateView.accessibilityElements = @[_dateLabel, _dateView];
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
