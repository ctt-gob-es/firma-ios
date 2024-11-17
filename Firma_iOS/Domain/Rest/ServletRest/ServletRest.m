//
//  BachRest.m
//  Cliente @firma
//
//  Created by Desarrollo ABAMobile on 1/8/22.
//  Copyright © 2022 Solid GEAR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlobalConstants.h"
#import "ServletRest.h"
#import "Base64Utils.h"
#import "DesCypher.h"
#import "CADESConstants.h"
#import "BatchErrorCodes.h"

@interface ServletRest ()

@property (weak, nonatomic) id<ServletRestDelegate> delegate;

@end


@implementation ServletRest

- (id)initWithDelegate:(id) delegate{
    if (self = [super init]) {
        self.delegate = delegate;
        return self;
    } else {
        return nil;
    }
}

-(void)downloadDataFromRtservlet:(NSString*) fileId rtServlet:(NSString *) rtServlet cipherKey:(NSString *) cipherKey
{
    if(rtServlet != NULL && fileId != NULL){
        //Creamos la cadena de envío al servidor POST
        NSString *post = @"";
        post = [post stringByAppendingString:PARAMETER_NAME_OPERATION];
        post = [post stringByAppendingString:HTTP_EQUALS];
        post = [post stringByAppendingString:OPERATION_GET];
        post = [post stringByAppendingString:HTTP_AND];
        post = [post stringByAppendingString:PARAMETER_NAME_VERSION];
        post = [post stringByAppendingString:HTTP_EQUALS];
        post = [post stringByAppendingString:PARAMETER_NAME_VERSION_1_0];
        post = [post stringByAppendingString:HTTP_AND];
        post = [post stringByAppendingString:PARAMETER_NAME_ID];
        post = [post stringByAppendingString:HTTP_EQUALS];
        post = [post stringByAppendingString:fileId];
        
        //Codificamos la url de post
        NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%d", (int)[postData length]];
        
        // Obtenemos la URL del servidor de la pantalla de preferencias
        NSURL* requestUrl = [[NSURL alloc] initWithString:rtServlet];
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0];
        [request setHTTPMethod:POST];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [self setHeaders:request];
        [request setHTTPBody:postData];
        
        
        NSURLSession *session = [NSURLSession sharedSession];
        
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error) {
              if ([self.delegate respondsToSelector:@selector(didErrorStoreData:)]) {
                    [self.delegate didErrorDownloadDataFromServer:UploadErrorConnection];
              }
              return;
           }
            
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            NSInteger statusCode = httpResponse.statusCode;
           
            if (statusCode >= 200 && statusCode < 300) {
                NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                
                if (jsonString != nil) {
                    NSError *jsonError;
                    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                                         options:NSJSONReadingMutableContainers
                                                                           error:&jsonError];
                    if (dict != nil) {
                        [self.delegate didSuccessDownloadDataFromServer:dict];
                    } else {
                        [self.delegate didErrorDownloadDataFromServer:DownloadErrorResponseFormatDictionary];
                    }
                } else {
                    [self.delegate didErrorDownloadDataFromServer:DownloadErrorResponseFormat];
                }
            } else {
                [self.delegate didErrorDownloadDataFromServer: DownloadErrorHTTPResponse];
            }
        }];
        
        [task resume];
    }
}

-(void)storeData:(NSData*) data certificateBase64:(NSString *) certificateBase64 stServlet:(NSString *) stServlet cipherKey:(NSString *) cipherKey docId:(NSString *) docId
{
    //cifrado de la firma
    NSString *encryptedSignDataB64 = [DesCypher cypherData:data sk:[cipherKey dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *encryptedDataB64 = nil;
    if (certificateBase64 != nil) {
       //cifrado del certificado
       NSString * certificateString = [Base64Utils urlSafeEncode: certificateBase64];
       NSData *dataCertificate = [Base64Utils decode:certificateString urlSafe:true];
       NSString *encryptedCertificateDataB64 = [DesCypher cypherData:dataCertificate sk:[cipherKey dataUsingEncoding:NSUTF8StringEncoding]];
       
       // Concatenacion
       encryptedDataB64 = [NSString stringWithFormat:@"%@|%@", encryptedSignDataB64, encryptedCertificateDataB64];
    } else {
       encryptedDataB64 = encryptedSignDataB64;
    }
    
    [self uploadDataIntermediateServer:encryptedDataB64 stServlet:stServlet cipherKey:cipherKey docId:docId];
}

-(void)storeDataError:(NSString*) error stServlet:(NSString *) stServlet cipherKey:(NSString *) cipherKey docId:(NSString *) docId {
    [self uploadDataIntermediateServer:error stServlet:stServlet cipherKey:cipherKey docId:docId];
}

-(void)uploadDataIntermediateServer:(NSString*) data stServlet:(NSString *) stServlet cipherKey:(NSString *) cipherKey docId:(NSString *) docId {
    
    //Creamos la cadena de envío al servidor POST
    NSString *post = @"";
    post = [post stringByAppendingString:PARAMETER_NAME_OPERATION];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:OPERATION_PUT];
    post = [post stringByAppendingString:HTTP_AND];
    post = [post stringByAppendingString:PARAMETER_NAME_VERSION];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:PARAMETER_NAME_VERSION_1_0];
    post = [post stringByAppendingString:HTTP_AND];
    post = [post stringByAppendingString:PARAMETER_NAME_ID];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:docId];
    post = [post stringByAppendingString:HTTP_AND];
    post = [post stringByAppendingString:PARAMETER_NAME_DAT];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:data];

    //Codificamos la url de post
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", (int)[postData length]];

    // Obtenemos la URL del servidor de la pantalla de preferencias
    NSURL* requestUrl = [[NSURL alloc] initWithString:stServlet];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval: 30.0];
    [request setHTTPMethod:POST];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [self setHeaders:request];
    [request setHTTPBody:postData];

    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
								    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
	   if (error) {
		  if ([self.delegate respondsToSelector:@selector(didErrorStoreData:)]) {
                [self.delegate didErrorStoreData:UploadErrorConnection];
		  }
		  return;
	   }
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        NSInteger statusCode = httpResponse.statusCode;
	   
        if (statusCode >= 200 && statusCode < 300) {
            NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            if (jsonString == nil) {
                [self.delegate didErrorStoreData:UploadErrorResponseFormat];
            } else {
                [self.delegate didSuccessStoreData:jsonString];
            }
        } else {
            [self.delegate didErrorStoreData:UploadErrorHTTPResponse];
        }
    }];
    
    [task resume];
}

@end
