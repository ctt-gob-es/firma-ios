//
//  PadesUtils.m
//  AutofirmaJ2OBJC
//
//  Created by Desarrollo Abamobile on 14/8/24.
//

#import <Foundation/Foundation.h>
#import "PadesUtils.h"
#import "AOPadesUtils.h"

@implementation PadesUtils

- (void)signPdf:(NSData *)pdfData
  signAlgorithm:(nullable NSString *)signAlgorithm
	privateKey:(SecKeyRef)privateKey
    certificate:(SecCertificateRef)certificateRef
certificateAlgorithm:(nullable NSString *)certificateAlgorithm
    extraParams:(nullable NSDictionary<NSString *, NSString *> *)extraParams
	completion:(SignPdfCompletionHandler)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
	   AOPadesUtils *utils = [[AOPadesUtils alloc] init];
	   
	   [utils signPdfWithData:pdfData
			  signAlgorithm:signAlgorithm
				privateKey:privateKey
			    certificate:certificateRef
		certificateAlgorithm:certificateAlgorithm
			    extraParams:extraParams
				completion:^(NSString * _Nullable result, NSError * _Nullable error) {
		  dispatch_async(dispatch_get_main_queue(), ^{
			 if (error) {
				completion(nil, error);
			 } else if (result) {
				completion(result, nil);
			 } else {
				NSError *unknownError = [NSError errorWithDomain:@"Error"
												    code:9999
												userInfo:@{NSLocalizedDescriptionKey: @"Unknown error occurred"}];
				completion(nil, unknownError);
			 }
		  });
	   }];
    });
}

@end
