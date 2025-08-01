//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/math/linearalgebra/IntegerFunctions.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcMathLinearalgebraIntegerFunctions")
#ifdef RESTRICT_OrgBouncycastlePqcMathLinearalgebraIntegerFunctions
#define INCLUDE_ALL_OrgBouncycastlePqcMathLinearalgebraIntegerFunctions 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcMathLinearalgebraIntegerFunctions 1
#endif
#undef RESTRICT_OrgBouncycastlePqcMathLinearalgebraIntegerFunctions

#if !defined (OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_) && (INCLUDE_ALL_OrgBouncycastlePqcMathLinearalgebraIntegerFunctions || defined(INCLUDE_OrgBouncycastlePqcMathLinearalgebraIntegerFunctions))
#define OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_

@class IOSByteArray;
@class IOSIntArray;
@class IOSObjectArray;
@class JavaMathBigInteger;
@class JavaSecuritySecureRandom;

/*!
 @brief Class of number-theory related functions for use with integers represented as 
 <tt>int</tt>'s or <tt>BigInteger</tt> objects.
 */
@interface OrgBouncycastlePqcMathLinearalgebraIntegerFunctions : NSObject

#pragma mark Public

/*!
 @brief Computes the binomial coefficient (n|t) ("n over t").Formula:
  <ul>
  <li>if n !
 =0 and t != 0 then (n|t) = Mult(i=1, t): (n-(i-1))/i</li>
  <li>if t = 0 then (n|t) = 1</li>
  <li>if n = 0 and t &gt; 0 then (n|t) = 0</li>
  </ul>
 @param n - the "upper" integer
 @param t - the "lower" integer
 @return the binomialcoefficient "n over t" as BigInteger
 */
+ (JavaMathBigInteger *)binomialWithInt:(jint)n
                                withInt:(jint)t;

/*!
 @param a an integer
 @return the number of ones in the binary representation of an integer
          <tt>a</tt>
 */
+ (jint)bitCountWithInt:(jint)a;

/*!
 @brief Compute the smallest integer that is greater than or equal to the
  logarithm to the base 2 of the given BigInteger.
 @param a the integer
 @return ceil[log(a)]
 */
+ (jint)ceilLogWithJavaMathBigInteger:(JavaMathBigInteger *)a;

/*!
 @brief Compute the smallest integer that is greater than or equal to the
  logarithm to the base 2 of the given integer.
 @param a the integer
 @return ceil[log(a)]
 */
+ (jint)ceilLogWithInt:(jint)a;

/*!
 @brief Compute <tt>ceil(log_256 n)</tt>, the number of bytes needed to encode
  the integer <tt>n</tt>.
 @param n the integer
 @return the number of bytes needed to encode <tt>n</tt>
 */
+ (jint)ceilLog256WithInt:(jint)n;

/*!
 @brief Compute <tt>ceil(log_256 n)</tt>, the number of bytes needed to encode
  the long integer <tt>n</tt>.
 @param n the long integer
 @return the number of bytes needed to encode <tt>n</tt>
 */
+ (jint)ceilLog256WithLong:(jlong)n;

+ (JavaMathBigInteger *)divideAndRoundWithJavaMathBigInteger:(JavaMathBigInteger *)a
                                      withJavaMathBigInteger:(JavaMathBigInteger *)b;

+ (IOSObjectArray *)divideAndRoundWithJavaMathBigIntegerArray:(IOSObjectArray *)a
                                       withJavaMathBigInteger:(JavaMathBigInteger *)b;

/*!
 @brief Extended euclidian algorithm (computes gcd and representation).
 @param a the first integer
 @param b the second integer
 @return <tt>(g,u,v)</tt>, where <tt>g = gcd(abs(a),abs(b)) = ua + vb</tt>
 */
+ (IOSIntArray *)extGCDWithInt:(jint)a
                       withInt:(jint)b;

/*!
 @brief Extended euclidian algorithm (computes gcd and representation).
 @param a - the first integer
 @param b - the second integer
 @return <tt>(d,u,v)</tt>, where <tt>d = gcd(a,b) = ua + vb</tt>
 */
+ (IOSObjectArray *)extgcdWithJavaMathBigInteger:(JavaMathBigInteger *)a
                          withJavaMathBigInteger:(JavaMathBigInteger *)b;

/*!
 @brief int power of a base float, only use for small ints
 @param f base float
 @param i power to be raised to.
 @return int power i of f
 */
+ (jfloat)floatPowWithFloat:(jfloat)f
                    withInt:(jint)i;

/*!
 @brief Compute the integer part of the logarithm to the base 2 of the given
  integer.
 @param a the integer
 @return floor[log(a)]
 */
+ (jint)floorLogWithJavaMathBigInteger:(JavaMathBigInteger *)a;

/*!
 @brief Compute the integer part of the logarithm to the base 2 of the given
  integer.
 @param a the integer
 @return floor[log(a)]
 */
+ (jint)floorLogWithInt:(jint)a;

/*!
 @brief Computes the greatest common divisor of the two specified integers
 @param u - first integer
 @param v - second integer
 @return gcd(a, b)
 */
+ (jint)gcdWithInt:(jint)u
           withInt:(jint)v;

+ (IOSByteArray *)integerToOctetsWithJavaMathBigInteger:(JavaMathBigInteger *)val;

/*!
 @brief Takes an approximation of the root from an integer base, using newton's
  algorithm
 @param base the base to take the root from
 @param root the root, for example 2 for a square root
 */
+ (jfloat)intRootWithInt:(jint)base
                 withInt:(jint)root;

+ (jboolean)isIncreasingWithIntArray:(IOSIntArray *)a;

/*!
 @brief Tests whether an integer <tt>a</tt> is power of another integer 
 <tt>p</tt>.
 @param a - the first integer
 @param p - the second integer
 @return n if a = p^n or -1 otherwise
 */
+ (jint)isPowerWithInt:(jint)a
               withInt:(jint)p;

/*!
 @brief Miller-Rabin-Test, determines wether the given integer is probably prime
  or composite.This method returns <tt>true</tt> if the given integer is
  prime with probability <tt>1 - 2<sup>-20</sup></tt>.
 @param n the integer to test for primality
 @return <tt>true</tt> if the given integer is prime with probability
          2<sup>-100</sup>, <tt>false</tt> otherwise
 */
+ (jboolean)isPrimeWithInt:(jint)n;

/*!
 @brief Computes the value of the Jacobi symbol (A|B).The following properties
  hold for the Jacobi symbol which makes it a very efficient way to
  evaluate the Legendre symbol 
 <p>
  (A|B) = 0 IF gcd(A,B) &gt; 1<br>
  (-1|B) = 1 IF n = 1 (mod 1)<br>
  (-1|B) = -1 IF n = 3 (mod 4)<br>
  (A|B) (C|B) = (AC|B)<br>
  (A|B) (A|C) = (A|CB)<br>
  (A|B) = (C|B) IF A = C (mod B)<br>
  (2|B) = 1 IF N = 1 OR 7 (mod 8)<br>
  (2|B) = 1 IF N = 3 OR 5 (mod 8)
 @param A integer value
 @param B integer value
 @return value of the jacobi symbol (A|B)
 */
+ (jint)jacobiWithJavaMathBigInteger:(JavaMathBigInteger *)A
              withJavaMathBigInteger:(JavaMathBigInteger *)B;

/*!
 @brief Computation of the least common multiple of a set of BigIntegers.
 @param numbers - the set of numbers
 @return the lcm(numbers)
 */
+ (JavaMathBigInteger *)leastCommonMultipleWithJavaMathBigIntegerArray:(IOSObjectArray *)numbers;

/*!
 @brief Find and return the least non-trivial divisor of an integer <tt>a</tt>.
 @param a - the integer
 @return divisor p &gt;1 or 1 if a = -1,0,1
 */
+ (jint)leastDivWithInt:(jint)a;

/*!
 @brief calculate the logarithm to the base 2.
 @param x any double value
 @return log_2(x)
 */
+ (jdouble)logWithDouble:(jdouble)x;

/*!
 @brief calculate the logarithm to the base 2.
 @param x any long value  &gt; =1
 @return log_2(x)
 */
+ (jdouble)logWithLong:(jlong)x;

/*!
 @brief Compute the largest <tt>h</tt> with <tt>2^h | a</tt> if <tt>a!
 =0</tt>.
 @param a an integer
 @return the largest <tt>h</tt> with <tt>2^h | a</tt> if <tt>a!=0</tt>,
          <tt>0</tt> otherwise
 */
+ (jint)maxPowerWithInt:(jint)a;

/*!
 @brief Returns a long integer whose value is <tt>(a mod m</tt>).This method
  differs from <tt>%</tt> in that it always returns a <i>non-negative</i>
  integer.
 @param a value on which the modulo operation has to be performed.
 @param m the modulus.
 @return <tt>a mod m</tt>
 */
+ (jlong)modWithLong:(jlong)a
            withLong:(jlong)m;

/*!
 @brief Computes the modular inverse of an integer a
 @param a - the integer to invert
 @param mod - the modulus
 @return <tt>a<sup>-1</sup> mod n</tt>
 */
+ (jint)modInverseWithInt:(jint)a
                  withInt:(jint)mod;

/*!
 @brief Computes the modular inverse of an integer a
 @param a - the integer to invert
 @param mod - the modulus
 @return <tt>a<sup>-1</sup> mod n</tt>
 */
+ (jlong)modInverseWithLong:(jlong)a
                   withLong:(jlong)mod;

/*!
 @brief Compute <tt>a<sup>e</sup> mod n</tt>.
 @param a the base
 @param e the exponent
 @param n the modulus
 @return <tt>a<sup>e</sup> mod n</tt>
 */
+ (jint)modPowWithInt:(jint)a
              withInt:(jint)e
              withInt:(jint)n;

/*!
 @brief Computes the next prime greater than n.
 @param n a integer number
 @return the next prime greater than n
 */
+ (JavaMathBigInteger *)nextPrimeWithLong:(jlong)n;

/*!
 @brief Compute the next probable prime greater than <tt>n</tt> with the default
  certainty (20).
 @param n a integer number
 @return the next prime greater than <tt>n</tt>
 */
+ (JavaMathBigInteger *)nextProbablePrimeWithJavaMathBigInteger:(JavaMathBigInteger *)n;

/*!
 @brief Compute the next probable prime greater than <tt>n</tt> with the
  specified certainty.
 @param n a integer number
 @param certainty the certainty that the generated number is prime
 @return the next prime greater than <tt>n</tt>
 */
+ (JavaMathBigInteger *)nextProbablePrimeWithJavaMathBigInteger:(JavaMathBigInteger *)n
                                                        withInt:(jint)certainty;

/*!
 @brief Returns the largest prime smaller than the given integer
 @param n - upper bound
 @return the largest prime smaller than <tt>n</tt>, or <tt>1</tt> if
          <tt>n &lt;= 2</tt>
 */
+ (jint)nextSmallerPrimeWithInt:(jint)n;

+ (JavaMathBigInteger *)octetsToIntegerWithByteArray:(IOSByteArray *)data;

+ (JavaMathBigInteger *)octetsToIntegerWithByteArray:(IOSByteArray *)data
                                             withInt:(jint)offset
                                             withInt:(jint)length;

/*!
 @brief determines the order of g modulo p, p prime and 1 &lt; g &lt; p.This algorithm
  is only efficient for small p (see X9.62-1998, p. 68).
 @param g an integer with 1  &lt;  g  &lt;  p
 @param p a prime
 @return the order k of g (that is k is the smallest integer with
          g<sup>k</sup> = 1 mod p
 */
+ (jint)orderWithInt:(jint)g
             withInt:(jint)p;

/*!
 @brief Short trial-division test to find out whether a number is not prime.This
  test is usually used before a Miller-Rabin primality test.
 @param candidate the number to test
 @return <tt>true</tt> if the number has no factor of the tested primes,
          <tt>false</tt> if the number is definitely composite
 */
+ (jboolean)passesSmallPrimeTestWithJavaMathBigInteger:(JavaMathBigInteger *)candidate;

/*!
 @brief Compute <tt>a<sup>e</sup></tt>.
 @param a the base
 @param e the exponent
 @return <tt>a<sup>e</sup></tt>
 */
+ (jint)powWithInt:(jint)a
           withInt:(jint)e;

/*!
 @brief Compute <tt>a<sup>e</sup></tt>.
 @param a the base
 @param e the exponent
 @return <tt>a<sup>e</sup></tt>
 */
+ (jlong)powWithLong:(jlong)a
             withInt:(jint)e;

+ (JavaMathBigInteger *)randomizeWithJavaMathBigInteger:(JavaMathBigInteger *)upperBound;

+ (JavaMathBigInteger *)randomizeWithJavaMathBigInteger:(JavaMathBigInteger *)upperBound
                           withJavaSecuritySecureRandom:(JavaSecuritySecureRandom *)prng;

/*!
 @brief Reduces an integer into a given interval
 @param n - the integer
 @param begin - left bound of the interval
 @param end - right bound of the interval
 @return <tt>n</tt> reduced into <tt>[begin,end]</tt>
 */
+ (JavaMathBigInteger *)reduceIntoWithJavaMathBigInteger:(JavaMathBigInteger *)n
                                  withJavaMathBigInteger:(JavaMathBigInteger *)begin
                                  withJavaMathBigInteger:(JavaMathBigInteger *)end;

/*!
 @brief Extract the truncated square root of a BigInteger.
 @param a - value out of which we extract the square root
 @return the truncated square root of <tt>a</tt>
 */
+ (JavaMathBigInteger *)squareRootWithJavaMathBigInteger:(JavaMathBigInteger *)a;

@end

J2OBJC_STATIC_INIT(OrgBouncycastlePqcMathLinearalgebraIntegerFunctions)

FOUNDATION_EXPORT jint OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_jacobiWithJavaMathBigInteger_withJavaMathBigInteger_(JavaMathBigInteger *A, JavaMathBigInteger *B);

FOUNDATION_EXPORT jint OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_gcdWithInt_withInt_(jint u, jint v);

FOUNDATION_EXPORT IOSIntArray *OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_extGCDWithInt_withInt_(jint a, jint b);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_divideAndRoundWithJavaMathBigInteger_withJavaMathBigInteger_(JavaMathBigInteger *a, JavaMathBigInteger *b);

FOUNDATION_EXPORT IOSObjectArray *OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_divideAndRoundWithJavaMathBigIntegerArray_withJavaMathBigInteger_(IOSObjectArray *a, JavaMathBigInteger *b);

FOUNDATION_EXPORT jint OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_ceilLogWithJavaMathBigInteger_(JavaMathBigInteger *a);

FOUNDATION_EXPORT jint OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_ceilLogWithInt_(jint a);

FOUNDATION_EXPORT jint OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_ceilLog256WithInt_(jint n);

FOUNDATION_EXPORT jint OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_ceilLog256WithLong_(jlong n);

FOUNDATION_EXPORT jint OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_floorLogWithJavaMathBigInteger_(JavaMathBigInteger *a);

FOUNDATION_EXPORT jint OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_floorLogWithInt_(jint a);

FOUNDATION_EXPORT jint OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_maxPowerWithInt_(jint a);

FOUNDATION_EXPORT jint OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_bitCountWithInt_(jint a);

FOUNDATION_EXPORT jint OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_orderWithInt_withInt_(jint g, jint p);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_reduceIntoWithJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_(JavaMathBigInteger *n, JavaMathBigInteger *begin, JavaMathBigInteger *end);

FOUNDATION_EXPORT jint OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_powWithInt_withInt_(jint a, jint e);

FOUNDATION_EXPORT jlong OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_powWithLong_withInt_(jlong a, jint e);

FOUNDATION_EXPORT jint OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_modPowWithInt_withInt_withInt_(jint a, jint e, jint n);

FOUNDATION_EXPORT IOSObjectArray *OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_extgcdWithJavaMathBigInteger_withJavaMathBigInteger_(JavaMathBigInteger *a, JavaMathBigInteger *b);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_leastCommonMultipleWithJavaMathBigIntegerArray_(IOSObjectArray *numbers);

FOUNDATION_EXPORT jlong OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_modWithLong_withLong_(jlong a, jlong m);

FOUNDATION_EXPORT jint OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_modInverseWithInt_withInt_(jint a, jint mod);

FOUNDATION_EXPORT jlong OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_modInverseWithLong_withLong_(jlong a, jlong mod);

FOUNDATION_EXPORT jint OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_isPowerWithInt_withInt_(jint a, jint p);

FOUNDATION_EXPORT jint OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_leastDivWithInt_(jint a);

FOUNDATION_EXPORT jboolean OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_isPrimeWithInt_(jint n);

FOUNDATION_EXPORT jboolean OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_passesSmallPrimeTestWithJavaMathBigInteger_(JavaMathBigInteger *candidate);

FOUNDATION_EXPORT jint OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_nextSmallerPrimeWithInt_(jint n);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_nextProbablePrimeWithJavaMathBigInteger_withInt_(JavaMathBigInteger *n, jint certainty);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_nextProbablePrimeWithJavaMathBigInteger_(JavaMathBigInteger *n);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_nextPrimeWithLong_(jlong n);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_binomialWithInt_withInt_(jint n, jint t);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_randomizeWithJavaMathBigInteger_(JavaMathBigInteger *upperBound);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_randomizeWithJavaMathBigInteger_withJavaSecuritySecureRandom_(JavaMathBigInteger *upperBound, JavaSecuritySecureRandom *prng);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_squareRootWithJavaMathBigInteger_(JavaMathBigInteger *a);

FOUNDATION_EXPORT jfloat OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_intRootWithInt_withInt_(jint base, jint root);

FOUNDATION_EXPORT jfloat OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_floatPowWithFloat_withInt_(jfloat f, jint i);

FOUNDATION_EXPORT jdouble OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_logWithDouble_(jdouble x);

FOUNDATION_EXPORT jdouble OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_logWithLong_(jlong x);

FOUNDATION_EXPORT jboolean OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_isIncreasingWithIntArray_(IOSIntArray *a);

FOUNDATION_EXPORT IOSByteArray *OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_integerToOctetsWithJavaMathBigInteger_(JavaMathBigInteger *val);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_octetsToIntegerWithByteArray_withInt_withInt_(IOSByteArray *data, jint offset, jint length);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastlePqcMathLinearalgebraIntegerFunctions_octetsToIntegerWithByteArray_(IOSByteArray *data);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcMathLinearalgebraIntegerFunctions)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcMathLinearalgebraIntegerFunctions")
