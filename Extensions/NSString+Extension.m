//
//  NSString+Extension.m
//  Cliente @firma
//
//  Created by Sergio Peñín on 08/01/2020.
//  Copyright © 2020 Solid GEAR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Extension.h"

@implementation NSString (Common)

- (NSString *) localized {
	return NSLocalizedString(self, nil);
}

@end
