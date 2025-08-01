//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/math/ec/custom/sec/SecT193R2Curve.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecT193R2Curve")
#ifdef RESTRICT_OrgBouncycastleMathEcCustomSecSecT193R2Curve
#define INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecT193R2Curve 0
#else
#define INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecT193R2Curve 1
#endif
#undef RESTRICT_OrgBouncycastleMathEcCustomSecSecT193R2Curve

#if !defined (OrgBouncycastleMathEcCustomSecSecT193R2Curve_) && (INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecT193R2Curve || defined(INCLUDE_OrgBouncycastleMathEcCustomSecSecT193R2Curve))
#define OrgBouncycastleMathEcCustomSecSecT193R2Curve_

#define RESTRICT_OrgBouncycastleMathEcECCurve 1
#define INCLUDE_OrgBouncycastleMathEcECCurve_AbstractF2m 1
#include "org/bouncycastle/math/ec/ECCurve.h"

@class IOSObjectArray;
@class JavaMathBigInteger;
@class OrgBouncycastleMathEcCustomSecSecT193R2Point;
@class OrgBouncycastleMathEcECCurve;
@class OrgBouncycastleMathEcECFieldElement;
@class OrgBouncycastleMathEcECPoint;
@protocol OrgBouncycastleMathEcECLookupTable;

@interface OrgBouncycastleMathEcCustomSecSecT193R2Curve : OrgBouncycastleMathEcECCurve_AbstractF2m {
 @public
  OrgBouncycastleMathEcCustomSecSecT193R2Point *infinity_;
}

#pragma mark Public

- (instancetype)init;

- (id<OrgBouncycastleMathEcECLookupTable>)createCacheSafeLookupTableWithOrgBouncycastleMathEcECPointArray:(IOSObjectArray *)points
                                                                                                  withInt:(jint)off
                                                                                                  withInt:(jint)len;

- (OrgBouncycastleMathEcECFieldElement *)fromBigIntegerWithJavaMathBigInteger:(JavaMathBigInteger *)x;

- (jint)getFieldSize;

- (OrgBouncycastleMathEcECPoint *)getInfinity;

- (jint)getK1;

- (jint)getK2;

- (jint)getK3;

- (jint)getM;

- (jboolean)isKoblitz;

- (jboolean)isTrinomial;

- (jboolean)supportsCoordinateSystemWithInt:(jint)coord;

#pragma mark Protected

- (OrgBouncycastleMathEcECCurve *)cloneCurve;

- (OrgBouncycastleMathEcECPoint *)createRawPointWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y;

- (OrgBouncycastleMathEcECPoint *)createRawPointWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
                                           withOrgBouncycastleMathEcECFieldElementArray:(IOSObjectArray *)zs;

// Disallowed inherited constructors, do not use.

- (instancetype)initWithInt:(jint)arg0
                    withInt:(jint)arg1
                    withInt:(jint)arg2
                    withInt:(jint)arg3 NS_UNAVAILABLE;

@end

J2OBJC_STATIC_INIT(OrgBouncycastleMathEcCustomSecSecT193R2Curve)

J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcCustomSecSecT193R2Curve, infinity_, OrgBouncycastleMathEcCustomSecSecT193R2Point *)

FOUNDATION_EXPORT void OrgBouncycastleMathEcCustomSecSecT193R2Curve_init(OrgBouncycastleMathEcCustomSecSecT193R2Curve *self);

FOUNDATION_EXPORT OrgBouncycastleMathEcCustomSecSecT193R2Curve *new_OrgBouncycastleMathEcCustomSecSecT193R2Curve_init(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleMathEcCustomSecSecT193R2Curve *create_OrgBouncycastleMathEcCustomSecSecT193R2Curve_init(void);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathEcCustomSecSecT193R2Curve)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleMathEcCustomSecSecT193R2Curve")
