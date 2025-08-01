//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/pkcs/RSASSAPSSparams.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleAsn1PkcsRSASSAPSSparams")
#ifdef RESTRICT_OrgBouncycastleAsn1PkcsRSASSAPSSparams
#define INCLUDE_ALL_OrgBouncycastleAsn1PkcsRSASSAPSSparams 0
#else
#define INCLUDE_ALL_OrgBouncycastleAsn1PkcsRSASSAPSSparams 1
#endif
#undef RESTRICT_OrgBouncycastleAsn1PkcsRSASSAPSSparams

#if !defined (OrgBouncycastleAsn1PkcsRSASSAPSSparams_) && (INCLUDE_ALL_OrgBouncycastleAsn1PkcsRSASSAPSSparams || defined(INCLUDE_OrgBouncycastleAsn1PkcsRSASSAPSSparams))
#define OrgBouncycastleAsn1PkcsRSASSAPSSparams_

#define RESTRICT_OrgBouncycastleAsn1ASN1Object 1
#define INCLUDE_OrgBouncycastleAsn1ASN1Object 1
#include "org/bouncycastle/asn1/ASN1Object.h"

@class JavaMathBigInteger;
@class OrgBouncycastleAsn1ASN1Integer;
@class OrgBouncycastleAsn1ASN1Primitive;
@class OrgBouncycastleAsn1X509AlgorithmIdentifier;

@interface OrgBouncycastleAsn1PkcsRSASSAPSSparams : OrgBouncycastleAsn1ASN1Object

#pragma mark Public

/*!
 @brief The default version
 */
- (instancetype)init;

- (instancetype)initWithOrgBouncycastleAsn1X509AlgorithmIdentifier:(OrgBouncycastleAsn1X509AlgorithmIdentifier *)hashAlgorithm
                    withOrgBouncycastleAsn1X509AlgorithmIdentifier:(OrgBouncycastleAsn1X509AlgorithmIdentifier *)maskGenAlgorithm
                                withOrgBouncycastleAsn1ASN1Integer:(OrgBouncycastleAsn1ASN1Integer *)saltLength
                                withOrgBouncycastleAsn1ASN1Integer:(OrgBouncycastleAsn1ASN1Integer *)trailerField;

- (OrgBouncycastleAsn1X509AlgorithmIdentifier *)getHashAlgorithm;

+ (OrgBouncycastleAsn1PkcsRSASSAPSSparams *)getInstanceWithId:(id)obj;

- (OrgBouncycastleAsn1X509AlgorithmIdentifier *)getMaskGenAlgorithm;

- (JavaMathBigInteger *)getSaltLength;

- (JavaMathBigInteger *)getTrailerField;

/*!
 @brief @code

  RSASSA-PSS-params ::= SEQUENCE {
    hashAlgorithm      [0] OAEP-PSSDigestAlgorithms  DEFAULT sha1,
     maskGenAlgorithm   [1] PKCS1MGFAlgorithms  DEFAULT mgf1SHA1,
     saltLength         [2] INTEGER  DEFAULT 20,
     trailerField       [3] TrailerField  DEFAULT trailerFieldBC
   }
  OAEP-PSSDigestAlgorithms    ALGORITHM-IDENTIFIER ::= {
     { OID id-sha1 PARAMETERS NULL   }|
     { OID id-sha256 PARAMETERS NULL }|
     { OID id-sha384 PARAMETERS NULL }|
     { OID id-sha512 PARAMETERS NULL },
     ...-- Allows for future expansion --
  }
  PKCS1MGFAlgorithms    ALGORITHM-IDENTIFIER ::= {
    { OID id-mgf1 PARAMETERS OAEP-PSSDigestAlgorithms },
     ...  -- Allows for future expansion --
  } 
  TrailerField ::= INTEGER { trailerFieldBC(1) } 
  
@endcode
 @return the asn1 primitive representing the parameters.
 */
- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive;

@end

J2OBJC_STATIC_INIT(OrgBouncycastleAsn1PkcsRSASSAPSSparams)

inline OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastleAsn1PkcsRSASSAPSSparams_get_DEFAULT_HASH_ALGORITHM(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastleAsn1PkcsRSASSAPSSparams_DEFAULT_HASH_ALGORITHM;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1PkcsRSASSAPSSparams, DEFAULT_HASH_ALGORITHM, OrgBouncycastleAsn1X509AlgorithmIdentifier *)

inline OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastleAsn1PkcsRSASSAPSSparams_get_DEFAULT_MASK_GEN_FUNCTION(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastleAsn1PkcsRSASSAPSSparams_DEFAULT_MASK_GEN_FUNCTION;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1PkcsRSASSAPSSparams, DEFAULT_MASK_GEN_FUNCTION, OrgBouncycastleAsn1X509AlgorithmIdentifier *)

inline OrgBouncycastleAsn1ASN1Integer *OrgBouncycastleAsn1PkcsRSASSAPSSparams_get_DEFAULT_SALT_LENGTH(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1Integer *OrgBouncycastleAsn1PkcsRSASSAPSSparams_DEFAULT_SALT_LENGTH;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1PkcsRSASSAPSSparams, DEFAULT_SALT_LENGTH, OrgBouncycastleAsn1ASN1Integer *)

inline OrgBouncycastleAsn1ASN1Integer *OrgBouncycastleAsn1PkcsRSASSAPSSparams_get_DEFAULT_TRAILER_FIELD(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1Integer *OrgBouncycastleAsn1PkcsRSASSAPSSparams_DEFAULT_TRAILER_FIELD;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1PkcsRSASSAPSSparams, DEFAULT_TRAILER_FIELD, OrgBouncycastleAsn1ASN1Integer *)

FOUNDATION_EXPORT OrgBouncycastleAsn1PkcsRSASSAPSSparams *OrgBouncycastleAsn1PkcsRSASSAPSSparams_getInstanceWithId_(id obj);

FOUNDATION_EXPORT void OrgBouncycastleAsn1PkcsRSASSAPSSparams_init(OrgBouncycastleAsn1PkcsRSASSAPSSparams *self);

FOUNDATION_EXPORT OrgBouncycastleAsn1PkcsRSASSAPSSparams *new_OrgBouncycastleAsn1PkcsRSASSAPSSparams_init(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleAsn1PkcsRSASSAPSSparams *create_OrgBouncycastleAsn1PkcsRSASSAPSSparams_init(void);

FOUNDATION_EXPORT void OrgBouncycastleAsn1PkcsRSASSAPSSparams_initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withOrgBouncycastleAsn1X509AlgorithmIdentifier_withOrgBouncycastleAsn1ASN1Integer_withOrgBouncycastleAsn1ASN1Integer_(OrgBouncycastleAsn1PkcsRSASSAPSSparams *self, OrgBouncycastleAsn1X509AlgorithmIdentifier *hashAlgorithm, OrgBouncycastleAsn1X509AlgorithmIdentifier *maskGenAlgorithm, OrgBouncycastleAsn1ASN1Integer *saltLength, OrgBouncycastleAsn1ASN1Integer *trailerField);

FOUNDATION_EXPORT OrgBouncycastleAsn1PkcsRSASSAPSSparams *new_OrgBouncycastleAsn1PkcsRSASSAPSSparams_initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withOrgBouncycastleAsn1X509AlgorithmIdentifier_withOrgBouncycastleAsn1ASN1Integer_withOrgBouncycastleAsn1ASN1Integer_(OrgBouncycastleAsn1X509AlgorithmIdentifier *hashAlgorithm, OrgBouncycastleAsn1X509AlgorithmIdentifier *maskGenAlgorithm, OrgBouncycastleAsn1ASN1Integer *saltLength, OrgBouncycastleAsn1ASN1Integer *trailerField) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleAsn1PkcsRSASSAPSSparams *create_OrgBouncycastleAsn1PkcsRSASSAPSSparams_initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withOrgBouncycastleAsn1X509AlgorithmIdentifier_withOrgBouncycastleAsn1ASN1Integer_withOrgBouncycastleAsn1ASN1Integer_(OrgBouncycastleAsn1X509AlgorithmIdentifier *hashAlgorithm, OrgBouncycastleAsn1X509AlgorithmIdentifier *maskGenAlgorithm, OrgBouncycastleAsn1ASN1Integer *saltLength, OrgBouncycastleAsn1ASN1Integer *trailerField);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1PkcsRSASSAPSSparams)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleAsn1PkcsRSASSAPSSparams")
