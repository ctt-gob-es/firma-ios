//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/math/ec/endo/GLVTypeBParameters.java
//

#include "J2ObjC_source.h"
#include "java/math/BigInteger.h"
#include "org/bouncycastle/math/ec/endo/GLVTypeBParameters.h"
#include "org/bouncycastle/math/ec/endo/ScalarSplitParameters.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/math/ec/endo/GLVTypeBParameters must be compiled with ARC (-fobjc-arc)"
#endif

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/math/ec/endo/GLVTypeBParameters.java"


#line 5
@implementation OrgBouncycastleMathEcEndoGLVTypeBParameters


#line 10
- (instancetype)initWithJavaMathBigInteger:(JavaMathBigInteger *)beta
                    withJavaMathBigInteger:(JavaMathBigInteger *)lambda
withOrgBouncycastleMathEcEndoScalarSplitParameters:(OrgBouncycastleMathEcEndoScalarSplitParameters *)splitParams {
  OrgBouncycastleMathEcEndoGLVTypeBParameters_initWithJavaMathBigInteger_withJavaMathBigInteger_withOrgBouncycastleMathEcEndoScalarSplitParameters_(self, beta, lambda, splitParams);
  return self;
}

- (JavaMathBigInteger *)getBeta {
  
#line 19
  return beta_;
}


#line 22
- (JavaMathBigInteger *)getLambda {
  
#line 24
  return lambda_;
}


#line 27
- (OrgBouncycastleMathEcEndoScalarSplitParameters *)getSplitParams {
  
#line 29
  return splitParams_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, 0, -1, -1, -1, -1 },
    { NULL, "LJavaMathBigInteger;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LJavaMathBigInteger;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleMathEcEndoScalarSplitParameters;", 0x1, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithJavaMathBigInteger:withJavaMathBigInteger:withOrgBouncycastleMathEcEndoScalarSplitParameters:);
  methods[1].selector = @selector(getBeta);
  methods[2].selector = @selector(getLambda);
  methods[3].selector = @selector(getSplitParams);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "beta_", "LJavaMathBigInteger;", .constantValue.asLong = 0, 0x14, -1, -1, -1, -1 },
    { "lambda_", "LJavaMathBigInteger;", .constantValue.asLong = 0, 0x14, -1, -1, -1, -1 },
    { "splitParams_", "LOrgBouncycastleMathEcEndoScalarSplitParameters;", .constantValue.asLong = 0, 0x14, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "LJavaMathBigInteger;LJavaMathBigInteger;LOrgBouncycastleMathEcEndoScalarSplitParameters;" };
  static const J2ObjcClassInfo _OrgBouncycastleMathEcEndoGLVTypeBParameters = { "GLVTypeBParameters", "org.bouncycastle.math.ec.endo", ptrTable, methods, fields, 7, 0x1, 4, 3, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleMathEcEndoGLVTypeBParameters;
}

@end


#line 10
void OrgBouncycastleMathEcEndoGLVTypeBParameters_initWithJavaMathBigInteger_withJavaMathBigInteger_withOrgBouncycastleMathEcEndoScalarSplitParameters_(OrgBouncycastleMathEcEndoGLVTypeBParameters *self, JavaMathBigInteger *beta, JavaMathBigInteger *lambda, OrgBouncycastleMathEcEndoScalarSplitParameters *splitParams) {
  NSObject_init(self);
  self->beta_ = beta;
  self->lambda_ = lambda;
  self->splitParams_ = splitParams;
}


#line 10
OrgBouncycastleMathEcEndoGLVTypeBParameters *new_OrgBouncycastleMathEcEndoGLVTypeBParameters_initWithJavaMathBigInteger_withJavaMathBigInteger_withOrgBouncycastleMathEcEndoScalarSplitParameters_(JavaMathBigInteger *beta, JavaMathBigInteger *lambda, OrgBouncycastleMathEcEndoScalarSplitParameters *splitParams) {
  J2OBJC_NEW_IMPL(OrgBouncycastleMathEcEndoGLVTypeBParameters, initWithJavaMathBigInteger_withJavaMathBigInteger_withOrgBouncycastleMathEcEndoScalarSplitParameters_, beta, lambda, splitParams)
}


#line 10
OrgBouncycastleMathEcEndoGLVTypeBParameters *create_OrgBouncycastleMathEcEndoGLVTypeBParameters_initWithJavaMathBigInteger_withJavaMathBigInteger_withOrgBouncycastleMathEcEndoScalarSplitParameters_(JavaMathBigInteger *beta, JavaMathBigInteger *lambda, OrgBouncycastleMathEcEndoScalarSplitParameters *splitParams) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleMathEcEndoGLVTypeBParameters, initWithJavaMathBigInteger_withJavaMathBigInteger_withOrgBouncycastleMathEcEndoScalarSplitParameters_, beta, lambda, splitParams)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleMathEcEndoGLVTypeBParameters)
