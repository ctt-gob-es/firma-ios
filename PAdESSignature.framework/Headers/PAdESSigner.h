//
//  PAdESSignatureUtils.h
//  PAdESSignature
//
//  Created by Desarrollo Abamobile on 10/12/24.
//

#import <Foundation/Foundation.h>
#import <PAdESSignature/HashAlgorithmType.h>
#import <PAdESSignature/PresignResponse.h>
#import <PAdESSignature/SignResponse.h>

@class EsGobAfirmaIosPresignResult;
@class IOSByteArray;

@interface PAdESSigner : NSObject

/**
 *  Realiza la operacion de firma completa sobre el data de un PDF (Prefrima, firma y posfirma)
 *
 *  @param pdfData Objeto NSData con el PDF a firmar
 *  @param hashAlgorithmType El algoritmo de hash (SHA1, SHA256, SHA384 o SHA512.).
 *  @param privateKey La clave privada del certificado con el que se desea firmar
 *  @param certificate El certificado con el que se desea firmar
 *  @param extraParams Dicionario con parrametros extras para la firma (firmavisible, ofuscación, mensaje a mostrsar en la firma visible, coordenadas de firma, ...)
 *  @return Resultado de la operacion
 */
- (SignResponse *)signPdfWithData:(NSData *)pdfData
      hashAlgorithmType:(HashAlgorithmType)hashAlgorithmType
			 privateKey:(SecKeyRef)privateKey
			certificate:(SecCertificateRef)certificate
			extraParams:(NSDictionary *)extraParams;

/**
 *  Realiza la operacion de prefirma sobre el data de un PDF
 *
 *  @param pdfData Objeto NSData con el PDF
 *  @param hashAlgorithmType El algoritmo de hash (SHA1, SHA256, SHA384 o SHA512.).
 *  @param certificate El certificado con el que se desea hacer la prefirma
 *  @param extraParams Dicionario con parrametros extras para la prefirma (firmavisible, ofuscación, mensaje a mostrsar en la firma visible, coordenadas de firma, ...)
 *  @return Resultado de la prefirma
 */
- (PresignResponse *)presignPdfWithData:(NSData *)pdfData
                          hashAlgorithmType:(HashAlgorithmType)hashAlgorithmType
                                certificate:(SecCertificateRef)certificate
                                extraParams:(NSDictionary *)extraParams;

/**
 *  Realiza la operacion de posfirma sobre el data de un PDF.
 *  Para llamar a la posfirma es necesario  llamar previamente a la prefirma y que haya devuelto correctamente, en caso contrario dará error.
 *
 *  @param pdfData Objeto NSData con el PDF
 *  @param hashAlgorithmType El algoritmo de hash (SHA1, SHA256, SHA384 o SHA512.).
 *  @param certificate El certificado con el que se desea hacer la posfirma
 *  @param extraParams Dicionario con parrametros extras para la posfirma (firmavisible, ofuscación, mensaje a mostrsar en la firma visible, coordenadas de firma, ...)
 *  @param pkcs1 La firma PKCS1 del NSData del PDF
 *  @return Resultado de la posfirma
 */
- (SignResponse *)postsignPdfWithData:(NSData *)pdfData
                            hashAlgorithmType:(HashAlgorithmType)hashAlgorithmType
                                  certificate:(SecCertificateRef)certificate
                                  extraParams:(NSDictionary *)extraParams
                                        pkcs1:(NSData *)pkcs1;

- (NSString *) getSignAlgorithm:(HashAlgorithmType)hashAlgorithmType
                withCertificate:(SecCertificateRef)certificate;

@end
