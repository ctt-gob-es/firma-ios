//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/math/linearalgebra/PolynomialRingGF2m.java
//

#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/lang/ArithmeticException.h"
#include "org/bouncycastle/pqc/math/linearalgebra/GF2mField.h"
#include "org/bouncycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM.h"
#include "org/bouncycastle/pqc/math/linearalgebra/PolynomialRingGF2m.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/pqc/math/linearalgebra/PolynomialRingGF2m must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m () {
 @public
  /*!
   @brief the finite field this polynomial ring is defined over
   */
  OrgBouncycastlePqcMathLinearalgebraGF2mField *field_;
  /*!
   @brief the reduction polynomial
   */
  OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *p_;
}

/*!
 @brief Compute the squaring matrix for this polynomial ring, using the base
  field and the reduction polynomial.
 */
- (void)computeSquaringMatrix;

/*!
 @brief Compute the matrix for computing square roots in this polynomial ring by
  inverting the squaring matrix.
 */
- (void)computeSquareRootMatrix;

+ (void)swapColumnsWithOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallMArray:(IOSObjectArray *)matrix
                                                                            withInt:(jint)first
                                                                            withInt:(jint)second;

@end

J2OBJC_FIELD_SETTER(OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m, field_, OrgBouncycastlePqcMathLinearalgebraGF2mField *)
J2OBJC_FIELD_SETTER(OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m, p_, OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *)

__attribute__((unused)) static void OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m_computeSquaringMatrix(OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m *self);

__attribute__((unused)) static void OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m_computeSquareRootMatrix(OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m *self);

__attribute__((unused)) static void OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m_swapColumnsWithOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallMArray_withInt_withInt_(IOSObjectArray *matrix, jint first, jint second);

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/math/linearalgebra/PolynomialRingGF2m.java"


#line 8
@implementation OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m


#line 40
- (instancetype)initWithOrgBouncycastlePqcMathLinearalgebraGF2mField:(OrgBouncycastlePqcMathLinearalgebraGF2mField *)field
         withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM:(OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *)p {
  OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m_initWithOrgBouncycastlePqcMathLinearalgebraGF2mField_withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM_(self, field, p);
  return self;
}


#line 51
- (IOSObjectArray *)getSquaringMatrix {
  
#line 53
  return sqMatrix_;
}


#line 59
- (IOSObjectArray *)getSquareRootMatrix {
  
#line 61
  return sqRootMatrix_;
}


#line 68
- (void)computeSquaringMatrix {
  OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m_computeSquaringMatrix(self);
}


#line 92
- (void)computeSquareRootMatrix {
  OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m_computeSquareRootMatrix(self);
}


#line 167
+ (void)swapColumnsWithOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallMArray:(IOSObjectArray *)matrix
                                                                            withInt:(jint)first
                                                                            withInt:(jint)second {
  OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m_swapColumnsWithOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallMArray_withInt_withInt_(matrix, first, second);
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, 0, -1, -1, -1, -1 },
    { NULL, "[LOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "[LOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "V", 0x2, -1, -1, -1, -1, -1, -1 },
    { NULL, "V", 0x2, -1, -1, -1, -1, -1, -1 },
    { NULL, "V", 0xa, 1, 2, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithOrgBouncycastlePqcMathLinearalgebraGF2mField:withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM:);
  methods[1].selector = @selector(getSquaringMatrix);
  methods[2].selector = @selector(getSquareRootMatrix);
  methods[3].selector = @selector(computeSquaringMatrix);
  methods[4].selector = @selector(computeSquareRootMatrix);
  methods[5].selector = @selector(swapColumnsWithOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallMArray:withInt:withInt:);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "field_", "LOrgBouncycastlePqcMathLinearalgebraGF2mField;", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "p_", "LOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM;", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "sqMatrix_", "[LOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM;", .constantValue.asLong = 0, 0x4, -1, -1, -1, -1 },
    { "sqRootMatrix_", "[LOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM;", .constantValue.asLong = 0, 0x4, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "LOrgBouncycastlePqcMathLinearalgebraGF2mField;LOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM;", "swapColumns", "[LOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM;II" };
  static const J2ObjcClassInfo _OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m = { "PolynomialRingGF2m", "org.bouncycastle.pqc.math.linearalgebra", ptrTable, methods, fields, 7, 0x1, 6, 4, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m;
}

@end


#line 40
void OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m_initWithOrgBouncycastlePqcMathLinearalgebraGF2mField_withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM_(OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m *self, OrgBouncycastlePqcMathLinearalgebraGF2mField *field, OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *p) {
  NSObject_init(self);
  self->field_ = field;
  self->p_ = p;
  OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m_computeSquaringMatrix(self);
  OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m_computeSquareRootMatrix(self);
}


#line 40
OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m *new_OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m_initWithOrgBouncycastlePqcMathLinearalgebraGF2mField_withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM_(OrgBouncycastlePqcMathLinearalgebraGF2mField *field, OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *p) {
  J2OBJC_NEW_IMPL(OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m, initWithOrgBouncycastlePqcMathLinearalgebraGF2mField_withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM_, field, p)
}


#line 40
OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m *create_OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m_initWithOrgBouncycastlePqcMathLinearalgebraGF2mField_withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM_(OrgBouncycastlePqcMathLinearalgebraGF2mField *field, OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *p) {
  J2OBJC_CREATE_IMPL(OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m, initWithOrgBouncycastlePqcMathLinearalgebraGF2mField_withOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM_, field, p)
}


#line 68
void OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m_computeSquaringMatrix(OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m *self) {
  
#line 70
  jint numColumns = [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(self->p_)) getDegree];
  self->sqMatrix_ = [IOSObjectArray newArrayWithLength:numColumns type:OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM_class_()];
  for (jint i = 0; i < JreRShift32(numColumns, 1); i++) {
    
#line 74
    IOSIntArray *monomCoeffs = [IOSIntArray newArrayWithLength:(JreLShift32(i, 1)) + 1];
    *IOSIntArray_GetRef(monomCoeffs, JreLShift32(i, 1)) = 1;
    (void) IOSObjectArray_SetAndConsume(nil_chk(self->sqMatrix_), i, new_OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM_initWithOrgBouncycastlePqcMathLinearalgebraGF2mField_withIntArray_(self->field_, monomCoeffs));
  }
  for (jint i = JreRShift32(numColumns, 1); i < numColumns; i++) {
    
#line 80
    IOSIntArray *monomCoeffs = [IOSIntArray newArrayWithLength:(JreLShift32(i, 1)) + 1];
    *IOSIntArray_GetRef(monomCoeffs, JreLShift32(i, 1)) = 1;
    OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *monomial = new_OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM_initWithOrgBouncycastlePqcMathLinearalgebraGF2mField_withIntArray_(self->field_,
#line 83
    monomCoeffs);
    (void) IOSObjectArray_Set(nil_chk(self->sqMatrix_), i, [monomial modWithOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM:self->p_]);
  }
}

void OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m_computeSquareRootMatrix(OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m *self) {
  
#line 94
  jint numColumns = [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(self->p_)) getDegree];
  
#line 97
  IOSObjectArray *tmpMatrix = [IOSObjectArray newArrayWithLength:numColumns type:OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM_class_()];
  for (jint i = numColumns - 1; i >= 0; i--) {
    
#line 100
    (void) IOSObjectArray_SetAndConsume(tmpMatrix, i, new_OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM_initWithOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM_(IOSObjectArray_Get(nil_chk(self->sqMatrix_), i)));
  }
  
#line 104
  self->sqRootMatrix_ = [IOSObjectArray newArrayWithLength:numColumns type:OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM_class_()];
  for (jint i = numColumns - 1; i >= 0; i--) {
    
#line 107
    (void) IOSObjectArray_SetAndConsume(nil_chk(self->sqRootMatrix_), i, new_OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM_initWithOrgBouncycastlePqcMathLinearalgebraGF2mField_withInt_(self->field_, i));
  }
  
#line 112
  for (jint i = 0; i < numColumns; i++) {
    
#line 115
    if ([((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(IOSObjectArray_Get(tmpMatrix, i))) getCoefficientWithInt:i] == 0) {
      
#line 117
      jboolean foundNonZero = false;
      
#line 119
      for (jint j = i + 1; j < numColumns; j++) {
        
#line 121
        if ([((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(IOSObjectArray_Get(tmpMatrix, j))) getCoefficientWithInt:i] != 0) {
          
#line 124
          foundNonZero = true;
          OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m_swapColumnsWithOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallMArray_withInt_withInt_(tmpMatrix, i, j);
          OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m_swapColumnsWithOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallMArray_withInt_withInt_(self->sqRootMatrix_, i, j);
          
#line 128
          j = numColumns;
          continue;
        }
      }
      
#line 133
      if (!foundNonZero) {
        
#line 136
        @throw new_JavaLangArithmeticException_initWithNSString_(
#line 137
        @"Squaring matrix is not invertible.");
      }
    }
    
#line 142
    jint coef = [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(IOSObjectArray_Get(tmpMatrix, i))) getCoefficientWithInt:i];
    jint invCoef = [((OrgBouncycastlePqcMathLinearalgebraGF2mField *) nil_chk(self->field_)) inverseWithInt:coef];
    [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(IOSObjectArray_Get(tmpMatrix, i))) multThisWithElementWithInt:invCoef];
    [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(IOSObjectArray_Get(nil_chk(self->sqRootMatrix_), i))) multThisWithElementWithInt:invCoef];
    
#line 148
    for (jint j = 0; j < numColumns; j++) {
      
#line 150
      if (j != i) {
        
#line 152
        coef = [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(IOSObjectArray_Get(tmpMatrix, j))) getCoefficientWithInt:i];
        if (coef != 0) {
          
#line 155
          OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *tmpSqColumn = [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(IOSObjectArray_Get(tmpMatrix, i))) multWithElementWithInt:
#line 156
          coef];
          OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *tmpInvColumn = [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(IOSObjectArray_Get(nil_chk(self->sqRootMatrix_), i))) multWithElementWithInt:
#line 158
          coef];
          [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(IOSObjectArray_Get(tmpMatrix, j))) addToThisWithOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM:tmpSqColumn];
          [((OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *) nil_chk(IOSObjectArray_Get(nil_chk(self->sqRootMatrix_), j))) addToThisWithOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM:tmpInvColumn];
        }
      }
    }
  }
}


#line 167
void OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m_swapColumnsWithOrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallMArray_withInt_withInt_(IOSObjectArray *matrix, jint first, jint second) {
  OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m_initialize();
  
#line 170
  OrgBouncycastlePqcMathLinearalgebraPolynomialGF2mSmallM *tmp = IOSObjectArray_Get(nil_chk(matrix), first);
  (void) IOSObjectArray_Set(matrix, first, IOSObjectArray_Get(matrix, second));
  (void) IOSObjectArray_Set(matrix, second, tmp);
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastlePqcMathLinearalgebraPolynomialRingGF2m)
