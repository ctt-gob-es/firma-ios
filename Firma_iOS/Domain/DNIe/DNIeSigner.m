//
//  DNIeSigner.m
//  Autofirma
//
//  Created by Desarrollo Abamobile on 8/10/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

// DnieSigner.m

#import "DNIeSigner.h"

@interface DNIeSigner()

@property (nonatomic, strong) EsGobJmulticardCardDnieDnieNfc *dniFactory;

@end

@implementation DNIeSigner

+ (IOSByteArray *)signData:(IOSByteArray *)data
		  usingFactory:(EsGobJmulticardCardDnieDnieNfc *)factory
		  withPrivateKey:(id<EsGobJmulticardCardPrivateKeyReference>)privateKey
		  algorithm:(NSString *)algorithm {
    if (factory && privateKey) {
	   IOSByteArray *signedData = [factory signWithByteArray:data
									   withNSString:algorithm
				withEsGobJmulticardCardPrivateKeyReference:privateKey];
	   return signedData;
    }
    
    return nil;
}

@end
