//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/crypto/params/AsymmetricKeyParameter.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleCryptoParamsAsymmetricKeyParameter")
#ifdef RESTRICT_OrgBouncycastleCryptoParamsAsymmetricKeyParameter
#define INCLUDE_ALL_OrgBouncycastleCryptoParamsAsymmetricKeyParameter 0
#else
#define INCLUDE_ALL_OrgBouncycastleCryptoParamsAsymmetricKeyParameter 1
#endif
#undef RESTRICT_OrgBouncycastleCryptoParamsAsymmetricKeyParameter

#if !defined (OrgBouncycastleCryptoParamsAsymmetricKeyParameter_) && (INCLUDE_ALL_OrgBouncycastleCryptoParamsAsymmetricKeyParameter || defined(INCLUDE_OrgBouncycastleCryptoParamsAsymmetricKeyParameter))
#define OrgBouncycastleCryptoParamsAsymmetricKeyParameter_

#define RESTRICT_OrgBouncycastleCryptoCipherParameters 1
#define INCLUDE_OrgBouncycastleCryptoCipherParameters 1
#include "org/bouncycastle/crypto/CipherParameters.h"

@interface OrgBouncycastleCryptoParamsAsymmetricKeyParameter : NSObject < OrgBouncycastleCryptoCipherParameters > {
 @public
  jboolean privateKey_;
}

#pragma mark Public

- (instancetype)initWithBoolean:(jboolean)privateKey;

- (jboolean)isPrivate;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleCryptoParamsAsymmetricKeyParameter)

FOUNDATION_EXPORT void OrgBouncycastleCryptoParamsAsymmetricKeyParameter_initWithBoolean_(OrgBouncycastleCryptoParamsAsymmetricKeyParameter *self, jboolean privateKey);

FOUNDATION_EXPORT OrgBouncycastleCryptoParamsAsymmetricKeyParameter *new_OrgBouncycastleCryptoParamsAsymmetricKeyParameter_initWithBoolean_(jboolean privateKey) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleCryptoParamsAsymmetricKeyParameter *create_OrgBouncycastleCryptoParamsAsymmetricKeyParameter_initWithBoolean_(jboolean privateKey);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleCryptoParamsAsymmetricKeyParameter)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleCryptoParamsAsymmetricKeyParameter")
