//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/saber/SABERPrivateKeyParameters.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoSaberSABERPrivateKeyParameters")
#ifdef RESTRICT_OrgBouncycastlePqcCryptoSaberSABERPrivateKeyParameters
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoSaberSABERPrivateKeyParameters 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoSaberSABERPrivateKeyParameters 1
#endif
#undef RESTRICT_OrgBouncycastlePqcCryptoSaberSABERPrivateKeyParameters

#if !defined (OrgBouncycastlePqcCryptoSaberSABERPrivateKeyParameters_) && (INCLUDE_ALL_OrgBouncycastlePqcCryptoSaberSABERPrivateKeyParameters || defined(INCLUDE_OrgBouncycastlePqcCryptoSaberSABERPrivateKeyParameters))
#define OrgBouncycastlePqcCryptoSaberSABERPrivateKeyParameters_

#define RESTRICT_OrgBouncycastlePqcCryptoSaberSABERKeyParameters 1
#define INCLUDE_OrgBouncycastlePqcCryptoSaberSABERKeyParameters 1
#include "org/bouncycastle/pqc/crypto/saber/SABERKeyParameters.h"

@class IOSByteArray;
@class OrgBouncycastlePqcCryptoSaberSABERParameters;

@interface OrgBouncycastlePqcCryptoSaberSABERPrivateKeyParameters : OrgBouncycastlePqcCryptoSaberSABERKeyParameters

#pragma mark Public

- (instancetype)initWithOrgBouncycastlePqcCryptoSaberSABERParameters:(OrgBouncycastlePqcCryptoSaberSABERParameters *)params
                                                       withByteArray:(IOSByteArray *)privateKey;

- (IOSByteArray *)getEncoded;

- (IOSByteArray *)getPrivateKey;

// Disallowed inherited constructors, do not use.

- (instancetype)initWithBoolean:(jboolean)arg0
withOrgBouncycastlePqcCryptoSaberSABERParameters:(OrgBouncycastlePqcCryptoSaberSABERParameters *)arg1 NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastlePqcCryptoSaberSABERPrivateKeyParameters)

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoSaberSABERPrivateKeyParameters_initWithOrgBouncycastlePqcCryptoSaberSABERParameters_withByteArray_(OrgBouncycastlePqcCryptoSaberSABERPrivateKeyParameters *self, OrgBouncycastlePqcCryptoSaberSABERParameters *params, IOSByteArray *privateKey);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoSaberSABERPrivateKeyParameters *new_OrgBouncycastlePqcCryptoSaberSABERPrivateKeyParameters_initWithOrgBouncycastlePqcCryptoSaberSABERParameters_withByteArray_(OrgBouncycastlePqcCryptoSaberSABERParameters *params, IOSByteArray *privateKey) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoSaberSABERPrivateKeyParameters *create_OrgBouncycastlePqcCryptoSaberSABERPrivateKeyParameters_initWithOrgBouncycastlePqcCryptoSaberSABERParameters_withByteArray_(OrgBouncycastlePqcCryptoSaberSABERParameters *params, IOSByteArray *privateKey);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcCryptoSaberSABERPrivateKeyParameters)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoSaberSABERPrivateKeyParameters")
