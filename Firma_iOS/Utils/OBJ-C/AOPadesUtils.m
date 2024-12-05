//
//  AOPadesUtils.m
//  Autofirma
//
//  Created by Desarrollo Abamobile on 12/8/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
#import "AOPadesUtils.h"

#import "PadesSignerWrapper.h"

//JAVA J2OBJC FILES
#import "IOSObjectArray.h"
#import "J2ObjC_source.h"
#import "IOSPrimitiveArray.h"
#import "Keyloader.h"
#import "SignatureResult.h"

#include "java/util/Properties.h"
#include "java/security/KeyFactory.h"
#include "java/io/ByteArrayInputStream.h"
#include "java/security/cert/CertificateFactory.h"
#include "java/security/cert/Certificate.h"
#include "java/security/PrivateKey.h"

@implementation AOPadesUtils

typedef void (^SignPdfCompletionHandler)(NSString * result, NSError * error);

- (void)signPdfWithData:(NSData *)pdfData
		signAlgorithm:(NSString *)signAlgorithm
		   privateKey:(SecKeyRef)privateKey
		  certificate:(SecCertificateRef)certificate
   certificateAlgorithm:(NSString *)certificateAlgorithm
		  extraParams:(NSDictionary *)extraParams
		   completion:(SignPdfCompletionHandler)completion {
    
    IOSByteArray *iosPdfData = [self obtainPdfData:pdfData];
    JavaSecurityPrivateKey *pvt = [self obtainPrivateKey:privateKey withNSString:certificateAlgorithm];
    IOSObjectArray *certChainArray = [self obtainCertificateChain:certificate];
    JavaUtilProperties *javaProperties = [self obtainExtraParams:extraParams];
    
    EsGobAfirmaIosPadesSignerWrapper *signerWrapper = [[EsGobAfirmaIosPadesSignerWrapper alloc] init];
    
    //We don´t know the sign algorithm to use so we pass nil
    EsGobAfirmaIosSignatureResult *result = [signerWrapper signWithByteArray:iosPdfData
												    withNSString:signAlgorithm
										withJavaSecurityPrivateKey:pvt
								withJavaSecurityCertCertificateArray:certChainArray
										    withJavaUtilProperties:javaProperties];
    
    if(result.getErrorCode == -1) {
	   IOSByteArray *byteArray = [result getSignature];
	   NSString *base64String = [self convertIOSByteArrayToBase64String:byteArray];
	   printf("Signature generated in device : %s\n", [base64String UTF8String]);
	   completion(base64String, nil);
    } else {
	   NSInteger errorCode = [result getErrorCode];
	   NSError *error = [NSError errorWithDomain:@"Error Signing PDF"
									code:errorCode
								 userInfo:@{NSLocalizedDescriptionKey: @"Signing failed"}];
	   completion(nil, error);
    }
}

- (IOSByteArray *)obtainPdfData:(NSData *)pdfData {
    return [IOSByteArray arrayWithBytes:[pdfData bytes] count:[pdfData length]];
}

- (JavaSecurityPrivateKey *)obtainPrivateKey:(SecKeyRef)privateKey withNSString:(NSString *)algorithm {
    CFDictionaryRef attributes = SecKeyCopyAttributes(privateKey);
    NSData *privateKeyNSData = CFDictionaryGetValue(attributes, kSecValueData);
    IOSByteArray *privateKeyData = [IOSByteArray arrayWithBytes:[privateKeyNSData bytes] count:[privateKeyNSData length]];
    JavaIoByteArrayInputStream *inputStream = [[JavaIoByteArrayInputStream alloc] initWithByteArray:privateKeyData];
    id<JavaSecurityPrivateKey> pvt = [EsGobAfirmaIosKeyLoader loadPrivateKeyWithJavaIoInputStream:inputStream withNSString: algorithm];
    
    if (attributes) {
	   CFRelease(attributes);
    }
    
    return pvt;
}

- (IOSObjectArray *)obtainCertificateChain:(SecCertificateRef)certificate {
    CFDataRef certData = SecCertificateCopyData(certificate);
    NSData *certNSData = (__bridge NSData *)certData;
    IOSByteArray *certificateData = [IOSByteArray arrayWithBytes:[certNSData bytes] count:[certNSData length]];
    JavaIoByteArrayInputStream *inputStream = [[JavaIoByteArrayInputStream alloc] initWithByteArray:certificateData];
    JavaSecurityCertCertificateFactory *cf = JavaSecurityCertCertificateFactory_getInstanceWithNSString_(@"X.509");
    JavaSecurityCertCertificate *certChain = [cf generateCertificateWithJavaIoInputStream:inputStream];
    IOSObjectArray *certChainArray = [IOSObjectArray arrayWithLength:1 type:JavaSecurityCertCertificate_class_()];
    [certChainArray replaceObjectAtIndex:0 withObject:certChain];
    
    if (certData) {
	   CFRelease(certData);
    }
    return certChainArray;
}

- (JavaUtilProperties *)obtainExtraParams:(NSDictionary *)extraParams {
    JavaUtilProperties *javaProperties = [[JavaUtilProperties alloc] init];
    for (NSString *key in extraParams) {
	   [javaProperties setPropertyWithNSString:key withNSString:[extraParams objectForKey:key]];
    }
    return javaProperties;
}

- (NSString *)convertIOSByteArrayToBase64String:(IOSByteArray *)byteArray {
    NSData *data = [NSData dataWithBytes:byteArray->buffer_ length:byteArray->size_];
    NSString *base64String = [data base64EncodedStringWithOptions:0];
    return base64String;
}

@end
