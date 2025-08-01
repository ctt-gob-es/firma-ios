//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/jce/spec/ECParameterSpec.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleJceSpecECParameterSpec")
#ifdef RESTRICT_OrgBouncycastleJceSpecECParameterSpec
#define INCLUDE_ALL_OrgBouncycastleJceSpecECParameterSpec 0
#else
#define INCLUDE_ALL_OrgBouncycastleJceSpecECParameterSpec 1
#endif
#undef RESTRICT_OrgBouncycastleJceSpecECParameterSpec

#if !defined (OrgBouncycastleJceSpecECParameterSpec_) && (INCLUDE_ALL_OrgBouncycastleJceSpecECParameterSpec || defined(INCLUDE_OrgBouncycastleJceSpecECParameterSpec))
#define OrgBouncycastleJceSpecECParameterSpec_

#define RESTRICT_JavaSecuritySpecAlgorithmParameterSpec 1
#define INCLUDE_JavaSecuritySpecAlgorithmParameterSpec 1
#include "java/security/spec/AlgorithmParameterSpec.h"

@class IOSByteArray;
@class JavaMathBigInteger;
@class OrgBouncycastleMathEcECCurve;
@class OrgBouncycastleMathEcECPoint;

/*!
 @brief basic domain parameters for an Elliptic Curve public or private key.
 */
@interface OrgBouncycastleJceSpecECParameterSpec : NSObject < JavaSecuritySpecAlgorithmParameterSpec >

#pragma mark Public

- (instancetype)initWithOrgBouncycastleMathEcECCurve:(OrgBouncycastleMathEcECCurve *)curve
                    withOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)G
                              withJavaMathBigInteger:(JavaMathBigInteger *)n;

- (instancetype)initWithOrgBouncycastleMathEcECCurve:(OrgBouncycastleMathEcECCurve *)curve
                    withOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)G
                              withJavaMathBigInteger:(JavaMathBigInteger *)n
                              withJavaMathBigInteger:(JavaMathBigInteger *)h;

- (instancetype)initWithOrgBouncycastleMathEcECCurve:(OrgBouncycastleMathEcECCurve *)curve
                    withOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)G
                              withJavaMathBigInteger:(JavaMathBigInteger *)n
                              withJavaMathBigInteger:(JavaMathBigInteger *)h
                                       withByteArray:(IOSByteArray *)seed;

- (jboolean)isEqual:(id)o;

/*!
 @brief return the curve along which the base point lies.
 @return the curve
 */
- (OrgBouncycastleMathEcECCurve *)getCurve;

/*!
 @brief return the base point we are using for these domain parameters.
 @return the base point.
 */
- (OrgBouncycastleMathEcECPoint *)getG;

/*!
 @brief return the cofactor H to the order of G.
 @return the cofactor
 */
- (JavaMathBigInteger *)getH;

/*!
 @brief return the order N of G
 @return the order
 */
- (JavaMathBigInteger *)getN;

/*!
 @brief return the seed used to generate this curve (if available).
 @return the random seed
 */
- (IOSByteArray *)getSeed;

- (NSUInteger)hash;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleJceSpecECParameterSpec)

FOUNDATION_EXPORT void OrgBouncycastleJceSpecECParameterSpec_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECPoint_withJavaMathBigInteger_(OrgBouncycastleJceSpecECParameterSpec *self, OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECPoint *G, JavaMathBigInteger *n);

FOUNDATION_EXPORT OrgBouncycastleJceSpecECParameterSpec *new_OrgBouncycastleJceSpecECParameterSpec_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECPoint_withJavaMathBigInteger_(OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECPoint *G, JavaMathBigInteger *n) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleJceSpecECParameterSpec *create_OrgBouncycastleJceSpecECParameterSpec_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECPoint_withJavaMathBigInteger_(OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECPoint *G, JavaMathBigInteger *n);

FOUNDATION_EXPORT void OrgBouncycastleJceSpecECParameterSpec_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECPoint_withJavaMathBigInteger_withJavaMathBigInteger_(OrgBouncycastleJceSpecECParameterSpec *self, OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECPoint *G, JavaMathBigInteger *n, JavaMathBigInteger *h);

FOUNDATION_EXPORT OrgBouncycastleJceSpecECParameterSpec *new_OrgBouncycastleJceSpecECParameterSpec_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECPoint_withJavaMathBigInteger_withJavaMathBigInteger_(OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECPoint *G, JavaMathBigInteger *n, JavaMathBigInteger *h) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleJceSpecECParameterSpec *create_OrgBouncycastleJceSpecECParameterSpec_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECPoint_withJavaMathBigInteger_withJavaMathBigInteger_(OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECPoint *G, JavaMathBigInteger *n, JavaMathBigInteger *h);

FOUNDATION_EXPORT void OrgBouncycastleJceSpecECParameterSpec_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECPoint_withJavaMathBigInteger_withJavaMathBigInteger_withByteArray_(OrgBouncycastleJceSpecECParameterSpec *self, OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECPoint *G, JavaMathBigInteger *n, JavaMathBigInteger *h, IOSByteArray *seed);

FOUNDATION_EXPORT OrgBouncycastleJceSpecECParameterSpec *new_OrgBouncycastleJceSpecECParameterSpec_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECPoint_withJavaMathBigInteger_withJavaMathBigInteger_withByteArray_(OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECPoint *G, JavaMathBigInteger *n, JavaMathBigInteger *h, IOSByteArray *seed) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleJceSpecECParameterSpec *create_OrgBouncycastleJceSpecECParameterSpec_initWithOrgBouncycastleMathEcECCurve_withOrgBouncycastleMathEcECPoint_withJavaMathBigInteger_withJavaMathBigInteger_withByteArray_(OrgBouncycastleMathEcECCurve *curve, OrgBouncycastleMathEcECPoint *G, JavaMathBigInteger *n, JavaMathBigInteger *h, IOSByteArray *seed);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleJceSpecECParameterSpec)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleJceSpecECParameterSpec")
