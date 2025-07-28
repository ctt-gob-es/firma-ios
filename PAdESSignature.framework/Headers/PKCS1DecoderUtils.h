//
//  PKCS1DecoderUtils.h
//  PAdESSignature
//
//  Created by Desarrollo Abamobile on 13/12/24.
//

#import <Foundation/Foundation.h>
@class IOSByteArray;

@interface PKCS1DecoderUtils : NSObject
+ (IOSByteArray *)decodeSignatureWithByteArray:(IOSByteArray *)signature;
@end
