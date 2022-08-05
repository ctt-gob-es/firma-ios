//
//  BachRest.m
//  Cliente @firma
//
//  Created by Desarrollo ABAMobile on 1/8/22.
//  Copyright © 2022 Solid GEAR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlobalConstants.h"
#import "BachRest.h"
#import "Base64.h"
#import "DesCypher.h"
#import "CADESConstants.h"

@interface BachRest ()

typedef enum {
    preSign,
    postSign,
} BatchRequestType;

@property (weak, nonatomic) id<BatchRestDelegate> delegate;

@end

@implementation BachRest

@synthesize delegate;

NSMutableData *responseData = NULL;
bool retrievingDataFromServletBatch = false;
NSString *datosInUseBatch      = NULL;
NSString *cipherKeyBatch       = NULL;
BatchRequestType currentType;

- (id)initWithDelegate:(id) delegate{
    if (self = [super init]) {
        self.delegate = delegate;
        return self;
    } else {
        return nil;
    }
}

- (void)bachPresign:(NSString *)urlPresign :(NSString *)json :(NSString *)certs{
    currentType = preSign;
    //Creamos la cadena de envío al servidor POST
    NSString *safeJson = [Base64 urlSafeEncode: json];
    NSString *safeCerts = [Base64 urlSafeEncode: certs];
    safeCerts = [safeCerts stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:safeJson forKey:@"json"];
    [dict setValue:safeCerts forKey:@"certs"];
    
    NSString *post = [self getParametersFromDictionary:dict];
    
    //Codificamos la url de post
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", (int)[postData length]];
    
    NSURL* requestUrl = [[NSURL alloc] initWithString:urlPresign];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval: 30.0];
    [request setHTTPMethod:POST];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [self setHeaders:request];
    [request setHTTPBody:postData];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            [connection start];
        });
    });
    
}

- (void)bachPostsign:(NSString *)urlPostsign :(NSString *)json :(NSString *)certs :(NSString *)tridata{
    currentType = postSign;
    //Creamos la cadena de envío al servidor POST
    NSString *safeJson = [Base64 urlSafeEncode: json];
    NSString *safeCerts = [Base64 urlSafeEncode: certs];
    safeCerts = [safeCerts stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSString *safeTridata = [Base64 urlSafeEncode: tridata];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:safeJson forKey:@"json"];
    [dict setValue:safeCerts forKey:@"certs"];
    [dict setValue:safeTridata forKey:@"tridata"];
    
    NSString *post = [self getParametersFromDictionary:dict];
    
    //Codificamos la url de post
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", (int)[postData length]];
    
    NSURL* requestUrl = [[NSURL alloc] initWithString:urlPostsign];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval: 30.0];
    [request setHTTPMethod:POST];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [self setHeaders:request];
    [request setHTTPBody:postData];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            [connection start];
        });
    });
}

/* METODOS DONDE SE RECIBE LA RESPUESTA DE LA CONEXION ASINCRONA */
/**
 Método donde se recibe la respuesta de la petición asíncrona.
 
 parámetros:
 -----------
 didReceiveData: Conexión establecida asíncrona.
 data:           Datos recibidos del servidor.
 */
//los datos van llegando por "rafagas". Lo que hay que ir haciendo es ir juntandolos todos.
-(void)connection:(NSURLConnection *)connection didReceiveData: (NSData *)data
{
    // Append the new data to the receivedData.
    [responseData appendData:data];
}

//Se confirma la respuesta. aprovechamos para inicializar los datos de respuesta
-(void)connection:(NSURLConnection *)connection didReceiveResponse:
(NSURLResponse *)response
{
    responseData = [[NSMutableData alloc] init];
}

//cuando se ha terminado de leer los datos recibidos, terminamos ya la conexion y se pasa a la prefirma.
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *jsonError;
    //Convert the response into a dictionary
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseData
                                                         options:NSJSONReadingMutableContainers
                                                           error:&jsonError];
    NSString *jsonString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    if (currentType == preSign){
        if (dict != nil){
            [self.delegate didSuccessBachPresign:dict];
        }else{
            [self.delegate didErrorBachPresign:@"Error"];
        }
    } else if(currentType == postSign){
        [self.delegate didSuccessBachPostsign:dict];
    }
}

/**************************/
/**** PROTECCIONES SSL ****/
/**************************/

//para las protecciones ssl

- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

//Acepta todas las conexiones ssl
-(void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
}

/**
 Método donde se procesan los errores de conexión con el servidor.
 
 parámetros:
 -----------
 connection:        Conexión establecida asíncrona.
 didFailWithError:  Error producido.
 */
- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    // Liberar la conexión
    if (currentType == preSign){
        //Notificamos del error al servidor
        NSString *errorToSend = @"";
        errorToSend = [errorToSend stringByAppendingString:ERROR_SIGNING];
        errorToSend = [errorToSend stringByAppendingString:ERROR_SEPARATOR];
        errorToSend = [errorToSend stringByAppendingString:DESC_ERROR_SIGNING];
        
        [self.delegate didErrorBachPresign:errorToSend];
    }else if(currentType == postSign){
        //Notificamos del error al servidor
        NSString *errorToSend = @"";
        errorToSend = [errorToSend stringByAppendingString:ERROR_SIGNING];
        errorToSend = [errorToSend stringByAppendingString:ERROR_SEPARATOR];
        errorToSend = [errorToSend stringByAppendingString:DESC_ERROR_SIGNING];
        
        [self.delegate didErrorBachPostsign:errorToSend];
    }
}

@end
