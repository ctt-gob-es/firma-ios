//
//  PresignResponse.h
//  PAdESSignature
//
//  Created by Desarrollo Abamobile on 5/2/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PresignResponse : NSObject

@property (nonatomic, strong, nullable) NSData *data;
@property (nonatomic, strong, nullable) NSError *error;
@property (nonatomic, assign) BOOL retry;

- (instancetype)initWithData:(nullable NSData *)data
					   error:(nullable NSError *)error
					   retry:(BOOL)retry;

@end

NS_ASSUME_NONNULL_END
