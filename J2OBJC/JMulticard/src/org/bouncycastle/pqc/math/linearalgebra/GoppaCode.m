//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/math/linearalgebra/GoppaCode.java
//

#include "IOSObjectArray.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/lang/ArithmeticException.h"
#include "java/security/SecureRandom.h"
#include "org/bouncycastle/pqc/math/linearalgebra/GF2Matrix.h"
#include "org/bouncycastle/pqc/math/linearalgebra/GF2Vector.h"
#include "org/bouncycastle/pqc/math/linearalgebra/GF2mField.h"
#include "org/bouncycastle/pqc/math/linearalgebra/GF2mVector.h"
#include "org/bouncycastle/pqc/math/linearalgebra/GoppaCode.h"
#include "org/bouncycastle/pqc/math/linearalgebra/Matrix.h"
#include "org/bouncycastle/pqc/math/linearalgebra/Permutation.h"
#include "org/bouncycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/pqc/math/linearalgebra/GoppaCode must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastlePqcMathLinearalgebraGoppaCode ()

/*!
 @brief Default constructor (private).
 */
- (instancetype)init;

@end

__attribute__((unused)) static void OrgBouncycastlePqcMathLinearalgebraGoppaCode_init(OrgBouncycastlePqcMathLinearalgebraGoppaCode *self);

__attribute__((unused)) static OrgBouncycastlePqcMathLinearalgebraGoppaCode *new_OrgBouncycastlePqcMathLinearalgebraGoppaCode_init(void) NS_RETURNS_RETAINED;

__attribute__((unused)) static OrgBouncycastlePqcMathLinearalgebraGoppaCode *create_OrgBouncycastlePqcMathLinearalgebraGoppaCode_init(void);

@interface OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe () {
 @public
  OrgBouncycastlePqcMathLinearalgebraGF2Matrix *s_;
  OrgBouncycastlePqcMathLinearalgebraGF2Matrix *h_;
  OrgBouncycastlePqcMathLinearalgebraPermutation *p_;
}

@end

J2OBJC_FIELD_SETTER(OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe, s_, OrgBouncycastlePqcMathLinearalgebraGF2Matrix *)
J2OBJC_FIELD_SETTER(OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe, h_, OrgBouncycastlePqcMathLinearalgebraGF2Matrix *)
J2OBJC_FIELD_SETTER(OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe, p_, OrgBouncycastlePqcMathLinearalgebraPermutation *)

@interface OrgBouncycastlePqcMathLinearalgebraGoppaCode_MatrixSet () {
 @public
  OrgBouncycastlePqcMathLinearalgebraGF2Matrix *g_;
  IOSIntArray *setJ_;
}

@end

J2OBJC_FIELD_SETTER(OrgBouncycastlePqcMathLinearalgebraGoppaCode_MatrixSet, g_, OrgBouncycastlePqcMathLinearalgebraGF2Matrix *)
J2OBJC_FIELD_SETTER(OrgBouncycastlePqcMathLinearalgebraGoppaCode_MatrixSet, setJ_, IOSIntArray *)

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/math/linearalgebra/GoppaCode.java"


#line 13
@implementation OrgBouncycastlePqcMathLinearalgebraGoppaCode

J2OBJC_IGNORE_DESIGNATED_BEGIN

#line 19
- (instancetype)init {
  OrgBouncycastlePqcMathLinearalgebraGoppaCode_init(self);
  return self;
}
J2OBJC_IGNORE_DESIGNATED_END


#line 136
+ (OrgBouncycastlePqcMathLinearalgebraGF2Matrix *)createCanonicalCheckMatrixWithOrgBouncycastlePqcMathLinearalgebraGF2mField:(OrgBouncycastlePqcMathLinearalgebraGF2mField *)field
                                                                 withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM:(OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *)gp {
  return OrgBouncycastlePqcMathLinearalgebraGoppaCode_createCanonicalCheckMatrixWithOrgBouncycastlePqcMathLinearalgebraGF2mField_withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM_(field, gp);
}


#line 214
+ (OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe *)computeSystematicFormWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix:(OrgBouncycastlePqcMathLinearalgebraGF2Matrix *)h
                                                                                                  withJavaSecuritySecureRandom:(JavaSecuritySecureRandom *)sr {
  return OrgBouncycastlePqcMathLinearalgebraGoppaCode_computeSystematicFormWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withJavaSecuritySecureRandom_(h, sr);
}


#line 256
+ (OrgBouncycastlePqcMathLinearalgebraGF2Vector *)syndromeDecodeWithOrgBouncycastlePqcMathLinearalgebraGF2Vector:(OrgBouncycastlePqcMathLinearalgebraGF2Vector *)syndVec
                                                                withOrgBouncycastlePqcMathLinearalgebraGF2mField:(OrgBouncycastlePqcMathLinearalgebraGF2mField *)field
                                                     withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM:(OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *)gp
                                                withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallMArray:(IOSObjectArray *)sqRootMatrix {
  return OrgBouncycastlePqcMathLinearalgebraGoppaCode_syndromeDecodeWithOrgBouncycastlePqcMathLinearalgebraGF2Vector_withOrgBouncycastlePqcMathLinearalgebraGF2mField_withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM_withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallMArray_(syndVec, field, gp, sqRootMatrix);
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x2, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastlePqcMathLinearalgebraGF2Matrix;", 0x9, 0, 1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe;", 0x9, 2, 3, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastlePqcMathLinearalgebraGF2Vector;", 0x9, 4, 5, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(init);
  methods[1].selector = @selector(createCanonicalCheckMatrixWithOrgBouncycastlePqcMathLinearalgebraGF2mField:withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM:);
  methods[2].selector = @selector(computeSystematicFormWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix:withJavaSecuritySecureRandom:);
  methods[3].selector = @selector(syndromeDecodeWithOrgBouncycastlePqcMathLinearalgebraGF2Vector:withOrgBouncycastlePqcMathLinearalgebraGF2mField:withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM:withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallMArray:);
  #pragma clang diagnostic pop
  static const void *ptrTable[] = { "createCanonicalCheckMatrix", "LOrgBouncycastlePqcMathLinearalgebraGF2mField;LOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM;", "computeSystematicForm", "LOrgBouncycastlePqcMathLinearalgebraGF2Matrix;LJavaSecuritySecureRandom;", "syndromeDecode", "LOrgBouncycastlePqcMathLinearalgebraGF2Vector;LOrgBouncycastlePqcMathLinearalgebraGF2mField;LOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM;[LOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM;", "LOrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe;LOrgBouncycastlePqcMathLinearalgebraGoppaCode_MatrixSet;" };
  static const J2ObjcClassInfo _OrgBouncycastlePqcMathLinearalgebraGoppaCode = { "GoppaCode", "org.bouncycastle.pqc.math.linearalgebra", ptrTable, methods, NULL, 7, 0x11, 4, 0, -1, 6, -1, -1, -1 };
  return &_OrgBouncycastlePqcMathLinearalgebraGoppaCode;
}

@end


#line 19
void OrgBouncycastlePqcMathLinearalgebraGoppaCode_init(OrgBouncycastlePqcMathLinearalgebraGoppaCode *self) {
  NSObject_init(self);
}


#line 19
OrgBouncycastlePqcMathLinearalgebraGoppaCode *new_OrgBouncycastlePqcMathLinearalgebraGoppaCode_init() {
  J2OBJC_NEW_IMPL(OrgBouncycastlePqcMathLinearalgebraGoppaCode, init)
}


#line 19
OrgBouncycastlePqcMathLinearalgebraGoppaCode *create_OrgBouncycastlePqcMathLinearalgebraGoppaCode_init() {
  J2OBJC_CREATE_IMPL(OrgBouncycastlePqcMathLinearalgebraGoppaCode, init)
}


#line 136
OrgBouncycastlePqcMathLinearalgebraGF2Matrix *OrgBouncycastlePqcMathLinearalgebraGoppaCode_createCanonicalCheckMatrixWithOrgBouncycastlePqcMathLinearalgebraGF2mField_withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM_(OrgBouncycastlePqcMathLinearalgebraGF2mField *field, OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *gp) {
  OrgBouncycastlePqcMathLinearalgebraGoppaCode_initialize();
  
#line 139
  jint m = [((OrgBouncycastlePqcMathLinearalgebraGF2mField *) nil_chk(field)) getDegree];
  jint n = JreLShift32(1, m);
  jint t = [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(gp)) getDegree];
  
#line 145
  IOSObjectArray *hArray = [IOSIntArray newArrayWithDimensions:2 lengths:(jint[]){ t, n }];
  
#line 148
  IOSObjectArray *yz = [IOSIntArray newArrayWithDimensions:2 lengths:(jint[]){ t, n }];
  for (jint j = 0; j < n; j++) {
    
#line 152
    *IOSIntArray_GetRef(nil_chk(IOSObjectArray_Get(yz, 0)), j) = [field inverseWithInt:[gp evaluateAtWithInt:j]];
  }
  
#line 155
  for (jint i = 1; i < t; i++) {
    
#line 157
    for (jint j = 0; j < n; j++) {
      
#line 160
      *IOSIntArray_GetRef(nil_chk(IOSObjectArray_Get(yz, i)), j) = [field multWithInt:IOSIntArray_Get(nil_chk(IOSObjectArray_Get(yz, i - 1)), j) withInt:j];
    }
  }
  
#line 165
  for (jint i = 0; i < t; i++) {
    
#line 167
    for (jint j = 0; j < n; j++) {
      
#line 169
      for (jint k = 0; k <= i; k++) {
        
#line 171
        *IOSIntArray_GetRef(nil_chk(IOSObjectArray_Get(hArray, i)), j) = [field addWithInt:IOSIntArray_Get(nil_chk(IOSObjectArray_Get(hArray, i)), j) withInt:[field multWithInt:IOSIntArray_Get(nil_chk(IOSObjectArray_Get(yz, k)), j) withInt:
#line 172
        [gp getCoefficientWithInt:t + k - i]]];
      }
    }
  }
  
#line 179
  IOSObjectArray *result = [IOSIntArray newArrayWithDimensions:2 lengths:(jint[]){ t * m, JreURShift32((n + 31), 5) }];
  
#line 181
  for (jint j = 0; j < n; j++) {
    
#line 183
    jint q = JreURShift32(j, 5);
    jint r = JreLShift32(1, (j & (jint) 0x1f));
    for (jint i = 0; i < t; i++) {
      
#line 187
      jint e = IOSIntArray_Get(nil_chk(IOSObjectArray_Get(hArray, i)), j);
      for (jint u = 0; u < m; u++) {
        
#line 190
        jint b = (JreURShift32(e, u)) & 1;
        if (b != 0) {
          
#line 193
          jint ind = (i + 1) * m - u - 1;
          *IOSIntArray_GetRef(nil_chk(IOSObjectArray_Get(result, ind)), q) ^= r;
        }
      }
    }
  }
  
#line 200
  return new_OrgBouncycastlePqcMathLinearalgebraGF2Matrix_initWithInt_withIntArray2_(n, result);
}

OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe *OrgBouncycastlePqcMathLinearalgebraGoppaCode_computeSystematicFormWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withJavaSecuritySecureRandom_(OrgBouncycastlePqcMathLinearalgebraGF2Matrix *h, JavaSecuritySecureRandom *sr) {
  OrgBouncycastlePqcMathLinearalgebraGoppaCode_initialize();
  jint n = [((OrgBouncycastlePqcMathLinearalgebraGF2Matrix *) nil_chk(h)) getNumColumns];
  OrgBouncycastlePqcMathLinearalgebraGF2Matrix *hp;
  
#line 217
  OrgBouncycastlePqcMathLinearalgebraGF2Matrix *sInv;
  OrgBouncycastlePqcMathLinearalgebraGF2Matrix *s = nil;
  OrgBouncycastlePqcMathLinearalgebraPermutation *p;
  jboolean found = false;
  
#line 222
  do {
    
#line 224
    p = new_OrgBouncycastlePqcMathLinearalgebraPermutation_initWithInt_withJavaSecuritySecureRandom_(n, sr);
    hp = (OrgBouncycastlePqcMathLinearalgebraGF2Matrix *) cast_chk([h rightMultiplyWithOrgBouncycastlePqcMathLinearalgebraPermutation:p], [OrgBouncycastlePqcMathLinearalgebraGF2Matrix class]);
    sInv = [((OrgBouncycastlePqcMathLinearalgebraGF2Matrix *) nil_chk(hp)) getLeftSubMatrix];
    @try {
      
#line 229
      found = true;
      s = (OrgBouncycastlePqcMathLinearalgebraGF2Matrix *) cast_chk([((OrgBouncycastlePqcMathLinearalgebraGF2Matrix *) nil_chk(sInv)) computeInverse], [OrgBouncycastlePqcMathLinearalgebraGF2Matrix class]);
    }
    @catch (JavaLangArithmeticException *ae) {
      
#line 234
      found = false;
    }
  }
  while (!found);
  
#line 239
  OrgBouncycastlePqcMathLinearalgebraGF2Matrix *shp = (OrgBouncycastlePqcMathLinearalgebraGF2Matrix *) cast_chk([((OrgBouncycastlePqcMathLinearalgebraGF2Matrix *) nil_chk(s)) rightMultiplyWithOrgBouncycastlePqcMathLinearalgebraMatrix:hp], [OrgBouncycastlePqcMathLinearalgebraGF2Matrix class]);
  OrgBouncycastlePqcMathLinearalgebraGF2Matrix *m = [((OrgBouncycastlePqcMathLinearalgebraGF2Matrix *) nil_chk(shp)) getRightSubMatrix];
  
#line 242
  return new_OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe_initWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withOrgBouncycastlePqcMathLinearalgebraPermutation_(sInv, m, p);
}


#line 256
OrgBouncycastlePqcMathLinearalgebraGF2Vector *OrgBouncycastlePqcMathLinearalgebraGoppaCode_syndromeDecodeWithOrgBouncycastlePqcMathLinearalgebraGF2Vector_withOrgBouncycastlePqcMathLinearalgebraGF2mField_withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM_withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallMArray_(OrgBouncycastlePqcMathLinearalgebraGF2Vector *syndVec, OrgBouncycastlePqcMathLinearalgebraGF2mField *field, OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *gp, IOSObjectArray *sqRootMatrix) {
  OrgBouncycastlePqcMathLinearalgebraGoppaCode_initialize();
  
#line 260
  jint n = JreLShift32(1, [((OrgBouncycastlePqcMathLinearalgebraGF2mField *) nil_chk(field)) getDegree]);
  
#line 263
  OrgBouncycastlePqcMathLinearalgebraGF2Vector *errors = new_OrgBouncycastlePqcMathLinearalgebraGF2Vector_initWithInt_(n);
  
#line 266
  if (![((OrgBouncycastlePqcMathLinearalgebraGF2Vector *) nil_chk(syndVec)) isZero]) {
    
#line 269
    OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *syndrome = new_OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM_initWithOrgBouncycastlePqcMathLinearalgebraGF2mVector_([syndVec toExtensionFieldVectorWithOrgBouncycastlePqcMathLinearalgebraGF2mField:
#line 270
    field]);
    
#line 273
    OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *t = [syndrome modInverseWithOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM:gp];
    
#line 276
    OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *tau = [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(t)) addMonomialWithInt:1];
    tau = [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(tau)) modSquareRootMatrixWithOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallMArray:sqRootMatrix];
    
#line 280
    IOSObjectArray *ab = [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(tau)) modPolynomialToFractonWithOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM:gp];
    
#line 283
    OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *a2 = [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(IOSObjectArray_Get(nil_chk(ab), 0))) multiplyWithOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM:IOSObjectArray_Get(ab, 0)];
    OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *b2 = [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(IOSObjectArray_Get(ab, 1))) multiplyWithOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM:IOSObjectArray_Get(ab, 1)];
    OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *xb2 = [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(b2)) multWithMonomialWithInt:1];
    OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *a2plusXb2 = [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(a2)) addWithOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM:xb2];
    
#line 289
    jint headCoeff = [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(a2plusXb2)) getHeadCoefficient];
    jint invHeadCoeff = [field inverseWithInt:headCoeff];
    OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *elp = [a2plusXb2 multWithElementWithInt:invHeadCoeff];
    
#line 294
    for (jint i = 0; i < n; i++) {
      
#line 297
      jint z = [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(elp)) evaluateAtWithInt:i];
      
#line 299
      if (z == 0) {
        
#line 302
        [errors setBitWithInt:i];
      }
    }
  }
  
#line 307
  return errors;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastlePqcMathLinearalgebraGoppaCode)

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/math/linearalgebra/GoppaCode.java"


#line 33
@implementation OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe


#line 47
- (instancetype)initWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix:(OrgBouncycastlePqcMathLinearalgebraGF2Matrix *)s
                    withOrgBouncycastlePqcMathLinearalgebraGF2Matrix:(OrgBouncycastlePqcMathLinearalgebraGF2Matrix *)h
                  withOrgBouncycastlePqcMathLinearalgebraPermutation:(OrgBouncycastlePqcMathLinearalgebraPermutation *)p {
  OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe_initWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withOrgBouncycastlePqcMathLinearalgebraPermutation_(self, s, h, p);
  return self;
}


#line 57
- (OrgBouncycastlePqcMathLinearalgebraGF2Matrix *)getFirstMatrix {
  
#line 59
  return s_;
}


#line 65
- (OrgBouncycastlePqcMathLinearalgebraGF2Matrix *)getSecondMatrix {
  
#line 67
  return h_;
}


#line 73
- (OrgBouncycastlePqcMathLinearalgebraPermutation *)getPermutation {
  
#line 75
  return p_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, 0, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastlePqcMathLinearalgebraGF2Matrix;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastlePqcMathLinearalgebraGF2Matrix;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastlePqcMathLinearalgebraPermutation;", 0x1, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix:withOrgBouncycastlePqcMathLinearalgebraGF2Matrix:withOrgBouncycastlePqcMathLinearalgebraPermutation:);
  methods[1].selector = @selector(getFirstMatrix);
  methods[2].selector = @selector(getSecondMatrix);
  methods[3].selector = @selector(getPermutation);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "s_", "LOrgBouncycastlePqcMathLinearalgebraGF2Matrix;", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "h_", "LOrgBouncycastlePqcMathLinearalgebraGF2Matrix;", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "p_", "LOrgBouncycastlePqcMathLinearalgebraPermutation;", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "LOrgBouncycastlePqcMathLinearalgebraGF2Matrix;LOrgBouncycastlePqcMathLinearalgebraGF2Matrix;LOrgBouncycastlePqcMathLinearalgebraPermutation;", "LOrgBouncycastlePqcMathLinearalgebraGoppaCode;" };
  static const J2ObjcClassInfo _OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe = { "MaMaPe", "org.bouncycastle.pqc.math.linearalgebra", ptrTable, methods, fields, 7, 0x9, 4, 3, 1, -1, -1, -1, -1 };
  return &_OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe;
}

@end


#line 47
void OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe_initWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withOrgBouncycastlePqcMathLinearalgebraPermutation_(OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe *self, OrgBouncycastlePqcMathLinearalgebraGF2Matrix *s, OrgBouncycastlePqcMathLinearalgebraGF2Matrix *h, OrgBouncycastlePqcMathLinearalgebraPermutation *p) {
  NSObject_init(self);
  self->s_ = s;
  self->h_ = h;
  self->p_ = p;
}


#line 47
OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe *new_OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe_initWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withOrgBouncycastlePqcMathLinearalgebraPermutation_(OrgBouncycastlePqcMathLinearalgebraGF2Matrix *s, OrgBouncycastlePqcMathLinearalgebraGF2Matrix *h, OrgBouncycastlePqcMathLinearalgebraPermutation *p) {
  J2OBJC_NEW_IMPL(OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe, initWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withOrgBouncycastlePqcMathLinearalgebraPermutation_, s, h, p)
}


#line 47
OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe *create_OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe_initWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withOrgBouncycastlePqcMathLinearalgebraPermutation_(OrgBouncycastlePqcMathLinearalgebraGF2Matrix *s, OrgBouncycastlePqcMathLinearalgebraGF2Matrix *h, OrgBouncycastlePqcMathLinearalgebraPermutation *p) {
  J2OBJC_CREATE_IMPL(OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe, initWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withOrgBouncycastlePqcMathLinearalgebraPermutation_, s, h, p)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastlePqcMathLinearalgebraGoppaCode_MaMaPe)

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/math/linearalgebra/GoppaCode.java"


#line 88
@implementation OrgBouncycastlePqcMathLinearalgebraGoppaCode_MatrixSet


#line 104
- (instancetype)initWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix:(OrgBouncycastlePqcMathLinearalgebraGF2Matrix *)g
                                                        withIntArray:(IOSIntArray *)setJ {
  OrgBouncycastlePqcMathLinearalgebraGoppaCode_MatrixSet_initWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withIntArray_(self, g, setJ);
  return self;
}


#line 113
- (OrgBouncycastlePqcMathLinearalgebraGF2Matrix *)getG {
  
#line 115
  return g_;
}


#line 122
- (IOSIntArray *)getSetJ {
  
#line 124
  return setJ_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, 0, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastlePqcMathLinearalgebraGF2Matrix;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "[I", 0x1, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix:withIntArray:);
  methods[1].selector = @selector(getG);
  methods[2].selector = @selector(getSetJ);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "g_", "LOrgBouncycastlePqcMathLinearalgebraGF2Matrix;", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "setJ_", "[I", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "LOrgBouncycastlePqcMathLinearalgebraGF2Matrix;[I", "LOrgBouncycastlePqcMathLinearalgebraGoppaCode;" };
  static const J2ObjcClassInfo _OrgBouncycastlePqcMathLinearalgebraGoppaCode_MatrixSet = { "MatrixSet", "org.bouncycastle.pqc.math.linearalgebra", ptrTable, methods, fields, 7, 0x9, 3, 2, 1, -1, -1, -1, -1 };
  return &_OrgBouncycastlePqcMathLinearalgebraGoppaCode_MatrixSet;
}

@end


#line 104
void OrgBouncycastlePqcMathLinearalgebraGoppaCode_MatrixSet_initWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withIntArray_(OrgBouncycastlePqcMathLinearalgebraGoppaCode_MatrixSet *self, OrgBouncycastlePqcMathLinearalgebraGF2Matrix *g, IOSIntArray *setJ) {
  NSObject_init(self);
  self->g_ = g;
  self->setJ_ = setJ;
}


#line 104
OrgBouncycastlePqcMathLinearalgebraGoppaCode_MatrixSet *new_OrgBouncycastlePqcMathLinearalgebraGoppaCode_MatrixSet_initWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withIntArray_(OrgBouncycastlePqcMathLinearalgebraGF2Matrix *g, IOSIntArray *setJ) {
  J2OBJC_NEW_IMPL(OrgBouncycastlePqcMathLinearalgebraGoppaCode_MatrixSet, initWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withIntArray_, g, setJ)
}


#line 104
OrgBouncycastlePqcMathLinearalgebraGoppaCode_MatrixSet *create_OrgBouncycastlePqcMathLinearalgebraGoppaCode_MatrixSet_initWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withIntArray_(OrgBouncycastlePqcMathLinearalgebraGF2Matrix *g, IOSIntArray *setJ) {
  J2OBJC_CREATE_IMPL(OrgBouncycastlePqcMathLinearalgebraGoppaCode_MatrixSet, initWithOrgBouncycastlePqcMathLinearalgebraGF2Matrix_withIntArray_, g, setJ)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastlePqcMathLinearalgebraGoppaCode_MatrixSet)
