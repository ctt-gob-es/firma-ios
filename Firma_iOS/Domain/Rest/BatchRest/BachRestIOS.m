//
//  BachRest.m
//  Cliente @firma
//
//  Created by Desarrollo ABAMobile on 1/8/22.
//  Copyright © 2022 Solid GEAR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlobalConstants.h"
#import "BachRestIOS.h"
#import "Base64Utils.h"
#import "DesCypher.h"
#import "CADESConstants.h"

@interface BachRest ()


@property (weak, nonatomic) id<BatchRestDelegate> delegate;

@end

@implementation BachRest

@synthesize delegate;

- (id)initWithDelegate:(id) delegate{
    if (self = [super init]) {
        self.delegate = delegate;
        return self;
    } else {
        return nil;
    }
}

- (void)bachPresign:(NSString *)urlPresign withJsonData:(NSString *)json withCerts:(NSString *)certs {
    NSString *safeJson = [Base64Utils urlSafeEncode:json];
    NSString *safeCerts = [[Base64Utils urlSafeEncode:certs] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:safeJson forKey:@"json"];
    [dict setValue:safeCerts forKey:@"certs"];
    
    NSString *post = [self getParametersFromDictionary:dict];
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    NSURL *requestUrl = [NSURL URLWithString:urlPresign];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0];
    [request setHTTPMethod:@"POST"];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[postData length]] forHTTPHeaderField:@"Content-Length"];
    [self setHeaders:request];
    [request setHTTPBody:postData];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
								    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
	   if (error) {
            [self.delegate didErrorBachPresign:error.description];
		  return;
	   }
	   
	   NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
	   NSInteger statusCode = httpResponse.statusCode;
	   
        if (statusCode >= 200 && statusCode < 300) {
            NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            if (!jsonString) {
                [self.delegate didErrorBachPresign: @"PresignErrorResponseFormat"];
                return;
            }
                
            NSError *jsonError;
            NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
            
            if (responseDict != nil) {
               [self.delegate didSuccessBachPresign:responseDict];
            } else {
                [self.delegate didErrorBachPresign: @"PresignErrorResponseFormatDictionary"];
            }
        } else {
            [self.delegate didErrorBachPresign: @"PresignErrorHTTPResponse"];
        }
            
    }];
    
    [task resume];
}

- (void)bachPostsign:(NSString *)urlPostsign withJsonData:(NSString *)json withCerts:(NSString *)certs withTriData:(NSString *)tridata {
    NSString *safeJson = [Base64Utils urlSafeEncode:json];
    NSString *safeCerts = [[Base64Utils urlSafeEncode:certs] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSString *safeTridata = [Base64Utils urlSafeEncode:tridata];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:safeJson forKey:@"json"];
    [dict setValue:safeCerts forKey:@"certs"];
    [dict setValue:safeTridata forKey:@"tridata"];
    
    NSString *post = [self getParametersFromDictionary:dict];
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    NSURL *requestUrl = [NSURL URLWithString:urlPostsign];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0];
    [request setHTTPMethod:@"POST"];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[postData length]] forHTTPHeaderField:@"Content-Length"];
    [self setHeaders:request];
    [request setHTTPBody:postData];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
								    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
	   if (error) {
            [self.delegate didErrorBachPostsign:@"PostsignErrorConnection"];
            return;
	   }
	   
	   NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
	   NSInteger statusCode = httpResponse.statusCode;
	   
	   
        if (statusCode >= 200 && statusCode < 300) {
            NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            if (!jsonString) {
                [self.delegate didErrorBachPostsign: @"PostsignErrorResponseFormat"];
                return;
            }
                
            NSError *jsonError;
            NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
            
            if (responseDict != nil) {
                [self.delegate didSuccessBachPostsign:responseDict];
            } else {
                [self.delegate didErrorBachPostsign: @"PostsignErrorResponseFormatDictionary"];
            }
        } else {
            [self.delegate didErrorBachPostsign: @"PostsignErrorHTTPResponse"];
        }
    }];
    
    [task resume];
}


@end
