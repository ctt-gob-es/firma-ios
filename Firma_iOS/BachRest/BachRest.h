//
//  BachRest.h
//  Firma_iOS
//
//  Created by Desarrollo ABAMobile on 1/8/22.
//  Copyright © 2022 Solid GEAR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParentRest.h"
@protocol BatchRestDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface BachRest : ParentRest

-(id)initWithDelegate:(id) delegate;
-(void)bachPresign:(NSString*)urlPresign withJsonData:(NSString*)json withCerts:(NSString*)certs;
- (void)bachPostsign:(NSString *)urlPostsign withJsonData:(NSString *)json withCerts:(NSString *)certs withTriData:(NSString *)tridata;
@end

@protocol BatchRestDelegate <NSObject>
@optional
- (void)didSuccessBachPresign:(NSDictionary *)responseDict;
- (void)didErrorBachPresign:(NSString *)errorMessage;

- (void)didSuccessBachPostsign:(NSDictionary *)responseDict;
- (void)didErrorBachPostsign:(NSString *)errorMessage;
@end

NS_ASSUME_NONNULL_END
