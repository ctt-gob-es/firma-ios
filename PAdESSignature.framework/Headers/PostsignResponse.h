//
//  PostsignResponse.h
//  PAdESSignature
//
//  Created by Desarrollo Abamobile on 5/2/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PostsignResponse : NSObject

@property (nonatomic, strong, nullable) NSString *signedString;
@property (nonatomic, strong, nullable) NSError *error;
@property (nonatomic, assign) BOOL retry;

- (instancetype)initWithSignedString:(nullable NSString *)signedString
							   error:(nullable NSError *)error
							   retry:(BOOL)retry;

@end

NS_ASSUME_NONNULL_END
