//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/math/ec/custom/sec/SecP256R1FieldElement.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/lang/IllegalArgumentException.h"
#include "java/math/BigInteger.h"
#include "org/bouncycastle/math/ec/ECFieldElement.h"
#include "org/bouncycastle/math/ec/custom/sec/SecP256R1Field.h"
#include "org/bouncycastle/math/ec/custom/sec/SecP256R1FieldElement.h"
#include "org/bouncycastle/math/raw/Nat256.h"
#include "org/bouncycastle/util/Arrays.h"
#include "org/bouncycastle/util/encoders/Hex.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/math/ec/custom/sec/SecP256R1FieldElement must be compiled with ARC (-fobjc-arc)"
#endif

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/math/ec/custom/sec/SecP256R1FieldElement.java"

J2OBJC_INITIALIZED_DEFN(OrgBouncycastleMathEcCustomSecSecP256R1FieldElement)

JavaMathBigInteger *OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_Q;


#line 10
@implementation OrgBouncycastleMathEcCustomSecSecP256R1FieldElement


#line 17
- (instancetype)initWithJavaMathBigInteger:(JavaMathBigInteger *)x {
  OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_initWithJavaMathBigInteger_(self, x);
  return self;
}

J2OBJC_IGNORE_DESIGNATED_BEGIN

#line 27
- (instancetype)init {
  OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_init(self);
  return self;
}
J2OBJC_IGNORE_DESIGNATED_END


#line 32
- (instancetype)initWithIntArray:(IOSIntArray *)x {
  OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_initWithIntArray_(self, x);
  return self;
}

- (jboolean)isZero {
  
#line 40
  return OrgBouncycastleMathRawNat256_isZeroWithIntArray_(x_);
}

- (jboolean)isOne {
  
#line 46
  return OrgBouncycastleMathRawNat256_isOneWithIntArray_(x_);
}

- (jboolean)testBitZero {
  
#line 52
  return OrgBouncycastleMathRawNat256_getBitWithIntArray_withInt_(x_, 0) == 1;
}

- (JavaMathBigInteger *)toBigInteger {
  
#line 58
  return OrgBouncycastleMathRawNat256_toBigIntegerWithIntArray_(x_);
}

- (NSString *)getFieldName {
  
#line 64
  return @"SecP256R1Field";
}

- (jint)getFieldSize {
  
#line 70
  return [((JavaMathBigInteger *) nil_chk(OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_Q)) bitLength];
}

- (OrgBouncycastleMathEcECFieldElement *)addWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)b {
  
#line 76
  IOSIntArray *z = OrgBouncycastleMathRawNat256_create();
  OrgBouncycastleMathEcCustomSecSecP256R1Field_addWithIntArray_withIntArray_withIntArray_(x_, ((OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *) nil_chk(((OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *) cast_chk(b, [OrgBouncycastleMathEcCustomSecSecP256R1FieldElement class]))))->x_, z);
  return new_OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_initWithIntArray_(z);
}

- (OrgBouncycastleMathEcECFieldElement *)addOne {
  
#line 84
  IOSIntArray *z = OrgBouncycastleMathRawNat256_create();
  OrgBouncycastleMathEcCustomSecSecP256R1Field_addOneWithIntArray_withIntArray_(x_, z);
  return new_OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_initWithIntArray_(z);
}

- (OrgBouncycastleMathEcECFieldElement *)subtractWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)b {
  
#line 92
  IOSIntArray *z = OrgBouncycastleMathRawNat256_create();
  OrgBouncycastleMathEcCustomSecSecP256R1Field_subtractWithIntArray_withIntArray_withIntArray_(x_, ((OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *) nil_chk(((OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *) cast_chk(b, [OrgBouncycastleMathEcCustomSecSecP256R1FieldElement class]))))->x_, z);
  return new_OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_initWithIntArray_(z);
}

- (OrgBouncycastleMathEcECFieldElement *)multiplyWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)b {
  
#line 100
  IOSIntArray *z = OrgBouncycastleMathRawNat256_create();
  OrgBouncycastleMathEcCustomSecSecP256R1Field_multiplyWithIntArray_withIntArray_withIntArray_(x_, ((OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *) nil_chk(((OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *) cast_chk(b, [OrgBouncycastleMathEcCustomSecSecP256R1FieldElement class]))))->x_, z);
  return new_OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_initWithIntArray_(z);
}

- (OrgBouncycastleMathEcECFieldElement *)divideWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)b {
  
#line 109
  IOSIntArray *z = OrgBouncycastleMathRawNat256_create();
  OrgBouncycastleMathEcCustomSecSecP256R1Field_invWithIntArray_withIntArray_(((OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *) nil_chk(((OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *) cast_chk(b, [OrgBouncycastleMathEcCustomSecSecP256R1FieldElement class]))))->x_, z);
  OrgBouncycastleMathEcCustomSecSecP256R1Field_multiplyWithIntArray_withIntArray_withIntArray_(z, x_, z);
  return new_OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_initWithIntArray_(z);
}


#line 115
- (OrgBouncycastleMathEcECFieldElement *)negate {
  
#line 118
  IOSIntArray *z = OrgBouncycastleMathRawNat256_create();
  OrgBouncycastleMathEcCustomSecSecP256R1Field_negateWithIntArray_withIntArray_(x_, z);
  return new_OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_initWithIntArray_(z);
}

- (OrgBouncycastleMathEcECFieldElement *)square {
  
#line 126
  IOSIntArray *z = OrgBouncycastleMathRawNat256_create();
  OrgBouncycastleMathEcCustomSecSecP256R1Field_squareWithIntArray_withIntArray_(x_, z);
  return new_OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_initWithIntArray_(z);
}

- (OrgBouncycastleMathEcECFieldElement *)invert {
  
#line 135
  IOSIntArray *z = OrgBouncycastleMathRawNat256_create();
  OrgBouncycastleMathEcCustomSecSecP256R1Field_invWithIntArray_withIntArray_(x_, z);
  return new_OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_initWithIntArray_(z);
}


#line 144
- (OrgBouncycastleMathEcECFieldElement *)sqrt {
  
#line 149
  IOSIntArray *x1 = x_;
  if (OrgBouncycastleMathRawNat256_isZeroWithIntArray_(x1) || OrgBouncycastleMathRawNat256_isOneWithIntArray_(x1)) {
    
#line 152
    return self;
  }
  
#line 155
  IOSIntArray *tt0 = OrgBouncycastleMathRawNat256_createExt();
  IOSIntArray *t1 = OrgBouncycastleMathRawNat256_create();
  IOSIntArray *t2 = OrgBouncycastleMathRawNat256_create();
  
#line 159
  OrgBouncycastleMathEcCustomSecSecP256R1Field_squareWithIntArray_withIntArray_withIntArray_(x1, t1, tt0);
  OrgBouncycastleMathEcCustomSecSecP256R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(t1, x1, t1, tt0);
  
#line 162
  OrgBouncycastleMathEcCustomSecSecP256R1Field_squareNWithIntArray_withInt_withIntArray_withIntArray_(t1, 2, t2, tt0);
  OrgBouncycastleMathEcCustomSecSecP256R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(t2, t1, t2, tt0);
  
#line 165
  OrgBouncycastleMathEcCustomSecSecP256R1Field_squareNWithIntArray_withInt_withIntArray_withIntArray_(t2, 4, t1, tt0);
  OrgBouncycastleMathEcCustomSecSecP256R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(t1, t2, t1, tt0);
  
#line 168
  OrgBouncycastleMathEcCustomSecSecP256R1Field_squareNWithIntArray_withInt_withIntArray_withIntArray_(t1, 8, t2, tt0);
  OrgBouncycastleMathEcCustomSecSecP256R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(t2, t1, t2, tt0);
  
#line 171
  OrgBouncycastleMathEcCustomSecSecP256R1Field_squareNWithIntArray_withInt_withIntArray_withIntArray_(t2, 16, t1, tt0);
  OrgBouncycastleMathEcCustomSecSecP256R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(t1, t2, t1, tt0);
  
#line 174
  OrgBouncycastleMathEcCustomSecSecP256R1Field_squareNWithIntArray_withInt_withIntArray_withIntArray_(t1, 32, t1, tt0);
  OrgBouncycastleMathEcCustomSecSecP256R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(t1, x1, t1, tt0);
  
#line 177
  OrgBouncycastleMathEcCustomSecSecP256R1Field_squareNWithIntArray_withInt_withIntArray_withIntArray_(t1, 96, t1, tt0);
  OrgBouncycastleMathEcCustomSecSecP256R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(t1, x1, t1, tt0);
  
#line 180
  OrgBouncycastleMathEcCustomSecSecP256R1Field_squareNWithIntArray_withInt_withIntArray_withIntArray_(t1, 94, t1, tt0);
  OrgBouncycastleMathEcCustomSecSecP256R1Field_squareWithIntArray_withIntArray_withIntArray_(t1, t2, tt0);
  
#line 183
  return OrgBouncycastleMathRawNat256_eqWithIntArray_withIntArray_(x1, t2) ? new_OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_initWithIntArray_(t1) : nil;
}


#line 186
- (jboolean)isEqual:(id)other {
  
#line 189
  if (JreObjectEqualsEquals(other, self)) {
    
#line 191
    return true;
  }
  
#line 194
  if (!([other isKindOfClass:[OrgBouncycastleMathEcCustomSecSecP256R1FieldElement class]])) {
    
#line 196
    return false;
  }
  
#line 199
  OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *o = (OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *) cast_chk(other, [OrgBouncycastleMathEcCustomSecSecP256R1FieldElement class]);
  return OrgBouncycastleMathRawNat256_eqWithIntArray_withIntArray_(x_, ((OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *) nil_chk(o))->x_);
}


#line 203
- (NSUInteger)hash {
  
#line 206
  return ((jint) [((JavaMathBigInteger *) nil_chk(OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_Q)) hash]) ^ OrgBouncycastleUtilArrays_hashCodeWithIntArray_withInt_withInt_(x_, 0, 8);
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, 0, -1, -1, -1, -1 },
    { NULL, NULL, 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, NULL, 0x4, -1, 1, -1, -1, -1, -1 },
    { NULL, "Z", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "Z", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "Z", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LJavaMathBigInteger;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LNSString;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "I", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECFieldElement;", 0x1, 2, 3, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECFieldElement;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECFieldElement;", 0x1, 4, 3, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECFieldElement;", 0x1, 5, 3, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECFieldElement;", 0x1, 6, 3, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECFieldElement;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECFieldElement;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECFieldElement;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECFieldElement;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "Z", 0x1, 7, 8, -1, -1, -1, -1 },
    { NULL, "I", 0x1, 9, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithJavaMathBigInteger:);
  methods[1].selector = @selector(init);
  methods[2].selector = @selector(initWithIntArray:);
  methods[3].selector = @selector(isZero);
  methods[4].selector = @selector(isOne);
  methods[5].selector = @selector(testBitZero);
  methods[6].selector = @selector(toBigInteger);
  methods[7].selector = @selector(getFieldName);
  methods[8].selector = @selector(getFieldSize);
  methods[9].selector = @selector(addWithOrgBouncycastleMathEcECFieldElement:);
  methods[10].selector = @selector(addOne);
  methods[11].selector = @selector(subtractWithOrgBouncycastleMathEcECFieldElement:);
  methods[12].selector = @selector(multiplyWithOrgBouncycastleMathEcECFieldElement:);
  methods[13].selector = @selector(divideWithOrgBouncycastleMathEcECFieldElement:);
  methods[14].selector = @selector(negate);
  methods[15].selector = @selector(square);
  methods[16].selector = @selector(invert);
  methods[17].selector = @selector(sqrt);
  methods[18].selector = @selector(isEqual:);
  methods[19].selector = @selector(hash);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "Q", "LJavaMathBigInteger;", .constantValue.asLong = 0, 0x19, -1, 10, -1, -1 },
    { "x_", "[I", .constantValue.asLong = 0, 0x4, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "LJavaMathBigInteger;", "[I", "add", "LOrgBouncycastleMathEcECFieldElement;", "subtract", "multiply", "divide", "equals", "LNSObject;", "hashCode", &OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_Q };
  static const J2ObjcClassInfo _OrgBouncycastleMathEcCustomSecSecP256R1FieldElement = { "SecP256R1FieldElement", "org.bouncycastle.math.ec.custom.sec", ptrTable, methods, fields, 7, 0x1, 20, 2, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleMathEcCustomSecSecP256R1FieldElement;
}

+ (void)initialize {
  if (self == [OrgBouncycastleMathEcCustomSecSecP256R1FieldElement class]) {
    OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_Q = new_JavaMathBigInteger_initWithInt_withByteArray_(
#line 12
    1, OrgBouncycastleUtilEncodersHex_decodeStrictWithNSString_(
#line 13
    @"FFFFFFFF00000001000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF"));
    J2OBJC_SET_INITIALIZED(OrgBouncycastleMathEcCustomSecSecP256R1FieldElement)
  }
}

@end


#line 17
void OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_initWithJavaMathBigInteger_(OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *self, JavaMathBigInteger *x) {
  OrgBouncycastleMathEcECFieldElement_AbstractFp_init(self);
  if (x == nil || [x signum] < 0 || [x compareToWithId:OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_Q] >= 0) {
    
#line 21
    @throw new_JavaLangIllegalArgumentException_initWithNSString_(@"x value invalid for SecP256R1FieldElement");
  }
  
#line 24
  self->x_ = OrgBouncycastleMathEcCustomSecSecP256R1Field_fromBigIntegerWithJavaMathBigInteger_(x);
}


#line 17
OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *new_OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_initWithJavaMathBigInteger_(JavaMathBigInteger *x) {
  J2OBJC_NEW_IMPL(OrgBouncycastleMathEcCustomSecSecP256R1FieldElement, initWithJavaMathBigInteger_, x)
}


#line 17
OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *create_OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_initWithJavaMathBigInteger_(JavaMathBigInteger *x) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleMathEcCustomSecSecP256R1FieldElement, initWithJavaMathBigInteger_, x)
}


#line 27
void OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_init(OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *self) {
  OrgBouncycastleMathEcECFieldElement_AbstractFp_init(self);
  self->x_ = OrgBouncycastleMathRawNat256_create();
}


#line 27
OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *new_OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_init() {
  J2OBJC_NEW_IMPL(OrgBouncycastleMathEcCustomSecSecP256R1FieldElement, init)
}


#line 27
OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *create_OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_init() {
  J2OBJC_CREATE_IMPL(OrgBouncycastleMathEcCustomSecSecP256R1FieldElement, init)
}


#line 32
void OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_initWithIntArray_(OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *self, IOSIntArray *x) {
  OrgBouncycastleMathEcECFieldElement_AbstractFp_init(self);
  self->x_ = x;
}


#line 32
OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *new_OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_initWithIntArray_(IOSIntArray *x) {
  J2OBJC_NEW_IMPL(OrgBouncycastleMathEcCustomSecSecP256R1FieldElement, initWithIntArray_, x)
}


#line 32
OrgBouncycastleMathEcCustomSecSecP256R1FieldElement *create_OrgBouncycastleMathEcCustomSecSecP256R1FieldElement_initWithIntArray_(IOSIntArray *x) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleMathEcCustomSecSecP256R1FieldElement, initWithIntArray_, x)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleMathEcCustomSecSecP256R1FieldElement)
