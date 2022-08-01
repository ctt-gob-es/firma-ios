//
//  BatchSignUseCase.h
//  Cliente @firma
//
//  Created by Luis Nicieza on 29/7/22.
//  Copyright © 2022 Solid GEAR. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol BatchSignUseCaseDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface BatchSignUseCase : NSObject
- (void)signBatch:(NSDictionary*) dataOperation;
@end

@protocol BatchSignUseCaseDelegate <NSObject>
@optional
- (void)didSuccessBatchSignUseCase;
- (void)didErrorBatchSignUseCase:(NSString *)errorMessage;
@end


NS_ASSUME_NONNULL_END
