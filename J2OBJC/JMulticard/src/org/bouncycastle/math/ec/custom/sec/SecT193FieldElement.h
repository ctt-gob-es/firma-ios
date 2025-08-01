//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/math/ec/custom/sec/SecT193FieldElement.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecT193FieldElement")
#ifdef RESTRICT_OrgBouncycastleMathEcCustomSecSecT193FieldElement
#define INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecT193FieldElement 0
#else
#define INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecT193FieldElement 1
#endif
#undef RESTRICT_OrgBouncycastleMathEcCustomSecSecT193FieldElement

#if !defined (OrgBouncycastleMathEcCustomSecSecT193FieldElement_) && (INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecT193FieldElement || defined(INCLUDE_OrgBouncycastleMathEcCustomSecSecT193FieldElement))
#define OrgBouncycastleMathEcCustomSecSecT193FieldElement_

#define RESTRICT_OrgBouncycastleMathEcECFieldElement 1
#define INCLUDE_OrgBouncycastleMathEcECFieldElement_AbstractF2m 1
#include "org/bouncycastle/math/ec/ECFieldElement.h"

@class IOSLongArray;
@class JavaMathBigInteger;
@class OrgBouncycastleMathEcECFieldElement;

@interface OrgBouncycastleMathEcCustomSecSecT193FieldElement : OrgBouncycastleMathEcECFieldElement_AbstractF2m {
 @public
  IOSLongArray *x_;
}

#pragma mark Public

- (instancetype)init;

- (instancetype)initWithJavaMathBigInteger:(JavaMathBigInteger *)x;

- (OrgBouncycastleMathEcECFieldElement *)addWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)b;

- (OrgBouncycastleMathEcECFieldElement *)addOne;

- (OrgBouncycastleMathEcECFieldElement *)divideWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)b;

- (jboolean)isEqual:(id)other;

- (NSString *)getFieldName;

- (jint)getFieldSize;

- (jint)getK1;

- (jint)getK2;

- (jint)getK3;

- (jint)getM;

- (jint)getRepresentation;

- (OrgBouncycastleMathEcECFieldElement *)halfTrace;

- (jboolean)hasFastTrace;

- (NSUInteger)hash;

- (OrgBouncycastleMathEcECFieldElement *)invert;

- (jboolean)isOne;

- (jboolean)isZero;

- (OrgBouncycastleMathEcECFieldElement *)multiplyWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)b;

- (OrgBouncycastleMathEcECFieldElement *)multiplyMinusProductWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)b
                                                             withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                             withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y;

- (OrgBouncycastleMathEcECFieldElement *)multiplyPlusProductWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)b
                                                            withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                            withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y;

- (OrgBouncycastleMathEcECFieldElement *)negate;

- (OrgBouncycastleMathEcECFieldElement *)sqrt;

- (OrgBouncycastleMathEcECFieldElement *)square;

- (OrgBouncycastleMathEcECFieldElement *)squareMinusProductWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                           withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y;

- (OrgBouncycastleMathEcECFieldElement *)squarePlusProductWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                          withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y;

- (OrgBouncycastleMathEcECFieldElement *)squarePowWithInt:(jint)pow;

- (OrgBouncycastleMathEcECFieldElement *)subtractWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)b;

- (jboolean)testBitZero;

- (JavaMathBigInteger *)toBigInteger;

- (jint)trace;

#pragma mark Protected

- (instancetype)initWithLongArray:(IOSLongArray *)x;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleMathEcCustomSecSecT193FieldElement)

J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcCustomSecSecT193FieldElement, x_, IOSLongArray *)

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT193FieldElement_initWithJavaMathBigInteger_(OrgBouncycastleMathEcCustomSecSecT193FieldElement *self, JavaMathBigInteger *x);

FOUNDATION_EXPORT OrgBouncycastleMathEcCustomSecSecT193FieldElement *new_OrgBouncycastleMathEcCustomSecSecT193FieldElement_initWithJavaMathBigInteger_(JavaMathBigInteger *x) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleMathEcCustomSecSecT193FieldElement *create_OrgBouncycastleMathEcCustomSecSecT193FieldElement_initWithJavaMathBigInteger_(JavaMathBigInteger *x);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT193FieldElement_init(OrgBouncycastleMathEcCustomSecSecT193FieldElement *self);

FOUNDATION_EXPORT OrgBouncycastleMathEcCustomSecSecT193FieldElement *new_OrgBouncycastleMathEcCustomSecSecT193FieldElement_init(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleMathEcCustomSecSecT193FieldElement *create_OrgBouncycastleMathEcCustomSecSecT193FieldElement_init(void);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT193FieldElement_initWithLongArray_(OrgBouncycastleMathEcCustomSecSecT193FieldElement *self, IOSLongArray *x);

FOUNDATION_EXPORT OrgBouncycastleMathEcCustomSecSecT193FieldElement *new_OrgBouncycastleMathEcCustomSecSecT193FieldElement_initWithLongArray_(IOSLongArray *x) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleMathEcCustomSecSecT193FieldElement *create_OrgBouncycastleMathEcCustomSecSecT193FieldElement_initWithLongArray_(IOSLongArray *x);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathEcCustomSecSecT193FieldElement)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecT193FieldElement")
