//
//  BachRest.m
//  Cliente @firma
//
//  Created by Desarrollo ABAMobile on 1/8/22.
//  Copyright © 2022 Solid GEAR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlobalConstants.h"
#import "ParentRest.h"
#import "Base64.h"
#import "DesCypher.h"
#import "CADESConstants.h"

@interface ParentRest ()

@end

@implementation ParentRest

-(NSString *)getParametersFromDictionary:(NSDictionary *)dict{
    NSString *outPutString = @"";
    NSArray *keys=[dict allKeys];
    
    for (NSString *key in keys){
        outPutString = [outPutString stringByAppendingString:key];
        outPutString = [outPutString stringByAppendingString:HTTP_EQUALS];
        outPutString = [outPutString stringByAppendingString:[dict objectForKey:key]];
        outPutString = [outPutString stringByAppendingString:HTTP_AND];
    }
    return outPutString;
}

-(void)setHeaders:(NSMutableURLRequest *)request{
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)" forHTTPHeaderField:@"User-Agent"];
    [request setValue:@"text/plain,text/html,application/xhtml+xml,application/xml" forHTTPHeaderField:@"Accept"];
}

@end
