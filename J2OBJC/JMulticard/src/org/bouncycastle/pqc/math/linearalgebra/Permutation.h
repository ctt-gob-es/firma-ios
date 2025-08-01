//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/math/linearalgebra/Permutation.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcMathLinearalgebraPermutation")
#ifdef RESTRICT_OrgBouncycastlePqcMathLinearalgebraPermutation
#define INCLUDE_ALL_OrgBouncycastlePqcMathLinearalgebraPermutation 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcMathLinearalgebraPermutation 1
#endif
#undef RESTRICT_OrgBouncycastlePqcMathLinearalgebraPermutation

#if !defined (OrgBouncycastlePqcMathLinearalgebraPermutation_) && (INCLUDE_ALL_OrgBouncycastlePqcMathLinearalgebraPermutation || defined(INCLUDE_OrgBouncycastlePqcMathLinearalgebraPermutation))
#define OrgBouncycastlePqcMathLinearalgebraPermutation_

@class IOSByteArray;
@class IOSIntArray;
@class JavaSecuritySecureRandom;

/*!
 @brief This class implements permutations of the set {0,1,...
 ,n-1} for some given n 
 &gt; 0, i.e., ordered sequences containing each number <tt>m</tt> (<tt>0 &lt;=
  m &lt; n</tt>)
  once and only once.
 */
@interface OrgBouncycastlePqcMathLinearalgebraPermutation : NSObject

#pragma mark Public

/*!
 @brief Create a permutation from an encoded permutation.
 @param enc the encoded permutation
 */
- (instancetype)initWithByteArray:(IOSByteArray *)enc;

/*!
 @brief Create the identity permutation of the given size.
 @param n the size of the permutation
 */
- (instancetype)initWithInt:(jint)n;

/*!
 @brief Create a random permutation of the given size.
 @param n the size of the permutation
 @param sr the source of randomness
 */
- (instancetype)initWithInt:(jint)n
withJavaSecuritySecureRandom:(JavaSecuritySecureRandom *)sr;

/*!
 @brief Create a permutation using the given permutation vector.
 @param perm the permutation vector
 */
- (instancetype)initWithIntArray:(IOSIntArray *)perm;

/*!
 @brief Compute the inverse permutation <tt>P<sup>-1</sup></tt>.
 @return <tt>this<sup>-1</sup></tt>
 */
- (OrgBouncycastlePqcMathLinearalgebraPermutation *)computeInverse;

/*!
 @brief checks if given object is equal to this permutation.
 <p>
  The method returns false whenever the given object is not permutation.
 @param other -               permutation
 @return true or false
 */
- (jboolean)isEqual:(id)other;

/*!
 @brief Encode this permutation as byte array.
 @return the encoded permutation
 */
- (IOSByteArray *)getEncoded;

/*!
 @return the permutation vector <tt>(perm(0),perm(1),...,perm(n-1))</tt>
 */
- (IOSIntArray *)getVector;

/*!
 @return the hash code of this permutation
 */
- (NSUInteger)hash;

/*!
 @brief Compute the product of this permutation and another permutation.
 @param p the other permutation
 @return <tt>this * p</tt>
 */
- (OrgBouncycastlePqcMathLinearalgebraPermutation *)rightMultiplyWithOrgBouncycastlePqcMathLinearalgebraPermutation:(OrgBouncycastlePqcMathLinearalgebraPermutation *)p;

/*!
 @return a human readable form of the permutation
 */
- (NSString *)description;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastlePqcMathLinearalgebraPermutation)

FOUNDATION_EXPORT void OrgBouncycastlePqcMathLinearalgebraPermutation_initWithInt_(OrgBouncycastlePqcMathLinearalgebraPermutation *self, jint n);

FOUNDATION_EXPORT OrgBouncycastlePqcMathLinearalgebraPermutation *new_OrgBouncycastlePqcMathLinearalgebraPermutation_initWithInt_(jint n) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcMathLinearalgebraPermutation *create_OrgBouncycastlePqcMathLinearalgebraPermutation_initWithInt_(jint n);

FOUNDATION_EXPORT void OrgBouncycastlePqcMathLinearalgebraPermutation_initWithIntArray_(OrgBouncycastlePqcMathLinearalgebraPermutation *self, IOSIntArray *perm);

FOUNDATION_EXPORT OrgBouncycastlePqcMathLinearalgebraPermutation *new_OrgBouncycastlePqcMathLinearalgebraPermutation_initWithIntArray_(IOSIntArray *perm) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcMathLinearalgebraPermutation *create_OrgBouncycastlePqcMathLinearalgebraPermutation_initWithIntArray_(IOSIntArray *perm);

FOUNDATION_EXPORT void OrgBouncycastlePqcMathLinearalgebraPermutation_initWithByteArray_(OrgBouncycastlePqcMathLinearalgebraPermutation *self, IOSByteArray *enc);

FOUNDATION_EXPORT OrgBouncycastlePqcMathLinearalgebraPermutation *new_OrgBouncycastlePqcMathLinearalgebraPermutation_initWithByteArray_(IOSByteArray *enc) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcMathLinearalgebraPermutation *create_OrgBouncycastlePqcMathLinearalgebraPermutation_initWithByteArray_(IOSByteArray *enc);

FOUNDATION_EXPORT void OrgBouncycastlePqcMathLinearalgebraPermutation_initWithInt_withJavaSecuritySecureRandom_(OrgBouncycastlePqcMathLinearalgebraPermutation *self, jint n, JavaSecuritySecureRandom *sr);

FOUNDATION_EXPORT OrgBouncycastlePqcMathLinearalgebraPermutation *new_OrgBouncycastlePqcMathLinearalgebraPermutation_initWithInt_withJavaSecuritySecureRandom_(jint n, JavaSecuritySecureRandom *sr) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcMathLinearalgebraPermutation *create_OrgBouncycastlePqcMathLinearalgebraPermutation_initWithInt_withJavaSecuritySecureRandom_(jint n, JavaSecuritySecureRandom *sr);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcMathLinearalgebraPermutation)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcMathLinearalgebraPermutation")
