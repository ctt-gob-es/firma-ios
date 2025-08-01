//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/card/gide/smartcafe/SmartCafePrivateKeyReference.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_EsGobJmulticardCardGideSmartcafeSmartCafePrivateKeyReference")
#ifdef RESTRICT_EsGobJmulticardCardGideSmartcafeSmartCafePrivateKeyReference
#define INCLUDE_ALL_EsGobJmulticardCardGideSmartcafeSmartCafePrivateKeyReference 0
#else
#define INCLUDE_ALL_EsGobJmulticardCardGideSmartcafeSmartCafePrivateKeyReference 1
#endif
#undef RESTRICT_EsGobJmulticardCardGideSmartcafeSmartCafePrivateKeyReference

#if !defined (EsGobJmulticardCardGideSmartcafeSmartCafePrivateKeyReference_) && (INCLUDE_ALL_EsGobJmulticardCardGideSmartcafeSmartCafePrivateKeyReference || defined(INCLUDE_EsGobJmulticardCardGideSmartcafeSmartCafePrivateKeyReference))
#define EsGobJmulticardCardGideSmartcafeSmartCafePrivateKeyReference_

#define RESTRICT_EsGobJmulticardCardPrivateKeyReference 1
#define INCLUDE_EsGobJmulticardCardPrivateKeyReference 1
#include "es/gob/jmulticard/card/PrivateKeyReference.h"

@class JavaLangInteger;

/*!
 @brief Clave privada de una tarjeta G&amp;D con Applet PKCS#15.
 La clase no contiene la clave privada en s&iacute;, sino una referencia a ella.
 @author Tom&aacute;s Garc&iacute;a-Mer&aacute;s.
 */
@interface EsGobJmulticardCardGideSmartcafeSmartCafePrivateKeyReference : NSObject < EsGobJmulticardCardPrivateKeyReference >

#pragma mark Public

/*!
 @brief Construye una clave privada de una tarjeta G&amp;D con
  Applet PKCS#15 a partir de su ordinal de referencia
 @param ordinal Ordinal de referencia de la clave.
 */
- (instancetype)initWithJavaLangInteger:(JavaLangInteger *)ordinal;

/*!
 @brief Obtiene el identificador (ordinal) de la clave.
 @return Identificador (ordinal) de la clave.
 */
- (jint)getKeyOrdinal;

- (NSString *)description;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(EsGobJmulticardCardGideSmartcafeSmartCafePrivateKeyReference)

FOUNDATION_EXPORT void EsGobJmulticardCardGideSmartcafeSmartCafePrivateKeyReference_initWithJavaLangInteger_(EsGobJmulticardCardGideSmartcafeSmartCafePrivateKeyReference *self, JavaLangInteger *ordinal);

FOUNDATION_EXPORT EsGobJmulticardCardGideSmartcafeSmartCafePrivateKeyReference *new_EsGobJmulticardCardGideSmartcafeSmartCafePrivateKeyReference_initWithJavaLangInteger_(JavaLangInteger *ordinal) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT EsGobJmulticardCardGideSmartcafeSmartCafePrivateKeyReference *create_EsGobJmulticardCardGideSmartcafeSmartCafePrivateKeyReference_initWithJavaLangInteger_(JavaLangInteger *ordinal);

J2OBJC_TYPE_LITERAL_HEADER(EsGobJmulticardCardGideSmartcafeSmartCafePrivateKeyReference)

#endif

#pragma pop_macro("INCLUDE_ALL_EsGobJmulticardCardGideSmartcafeSmartCafePrivateKeyReference")
