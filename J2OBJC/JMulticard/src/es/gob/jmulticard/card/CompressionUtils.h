//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/card/CompressionUtils.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_EsGobJmulticardCardCompressionUtils")
#ifdef RESTRICT_EsGobJmulticardCardCompressionUtils
#define INCLUDE_ALL_EsGobJmulticardCardCompressionUtils 0
#else
#define INCLUDE_ALL_EsGobJmulticardCardCompressionUtils 1
#endif
#undef RESTRICT_EsGobJmulticardCardCompressionUtils

#if !defined (EsGobJmulticardCardCompressionUtils_) && (INCLUDE_ALL_EsGobJmulticardCardCompressionUtils || defined(INCLUDE_EsGobJmulticardCardCompressionUtils))
#define EsGobJmulticardCardCompressionUtils_

@class EsGobJmulticardCryptoHelper;
@class IOSByteArray;
@class JavaSecurityCertX509Certificate;

/*!
 @brief Utilidades de compresi&oacute;n de certificados seg&uacute;n uso com&uacute;n en
  tarjetas FNMT.
 @author Tom&aacute;s Garc&iacute;a-Mer&aacute;s.
 */
@interface EsGobJmulticardCardCompressionUtils : NSObject

#pragma mark Public

/*!
 @brief Obtiene un certificado a partir de unos datos que pueden ser, o bien el propio certificado
  X&#46;509 o la codificaci&oacute;n de este comprmida seg&uacute;n esquema FNMT.
 De utilidad en todas las tarjetas FNMT-RCM, incluyendo DNIe.
 @param data Datos del certificado, que pueden estar comprimidos o no.
 @param cryptoHelper Utilidad que permita la generaci &oacute; n de certificaddos.
 @return Certificado X&#46;509.
 @throw IOExceptionSi no pueden leerse los datos.
 @throw CertificateExceptionSi los datos no son, ni comprimidos ni descomprimidos, un
                               certificado X&#46;509.
 */
+ (JavaSecurityCertX509Certificate *)getCertificateFromCompressedOrNotDataWithByteArray:(IOSByteArray *)data
                                                        withEsGobJmulticardCryptoHelper:(EsGobJmulticardCryptoHelper *)cryptoHelper;

@end

J2OBJC_EMPTY_STATIC_INIT(EsGobJmulticardCardCompressionUtils)

FOUNDATION_EXPORT JavaSecurityCertX509Certificate *EsGobJmulticardCardCompressionUtils_getCertificateFromCompressedOrNotDataWithByteArray_withEsGobJmulticardCryptoHelper_(IOSByteArray *data, EsGobJmulticardCryptoHelper *cryptoHelper);

J2OBJC_TYPE_LITERAL_HEADER(EsGobJmulticardCardCompressionUtils)

#endif

#pragma pop_macro("INCLUDE_ALL_EsGobJmulticardCardCompressionUtils")
