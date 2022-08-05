//
//  BatchSignUseCase.h
//  Cliente @firma
//
//  Created by Luis Nicieza on 29/7/22.
//  Copyright © 2022 Solid GEAR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BachRest.h"
#import "ServletRest.h"
@protocol BatchSignUseCaseDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface BatchSignUseCase : NSObject<BatchRestDelegate,ServletRestDelegate>
- (BatchSignUseCase*)initWithCertificate:(NSString *) base64UrlSafeCertificateData withDelegate:(id) delegate andPrivateKey:(SecKeyRef) thePrivateKey ;
- (void)signBatch:(NSDictionary*) dataOperation;
@end

@protocol BatchSignUseCaseDelegate <NSObject>
@optional
- (void)didSuccessBatchSignUseCase:(NSString *)response;
- (void)didErrorBatchSignUseCase:(NSString *)errorMessage;

@end


NS_ASSUME_NONNULL_END
