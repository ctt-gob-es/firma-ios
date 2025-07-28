//
//  AONSBundle+Language.m
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 12/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AONSBundle+Language.h"
#import <objc/runtime.h>

static const char associatedLanguageBundle = 0;

@interface BundleEx : NSBundle
@end

@implementation BundleEx

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName {
    NSBundle* bundle = objc_getAssociatedObject(self, &associatedLanguageBundle);
    return bundle ? [bundle localizedStringForKey:key value:value table:tableName] : [super localizedStringForKey:key value:value table:tableName];
}

@end

@implementation NSBundle (Language)

+ (void)setLanguage:(NSString *)language {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
	   objc_setAssociatedObject([NSBundle mainBundle], &associatedLanguageBundle, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	   object_setClass([NSBundle mainBundle], [BundleEx class]);
    });
    objc_setAssociatedObject([NSBundle mainBundle], &associatedLanguageBundle, language ? [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:language ofType:@"lproj"]] : nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
