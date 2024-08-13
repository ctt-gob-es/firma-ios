//
//  AOPadesUtils.m
//  Autofirma
//
//  Created by Desarrollo Abamobile on 12/8/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
#import "AOPadesUtils.h"

@implementation AOPadesUtils

- (EsGobAfirmaIosSignatureResult *)signPdfWithData:(NSData *)pdfData
								 algorithm:(NSString *)algorithm
								 privateKey:(SecKeyRef)privateKey
								 certificate:(SecCertificateRef)certificate
								 extraParams:(NSDictionary *)extraParams {

    IOSByteArray *iosPdfData = [self obtainPdfData:pdfData];
    JavaSecurityPrivateKey *pvt = [self obtainPrivateKey:privateKey];
    IOSObjectArray *certChainArray = [self obtainCertificateChain:certificate];
    JavaUtilProperties *javaProperties = [self obtainExtraParams:extraParams];

    EsGobAfirmaIosPadesSignerWrapper *signerWrapper = [[EsGobAfirmaIosPadesSignerWrapper alloc] init];
    EsGobAfirmaIosSignatureResult *result = [signerWrapper signWithByteArray:iosPdfData
												    withNSString:algorithm
										  withJavaSecurityPrivateKey:pvt
								withJavaSecurityCertCertificateArray:certChainArray
										  withJavaUtilProperties:javaProperties];

    IOSByteArray *byteArray = [result getSignature];
    NSString *base64String = [self convertIOSByteArrayToBase64String:byteArray];
    
    NSLog(@"Base64 String: %@", base64String);
    
    return result;
}

- (IOSByteArray *)obtainPdfData:(NSData *)pdfData {
    return [IOSByteArray arrayWithBytes:[pdfData bytes] count:[pdfData length]];
}

- (JavaSecurityPrivateKey *)obtainPrivateKey:(SecKeyRef)privateKey {
    CFDictionaryRef attributes = SecKeyCopyAttributes(privateKey);
    NSData *privateKeyNSData = CFDictionaryGetValue(attributes, kSecValueData);
    IOSByteArray *privateKeyData = [IOSByteArray arrayWithBytes:[privateKeyNSData bytes] count:[privateKeyNSData length]];
    JavaIoByteArrayInputStream *inputStream = [[JavaIoByteArrayInputStream alloc] initWithByteArray:privateKeyData];
    id<JavaSecurityPrivateKey> pvt = [KeyloaderKeyLoader loadPrivateKeyWithJavaIoInputStream:inputStream];
    
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
