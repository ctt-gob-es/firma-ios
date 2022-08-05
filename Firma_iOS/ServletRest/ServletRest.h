//
//  BachRest.h
//  Firma_iOS
//
//  Created by Desarrollo ABAMobile on 1/8/22.
//  Copyright © 2022 Solid GEAR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParentRest.h"
@protocol ServletRestDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface ServletRest : ParentRest

-(id)initWithDelegate:(id) delegate;
-(void)loadDataFromRtservlet:(NSString*) fileId rtServlet:(NSString *) rtServlet cipherKey:(NSString *) cipherKey;
-(void)storeData:(NSString*) dataSign stServlet:(NSString *) stServlet cipherKey:(NSString *) cipherKey docId:(NSString *) docId;
@end

@protocol ServletRestDelegate <NSObject>
@optional
- (void)didSuccessLoadDataFromServer:(NSDictionary *)responseDict;
- (void)didErrorLoadDataFromServer:(NSString *)errorMessage;

- (void)didSuccessStoreData:(NSString *)response;
- (void)didErrorStoreData:(NSString *)errorMessage;
@end

NS_ASSUME_NONNULL_END
