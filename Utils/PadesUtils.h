//
//  PadesUtils.h
//  AutofirmaJ2OBJC
//
//  Created by Desarrollo Abamobile on 14/8/24.
//
#import <Foundation/Foundation.h>
#import <Security/Security.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^SignPdfCompletionHandler)(NSString * _Nullable result, NSError * _Nullable error);

@interface PadesUtils : NSObject

- (void)signPdf:(NSData *)pdfData
  signAlgorithm:(nullable NSString *)algorithm
	privateKey:(SecKeyRef)privateKey
    certificate:(SecCertificateRef)certificateRef
certificateAlgorithm:(nullable NSString *)certificateAlgorithm
    extraParams:(nullable NSDictionary<NSString *, NSString *> *)extraParams
	completion:(SignPdfCompletionHandler)completion;

@end

NS_ASSUME_NONNULL_END
