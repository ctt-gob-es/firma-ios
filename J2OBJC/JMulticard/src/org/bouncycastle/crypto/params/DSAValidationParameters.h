//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/crypto/params/DSAValidationParameters.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleCryptoParamsDSAValidationParameters")
#ifdef RESTRICT_OrgBouncycastleCryptoParamsDSAValidationParameters
#define INCLUDE_ALL_OrgBouncycastleCryptoParamsDSAValidationParameters 0
#else
#define INCLUDE_ALL_OrgBouncycastleCryptoParamsDSAValidationParameters 1
#endif
#undef RESTRICT_OrgBouncycastleCryptoParamsDSAValidationParameters

#if !defined (OrgBouncycastleCryptoParamsDSAValidationParameters_) && (INCLUDE_ALL_OrgBouncycastleCryptoParamsDSAValidationParameters || defined(INCLUDE_OrgBouncycastleCryptoParamsDSAValidationParameters))
#define OrgBouncycastleCryptoParamsDSAValidationParameters_

@class IOSByteArray;

@interface OrgBouncycastleCryptoParamsDSAValidationParameters : NSObject

#pragma mark Public

- (instancetype)initWithByteArray:(IOSByteArray *)seed
                          withInt:(jint)counter;

- (instancetype)initWithByteArray:(IOSByteArray *)seed
                          withInt:(jint)counter
                          withInt:(jint)usageIndex;

- (jboolean)isEqual:(id)o;

- (jint)getCounter;

- (IOSByteArray *)getSeed;

- (jint)getUsageIndex;

- (NSUInteger)hash;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleCryptoParamsDSAValidationParameters)

FOUNDATION_EXPORT void OrgBouncycastleCryptoParamsDSAValidationParameters_initWithByteArray_withInt_(OrgBouncycastleCryptoParamsDSAValidationParameters *self, IOSByteArray *seed, jint counter);

FOUNDATION_EXPORT OrgBouncycastleCryptoParamsDSAValidationParameters *new_OrgBouncycastleCryptoParamsDSAValidationParameters_initWithByteArray_withInt_(IOSByteArray *seed, jint counter) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleCryptoParamsDSAValidationParameters *create_OrgBouncycastleCryptoParamsDSAValidationParameters_initWithByteArray_withInt_(IOSByteArray *seed, jint counter);

FOUNDATION_EXPORT void OrgBouncycastleCryptoParamsDSAValidationParameters_initWithByteArray_withInt_withInt_(OrgBouncycastleCryptoParamsDSAValidationParameters *self, IOSByteArray *seed, jint counter, jint usageIndex);

FOUNDATION_EXPORT OrgBouncycastleCryptoParamsDSAValidationParameters *new_OrgBouncycastleCryptoParamsDSAValidationParameters_initWithByteArray_withInt_withInt_(IOSByteArray *seed, jint counter, jint usageIndex) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleCryptoParamsDSAValidationParameters *create_OrgBouncycastleCryptoParamsDSAValidationParameters_initWithByteArray_withInt_withInt_(IOSByteArray *seed, jint counter, jint usageIndex);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleCryptoParamsDSAValidationParameters)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleCryptoParamsDSAValidationParameters")
