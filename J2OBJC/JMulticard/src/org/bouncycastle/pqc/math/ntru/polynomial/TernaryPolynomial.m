//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/math/ntru/polynomial/TernaryPolynomial.java
//

#include "J2ObjC_source.h"
#include "org/bouncycastle/pqc/math/ntru/polynomial/TernaryPolynomial.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/pqc/math/ntru/polynomial/TernaryPolynomial must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastlePqcMathNtruPolynomialTernaryPolynomial : NSObject

@end

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/math/ntru/polynomial/TernaryPolynomial.java"


#line 6
@implementation OrgBouncycastlePqcMathNtruPolynomialTernaryPolynomial

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, "LOrgBouncycastlePqcMathNtruPolynomialIntegerPolynomial;", 0x401, 0, 1, -1, -1, -1, -1 },
    { NULL, "[I", 0x401, -1, -1, -1, -1, -1, -1 },
    { NULL, "[I", 0x401, -1, -1, -1, -1, -1, -1 },
    { NULL, "I", 0x401, -1, -1, -1, -1, -1, -1 },
    { NULL, "V", 0x401, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(multWithOrgBouncycastlePqcMathNtruPolynomialIntegerPolynomial:);
  methods[1].selector = @selector(getOnes);
  methods[2].selector = @selector(getNegOnes);
  methods[3].selector = @selector(size);
  methods[4].selector = @selector(clear);
  #pragma clang diagnostic pop
  static const void *ptrTable[] = { "mult", "LOrgBouncycastlePqcMathNtruPolynomialIntegerPolynomial;" };
  static const J2ObjcClassInfo _OrgBouncycastlePqcMathNtruPolynomialTernaryPolynomial = { "TernaryPolynomial", "org.bouncycastle.pqc.math.ntru.polynomial", ptrTable, methods, NULL, 7, 0x609, 5, 0, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastlePqcMathNtruPolynomialTernaryPolynomial;
}

@end

J2OBJC_INTERFACE_TYPE_LITERAL_SOURCE(OrgBouncycastlePqcMathNtruPolynomialTernaryPolynomial)
