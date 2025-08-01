//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/cms/DefaultCMSSignatureAlgorithmNameGenerator.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleCmsDefaultCMSSignatureAlgorithmNameGenerator")
#ifdef RESTRICT_OrgBouncycastleCmsDefaultCMSSignatureAlgorithmNameGenerator
#define INCLUDE_ALL_OrgBouncycastleCmsDefaultCMSSignatureAlgorithmNameGenerator 0
#else
#define INCLUDE_ALL_OrgBouncycastleCmsDefaultCMSSignatureAlgorithmNameGenerator 1
#endif
#undef RESTRICT_OrgBouncycastleCmsDefaultCMSSignatureAlgorithmNameGenerator

#if !defined (OrgBouncycastleCmsDefaultCMSSignatureAlgorithmNameGenerator_) && (INCLUDE_ALL_OrgBouncycastleCmsDefaultCMSSignatureAlgorithmNameGenerator || defined(INCLUDE_OrgBouncycastleCmsDefaultCMSSignatureAlgorithmNameGenerator))
#define OrgBouncycastleCmsDefaultCMSSignatureAlgorithmNameGenerator_

#define RESTRICT_OrgBouncycastleCmsCMSSignatureAlgorithmNameGenerator 1
#define INCLUDE_OrgBouncycastleCmsCMSSignatureAlgorithmNameGenerator 1
#include "org/bouncycastle/cms/CMSSignatureAlgorithmNameGenerator.h"

@class OrgBouncycastleAsn1ASN1ObjectIdentifier;
@class OrgBouncycastleAsn1X509AlgorithmIdentifier;

@interface OrgBouncycastleCmsDefaultCMSSignatureAlgorithmNameGenerator : NSObject < OrgBouncycastleCmsCMSSignatureAlgorithmNameGenerator >

#pragma mark Public

- (instancetype)init;

- (NSString *)getSignatureNameWithOrgBouncycastleAsn1X509AlgorithmIdentifier:(OrgBouncycastleAsn1X509AlgorithmIdentifier *)digestAlg
                              withOrgBouncycastleAsn1X509AlgorithmIdentifier:(OrgBouncycastleAsn1X509AlgorithmIdentifier *)encryptionAlg;

#pragma mark Protected

/*!
 @brief Set the mapping for the digest algorithm to use in conjunction with a SignedData generation
  or interpretation.
 @param oid object identifier to map.
 @param algorithmName algorithm name to use.
 */
- (void)setSigningDigestAlgorithmMappingWithOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)oid
                                                                       withNSString:(NSString *)algorithmName;

/*!
 @brief Set the mapping for the encryption algorithm used in association with a SignedData generation
  or interpretation.
 @param oid object identifier to map.
 @param algorithmName algorithm name to use.
 */
- (void)setSigningEncryptionAlgorithmMappingWithOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)oid
                                                                           withNSString:(NSString *)algorithmName;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleCmsDefaultCMSSignatureAlgorithmNameGenerator)

FOUNDATION_EXPORT void OrgBouncycastleCmsDefaultCMSSignatureAlgorithmNameGenerator_init(OrgBouncycastleCmsDefaultCMSSignatureAlgorithmNameGenerator *self);

FOUNDATION_EXPORT OrgBouncycastleCmsDefaultCMSSignatureAlgorithmNameGenerator *new_OrgBouncycastleCmsDefaultCMSSignatureAlgorithmNameGenerator_init(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleCmsDefaultCMSSignatureAlgorithmNameGenerator *create_OrgBouncycastleCmsDefaultCMSSignatureAlgorithmNameGenerator_init(void);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleCmsDefaultCMSSignatureAlgorithmNameGenerator)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleCmsDefaultCMSSignatureAlgorithmNameGenerator")
