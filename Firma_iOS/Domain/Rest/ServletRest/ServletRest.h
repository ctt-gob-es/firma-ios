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
-(void)downloadDataFromRtservlet:(NSString*) fileId rtServlet:(NSString *) rtServlet cipherKey:(NSString *) cipherKey;
-(void)storeData:(NSData*) data certificateBase64:(NSString *) certificateBase64 stServlet:(NSString *) stServlet cipherKey:(NSString *) cipherKey docId:(NSString *) docId;
-(void)storeDataError:(NSString*) error stServlet:(NSString *) stServlet cipherKey:(NSString *) cipherKey docId:(NSString *) docId;
@end

@protocol ServletRestDelegate <NSObject>
@optional
- (void)didSuccessDownloadDataFromServer:(NSDictionary *)responseDict;
- (void)didErrorDownloadDataFromServer:(NSString *)errorMessage;

- (void)didSuccessStoreData:(NSString *)response;
- (void)didErrorStoreData:(NSString *)errorMessage;
@end

NS_ASSUME_NONNULL_END
