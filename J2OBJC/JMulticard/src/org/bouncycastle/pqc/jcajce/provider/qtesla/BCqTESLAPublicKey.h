//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/jcajce/provider/qtesla/BCqTESLAPublicKey.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey")
#ifdef RESTRICT_OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey
#define INCLUDE_ALL_OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey 1
#endif
#undef RESTRICT_OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey

#if !defined (OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey_) && (INCLUDE_ALL_OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey || defined(INCLUDE_OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey))
#define OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey_

#define RESTRICT_JavaSecurityPublicKey 1
#define INCLUDE_JavaSecurityPublicKey 1
#include "java/security/PublicKey.h"

#define RESTRICT_OrgBouncycastlePqcJcajceInterfacesQTESLAKey 1
#define INCLUDE_OrgBouncycastlePqcJcajceInterfacesQTESLAKey 1
#include "org/bouncycastle/pqc/jcajce/interfaces/QTESLAKey.h"

@class IOSByteArray;
@class OrgBouncycastleAsn1X509SubjectPublicKeyInfo;
@class OrgBouncycastlePqcCryptoQteslaQTESLAPublicKeyParameters;
@class OrgBouncycastlePqcJcajceSpecQTESLAParameterSpec;
@protocol OrgBouncycastleCryptoCipherParameters;

@interface OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey : NSObject < JavaSecurityPublicKey, OrgBouncycastlePqcJcajceInterfacesQTESLAKey >

#pragma mark Public

- (instancetype)initWithOrgBouncycastlePqcCryptoQteslaQTESLAPublicKeyParameters:(OrgBouncycastlePqcCryptoQteslaQTESLAPublicKeyParameters *)keyParams;

- (instancetype)initWithOrgBouncycastleAsn1X509SubjectPublicKeyInfo:(OrgBouncycastleAsn1X509SubjectPublicKeyInfo *)keyInfo;

- (jboolean)isEqual:(id)o;

/*!
 @return name of the algorithm
 */
- (NSString *)getAlgorithm;

- (IOSByteArray *)getEncoded;

- (NSString *)getFormat;

- (OrgBouncycastlePqcJcajceSpecQTESLAParameterSpec *)getParams;

- (NSUInteger)hash;

#pragma mark Package-Private

- (id<OrgBouncycastleCryptoCipherParameters>)getKeyParams;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey)

FOUNDATION_EXPORT void OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey_initWithOrgBouncycastlePqcCryptoQteslaQTESLAPublicKeyParameters_(OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey *self, OrgBouncycastlePqcCryptoQteslaQTESLAPublicKeyParameters *keyParams);

FOUNDATION_EXPORT OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey *new_OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey_initWithOrgBouncycastlePqcCryptoQteslaQTESLAPublicKeyParameters_(OrgBouncycastlePqcCryptoQteslaQTESLAPublicKeyParameters *keyParams) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey *create_OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey_initWithOrgBouncycastlePqcCryptoQteslaQTESLAPublicKeyParameters_(OrgBouncycastlePqcCryptoQteslaQTESLAPublicKeyParameters *keyParams);

FOUNDATION_EXPORT void OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey_initWithOrgBouncycastleAsn1X509SubjectPublicKeyInfo_(OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey *self, OrgBouncycastleAsn1X509SubjectPublicKeyInfo *keyInfo);

FOUNDATION_EXPORT OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey *new_OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey_initWithOrgBouncycastleAsn1X509SubjectPublicKeyInfo_(OrgBouncycastleAsn1X509SubjectPublicKeyInfo *keyInfo) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey *create_OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey_initWithOrgBouncycastleAsn1X509SubjectPublicKeyInfo_(OrgBouncycastleAsn1X509SubjectPublicKeyInfo *keyInfo);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcJcajceProviderQteslaBCqTESLAPublicKey")
