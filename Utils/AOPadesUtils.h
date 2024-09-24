//
//  AOPadesUtils.h
//  Firma_iOS
//
//  Created by Desarrollo Abamobile on 12/8/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface AOPadesUtils : NSObject

typedef void (^SignPdfCompletionHandler)(NSString * result, NSError * error);

- (void)signPdfWithData:(NSData *)pdfData
		signAlgorithm:(NSString *)signAlgorithm
		   privateKey:(SecKeyRef)privateKey
		  certificate:(SecCertificateRef)certificate
   certificateAlgorithm:(NSString *)certificateAlgorithm
		  extraParams:(NSDictionary *)extraParams
		   completion:(SignPdfCompletionHandler)completion;

@end
