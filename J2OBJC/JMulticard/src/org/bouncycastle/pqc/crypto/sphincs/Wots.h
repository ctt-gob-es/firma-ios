//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/sphincs/Wots.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoSphincsWots")
#ifdef RESTRICT_OrgBouncycastlePqcCryptoSphincsWots
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoSphincsWots 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoSphincsWots 1
#endif
#undef RESTRICT_OrgBouncycastlePqcCryptoSphincsWots

#if !defined (OrgBouncycastlePqcCryptoSphincsWots_) && (INCLUDE_ALL_OrgBouncycastlePqcCryptoSphincsWots || defined(INCLUDE_OrgBouncycastlePqcCryptoSphincsWots))
#define OrgBouncycastlePqcCryptoSphincsWots_

@class IOSByteArray;
@class OrgBouncycastlePqcCryptoSphincsHashFunctions;

@interface OrgBouncycastlePqcCryptoSphincsWots : NSObject

#pragma mark Package-Private

- (instancetype)initPackagePrivate;

+ (void)expand_seedWithByteArray:(IOSByteArray *)outseeds
                         withInt:(jint)outOff
                   withByteArray:(IOSByteArray *)inseed
                         withInt:(jint)inOff;

+ (void)gen_chainWithOrgBouncycastlePqcCryptoSphincsHashFunctions:(OrgBouncycastlePqcCryptoSphincsHashFunctions *)hs
                                                    withByteArray:(IOSByteArray *)outArg
                                                          withInt:(jint)outOff
                                                    withByteArray:(IOSByteArray *)seed
                                                          withInt:(jint)seedOff
                                                    withByteArray:(IOSByteArray *)masks
                                                          withInt:(jint)masksOff
                                                          withInt:(jint)chainlen;

- (void)wots_pkgenWithOrgBouncycastlePqcCryptoSphincsHashFunctions:(OrgBouncycastlePqcCryptoSphincsHashFunctions *)hs
                                                     withByteArray:(IOSByteArray *)pk
                                                           withInt:(jint)pkOff
                                                     withByteArray:(IOSByteArray *)sk
                                                           withInt:(jint)skOff
                                                     withByteArray:(IOSByteArray *)masks
                                                           withInt:(jint)masksOff;

- (void)wots_signWithOrgBouncycastlePqcCryptoSphincsHashFunctions:(OrgBouncycastlePqcCryptoSphincsHashFunctions *)hs
                                                    withByteArray:(IOSByteArray *)sig
                                                          withInt:(jint)sigOff
                                                    withByteArray:(IOSByteArray *)msg
                                                    withByteArray:(IOSByteArray *)sk
                                                    withByteArray:(IOSByteArray *)masks;

- (void)wots_verifyWithOrgBouncycastlePqcCryptoSphincsHashFunctions:(OrgBouncycastlePqcCryptoSphincsHashFunctions *)hs
                                                      withByteArray:(IOSByteArray *)pk
                                                      withByteArray:(IOSByteArray *)sig
                                                            withInt:(jint)sigOff
                                                      withByteArray:(IOSByteArray *)msg
                                                      withByteArray:(IOSByteArray *)masks;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastlePqcCryptoSphincsWots)

inline jint OrgBouncycastlePqcCryptoSphincsWots_get_WOTS_LOGW(void);
#define OrgBouncycastlePqcCryptoSphincsWots_WOTS_LOGW 4
J2OBJC_STATIC_FIELD_CONSTANT(OrgBouncycastlePqcCryptoSphincsWots, WOTS_LOGW, jint)

inline jint OrgBouncycastlePqcCryptoSphincsWots_get_WOTS_W(void);
#define OrgBouncycastlePqcCryptoSphincsWots_WOTS_W 16
J2OBJC_STATIC_FIELD_CONSTANT(OrgBouncycastlePqcCryptoSphincsWots, WOTS_W, jint)

inline jint OrgBouncycastlePqcCryptoSphincsWots_get_WOTS_L1(void);
#define OrgBouncycastlePqcCryptoSphincsWots_WOTS_L1 64
J2OBJC_STATIC_FIELD_CONSTANT(OrgBouncycastlePqcCryptoSphincsWots, WOTS_L1, jint)

inline jint OrgBouncycastlePqcCryptoSphincsWots_get_WOTS_L(void);
#define OrgBouncycastlePqcCryptoSphincsWots_WOTS_L 67
J2OBJC_STATIC_FIELD_CONSTANT(OrgBouncycastlePqcCryptoSphincsWots, WOTS_L, jint)

inline jint OrgBouncycastlePqcCryptoSphincsWots_get_WOTS_LOG_L(void);
#define OrgBouncycastlePqcCryptoSphincsWots_WOTS_LOG_L 7
J2OBJC_STATIC_FIELD_CONSTANT(OrgBouncycastlePqcCryptoSphincsWots, WOTS_LOG_L, jint)

inline jint OrgBouncycastlePqcCryptoSphincsWots_get_WOTS_SIGBYTES(void);
#define OrgBouncycastlePqcCryptoSphincsWots_WOTS_SIGBYTES 2144
J2OBJC_STATIC_FIELD_CONSTANT(OrgBouncycastlePqcCryptoSphincsWots, WOTS_SIGBYTES, jint)

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoSphincsWots_initPackagePrivate(OrgBouncycastlePqcCryptoSphincsWots *self);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoSphincsWots *new_OrgBouncycastlePqcCryptoSphincsWots_initPackagePrivate(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoSphincsWots *create_OrgBouncycastlePqcCryptoSphincsWots_initPackagePrivate(void);

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoSphincsWots_expand_seedWithByteArray_withInt_withByteArray_withInt_(IOSByteArray *outseeds, jint outOff, IOSByteArray *inseed, jint inOff);

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoSphincsWots_gen_chainWithOrgBouncycastlePqcCryptoSphincsHashFunctions_withByteArray_withInt_withByteArray_withInt_withByteArray_withInt_withInt_(OrgBouncycastlePqcCryptoSphincsHashFunctions *hs, IOSByteArray *outArg, jint outOff, IOSByteArray *seed, jint seedOff, IOSByteArray *masks, jint masksOff, jint chainlen);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcCryptoSphincsWots)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoSphincsWots")
