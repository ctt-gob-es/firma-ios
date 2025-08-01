//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/math/linearalgebra/GF2nONBElement.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcMathLinearalgebraGF2nONBElement")
#ifdef RESTRICT_OrgBouncycastlePqcMathLinearalgebraGF2nONBElement
#define INCLUDE_ALL_OrgBouncycastlePqcMathLinearalgebraGF2nONBElement 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcMathLinearalgebraGF2nONBElement 1
#endif
#undef RESTRICT_OrgBouncycastlePqcMathLinearalgebraGF2nONBElement

#if !defined (OrgBouncycastlePqcMathLinearalgebraGF2nONBElement_) && (INCLUDE_ALL_OrgBouncycastlePqcMathLinearalgebraGF2nONBElement || defined(INCLUDE_OrgBouncycastlePqcMathLinearalgebraGF2nONBElement))
#define OrgBouncycastlePqcMathLinearalgebraGF2nONBElement_

#define RESTRICT_OrgBouncycastlePqcMathLinearalgebraGF2nElement 1
#define INCLUDE_OrgBouncycastlePqcMathLinearalgebraGF2nElement 1
#include "org/bouncycastle/pqc/math/linearalgebra/GF2nElement.h"

@class IOSByteArray;
@class JavaMathBigInteger;
@class JavaSecuritySecureRandom;
@class OrgBouncycastlePqcMathLinearalgebraGF2nONBField;
@protocol OrgBouncycastlePqcMathLinearalgebraGFElement;

/*!
 @brief This class implements an element of the finite field <i>GF(2<sup>n </sup>)</i>.
 It is represented in an optimal normal basis representation and holds the
  pointer <tt>mField</tt> to its corresponding field.
 - seealso: GF2nField
 - seealso: GF2nElement
 */
@interface OrgBouncycastlePqcMathLinearalgebraGF2nONBElement : OrgBouncycastlePqcMathLinearalgebraGF2nElement

#pragma mark Public

/*!
 @brief Copy constructor.
 @param gf2n the field
 */
- (instancetype)initWithOrgBouncycastlePqcMathLinearalgebraGF2nONBElement:(OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *)gf2n;

/*!
 @brief Construct the element of the field <tt>gf2n</tt> with the specified
  value <tt>val</tt>.
 @param gf2n the field
 @param val the value represented by a BigInteger
 */
- (instancetype)initWithOrgBouncycastlePqcMathLinearalgebraGF2nONBField:(OrgBouncycastlePqcMathLinearalgebraGF2nONBField *)gf2n
                                                 withJavaMathBigInteger:(JavaMathBigInteger *)val;

/*!
 @brief Construct a new GF2nONBElement from its encoding.
 @param gf2n the field
 @param e the encoded element
 */
- (instancetype)initWithOrgBouncycastlePqcMathLinearalgebraGF2nONBField:(OrgBouncycastlePqcMathLinearalgebraGF2nONBField *)gf2n
                                                          withByteArray:(IOSByteArray *)e;

/*!
 @brief Construct a random element over the field <tt>gf2n</tt>, using the
  specified source of randomness.
 @param gf2n the field
 @param rand the source of randomness
 */
- (instancetype)initWithOrgBouncycastlePqcMathLinearalgebraGF2nONBField:(OrgBouncycastlePqcMathLinearalgebraGF2nONBField *)gf2n
                                           withJavaSecuritySecureRandom:(JavaSecuritySecureRandom *)rand;

/*!
 @brief Compute the sum of this element and <tt>addend</tt>.
 @param addend the addend
 @return <tt>this + other</tt> (newly created)
 */
- (id<OrgBouncycastlePqcMathLinearalgebraGFElement>)addWithOrgBouncycastlePqcMathLinearalgebraGFElement:(id<OrgBouncycastlePqcMathLinearalgebraGFElement>)addend;

/*!
 @brief Compute <tt>this + addend</tt> (overwrite <tt>this</tt>).
 @param addend the addend
 */
- (void)addToThisWithOrgBouncycastlePqcMathLinearalgebraGFElement:(id<OrgBouncycastlePqcMathLinearalgebraGFElement>)addend;

/*!
 @brief Create a new GF2nONBElement by cloning this GF2nPolynomialElement.
 @return a copy of this element
 */
- (id)java_clone;

/*!
 @brief Compare this element with another object.
 @param other the other object
 @return <tt>true</tt> if the two objects are equal, <tt>false</tt>
          otherwise
 */
- (jboolean)isEqual:(id)other;

/*!
 @return the hash code of this element
 */
- (NSUInteger)hash;

/*!
 @brief returns <tt>this</tt> element + 1.
 @return <tt>this</tt> + 1
 */
- (OrgBouncycastlePqcMathLinearalgebraGF2nElement *)increase;

/*!
 @brief increases <tt>this</tt> element.
 */
- (void)increaseThis;

/*!
 @brief Compute the multiplicative inverse of this element.
 @return <tt>this<sup>-1</sup></tt> (newly created)
 @throw ArithmeticExceptionif <tt>this</tt> is the zero element.
 */
- (id<OrgBouncycastlePqcMathLinearalgebraGFElement>)invert;

/*!
 @brief Multiplicatively invert of this element (overwrite <tt>this</tt>).
 @throw ArithmeticExceptionif <tt>this</tt> is the zero element.
 */
- (void)invertThis;

/*!
 @brief Checks whether this element is one.
 @return <tt>true</tt> if <tt>this</tt> is the one element
 */
- (jboolean)isOne;

/*!
 @brief Checks whether this element is zero.
 @return <tt>true</tt> if <tt>this</tt> is the zero element
 */
- (jboolean)isZero;

/*!
 @brief Compute the product of this element and <tt>factor</tt>.
 @param factor the factor
 @return <tt>this * factor</tt> (newly created)
 */
- (id<OrgBouncycastlePqcMathLinearalgebraGFElement>)multiplyWithOrgBouncycastlePqcMathLinearalgebraGFElement:(id<OrgBouncycastlePqcMathLinearalgebraGFElement>)factor;

/*!
 @brief Compute <tt>this * factor</tt> (overwrite <tt>this</tt>).
 @param factor the factor
 */
- (void)multiplyThisByWithOrgBouncycastlePqcMathLinearalgebraGFElement:(id<OrgBouncycastlePqcMathLinearalgebraGFElement>)factor;

/*!
 @brief Create the one element.
 @param gf2n the finite field
 @return the one element in the given finite field
 */
+ (OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *)ONEWithOrgBouncycastlePqcMathLinearalgebraGF2nONBField:(OrgBouncycastlePqcMathLinearalgebraGF2nONBField *)gf2n;

/*!
 @brief Solves a quadratic equation.
 <br>
  Let z<sup>2</sup> + z = <tt>this</tt>.Then this method returns z.
 @return z with z<sup>2</sup> + z = <tt>this</tt>
 */
- (OrgBouncycastlePqcMathLinearalgebraGF2nElement *)solveQuadraticEquation;

/*!
 @brief returns <tt>this</tt> element to the power of 2.
 @return <tt>this</tt><sup>2</sup>
 */
- (OrgBouncycastlePqcMathLinearalgebraGF2nElement *)square;

/*!
 @brief returns the root of<tt>this</tt> element.
 @return <tt>this</tt><sup>1/2</sup>
 */
- (OrgBouncycastlePqcMathLinearalgebraGF2nElement *)squareRoot;

/*!
 @brief square roots <tt>this</tt> element.
 */
- (void)squareRootThis;

/*!
 @brief squares <tt>this</tt> element.
 */
- (void)squareThis;

/*!
 @brief Returns whether the highest bit of the bit representation is set
 @return true, if the highest bit of mPol is set, false, otherwise
 */
- (jboolean)testRightmostBit;

/*!
 @brief Returns this element as byte array.The conversion is <a href="https://grouper.ieee.org/groups/1363/">
 P1363</a>-conform.
 @return this element as byte array
 */
- (IOSByteArray *)toByteArray;

/*!
 @brief Returns this element as FlexiBigInt.The conversion is <a href="https://grouper.ieee.org/groups/1363/">
 P1363</a>-conform.
 @return this element as BigInteger
 */
- (JavaMathBigInteger *)toFlexiBigInt;

/*!
 @brief Returns a String representation of this element.
 @return String representation of this element with the specified radix
 */
- (NSString *)description;

/*!
 @brief Returns a String representation of this element.
 <tt>radix</tt>
  specifies the radix of the String representation.<br>
  NOTE: ONLY <tt>radix = 2</tt> or <tt>radix = 16</tt> IS IMPLEMENTED
 @param radix specifies the radix of the String representation
 @return String representation of this element with the specified radix
 */
- (NSString *)toStringWithInt:(jint)radix;

/*!
 @brief Returns the trace of this element.
 @return the trace of this element
 */
- (jint)trace;

/*!
 @brief Create the zero element.
 @param gf2n the finite field
 @return the zero element in the given finite field
 */
+ (OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *)ZEROWithOrgBouncycastlePqcMathLinearalgebraGF2nONBField:(OrgBouncycastlePqcMathLinearalgebraGF2nONBField *)gf2n;

#pragma mark Package-Private

/*!
 @brief assigns to this element the one element
 */
- (void)assignOne;

/*!
 @brief assigns to this element the zero element
 */
- (void)assignZero;

/*!
 @brief Reverses the bit-order in this element(according to 1363).This is a
  hack!
 */
- (void)reverseOrder;

/*!
 @brief Checks whether the indexed bit of the bit representation is set.Warning:
  GF2nONBElement currently stores its bits in reverse order (compared to
  1363) !!!
 @param index the index of the bit to test
 @return <tt>true</tt> if the indexed bit of mPol is set, <tt>false</tt>
          otherwise.
 */
- (jboolean)testBitWithInt:(jint)index;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_STATIC_INIT(OrgBouncycastlePqcMathLinearalgebraGF2nONBElement)

FOUNDATION_EXPORT void OrgBouncycastlePqcMathLinearalgebraGF2nONBElement_initWithOrgBouncycastlePqcMathLinearalgebraGF2nONBField_withJavaSecuritySecureRandom_(OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *self, OrgBouncycastlePqcMathLinearalgebraGF2nONBField *gf2n, JavaSecuritySecureRandom *rand);

FOUNDATION_EXPORT OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *new_OrgBouncycastlePqcMathLinearalgebraGF2nONBElement_initWithOrgBouncycastlePqcMathLinearalgebraGF2nONBField_withJavaSecuritySecureRandom_(OrgBouncycastlePqcMathLinearalgebraGF2nONBField *gf2n, JavaSecuritySecureRandom *rand) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *create_OrgBouncycastlePqcMathLinearalgebraGF2nONBElement_initWithOrgBouncycastlePqcMathLinearalgebraGF2nONBField_withJavaSecuritySecureRandom_(OrgBouncycastlePqcMathLinearalgebraGF2nONBField *gf2n, JavaSecuritySecureRandom *rand);

FOUNDATION_EXPORT void OrgBouncycastlePqcMathLinearalgebraGF2nONBElement_initWithOrgBouncycastlePqcMathLinearalgebraGF2nONBField_withByteArray_(OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *self, OrgBouncycastlePqcMathLinearalgebraGF2nONBField *gf2n, IOSByteArray *e);

FOUNDATION_EXPORT OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *new_OrgBouncycastlePqcMathLinearalgebraGF2nONBElement_initWithOrgBouncycastlePqcMathLinearalgebraGF2nONBField_withByteArray_(OrgBouncycastlePqcMathLinearalgebraGF2nONBField *gf2n, IOSByteArray *e) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *create_OrgBouncycastlePqcMathLinearalgebraGF2nONBElement_initWithOrgBouncycastlePqcMathLinearalgebraGF2nONBField_withByteArray_(OrgBouncycastlePqcMathLinearalgebraGF2nONBField *gf2n, IOSByteArray *e);

FOUNDATION_EXPORT void OrgBouncycastlePqcMathLinearalgebraGF2nONBElement_initWithOrgBouncycastlePqcMathLinearalgebraGF2nONBField_withJavaMathBigInteger_(OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *self, OrgBouncycastlePqcMathLinearalgebraGF2nONBField *gf2n, JavaMathBigInteger *val);

FOUNDATION_EXPORT OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *new_OrgBouncycastlePqcMathLinearalgebraGF2nONBElement_initWithOrgBouncycastlePqcMathLinearalgebraGF2nONBField_withJavaMathBigInteger_(OrgBouncycastlePqcMathLinearalgebraGF2nONBField *gf2n, JavaMathBigInteger *val) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *create_OrgBouncycastlePqcMathLinearalgebraGF2nONBElement_initWithOrgBouncycastlePqcMathLinearalgebraGF2nONBField_withJavaMathBigInteger_(OrgBouncycastlePqcMathLinearalgebraGF2nONBField *gf2n, JavaMathBigInteger *val);

FOUNDATION_EXPORT void OrgBouncycastlePqcMathLinearalgebraGF2nONBElement_initWithOrgBouncycastlePqcMathLinearalgebraGF2nONBElement_(OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *self, OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *gf2n);

FOUNDATION_EXPORT OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *new_OrgBouncycastlePqcMathLinearalgebraGF2nONBElement_initWithOrgBouncycastlePqcMathLinearalgebraGF2nONBElement_(OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *gf2n) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *create_OrgBouncycastlePqcMathLinearalgebraGF2nONBElement_initWithOrgBouncycastlePqcMathLinearalgebraGF2nONBElement_(OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *gf2n);

FOUNDATION_EXPORT OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *OrgBouncycastlePqcMathLinearalgebraGF2nONBElement_ZEROWithOrgBouncycastlePqcMathLinearalgebraGF2nONBField_(OrgBouncycastlePqcMathLinearalgebraGF2nONBField *gf2n);

FOUNDATION_EXPORT OrgBouncycastlePqcMathLinearalgebraGF2nONBElement *OrgBouncycastlePqcMathLinearalgebraGF2nONBElement_ONEWithOrgBouncycastlePqcMathLinearalgebraGF2nONBField_(OrgBouncycastlePqcMathLinearalgebraGF2nONBField *gf2n);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcMathLinearalgebraGF2nONBElement)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcMathLinearalgebraGF2nONBElement")
