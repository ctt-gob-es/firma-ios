//
//  BatchSignUseCase.m
//  Cliente @firma
//
//  Created by Luis Nicieza on 29/7/22.
//  Copyright © 2022 Solid GEAR. All rights reserved.
//

#import "BatchSignUseCase.h"
#import "CADESConstants.h"
#import "InputParametersBatch.h"
#import "BachRest.h"
#import "ServletRest.h"
#import "Base64.h"
#import "CADESSignUtils.h"


@interface BatchSignUseCase ()

@property (strong, nonatomic) InputParametersBatch *parametersBatch;
@property (strong, nonatomic) NSString *urlSafeCertificateData;
@property (weak, nonatomic) id<BatchSignUseCaseDelegate> delegate;
@property (strong, nonatomic) BachRest* bachRest;
@property (strong, nonatomic) ServletRest* servletRest;
@property (strong, nonatomic) NSString *responseMessage;

@end

@implementation BatchSignUseCase

@synthesize parametersBatch;
@synthesize urlSafeCertificateData;
@synthesize delegate;
@synthesize bachRest;
@synthesize servletRest;
@synthesize responseMessage;

SecKeyRef privateKey;

- (id)initWithCertificate:(NSString *) base64UrlSafeCertificateData withDelegate:(id) delegate andPrivateKey:(SecKeyRef) thePrivateKey {
    if (self = [super init]) {
        self.urlSafeCertificateData = base64UrlSafeCertificateData;
        self.delegate = delegate;
        privateKey = thePrivateKey;
        self.bachRest = [[BachRest alloc]initWithDelegate:self];
        self.servletRest = [[ServletRest alloc]initWithDelegate:self];
        return self;
    } else {
        return nil;
    }
}


- (void)signBatch:(NSDictionary *) dataOperation {
    // Obtenemos los datos que nos llegan de la petición batch y validamos
    parametersBatch = [self getDataOperation:dataOperation];
    // Si los datos llegan a null y tenemos rtservlet y file id entonces llamamos al servidor para obtener los datos del servdiro intermedio (Es una peticion larga que no se puede pasar la info por url desde la web y se suben los datos al servidor intemedio). No deberia ocurrir nunca ya que se parrsean siempre en el primer controller que se abre de la app ya que al minuto se borran los datos
    if (parametersBatch.data == NULL && parametersBatch.rtservlet != NULL && parametersBatch.fileId != NULL) {
        [self.servletRest loadDataFromRtservlet:[dataOperation objectForKey:PARAMETER_NAME_FILE_ID] rtServlet:[dataOperation objectForKey:PARAMETER_NAME_RTSERVLET] cipherKey:[dataOperation objectForKey:PARAMETER_NAME_CIPHER_KEY]];
    } else {
        [self presign];
    }
}

- (void) presign {
    NSString *errorValidation = [self validateDataOperation:parametersBatch];
    if (errorValidation != nil) {
        // Establecemos el error generico y enviamos la info al servidor
        responseMessage = @"batch_signs_generic_error";
        [self.servletRest storeDataError:errorValidation stServlet:parametersBatch.stservlet cipherKey:parametersBatch.cipherKey docId:parametersBatch.identifier];
    } else {
        [self.bachRest bachPresign:parametersBatch.batchpresignerUrl withJsonData: self.parametersBatch.data withCerts:self.urlSafeCertificateData];
    }
}

- (NSString *)validateDataOperation:(InputParametersBatch *) parameterBatch {
    if(parameterBatch.operation == nil) {
        return @"err-00:= No se ha indicado código de operación";
    }
    if(parameterBatch.data == nil) {
        return @"err-02:= No se han proporcionado los datos de la operación";
    }
    if(parameterBatch.stservlet == nil) {
        return @"err-08:= No se ha proporcionado el Servlet para la comunicación de los datos";
    }
    if(parameterBatch.batchpresignerUrl == nil) {
        return @"err-08:= No se ha proporcionado URL del servicio de prefirma de lotes";
    }
    if(parameterBatch.batchpostsignerUrl == nil) {
        return @"err-08:= No se ha proporcionado URL del servicio de postfirma de lotes";
    }
    NSDictionary *dict = [self parseDataBase64toDictionary:parametersBatch.data];
    if (dict == nil) {
        return @"err-12:= Error en la codificación del base 64";
    } else {
        if ([dict objectForKey:@"algorithm"] == nil) {
            return @"err-10:= No se ha configurado un algoritmo para la firma";
        }
    }
    return nil;
}

- (InputParametersBatch *)getDataOperation:(NSDictionary *) dataOperation {
    InputParametersBatch *parameters = [[InputParametersBatch alloc] init];
    
    if([dataOperation objectForKey:PARAMETER_NAME_OPERATION] != NULL)
        parameters.operation = [[NSString alloc] initWithString:[dataOperation objectForKey:PARAMETER_NAME_OPERATION]];
    
    if([dataOperation objectForKey:PARAMETER_NAME_ID] != NULL)
        parameters.identifier = [[NSString alloc] initWithString:[dataOperation objectForKey:PARAMETER_NAME_ID]];
    
    if([dataOperation objectForKey:PARAMETER_NAME_CIPHER_KEY] != NULL)
        parameters.cipherKey  = [[NSString alloc] initWithString:[dataOperation objectForKey:PARAMETER_NAME_CIPHER_KEY]];
    
    if([dataOperation objectForKey:PARAMETER_NAME_STSERVLET] != NULL)
        parameters.stservlet  = [[NSString alloc] initWithString:[dataOperation objectForKey:PARAMETER_NAME_STSERVLET]];
    
    if([dataOperation objectForKey:PARAMETER_NAME_BATCH_PRESIGNER_URL] != NULL)
        parameters.batchpresignerUrl = [[NSString alloc] initWithString:[dataOperation objectForKey:PARAMETER_NAME_BATCH_PRESIGNER_URL]];
    
    if([dataOperation objectForKey:PARAMETER_NAME_BATCH_POSTSIGNER_URL] != NULL)
        parameters.batchpostsignerUrl = [[NSString alloc] initWithString:[dataOperation objectForKey:PARAMETER_NAME_BATCH_POSTSIGNER_URL]];
    
    if([dataOperation objectForKey:PARAMETER_NAME_PROPERTIES] != NULL)
        parameters.properties  = [[NSString alloc] initWithString:[dataOperation objectForKey:PARAMETER_NAME_PROPERTIES]];
    
    if([dataOperation objectForKey:PARAMETER_NAME_BATCH_JSON] != NULL)
        parameters.jsonbatch = [[NSString alloc] initWithString:[dataOperation objectForKey:PARAMETER_NAME_BATCH_JSON]];
    
    if([dataOperation objectForKey:PARAMETER_NAME_DAT] != NULL)
        parameters.data  = [[NSString alloc] initWithString:[dataOperation objectForKey:PARAMETER_NAME_DAT]];
    
    if([dataOperation objectForKey:PARAMETER_NAME_FILE_ID] != NULL)
        parameters.fileId  = [[NSString alloc] initWithString:[dataOperation objectForKey:PARAMETER_NAME_FILE_ID]];
    
    if([dataOperation objectForKey:PARAMETER_NAME_RTSERVLET] != NULL)
        parameters.rtservlet  = [[NSString alloc] initWithString:[dataOperation objectForKey:PARAMETER_NAME_RTSERVLET]];
    
    return parameters;
}

- (void)didSuccessBachPresign:(NSDictionary *)responseDict{
    
    // Establecemos los datos a enviar a postfirma. Por defecto los mismos que la prefirma, si hay errores es necesario modificarlos
    NSString *dataPostSignBase64 = self.parametersBatch.data;
    
    
    // Obtenemos el algoritmo de los datos que nos llegan
    NSString *algorithm = [self getAlgorithm];
    
    // Recorremos las prefirmas que se han realizado correctamente. Las prefirmas las recibimos en el objeto td
    NSDictionary *presignsOk = [responseDict objectForKey:@"td"];
    if (presignsOk != nil) {
        
        for(NSDictionary *sign in [presignsOk objectForKey:@"signs"]){
            // Obtememos los datos a firmar
            NSDictionary *singInfoDict = [[sign objectForKey:@"signinfo"] firstObject];
            NSMutableDictionary *paramsDict = [singInfoDict objectForKey:@"params"];
            
            NSString *pre = [paramsDict objectForKey:@"PRE"];
            
            // Realizamos la firma
            NSString *pk1 = [self sign:pre withAlgorith:algorithm];
            
            if ([pk1 isEqual: @""]) {
                responseMessage = @"batch_signs_generic_error";
                NSString *error = @"err-14:= Ocurrió un error en la operación de firma";
                [self.servletRest storeDataError:error stServlet:parametersBatch.stservlet cipherKey:parametersBatch.cipherKey docId:parametersBatch.identifier];
            }
            
            // Guardamos en el objeto la firma
            [paramsDict setObject:pk1 forKey:@"PK1"];
            
            // Si el campo NEED_PRE llega a false, debemos eliminar este elemento del json y el elemento PRE antes de enviar a la postfirma
            NSString *needPre = [paramsDict objectForKey:@"NEED_PRE"];
            if (needPre == nil || [needPre isEqualToString: @"false"]) {
                [paramsDict removeObjectForKey: @"PRE"];
                [paramsDict removeObjectForKey: @"NEED_PRE"];
            }
        }
        
        // Actualización de información de lote si llegan errores (campo results). Es necesario elimninar los campos "datareference", "format", "suboperation", "extraparams"
        // de los datos de las firmas que han dado error y añadir el "result" y "description" del error para enviarlo a la posfirnma
        NSArray *presignsErrors = [responseDict objectForKey:@"results"];
        if (presignsErrors != nil) {
            NSDictionary *dataOperation = [self parseDataBase64toDictionary:parametersBatch.data];
            
            for(NSDictionary *signError in presignsErrors) {
                NSString *signId = [signError objectForKey:@"id"];
                NSString *result = [signError objectForKey:@"result"];
                NSString *description = [signError objectForKey:@"description"];
                
                // Buscamos la firma en lso datos que nos llegan y modificamos la informacion.
                for (NSMutableDictionary *singleSign in [dataOperation objectForKey:@"singlesigns"]) {
                    
                    NSString *singleSignId = [singleSign objectForKey:@"id"];
                    if (singleSignId != nil && [singleSignId isEqualToString: signId]) {
                        [singleSign removeObjectForKey:@"datareference"];
                        [singleSign removeObjectForKey:@"format"];
                        [singleSign removeObjectForKey:@"suboperation"];
                        [singleSign removeObjectForKey:@"extraparams"];
                        
                        [singleSign setValue:result forKey:@"result"];
                        [singleSign setValue:description forKey:@"description"];
                        break;
                    }
                }
            }
            
            // Generar el String en base 64 del json
            NSError *error;
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataOperation
                                                               options:NSJSONWritingPrettyPrinted
                                                                 error:&error];
            if (!jsonData) {
                responseMessage = @"batch_signs_generic_error";
                NSString *error = @"err-21:= No se ha podido actualizar las firmas con el error antes de enviar al servicio de postfirma ";
                [self.servletRest storeDataError:error stServlet:parametersBatch.stservlet cipherKey:parametersBatch.cipherKey docId:parametersBatch.identifier];
            } else {
                // Acutalizar el data a enviuar al postsing
                dataPostSignBase64 = [Base64 encode:jsonData urlSafe:true];
            }
        }
        
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:presignsOk
                                                           options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                             error:&error];
        if (!jsonData) {
            responseMessage = @"batch_signs_generic_error";
            NSString *error = @"err-21:= No se ha podido generar el json para enviar al servicio de postfirma ";
            [self.servletRest storeDataError:error stServlet:parametersBatch.stservlet cipherKey:parametersBatch.cipherKey docId:parametersBatch.identifier];
            
        } else {
            //Convertir a base64 el jsonData
            NSString *base64tridata = [Base64 encode:jsonData urlSafe:true];
            [self.bachRest bachPostsign:parametersBatch.batchpostsignerUrl withJsonData:dataPostSignBase64 withCerts:self.urlSafeCertificateData withTriData:base64tridata];
        }
    } else {
        // Todas las firmas han dado error en la prefirma por lo que no es necesario continuar el proceso.
        // Generamos el json a enviar al servidor intermedio a partir de la información del objeto result
        NSMutableDictionary *jsonErrorSigns = [[NSMutableDictionary alloc] init];
        [jsonErrorSigns setValue:[responseDict objectForKey:@"results"] forKey:@"signs"];
        
        // Convertimos el dicionario a Data
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonErrorSigns
                                                           options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                             error:&error];
        if (! jsonData) {
            responseMessage = @"batch_signs_generic_error";
            NSString *error = @"err-21:= No se ha podido generar el json con los errores de todas las firmas";
            [self.servletRest storeDataError:error stServlet:parametersBatch.stservlet cipherKey:parametersBatch.cipherKey docId:parametersBatch.identifier];
        } else {
            // Establecemos el error de que la firna ha ido bien pero con errores
            responseMessage = @"batch_signs_ok_with_signs_error";
            //Enviar al servidor
            [self.servletRest storeData:jsonData certificateBase64:nil stServlet:parametersBatch.stservlet cipherKey:parametersBatch.cipherKey docId:parametersBatch.identifier];
        
        }
    }
    
}

-(NSString *)sign:(NSString *)pre withAlgorith:(NSString *) algorithm {
    
    NSData *data = [Base64 decode:pre urlSafe:true];
    
    if(data.length > 0)
    {
	   CADESSignUtils *signUtils = [[CADESSignUtils alloc] init];
	   NSData *dataSigned = [signUtils signDataWithPrivateKey:&privateKey data:data algorithm:algorithm];
        // Contiene las prefirmas firmadas
        NSString *stringSigned = [Base64 encode:dataSigned];
        
        return stringSigned;
    }else{
        return @"";
    }
}


-(NSDictionary *) parseDataBase64toDictionary:(NSString *)stringData {
    NSData *dataReceived = [Base64 decode:parametersBatch.data urlSafe:true];
    
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:dataReceived
                                                         options:NSJSONReadingMutableContainers
                                                           error:&error];
    if (! dict) {
        NSLog(@"Got an error: %@", error);
        return nil;
    }
    return dict;
}

-(NSString *) getAlgorithm {
    NSDictionary *dict = [self parseDataBase64toDictionary:parametersBatch.data];
    if (dict == nil) {
        return @"";
    } else {
        return [dict objectForKey:@"algorithm"];
    }
}

- (void)didSuccessBachPostsign:(NSDictionary *)responseDict{
    //Leer el dictionary y mirar el resultado, si ha terminado con todo OK se muestra que se
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseDict
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        responseMessage = @"batch_signs_generic_error";
        NSString *errorToSend = @"err-07:= Los datos de postfirma recibidos son inválidos";
        [self.servletRest storeDataError:errorToSend stServlet:parametersBatch.stservlet cipherKey:parametersBatch.cipherKey docId:parametersBatch.identifier];
    } else {
        responseMessage = @"batch_signs_all_ok";
        for(NSDictionary *signDict in [responseDict objectForKey:@"signs"]){
            if (![[signDict objectForKey:@"result"] isEqualToString:@"DONE_AND_SAVED"])
            {
                responseMessage = @"batch_signs_ok_with_signs_error";
                break;
            }
        }
        
        //Convertir a base64 el json y mandarlo como pk1
        [self.servletRest storeData:jsonData certificateBase64:urlSafeCertificateData stServlet:parametersBatch.stservlet cipherKey:parametersBatch.cipherKey docId:parametersBatch.identifier];
    }
}

- (void)didErrorBachPresign:(NSString *)errorMessage{
    responseMessage = @"batch_signs_generic_error";
    [self.servletRest storeDataError:errorMessage stServlet:parametersBatch.stservlet cipherKey:parametersBatch.cipherKey docId:parametersBatch.identifier];
}

- (void)didErrorBachPostsign:(NSString *)errorMessage{
    responseMessage = @"batch_signs_generic_error";
    [self.servletRest storeDataError:errorMessage stServlet:parametersBatch.stservlet cipherKey:parametersBatch.cipherKey docId:parametersBatch.identifier];
}

- (void)didSuccessLoadDataFromServer:(NSDictionary *)responseDict{
    parametersBatch = [self getDataOperation:responseDict];
    [self presign];
}

-(void)didErrorLoadDataFromServer:(NSString *)errorMessage{
    responseMessage = @"batch_signs_generic_error";
    [self.servletRest storeDataError:errorMessage stServlet:parametersBatch.stservlet cipherKey:parametersBatch.cipherKey docId:parametersBatch.identifier];
}

- (void)didSuccessStoreData:(NSString *)response{
    // Si hubo un fallo de todo el listo devolvemos Error, sino Success.
    // LO comprobamos en funcion del mensaje de respuesta establecido
    if ([responseMessage isEqualToString: @"batch_signs_generic_error"]) {
        [self.delegate didErrorBatchSignUseCase:responseMessage];
    } else {
        [self.delegate didSuccessBatchSignUseCase:self.responseMessage];
    }
}

- (void)didErrorStoreData:(NSString *)errorMessage {
    [self.delegate didErrorBatchSignUseCase:@"batch_signs_generic_error"];
}
@end
