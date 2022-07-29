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

@implementation BatchSignUseCase

NSString *operation;

InputParametersBatch *parametersBatch;

- (void)signBatch:(NSDictionary *) dataOperation {
    // Obtenemos los datos que nos llegan de la petición batch y validamos
    parametersBatch = [self getDataOperation:dataOperation];
    
    // LLamamos al servicio de prefirma
    
    
    
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

@end
