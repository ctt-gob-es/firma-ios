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
    
    if (attributes) {
	   CFRelease(attributes);
    }

    JavaSecurityPrivateKey *pvt = [[JavaSecurityPrivateKey alloc] init];

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
    return certChainArray;
}

- (JavaUtilProperties *)obtainExtraParams:(NSDictionary *)extraParams {
    JavaUtilProperties *javaProperties = [[JavaUtilProperties alloc] init];
    for (NSString *key in extraParams) {
	   [javaProperties setPropertyWithNSString:key withNSString:[extraParams objectForKey:key]];
    }
    return javaProperties;
}

@end
