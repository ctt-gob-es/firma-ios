//
//  AOPadesUtils.m
//  Autofirma
//
//  Created by Desarrollo Abamobile on 12/8/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
#import "AOPadesUtils.h"
#import "IOSObjectArray.h"
#include "IOSPrimitiveArray.h"
#import "J2ObjC_source.h"
#include "java/util/Properties.h"

@implementation AOPadesUtils

- (EsGobAfirmaIosSignatureResult *)signPdfWithData:(NSData *)pdfData
								algorithm:(NSString *)algorithm
								privateKey:(id<JavaSecurityPrivateKey>)privateKey
								 certChain:(IOSObjectArray *)certChain
							    extraParams:(NSDictionary *)extraParams {
    IOSByteArray *iosPdfData = [IOSByteArray arrayWithBytes:[pdfData bytes] count:[pdfData length]];
    IOSObjectArray *certChainArray = [IOSObjectArray arrayWithArray:certChain];
    JavaUtilProperties *javaProperties = [[JavaUtilProperties alloc] init];
    
    for (NSString *key in extraParams) {
	   [javaProperties setPropertyWithNSString:key withNSString:[extraParams objectForKey:key]];
    }

    EsGobAfirmaIosPadesSignerWrapper *signerWrapper = [[EsGobAfirmaIosPadesSignerWrapper alloc] init];
    EsGobAfirmaIosSignatureResult *result = [signerWrapper signWithByteArray:iosPdfData
												    withNSString:algorithm
										withJavaSecurityPrivateKey:privateKey
							 withJavaSecurityCertCertificateArray:certChainArray
										withJavaUtilProperties:javaProperties];

    return result;
}

@end
