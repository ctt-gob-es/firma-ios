//
//  CADESSignUtils.m
//  Firma_iOS
//
//

#import "CADESSignUtils.h"
#import <resolv.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
#import "CertificateUtils.h"
#import "CADESConstants.h"
#import "CADESOID.h"
#import "Base64Utils.h"
#import "GlobalConstants.h"

@implementation CADESSignUtils

/**
 Método que convierte un "NSDictionary" en formato "properties" de java.
 Es necesario para que el servidor lo pueda interpretar.
 
 parámetros:
 -----------
 dict: Diccionario a convertir.
 
 */
+ (NSString*) dictionary2JavaProperties: (NSDictionary*) dict
{
    
    NSString *dataTransport = @"";
    
    for (id key in dict) {
	   dataTransport = [dataTransport stringByAppendingString:key];
	   dataTransport = [dataTransport stringByAppendingString:@"="];
	   dataTransport = [dataTransport stringByAppendingString:[dict objectForKey:key]];
	   dataTransport = [dataTransport stringByAppendingString:@"\n"];
    }
    dataTransport = [dataTransport stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSData* data = [dataTransport dataUsingEncoding:NSUTF8StringEncoding];
    
    return [Base64Utils encode:data urlSafe:true];
}

/**
 Método que convierte un "properties" de java en "NSDictionary".
 Es necesario para que el cliente lo pueda interpretar.
 
 parámetros:
 -----------
 urlString: Cadena recibida del servidor y que contiene un properties de java.
 
 */
+(NSDictionary*) javaProperties2Dictionary:(NSString*) urlString {
    urlString = [urlString stringByReplacingOccurrencesOfString:@"\r" withString:@""] ;
    NSArray *listItems = [urlString componentsSeparatedByString:@"\n"];
    NSMutableDictionary *keyValues = [NSMutableDictionary dictionaryWithCapacity:listItems.count];
    for (NSString *item in listItems) {
	   @try
	   {
		  NSRange range = [item rangeOfString:@"="];
		  if(range.length > 0){
			 NSString *parte1 = [item substringToIndex:range.location];
			 NSString *parte2 = [item substringFromIndex:range.location+1];//le sumamos 1 para que no coja el "="
			 [keyValues setObject:parte2 forKey:parte1];
		  }
	   }
	   @catch(NSException * exception) {
		  continue;
	   }
	   
    }
    return keyValues;
}

/**
 Método que comprueba si un algoritmo es válido.
 parámetros:
 -----------
 algorithm: Algoritmo utilizado para el cifrado.
 */
+(bool)isValidAlgorithm:(NSString *)algorithm {
    bool isValid = false;
    NSString *uppercaseAlgorithm = [algorithm uppercaseString];
    
    if ([uppercaseAlgorithm containsString:@"SHA1"] ||
	   [uppercaseAlgorithm containsString:@"SHA256"] ||
	   [uppercaseAlgorithm containsString:@"SHA384"] ||
	   [uppercaseAlgorithm containsString:@"SHA512"]) {
	   isValid = true;
    }
    
    return isValid;
}

/**
 Método que transforma la url introducida en su correspondiente diccionario usando el par clave valor.
 parámetros:
 -----------
 urlString: Url recibida y que necesita ser transformada a un diccionario.
 
 */
+(NSDictionary*) parseUrl:(NSString*) urlString {
    urlString =  [self decodeFromPercentEscapeString:urlString];
    NSURL * url = [NSURL URLWithString:urlString];
    NSArray *listItems = [[url query] componentsSeparatedByString:@"&"];
    NSMutableDictionary *keyValues = [NSMutableDictionary dictionaryWithCapacity:listItems.count];
    
    for (NSString *item in listItems) {
	   NSRange range = [item rangeOfString:@"="];
	   
	   if (range.location != NSNotFound) {
		  NSString *parte1 = [item substringToIndex:range.location];
		  NSString *parte2 = [item substringFromIndex:range.location + 1];
		  NSString *parte2Decode = [parte2 stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
		  
		  if (![parte1 isEqualToString:PARAMETER_NAME_OPERATION]) {
			 [keyValues setObject:parte2Decode forKey:parte1];
		  }
	   }
    }
    
    //if([keyValues objectForKey:PARAMETER_NAME_OPERATION]!=NULL)
    if([url host] != NULL)
	  [keyValues setObject:[url host] forKey:PARAMETER_NAME_OPERATION];
    return keyValues;
}

// Decode a percent escape encoded string.
+ (NSString*) decodeFromPercentEscapeString:(NSString *) string {
    return (NSString *) CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapes(NULL,(CFStringRef) string, CFSTR("")));
}

/**
 Método que firma los datos con una clave privada `SecKeyRef` utilizando el algoritmo especificado.
 parámetros:
 -----------
 privateKey: La referencia de la clave privada utilizada para firmar los datos.
 data: Los datos que se van a firmar.
 
 devuelve:
 --------
 Un objeto NSData que contiene la firma generada. Devuelve `nil` si ocurre un error.
 */

- (NSData *)signDataWithPrivateKey:(SecKeyRef *)privateKey data:(NSData *)data algorithm:(NSString *)algorithm {
    CFErrorRef error = NULL;
    SecKeyAlgorithm setKeyAlgorithm;
    
    NSArray *listItems = [algorithm componentsSeparatedByString:WITH];
    
    if([listItems count] > 0){
	   NSString *alg = [listItems objectAtIndex:0];
	   setKeyAlgorithm = [[CertificateUtils sharedWrapper] getAlgorithmByCertificate:*privateKey alg:alg];
    }
    
    NSData *signature = (__bridge_transfer NSData *)SecKeyCreateSignature(*privateKey,
														    setKeyAlgorithm,
														    (__bridge CFDataRef)data,
														    &error);
    if (!signature) {
	   NSError *err = CFBridgingRelease(error);
	   NSLog(@"Error al firmar los datos: %@", err);
    } else {
	   NSLog(@"Éxito al firmar los datos con el algoritmo: %@", setKeyAlgorithm);
    }
    
    return signature;
}

+ (NSString *) getModifiedAlgorithmByCertificate:(SecKeyRef)privateKey alg:(NSString *)algorithm {
    NSArray *listItems = [algorithm componentsSeparatedByString:WITH];
    if([listItems count] > 0){
	   NSString *alg = [listItems objectAtIndex:0];
	   
	   CFDictionaryRef attributes = SecKeyCopyAttributes(privateKey);
	   if (!attributes) {
		  return nil;
	   }
	   
	   NSString *keyType = ( NSString *)CFDictionaryGetValue(attributes, kSecAttrKeyType);
	   CFRelease(attributes);
	   
	   if ([keyType isEqualToString:(__bridge NSString *)kSecAttrKeyTypeRSA]) {
		  return [alg stringByAppendingString:@"withRSA"];
	   } else if ([keyType isEqualToString:(__bridge NSString *)kSecAttrKeyTypeECSECPrimeRandom]) {
		  return [alg stringByAppendingString:@"withECDSA"];
	   } else {
		  return NULL;
	   }
    }
}

/**
 Método que crea una firma de tipo pkcs1 a partir del algoritmo especificado.
 parámetros:
 -----------
 algorithm: Algoritmo utilizado para el cifrado.
 privateKey: Clave privada necesaria para realizar la firma.
 dataPreSign: datos a firmar.
 */

+(NSData*) signPkcs1:(NSString*) algorithm privateKey:(SecKeyRef*)privateKey data:(NSData*)dataPreSign{
    //Con los datos de la prefirma decodificados, se pasa a realizar la firma pkcs1.
    //    CertificateUtils *certUtils = [[CertificateUtils alloc] init];
    //    [certUtils setPrivateKey:*privateKey];
    NSArray *listItems = [algorithm componentsSeparatedByString:WITH];
    if([listItems count] > 0){
	   NSString *alg = [listItems objectAtIndex:0];
	   if ([[alg uppercaseString] isEqualToString:@"SHA1"] ) {
		  return [[CertificateUtils sharedWrapper] getSignatureBytesSHA1:dataPreSign];
	   }
	   else if ([[alg uppercaseString] isEqualToString:@"SHA256"]){
		  return [[CertificateUtils sharedWrapper] getSignatureBytesSHA256:dataPreSign];
	   }
	   else if ([[alg uppercaseString] isEqualToString:@"SHA384"]){
		  return [[CertificateUtils sharedWrapper] getSignatureBytesSHA384:dataPreSign];
	   }
	   else if ([[alg uppercaseString] isEqualToString:@"SHA512"]){
		  return [[CertificateUtils sharedWrapper] getSignatureBytesSHA512:dataPreSign];
	   }
	   else{
		  return NULL;
	   }
    }
    else{
	   return NULL;
    }
}

/**
 Método que crea un hash a partir del algoritmo especificado.
 parámetros:
 -----------
 algorithm: Algoritmo utilizado para el cifrado.
 dataPreSign: datos a calcular el hash.
 */
+(NSData*) hashData:(NSString*) algorithm data:(NSData*)dataPreSign{
    //Con los datos de la prefirma decodificados, se pasa a realizar la firma pkcs1.
    CertificateUtils *certUtils = [[CertificateUtils alloc] init];
    NSArray *listItems = [algorithm componentsSeparatedByString:WITH];
    if([listItems count] >0){
	   NSString *alg = [listItems objectAtIndex:0];
	   if ([[alg uppercaseString] isEqualToString:@"SHA1"] ) {
		  return [certUtils getHashBytesSHA1:dataPreSign];
	   }
	   else if ([[alg uppercaseString] isEqualToString:@"SHA256"]){
		  return [certUtils getHashBytesSHA256:dataPreSign];
	   }
	   else if ([[alg uppercaseString] isEqualToString:@"SHA384"]){
		  return [certUtils getHashBytesSHA384:dataPreSign];
	   }
	   else if ([[alg uppercaseString] isEqualToString:@"SHA512"]){
		  return [certUtils getHashBytesSHA512:dataPreSign];
	   }
	   else{
		  return NULL;
	   }
    }
    else{
	   return NULL;
    }
}


/**
 Método que obtiene los datos de un almacen de claves pkcs12.
 
 parámetros:
 -----------
 inPKCS12Data: Almacen de claves
 pass:         Contraseña del almacen de claves
 outIdentity:  Identidad
 outTrust:     Identidad
 
 resultado:
 ----------
 OSStatus : codigo de error.
 
 */
+ (OSStatus) extractIdentityAndTrust:(CFDataRef) inPKCS12Data :(NSString *)pass :(SecIdentityRef *)outIdentity :(SecTrustRef *)outTrust {
    OSStatus securityError = errSecSuccess;
    
    CFStringRef password = (__bridge CFStringRef)pass;
    const void *keys[] = {kSecImportExportPassphrase};
    const void *values[] = {password};
    
    CFDictionaryRef optionsDictionary = CFDictionaryCreate(NULL, keys, values, 1, NULL, NULL);
    
    CFArrayRef items = CFArrayCreate(NULL, 0, 0, NULL);
    securityError = SecPKCS12Import(inPKCS12Data, optionsDictionary, &items);
    
    if (securityError == 0) {
	   CFDictionaryRef myIdentityAndTrust = CFArrayGetValueAtIndex(items, 0);
	   const void *tempIdentity = NULL;
	   tempIdentity = CFDictionaryGetValue (myIdentityAndTrust, kSecImportItemIdentity);
	   *outIdentity = (SecIdentityRef)tempIdentity;
	   const void *tempTrust = NULL;
	   tempTrust = CFDictionaryGetValue(myIdentityAndTrust, kSecImportItemTrust);
	   *outTrust = (SecTrustRef)tempTrust;
    }
    
    if (optionsDictionary) {
	   CFRelease(optionsDictionary);
    }
    
    return securityError;
}

/**
 Método que obtiene el OID del algoritmo de firma.
 
 parámetros:
 -----------
 algorithm: algoritmo introducido por el usuario
 
 resultado:
 ----------
 char* : OID del algoritmo de firma.
 
 */
+(char*)getAlgorithmOID:(NSString*)algorithm {
    NSArray *listItems = [algorithm componentsSeparatedByString:WITH];
    if([listItems count] > 0){
	   NSString *alg = [listItems objectAtIndex:0];
	   if ([[alg uppercaseString] isEqualToString:@"SHA1"] ) {
		  return SHA1_OID;
	   }
	   else if ([[alg uppercaseString] isEqualToString:@"SHA256"]){
		  return SHA256_OID;
	   }
	   else if ([[alg uppercaseString] isEqualToString:@"SHA384"]){
		  return SHA384_OID;
	   }
	   else if ([[alg uppercaseString] isEqualToString:@"SHA512"]){
		  return SHA512_OID;
	   }
	   else{
		  return NULL;
	   }
    }
    else{
	   return NULL;
    }
    
}

/**
 Método que obtiene el OID del hash del algoritmo de firma.
 
 parámetros:
 -----------
 algorithm: algoritmo introducido por el usuario
 
 resultado:
 ----------
 char* : OID del hash del algoritmo de firma.
 
 */
+(char*)getHashAlgorithmOID:(NSString*)algorithm {
    
    if ([[algorithm uppercaseString] isEqualToString:@"SHA1"] ) {
	   return SHA1_OID;
    }
    else if ([[algorithm uppercaseString] isEqualToString:@"SHA256"]){
	   return SHA256_OID;
    }
    else if ([[algorithm uppercaseString] isEqualToString:@"SHA384"]){
	   return SHA384_OID;
    }
    else if ([[algorithm uppercaseString] isEqualToString:@"SHA512"]){
	   return SHA512_OID;
    }
    else{
	   return NULL;
    }
    
}

-(NSData*) getDataFromIOSByteArray: (IOSByteArray *) decodedSignature {
    NSData *decodedSignatureData = [NSData dataWithBytes:[decodedSignature buffer] length:[decodedSignature length]];
    return decodedSignatureData;
}

@end
