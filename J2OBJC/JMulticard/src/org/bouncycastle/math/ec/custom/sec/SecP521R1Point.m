//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/math/ec/custom/sec/SecP521R1Point.java
//

#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "org/bouncycastle/math/ec/ECCurve.h"
#include "org/bouncycastle/math/ec/ECFieldElement.h"
#include "org/bouncycastle/math/ec/ECPoint.h"
#include "org/bouncycastle/math/ec/custom/sec/SecP521R1Field.h"
#include "org/bouncycastle/math/ec/custom/sec/SecP521R1FieldElement.h"
#include "org/bouncycastle/math/ec/custom/sec/SecP521R1Point.h"
#include "org/bouncycastle/math/raw/Nat.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/math/ec/custom/sec/SecP521R1Point must be compiled with ARC (-fobjc-arc)"
#endif

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/math/ec/custom/sec/SecP521R1Point.java"


#line 8
@implementation OrgBouncycastleMathEcCustomSecSecP521R1Point

- (instancetype)initWithOrgBouncycastleMathEcECCurve:(OrgBouncycastleMathEcECCurve *)curve
             withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
             withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y {
  OrgBouncycastleMathEcCustomSecSecP521R1Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(self, curve, x, y);
  return self;
}


#line 15
- (instancetype)initWithOrgBouncycastleMathEcECCurve:(OrgBouncycastleMathEcECCurve *)curve
             withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
             withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
        withOrgBouncycastleMathEcECFieldElementArray:(IOSObjectArray *)zs {
  OrgBouncycastleMathEcCustomSecSecP521R1Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(self, curve, x, y, zs);
  return self;
}


#line 20
- (OrgBouncycastleMathEcECPoint *)detach {
  
#line 23
  return new_OrgBouncycastleMathEcCustomSecSecP521R1Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(nil, [self getAffineXCoord], [self getAffineYCoord]);
}

- (OrgBouncycastleMathEcECPoint *)addWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)b {
  
#line 29
  if ([self isInfinity]) {
    
#line 31
    return b;
  }
  if ([((OrgBouncycastleMathEcECPoint *) nil_chk(b)) isInfinity]) {
    
#line 35
    return self;
  }
  if (JreObjectEqualsEquals(self, b)) {
    
#line 39
    return [self twice];
  }
  
#line 42
  OrgBouncycastleMathEcECCurve *curve = [self getCurve];
  
#line 44
  OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *X1 = (OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) cast_chk(x_, [OrgBouncycastleMathEcCustomSecSecP521R1FieldElement class]);
  
#line 44
  OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *Y1 = (OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) cast_chk(y_, [OrgBouncycastleMathEcCustomSecSecP521R1FieldElement class]);
  OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *X2 = (OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) cast_chk([b getXCoord], [OrgBouncycastleMathEcCustomSecSecP521R1FieldElement class]);
  
#line 45
  OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *Y2 = (OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) cast_chk([b getYCoord], [OrgBouncycastleMathEcCustomSecSecP521R1FieldElement class]);
  
#line 47
  OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *Z1 = (OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) cast_chk(IOSObjectArray_Get(nil_chk(zs_), 0), [OrgBouncycastleMathEcCustomSecSecP521R1FieldElement class]);
  OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *Z2 = (OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) cast_chk([b getZCoordWithInt:0], [OrgBouncycastleMathEcCustomSecSecP521R1FieldElement class]);
  
#line 50
  IOSIntArray *tt0 = OrgBouncycastleMathRawNat_createWithInt_(33);
  IOSIntArray *t1 = OrgBouncycastleMathRawNat_createWithInt_(17);
  IOSIntArray *t2 = OrgBouncycastleMathRawNat_createWithInt_(17);
  IOSIntArray *t3 = OrgBouncycastleMathRawNat_createWithInt_(17);
  IOSIntArray *t4 = OrgBouncycastleMathRawNat_createWithInt_(17);
  
#line 56
  jboolean Z1IsOne = [((OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) nil_chk(Z1)) isOne];
  IOSIntArray *U2;
  
#line 57
  IOSIntArray *S2;
  if (Z1IsOne) {
    
#line 60
    U2 = ((OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) nil_chk(X2))->x_;
    S2 = ((OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) nil_chk(Y2))->x_;
  }
  else {
    
#line 65
    S2 = t3;
    OrgBouncycastleMathEcCustomSecSecP521R1Field_squareWithIntArray_withIntArray_withIntArray_(Z1->x_, S2, tt0);
    
#line 68
    U2 = t2;
    OrgBouncycastleMathEcCustomSecSecP521R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(S2, ((OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) nil_chk(X2))->x_, U2, tt0);
    
#line 71
    OrgBouncycastleMathEcCustomSecSecP521R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(S2, Z1->x_, S2, tt0);
    OrgBouncycastleMathEcCustomSecSecP521R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(S2, ((OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) nil_chk(Y2))->x_, S2, tt0);
  }
  
#line 75
  jboolean Z2IsOne = [((OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) nil_chk(Z2)) isOne];
  IOSIntArray *U1;
  
#line 76
  IOSIntArray *S1;
  if (Z2IsOne) {
    
#line 79
    U1 = ((OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) nil_chk(X1))->x_;
    S1 = ((OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) nil_chk(Y1))->x_;
  }
  else {
    
#line 84
    S1 = t4;
    OrgBouncycastleMathEcCustomSecSecP521R1Field_squareWithIntArray_withIntArray_withIntArray_(Z2->x_, S1, tt0);
    
#line 87
    U1 = t1;
    OrgBouncycastleMathEcCustomSecSecP521R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(S1, ((OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) nil_chk(X1))->x_, U1, tt0);
    
#line 90
    OrgBouncycastleMathEcCustomSecSecP521R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(S1, Z2->x_, S1, tt0);
    OrgBouncycastleMathEcCustomSecSecP521R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(S1, ((OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) nil_chk(Y1))->x_, S1, tt0);
  }
  
#line 94
  IOSIntArray *H = OrgBouncycastleMathRawNat_createWithInt_(17);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_subtractWithIntArray_withIntArray_withIntArray_(U1, U2, H);
  
#line 97
  IOSIntArray *R = t2;
  OrgBouncycastleMathEcCustomSecSecP521R1Field_subtractWithIntArray_withIntArray_withIntArray_(S1, S2, R);
  
#line 101
  if (OrgBouncycastleMathRawNat_isZeroWithInt_withIntArray_(17, H)) {
    
#line 103
    if (OrgBouncycastleMathRawNat_isZeroWithInt_withIntArray_(17, R)) {
      
#line 106
      return [self twice];
    }
    
#line 110
    return [((OrgBouncycastleMathEcECCurve *) nil_chk(curve)) getInfinity];
  }
  
#line 113
  IOSIntArray *HSquared = t3;
  OrgBouncycastleMathEcCustomSecSecP521R1Field_squareWithIntArray_withIntArray_withIntArray_(H, HSquared, tt0);
  
#line 116
  IOSIntArray *G = OrgBouncycastleMathRawNat_createWithInt_(17);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(HSquared, H, G, tt0);
  
#line 119
  IOSIntArray *V = t3;
  OrgBouncycastleMathEcCustomSecSecP521R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(HSquared, U1, V, tt0);
  
#line 122
  OrgBouncycastleMathEcCustomSecSecP521R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(S1, G, t1, tt0);
  
#line 124
  OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *X3 = new_OrgBouncycastleMathEcCustomSecSecP521R1FieldElement_initWithIntArray_(t4);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_squareWithIntArray_withIntArray_withIntArray_(R, X3->x_, tt0);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_addWithIntArray_withIntArray_withIntArray_(X3->x_, G, X3->x_);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_subtractWithIntArray_withIntArray_withIntArray_(X3->x_, V, X3->x_);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_subtractWithIntArray_withIntArray_withIntArray_(X3->x_, V, X3->x_);
  
#line 130
  OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *Y3 = new_OrgBouncycastleMathEcCustomSecSecP521R1FieldElement_initWithIntArray_(G);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_subtractWithIntArray_withIntArray_withIntArray_(V, X3->x_, Y3->x_);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(Y3->x_, R, t2, tt0);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_subtractWithIntArray_withIntArray_withIntArray_(t2, t1, Y3->x_);
  
#line 135
  OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *Z3 = new_OrgBouncycastleMathEcCustomSecSecP521R1FieldElement_initWithIntArray_(H);
  if (!Z1IsOne) {
    
#line 138
    OrgBouncycastleMathEcCustomSecSecP521R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(Z3->x_, Z1->x_, Z3->x_, tt0);
  }
  if (!Z2IsOne) {
    
#line 142
    OrgBouncycastleMathEcCustomSecSecP521R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(Z3->x_, Z2->x_, Z3->x_, tt0);
  }
  
#line 145
  IOSObjectArray *zs = [IOSObjectArray newArrayWithObjects:(id[]){ Z3 } count:1 type:OrgBouncycastleMathEcECFieldElement_class_()];
  
#line 147
  return new_OrgBouncycastleMathEcCustomSecSecP521R1Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(curve, X3, Y3, zs);
}


#line 150
- (OrgBouncycastleMathEcECPoint *)twice {
  
#line 153
  if ([self isInfinity]) {
    
#line 155
    return self;
  }
  
#line 158
  OrgBouncycastleMathEcECCurve *curve = [self getCurve];
  
#line 160
  OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *Y1 = (OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) cast_chk(y_, [OrgBouncycastleMathEcCustomSecSecP521R1FieldElement class]);
  if ([((OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) nil_chk(Y1)) isZero]) {
    
#line 163
    return [((OrgBouncycastleMathEcECCurve *) nil_chk(curve)) getInfinity];
  }
  
#line 166
  OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *X1 = (OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) cast_chk(x_, [OrgBouncycastleMathEcCustomSecSecP521R1FieldElement class]);
  
#line 166
  OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *Z1 = (OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) cast_chk(IOSObjectArray_Get(nil_chk(zs_), 0), [OrgBouncycastleMathEcCustomSecSecP521R1FieldElement class]);
  
#line 168
  IOSIntArray *tt0 = OrgBouncycastleMathRawNat_createWithInt_(33);
  IOSIntArray *t1 = OrgBouncycastleMathRawNat_createWithInt_(17);
  IOSIntArray *t2 = OrgBouncycastleMathRawNat_createWithInt_(17);
  
#line 172
  IOSIntArray *Y1Squared = OrgBouncycastleMathRawNat_createWithInt_(17);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_squareWithIntArray_withIntArray_withIntArray_(Y1->x_, Y1Squared, tt0);
  
#line 175
  IOSIntArray *T = OrgBouncycastleMathRawNat_createWithInt_(17);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_squareWithIntArray_withIntArray_withIntArray_(Y1Squared, T, tt0);
  
#line 178
  jboolean Z1IsOne = [((OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) nil_chk(Z1)) isOne];
  
#line 180
  IOSIntArray *Z1Squared = Z1->x_;
  if (!Z1IsOne) {
    
#line 183
    Z1Squared = t2;
    OrgBouncycastleMathEcCustomSecSecP521R1Field_squareWithIntArray_withIntArray_withIntArray_(Z1->x_, Z1Squared, tt0);
  }
  
#line 187
  OrgBouncycastleMathEcCustomSecSecP521R1Field_subtractWithIntArray_withIntArray_withIntArray_(((OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *) nil_chk(X1))->x_, Z1Squared, t1);
  
#line 189
  IOSIntArray *M = t2;
  OrgBouncycastleMathEcCustomSecSecP521R1Field_addWithIntArray_withIntArray_withIntArray_(X1->x_, Z1Squared, M);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(M, t1, M, tt0);
  OrgBouncycastleMathRawNat_addBothToWithInt_withIntArray_withIntArray_withIntArray_(17, M, M, M);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_reduce23WithIntArray_(M);
  
#line 195
  IOSIntArray *S = Y1Squared;
  OrgBouncycastleMathEcCustomSecSecP521R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(Y1Squared, X1->x_, S, tt0);
  OrgBouncycastleMathRawNat_shiftUpBitsWithInt_withIntArray_withInt_withInt_(17, S, 2, 0);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_reduce23WithIntArray_(S);
  
#line 200
  OrgBouncycastleMathRawNat_shiftUpBitsWithInt_withIntArray_withInt_withInt_withIntArray_(17, T, 3, 0, t1);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_reduce23WithIntArray_(t1);
  
#line 203
  OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *X3 = new_OrgBouncycastleMathEcCustomSecSecP521R1FieldElement_initWithIntArray_(T);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_squareWithIntArray_withIntArray_withIntArray_(M, X3->x_, tt0);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_subtractWithIntArray_withIntArray_withIntArray_(X3->x_, S, X3->x_);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_subtractWithIntArray_withIntArray_withIntArray_(X3->x_, S, X3->x_);
  
#line 208
  OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *Y3 = new_OrgBouncycastleMathEcCustomSecSecP521R1FieldElement_initWithIntArray_(S);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_subtractWithIntArray_withIntArray_withIntArray_(S, X3->x_, Y3->x_);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(Y3->x_, M, Y3->x_, tt0);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_subtractWithIntArray_withIntArray_withIntArray_(Y3->x_, t1, Y3->x_);
  
#line 213
  OrgBouncycastleMathEcCustomSecSecP521R1FieldElement *Z3 = new_OrgBouncycastleMathEcCustomSecSecP521R1FieldElement_initWithIntArray_(M);
  OrgBouncycastleMathEcCustomSecSecP521R1Field_twiceWithIntArray_withIntArray_(Y1->x_, Z3->x_);
  if (!Z1IsOne) {
    
#line 217
    OrgBouncycastleMathEcCustomSecSecP521R1Field_multiplyWithIntArray_withIntArray_withIntArray_withIntArray_(Z3->x_, Z1->x_, Z3->x_, tt0);
  }
  
#line 220
  return new_OrgBouncycastleMathEcCustomSecSecP521R1Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(curve, X3, Y3, [IOSObjectArray newArrayWithObjects:(id[]){ Z3 } count:1 type:OrgBouncycastleMathEcECFieldElement_class_()]);
}


#line 223
- (OrgBouncycastleMathEcECPoint *)twicePlusWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)b {
  
#line 226
  if (JreObjectEqualsEquals(self, b)) {
    
#line 228
    return [self threeTimes];
  }
  if ([self isInfinity]) {
    
#line 232
    return b;
  }
  if ([((OrgBouncycastleMathEcECPoint *) nil_chk(b)) isInfinity]) {
    
#line 236
    return [self twice];
  }
  
#line 239
  OrgBouncycastleMathEcECFieldElement *Y1 = y_;
  if ([((OrgBouncycastleMathEcECFieldElement *) nil_chk(Y1)) isZero]) {
    
#line 242
    return b;
  }
  
#line 245
  return [((OrgBouncycastleMathEcECPoint *) nil_chk([self twice])) addWithOrgBouncycastleMathEcECPoint:b];
}


#line 248
- (OrgBouncycastleMathEcECPoint *)threeTimes {
  
#line 251
  if ([self isInfinity] || [((OrgBouncycastleMathEcECFieldElement *) nil_chk(y_)) isZero]) {
    
#line 253
    return self;
  }
  
#line 257
  return [((OrgBouncycastleMathEcECPoint *) nil_chk([self twice])) addWithOrgBouncycastleMathEcECPoint:self];
}


#line 260
- (OrgBouncycastleMathEcECFieldElement *)twoWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x {
  
#line 262
  return [((OrgBouncycastleMathEcECFieldElement *) nil_chk(x)) addWithOrgBouncycastleMathEcECFieldElement:x];
}


#line 265
- (OrgBouncycastleMathEcECFieldElement *)threeWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x {
  
#line 267
  return [((OrgBouncycastleMathEcECFieldElement *) nil_chk([self twoWithOrgBouncycastleMathEcECFieldElement:x])) addWithOrgBouncycastleMathEcECFieldElement:x];
}


#line 270
- (OrgBouncycastleMathEcECFieldElement *)fourWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x {
  
#line 272
  return [self twoWithOrgBouncycastleMathEcECFieldElement:[self twoWithOrgBouncycastleMathEcECFieldElement:x]];
}


#line 275
- (OrgBouncycastleMathEcECFieldElement *)eightWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x {
  
#line 277
  return [self fourWithOrgBouncycastleMathEcECFieldElement:[self twoWithOrgBouncycastleMathEcECFieldElement:x]];
}


#line 280
- (OrgBouncycastleMathEcECFieldElement *)doubleProductFromSquaresWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)a
                                                                 withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)b
                                                                 withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)aSquared
                                                                 withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)bSquared {
  
#line 287
  return [((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk(a)) addWithOrgBouncycastleMathEcECFieldElement:b])) square])) subtractWithOrgBouncycastleMathEcECFieldElement:aSquared])) subtractWithOrgBouncycastleMathEcECFieldElement:bSquared];
}


#line 290
- (OrgBouncycastleMathEcECPoint *)negate {
  
#line 293
  if ([self isInfinity]) {
    
#line 295
    return self;
  }
  
#line 298
  return new_OrgBouncycastleMathEcCustomSecSecP521R1Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(curve_, x_, [((OrgBouncycastleMathEcECFieldElement *) nil_chk(y_)) negate], zs_);
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x0, -1, 0, -1, -1, -1, -1 },
    { NULL, NULL, 0x0, -1, 1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECPoint;", 0x4, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECPoint;", 0x1, 2, 3, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECPoint;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECPoint;", 0x1, 4, 3, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECPoint;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECFieldElement;", 0x4, 5, 6, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECFieldElement;", 0x4, 7, 6, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECFieldElement;", 0x4, 8, 6, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECFieldElement;", 0x4, 9, 6, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECFieldElement;", 0x4, 10, 11, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECPoint;", 0x1, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithOrgBouncycastleMathEcECCurve:withOrgBouncycastleMathEcECFieldElement:withOrgBouncycastleMathEcECFieldElement:);
  methods[1].selector = @selector(initWithOrgBouncycastleMathEcECCurve:withOrgBouncycastleMathEcECFieldElement:withOrgBouncycastleMathEcECFieldElement:withOrgBouncycastleMathEcECFieldElementArray:);
  methods[2].selector = @selector(detach);
  methods[3].selector = @selector(addWithOrgBouncycastleMathEcECPoint:);
  methods[4].selector = @selector(twice);
  methods[5].selector = @selector(twicePlusWithOrgBouncycastleMathEcECPoint:);
  methods[6].selector = @selector(threeTimes);
  methods[7].selector = @selector(twoWithOrgBouncycastleMathEcECFieldElement:);
  methods[8].selector = @selector(threeWithOrgBouncycastleMathEcECFieldElement:);
  methods[9].selector = @selector(fourWithOrgBouncycastleMathEcECFieldElement:);
  methods[10].selector = @selector(eightWithOrgBouncycastleMathEcECFieldElement:);
  methods[11].selector = @selector(doubleProductFromSquaresWithOrgBouncycastleMathEcECFieldElement:withOrgBouncycastleMathEcECFieldElement:withOrgBouncycastleMathEcECFieldElement:withOrgBouncycastleMathEcECFieldElement:);
  methods[12].selector = @selector(negate);
  #pragma clang diagnostic pop
  static const void *ptrTable[] = { "LOrgBouncycastleMathEcECCurve;LOrgBouncycastleMathEcECFieldElement;LOrgBouncycastleMathEcECFieldElement;", "LOrgBouncycastleMathEcECCurve;LOrgBouncycastleMathEcECFieldElement;LOrgBouncycastleMathEcECFieldElement;[LOrgBouncycastleMathEcECFieldElement;", "add", "LOrgBouncycastleMathEcECPoint;", "twicePlus", "two", "LOrgBouncycastleMathEcECFieldElement;", "three", "four", "eight", "doubleProductFromSquares", "LOrgBouncycastleMathEcECFieldElement;LOrgBouncycastleMathEcECFieldElement;LOrgBouncycastleMathEcECFieldElement;LOrgBouncycastleMathEcECFieldElement;" };
  static const J2ObjcClassInfo _OrgBouncycastleMathEcCustomSecSecP521R1Point = { "SecP521R1Point", "org.bouncycastle.math.ec.custom.sec", ptrTable, methods, NULL, 7, 0x1, 13, 0, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleMathEcCustomSecSecP521R1Point;
}

@end


#line 10
void OrgBouncycastleMathEcCustomSecSecP521R1Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(OrgBouncycastleMathEcCustomSecSecP521R1Point *self, OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECFieldElement *x, OrgBouncycastleMathEcECFieldElement *y) {
  OrgBouncycastleMathEcECPoint_AbstractFp_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(self,
#line 12
  curve, x, y);
}


#line 10
OrgBouncycastleMathEcCustomSecSecP521R1Point *new_OrgBouncycastleMathEcCustomSecSecP521R1Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECFieldElement *x, OrgBouncycastleMathEcECFieldElement *y) {
  J2OBJC_NEW_IMPL(OrgBouncycastleMathEcCustomSecSecP521R1Point, initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_, curve, x, y)
}


#line 10
OrgBouncycastleMathEcCustomSecSecP521R1Point *create_OrgBouncycastleMathEcCustomSecSecP521R1Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECFieldElement *x, OrgBouncycastleMathEcECFieldElement *y) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleMathEcCustomSecSecP521R1Point, initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_, curve, x, y)
}


#line 15
void OrgBouncycastleMathEcCustomSecSecP521R1Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(OrgBouncycastleMathEcCustomSecSecP521R1Point *self, OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECFieldElement *x, OrgBouncycastleMathEcECFieldElement *y, IOSObjectArray *zs) {
  OrgBouncycastleMathEcECPoint_AbstractFp_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(self,
#line 17
  curve, x, y, zs);
}


#line 15
OrgBouncycastleMathEcCustomSecSecP521R1Point *new_OrgBouncycastleMathEcCustomSecSecP521R1Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECFieldElement *x, OrgBouncycastleMathEcECFieldElement *y, IOSObjectArray *zs) {
  J2OBJC_NEW_IMPL(OrgBouncycastleMathEcCustomSecSecP521R1Point, initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_, curve, x, y, zs)
}


#line 15
OrgBouncycastleMathEcCustomSecSecP521R1Point *create_OrgBouncycastleMathEcCustomSecSecP521R1Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECFieldElement *x, OrgBouncycastleMathEcECFieldElement *y, IOSObjectArray *zs) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleMathEcCustomSecSecP521R1Point, initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_, curve, x, y, zs)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleMathEcCustomSecSecP521R1Point)
