    //
    //  AOHelpCell.m
    //  Cliente @firma
    //
    //  Created by ABAMobile on 6/10/23.
    //  Copyright © 2023 Solid GEAR. All rights reserved.
    //

#import "AOHelpCell.h"
#import "UIFont+Utils.h"

@interface AOHelpCell()

@property (nonatomic, strong) IBOutlet UILabel *label;

@end

@implementation AOHelpCell

- (void)setCellLabel:(NSString *)cellLabel {
    
    [_label setText:cellLabel];
}

-(UILabel*) getCellLabel {
    return _label;
}

@end
