//
//  CADESSignUtils.h
//  Firma_iOS
//
//

#import <Foundation/Foundation.h>
#import "IOSPrimitiveArray.h"

@interface CADESSignUtils : NSObject

+(NSString*) dictionary2JavaProperties: (NSDictionary*) dict;
+(NSDictionary*) javaProperties2Dictionary:(NSString*) urlString;
+(bool) isValidAlgorithm:(NSString*)algorithm;
+(NSDictionary*) parseUrl:(NSString*) urlString;

+(NSData*) signPkcs1:(NSString*)algorithm privateKey:(SecKeyRef*)privateKey data:(NSData*)dataPreSign;
-(NSData*) signDataWithPrivateKey:(SecKeyRef *)privateKey data:(NSData *)data algorithm:(NSString *)algorithm;
+(NSData*) hashData:(NSString*) algorithm data:(NSData*)dataPreSign;

+(OSStatus) extractIdentityAndTrust:(CFDataRef) inPKCS12Data :(NSString *)pass :(SecIdentityRef *)outIdentity :(SecTrustRef *)outTrust;

+(char*)getAlgorithmOID:(NSString*)algorithm;
+(char*)getHashAlgorithmOID:(NSString*)algorithm;

+(NSString*) getModifiedAlgorithmByCertificate: (SecKeyRef) privateKey alg:(NSString *)alg;

-(NSData*)getDataFromIOSByteArray:(IOSByteArray*) byteArray;

@end
