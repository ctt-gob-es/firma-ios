//
//  BatchErrorCodes.m
//  Autofirma
//
//  Created by Desarrollo Abamobile on 14/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BatchErrorCodes.h"

@implementation BatchErrorGenerator

+ (NSString *)stringFromErrorCode:(BatchErrorCode)code {
    return [NSString stringWithFormat:@"%ld", (long)code];
}

+ (NSString *)getMessageForCode:(BatchErrorCode)code {
    switch (code) {
	   case BatchErrorCodeInvalidParamsPreSign:
		  return @"Los parámetros enviados al servicio de prefirma no eran válidos.";
	   case BatchErrorCodeInvalidParamsPostSign:
		  return @"Los parámetros enviados al servicio de postfirma no eran válidos.";
	   case BatchErrorCodeCommunicationError:
		  return @"Error de comunicación con el servicio.";
	   case BatchErrorCodePreSignatureError:
		  return @"Los datos de prefirma recibidos son inválidos.";
	   case BatchErrorCodePostSignatureError:
		  return @"Los datos de postfirma recibidos son inválidos.";
	   case BatchErrorCodeInvalidPresignUrl:
		  return @"La URL del servicio de prefirma de lotes no es válida.";
	   case BatchErrorCodeInvalidPostsignUrl:
		  return @"La URL del servicio de postfirma de lotes no es válida.";
	   case BatchErrorCodeInvalidDataOnSave:
		  return @"Los datos recibidos al guardar en el servlet son inválidos.";
	   case BatchErrorCodeInvalidSaveServletUrl:
		  return @"La ruta del Servlet para guardar datos es inválida.";
	   case BatchErrorCodeInvalidRetrieveServletUrl:
		  return @"La ruta del Servlet para obtener datos es inválida.";
	   case BatchErrorCodeUnknownServerError:
		  return @"Error desconocido en el servidor.";
	   case BatchErrorCodeInvalidCertificate:
		  return @"Los datos del certificado proporcionado son inválidos.";
	   case BatchErrorCodeMissingSignatureAlgorithm:
		  return @"Falta el algoritmo de firma.";
	   case BatchErrorCodeUnsupportedSignatureAlgorithm:
		  return @"Algoritmo de firma no soportado.";
	   default:
		  return @"Error desconocido.";
    }
}

@end
