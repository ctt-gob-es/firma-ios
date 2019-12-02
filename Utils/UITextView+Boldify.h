//
//  UITextView+Boldify.h
//  Cliente @firma
//
//  Created by Sergio PH on 19/06/2018.
//  Copyright © 2018 Atos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Boldify)

- (void) boldSubstring: (NSString*) substring;
- (void) boldRange: (NSRange) range;

@end
