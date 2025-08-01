//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/asn1/custom/fnmt/ceres/CeresPrivateKeyObject.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_EsGobJmulticardAsn1CustomFnmtCeresCeresPrivateKeyObject")
#ifdef RESTRICT_EsGobJmulticardAsn1CustomFnmtCeresCeresPrivateKeyObject
#define INCLUDE_ALL_EsGobJmulticardAsn1CustomFnmtCeresCeresPrivateKeyObject 0
#else
#define INCLUDE_ALL_EsGobJmulticardAsn1CustomFnmtCeresCeresPrivateKeyObject 1
#endif
#undef RESTRICT_EsGobJmulticardAsn1CustomFnmtCeresCeresPrivateKeyObject

#if !defined (EsGobJmulticardAsn1CustomFnmtCeresCeresPrivateKeyObject_) && (INCLUDE_ALL_EsGobJmulticardAsn1CustomFnmtCeresCeresPrivateKeyObject || defined(INCLUDE_EsGobJmulticardAsn1CustomFnmtCeresCeresPrivateKeyObject))
#define EsGobJmulticardAsn1CustomFnmtCeresCeresPrivateKeyObject_

#define RESTRICT_EsGobJmulticardAsn1DerPkcs15PrivateKeyObject 1
#define INCLUDE_EsGobJmulticardAsn1DerPkcs15PrivateKeyObject 1
#include "es/gob/jmulticard/asn1/der/pkcs15/PrivateKeyObject.h"

@class IOSByteArray;
@class IOSClass;

/*!
 @brief Tipo ASN&#46;1 PKCS#15 <i>PrivateKeyObject</i> espec&iacute;fico para ciertas tarjetas FNMT CERES.
 @code

   PrivateKeyObject {KeyAttributes} ::= PKCS15Object {
     CommonKeyAttributes,
     CommonPrivateKeyAttributes,
     KeyAttributes
   } 
  
@endcode
  Que en el caso de claves privadas RSA (instanciando como 
 <code>PrivateKeyObject {PrivateRSAKeyAttributes}</code>) y deshaciendo <code>PKCS15Object</code>
  en su secuencia queda la estructura: 
 @code

   PrivateKeyObject {PrivateRSAKeyAttributes} ::= SEQUENCE {
     CommonObjectAttributes,
     CommonKeyAttributes,
     CommonPrivateKeyAttributes,
     PrivateRsaKeyAttributes
   } 
  
@endcode
 @author Tom&aacute;s Garc&iacute;a-Mer&aacute;s.
 */
@interface EsGobJmulticardAsn1CustomFnmtCeresCeresPrivateKeyObject : EsGobJmulticardAsn1DerPkcs15PrivateKeyObject

#pragma mark Public

/*!
 @brief Construye un objeto ASN&#46;1 PKCS#15 <i>PrivateKeyObject</i>
  espec&iacute;fico para ciertas tarjetas FNMT CERES.
 */
- (instancetype)init;

- (IOSByteArray *)getKeyIdentifier;

- (NSString *)getKeyPath;

- (jbyte)getKeyReference;

- (NSString *)description;

// Disallowed inherited constructors, do not use.

- (instancetype)initWithIOSClass:(IOSClass *)arg0
                    withIOSClass:(IOSClass *)arg1
                    withIOSClass:(IOSClass *)arg2 NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(EsGobJmulticardAsn1CustomFnmtCeresCeresPrivateKeyObject)

FOUNDATION_EXPORT void EsGobJmulticardAsn1CustomFnmtCeresCeresPrivateKeyObject_init(EsGobJmulticardAsn1CustomFnmtCeresCeresPrivateKeyObject *self);

FOUNDATION_EXPORT EsGobJmulticardAsn1CustomFnmtCeresCeresPrivateKeyObject *new_EsGobJmulticardAsn1CustomFnmtCeresCeresPrivateKeyObject_init(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT EsGobJmulticardAsn1CustomFnmtCeresCeresPrivateKeyObject *create_EsGobJmulticardAsn1CustomFnmtCeresCeresPrivateKeyObject_init(void);

J2OBJC_TYPE_LITERAL_HEADER(EsGobJmulticardAsn1CustomFnmtCeresCeresPrivateKeyObject)

#endif

#pragma pop_macro("INCLUDE_ALL_EsGobJmulticardAsn1CustomFnmtCeresCeresPrivateKeyObject")
