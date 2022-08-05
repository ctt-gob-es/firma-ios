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
    if([dataOperation objectForKey:PARAMETER_NAME_RTSERVLET] != NULL && [dataOperation objectForKey:PARAMETER_NAME_FILE_ID] != NULL && [dataOperation objectForKey:PARAMETER_NAME_CIPHER_KEY] != NULL){
        [self.servletRest loadDataFromRtservlet:[dataOperation objectForKey:PARAMETER_NAME_FILE_ID] rtServlet:[dataOperation objectForKey:PARAMETER_NAME_RTSERVLET] cipherKey:[dataOperation objectForKey:PARAMETER_NAME_CIPHER_KEY]];
    }else{
        [self.bachRest bachPresign:parametersBatch.batchpresignerUrl :self.parametersBatch.data :self.urlSafeCertificateData];
    }
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
    for(NSDictionary *dict in [responseDict objectForKey:@"signs"]){
        //Coger el primer signinfo
        //Para el primero coger el params y buscar el pre
        //decodificar el parameterBatch.data(base64) de data a json string
        NSDictionary *singInfoDict = [[dict objectForKey:@"signinfo"] firstObject];
        NSMutableDictionary *paramsDict = [[singInfoDict objectForKey:@"params"] firstObject];
        
        NSString *pre = [paramsDict objectForKey:@"PRE"];
        
        NSString *pk1 = [self sign:pre];
        [paramsDict setObject:pk1 forKey:@"PK1"];
    }
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseDict
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
        [self.delegate didErrorBatchSignUseCase:error.localizedDescription];
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSString *base64tridata = [Base64 encode:jsonData urlSafe:true];
        //Convertir a base64 el json y mandarlo como pk1
        [self.bachRest bachPostsign:parametersBatch.batchpostsignerUrl :self.parametersBatch.data :self.urlSafeCertificateData :base64tridata];
    }
}

-(NSString *)sign:(NSString *)pre{
    NSString *algorithm = [self getAlgorithm];
    NSData *data = [Base64 decode:pre urlSafe:true];
    
    if(data.length > 0)
    {
        //Con los datos de la prefirma decodificados, se procede a realizar la firma pkcs1.
        NSData *dataSigned = [CADESSignUtils signPkcs1: algorithm privateKey: &privateKey data: data];
        
        // Contiene las prefirmas firmadas
        NSString *stringSigned = [Base64 encode:dataSigned];
        
        return stringSigned;
    }else{
        return @"";
    }
}

-(NSString *)getAlgorithm{
    NSData *dataReceived = [Base64 decode:parametersBatch.data urlSafe:true];
    
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:dataReceived
                                                         options:NSJSONReadingMutableContainers
                                                           error:&error];
    if (! dict) {
        NSLog(@"Got an error: %@", error);
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
        NSLog(@"Got an error: %@", error);
        [self.delegate didErrorBatchSignUseCase:error.localizedDescription];
    } else {
        responseMessage = @"batch_signs_all_ok";
        for(NSDictionary *signDict in [responseDict objectForKey:@"signs"]){
            if (![[signDict objectForKey:@"result"] isEqualToString:@"DONE_AND_SAVED"])
            {
                responseMessage = @"batch_signs_ok_with_signs_error".localized;
                break;
            }
        }
        
        NSString *base64jsonResponse = [Base64 encode:jsonData urlSafe:true];
        //Convertir a base64 el json y mandarlo como pk1
        [self.servletRest storeData:base64jsonResponse stServlet:parametersBatch.stservlet cipherKey:parametersBatch.cipherKey docId:parametersBatch.identifier];
    }
}

- (void)didErrorBachPresign:(NSString *)errorMessage{
    responseMessage = @"batch_signs_generic_error".localized;
    [self.delegate didErrorBatchSignUseCase:responseMessage];
}

- (void)didErrorBachPostsign:(NSString *)errorMessage{
    responseMessage = @"batch_signs_generic_error".localized;
    [self.delegate didErrorBatchSignUseCase:responseMessage];
}

- (void)didSuccessLoadDataFromServer:(NSDictionary *)responseDict{
    parametersBatch = [self getDataOperation:responseDict];
    [self.bachRest bachPresign:parametersBatch.batchpresignerUrl :self.parametersBatch.data :self.urlSafeCertificateData];
}

-(void)didErrorLoadDataFromServer:(NSString *)errorMessage{
    responseMessage = @"batch_signs_generic_error".localized;
    [self.delegate didErrorBatchSignUseCase:responseMessage];
}

- (void)didSuccessStoreData:(NSString *)response{
    [self.delegate didSuccessBatchSignUseCase:self.responseMessage];
}

- (void)didErrorStoreData:(NSString *)errorMessage{
    responseMessage = @"batch_signs_generic_error".localized;
    [self.delegate didErrorBatchSignUseCase:responseMessage];
}
@end
