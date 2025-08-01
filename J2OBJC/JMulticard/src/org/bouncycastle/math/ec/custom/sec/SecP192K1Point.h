//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/math/ec/custom/sec/SecP192K1Point.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecP192K1Point")
#ifdef RESTRICT_OrgBouncycastleMathEcCustomSecSecP192K1Point
#define INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecP192K1Point 0
#else
#define INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecP192K1Point 1
#endif
#undef RESTRICT_OrgBouncycastleMathEcCustomSecSecP192K1Point

#if !defined (OrgBouncycastleMathEcCustomSecSecP192K1Point_) && (INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecP192K1Point || defined(INCLUDE_OrgBouncycastleMathEcCustomSecSecP192K1Point))
#define OrgBouncycastleMathEcCustomSecSecP192K1Point_

#define RESTRICT_OrgBouncycastleMathEcECPoint 1
#define INCLUDE_OrgBouncycastleMathEcECPoint_AbstractFp 1
#include "org/bouncycastle/math/ec/ECPoint.h"

@class IOSObjectArray;
@class OrgBouncycastleMathEcECCurve;
@class OrgBouncycastleMathEcECFieldElement;
@class OrgBouncycastleMathEcECPoint;

@interface OrgBouncycastleMathEcCustomSecSecP192K1Point : OrgBouncycastleMathEcECPoint_AbstractFp

#pragma mark Public

- (OrgBouncycastleMathEcECPoint *)addWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)b;

- (OrgBouncycastleMathEcECPoint *)negate;

- (OrgBouncycastleMathEcECPoint *)threeTimes;

- (OrgBouncycastleMathEcECPoint *)twice;

- (OrgBouncycastleMathEcECPoint *)twicePlusWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)b;

#pragma mark Protected

- (OrgBouncycastleMathEcECPoint *)detach;

#pragma mark Package-Private

- (instancetype)initWithOrgBouncycastleMathEcECCurve:(OrgBouncycastleMathEcECCurve *)curve
             withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
             withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y;

- (instancetype)initWithOrgBouncycastleMathEcECCurve:(OrgBouncycastleMathEcECCurve *)curve
             withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
             withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
        withOrgBouncycastleMathEcECFieldElementArray:(IOSObjectArray *)zs;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleMathEcCustomSecSecP192K1Point)

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecP192K1Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(OrgBouncycastleMathEcCustomSecSecP192K1Point *self, OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECFieldElement *x, OrgBouncycastleMathEcECFieldElement *y);

FOUNDATION_EXPORT OrgBouncycastleMathEcCustomSecSecP192K1Point *new_OrgBouncycastleMathEcCustomSecSecP192K1Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECFieldElement *x, OrgBouncycastleMathEcECFieldElement *y) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleMathEcCustomSecSecP192K1Point *create_OrgBouncycastleMathEcCustomSecSecP192K1Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_(OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECFieldElement *x, OrgBouncycastleMathEcECFieldElement *y);

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecP192K1Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(OrgBouncycastleMathEcCustomSecSecP192K1Point *self, OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECFieldElement *x, OrgBouncycastleMathEcECFieldElement *y, IOSObjectArray *zs);

FOUNDATION_EXPORT OrgBouncycastleMathEcCustomSecSecP192K1Point *new_OrgBouncycastleMathEcCustomSecSecP192K1Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECFieldElement *x, OrgBouncycastleMathEcECFieldElement *y, IOSObjectArray *zs) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleMathEcCustomSecSecP192K1Point *create_OrgBouncycastleMathEcCustomSecSecP192K1Point_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElement_withOrgBouncycastleMathEcECFieldElementArray_(OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECFieldElement *x, OrgBouncycastleMathEcECFieldElement *y, IOSObjectArray *zs);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathEcCustomSecSecP192K1Point)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecP192K1Point")
