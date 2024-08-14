//
//  AOPadesUtils.h
//  Firma_iOS
//
//  Created by Desarrollo Abamobile on 12/8/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
#import <Foundation/Foundation.h>
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

@interface AOPadesUtils : NSObject

typedef void (^SignPdfCompletionHandler)(NSString * result, NSError * error);

- (void)signPdfWithData:(NSData *)pdfData
		    algorithm:(NSString *)algorithm
		   privateKey:(SecKeyRef)privateKey
		  certificate:(SecCertificateRef)certificate
		  extraParams:(NSDictionary *)extraParams
		   completion:(SignPdfCompletionHandler)completion;

- (IOSByteArray *)obtainPdfData:(NSData *)pdfData;
- (JavaSecurityPrivateKey *)obtainPrivateKey:(SecKeyRef)privateKey;
- (IOSObjectArray *)obtainCertificateChain:(SecCertificateRef)certificate;
- (JavaUtilProperties *)obtainExtraParams:(NSDictionary *)extraParams;

@end
