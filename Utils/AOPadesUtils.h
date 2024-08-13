//
//  AOPadesUtils.h
//  Firma_iOS
//
//  Created by Desarrollo Abamobile on 12/8/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "PadesSignerWrapper.h"

@interface AOPadesUtils : NSObject

- (EsGobAfirmaIosSignatureResult *)signPdfWithData:(NSData *)pdfData
								algorithm:(NSString *)algorithm
								privateKey:(id<JavaSecurityPrivateKey>)privateKey
								 certChain:(NSArray *)certChain
							    extraParams:(NSDictionary *)extraParams;

@end
