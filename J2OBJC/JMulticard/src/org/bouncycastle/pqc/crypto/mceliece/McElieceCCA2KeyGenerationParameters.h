//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/mceliece/McElieceCCA2KeyGenerationParameters.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2KeyGenerationParameters")
#ifdef RESTRICT_OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2KeyGenerationParameters
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2KeyGenerationParameters 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2KeyGenerationParameters 1
#endif
#undef RESTRICT_OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2KeyGenerationParameters

#if !defined (OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2KeyGenerationParameters_) && (INCLUDE_ALL_OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2KeyGenerationParameters || defined(INCLUDE_OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2KeyGenerationParameters))
#define OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2KeyGenerationParameters_

#define RESTRICT_OrgBouncycastleCryptoKeyGenerationParameters 1
#define INCLUDE_OrgBouncycastleCryptoKeyGenerationParameters 1
#include "org/bouncycastle/crypto/KeyGenerationParameters.h"

@class JavaSecuritySecureRandom;
@class OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2Parameters;

@interface OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2KeyGenerationParameters : OrgBouncycastleCryptoKeyGenerationParameters

#pragma mark Public

- (instancetype)initWithJavaSecuritySecureRandom:(JavaSecuritySecureRandom *)random
withOrgBouncycastlePqcCryptoMcelieceMcElieceCCA2Parameters:(OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2Parameters *)params;

- (OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2Parameters *)getParameters;

// Disallowed inherited constructors, do not use.

- (instancetype)initWithJavaSecuritySecureRandom:(JavaSecuritySecureRandom *)arg0
                                         withInt:(jint)arg1 NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2KeyGenerationParameters)

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2KeyGenerationParameters_initWithJavaSecuritySecureRandom_withOrgBouncycastlePqcCryptoMcelieceMcElieceCCA2Parameters_(OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2KeyGenerationParameters *self, JavaSecuritySecureRandom *random, OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2Parameters *params);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2KeyGenerationParameters *new_OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2KeyGenerationParameters_initWithJavaSecuritySecureRandom_withOrgBouncycastlePqcCryptoMcelieceMcElieceCCA2Parameters_(JavaSecuritySecureRandom *random, OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2Parameters *params) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2KeyGenerationParameters *create_OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2KeyGenerationParameters_initWithJavaSecuritySecureRandom_withOrgBouncycastlePqcCryptoMcelieceMcElieceCCA2Parameters_(JavaSecuritySecureRandom *random, OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2Parameters *params);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2KeyGenerationParameters)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoMcelieceMcElieceCCA2KeyGenerationParameters")
