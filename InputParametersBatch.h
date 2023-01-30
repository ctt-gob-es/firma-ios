//
//  InputParametersBatch.h
//  Cliente @firma
//
//  Created by Luis Nicieza on 29/7/22.
//  Copyright © 2022 Solid GEAR. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputParametersBatch : NSObject

@property (strong, nonatomic) NSString *operation; // Param op
@property (strong, nonatomic) NSString *identifier; // Param id
@property (strong, nonatomic) NSString *fileId; // Param fileid: Cuando la peticion es muy grande y necesita llamada extra para obtener los datos
@property (strong, nonatomic) NSString *cipherKey; // Param key
@property (strong, nonatomic) NSString *stservlet; // Param stservlet
@property (strong, nonatomic) NSString *rtservlet; // Param rtservlet
@property (strong, nonatomic) NSString *batchpresignerUrl; // Param batchpresigneUrl
@property (strong, nonatomic) NSString *batchpostsignerUrl; // Param batchpostsignerUrl
@property (strong, nonatomic) NSString *properties; // Param properties
@property (strong, nonatomic) NSString *jsonbatch; // Param jsonbatch
@property (strong, nonatomic) NSString *data; // Param dat: Lote JSON en base64

@end

NS_ASSUME_NONNULL_END
