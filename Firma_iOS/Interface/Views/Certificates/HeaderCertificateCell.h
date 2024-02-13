//
//  HeaderCertificateCell.h
//  Cliente @firma
//
//  Created by Luis Nicieza on 13/2/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeaderCertificateCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UITextView *descriptionLabel;

- (void)configureCell;

@end

NS_ASSUME_NONNULL_END
