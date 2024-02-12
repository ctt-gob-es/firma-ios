    //
    //  AOHelpOptionView.m
    //  Cliente @firma
    //
    //  Created by ABAMobile on 12/2/24.
    //  Copyright © 2024 Solid GEAR. All rights reserved.
    //

#import "AOHelpOptionView.h"
#import "UIFont+Utils.h"

@interface AOHelpOptionView()

@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, strong) IBOutlet UIImageView *rightArrow;

@end

@implementation AOHelpOptionView

- (void)configureOption:(NSString *)text font:(UIFont *)textFont {
    _label.text = text;
    _label.accessibilityLabel = [NSString stringWithFormat:@"%@ %@", _label.text, @"button_accessibility_label".localized];
    _label.font = textFont;
}

@end
