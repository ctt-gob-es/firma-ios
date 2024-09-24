//
//  Firma.m
//  Firma_iOS
//
//  Created by Juliana Marulanada on 7/1/16.
//  Copyright © 2016 Atos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Firma.h"
#import "IOSPrimitiveArray.h"
#import "Base64Utils.h"
#import "es/gob/afirma/core/signers/Pkcs1Utils.h"

@implementation Firma

- (NSString *)processDataAndReturnEncodedString:(NSData *)dataSigned {
    IOSByteArray *byteArray = [IOSByteArray arrayWithBytes:[dataSigned bytes] count:[dataSigned length]];
    IOSByteArray *decodedSignature = EsGobAfirmaCoreSignersPkcs1Utils_decodeSignatureWithByteArray_(byteArray);
    NSData *decodedSignatureData = [NSData dataWithBytes:[decodedSignature buffer] length:[decodedSignature length]];
    NSString *stringSigned = [Base64Utils encode:decodedSignatureData];
    
    return stringSigned;
}

@end
