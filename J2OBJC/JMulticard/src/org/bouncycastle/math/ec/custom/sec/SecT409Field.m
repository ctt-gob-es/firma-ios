//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/math/ec/custom/sec/SecT409Field.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/lang/IllegalStateException.h"
#include "java/math/BigInteger.h"
#include "org/bouncycastle/math/ec/custom/sec/SecT409Field.h"
#include "org/bouncycastle/math/raw/Interleave.h"
#include "org/bouncycastle/math/raw/Nat.h"
#include "org/bouncycastle/math/raw/Nat448.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/math/ec/custom/sec/SecT409Field must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastleMathEcCustomSecSecT409Field ()

+ (void)addToWithLongArray:(IOSLongArray *)x
             withLongArray:(IOSLongArray *)z;

@end

inline jlong OrgBouncycastleMathEcCustomSecSecT409Field_get_M25(void);
#define OrgBouncycastleMathEcCustomSecSecT409Field_M25 33554431LL
J2OBJC_STATIC_FIELD_CONSTANT(OrgBouncycastleMathEcCustomSecSecT409Field, M25, jlong)

inline jlong OrgBouncycastleMathEcCustomSecSecT409Field_get_M59(void);
#define OrgBouncycastleMathEcCustomSecSecT409Field_M59 576460752303423487LL
J2OBJC_STATIC_FIELD_CONSTANT(OrgBouncycastleMathEcCustomSecSecT409Field, M59, jlong)

__attribute__((unused)) static void OrgBouncycastleMathEcCustomSecSecT409Field_addToWithLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *z);

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/math/ec/custom/sec/SecT409Field.java"


#line 9
@implementation OrgBouncycastleMathEcCustomSecSecT409Field

J2OBJC_IGNORE_DESIGNATED_BEGIN

#line 9
- (instancetype)init {
  OrgBouncycastleMathEcCustomSecSecT409Field_init(self);
  return self;
}
J2OBJC_IGNORE_DESIGNATED_END


#line 14
+ (void)addWithLongArray:(IOSLongArray *)x
           withLongArray:(IOSLongArray *)y
           withLongArray:(IOSLongArray *)z {
  OrgBouncycastleMathEcCustomSecSecT409Field_addWithLongArray_withLongArray_withLongArray_(x, y, z);
}


#line 25
+ (void)addExtWithLongArray:(IOSLongArray *)xx
              withLongArray:(IOSLongArray *)yy
              withLongArray:(IOSLongArray *)zz {
  OrgBouncycastleMathEcCustomSecSecT409Field_addExtWithLongArray_withLongArray_withLongArray_(xx, yy, zz);
}


#line 33
+ (void)addOneWithLongArray:(IOSLongArray *)x
              withLongArray:(IOSLongArray *)z {
  OrgBouncycastleMathEcCustomSecSecT409Field_addOneWithLongArray_withLongArray_(x, z);
}


#line 44
+ (void)addToWithLongArray:(IOSLongArray *)x
             withLongArray:(IOSLongArray *)z {
  OrgBouncycastleMathEcCustomSecSecT409Field_addToWithLongArray_withLongArray_(x, z);
}


#line 55
+ (IOSLongArray *)fromBigIntegerWithJavaMathBigInteger:(JavaMathBigInteger *)x {
  return OrgBouncycastleMathEcCustomSecSecT409Field_fromBigIntegerWithJavaMathBigInteger_(x);
}


#line 60
+ (void)halfTraceWithLongArray:(IOSLongArray *)x
                 withLongArray:(IOSLongArray *)z {
  OrgBouncycastleMathEcCustomSecSecT409Field_halfTraceWithLongArray_withLongArray_(x, z);
}


#line 75
+ (void)invertWithLongArray:(IOSLongArray *)x
              withLongArray:(IOSLongArray *)z {
  OrgBouncycastleMathEcCustomSecSecT409Field_invertWithLongArray_withLongArray_(x, z);
}


#line 128
+ (void)multiplyWithLongArray:(IOSLongArray *)x
                withLongArray:(IOSLongArray *)y
                withLongArray:(IOSLongArray *)z {
  OrgBouncycastleMathEcCustomSecSecT409Field_multiplyWithLongArray_withLongArray_withLongArray_(x, y, z);
}


#line 135
+ (void)multiplyAddToExtWithLongArray:(IOSLongArray *)x
                        withLongArray:(IOSLongArray *)y
                        withLongArray:(IOSLongArray *)zz {
  OrgBouncycastleMathEcCustomSecSecT409Field_multiplyAddToExtWithLongArray_withLongArray_withLongArray_(x, y, zz);
}


#line 142
+ (void)reduceWithLongArray:(IOSLongArray *)xx
              withLongArray:(IOSLongArray *)z {
  OrgBouncycastleMathEcCustomSecSecT409Field_reduceWithLongArray_withLongArray_(xx, z);
}


#line 187
+ (void)reduce39WithLongArray:(IOSLongArray *)z
                      withInt:(jint)zOff {
  OrgBouncycastleMathEcCustomSecSecT409Field_reduce39WithLongArray_withInt_(z, zOff);
}


#line 195
+ (void)sqrtWithLongArray:(IOSLongArray *)x
            withLongArray:(IOSLongArray *)z {
  OrgBouncycastleMathEcCustomSecSecT409Field_sqrtWithLongArray_withLongArray_(x, z);
}


#line 225
+ (void)squareWithLongArray:(IOSLongArray *)x
              withLongArray:(IOSLongArray *)z {
  OrgBouncycastleMathEcCustomSecSecT409Field_squareWithLongArray_withLongArray_(x, z);
}


#line 232
+ (void)squareAddToExtWithLongArray:(IOSLongArray *)x
                      withLongArray:(IOSLongArray *)zz {
  OrgBouncycastleMathEcCustomSecSecT409Field_squareAddToExtWithLongArray_withLongArray_(x, zz);
}


#line 239
+ (void)squareNWithLongArray:(IOSLongArray *)x
                     withInt:(jint)n
               withLongArray:(IOSLongArray *)z {
  OrgBouncycastleMathEcCustomSecSecT409Field_squareNWithLongArray_withInt_withLongArray_(x, n, z);
}


#line 254
+ (jint)traceWithLongArray:(IOSLongArray *)x {
  return OrgBouncycastleMathEcCustomSecSecT409Field_traceWithLongArray_(x);
}


#line 260
+ (void)implCompactExtWithLongArray:(IOSLongArray *)zz {
  OrgBouncycastleMathEcCustomSecSecT409Field_implCompactExtWithLongArray_(zz);
}


#line 281
+ (void)implExpandWithLongArray:(IOSLongArray *)x
                  withLongArray:(IOSLongArray *)z {
  OrgBouncycastleMathEcCustomSecSecT409Field_implExpandWithLongArray_withLongArray_(x, z);
}


#line 293
+ (void)implMultiplyWithLongArray:(IOSLongArray *)x
                    withLongArray:(IOSLongArray *)y
                    withLongArray:(IOSLongArray *)zz {
  OrgBouncycastleMathEcCustomSecSecT409Field_implMultiplyWithLongArray_withLongArray_withLongArray_(x, y, zz);
}


#line 357
+ (void)implMulwAccWithLongArray:(IOSLongArray *)u
                        withLong:(jlong)x
                        withLong:(jlong)y
                   withLongArray:(IOSLongArray *)z
                         withInt:(jint)zOff {
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, x, y, z, zOff);
}


#line 391
+ (void)implSquareWithLongArray:(IOSLongArray *)x
                  withLongArray:(IOSLongArray *)zz {
  OrgBouncycastleMathEcCustomSecSecT409Field_implSquareWithLongArray_withLongArray_(x, zz);
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "V", 0x9, 0, 1, -1, -1, -1, -1 },
    { NULL, "V", 0x9, 2, 1, -1, -1, -1, -1 },
    { NULL, "V", 0x9, 3, 4, -1, -1, -1, -1 },
    { NULL, "V", 0xa, 5, 4, -1, -1, -1, -1 },
    { NULL, "[J", 0x9, 6, 7, -1, -1, -1, -1 },
    { NULL, "V", 0x9, 8, 4, -1, -1, -1, -1 },
    { NULL, "V", 0x9, 9, 4, -1, -1, -1, -1 },
    { NULL, "V", 0x9, 10, 1, -1, -1, -1, -1 },
    { NULL, "V", 0x9, 11, 1, -1, -1, -1, -1 },
    { NULL, "V", 0x9, 12, 4, -1, -1, -1, -1 },
    { NULL, "V", 0x9, 13, 14, -1, -1, -1, -1 },
    { NULL, "V", 0x9, 15, 4, -1, -1, -1, -1 },
    { NULL, "V", 0x9, 16, 4, -1, -1, -1, -1 },
    { NULL, "V", 0x9, 17, 4, -1, -1, -1, -1 },
    { NULL, "V", 0x9, 18, 19, -1, -1, -1, -1 },
    { NULL, "I", 0x9, 20, 21, -1, -1, -1, -1 },
    { NULL, "V", 0xc, 22, 21, -1, -1, -1, -1 },
    { NULL, "V", 0xc, 23, 4, -1, -1, -1, -1 },
    { NULL, "V", 0xc, 24, 1, -1, -1, -1, -1 },
    { NULL, "V", 0xc, 25, 26, -1, -1, -1, -1 },
    { NULL, "V", 0xc, 27, 4, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(init);
  methods[1].selector = @selector(addWithLongArray:withLongArray:withLongArray:);
  methods[2].selector = @selector(addExtWithLongArray:withLongArray:withLongArray:);
  methods[3].selector = @selector(addOneWithLongArray:withLongArray:);
  methods[4].selector = @selector(addToWithLongArray:withLongArray:);
  methods[5].selector = @selector(fromBigIntegerWithJavaMathBigInteger:);
  methods[6].selector = @selector(halfTraceWithLongArray:withLongArray:);
  methods[7].selector = @selector(invertWithLongArray:withLongArray:);
  methods[8].selector = @selector(multiplyWithLongArray:withLongArray:withLongArray:);
  methods[9].selector = @selector(multiplyAddToExtWithLongArray:withLongArray:withLongArray:);
  methods[10].selector = @selector(reduceWithLongArray:withLongArray:);
  methods[11].selector = @selector(reduce39WithLongArray:withInt:);
  methods[12].selector = @selector(sqrtWithLongArray:withLongArray:);
  methods[13].selector = @selector(squareWithLongArray:withLongArray:);
  methods[14].selector = @selector(squareAddToExtWithLongArray:withLongArray:);
  methods[15].selector = @selector(squareNWithLongArray:withInt:withLongArray:);
  methods[16].selector = @selector(traceWithLongArray:);
  methods[17].selector = @selector(implCompactExtWithLongArray:);
  methods[18].selector = @selector(implExpandWithLongArray:withLongArray:);
  methods[19].selector = @selector(implMultiplyWithLongArray:withLongArray:withLongArray:);
  methods[20].selector = @selector(implMulwAccWithLongArray:withLong:withLong:withLongArray:withInt:);
  methods[21].selector = @selector(implSquareWithLongArray:withLongArray:);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "M25", "J", .constantValue.asLong = OrgBouncycastleMathEcCustomSecSecT409Field_M25, 0x1a, -1, -1, -1, -1 },
    { "M59", "J", .constantValue.asLong = OrgBouncycastleMathEcCustomSecSecT409Field_M59, 0x1a, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "add", "[J[J[J", "addExt", "addOne", "[J[J", "addTo", "fromBigInteger", "LJavaMathBigInteger;", "halfTrace", "invert", "multiply", "multiplyAddToExt", "reduce", "reduce39", "[JI", "sqrt", "square", "squareAddToExt", "squareN", "[JI[J", "trace", "[J", "implCompactExt", "implExpand", "implMultiply", "implMulwAcc", "[JJJ[JI", "implSquare" };
  static const J2ObjcClassInfo _OrgBouncycastleMathEcCustomSecSecT409Field = { "SecT409Field", "org.bouncycastle.math.ec.custom.sec", ptrTable, methods, fields, 7, 0x1, 22, 2, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleMathEcCustomSecSecT409Field;
}

@end


#line 9
void OrgBouncycastleMathEcCustomSecSecT409Field_init(OrgBouncycastleMathEcCustomSecSecT409Field *self) {
  NSObject_init(self);
}


#line 9
OrgBouncycastleMathEcCustomSecSecT409Field *new_OrgBouncycastleMathEcCustomSecSecT409Field_init() {
  J2OBJC_NEW_IMPL(OrgBouncycastleMathEcCustomSecSecT409Field, init)
}


#line 9
OrgBouncycastleMathEcCustomSecSecT409Field *create_OrgBouncycastleMathEcCustomSecSecT409Field_init() {
  J2OBJC_CREATE_IMPL(OrgBouncycastleMathEcCustomSecSecT409Field, init)
}


#line 14
void OrgBouncycastleMathEcCustomSecSecT409Field_addWithLongArray_withLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *y, IOSLongArray *z) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  *IOSLongArray_GetRef(nil_chk(z), 0) = IOSLongArray_Get(nil_chk(x), 0) ^ IOSLongArray_Get(nil_chk(y), 0);
  *IOSLongArray_GetRef(z, 1) = IOSLongArray_Get(x, 1) ^ IOSLongArray_Get(y, 1);
  *IOSLongArray_GetRef(z, 2) = IOSLongArray_Get(x, 2) ^ IOSLongArray_Get(y, 2);
  *IOSLongArray_GetRef(z, 3) = IOSLongArray_Get(x, 3) ^ IOSLongArray_Get(y, 3);
  *IOSLongArray_GetRef(z, 4) = IOSLongArray_Get(x, 4) ^ IOSLongArray_Get(y, 4);
  *IOSLongArray_GetRef(z, 5) = IOSLongArray_Get(x, 5) ^ IOSLongArray_Get(y, 5);
  *IOSLongArray_GetRef(z, 6) = IOSLongArray_Get(x, 6) ^ IOSLongArray_Get(y, 6);
}

void OrgBouncycastleMathEcCustomSecSecT409Field_addExtWithLongArray_withLongArray_withLongArray_(IOSLongArray *xx, IOSLongArray *yy, IOSLongArray *zz) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  for (jint i = 0; i < 13; ++i) {
    
#line 29
    *IOSLongArray_GetRef(nil_chk(zz), i) = IOSLongArray_Get(nil_chk(xx), i) ^ IOSLongArray_Get(nil_chk(yy), i);
  }
}


#line 33
void OrgBouncycastleMathEcCustomSecSecT409Field_addOneWithLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *z) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  *IOSLongArray_GetRef(nil_chk(z), 0) = IOSLongArray_Get(nil_chk(x), 0) ^ 1LL;
  *IOSLongArray_GetRef(z, 1) = IOSLongArray_Get(x, 1);
  *IOSLongArray_GetRef(z, 2) = IOSLongArray_Get(x, 2);
  *IOSLongArray_GetRef(z, 3) = IOSLongArray_Get(x, 3);
  *IOSLongArray_GetRef(z, 4) = IOSLongArray_Get(x, 4);
  *IOSLongArray_GetRef(z, 5) = IOSLongArray_Get(x, 5);
  *IOSLongArray_GetRef(z, 6) = IOSLongArray_Get(x, 6);
}

void OrgBouncycastleMathEcCustomSecSecT409Field_addToWithLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *z) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  *IOSLongArray_GetRef(nil_chk(z), 0) ^= IOSLongArray_Get(nil_chk(x), 0);
  *IOSLongArray_GetRef(z, 1) ^= IOSLongArray_Get(x, 1);
  *IOSLongArray_GetRef(z, 2) ^= IOSLongArray_Get(x, 2);
  *IOSLongArray_GetRef(z, 3) ^= IOSLongArray_Get(x, 3);
  *IOSLongArray_GetRef(z, 4) ^= IOSLongArray_Get(x, 4);
  *IOSLongArray_GetRef(z, 5) ^= IOSLongArray_Get(x, 5);
  *IOSLongArray_GetRef(z, 6) ^= IOSLongArray_Get(x, 6);
}

IOSLongArray *OrgBouncycastleMathEcCustomSecSecT409Field_fromBigIntegerWithJavaMathBigInteger_(JavaMathBigInteger *x) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  return OrgBouncycastleMathRawNat_fromBigInteger64WithInt_withJavaMathBigInteger_(409, x);
}

void OrgBouncycastleMathEcCustomSecSecT409Field_halfTraceWithLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *z) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  IOSLongArray *tt = OrgBouncycastleMathRawNat_create64WithInt_(13);
  
#line 64
  OrgBouncycastleMathRawNat448_copy64WithLongArray_withLongArray_(x, z);
  for (jint i = 1; i < 409; i += 2) {
    
#line 67
    OrgBouncycastleMathEcCustomSecSecT409Field_implSquareWithLongArray_withLongArray_(z, tt);
    OrgBouncycastleMathEcCustomSecSecT409Field_reduceWithLongArray_withLongArray_(tt, z);
    OrgBouncycastleMathEcCustomSecSecT409Field_implSquareWithLongArray_withLongArray_(z, tt);
    OrgBouncycastleMathEcCustomSecSecT409Field_reduceWithLongArray_withLongArray_(tt, z);
    OrgBouncycastleMathEcCustomSecSecT409Field_addToWithLongArray_withLongArray_(x, z);
  }
}


#line 75
void OrgBouncycastleMathEcCustomSecSecT409Field_invertWithLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *z) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  if (OrgBouncycastleMathRawNat448_isZero64WithLongArray_(x)) {
    
#line 79
    @throw new_JavaLangIllegalStateException_init();
  }
  
#line 84
  IOSLongArray *t0 = OrgBouncycastleMathRawNat448_create64();
  IOSLongArray *t1 = OrgBouncycastleMathRawNat448_create64();
  IOSLongArray *t2 = OrgBouncycastleMathRawNat448_create64();
  
#line 88
  OrgBouncycastleMathEcCustomSecSecT409Field_squareWithLongArray_withLongArray_(x, t0);
  
#line 91
  OrgBouncycastleMathEcCustomSecSecT409Field_squareNWithLongArray_withInt_withLongArray_(t0, 1, t1);
  OrgBouncycastleMathEcCustomSecSecT409Field_multiplyWithLongArray_withLongArray_withLongArray_(t0, t1, t0);
  OrgBouncycastleMathEcCustomSecSecT409Field_squareNWithLongArray_withInt_withLongArray_(t1, 1, t1);
  OrgBouncycastleMathEcCustomSecSecT409Field_multiplyWithLongArray_withLongArray_withLongArray_(t0, t1, t0);
  
#line 97
  OrgBouncycastleMathEcCustomSecSecT409Field_squareNWithLongArray_withInt_withLongArray_(t0, 3, t1);
  OrgBouncycastleMathEcCustomSecSecT409Field_multiplyWithLongArray_withLongArray_withLongArray_(t0, t1, t0);
  
#line 101
  OrgBouncycastleMathEcCustomSecSecT409Field_squareNWithLongArray_withInt_withLongArray_(t0, 6, t1);
  OrgBouncycastleMathEcCustomSecSecT409Field_multiplyWithLongArray_withLongArray_withLongArray_(t0, t1, t0);
  
#line 105
  OrgBouncycastleMathEcCustomSecSecT409Field_squareNWithLongArray_withInt_withLongArray_(t0, 12, t1);
  OrgBouncycastleMathEcCustomSecSecT409Field_multiplyWithLongArray_withLongArray_withLongArray_(t0, t1, t2);
  
#line 109
  OrgBouncycastleMathEcCustomSecSecT409Field_squareNWithLongArray_withInt_withLongArray_(t2, 24, t0);
  OrgBouncycastleMathEcCustomSecSecT409Field_squareNWithLongArray_withInt_withLongArray_(t0, 24, t1);
  OrgBouncycastleMathEcCustomSecSecT409Field_multiplyWithLongArray_withLongArray_withLongArray_(t0, t1, t0);
  
#line 114
  OrgBouncycastleMathEcCustomSecSecT409Field_squareNWithLongArray_withInt_withLongArray_(t0, 48, t1);
  OrgBouncycastleMathEcCustomSecSecT409Field_multiplyWithLongArray_withLongArray_withLongArray_(t0, t1, t0);
  
#line 118
  OrgBouncycastleMathEcCustomSecSecT409Field_squareNWithLongArray_withInt_withLongArray_(t0, 96, t1);
  OrgBouncycastleMathEcCustomSecSecT409Field_multiplyWithLongArray_withLongArray_withLongArray_(t0, t1, t0);
  
#line 122
  OrgBouncycastleMathEcCustomSecSecT409Field_squareNWithLongArray_withInt_withLongArray_(t0, 192, t1);
  OrgBouncycastleMathEcCustomSecSecT409Field_multiplyWithLongArray_withLongArray_withLongArray_(t0, t1, t0);
  
#line 125
  OrgBouncycastleMathEcCustomSecSecT409Field_multiplyWithLongArray_withLongArray_withLongArray_(t0, t2, z);
}


#line 128
void OrgBouncycastleMathEcCustomSecSecT409Field_multiplyWithLongArray_withLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *y, IOSLongArray *z) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  IOSLongArray *tt = OrgBouncycastleMathRawNat448_createExt64();
  OrgBouncycastleMathEcCustomSecSecT409Field_implMultiplyWithLongArray_withLongArray_withLongArray_(x, y, tt);
  OrgBouncycastleMathEcCustomSecSecT409Field_reduceWithLongArray_withLongArray_(tt, z);
}

void OrgBouncycastleMathEcCustomSecSecT409Field_multiplyAddToExtWithLongArray_withLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *y, IOSLongArray *zz) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  IOSLongArray *tt = OrgBouncycastleMathRawNat448_createExt64();
  OrgBouncycastleMathEcCustomSecSecT409Field_implMultiplyWithLongArray_withLongArray_withLongArray_(x, y, tt);
  OrgBouncycastleMathEcCustomSecSecT409Field_addExtWithLongArray_withLongArray_withLongArray_(zz, tt, zz);
}

void OrgBouncycastleMathEcCustomSecSecT409Field_reduceWithLongArray_withLongArray_(IOSLongArray *xx, IOSLongArray *z) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  jlong x00 = IOSLongArray_Get(nil_chk(xx), 0);
  
#line 144
  jlong x01 = IOSLongArray_Get(xx, 1);
  
#line 144
  jlong x02 = IOSLongArray_Get(xx, 2);
  
#line 144
  jlong x03 = IOSLongArray_Get(xx, 3);
  jlong x04 = IOSLongArray_Get(xx, 4);
  
#line 145
  jlong x05 = IOSLongArray_Get(xx, 5);
  
#line 145
  jlong x06 = IOSLongArray_Get(xx, 6);
  
#line 145
  jlong x07 = IOSLongArray_Get(xx, 7);
  
#line 147
  jlong u = IOSLongArray_Get(xx, 12);
  x05 ^= (JreLShift64(u, 39));
  x06 ^= (JreURShift64(u, 25)) ^ (JreLShift64(u, 62));
  x07 ^= (JreURShift64(u, 2));
  
#line 152
  u = IOSLongArray_Get(xx, 11);
  x04 ^= (JreLShift64(u, 39));
  x05 ^= (JreURShift64(u, 25)) ^ (JreLShift64(u, 62));
  x06 ^= (JreURShift64(u, 2));
  
#line 157
  u = IOSLongArray_Get(xx, 10);
  x03 ^= (JreLShift64(u, 39));
  x04 ^= (JreURShift64(u, 25)) ^ (JreLShift64(u, 62));
  x05 ^= (JreURShift64(u, 2));
  
#line 162
  u = IOSLongArray_Get(xx, 9);
  x02 ^= (JreLShift64(u, 39));
  x03 ^= (JreURShift64(u, 25)) ^ (JreLShift64(u, 62));
  x04 ^= (JreURShift64(u, 2));
  
#line 167
  u = IOSLongArray_Get(xx, 8);
  x01 ^= (JreLShift64(u, 39));
  x02 ^= (JreURShift64(u, 25)) ^ (JreLShift64(u, 62));
  x03 ^= (JreURShift64(u, 2));
  
#line 172
  u = x07;
  x00 ^= (JreLShift64(u, 39));
  x01 ^= (JreURShift64(u, 25)) ^ (JreLShift64(u, 62));
  x02 ^= (JreURShift64(u, 2));
  
#line 177
  jlong t = JreURShift64(x06, 25);
  *IOSLongArray_GetRef(nil_chk(z), 0) = x00 ^ t;
  *IOSLongArray_GetRef(z, 1) = x01 ^ (JreLShift64(t, 23));
  *IOSLongArray_GetRef(z, 2) = x02;
  *IOSLongArray_GetRef(z, 3) = x03;
  *IOSLongArray_GetRef(z, 4) = x04;
  *IOSLongArray_GetRef(z, 5) = x05;
  *IOSLongArray_GetRef(z, 6) = x06 & OrgBouncycastleMathEcCustomSecSecT409Field_M25;
}


#line 187
void OrgBouncycastleMathEcCustomSecSecT409Field_reduce39WithLongArray_withInt_(IOSLongArray *z, jint zOff) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  jlong z6 = IOSLongArray_Get(nil_chk(z), zOff + 6);
  
#line 189
  jlong t = JreURShift64(z6, 25);
  *IOSLongArray_GetRef(z, zOff) ^= t;
  *IOSLongArray_GetRef(z, zOff + 1) ^= (JreLShift64(t, 23));
  *IOSLongArray_GetRef(z, zOff + 6) = z6 & OrgBouncycastleMathEcCustomSecSecT409Field_M25;
}


#line 195
void OrgBouncycastleMathEcCustomSecSecT409Field_sqrtWithLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *z) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  jlong u0;
  
#line 197
  jlong u1;
  u0 = OrgBouncycastleMathRawInterleave_unshuffleWithLong_(IOSLongArray_Get(nil_chk(x), 0));
  
#line 198
  u1 = OrgBouncycastleMathRawInterleave_unshuffleWithLong_(IOSLongArray_Get(x, 1));
  jlong e0 = (u0 & (jlong) 0x00000000FFFFFFFFLL) | (JreLShift64(u1, 32));
  jlong c0 = (JreURShift64(u0, 32)) | (u1 & (jlong) 0xFFFFFFFF00000000LL);
  
#line 202
  u0 = OrgBouncycastleMathRawInterleave_unshuffleWithLong_(IOSLongArray_Get(x, 2));
  
#line 202
  u1 = OrgBouncycastleMathRawInterleave_unshuffleWithLong_(IOSLongArray_Get(x, 3));
  jlong e1 = (u0 & (jlong) 0x00000000FFFFFFFFLL) | (JreLShift64(u1, 32));
  jlong c1 = (JreURShift64(u0, 32)) | (u1 & (jlong) 0xFFFFFFFF00000000LL);
  
#line 206
  u0 = OrgBouncycastleMathRawInterleave_unshuffleWithLong_(IOSLongArray_Get(x, 4));
  
#line 206
  u1 = OrgBouncycastleMathRawInterleave_unshuffleWithLong_(IOSLongArray_Get(x, 5));
  jlong e2 = (u0 & (jlong) 0x00000000FFFFFFFFLL) | (JreLShift64(u1, 32));
  jlong c2 = (JreURShift64(u0, 32)) | (u1 & (jlong) 0xFFFFFFFF00000000LL);
  
#line 210
  u0 = OrgBouncycastleMathRawInterleave_unshuffleWithLong_(IOSLongArray_Get(x, 6));
  jlong e3 = (u0 & (jlong) 0x00000000FFFFFFFFLL);
  jlong c3 = (JreURShift64(u0, 32));
  
#line 214
  *IOSLongArray_GetRef(nil_chk(z), 0) = e0 ^ (JreLShift64(c0, 44));
  *IOSLongArray_GetRef(z, 1) = e1 ^ (JreLShift64(c1, 44)) ^ (JreURShift64(c0, 20));
  *IOSLongArray_GetRef(z, 2) = e2 ^ (JreLShift64(c2, 44)) ^ (JreURShift64(c1, 20));
  *IOSLongArray_GetRef(z, 3) = e3 ^ (JreLShift64(c3, 44)) ^ (JreURShift64(c2, 20)) ^ (JreLShift64(c0, 13));
  *IOSLongArray_GetRef(z, 4) = (JreURShift64(c3, 20)) ^ (JreLShift64(c1, 13)) ^ (JreURShift64(c0, 51));
  *IOSLongArray_GetRef(z, 5) = (JreLShift64(c2, 13)) ^ (JreURShift64(c1, 51));
  *IOSLongArray_GetRef(z, 6) = (JreLShift64(c3, 13)) ^ (JreURShift64(c2, 51));
}


#line 225
void OrgBouncycastleMathEcCustomSecSecT409Field_squareWithLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *z) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  IOSLongArray *tt = OrgBouncycastleMathRawNat_create64WithInt_(13);
  OrgBouncycastleMathEcCustomSecSecT409Field_implSquareWithLongArray_withLongArray_(x, tt);
  OrgBouncycastleMathEcCustomSecSecT409Field_reduceWithLongArray_withLongArray_(tt, z);
}

void OrgBouncycastleMathEcCustomSecSecT409Field_squareAddToExtWithLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *zz) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  IOSLongArray *tt = OrgBouncycastleMathRawNat_create64WithInt_(13);
  OrgBouncycastleMathEcCustomSecSecT409Field_implSquareWithLongArray_withLongArray_(x, tt);
  OrgBouncycastleMathEcCustomSecSecT409Field_addExtWithLongArray_withLongArray_withLongArray_(zz, tt, zz);
}

void OrgBouncycastleMathEcCustomSecSecT409Field_squareNWithLongArray_withInt_withLongArray_(IOSLongArray *x, jint n, IOSLongArray *z) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  
#line 243
  IOSLongArray *tt = OrgBouncycastleMathRawNat_create64WithInt_(13);
  OrgBouncycastleMathEcCustomSecSecT409Field_implSquareWithLongArray_withLongArray_(x, tt);
  OrgBouncycastleMathEcCustomSecSecT409Field_reduceWithLongArray_withLongArray_(tt, z);
  
#line 247
  while (--n > 0) {
    
#line 249
    OrgBouncycastleMathEcCustomSecSecT409Field_implSquareWithLongArray_withLongArray_(z, tt);
    OrgBouncycastleMathEcCustomSecSecT409Field_reduceWithLongArray_withLongArray_(tt, z);
  }
}


#line 254
jint OrgBouncycastleMathEcCustomSecSecT409Field_traceWithLongArray_(IOSLongArray *x) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  
#line 257
  return (jint) (IOSLongArray_Get(nil_chk(x), 0)) & 1;
}


#line 260
void OrgBouncycastleMathEcCustomSecSecT409Field_implCompactExtWithLongArray_(IOSLongArray *zz) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  jlong z00 = IOSLongArray_Get(nil_chk(zz), 0);
  
#line 262
  jlong z01 = IOSLongArray_Get(zz, 1);
  
#line 262
  jlong z02 = IOSLongArray_Get(zz, 2);
  
#line 262
  jlong z03 = IOSLongArray_Get(zz, 3);
  
#line 262
  jlong z04 = IOSLongArray_Get(zz, 4);
  
#line 262
  jlong z05 = IOSLongArray_Get(zz, 5);
  
#line 262
  jlong z06 = IOSLongArray_Get(zz, 6);
  jlong z07 = IOSLongArray_Get(zz, 7);
  
#line 263
  jlong z08 = IOSLongArray_Get(zz, 8);
  
#line 263
  jlong z09 = IOSLongArray_Get(zz, 9);
  
#line 263
  jlong z10 = IOSLongArray_Get(zz, 10);
  
#line 263
  jlong z11 = IOSLongArray_Get(zz, 11);
  
#line 263
  jlong z12 = IOSLongArray_Get(zz, 12);
  
#line 263
  jlong z13 = IOSLongArray_Get(zz, 13);
  *IOSLongArray_GetRef(zz, 0) = z00 ^ (JreLShift64(z01, 59));
  *IOSLongArray_GetRef(zz, 1) = (JreURShift64(z01, 5)) ^ (JreLShift64(z02, 54));
  *IOSLongArray_GetRef(zz, 2) = (JreURShift64(z02, 10)) ^ (JreLShift64(z03, 49));
  *IOSLongArray_GetRef(zz, 3) = (JreURShift64(z03, 15)) ^ (JreLShift64(z04, 44));
  *IOSLongArray_GetRef(zz, 4) = (JreURShift64(z04, 20)) ^ (JreLShift64(z05, 39));
  *IOSLongArray_GetRef(zz, 5) = (JreURShift64(z05, 25)) ^ (JreLShift64(z06, 34));
  *IOSLongArray_GetRef(zz, 6) = (JreURShift64(z06, 30)) ^ (JreLShift64(z07, 29));
  *IOSLongArray_GetRef(zz, 7) = (JreURShift64(z07, 35)) ^ (JreLShift64(z08, 24));
  *IOSLongArray_GetRef(zz, 8) = (JreURShift64(z08, 40)) ^ (JreLShift64(z09, 19));
  *IOSLongArray_GetRef(zz, 9) = (JreURShift64(z09, 45)) ^ (JreLShift64(z10, 14));
  *IOSLongArray_GetRef(zz, 10) = (JreURShift64(z10, 50)) ^ (JreLShift64(z11, 9));
  *IOSLongArray_GetRef(zz, 11) = (JreURShift64(z11, 55)) ^ (JreLShift64(z12, 4)) ^
#line 276
  (JreLShift64(z13, 63));
  *IOSLongArray_GetRef(zz, 12) = (JreURShift64(z13, 1));
}


#line 281
void OrgBouncycastleMathEcCustomSecSecT409Field_implExpandWithLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *z) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  jlong x0 = IOSLongArray_Get(nil_chk(x), 0);
  
#line 283
  jlong x1 = IOSLongArray_Get(x, 1);
  
#line 283
  jlong x2 = IOSLongArray_Get(x, 2);
  
#line 283
  jlong x3 = IOSLongArray_Get(x, 3);
  
#line 283
  jlong x4 = IOSLongArray_Get(x, 4);
  
#line 283
  jlong x5 = IOSLongArray_Get(x, 5);
  
#line 283
  jlong x6 = IOSLongArray_Get(x, 6);
  *IOSLongArray_GetRef(nil_chk(z), 0) = x0 & OrgBouncycastleMathEcCustomSecSecT409Field_M59;
  *IOSLongArray_GetRef(z, 1) = ((JreURShift64(x0, 59)) ^ (JreLShift64(x1, 5))) & OrgBouncycastleMathEcCustomSecSecT409Field_M59;
  *IOSLongArray_GetRef(z, 2) = ((JreURShift64(x1, 54)) ^ (JreLShift64(x2, 10))) & OrgBouncycastleMathEcCustomSecSecT409Field_M59;
  *IOSLongArray_GetRef(z, 3) = ((JreURShift64(x2, 49)) ^ (JreLShift64(x3, 15))) & OrgBouncycastleMathEcCustomSecSecT409Field_M59;
  *IOSLongArray_GetRef(z, 4) = ((JreURShift64(x3, 44)) ^ (JreLShift64(x4, 20))) & OrgBouncycastleMathEcCustomSecSecT409Field_M59;
  *IOSLongArray_GetRef(z, 5) = ((JreURShift64(x4, 39)) ^ (JreLShift64(x5, 25))) & OrgBouncycastleMathEcCustomSecSecT409Field_M59;
  *IOSLongArray_GetRef(z, 6) = ((JreURShift64(x5, 34)) ^ (JreLShift64(x6, 30)));
}


#line 293
void OrgBouncycastleMathEcCustomSecSecT409Field_implMultiplyWithLongArray_withLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *y, IOSLongArray *zz) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  IOSLongArray *a = [IOSLongArray newArrayWithLength:7];
  
#line 295
  IOSLongArray *b = [IOSLongArray newArrayWithLength:7];
  OrgBouncycastleMathEcCustomSecSecT409Field_implExpandWithLongArray_withLongArray_(x, a);
  OrgBouncycastleMathEcCustomSecSecT409Field_implExpandWithLongArray_withLongArray_(y, b);
  
#line 299
  IOSLongArray *u = [IOSLongArray newArrayWithLength:8];
  for (jint i = 0; i < 7; ++i) {
    
#line 302
    OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, i), IOSLongArray_Get(b, i), zz, JreLShift32(i, 1));
  }
  
#line 305
  jlong v0 = IOSLongArray_Get(nil_chk(zz), 0);
  
#line 305
  jlong v1 = IOSLongArray_Get(zz, 1);
  v0 ^= IOSLongArray_Get(zz, 2);
  
#line 306
  *IOSLongArray_GetRef(zz, 1) = v0 ^ v1;
  
#line 306
  v1 ^= IOSLongArray_Get(zz, 3);
  v0 ^= IOSLongArray_Get(zz, 4);
  
#line 307
  *IOSLongArray_GetRef(zz, 2) = v0 ^ v1;
  
#line 307
  v1 ^= IOSLongArray_Get(zz, 5);
  v0 ^= IOSLongArray_Get(zz, 6);
  
#line 308
  *IOSLongArray_GetRef(zz, 3) = v0 ^ v1;
  
#line 308
  v1 ^= IOSLongArray_Get(zz, 7);
  v0 ^= IOSLongArray_Get(zz, 8);
  
#line 309
  *IOSLongArray_GetRef(zz, 4) = v0 ^ v1;
  
#line 309
  v1 ^= IOSLongArray_Get(zz, 9);
  v0 ^= IOSLongArray_Get(zz, 10);
  
#line 310
  *IOSLongArray_GetRef(zz, 5) = v0 ^ v1;
  
#line 310
  v1 ^= IOSLongArray_Get(zz, 11);
  v0 ^= IOSLongArray_Get(zz, 12);
  
#line 311
  *IOSLongArray_GetRef(zz, 6) = v0 ^ v1;
  
#line 311
  v1 ^= IOSLongArray_Get(zz, 13);
  
#line 313
  jlong w = v0 ^ v1;
  *IOSLongArray_GetRef(zz, 7) = IOSLongArray_Get(zz, 0) ^ w;
  *IOSLongArray_GetRef(zz, 8) = IOSLongArray_Get(zz, 1) ^ w;
  *IOSLongArray_GetRef(zz, 9) = IOSLongArray_Get(zz, 2) ^ w;
  *IOSLongArray_GetRef(zz, 10) = IOSLongArray_Get(zz, 3) ^ w;
  *IOSLongArray_GetRef(zz, 11) = IOSLongArray_Get(zz, 4) ^ w;
  *IOSLongArray_GetRef(zz, 12) = IOSLongArray_Get(zz, 5) ^ w;
  *IOSLongArray_GetRef(zz, 13) = IOSLongArray_Get(zz, 6) ^ w;
  
#line 322
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 0) ^ IOSLongArray_Get(a, 1), IOSLongArray_Get(b, 0) ^ IOSLongArray_Get(b, 1), zz, 1);
  
#line 324
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 0) ^ IOSLongArray_Get(a, 2), IOSLongArray_Get(b, 0) ^ IOSLongArray_Get(b, 2), zz, 2);
  
#line 326
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 0) ^ IOSLongArray_Get(a, 3), IOSLongArray_Get(b, 0) ^ IOSLongArray_Get(b, 3), zz, 3);
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 1) ^ IOSLongArray_Get(a, 2), IOSLongArray_Get(b, 1) ^ IOSLongArray_Get(b, 2), zz, 3);
  
#line 329
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 0) ^ IOSLongArray_Get(a, 4), IOSLongArray_Get(b, 0) ^ IOSLongArray_Get(b, 4), zz, 4);
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 1) ^ IOSLongArray_Get(a, 3), IOSLongArray_Get(b, 1) ^ IOSLongArray_Get(b, 3), zz, 4);
  
#line 332
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 0) ^ IOSLongArray_Get(a, 5), IOSLongArray_Get(b, 0) ^ IOSLongArray_Get(b, 5), zz, 5);
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 1) ^ IOSLongArray_Get(a, 4), IOSLongArray_Get(b, 1) ^ IOSLongArray_Get(b, 4), zz, 5);
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 2) ^ IOSLongArray_Get(a, 3), IOSLongArray_Get(b, 2) ^ IOSLongArray_Get(b, 3), zz, 5);
  
#line 336
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 0) ^ IOSLongArray_Get(a, 6), IOSLongArray_Get(b, 0) ^ IOSLongArray_Get(b, 6), zz, 6);
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 1) ^ IOSLongArray_Get(a, 5), IOSLongArray_Get(b, 1) ^ IOSLongArray_Get(b, 5), zz, 6);
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 2) ^ IOSLongArray_Get(a, 4), IOSLongArray_Get(b, 2) ^ IOSLongArray_Get(b, 4), zz, 6);
  
#line 340
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 1) ^ IOSLongArray_Get(a, 6), IOSLongArray_Get(b, 1) ^ IOSLongArray_Get(b, 6), zz, 7);
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 2) ^ IOSLongArray_Get(a, 5), IOSLongArray_Get(b, 2) ^ IOSLongArray_Get(b, 5), zz, 7);
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 3) ^ IOSLongArray_Get(a, 4), IOSLongArray_Get(b, 3) ^ IOSLongArray_Get(b, 4), zz, 7);
  
#line 344
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 2) ^ IOSLongArray_Get(a, 6), IOSLongArray_Get(b, 2) ^ IOSLongArray_Get(b, 6), zz, 8);
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 3) ^ IOSLongArray_Get(a, 5), IOSLongArray_Get(b, 3) ^ IOSLongArray_Get(b, 5), zz, 8);
  
#line 347
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 3) ^ IOSLongArray_Get(a, 6), IOSLongArray_Get(b, 3) ^ IOSLongArray_Get(b, 6), zz, 9);
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 4) ^ IOSLongArray_Get(a, 5), IOSLongArray_Get(b, 4) ^ IOSLongArray_Get(b, 5), zz, 9);
  
#line 350
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 4) ^ IOSLongArray_Get(a, 6), IOSLongArray_Get(b, 4) ^ IOSLongArray_Get(b, 6), zz, 10);
  
#line 352
  OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(u, IOSLongArray_Get(a, 5) ^ IOSLongArray_Get(a, 6), IOSLongArray_Get(b, 5) ^ IOSLongArray_Get(b, 6), zz, 11);
  
#line 354
  OrgBouncycastleMathEcCustomSecSecT409Field_implCompactExtWithLongArray_(zz);
}


#line 357
void OrgBouncycastleMathEcCustomSecSecT409Field_implMulwAccWithLongArray_withLong_withLong_withLongArray_withInt_(IOSLongArray *u, jlong x, jlong y, IOSLongArray *z, jint zOff) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  
#line 363
  *IOSLongArray_GetRef(nil_chk(u), 1) = y;
  *IOSLongArray_GetRef(u, 2) = JreLShift64(IOSLongArray_Get(u, 1), 1);
  *IOSLongArray_GetRef(u, 3) = IOSLongArray_Get(u, 2) ^ y;
  *IOSLongArray_GetRef(u, 4) = JreLShift64(IOSLongArray_Get(u, 2), 1);
  *IOSLongArray_GetRef(u, 5) = IOSLongArray_Get(u, 4) ^ y;
  *IOSLongArray_GetRef(u, 6) = JreLShift64(IOSLongArray_Get(u, 3), 1);
  *IOSLongArray_GetRef(u, 7) = IOSLongArray_Get(u, 6) ^ y;
  
#line 371
  jint j = (jint) x;
  jlong g;
  
#line 372
  jlong h = 0;
  
#line 372
  jlong l = IOSLongArray_Get(u, j & 7) ^
#line 373
  (JreLShift64(IOSLongArray_Get(u, (JreURShift32(j, 3)) & 7), 3));
  jint k = 54;
  do {
    
#line 377
    j = (jint) (JreURShift64(x, k));
    g = IOSLongArray_Get(u, j & 7) ^ JreLShift64(IOSLongArray_Get(
#line 379
    u, (JreURShift32(j, 3)) & 7), 3);
    l ^= (JreLShift64(g, k));
    h ^= (JreURShift64(g, -k));
  }
  while ((k -= 6) > 0);
  
#line 387
  *IOSLongArray_GetRef(nil_chk(z), zOff) ^= l & OrgBouncycastleMathEcCustomSecSecT409Field_M59;
  *IOSLongArray_GetRef(z, zOff + 1) ^= (JreURShift64(l, 59)) ^ (JreLShift64(h, 5));
}


#line 391
void OrgBouncycastleMathEcCustomSecSecT409Field_implSquareWithLongArray_withLongArray_(IOSLongArray *x, IOSLongArray *zz) {
  OrgBouncycastleMathEcCustomSecSecT409Field_initialize();
  OrgBouncycastleMathRawInterleave_expand64To128WithLongArray_withInt_withInt_withLongArray_withInt_(x, 0, 6, zz, 0);
  *IOSLongArray_GetRef(nil_chk(zz), 12) = OrgBouncycastleMathRawInterleave_expand32to64WithInt_((jint) IOSLongArray_Get(nil_chk(x), 6));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleMathEcCustomSecSecT409Field)
