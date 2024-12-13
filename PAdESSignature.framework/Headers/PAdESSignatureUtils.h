//
//  PAdESSignatureUtils.h
//  PAdESSignature
//
//  Created by Desarrollo Abamobile on 10/12/24.
//

#import <Foundation/Foundation.h>
@class EsGobAfirmaIosPresignResult;
@class IOSByteArray;

@interface PAdESSignatureUtils : NSObject

typedef void (^SignPdfCompletionHandler)(NSString * result, NSError * error);

- (void)signPdfWithData:(NSData *)pdfData
		  signAlgorithm:(NSString *)signAlgorithm
			 privateKey:(SecKeyRef)privateKey
			certificate:(SecCertificateRef)certificate
   certificateAlgorithm:(NSString *)certificateAlgorithm
			extraParams:(NSDictionary *)extraParams
			 completion:(SignPdfCompletionHandler)completion;

- (void)preSignPdfWithData:(NSData *)pdfData
			 signAlgorithm:(NSString *)signAlgorithm
				privateKey:(SecKeyRef)privateKey
			   certificate:(SecCertificateRef)certificate
	  certificateAlgorithm:(NSString *)certificateAlgorithm
			   extraParams:(NSDictionary *)extraParams
				completion:(SignPdfCompletionHandler)completion;

- (void)postSignPdfWithData:(NSData *)pdfData
			  signAlgorithm:(NSString *)signAlgorithm
				 privateKey:(SecKeyRef)privateKey
				certificate:(SecCertificateRef)certificate
	   certificateAlgorithm:(NSString *)certificateAlgorithm
				extraParams:(NSDictionary *)extraParams
			  presignResult:(EsGobAfirmaIosPresignResult *)presignResult
					  pkcs1:(IOSByteArray *)pkcs1
				 completion:(SignPdfCompletionHandler)completion;

@end
