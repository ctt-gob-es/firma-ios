//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/asn1/der/pkcs15/Odf.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_EsGobJmulticardAsn1DerPkcs15Odf")
#ifdef RESTRICT_EsGobJmulticardAsn1DerPkcs15Odf
#define INCLUDE_ALL_EsGobJmulticardAsn1DerPkcs15Odf 0
#else
#define INCLUDE_ALL_EsGobJmulticardAsn1DerPkcs15Odf 1
#endif
#undef RESTRICT_EsGobJmulticardAsn1DerPkcs15Odf

#if !defined (EsGobJmulticardAsn1DerPkcs15Odf_) && (INCLUDE_ALL_EsGobJmulticardAsn1DerPkcs15Odf || defined(INCLUDE_EsGobJmulticardAsn1DerPkcs15Odf))
#define EsGobJmulticardAsn1DerPkcs15Odf_

#define RESTRICT_EsGobJmulticardAsn1DerRecord 1
#define INCLUDE_EsGobJmulticardAsn1DerRecord 1
#include "es/gob/jmulticard/asn1/der/Record.h"

@class EsGobJmulticardAsn1DerPkcs15Path;
@class IOSObjectArray;

/*!
 @brief Objeto PKCS#15 ODF (<i>Object Description File</i>) ASN&#46;1.
 Su estructura general es una repetici&oacute;n de registros de tipo <code>PKCS15Objects</code>:
  @code

  PKCS15Objects ::= CHOICE {
    privateKeys         [0] PrivateKeys,
    publicKeys          [1] PublicKeys,
    trustedPublicKeys   [2] PublicKeys,
    secretKeys          [3] SecretKeys,
    certificates        [4] Certificates,
    trustedCertificates [5] Certificates,
    usefulCertificates  [6] Certificates,
    dataObjects         [7] DataObjects,
    authObjects         [8] AuthObjects,
    ... -- For future extensions
  }
  PrivateKeys  ::= PathOrObjects {PrivateKeyType}
  SecretKeys   ::= PathOrObjects {SecretKeyType}
  PublicKeys   ::= PathOrObjects {PublicKeyType}
  Certificates ::= PathOrObjects {CertificateType}
  DataObjects  ::= PathOrObjects {DataType}
  AuthObjects  ::= PathOrObjects {AuthenticationType}
  PathOrObjects {ObjectType} ::= CHOICE {
    path    Path,
    objects [0] SEQUENCE OF ObjectType,
    ...,
    indirect-protected [1] ReferencedValue {EnvelopedData {SEQUENCE OF ObjectType}},
    direct-protected   [2] EnvelopedData   {SEQUENCE OF ObjectType},
  } 
  
@endcode
 @author Tom&aacute;s Garc&iacute;a-Mer&aacute;s.
 */
@interface EsGobJmulticardAsn1DerPkcs15Odf : EsGobJmulticardAsn1DerRecord

#pragma mark Public

/*!
 @brief Construye un objeto PKCS#15 ODF (<i>Object Description File</i>) ASN&#46;1.
 */
- (instancetype)init;

/*!
 @brief Obtiene la ruta (Path ASN&#46;1 PKCS#15) hacia el CDF.
 @return Ruta (Path ASN&#46;1 PKCS#15) hacia el CDF, o <code>null</code>
          si este ODF no contiene esta ruta.
 */
- (EsGobJmulticardAsn1DerPkcs15Path *)getCdfPath;

/*!
 @brief Obtiene la ruta (Path ASN&#46;1 PKCS#15) hacia el PrKDF.
 @return Ruta (Path ASN&#46;1 PKCS#15) hacia el PrKDF, o <code>null</code>
          si este ODF no contiene esta ruta.
 */
- (EsGobJmulticardAsn1DerPkcs15Path *)getPrKdfPath;

/*!
 @brief Obtiene la ruta (Path ASN&#46;1 PKCS#15) hacia el PuKDF.
 @return Ruta (Path ASN&#46;1 PKCS#15) hacia el PuKDF, o <code>null</code>
          si este ODF no contiene esta ruta.
 */
- (EsGobJmulticardAsn1DerPkcs15Path *)getPuKdfPath;

- (NSString *)description;

// Disallowed inherited constructors, do not use.

- (instancetype)initWithEsGobJmulticardAsn1OptionalDecoderObjectElementArray:(IOSObjectArray *)arg0 NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(EsGobJmulticardAsn1DerPkcs15Odf)

FOUNDATION_EXPORT void EsGobJmulticardAsn1DerPkcs15Odf_init(EsGobJmulticardAsn1DerPkcs15Odf *self);

FOUNDATION_EXPORT EsGobJmulticardAsn1DerPkcs15Odf *new_EsGobJmulticardAsn1DerPkcs15Odf_init(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT EsGobJmulticardAsn1DerPkcs15Odf *create_EsGobJmulticardAsn1DerPkcs15Odf_init(void);

J2OBJC_TYPE_LITERAL_HEADER(EsGobJmulticardAsn1DerPkcs15Odf)

#endif

#pragma pop_macro("INCLUDE_ALL_EsGobJmulticardAsn1DerPkcs15Odf")
