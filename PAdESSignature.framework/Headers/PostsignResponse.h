//
//  PostsignResponse.h
//  PAdESSignature
//
//  Created by Desarrollo Abamobile on 5/2/25.
//

#import <Foundation/Foundation.h>

@interface PostsignResponse : NSObject

@property (nonatomic, strong, nullable) NSString *signedString;
@property (nonatomic, strong, nullable) NSError *error;

- (instancetype)initWithSignedString:(nullable NSString *)signedString error:(nullable NSError *)error;

@end
