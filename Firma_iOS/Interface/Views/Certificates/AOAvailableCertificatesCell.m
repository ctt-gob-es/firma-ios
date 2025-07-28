    //
    //  AOAvailableCertificatesCell.m
    //  Cliente @firma
    //
    //  Created by ABAMobile on 6/10/23.
    //  Copyright © 2023 Solid GEAR. All rights reserved.
    //


#import "AOAvailableCertificatesCell.h"
#import "UIFont+Utils.h"

@interface AOAvailableCertificatesCell()

@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation AOAvailableCertificatesCell

- (void)setCellLabel:(NSString *)cellLabel {
    
    [_label setText:cellLabel];
}

@end
