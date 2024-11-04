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

@interface ServletRest ()

typedef enum {
    storeData,
    loadDataFromRtservlet,
} ServletRequestType;

@property (weak, nonatomic) id<ServletRestDelegate> delegate;

@end

@implementation ServletRest

@synthesize delegate;

NSMutableData *responseDataServlet = NULL;
ServletRequestType currentType;

- (id)initWithDelegate:(id) delegate{
    if (self = [super init]) {
        self.delegate = delegate;
        return self;
    } else {
        return nil;
    }
}

-(void)loadDataFromRtservlet:(NSString*) fileId rtServlet:(NSString *) rtServlet cipherKey:(NSString *) cipherKey
{
    currentType = loadDataFromRtservlet;
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
        
        NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            dispatch_sync(dispatch_get_main_queue(), ^{
                [connection start];
            });
        });
    }
}

/*-(void)storeDataError:(NSString*) error stServlet:(NSString *) stServlet cipherKey:(NSString *) cipherKey docId:(NSString *) docId {
    currentType = storeData;
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
    post = [post stringByAppendingString:error];

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

    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            [connection start];
        });
    });
}*/

-(void)storeDataError:(NSString*) error stServlet:(NSString *) stServlet cipherKey:(NSString *) cipherKey docId:(NSString *) docId {
    currentType = storeData;
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
    post = [post stringByAppendingString:error];

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
    __block NSMutableData *receivedData = [NSMutableData data];
    __block NSInteger statusCode = 0;
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
								    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
	   if (error) {
		  if ([self.delegate respondsToSelector:@selector(didErrorStoreData:)]) {
			 [self.delegate didErrorStoreData:error.localizedDescription];
		  }
		  return;
	   }
	   
	   NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
	   statusCode = httpResponse.statusCode;
	   
	   [receivedData appendData:data];
	   
	   NSString *jsonString = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
	   
	   if (jsonString == nil) {
		  NSString *errorToSend = @"err-07:= Los datos recibidos al guardar en el servlet son inválidos";
		  [self.delegate didErrorStoreData:errorToSend];
	   }
	   
	   [self.delegate didSuccessStoreData:jsonString];
    }];
    
    [task resume];
}

/*-(void)storeData:(NSData*) data certificateBase64:(NSString *) certificateBase64 stServlet:(NSString *) stServlet cipherKey:(NSString *) cipherKey docId:(NSString *) docId
{
    currentType = storeData;
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
    
    // Se envia la firma cifrada y en base64
    post = [post stringByAppendingString:PARAMETER_NAME_DAT];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:encryptedDataB64];
    
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
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            [connection start];
        });
    });
}*/

-(void)storeData:(NSData*) data certificateBase64:(NSString *) certificateBase64 stServlet:(NSString *) stServlet cipherKey:(NSString *) cipherKey docId:(NSString *) docId
{
    currentType = storeData;
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
    
    // Se envia la firma cifrada y en base64
    post = [post stringByAppendingString:PARAMETER_NAME_DAT];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:encryptedDataB64];
    
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
    __block NSMutableData *receivedData = [NSMutableData data];
    __block NSInteger statusCode = 0;
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
								    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
	   if (error) {
		  if ([self.delegate respondsToSelector:@selector(didErrorStoreData:)]) {
			 [self.delegate didErrorStoreData:error.localizedDescription];
		  }
		  return;
	   }
	   
	   NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
	   statusCode = httpResponse.statusCode;
	   
	   [receivedData appendData:data];
	   
	   NSError *jsonError;
	   NSString *jsonString = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
	   
	   if (jsonString == nil) {
		  NSString *errorToSend = @"err-07:= Los datos recibidos al guardar en el servlet son inválidos";
		  [self.delegate didErrorStoreData:errorToSend];
	   }
	   
	   [self.delegate didSuccessStoreData:jsonString];
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
    [responseDataServlet appendData:data];
}

//Se confirma la respuesta. aprovechamos para inicializar los datos de respuesta
-(void)connection:(NSURLConnection *)connection didReceiveResponse:
(NSURLResponse *)response
{
    responseDataServlet = [[NSMutableData alloc] init];
}

//cuando se ha terminado de leer los datos recibidos, terminamos ya la conexion y se pasa a la prefirma.
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *jsonError;
    
    NSString *jsonString = [[NSString alloc] initWithData:responseDataServlet encoding:NSUTF8StringEncoding];
    
    if (jsonString == nil) {
        if (currentType == storeData) {
            NSString *errorToSend = @"err-07:= Los datos recibidos al guardar en el servlet son inválidos";
            [self.delegate didErrorStoreData:errorToSend];
        } else if(currentType == loadDataFromRtservlet) {
            NSString *errorToSend = @"err-07:= La datos recibidos del servlet son invalidos";
            [self.delegate didErrorStoreData:errorToSend];
        }
    }
    
    if (currentType == storeData){
        [self.delegate didSuccessStoreData:jsonString];
    } else if(currentType == loadDataFromRtservlet){
        if ([jsonString hasPrefix:@"ERR-"]){
            [self.delegate didErrorLoadDataFromServer:jsonString];
        }else{
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseDataServlet
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
            [self.delegate didSuccessLoadDataFromServer:dict];
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
    if (currentType == storeData){
        //Notificamos del error al servidor
        //Notificamos del error al servidor
        NSString *errorToSend = @"err-09:= La ruta del Servlet para guardar datos es inválida";
        [self.delegate didErrorStoreData:errorToSend];
    }else if(currentType == loadDataFromRtservlet){
        //Notificamos del error al servidor
        NSString *errorToSend = @"err-09:= La ruta del Servlet para obtener datos es inválida";
        [self.delegate didErrorLoadDataFromServer:errorToSend];
    }
}

@end
