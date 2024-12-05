//
//  AOXMLCountersignParsed.m
//  Firma_iOS
//
//  Created by Javier on 20/10/14.
//  Copyright (c) 2014 Atos. All rights reserved.
//

#import "AOCounterSignPreItems.h"
#import "Firma.h"
#import "Base64Utils.h"

@implementation AOCounterSignPreItems

- (NSString *)generateXML: (NSMutableArray *)firmas {
    
    NSString *string = @"";
    
    string= [
             [
              string
              stringByAppendingString:@"<xml>\n"
              ]
             stringByAppendingString:@" <firmas>\n"
             ];
    
    for (Firma *firma in firmas) {
        
        string = [[[ string
                    stringByAppendingString: @"  <firma Id=\""]
                   stringByAppendingString: firma.ident]
                  stringByAppendingString: @"\">\n"];
        for (NSString *key in [firma.params allKeys]) {
            string = [[[[[string stringByAppendingString: @"  <param n=\""]
                         stringByAppendingString: key]
                        stringByAppendingString: @"\">\n"]
                       stringByAppendingString: [firma.params objectForKey:key]]
                      stringByAppendingString: @"  </param>\n"];
        }
        
        
        string = [ string stringByAppendingString:@"  </firma>\n"];
    }
    
    string = [
              [
               string
               stringByAppendingString:@" </firmas>\n"]
              stringByAppendingString:@"</xml>"];
    return string;
}

@end
