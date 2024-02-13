//
//  HeaderCertificateCell.m
//  Cliente @firma
//
//  Created by Luis Nicieza on 13/2/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

#import "HeaderCertificateCell.h"

@implementation HeaderCertificateCell



- (void)configureRegisteredCertificateCell {
    // Description
    [self.descriptionLabel setText: @"certificate_description_label".localized];
}

- (IBAction)filesAppButtonTapped:(id)sender {
    if (self.delegate != nil) {
        [self.delegate filesAppButtonTapped];
    }
}

- (void)configureAvailableCertificateCell {
    // Description
    [self.descriptionLabel setText: @"available_certificates_description_label".localized];
    
    [self.filesAppButton setAttributedTitle: @"files_app_button".localized.linkStyle  forState:UIControlStateNormal];
    self.filesAppButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.filesAppButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    if (@available(iOS 11, *)) {
    } else {
        self.filesAppButton.hidden = YES;
    }
    
}

@end
