//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/newhope/NewHope.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoNewhopeNewHope")
#ifdef RESTRICT_OrgBouncycastlePqcCryptoNewhopeNewHope
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoNewhopeNewHope 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoNewhopeNewHope 1
#endif
#undef RESTRICT_OrgBouncycastlePqcCryptoNewhopeNewHope

#if !defined (OrgBouncycastlePqcCryptoNewhopeNewHope_) && (INCLUDE_ALL_OrgBouncycastlePqcCryptoNewhopeNewHope || defined(INCLUDE_OrgBouncycastlePqcCryptoNewhopeNewHope))
#define OrgBouncycastlePqcCryptoNewhopeNewHope_

@class IOSByteArray;
@class IOSShortArray;
@class JavaSecuritySecureRandom;

/*!
 @brief This implementation is based heavily on the C reference implementation from https://cryptojedi.org/crypto/index.shtml.
 */
@interface OrgBouncycastlePqcCryptoNewhopeNewHope : NSObject

#pragma mark Public

+ (void)keygenWithJavaSecuritySecureRandom:(JavaSecuritySecureRandom *)rand
                             withByteArray:(IOSByteArray *)send
                            withShortArray:(IOSShortArray *)sk;

+ (void)sharedAWithByteArray:(IOSByteArray *)sharedKey
              withShortArray:(IOSShortArray *)sk
               withByteArray:(IOSByteArray *)received;

+ (void)sharedBWithJavaSecuritySecureRandom:(JavaSecuritySecureRandom *)rand
                              withByteArray:(IOSByteArray *)sharedKey
                              withByteArray:(IOSByteArray *)send
                              withByteArray:(IOSByteArray *)received;

#pragma mark Package-Private

- (instancetype)initPackagePrivate;

+ (void)decodeAWithShortArray:(IOSShortArray *)pk
                withByteArray:(IOSByteArray *)seed
                withByteArray:(IOSByteArray *)r;

+ (void)decodeBWithShortArray:(IOSShortArray *)b
               withShortArray:(IOSShortArray *)c
                withByteArray:(IOSByteArray *)r;

+ (void)encodeAWithByteArray:(IOSByteArray *)r
              withShortArray:(IOSShortArray *)pk
               withByteArray:(IOSByteArray *)seed;

+ (void)encodeBWithByteArray:(IOSByteArray *)r
              withShortArray:(IOSShortArray *)b
              withShortArray:(IOSShortArray *)c;

+ (void)generateAWithShortArray:(IOSShortArray *)a
                  withByteArray:(IOSByteArray *)seed;

+ (void)sha3WithByteArray:(IOSByteArray *)sharedKey;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastlePqcCryptoNewhopeNewHope)

inline jint OrgBouncycastlePqcCryptoNewhopeNewHope_get_AGREEMENT_SIZE(void);
#define OrgBouncycastlePqcCryptoNewhopeNewHope_AGREEMENT_SIZE 32
J2OBJC_STATIC_FIELD_CONSTANT(OrgBouncycastlePqcCryptoNewhopeNewHope, AGREEMENT_SIZE, jint)

inline jint OrgBouncycastlePqcCryptoNewhopeNewHope_get_POLY_SIZE(void);
#define OrgBouncycastlePqcCryptoNewhopeNewHope_POLY_SIZE 1024
J2OBJC_STATIC_FIELD_CONSTANT(OrgBouncycastlePqcCryptoNewhopeNewHope, POLY_SIZE, jint)

inline jint OrgBouncycastlePqcCryptoNewhopeNewHope_get_SENDA_BYTES(void);
#define OrgBouncycastlePqcCryptoNewhopeNewHope_SENDA_BYTES 1824
J2OBJC_STATIC_FIELD_CONSTANT(OrgBouncycastlePqcCryptoNewhopeNewHope, SENDA_BYTES, jint)

inline jint OrgBouncycastlePqcCryptoNewhopeNewHope_get_SENDB_BYTES(void);
#define OrgBouncycastlePqcCryptoNewhopeNewHope_SENDB_BYTES 2048
J2OBJC_STATIC_FIELD_CONSTANT(OrgBouncycastlePqcCryptoNewhopeNewHope, SENDB_BYTES, jint)

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoNewhopeNewHope_initPackagePrivate(OrgBouncycastlePqcCryptoNewhopeNewHope *self);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoNewhopeNewHope *new_OrgBouncycastlePqcCryptoNewhopeNewHope_initPackagePrivate(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoNewhopeNewHope *create_OrgBouncycastlePqcCryptoNewhopeNewHope_initPackagePrivate(void);

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoNewhopeNewHope_keygenWithJavaSecuritySecureRandom_withByteArray_withShortArray_(JavaSecuritySecureRandom *rand, IOSByteArray *send, IOSShortArray *sk);

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoNewhopeNewHope_sharedBWithJavaSecuritySecureRandom_withByteArray_withByteArray_withByteArray_(JavaSecuritySecureRandom *rand, IOSByteArray *sharedKey, IOSByteArray *send, IOSByteArray *received);

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoNewhopeNewHope_sharedAWithByteArray_withShortArray_withByteArray_(IOSByteArray *sharedKey, IOSShortArray *sk, IOSByteArray *received);

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoNewhopeNewHope_decodeAWithShortArray_withByteArray_withByteArray_(IOSShortArray *pk, IOSByteArray *seed, IOSByteArray *r);

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoNewhopeNewHope_decodeBWithShortArray_withShortArray_withByteArray_(IOSShortArray *b, IOSShortArray *c, IOSByteArray *r);

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoNewhopeNewHope_encodeAWithByteArray_withShortArray_withByteArray_(IOSByteArray *r, IOSShortArray *pk, IOSByteArray *seed);

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoNewhopeNewHope_encodeBWithByteArray_withShortArray_withShortArray_(IOSByteArray *r, IOSShortArray *b, IOSShortArray *c);

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoNewhopeNewHope_generateAWithShortArray_withByteArray_(IOSShortArray *a, IOSByteArray *seed);

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoNewhopeNewHope_sha3WithByteArray_(IOSByteArray *sharedKey);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcCryptoNewhopeNewHope)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoNewhopeNewHope")
