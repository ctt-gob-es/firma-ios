//
//  NSString+Extension.h
//  Cliente @firma
//
//  Created by Sergio Peñín on 08/01/2020.
//  Copyright © 2020 Solid GEAR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Extension.h"


NS_ASSUME_NONNULL_BEGIN

@interface NSString (Common)

- (NSString *) localized;
- (NSMutableAttributedString *) linkStyle;

@end

NS_ASSUME_NONNULL_END
