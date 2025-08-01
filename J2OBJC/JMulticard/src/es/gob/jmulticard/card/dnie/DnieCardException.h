//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/card/dnie/DnieCardException.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_EsGobJmulticardCardDnieDnieCardException")
#ifdef RESTRICT_EsGobJmulticardCardDnieDnieCardException
#define INCLUDE_ALL_EsGobJmulticardCardDnieDnieCardException 0
#else
#define INCLUDE_ALL_EsGobJmulticardCardDnieDnieCardException 1
#endif
#undef RESTRICT_EsGobJmulticardCardDnieDnieCardException

#if !defined (EsGobJmulticardCardDnieDnieCardException_) && (INCLUDE_ALL_EsGobJmulticardCardDnieDnieCardException || defined(INCLUDE_EsGobJmulticardCardDnieDnieCardException))
#define EsGobJmulticardCardDnieDnieCardException_

#define RESTRICT_EsGobJmulticardCardCryptoCardException 1
#define INCLUDE_EsGobJmulticardCardCryptoCardException 1
#include "es/gob/jmulticard/card/CryptoCardException.h"

@class EsGobJmulticardApduStatusWord;
@class JavaLangThrowable;

/*!
 @brief Excepci&oacute;n gen&eacute;rica en tarjetas ISO 7816-4.
 @author Tom&aacute;s Garc&iacute;a-Mer&aacute;s.
 */
@interface EsGobJmulticardCardDnieDnieCardException : EsGobJmulticardCardCryptoCardException

#pragma mark Public

/*!
 @brief Construye la excepci&oacute;n.
 @param desc Descripci &oacute; n del problema.
 @param retCode C &oacute; digo devuelto por la tarjeta.
 */
- (instancetype)initWithNSString:(NSString *)desc
withEsGobJmulticardApduStatusWord:(EsGobJmulticardApduStatusWord *)retCode;

/*!
 @brief Construye la excepci&oacute;n.
 @param desc Descripci &oacute; n del problema.
 @param t Problema que origino la excepci &oacute; n.
 */
- (instancetype)initWithNSString:(NSString *)desc
           withJavaLangThrowable:(JavaLangThrowable *)t;

/*!
 @brief Obtiene el c&oacute;digo de finalizaci&oacute;n (en modo de palabra de
  estado) que caus&oacute; la excepci&oacute;n.
 @return C&oacute;digo de finalizaci&oacute;n que caus&oacute; la excepci&oacute;n
 */
- (EsGobJmulticardApduStatusWord *)getStatusWord;

#pragma mark Package-Private

/*!
 @brief Construye la excepci&oacute;n.
 @param retCode C &oacute; digo devuelto por la tarjeta.
 */
- (instancetype)initWithEsGobJmulticardApduStatusWord:(EsGobJmulticardApduStatusWord *)retCode;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithNSString:(NSString *)arg0 NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(EsGobJmulticardCardDnieDnieCardException)

FOUNDATION_EXPORT void EsGobJmulticardCardDnieDnieCardException_initWithNSString_withEsGobJmulticardApduStatusWord_(EsGobJmulticardCardDnieDnieCardException *self, NSString *desc, EsGobJmulticardApduStatusWord *retCode);

FOUNDATION_EXPORT EsGobJmulticardCardDnieDnieCardException *new_EsGobJmulticardCardDnieDnieCardException_initWithNSString_withEsGobJmulticardApduStatusWord_(NSString *desc, EsGobJmulticardApduStatusWord *retCode) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT EsGobJmulticardCardDnieDnieCardException *create_EsGobJmulticardCardDnieDnieCardException_initWithNSString_withEsGobJmulticardApduStatusWord_(NSString *desc, EsGobJmulticardApduStatusWord *retCode);

FOUNDATION_EXPORT void EsGobJmulticardCardDnieDnieCardException_initWithNSString_withJavaLangThrowable_(EsGobJmulticardCardDnieDnieCardException *self, NSString *desc, JavaLangThrowable *t);

FOUNDATION_EXPORT EsGobJmulticardCardDnieDnieCardException *new_EsGobJmulticardCardDnieDnieCardException_initWithNSString_withJavaLangThrowable_(NSString *desc, JavaLangThrowable *t) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT EsGobJmulticardCardDnieDnieCardException *create_EsGobJmulticardCardDnieDnieCardException_initWithNSString_withJavaLangThrowable_(NSString *desc, JavaLangThrowable *t);

FOUNDATION_EXPORT void EsGobJmulticardCardDnieDnieCardException_initWithEsGobJmulticardApduStatusWord_(EsGobJmulticardCardDnieDnieCardException *self, EsGobJmulticardApduStatusWord *retCode);

FOUNDATION_EXPORT EsGobJmulticardCardDnieDnieCardException *new_EsGobJmulticardCardDnieDnieCardException_initWithEsGobJmulticardApduStatusWord_(EsGobJmulticardApduStatusWord *retCode) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT EsGobJmulticardCardDnieDnieCardException *create_EsGobJmulticardCardDnieDnieCardException_initWithEsGobJmulticardApduStatusWord_(EsGobJmulticardApduStatusWord *retCode);

J2OBJC_TYPE_LITERAL_HEADER(EsGobJmulticardCardDnieDnieCardException)

#endif

#pragma pop_macro("INCLUDE_ALL_EsGobJmulticardCardDnieDnieCardException")
