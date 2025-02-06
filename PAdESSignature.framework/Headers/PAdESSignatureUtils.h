//
//  PAdESSignatureUtils.h
//  PAdESSignature
//
//  Created by Desarrollo Abamobile on 10/12/24.
//

#import <Foundation/Foundation.h>
#import <PAdESSignature/PresignResponse.h>
#import <PAdESSignature/PostsignResponse.h>

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

- (PresignResponse *)dniePresignPdfWithData:(NSData *)pdfData
			  signAlgorithm:(NSString *)signAlgorithm
				certificate:(SecCertificateRef)certificate
	   certificateAlgorithm:(NSString *)certificateAlgorithm
					   extraParams:(NSDictionary *)extraParams;

- (PostsignResponse *)dniePostsignPdfWithData:(NSData *)pdfData
			  signAlgorithm:(NSString *)signAlgorithm
				certificate:(SecCertificateRef)certificate
	   certificateAlgorithm:(NSString *)certificateAlgorithm
				extraParams:(NSDictionary *)extraParams
								pkcs1:(NSData *)pkcs1;

@end
