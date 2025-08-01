//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/util/Pack.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleUtilPack")
#ifdef RESTRICT_OrgBouncycastleUtilPack
#define INCLUDE_ALL_OrgBouncycastleUtilPack 0
#else
#define INCLUDE_ALL_OrgBouncycastleUtilPack 1
#endif
#undef RESTRICT_OrgBouncycastleUtilPack

#if !defined (OrgBouncycastleUtilPack_) && (INCLUDE_ALL_OrgBouncycastleUtilPack || defined(INCLUDE_OrgBouncycastleUtilPack))
#define OrgBouncycastleUtilPack_

@class IOSByteArray;
@class IOSIntArray;
@class IOSLongArray;

/*!
 @brief Utility methods for converting byte arrays into ints and longs, and back again.
 */
@interface OrgBouncycastleUtilPack : NSObject

#pragma mark Public

- (instancetype)init;

+ (jint)bigEndianToIntWithByteArray:(IOSByteArray *)bs
                            withInt:(jint)off;

+ (void)bigEndianToIntWithByteArray:(IOSByteArray *)bs
                            withInt:(jint)off
                       withIntArray:(IOSIntArray *)ns;

+ (void)bigEndianToIntWithByteArray:(IOSByteArray *)bs
                            withInt:(jint)off
                       withIntArray:(IOSIntArray *)ns
                            withInt:(jint)nsOff
                            withInt:(jint)nsLen;

+ (jlong)bigEndianToLongWithByteArray:(IOSByteArray *)bs
                              withInt:(jint)off;

+ (void)bigEndianToLongWithByteArray:(IOSByteArray *)bs
                             withInt:(jint)off
                       withLongArray:(IOSLongArray *)ns;

+ (void)bigEndianToLongWithByteArray:(IOSByteArray *)bs
                             withInt:(jint)bsOff
                       withLongArray:(IOSLongArray *)ns
                             withInt:(jint)nsOff
                             withInt:(jint)nsLen;

+ (jshort)bigEndianToShortWithByteArray:(IOSByteArray *)bs
                                withInt:(jint)off;

+ (IOSByteArray *)intToBigEndianWithInt:(jint)n;

+ (void)intToBigEndianWithInt:(jint)n
                withByteArray:(IOSByteArray *)bs
                      withInt:(jint)off;

+ (IOSByteArray *)intToBigEndianWithIntArray:(IOSIntArray *)ns;

+ (void)intToBigEndianWithIntArray:(IOSIntArray *)ns
                     withByteArray:(IOSByteArray *)bs
                           withInt:(jint)off;

+ (void)intToBigEndianWithIntArray:(IOSIntArray *)ns
                           withInt:(jint)nsOff
                           withInt:(jint)nsLen
                     withByteArray:(IOSByteArray *)bs
                           withInt:(jint)bsOff;

+ (IOSByteArray *)intToLittleEndianWithInt:(jint)n;

+ (void)intToLittleEndianWithInt:(jint)n
                   withByteArray:(IOSByteArray *)bs
                         withInt:(jint)off;

+ (IOSByteArray *)intToLittleEndianWithIntArray:(IOSIntArray *)ns;

+ (void)intToLittleEndianWithIntArray:(IOSIntArray *)ns
                        withByteArray:(IOSByteArray *)bs
                              withInt:(jint)off;

+ (void)intToLittleEndianWithIntArray:(IOSIntArray *)ns
                              withInt:(jint)nsOff
                              withInt:(jint)nsLen
                        withByteArray:(IOSByteArray *)bs
                              withInt:(jint)bsOff;

+ (jint)littleEndianToIntWithByteArray:(IOSByteArray *)bs
                               withInt:(jint)off;

+ (IOSIntArray *)littleEndianToIntWithByteArray:(IOSByteArray *)bs
                                        withInt:(jint)off
                                        withInt:(jint)count;

+ (void)littleEndianToIntWithByteArray:(IOSByteArray *)bs
                               withInt:(jint)off
                          withIntArray:(IOSIntArray *)ns;

+ (void)littleEndianToIntWithByteArray:(IOSByteArray *)bs
                               withInt:(jint)bOff
                          withIntArray:(IOSIntArray *)ns
                               withInt:(jint)nOff
                               withInt:(jint)count;

+ (jlong)littleEndianToLongWithByteArray:(IOSByteArray *)bs
                                 withInt:(jint)off;

+ (void)littleEndianToLongWithByteArray:(IOSByteArray *)bs
                                withInt:(jint)off
                          withLongArray:(IOSLongArray *)ns;

+ (void)littleEndianToLongWithByteArray:(IOSByteArray *)bs
                                withInt:(jint)bsOff
                          withLongArray:(IOSLongArray *)ns
                                withInt:(jint)nsOff
                                withInt:(jint)nsLen;

+ (jshort)littleEndianToShortWithByteArray:(IOSByteArray *)bs
                                   withInt:(jint)off;

+ (IOSByteArray *)longToBigEndianWithLong:(jlong)n;

+ (void)longToBigEndianWithLong:(jlong)n
                  withByteArray:(IOSByteArray *)bs
                        withInt:(jint)off;

/*!
 @param value The number
 @param bs The target.
 @param off Position in target to start.
 @param bytes number of bytes to write.
 */
+ (void)longToBigEndianWithLong:(jlong)value
                  withByteArray:(IOSByteArray *)bs
                        withInt:(jint)off
                        withInt:(jint)bytes;

+ (IOSByteArray *)longToBigEndianWithLongArray:(IOSLongArray *)ns;

+ (void)longToBigEndianWithLongArray:(IOSLongArray *)ns
                       withByteArray:(IOSByteArray *)bs
                             withInt:(jint)off;

+ (void)longToBigEndianWithLongArray:(IOSLongArray *)ns
                             withInt:(jint)nsOff
                             withInt:(jint)nsLen
                       withByteArray:(IOSByteArray *)bs
                             withInt:(jint)bsOff;

+ (IOSByteArray *)longToLittleEndianWithLong:(jlong)n;

+ (void)longToLittleEndianWithLong:(jlong)n
                     withByteArray:(IOSByteArray *)bs
                           withInt:(jint)off;

+ (IOSByteArray *)longToLittleEndianWithLongArray:(IOSLongArray *)ns;

+ (void)longToLittleEndianWithLongArray:(IOSLongArray *)ns
                          withByteArray:(IOSByteArray *)bs
                                withInt:(jint)off;

+ (void)longToLittleEndianWithLongArray:(IOSLongArray *)ns
                                withInt:(jint)nsOff
                                withInt:(jint)nsLen
                          withByteArray:(IOSByteArray *)bs
                                withInt:(jint)bsOff;

+ (IOSByteArray *)shortToBigEndianWithShort:(jshort)n;

+ (void)shortToBigEndianWithShort:(jshort)n
                    withByteArray:(IOSByteArray *)bs
                          withInt:(jint)off;

+ (IOSByteArray *)shortToLittleEndianWithShort:(jshort)n;

+ (void)shortToLittleEndianWithShort:(jshort)n
                       withByteArray:(IOSByteArray *)bs
                             withInt:(jint)off;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleUtilPack)

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_init(OrgBouncycastleUtilPack *self);

FOUNDATION_EXPORT jshort OrgBouncycastleUtilPack_bigEndianToShortWithByteArray_withInt_(IOSByteArray *bs, jint off);

FOUNDATION_EXPORT jint OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(IOSByteArray *bs, jint off);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_withIntArray_(IOSByteArray *bs, jint off, IOSIntArray *ns);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_withIntArray_withInt_withInt_(IOSByteArray *bs, jint off, IOSIntArray *ns, jint nsOff, jint nsLen);

FOUNDATION_EXPORT IOSByteArray *OrgBouncycastleUtilPack_intToBigEndianWithInt_(jint n);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(jint n, IOSByteArray *bs, jint off);

FOUNDATION_EXPORT IOSByteArray *OrgBouncycastleUtilPack_intToBigEndianWithIntArray_(IOSIntArray *ns);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_intToBigEndianWithIntArray_withByteArray_withInt_(IOSIntArray *ns, IOSByteArray *bs, jint off);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_intToBigEndianWithIntArray_withInt_withInt_withByteArray_withInt_(IOSIntArray *ns, jint nsOff, jint nsLen, IOSByteArray *bs, jint bsOff);

FOUNDATION_EXPORT jlong OrgBouncycastleUtilPack_bigEndianToLongWithByteArray_withInt_(IOSByteArray *bs, jint off);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_bigEndianToLongWithByteArray_withInt_withLongArray_(IOSByteArray *bs, jint off, IOSLongArray *ns);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_bigEndianToLongWithByteArray_withInt_withLongArray_withInt_withInt_(IOSByteArray *bs, jint bsOff, IOSLongArray *ns, jint nsOff, jint nsLen);

FOUNDATION_EXPORT IOSByteArray *OrgBouncycastleUtilPack_longToBigEndianWithLong_(jlong n);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_longToBigEndianWithLong_withByteArray_withInt_(jlong n, IOSByteArray *bs, jint off);

FOUNDATION_EXPORT IOSByteArray *OrgBouncycastleUtilPack_longToBigEndianWithLongArray_(IOSLongArray *ns);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_longToBigEndianWithLongArray_withByteArray_withInt_(IOSLongArray *ns, IOSByteArray *bs, jint off);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_longToBigEndianWithLongArray_withInt_withInt_withByteArray_withInt_(IOSLongArray *ns, jint nsOff, jint nsLen, IOSByteArray *bs, jint bsOff);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_longToBigEndianWithLong_withByteArray_withInt_withInt_(jlong value, IOSByteArray *bs, jint off, jint bytes);

FOUNDATION_EXPORT jshort OrgBouncycastleUtilPack_littleEndianToShortWithByteArray_withInt_(IOSByteArray *bs, jint off);

FOUNDATION_EXPORT jint OrgBouncycastleUtilPack_littleEndianToIntWithByteArray_withInt_(IOSByteArray *bs, jint off);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_littleEndianToIntWithByteArray_withInt_withIntArray_(IOSByteArray *bs, jint off, IOSIntArray *ns);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_littleEndianToIntWithByteArray_withInt_withIntArray_withInt_withInt_(IOSByteArray *bs, jint bOff, IOSIntArray *ns, jint nOff, jint count);

FOUNDATION_EXPORT IOSIntArray *OrgBouncycastleUtilPack_littleEndianToIntWithByteArray_withInt_withInt_(IOSByteArray *bs, jint off, jint count);

FOUNDATION_EXPORT IOSByteArray *OrgBouncycastleUtilPack_shortToLittleEndianWithShort_(jshort n);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_shortToLittleEndianWithShort_withByteArray_withInt_(jshort n, IOSByteArray *bs, jint off);

FOUNDATION_EXPORT IOSByteArray *OrgBouncycastleUtilPack_shortToBigEndianWithShort_(jshort n);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_shortToBigEndianWithShort_withByteArray_withInt_(jshort n, IOSByteArray *bs, jint off);

FOUNDATION_EXPORT IOSByteArray *OrgBouncycastleUtilPack_intToLittleEndianWithInt_(jint n);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_intToLittleEndianWithInt_withByteArray_withInt_(jint n, IOSByteArray *bs, jint off);

FOUNDATION_EXPORT IOSByteArray *OrgBouncycastleUtilPack_intToLittleEndianWithIntArray_(IOSIntArray *ns);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_intToLittleEndianWithIntArray_withByteArray_withInt_(IOSIntArray *ns, IOSByteArray *bs, jint off);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_intToLittleEndianWithIntArray_withInt_withInt_withByteArray_withInt_(IOSIntArray *ns, jint nsOff, jint nsLen, IOSByteArray *bs, jint bsOff);

FOUNDATION_EXPORT jlong OrgBouncycastleUtilPack_littleEndianToLongWithByteArray_withInt_(IOSByteArray *bs, jint off);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_littleEndianToLongWithByteArray_withInt_withLongArray_(IOSByteArray *bs, jint off, IOSLongArray *ns);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_littleEndianToLongWithByteArray_withInt_withLongArray_withInt_withInt_(IOSByteArray *bs, jint bsOff, IOSLongArray *ns, jint nsOff, jint nsLen);

FOUNDATION_EXPORT IOSByteArray *OrgBouncycastleUtilPack_longToLittleEndianWithLong_(jlong n);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_longToLittleEndianWithLong_withByteArray_withInt_(jlong n, IOSByteArray *bs, jint off);

FOUNDATION_EXPORT IOSByteArray *OrgBouncycastleUtilPack_longToLittleEndianWithLongArray_(IOSLongArray *ns);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_longToLittleEndianWithLongArray_withByteArray_withInt_(IOSLongArray *ns, IOSByteArray *bs, jint off);

FOUNDATION_EXPORT void OrgBouncycastleUtilPack_longToLittleEndianWithLongArray_withInt_withInt_withByteArray_withInt_(IOSLongArray *ns, jint nsOff, jint nsLen, IOSByteArray *bs, jint bsOff);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleUtilPack)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleUtilPack")
