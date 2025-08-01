//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/util/Utils.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoUtilUtils")
#ifdef RESTRICT_OrgBouncycastlePqcCryptoUtilUtils
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoUtilUtils 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoUtilUtils 1
#endif
#undef RESTRICT_OrgBouncycastlePqcCryptoUtilUtils

#if !defined (OrgBouncycastlePqcCryptoUtilUtils_) && (INCLUDE_ALL_OrgBouncycastlePqcCryptoUtilUtils || defined(INCLUDE_OrgBouncycastlePqcCryptoUtilUtils))
#define OrgBouncycastlePqcCryptoUtilUtils_

@class OrgBouncycastleAsn1ASN1ObjectIdentifier;
@class OrgBouncycastleAsn1X509AlgorithmIdentifier;
@class OrgBouncycastlePqcAsn1SPHINCS256KeyParams;
@class OrgBouncycastlePqcCryptoCmceCMCEParameters;
@class OrgBouncycastlePqcCryptoFrodoFrodoParameters;
@class OrgBouncycastlePqcCryptoSaberSABERParameters;
@class OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusParameters;
@protocol JavaUtilMap;
@protocol OrgBouncycastleCryptoDigest;

@interface OrgBouncycastlePqcCryptoUtilUtils : NSObject

#pragma mark Public

+ (OrgBouncycastleAsn1X509AlgorithmIdentifier *)getAlgorithmIdentifierWithNSString:(NSString *)digestName;

+ (NSString *)getDigestNameWithOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)digestOid;

#pragma mark Package-Private

- (instancetype)initPackagePrivate;

+ (OrgBouncycastleAsn1ASN1ObjectIdentifier *)frodoOidLookupWithOrgBouncycastlePqcCryptoFrodoFrodoParameters:(OrgBouncycastlePqcCryptoFrodoFrodoParameters *)params;

+ (OrgBouncycastlePqcCryptoFrodoFrodoParameters *)frodoParamsLookupWithOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)oid;

+ (id<OrgBouncycastleCryptoDigest>)getDigestWithOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)oid;

+ (OrgBouncycastleAsn1ASN1ObjectIdentifier *)mcElieceOidLookupWithOrgBouncycastlePqcCryptoCmceCMCEParameters:(OrgBouncycastlePqcCryptoCmceCMCEParameters *)params;

+ (OrgBouncycastlePqcCryptoCmceCMCEParameters *)mcElieceParamsLookupWithOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)oid;

+ (OrgBouncycastleAsn1X509AlgorithmIdentifier *)qTeslaLookupAlgIDWithInt:(jint)securityCategory;

+ (jint)qTeslaLookupSecurityCategoryWithOrgBouncycastleAsn1X509AlgorithmIdentifier:(OrgBouncycastleAsn1X509AlgorithmIdentifier *)algorithm;

+ (OrgBouncycastleAsn1ASN1ObjectIdentifier *)saberOidLookupWithOrgBouncycastlePqcCryptoSaberSABERParameters:(OrgBouncycastlePqcCryptoSaberSABERParameters *)params;

+ (OrgBouncycastlePqcCryptoSaberSABERParameters *)saberParamsLookupWithOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)oid;

+ (OrgBouncycastleAsn1X509AlgorithmIdentifier *)sphincs256LookupTreeAlgIDWithNSString:(NSString *)treeDigest;

+ (NSString *)sphincs256LookupTreeAlgNameWithOrgBouncycastlePqcAsn1SPHINCS256KeyParams:(OrgBouncycastlePqcAsn1SPHINCS256KeyParams *)keyParams;

+ (OrgBouncycastleAsn1ASN1ObjectIdentifier *)sphincsPlusOidLookupWithOrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusParameters:(OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusParameters *)params;

+ (OrgBouncycastleAsn1X509AlgorithmIdentifier *)xmssLookupTreeAlgIDWithNSString:(NSString *)treeDigest;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_STATIC_INIT(OrgBouncycastlePqcCryptoUtilUtils)

inline OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_get_AlgID_qTESLA_p_I(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_AlgID_qTESLA_p_I;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastlePqcCryptoUtilUtils, AlgID_qTESLA_p_I, OrgBouncycastleAsn1X509AlgorithmIdentifier *)

inline OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_get_AlgID_qTESLA_p_III(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_AlgID_qTESLA_p_III;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastlePqcCryptoUtilUtils, AlgID_qTESLA_p_III, OrgBouncycastleAsn1X509AlgorithmIdentifier *)

inline OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_get_SPHINCS_SHA3_256(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_SPHINCS_SHA3_256;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastlePqcCryptoUtilUtils, SPHINCS_SHA3_256, OrgBouncycastleAsn1X509AlgorithmIdentifier *)

inline OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_get_SPHINCS_SHA512_256(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_SPHINCS_SHA512_256;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastlePqcCryptoUtilUtils, SPHINCS_SHA512_256, OrgBouncycastleAsn1X509AlgorithmIdentifier *)

inline OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_get_XMSS_SHA256(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_XMSS_SHA256;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastlePqcCryptoUtilUtils, XMSS_SHA256, OrgBouncycastleAsn1X509AlgorithmIdentifier *)

inline OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_get_XMSS_SHA512(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_XMSS_SHA512;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastlePqcCryptoUtilUtils, XMSS_SHA512, OrgBouncycastleAsn1X509AlgorithmIdentifier *)

inline OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_get_XMSS_SHAKE128(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_XMSS_SHAKE128;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastlePqcCryptoUtilUtils, XMSS_SHAKE128, OrgBouncycastleAsn1X509AlgorithmIdentifier *)

inline OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_get_XMSS_SHAKE256(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_XMSS_SHAKE256;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastlePqcCryptoUtilUtils, XMSS_SHAKE256, OrgBouncycastleAsn1X509AlgorithmIdentifier *)

inline id<JavaUtilMap> OrgBouncycastlePqcCryptoUtilUtils_get_categories(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT id<JavaUtilMap> OrgBouncycastlePqcCryptoUtilUtils_categories;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastlePqcCryptoUtilUtils, categories, id<JavaUtilMap>)

inline id<JavaUtilMap> OrgBouncycastlePqcCryptoUtilUtils_get_frodoOids(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT id<JavaUtilMap> OrgBouncycastlePqcCryptoUtilUtils_frodoOids;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastlePqcCryptoUtilUtils, frodoOids, id<JavaUtilMap>)

inline id<JavaUtilMap> OrgBouncycastlePqcCryptoUtilUtils_get_frodoParams(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT id<JavaUtilMap> OrgBouncycastlePqcCryptoUtilUtils_frodoParams;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastlePqcCryptoUtilUtils, frodoParams, id<JavaUtilMap>)

inline id<JavaUtilMap> OrgBouncycastlePqcCryptoUtilUtils_get_saberOids(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT id<JavaUtilMap> OrgBouncycastlePqcCryptoUtilUtils_saberOids;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastlePqcCryptoUtilUtils, saberOids, id<JavaUtilMap>)

inline id<JavaUtilMap> OrgBouncycastlePqcCryptoUtilUtils_get_saberParams(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT id<JavaUtilMap> OrgBouncycastlePqcCryptoUtilUtils_saberParams;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastlePqcCryptoUtilUtils, saberParams, id<JavaUtilMap>)

inline id<JavaUtilMap> OrgBouncycastlePqcCryptoUtilUtils_get_mcElieceOids(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT id<JavaUtilMap> OrgBouncycastlePqcCryptoUtilUtils_mcElieceOids;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastlePqcCryptoUtilUtils, mcElieceOids, id<JavaUtilMap>)

inline id<JavaUtilMap> OrgBouncycastlePqcCryptoUtilUtils_get_mcElieceParams(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT id<JavaUtilMap> OrgBouncycastlePqcCryptoUtilUtils_mcElieceParams;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastlePqcCryptoUtilUtils, mcElieceParams, id<JavaUtilMap>)

inline id<JavaUtilMap> OrgBouncycastlePqcCryptoUtilUtils_get_sphincsPlusOids(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT id<JavaUtilMap> OrgBouncycastlePqcCryptoUtilUtils_sphincsPlusOids;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastlePqcCryptoUtilUtils, sphincsPlusOids, id<JavaUtilMap>)

inline id<JavaUtilMap> OrgBouncycastlePqcCryptoUtilUtils_get_sphincsPlusParams(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT id<JavaUtilMap> OrgBouncycastlePqcCryptoUtilUtils_sphincsPlusParams;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastlePqcCryptoUtilUtils, sphincsPlusParams, id<JavaUtilMap>)

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoUtilUtils_initPackagePrivate(OrgBouncycastlePqcCryptoUtilUtils *self);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoUtilUtils *new_OrgBouncycastlePqcCryptoUtilUtils_initPackagePrivate(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoUtilUtils *create_OrgBouncycastlePqcCryptoUtilUtils_initPackagePrivate(void);

FOUNDATION_EXPORT jint OrgBouncycastlePqcCryptoUtilUtils_qTeslaLookupSecurityCategoryWithOrgBouncycastleAsn1X509AlgorithmIdentifier_(OrgBouncycastleAsn1X509AlgorithmIdentifier *algorithm);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_qTeslaLookupAlgIDWithInt_(jint securityCategory);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_sphincs256LookupTreeAlgIDWithNSString_(NSString *treeDigest);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_xmssLookupTreeAlgIDWithNSString_(NSString *treeDigest);

FOUNDATION_EXPORT NSString *OrgBouncycastlePqcCryptoUtilUtils_sphincs256LookupTreeAlgNameWithOrgBouncycastlePqcAsn1SPHINCS256KeyParams_(OrgBouncycastlePqcAsn1SPHINCS256KeyParams *keyParams);

FOUNDATION_EXPORT id<OrgBouncycastleCryptoDigest> OrgBouncycastlePqcCryptoUtilUtils_getDigestWithOrgBouncycastleAsn1ASN1ObjectIdentifier_(OrgBouncycastleAsn1ASN1ObjectIdentifier *oid);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509AlgorithmIdentifier *OrgBouncycastlePqcCryptoUtilUtils_getAlgorithmIdentifierWithNSString_(NSString *digestName);

FOUNDATION_EXPORT NSString *OrgBouncycastlePqcCryptoUtilUtils_getDigestNameWithOrgBouncycastleAsn1ASN1ObjectIdentifier_(OrgBouncycastleAsn1ASN1ObjectIdentifier *digestOid);

FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastlePqcCryptoUtilUtils_sphincsPlusOidLookupWithOrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusParameters_(OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusParameters *params);

FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastlePqcCryptoUtilUtils_mcElieceOidLookupWithOrgBouncycastlePqcCryptoCmceCMCEParameters_(OrgBouncycastlePqcCryptoCmceCMCEParameters *params);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoCmceCMCEParameters *OrgBouncycastlePqcCryptoUtilUtils_mcElieceParamsLookupWithOrgBouncycastleAsn1ASN1ObjectIdentifier_(OrgBouncycastleAsn1ASN1ObjectIdentifier *oid);

FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastlePqcCryptoUtilUtils_frodoOidLookupWithOrgBouncycastlePqcCryptoFrodoFrodoParameters_(OrgBouncycastlePqcCryptoFrodoFrodoParameters *params);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoFrodoFrodoParameters *OrgBouncycastlePqcCryptoUtilUtils_frodoParamsLookupWithOrgBouncycastleAsn1ASN1ObjectIdentifier_(OrgBouncycastleAsn1ASN1ObjectIdentifier *oid);

FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastlePqcCryptoUtilUtils_saberOidLookupWithOrgBouncycastlePqcCryptoSaberSABERParameters_(OrgBouncycastlePqcCryptoSaberSABERParameters *params);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoSaberSABERParameters *OrgBouncycastlePqcCryptoUtilUtils_saberParamsLookupWithOrgBouncycastleAsn1ASN1ObjectIdentifier_(OrgBouncycastleAsn1ASN1ObjectIdentifier *oid);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcCryptoUtilUtils)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoUtilUtils")
