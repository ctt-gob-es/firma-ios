//
//  Base64Utils.m
//
//  Created by Tomas Garcia-Meras on 8/7/14.
//  Copyright (c) 2014 Gobierno de España. All rights reserved.

#import <Foundation/Foundation.h>
#import "Base64Utils.h"

@implementation Base64Utils: NSObject

+(NSData*) decode:(NSString*) str urlSafe:(Boolean) urlSafe;
{
    if (urlSafe)
    {
        return [Base64Utils decode:[Base64Utils urlSafeDecode:str]];
    }
    return [Base64Utils decode:str];
}

+(NSData*) decode:(NSString*) str
{
    // Para hacer la decodificación a prueba de errores se deshace un posible "URL Encoding" antes de decodificar el Base64
    if(str != NULL) {
        
        return [[NSData alloc] initWithBase64EncodedString:[
                                                            str stringByRemovingPercentEncoding]
                                                            options:NSDataBase64DecodingIgnoreUnknownCharacters];
    }
    else {
        return NULL;
    }
}

+(NSString*) encode:(NSData*) source urlSafe:(Boolean) urlSafe;
{
    if (urlSafe)
    {

        return [[Base64Utils urlSafeEncode:[Base64Utils encode:source]] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    return [Base64Utils encode:source];
}

+ (NSString *) encode:(NSData *)source
{
    return [source base64EncodedStringWithOptions: 0];
}

+(NSString*) urlSafeEncode: (NSString*) string {

    return [[string
             stringByReplacingOccurrencesOfString:@"+" withString:@"-"]
             stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
}

+(NSString*) urlSafeDecode: (NSString*) string {
    
    return [[string
            stringByReplacingOccurrencesOfString:@"-" withString:@"+"]
            stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
}

@end
