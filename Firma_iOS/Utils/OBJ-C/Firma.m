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
#import <PAdESSignature/PKCS1DecoderUtils.h>

@implementation Firma

- (NSString *)processDataAndReturnEncodedString:(NSData *)dataSigned {
    IOSByteArray *byteArray = [IOSByteArray arrayWithBytes:[dataSigned bytes] count:[dataSigned length]];
    IOSByteArray *decodedSignature = [PKCS1DecoderUtils decodeSignatureWithByteArray:byteArray];
    NSData *decodedSignatureData = [NSData dataWithBytes:[decodedSignature buffer] length:[decodedSignature length]];
    NSString *stringSigned = [Base64Utils encode:decodedSignatureData];
    
    return stringSigned;
}

@end
