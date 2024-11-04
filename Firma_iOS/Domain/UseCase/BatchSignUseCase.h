//
//  BatchSignUseCase.h
//  Cliente @firma
//
//  Created by Luis Nicieza on 29/7/22.
//  Copyright © 2022 Solid GEAR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BachRestIOS.h"
#import "ServletRest.h"
@protocol BatchSignUseCaseDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface BatchSignUseCase : NSObject<BatchRestDelegate,ServletRestDelegate>
- (id)initWithCertificate:(NSString *)base64UrlSafeCertificateData privateKey:(SecKeyRef)thePrivateKey;
- (void)signBatch:(NSDictionary*) dataOperation;
- (void)signBatch:(NSDictionary *)dataOperation completion:(void (^)(NSString  * _Nullable responseMessage, NSError * _Nullable error))completion;
@end

@protocol BatchSignUseCaseDelegate <NSObject>
@optional
- (void)didSuccessBatchSignUseCase:(NSString *)response;
- (void)didErrorBatchSignUseCase:(NSString *)errorMessage;

@end


NS_ASSUME_NONNULL_END
