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

typedef enum {
    preSign,
    postSign,
} BatchRequestType;

@property (weak, nonatomic) id<BatchRestDelegate> delegate;

@end

@implementation BachRest

@synthesize delegate;

NSMutableData *responseData = NULL;
long statusCode;
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

/*-(void)bachPresign:(NSString*)urlPresign withJsonData:(NSString*)json withCerts:(NSString*)certs {
    currentType = preSign;
    //Creamos la cadena de envío al servidor POST
    NSString *safeJson = [Base64Utils urlSafeEncode: json];
    NSString *safeCerts = [Base64Utils urlSafeEncode: certs];
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
}*/


- (void)bachPresign:(NSString *)urlPresign withJsonData:(NSString *)json withCerts:(NSString *)certs {
    currentType = preSign;
    
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
    __block NSMutableData *receivedData = [NSMutableData data];
    __block NSInteger statusCode = 0;
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
								    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
	   if (error) {
		  if ([self.delegate respondsToSelector:@selector(didErrorBachPresign:)]) {
			 [self.delegate didErrorBachPresign:error.localizedDescription];
		  }
		  return;
	   }
	   
	   NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
	   statusCode = httpResponse.statusCode;
	   
	   [receivedData appendData:data];
	   
	   NSError *jsonError;
	   NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableContainers error:&jsonError];
	   
	   if (jsonError || !responseDict) {
		  NSString *errorToSend;
		  if (statusCode == 400) {
			 errorToSend = @"err-07:= Los parametros enviados al servicio no eran validos";
		  } else if (statusCode > 400 && statusCode < 500) {
			 errorToSend = @"err-09:= Error de comunicacion con el servicio";
		  } else {
			 errorToSend = @"err-07:= Los datos de prefirma recibidos son inválidos";
		  }
		  
		  if ([self.delegate respondsToSelector:@selector(didErrorBachPresign:)]) {
			 [self.delegate didErrorBachPresign:errorToSend];
		  }
	   } else {
		  if ([self.delegate respondsToSelector:@selector(didSuccessBachPresign:)]) {
			 [self.delegate didSuccessBachPresign:responseDict];
		  }
	   }
    }];
    
    [task resume];
}

/*- (void)bachPostsign:(NSString *)urlPostsign withJsonData:(NSString *)json withCerts:(NSString *)certs withTriData:(NSString *)tridata{
    currentType = postSign;
    //Creamos la cadena de envío al servidor POST
    NSString *safeJson = [Base64Utils urlSafeEncode: json];
    NSString *safeCerts = [Base64Utils urlSafeEncode: certs];
    safeCerts = [safeCerts stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSString *safeTridata = [Base64Utils urlSafeEncode: tridata];
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
}*/

- (void)bachPostsign:(NSString *)urlPostsign withJsonData:(NSString *)json withCerts:(NSString *)certs withTriData:(NSString *)tridata {
    currentType = postSign;
    
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
    __block NSMutableData *receivedData = [NSMutableData data];
    __block NSInteger statusCode = 0;
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
								    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
	   if (error) {
		  if ([self.delegate respondsToSelector:@selector(didErrorBachPostsign:)]) {
			 [self.delegate didErrorBachPostsign:error.localizedDescription];
		  }
		  return;
	   }
	   
	   NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
	   statusCode = httpResponse.statusCode;
	   
	   [receivedData appendData:data];
	   
	   NSError *jsonError;
	   NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableContainers error:&jsonError];
	   
	   if (jsonError || !responseDict) {
		  NSString *errorToSend;
		  if (statusCode == 400) {
			 errorToSend = @"err-07:= Los parametros enviados al servicio no eran validos";
		  } else if (statusCode > 400 && statusCode < 500) {
			 errorToSend = @"err-09:= Error de comunicacion con el servicio";
		  } else {
			 errorToSend = @"err-07:= Los datos de postfirma recibidos son inválidos";
		  }
		  
		  if ([self.delegate respondsToSelector:@selector(didErrorBachPostsign:)]) {
			 [self.delegate didErrorBachPostsign:errorToSend];
		  }
	   } else {
		  if ([self.delegate respondsToSelector:@selector(didSuccessBachPostsign:)]) {
			 [self.delegate didSuccessBachPostsign:responseDict];
		  }
	   }
    }];
    
    [task resume];
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
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
    statusCode = httpResponse.statusCode;
    responseData = [[NSMutableData alloc] init];
}

//cuando se ha terminado de leer los datos recibidos, terminamos ya la conexion y se pasa a la prefirma.
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *jsonError;
    
    NSString *receivedString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    //Convert the response into a dictionary
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseData
                                                         options:NSJSONReadingMutableContainers
                                                           error:&jsonError];
    
    if (jsonError != nil || dict == nil) {
        if (currentType == preSign) {
            NSString *errorToSend = @"err-07:= Los datos de prefirma recibidos son inválidos";
            if (statusCode == 400) {
                errorToSend = @"err-07:= Los parametros enviados al servicio no eran validos";
            } else if (statusCode > 400 && statusCode < 500) {
                errorToSend = @"err-09:= Error de comunicacion con el servicio";
            }
            [self.delegate didErrorBachPresign:errorToSend];
        } else {
            NSString *errorToSend = @"err-07:= Los datos de postfirma recibidos son inválidos";
            [self.delegate didErrorBachPostsign:errorToSend];
        }
    } else {
        if (currentType == preSign) {
            [self.delegate didSuccessBachPresign:dict];
        } else if(currentType == postSign) {
            [self.delegate didSuccessBachPostsign:dict];
        }
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
        NSString *errorToSend = @"err-09:= La URL del servicio de prefirma de lotes no es válida";
        [self.delegate didErrorBachPresign:errorToSend];
    }else if(currentType == postSign){
        //Notificamos del error al servidor
        NSString *errorToSend = @"err-09:= La URL del servicio de postfirma de lotes no es válida";
        [self.delegate didErrorBachPostsign:errorToSend];
    }
}

@end
