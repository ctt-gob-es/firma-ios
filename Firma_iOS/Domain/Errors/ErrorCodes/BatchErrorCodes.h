//
//  BatchErrorCode.h
//  Firma_iOS
//
//  Created by Desarrollo Abamobile on 14/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

// BatchErrorCodes.h

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BatchErrorCode) {
    BatchErrorCodeInvalidParamsPreSign = 800001,         // Parámetros enviados al servicio de prefirma no eran válidos
    BatchErrorCodeInvalidParamsPostSign = 800002,        // Parámetros enviados al servicio de postfirma no eran válidos
    BatchErrorCodeCommunicationError = 800003,           // Error de comunicación con el servicio
    BatchErrorCodePreSignatureError = 800004,            // Datos de prefirma inválidos
    BatchErrorCodePostSignatureError = 800005,           // Datos de postfirma inválidos
    BatchErrorCodeInvalidPresignUrl = 800006,            // URL de servicio de prefirma no válida
    BatchErrorCodeInvalidPostsignUrl = 800007,           // URL de servicio de postfirma no válida
    BatchErrorCodeInvalidDataOnSave = 800008,            // Datos recibidos al guardar en el servlet son inválidos
    BatchErrorCodeInvalidSaveServletUrl = 800009,        // Ruta del servlet para guardar datos no es válida
    BatchErrorCodeInvalidRetrieveServletUrl = 800010,    // Ruta del servlet para obtener datos no es válida
    BatchErrorCodeUnknownServerError = 800011,           // Error desconocido en el servidor
    BatchErrorCodeInvalidCertificate = 800012,           // Datos de certificado inválidos
    BatchErrorCodeMissingSignatureAlgorithm = 800013,    // Falta el algoritmo de firma
    BatchErrorCodeUnsupportedSignatureAlgorithm = 800014 // Algoritmo de firma no soportado
};

NS_ASSUME_NONNULL_BEGIN

@interface BatchErrorGenerator : NSObject

+ (NSString *)stringFromErrorCode:(BatchErrorCode)code;
+ (NSString *)getMessageForCode:(BatchErrorCode)code;

@end

NS_ASSUME_NONNULL_END
