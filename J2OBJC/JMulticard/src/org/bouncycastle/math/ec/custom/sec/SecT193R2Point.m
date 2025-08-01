//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/math/ec/custom/sec/SecT193R2Point.java
//

#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "J2ObjC_source.h"
#include "java/math/BigInteger.h"
#include "org/bouncycastle/math/ec/ECConstants.h"
#include "org/bouncycastle/math/ec/ECCurve.h"
#include "org/bouncycastle/math/ec/ECFieldElement.h"
#include "org/bouncycastle/math/ec/ECPoint.h"
#include "org/bouncycastle/math/ec/custom/sec/SecT193R2Point.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/math/ec/custom/sec/SecT193R2Point must be compiled with ARC (-fobjc-arc)"
#endif

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/math/ec/custom/sec/SecT193R2Point.java"


#line 9
@implementation OrgBouncycastleMathEcCustomSecSecT193R2Point

- (instancetype)initWithOrgBouncycastleMathEcECCurve:(OrgBouncycastleMathEcECCurve *)curve
             withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
             withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y {
  OrgBouncycastleMathEcCustomSecSecT193R2Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(self, curve, x, y);
  return self;
}


#line 16
- (instancetype)initWithOrgBouncycastleMathEcECCurve:(OrgBouncycastleMathEcECCurve *)curve
             withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
             withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
        withOrgBouncycastleMathEcECFieldElementArray:(IOSObjectArray *)zs {
  OrgBouncycastleMathEcCustomSecSecT193R2Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(self, curve, x, y, zs);
  return self;
}


#line 21
- (OrgBouncycastleMathEcECPoint *)detach {
  
#line 24
  return new_OrgBouncycastleMathEcCustomSecSecT193R2Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(nil, [self getAffineXCoord], [self getAffineYCoord]);
}

- (OrgBouncycastleMathEcECFieldElement *)getYCoord {
  
#line 30
  OrgBouncycastleMathEcECFieldElement *X = x_;
  
#line 30
  OrgBouncycastleMathEcECFieldElement *L = y_;
  
#line 32
  if ([self isInfinity] || [((OrgBouncycastleMathEcECFieldElement *) nil_chk(X)) isZero]) {
    
#line 34
    return L;
  }
  
#line 38
  OrgBouncycastleMathEcECFieldElement *Y = [((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk(L)) addWithOrgBouncycastleMathEcECFieldElement:X])) multiplyWithOrgBouncycastleMathEcECFieldElement:X];
  
#line 40
  OrgBouncycastleMathEcECFieldElement *Z = IOSObjectArray_Get(nil_chk(zs_), 0);
  if (![((OrgBouncycastleMathEcECFieldElement *) nil_chk(Z)) isOne]) {
    
#line 43
    Y = [((OrgBouncycastleMathEcECFieldElement *) nil_chk(Y)) divideWithOrgBouncycastleMathEcECFieldElement:Z];
  }
  
#line 46
  return Y;
}


#line 49
- (jboolean)getCompressionYTilde {
  
#line 52
  OrgBouncycastleMathEcECFieldElement *X = [self getRawXCoord];
  if ([((OrgBouncycastleMathEcECFieldElement *) nil_chk(X)) isZero]) {
    
#line 55
    return false;
  }
  
#line 58
  OrgBouncycastleMathEcECFieldElement *Y = [self getRawYCoord];
  
#line 61
  return [((OrgBouncycastleMathEcECFieldElement *) nil_chk(Y)) testBitZero] != [X testBitZero];
}


#line 64
- (OrgBouncycastleMathEcECPoint *)addWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)b {
  
#line 67
  if ([self isInfinity]) {
    
#line 69
    return b;
  }
  if ([((OrgBouncycastleMathEcECPoint *) nil_chk(b)) isInfinity]) {
    
#line 73
    return self;
  }
  
#line 76
  OrgBouncycastleMathEcECCurve *curve = [self getCurve];
  
#line 78
  OrgBouncycastleMathEcECFieldElement *X1 = x_;
  OrgBouncycastleMathEcECFieldElement *X2 = [b getRawXCoord];
  
#line 81
  if ([((OrgBouncycastleMathEcECFieldElement *) nil_chk(X1)) isZero]) {
    
#line 83
    if ([((OrgBouncycastleMathEcECFieldElement *) nil_chk(X2)) isZero]) {
      
#line 85
      return [((OrgBouncycastleMathEcECCurve *) nil_chk(curve)) getInfinity];
    }
    
#line 88
    return [b addWithOrgBouncycastleMathEcECPoint:self];
  }
  
#line 91
  OrgBouncycastleMathEcECFieldElement *L1 = y_;
  
#line 91
  OrgBouncycastleMathEcECFieldElement *Z1 = IOSObjectArray_Get(nil_chk(zs_), 0);
  OrgBouncycastleMathEcECFieldElement *L2 = [b getRawYCoord];
  
#line 92
  OrgBouncycastleMathEcECFieldElement *Z2 = [b getZCoordWithInt:0];
  
#line 94
  jboolean Z1IsOne = [((OrgBouncycastleMathEcECFieldElement *) nil_chk(Z1)) isOne];
  OrgBouncycastleMathEcECFieldElement *U2 = X2;
  
#line 95
  OrgBouncycastleMathEcECFieldElement *S2 = L2;
  if (!Z1IsOne) {
    
#line 98
    U2 = [((OrgBouncycastleMathEcECFieldElement *) nil_chk(U2)) multiplyWithOrgBouncycastleMathEcECFieldElement:Z1];
    S2 = [((OrgBouncycastleMathEcECFieldElement *) nil_chk(S2)) multiplyWithOrgBouncycastleMathEcECFieldElement:Z1];
  }
  
#line 102
  jboolean Z2IsOne = [((OrgBouncycastleMathEcECFieldElement *) nil_chk(Z2)) isOne];
  OrgBouncycastleMathEcECFieldElement *U1 = X1;
  
#line 103
  OrgBouncycastleMathEcECFieldElement *S1 = L1;
  if (!Z2IsOne) {
    
#line 106
    U1 = [U1 multiplyWithOrgBouncycastleMathEcECFieldElement:Z2];
    S1 = [((OrgBouncycastleMathEcECFieldElement *) nil_chk(S1)) multiplyWithOrgBouncycastleMathEcECFieldElement:Z2];
  }
  
#line 110
  OrgBouncycastleMathEcECFieldElement *A = [((OrgBouncycastleMathEcECFieldElement *) nil_chk(S1)) addWithOrgBouncycastleMathEcECFieldElement:S2];
  OrgBouncycastleMathEcECFieldElement *B = [((OrgBouncycastleMathEcECFieldElement *) nil_chk(U1)) addWithOrgBouncycastleMathEcECFieldElement:U2];
  
#line 113
  if ([((OrgBouncycastleMathEcECFieldElement *) nil_chk(B)) isZero]) {
    
#line 115
    if ([((OrgBouncycastleMathEcECFieldElement *) nil_chk(A)) isZero]) {
      
#line 117
      return [self twice];
    }
    
#line 120
    return [((OrgBouncycastleMathEcECCurve *) nil_chk(curve)) getInfinity];
  }
  
#line 123
  OrgBouncycastleMathEcECFieldElement *X3;
  
#line 123
  OrgBouncycastleMathEcECFieldElement *L3;
  
#line 123
  OrgBouncycastleMathEcECFieldElement *Z3;
  if ([((OrgBouncycastleMathEcECFieldElement *) nil_chk(X2)) isZero]) {
    
#line 127
    OrgBouncycastleMathEcECPoint *p = [self normalize];
    X1 = [((OrgBouncycastleMathEcECPoint *) nil_chk(p)) getXCoord];
    OrgBouncycastleMathEcECFieldElement *Y1 = [p getYCoord];
    
#line 131
    OrgBouncycastleMathEcECFieldElement *Y2 = L2;
    OrgBouncycastleMathEcECFieldElement *L = [((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk(Y1)) addWithOrgBouncycastleMathEcECFieldElement:Y2])) divideWithOrgBouncycastleMathEcECFieldElement:X1];
    
#line 134
    X3 = [((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk(L)) square])) addWithOrgBouncycastleMathEcECFieldElement:L])) addWithOrgBouncycastleMathEcECFieldElement:X1])) addWithOrgBouncycastleMathEcECFieldElement:[((OrgBouncycastleMathEcECCurve *) nil_chk(curve)) getA]];
    if ([((OrgBouncycastleMathEcECFieldElement *) nil_chk(X3)) isZero]) {
      
#line 137
      return new_OrgBouncycastleMathEcCustomSecSecT193R2Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(curve, X3, [((OrgBouncycastleMathEcECFieldElement *) nil_chk([curve getB])) sqrt]);
    }
    
#line 140
    OrgBouncycastleMathEcECFieldElement *Y3 = [((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk([L multiplyWithOrgBouncycastleMathEcECFieldElement:[((OrgBouncycastleMathEcECFieldElement *) nil_chk(X1)) addWithOrgBouncycastleMathEcECFieldElement:X3]])) addWithOrgBouncycastleMathEcECFieldElement:X3])) addWithOrgBouncycastleMathEcECFieldElement:Y1];
    L3 = [((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk(Y3)) divideWithOrgBouncycastleMathEcECFieldElement:X3])) addWithOrgBouncycastleMathEcECFieldElement:X3];
    Z3 = [curve fromBigIntegerWithJavaMathBigInteger:JreLoadStatic(OrgBouncycastleMathEcECConstants, ONE)];
  }
  else {
    
#line 146
    B = [B square];
    
#line 148
    OrgBouncycastleMathEcECFieldElement *AU1 = [((OrgBouncycastleMathEcECFieldElement *) nil_chk(A)) multiplyWithOrgBouncycastleMathEcECFieldElement:U1];
    OrgBouncycastleMathEcECFieldElement *AU2 = [A multiplyWithOrgBouncycastleMathEcECFieldElement:U2];
    
#line 151
    X3 = [((OrgBouncycastleMathEcECFieldElement *) nil_chk(AU1)) multiplyWithOrgBouncycastleMathEcECFieldElement:AU2];
    if ([((OrgBouncycastleMathEcECFieldElement *) nil_chk(X3)) isZero]) {
      
#line 154
      return new_OrgBouncycastleMathEcCustomSecSecT193R2Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(curve, X3, [((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECCurve *) nil_chk(curve)) getB])) sqrt]);
    }
    
#line 157
    OrgBouncycastleMathEcECFieldElement *ABZ2 = [A multiplyWithOrgBouncycastleMathEcECFieldElement:B];
    if (!Z2IsOne) {
      
#line 160
      ABZ2 = [((OrgBouncycastleMathEcECFieldElement *) nil_chk(ABZ2)) multiplyWithOrgBouncycastleMathEcECFieldElement:Z2];
    }
    
#line 163
    L3 = [((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk(AU2)) addWithOrgBouncycastleMathEcECFieldElement:B])) squarePlusProductWithOrgBouncycastleMathEcECFieldElement:ABZ2 withOrgBouncycastleMathEcECFieldElement:[((OrgBouncycastleMathEcECFieldElement *) nil_chk(L1)) addWithOrgBouncycastleMathEcECFieldElement:Z1]];
    
#line 165
    Z3 = ABZ2;
    if (!Z1IsOne) {
      
#line 168
      Z3 = [((OrgBouncycastleMathEcECFieldElement *) nil_chk(Z3)) multiplyWithOrgBouncycastleMathEcECFieldElement:Z1];
    }
  }
  
#line 172
  return new_OrgBouncycastleMathEcCustomSecSecT193R2Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(curve, X3, L3, [IOSObjectArray newArrayWithObjects:(id[]){ Z3 } count:1 type:OrgBouncycastleMathEcECFieldElement_class_()]);
}


#line 175
- (OrgBouncycastleMathEcECPoint *)twice {
  
#line 178
  if ([self isInfinity]) {
    
#line 180
    return self;
  }
  
#line 183
  OrgBouncycastleMathEcECCurve *curve = [self getCurve];
  
#line 185
  OrgBouncycastleMathEcECFieldElement *X1 = x_;
  if ([((OrgBouncycastleMathEcECFieldElement *) nil_chk(X1)) isZero]) {
    
#line 189
    return [((OrgBouncycastleMathEcECCurve *) nil_chk(curve)) getInfinity];
  }
  
#line 192
  OrgBouncycastleMathEcECFieldElement *L1 = y_;
  
#line 192
  OrgBouncycastleMathEcECFieldElement *Z1 = IOSObjectArray_Get(nil_chk(zs_), 0);
  
#line 194
  jboolean Z1IsOne = [((OrgBouncycastleMathEcECFieldElement *) nil_chk(Z1)) isOne];
  OrgBouncycastleMathEcECFieldElement *L1Z1 = Z1IsOne ? L1 : [((OrgBouncycastleMathEcECFieldElement *) nil_chk(L1)) multiplyWithOrgBouncycastleMathEcECFieldElement:Z1];
  OrgBouncycastleMathEcECFieldElement *Z1Sq = Z1IsOne ? Z1 : [Z1 square];
  OrgBouncycastleMathEcECFieldElement *a = [((OrgBouncycastleMathEcECCurve *) nil_chk(curve)) getA];
  OrgBouncycastleMathEcECFieldElement *aZ1Sq = Z1IsOne ? a : [((OrgBouncycastleMathEcECFieldElement *) nil_chk(a)) multiplyWithOrgBouncycastleMathEcECFieldElement:Z1Sq];
  OrgBouncycastleMathEcECFieldElement *T = [((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk(L1)) square])) addWithOrgBouncycastleMathEcECFieldElement:L1Z1])) addWithOrgBouncycastleMathEcECFieldElement:aZ1Sq];
  if ([((OrgBouncycastleMathEcECFieldElement *) nil_chk(T)) isZero]) {
    
#line 202
    return new_OrgBouncycastleMathEcCustomSecSecT193R2Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(curve, T, [((OrgBouncycastleMathEcECFieldElement *) nil_chk([curve getB])) sqrt]);
  }
  
#line 205
  OrgBouncycastleMathEcECFieldElement *X3 = [T square];
  OrgBouncycastleMathEcECFieldElement *Z3 = Z1IsOne ? T : [T multiplyWithOrgBouncycastleMathEcECFieldElement:Z1Sq];
  
#line 208
  OrgBouncycastleMathEcECFieldElement *X1Z1 = Z1IsOne ? X1 : [X1 multiplyWithOrgBouncycastleMathEcECFieldElement:Z1];
  OrgBouncycastleMathEcECFieldElement *L3 = [((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk([X1Z1 squarePlusProductWithOrgBouncycastleMathEcECFieldElement:T withOrgBouncycastleMathEcECFieldElement:L1Z1])) addWithOrgBouncycastleMathEcECFieldElement:X3])) addWithOrgBouncycastleMathEcECFieldElement:Z3];
  
#line 211
  return new_OrgBouncycastleMathEcCustomSecSecT193R2Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(curve, X3, L3, [IOSObjectArray newArrayWithObjects:(id[]){ Z3 } count:1 type:OrgBouncycastleMathEcECFieldElement_class_()]);
}


#line 214
- (OrgBouncycastleMathEcECPoint *)twicePlusWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)b {
  
#line 217
  if ([self isInfinity]) {
    
#line 219
    return b;
  }
  if ([((OrgBouncycastleMathEcECPoint *) nil_chk(b)) isInfinity]) {
    
#line 223
    return [self twice];
  }
  
#line 226
  OrgBouncycastleMathEcECCurve *curve = [self getCurve];
  
#line 228
  OrgBouncycastleMathEcECFieldElement *X1 = x_;
  if ([((OrgBouncycastleMathEcECFieldElement *) nil_chk(X1)) isZero]) {
    
#line 232
    return b;
  }
  
#line 235
  OrgBouncycastleMathEcECFieldElement *X2 = [b getRawXCoord];
  
#line 235
  OrgBouncycastleMathEcECFieldElement *Z2 = [b getZCoordWithInt:0];
  if ([((OrgBouncycastleMathEcECFieldElement *) nil_chk(X2)) isZero] || ![((OrgBouncycastleMathEcECFieldElement *) nil_chk(Z2)) isOne]) {
    
#line 238
    return [((OrgBouncycastleMathEcECPoint *) nil_chk([self twice])) addWithOrgBouncycastleMathEcECPoint:b];
  }
  
#line 241
  OrgBouncycastleMathEcECFieldElement *L1 = y_;
  
#line 241
  OrgBouncycastleMathEcECFieldElement *Z1 = IOSObjectArray_Get(nil_chk(zs_), 0);
  OrgBouncycastleMathEcECFieldElement *L2 = [b getRawYCoord];
  
#line 244
  OrgBouncycastleMathEcECFieldElement *X1Sq = [X1 square];
  OrgBouncycastleMathEcECFieldElement *L1Sq = [((OrgBouncycastleMathEcECFieldElement *) nil_chk(L1)) square];
  OrgBouncycastleMathEcECFieldElement *Z1Sq = [((OrgBouncycastleMathEcECFieldElement *) nil_chk(Z1)) square];
  OrgBouncycastleMathEcECFieldElement *L1Z1 = [L1 multiplyWithOrgBouncycastleMathEcECFieldElement:Z1];
  
#line 249
  OrgBouncycastleMathEcECFieldElement *T = [((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECCurve *) nil_chk(curve)) getA])) multiplyWithOrgBouncycastleMathEcECFieldElement:Z1Sq])) addWithOrgBouncycastleMathEcECFieldElement:L1Sq])) addWithOrgBouncycastleMathEcECFieldElement:L1Z1];
  OrgBouncycastleMathEcECFieldElement *L2plus1 = [((OrgBouncycastleMathEcECFieldElement *) nil_chk(L2)) addOne];
  OrgBouncycastleMathEcECFieldElement *A = [((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk([curve getA])) addWithOrgBouncycastleMathEcECFieldElement:L2plus1])) multiplyWithOrgBouncycastleMathEcECFieldElement:Z1Sq])) addWithOrgBouncycastleMathEcECFieldElement:L1Sq])) multiplyPlusProductWithOrgBouncycastleMathEcECFieldElement:T withOrgBouncycastleMathEcECFieldElement:X1Sq withOrgBouncycastleMathEcECFieldElement:Z1Sq];
  OrgBouncycastleMathEcECFieldElement *X2Z1Sq = [X2 multiplyWithOrgBouncycastleMathEcECFieldElement:Z1Sq];
  OrgBouncycastleMathEcECFieldElement *B = [((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk(X2Z1Sq)) addWithOrgBouncycastleMathEcECFieldElement:T])) square];
  
#line 255
  if ([((OrgBouncycastleMathEcECFieldElement *) nil_chk(B)) isZero]) {
    
#line 257
    if ([((OrgBouncycastleMathEcECFieldElement *) nil_chk(A)) isZero]) {
      
#line 259
      return [b twice];
    }
    
#line 262
    return [curve getInfinity];
  }
  
#line 265
  if ([((OrgBouncycastleMathEcECFieldElement *) nil_chk(A)) isZero]) {
    
#line 267
    return new_OrgBouncycastleMathEcCustomSecSecT193R2Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(curve, A, [((OrgBouncycastleMathEcECFieldElement *) nil_chk([curve getB])) sqrt]);
  }
  
#line 270
  OrgBouncycastleMathEcECFieldElement *X3 = [((OrgBouncycastleMathEcECFieldElement *) nil_chk([A square])) multiplyWithOrgBouncycastleMathEcECFieldElement:X2Z1Sq];
  OrgBouncycastleMathEcECFieldElement *Z3 = [((OrgBouncycastleMathEcECFieldElement *) nil_chk([A multiplyWithOrgBouncycastleMathEcECFieldElement:B])) multiplyWithOrgBouncycastleMathEcECFieldElement:Z1Sq];
  OrgBouncycastleMathEcECFieldElement *L3 = [((OrgBouncycastleMathEcECFieldElement *) nil_chk([((OrgBouncycastleMathEcECFieldElement *) nil_chk([A addWithOrgBouncycastleMathEcECFieldElement:B])) square])) multiplyPlusProductWithOrgBouncycastleMathEcECFieldElement:T withOrgBouncycastleMathEcECFieldElement:L2plus1 withOrgBouncycastleMathEcECFieldElement:Z3];
  
#line 274
  return new_OrgBouncycastleMathEcCustomSecSecT193R2Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(curve, X3, L3, [IOSObjectArray newArrayWithObjects:(id[]){ Z3 } count:1 type:OrgBouncycastleMathEcECFieldElement_class_()]);
}


#line 277
- (OrgBouncycastleMathEcECPoint *)negate {
  
#line 280
  if ([self isInfinity]) {
    
#line 282
    return self;
  }
  
#line 285
  OrgBouncycastleMathEcECFieldElement *X = x_;
  if ([((OrgBouncycastleMathEcECFieldElement *) nil_chk(X)) isZero]) {
    
#line 288
    return self;
  }
  
#line 292
  OrgBouncycastleMathEcECFieldElement *L = y_;
  
#line 292
  OrgBouncycastleMathEcECFieldElement *Z = IOSObjectArray_Get(nil_chk(zs_), 0);
  return new_OrgBouncycastleMathEcCustomSecSecT193R2Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(curve_, X, [((OrgBouncycastleMathEcECFieldElement *) nil_chk(L)) addWithOrgBouncycastleMathEcECFieldElement:Z], [IOSObjectArray newArrayWithObjects:(id[]){ Z } count:1 type:OrgBouncycastleMathEcECFieldElement_class_()]);
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x0, -1, 0, -1, -1, -1, -1 },
    { NULL, NULL, 0x0, -1, 1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECPoint;", 0x4, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECFieldElement;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "Z", 0x4, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECPoint;", 0x1, 2, 3, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECPoint;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECPoint;", 0x1, 4, 3, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcECPoint;", 0x1, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithOrgBouncycastleMathEcECCurve:withOrgBouncycastleMathEcECFieldElement:withOrgBouncycastleMathEcECFieldElement:);
  methods[1].selector = @selector(initWithOrgBouncycastleMathEcECCurve:withOrgBouncycastleMathEcECFieldElement:withOrgBouncycastleMathEcECFieldElement:withOrgBouncycastleMathEcECFieldElementArray:);
  methods[2].selector = @selector(detach);
  methods[3].selector = @selector(getYCoord);
  methods[4].selector = @selector(getCompressionYTilde);
  methods[5].selector = @selector(addWithOrgBouncycastleMathEcECPoint:);
  methods[6].selector = @selector(twice);
  methods[7].selector = @selector(twicePlusWithOrgBouncycastleMathEcECPoint:);
  methods[8].selector = @selector(negate);
  #pragma clang diagnostic pop
  static const void *ptrTable[] = { "LOrgBouncycastleMathEcECCurve;LOrgBouncycastleMathEcECFieldElement;LOrgBouncycastleMathEcECFieldElement;", "LOrgBouncycastleMathEcECCurve;LOrgBouncycastleMathEcECFieldElement;LOrgBouncycastleMathEcECFieldElement;[LOrgBouncycastleMathEcECFieldElement;", "add", "LOrgBouncycastleMathEcECPoint;", "twicePlus" };
  static const J2ObjcClassInfo _OrgBouncycastleMathEcCustomSecSecT193R2Point = { "SecT193R2Point", "org.bouncycastle.math.ec.custom.sec", ptrTable, methods, NULL, 7, 0x1, 9, 0, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleMathEcCustomSecSecT193R2Point;
}

@end


#line 11
void OrgBouncycastleMathEcCustomSecSecT193R2Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(OrgBouncycastleMathEcCustomSecSecT193R2Point *self, OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECFieldElement *x, OrgBouncycastleMathEcECFieldElement *y) {
  OrgBouncycastleMathEcECPoint_AbstractF2m_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(self,
#line 13
  curve, x, y);
}


#line 11
OrgBouncycastleMathEcCustomSecSecT193R2Point *new_OrgBouncycastleMathEcCustomSecSecT193R2Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECFieldElement *x, OrgBouncycastleMathEcECFieldElement *y) {
  J2OBJC_NEW_IMPL(OrgBouncycastleMathEcCustomSecSecT193R2Point, initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_, curve, x, y)
}


#line 11
OrgBouncycastleMathEcCustomSecSecT193R2Point *create_OrgBouncycastleMathEcCustomSecSecT193R2Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECFieldElement *x, OrgBouncycastleMathEcECFieldElement *y) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleMathEcCustomSecSecT193R2Point, initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_, curve, x, y)
}


#line 16
void OrgBouncycastleMathEcCustomSecSecT193R2Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(OrgBouncycastleMathEcCustomSecSecT193R2Point *self, OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECFieldElement *x, OrgBouncycastleMathEcECFieldElement *y, IOSObjectArray *zs) {
  OrgBouncycastleMathEcECPoint_AbstractF2m_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(self,
#line 18
  curve, x, y, zs);
}


#line 16
OrgBouncycastleMathEcCustomSecSecT193R2Point *new_OrgBouncycastleMathEcCustomSecSecT193R2Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECFieldElement *x, OrgBouncycastleMathEcECFieldElement *y, IOSObjectArray *zs) {
  J2OBJC_NEW_IMPL(OrgBouncycastleMathEcCustomSecSecT193R2Point, initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_, curve, x, y, zs)
}


#line 16
OrgBouncycastleMathEcCustomSecSecT193R2Point *create_OrgBouncycastleMathEcCustomSecSecT193R2Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECFieldElement *x, OrgBouncycastleMathEcECFieldElement *y, IOSObjectArray *zs) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleMathEcCustomSecSecT193R2Point, initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_, curve, x, y, zs)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleMathEcCustomSecSecT193R2Point)
