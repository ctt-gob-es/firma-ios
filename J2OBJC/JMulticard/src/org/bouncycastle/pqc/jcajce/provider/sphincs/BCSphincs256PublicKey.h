//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/jcajce/provider/sphincs/BCSphincs256PublicKey.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey")
#ifdef RESTRICT_OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey
#define INCLUDE_ALL_OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey 1
#endif
#undef RESTRICT_OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey

#if !defined (OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey_) && (INCLUDE_ALL_OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey || defined(INCLUDE_OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey))
#define OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey_

#define RESTRICT_JavaSecurityPublicKey 1
#define INCLUDE_JavaSecurityPublicKey 1
#include "java/security/PublicKey.h"

#define RESTRICT_OrgBouncycastlePqcJcajceInterfacesSPHINCSKey 1
#define INCLUDE_OrgBouncycastlePqcJcajceInterfacesSPHINCSKey 1
#include "org/bouncycastle/pqc/jcajce/interfaces/SPHINCSKey.h"

@class IOSByteArray;
@class OrgBouncycastleAsn1ASN1ObjectIdentifier;
@class OrgBouncycastleAsn1X509SubjectPublicKeyInfo;
@class OrgBouncycastlePqcCryptoSphincsSPHINCSPublicKeyParameters;
@protocol OrgBouncycastleCryptoCipherParameters;

@interface OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey : NSObject < JavaSecurityPublicKey, OrgBouncycastlePqcJcajceInterfacesSPHINCSKey >

#pragma mark Public

- (instancetype)initWithOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)treeDigest
  withOrgBouncycastlePqcCryptoSphincsSPHINCSPublicKeyParameters:(OrgBouncycastlePqcCryptoSphincsSPHINCSPublicKeyParameters *)params;

- (instancetype)initWithOrgBouncycastleAsn1X509SubjectPublicKeyInfo:(OrgBouncycastleAsn1X509SubjectPublicKeyInfo *)keyInfo;

/*!
 @brief Compare this SPHINCS-256 public key with another object.
 @param o the other object
 @return the result of the comparison
 */
- (jboolean)isEqual:(id)o;

/*!
 @return name of the algorithm - "SPHINCS-256"
 */
- (NSString *)getAlgorithm;

- (IOSByteArray *)getEncoded;

- (NSString *)getFormat;

- (IOSByteArray *)getKeyData;

- (NSUInteger)hash;

#pragma mark Package-Private

- (id<OrgBouncycastleCryptoCipherParameters>)getKeyParams;

- (OrgBouncycastleAsn1ASN1ObjectIdentifier *)getTreeDigest;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey)

FOUNDATION_EXPORT void OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey_initWithOrgBouncycastleAsn1ASN1ObjectIdentifier_withOrgBouncycastlePqcCryptoSphincsSPHINCSPublicKeyParameters_(OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey *self, OrgBouncycastleAsn1ASN1ObjectIdentifier *treeDigest, OrgBouncycastlePqcCryptoSphincsSPHINCSPublicKeyParameters *params);

FOUNDATION_EXPORT OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey *new_OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey_initWithOrgBouncycastleAsn1ASN1ObjectIdentifier_withOrgBouncycastlePqcCryptoSphincsSPHINCSPublicKeyParameters_(OrgBouncycastleAsn1ASN1ObjectIdentifier *treeDigest, OrgBouncycastlePqcCryptoSphincsSPHINCSPublicKeyParameters *params) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey *create_OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey_initWithOrgBouncycastleAsn1ASN1ObjectIdentifier_withOrgBouncycastlePqcCryptoSphincsSPHINCSPublicKeyParameters_(OrgBouncycastleAsn1ASN1ObjectIdentifier *treeDigest, OrgBouncycastlePqcCryptoSphincsSPHINCSPublicKeyParameters *params);

FOUNDATION_EXPORT void OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey_initWithOrgBouncycastleAsn1X509SubjectPublicKeyInfo_(OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey *self, OrgBouncycastleAsn1X509SubjectPublicKeyInfo *keyInfo);

FOUNDATION_EXPORT OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey *new_OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey_initWithOrgBouncycastleAsn1X509SubjectPublicKeyInfo_(OrgBouncycastleAsn1X509SubjectPublicKeyInfo *keyInfo) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey *create_OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey_initWithOrgBouncycastleAsn1X509SubjectPublicKeyInfo_(OrgBouncycastleAsn1X509SubjectPublicKeyInfo *keyInfo);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcJcajceProviderSphincsBCSphincs256PublicKey")
