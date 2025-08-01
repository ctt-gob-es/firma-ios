//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/card/dnie/DnieCertParseUtil.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_EsGobJmulticardCardDnieDnieCertParseUtil")
#ifdef RESTRICT_EsGobJmulticardCardDnieDnieCertParseUtil
#define INCLUDE_ALL_EsGobJmulticardCardDnieDnieCertParseUtil 0
#else
#define INCLUDE_ALL_EsGobJmulticardCardDnieDnieCertParseUtil 1
#endif
#undef RESTRICT_EsGobJmulticardCardDnieDnieCertParseUtil

#if !defined (EsGobJmulticardCardDnieDnieCertParseUtil_) && (INCLUDE_ALL_EsGobJmulticardCardDnieDnieCertParseUtil || defined(INCLUDE_EsGobJmulticardCardDnieDnieCertParseUtil))
#define EsGobJmulticardCardDnieDnieCertParseUtil_

@class JavaSecurityCertX509Certificate;

/*!
 @brief Utilidad para el an&aacute;lisis de los campos personales del certificado DNIe.
 @author Tom&aacute;s Garc&iacute;a-Mer&aacute;s.
 */
@interface EsGobJmulticardCardDnieDnieCertParseUtil : NSObject

#pragma mark Public

/*!
 @brief Construye la utilidad para el an&aacute;lisis de los campos personales del certificado DNIe.
 @param c Certificado de DNIe.
 */
- (instancetype)initWithJavaSecurityCertX509Certificate:(JavaSecurityCertX509Certificate *)c;

/*!
 @brief Obtiene el nombre del titular del DNIe.
 @return Nombre del titular del DNIe.
 */
- (NSString *)getName;

/*!
 @brief Obtiene el n&uacute;mero del DNIe.
 @return N&uacute;mero del DNIe.
 */
- (NSString *)getNumber;

/*!
 @brief Obtiene el primer apellido del titular del DNIe.
 @return Primer apellido del titular del DNIe.
 */
- (NSString *)getSurname1;

/*!
 @brief Obtiene el segundo apellido del titular del DNIe.
 @return Segundo apellido del titular del DNIe.
 */
- (NSString *)getSurname2;

- (NSString *)description;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(EsGobJmulticardCardDnieDnieCertParseUtil)

FOUNDATION_EXPORT void EsGobJmulticardCardDnieDnieCertParseUtil_initWithJavaSecurityCertX509Certificate_(EsGobJmulticardCardDnieDnieCertParseUtil *self, JavaSecurityCertX509Certificate *c);

FOUNDATION_EXPORT EsGobJmulticardCardDnieDnieCertParseUtil *new_EsGobJmulticardCardDnieDnieCertParseUtil_initWithJavaSecurityCertX509Certificate_(JavaSecurityCertX509Certificate *c) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT EsGobJmulticardCardDnieDnieCertParseUtil *create_EsGobJmulticardCardDnieDnieCertParseUtil_initWithJavaSecurityCertX509Certificate_(JavaSecurityCertX509Certificate *c);

J2OBJC_TYPE_LITERAL_HEADER(EsGobJmulticardCardDnieDnieCertParseUtil)

#endif

#pragma pop_macro("INCLUDE_ALL_EsGobJmulticardCardDnieDnieCertParseUtil")
