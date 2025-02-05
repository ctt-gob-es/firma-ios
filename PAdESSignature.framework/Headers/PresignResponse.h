//
//  PresignResponse.h
//  PAdESSignature
//
//  Created by Desarrollo Abamobile on 5/2/25.
//

#import <Foundation/Foundation.h>

@interface PresignResponse : NSObject

@property (nonatomic, strong, nullable) NSData *data;
@property (nonatomic, strong, nullable) NSError *error;

- (instancetype)initWithData:(nullable NSData *)data error:(nullable NSError *)error;

@end
