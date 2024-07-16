//
//  HeaderCertificateCell.h
//  Cliente @firma
//
//  Created by Luis Nicieza on 13/2/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HeaderCertificateCellDelegate<NSObject>

@required
- (void)filesAppButtonTapped;
@end

@interface HeaderCertificateCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextView *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *filesAppButton;
@property (weak, nonatomic) id<HeaderCertificateCellDelegate> delegate;

- (void)configureRegisteredCertificateCell;

- (void)configureAvailableCertificateCell;

- (IBAction)filesAppButtonTapped:(id)sender;

@end

NS_ASSUME_NONNULL_END
