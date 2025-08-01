//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/math/ec/custom/sec/SecT239Field.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecT239Field")
#ifdef RESTRICT_OrgBouncycastleMathEcCustomSecSecT239Field
#define INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecT239Field 0
#else
#define INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecT239Field 1
#endif
#undef RESTRICT_OrgBouncycastleMathEcCustomSecSecT239Field

#if !defined (OrgBouncycastleMathEcCustomSecSecT239Field_) && (INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecT239Field || defined(INCLUDE_OrgBouncycastleMathEcCustomSecSecT239Field))
#define OrgBouncycastleMathEcCustomSecSecT239Field_

@class IOSLongArray;
@class JavaMathBigInteger;

@interface OrgBouncycastleMathEcCustomSecSecT239Field : NSObject

#pragma mark Public

- (instancetype)init;

+ (void)addWithLongArray:(IOSLongArray *)x
           withLongArray:(IOSLongArray *)y
           withLongArray:(IOSLongArray *)z;

+ (void)addExtWithLongArray:(IOSLongArray *)xx
              withLongArray:(IOSLongArray *)yy
              withLongArray:(IOSLongArray *)zz;

+ (void)addOneWithLongArray:(IOSLongArray *)x
              withLongArray:(IOSLongArray *)z;

+ (IOSLongArray *)fromBigIntegerWithJavaMathBigInteger:(JavaMathBigInteger *)x;

+ (void)halfTraceWithLongArray:(IOSLongArray *)x
                 withLongArray:(IOSLongArray *)z;

+ (void)invertWithLongArray:(IOSLongArray *)x
              withLongArray:(IOSLongArray *)z;

+ (void)multiplyWithLongArray:(IOSLongArray *)x
                withLongArray:(IOSLongArray *)y
                withLongArray:(IOSLongArray *)z;

+ (void)multiplyAddToExtWithLongArray:(IOSLongArray *)x
                        withLongArray:(IOSLongArray *)y
                        withLongArray:(IOSLongArray *)zz;

+ (void)reduceWithLongArray:(IOSLongArray *)xx
              withLongArray:(IOSLongArray *)z;

+ (void)reduce17WithLongArray:(IOSLongArray *)z
                      withInt:(jint)zOff;

+ (void)sqrtWithLongArray:(IOSLongArray *)x
            withLongArray:(IOSLongArray *)z;

+ (void)squareWithLongArray:(IOSLongArray *)x
              withLongArray:(IOSLongArray *)z;

+ (void)squareAddToExtWithLongArray:(IOSLongArray *)x
                      withLongArray:(IOSLongArray *)zz;

+ (void)squareNWithLongArray:(IOSLongArray *)x
                     withInt:(jint)n
               withLongArray:(IOSLongArray *)z;

+ (jint)traceWithLongArray:(IOSLongArray *)x;

#pragma mark Protected

+ (void)implCompactExtWithLongArray:(IOSLongArray *)zz;

+ (void)implExpandWithLongArray:(IOSLongArray *)x
                  withLongArray:(IOSLongArray *)z;

+ (void)implMultiplyWithLongArray:(IOSLongArray *)x
                    withLongArray:(IOSLongArray *)y
                    withLongArray:(IOSLongArray *)zz;

+ (void)implMulwAccWithLongArray:(IOSLongArray *)u
                        withLong:(jlong)x
                        withLong:(jlong)y
                   withLongArray:(IOSLongArray *)z
                         withInt:(jint)zOff;

+ (void)implSquareWithLongArray:(IOSLongArray *)x
                  withLongArray:(IOSLongArray *)zz;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleMathEcCustomSecSecT239Field)

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT239Field_init(OrgBouncycastleMathEcCustomSecSecT239Field *self);

FOUNDATION_EXPORT OrgBouncycastleMathEcCustomSecSecT239Field *new_OrgBouncycastleMathEcCustomSecSecT239Field_init(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleMathEcCustomSecSecT239Field *create_OrgBouncycastleMathEcCustomSecSecT239Field_init(void);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT239Field_addWithLongArray_withLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *y, IOSLongArray *z);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT239Field_addExtWithLongArray_withLongArray_withLongArray_(IOSLongArray *xx, IOSLongArray *yy, IOSLongArray *zz);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT239Field_addOneWithLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *z);

FOUNDATION_EXPORT IOSLongArray *OrgBouncycastleMathEcCustomSecSecT239Field_fromBigIntegerWithJavaMathBigInteger_(JavaMathBigInteger *x);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT239Field_halfTraceWithLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *z);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT239Field_invertWithLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *z);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT239Field_multiplyWithLongArray_withLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *y, IOSLongArray *z);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT239Field_multiplyAddToExtWithLongArray_withLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *y, IOSLongArray *zz);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT239Field_reduceWithLongArray_withLongArray_(IOSLongArray *xx, IOSLongArray *z);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT239Field_reduce17WithLongArray_withInt_(IOSLongArray *z, jint zOff);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT239Field_sqrtWithLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *z);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT239Field_squareWithLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *z);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT239Field_squareAddToExtWithLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *zz);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT239Field_squareNWithLongArray_withInt_withLongArray_(IOSLongArray *x, jint n, IOSLongArray *z);

FOUNDATION_EXPORT jint OrgBouncycastleMathEcCustomSecSecT239Field_traceWithLongArray_(IOSLongArray *x);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT239Field_implCompactExtWithLongArray_(IOSLongArray *zz);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT239Field_implExpandWithLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *z);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT239Field_implMultiplyWithLongArray_withLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *y, IOSLongArray *zz);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT239Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(IOSLongArray *u, jlong x, jlong y, IOSLongArray *z, jint zOff);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT239Field_implSquareWithLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *zz);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathEcCustomSecSecT239Field)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecT239Field")
