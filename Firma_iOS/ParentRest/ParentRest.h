//
//  BachRest.h
//  Firma_iOS
//
//  Created by Desarrollo ABAMobile on 1/8/22.
//  Copyright © 2022 Solid GEAR. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ParentRestDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface ParentRest : NSObject
-(NSString *)getParametersFromDictionary:(NSDictionary *)dict;
-(void)setHeaders:(NSMutableURLRequest *)request;
@end


@protocol ParentRestDelegate <NSObject>
@optional


@end

NS_ASSUME_NONNULL_END
