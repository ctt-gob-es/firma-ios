//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/math/linearalgebra/GFElement.java
//

#include "J2ObjC_source.h"
#include "org/bouncycastle/pqc/math/linearalgebra/GFElement.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/pqc/math/linearalgebra/GFElement must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastlePqcMathLinearalgebraGFElement : NSObject

@end

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/math/linearalgebra/GFElement.java"


#line 12
@implementation OrgBouncycastlePqcMathLinearalgebraGFElement

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, "LNSObject;", 0x401, -1, -1, -1, -1, -1, -1 },
    { NULL, "Z", 0x401, 0, 1, -1, -1, -1, -1 },
    { NULL, "I", 0x401, 2, -1, -1, -1, -1, -1 },
    { NULL, "Z", 0x401, -1, -1, -1, -1, -1, -1 },
    { NULL, "Z", 0x401, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastlePqcMathLinearalgebraGFElement;", 0x401, 3, 4, 5, -1, -1, -1 },
    { NULL, "V", 0x401, 6, 4, 5, -1, -1, -1 },
    { NULL, "LOrgBouncycastlePqcMathLinearalgebraGFElement;", 0x401, 7, 4, 5, -1, -1, -1 },
    { NULL, "V", 0x401, 8, 4, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastlePqcMathLinearalgebraGFElement;", 0x401, 9, 4, 5, -1, -1, -1 },
    { NULL, "V", 0x401, 10, 4, 5, -1, -1, -1 },
    { NULL, "LOrgBouncycastlePqcMathLinearalgebraGFElement;", 0x401, -1, -1, 11, -1, -1, -1 },
    { NULL, "LJavaMathBigInteger;", 0x401, -1, -1, -1, -1, -1, -1 },
    { NULL, "[B", 0x401, -1, -1, -1, -1, -1, -1 },
    { NULL, "LNSString;", 0x401, 12, -1, -1, -1, -1, -1 },
    { NULL, "LNSString;", 0x401, 12, 13, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(clone);
  methods[1].selector = @selector(isEqual:);
  methods[2].selector = @selector(hash);
  methods[3].selector = @selector(isZero);
  methods[4].selector = @selector(isOne);
  methods[5].selector = @selector(addWithOrgBouncycastlePqcMathLinearalgebraGFElement:);
  methods[6].selector = @selector(addToThisWithOrgBouncycastlePqcMathLinearalgebraGFElement:);
  methods[7].selector = @selector(subtractWithOrgBouncycastlePqcMathLinearalgebraGFElement:);
  methods[8].selector = @selector(subtractFromThisWithOrgBouncycastlePqcMathLinearalgebraGFElement:);
  methods[9].selector = @selector(multiplyWithOrgBouncycastlePqcMathLinearalgebraGFElement:);
  methods[10].selector = @selector(multiplyThisByWithOrgBouncycastlePqcMathLinearalgebraGFElement:);
  methods[11].selector = @selector(invert);
  methods[12].selector = @selector(toFlexiBigInt);
  methods[13].selector = @selector(toByteArray);
  methods[14].selector = @selector(description);
  methods[15].selector = @selector(toStringWithInt:);
  #pragma clang diagnostic pop
  static const void *ptrTable[] = { "equals", "LNSObject;", "hashCode", "add", "LOrgBouncycastlePqcMathLinearalgebraGFElement;", "LJavaLangRuntimeException;", "addToThis", "subtract", "subtractFromThis", "multiply", "multiplyThisBy", "LJavaLangArithmeticException;", "toString", "I" };
  static const J2ObjcClassInfo _OrgBouncycastlePqcMathLinearalgebraGFElement = { "GFElement", "org.bouncycastle.pqc.math.linearalgebra", ptrTable, methods, NULL, 7, 0x609, 16, 0, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastlePqcMathLinearalgebraGFElement;
}

@end

J2OBJC_INTERFACE_TYPE_LITERAL_SOURCE(OrgBouncycastlePqcMathLinearalgebraGFElement)
