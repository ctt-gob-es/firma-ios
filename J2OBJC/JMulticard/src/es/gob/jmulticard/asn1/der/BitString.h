//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/asn1/der/BitString.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_EsGobJmulticardAsn1DerBitString")
#ifdef RESTRICT_EsGobJmulticardAsn1DerBitString
#define INCLUDE_ALL_EsGobJmulticardAsn1DerBitString 0
#else
#define INCLUDE_ALL_EsGobJmulticardAsn1DerBitString 1
#endif
#undef RESTRICT_EsGobJmulticardAsn1DerBitString

#if !defined (EsGobJmulticardAsn1DerBitString_) && (INCLUDE_ALL_EsGobJmulticardAsn1DerBitString || defined(INCLUDE_EsGobJmulticardAsn1DerBitString))
#define EsGobJmulticardAsn1DerBitString_

#define RESTRICT_EsGobJmulticardAsn1DecoderObject 1
#define INCLUDE_EsGobJmulticardAsn1DecoderObject 1
#include "es/gob/jmulticard/asn1/DecoderObject.h"

@class IOSByteArray;

/*!
 @brief Tipo ASN&#46;1 BitString.
 @author Tom&aacute;s Garc&iacute;a-Mer&aacute;s.
 */
@interface EsGobJmulticardAsn1DerBitString : EsGobJmulticardAsn1DecoderObject

#pragma mark Public

- (instancetype)init;

/*!
 @brief Obtiene el valor binario del campo de datos del <i>BitString</i>.
 @return Valor binario del campo de datos del <i>BitString</i>.
 */
- (IOSByteArray *)getValue;

#pragma mark Protected

- (void)decodeValue;

- (jbyte)getDefaultTag;

@end

J2OBJC_EMPTY_STATIC_INIT(EsGobJmulticardAsn1DerBitString)

FOUNDATION_EXPORT void EsGobJmulticardAsn1DerBitString_init(EsGobJmulticardAsn1DerBitString *self);

J2OBJC_TYPE_LITERAL_HEADER(EsGobJmulticardAsn1DerBitString)

#endif

#pragma pop_macro("INCLUDE_ALL_EsGobJmulticardAsn1DerBitString")
