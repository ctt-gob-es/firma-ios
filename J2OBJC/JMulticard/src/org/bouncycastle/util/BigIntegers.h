//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/util/BigIntegers.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleUtilBigIntegers")
#ifdef RESTRICT_OrgBouncycastleUtilBigIntegers
#define INCLUDE_ALL_OrgBouncycastleUtilBigIntegers 0
#else
#define INCLUDE_ALL_OrgBouncycastleUtilBigIntegers 1
#endif
#undef RESTRICT_OrgBouncycastleUtilBigIntegers

#if !defined (OrgBouncycastleUtilBigIntegers_) && (INCLUDE_ALL_OrgBouncycastleUtilBigIntegers || defined(INCLUDE_OrgBouncycastleUtilBigIntegers))
#define OrgBouncycastleUtilBigIntegers_

@class IOSByteArray;
@class JavaMathBigInteger;
@class JavaSecuritySecureRandom;

/*!
 @brief BigInteger utilities.
 */
@interface OrgBouncycastleUtilBigIntegers : NSObject

#pragma mark Public

- (instancetype)init;

/*!
 @brief Return the passed in value as an unsigned byte array.
 @param value the value to be converted.
 @return a byte array without a leading zero byte if present in the signed encoding.
 */
+ (IOSByteArray *)asUnsignedByteArrayWithJavaMathBigInteger:(JavaMathBigInteger *)value;

/*!
 @brief Write the passed in value as unsigned bytes to the specified buffer range, padded with
  leading zeros as necessary.
 @param value the value to be converted.
 @param buf the buffer to which the value is written.
 @param off the start offset in array  <code> buf </code>  at which the data is written.
 @param len the fixed length of data written (possibly padded with leading zeros).
 */
+ (void)asUnsignedByteArrayWithJavaMathBigInteger:(JavaMathBigInteger *)value
                                    withByteArray:(IOSByteArray *)buf
                                          withInt:(jint)off
                                          withInt:(jint)len;

/*!
 @brief Return the passed in value as an unsigned byte array of the specified length, padded with
  leading zeros as necessary..
 @param length the fixed length of the result
 @param value the value to be converted.
 @return a byte array padded to a fixed length with leading zeros.
 */
+ (IOSByteArray *)asUnsignedByteArrayWithInt:(jint)length
                      withJavaMathBigInteger:(JavaMathBigInteger *)value;

+ (jbyte)byteValueExactWithJavaMathBigInteger:(JavaMathBigInteger *)x;

/*!
 @brief Return a positive BigInteger in the range of 0 to 2**bitLength - 1.
 @param bitLength maximum bit length for the generated BigInteger.
 @param random a source of randomness.
 @return a positive BigInteger
 */
+ (JavaMathBigInteger *)createRandomBigIntegerWithInt:(jint)bitLength
                         withJavaSecuritySecureRandom:(JavaSecuritySecureRandom *)random;

/*!
 @brief Return a random BigInteger not less than 'min' and not greater than 'max'
 @param min the least value that may be generated
 @param max the greatest value that may be generated
 @param random the source of randomness
 @return a random BigInteger value in the range [min,max]
 */
+ (JavaMathBigInteger *)createRandomInRangeWithJavaMathBigInteger:(JavaMathBigInteger *)min
                                           withJavaMathBigInteger:(JavaMathBigInteger *)max
                                     withJavaSecuritySecureRandom:(JavaSecuritySecureRandom *)random;

/*!
 @brief Return a prime number candidate of the specified bit length.
 @param bitLength bit length for the generated BigInteger.
 @param random a source of randomness.
 @return a positive BigInteger of numBits length
 */
+ (JavaMathBigInteger *)createRandomPrimeWithInt:(jint)bitLength
                                         withInt:(jint)certainty
                    withJavaSecuritySecureRandom:(JavaSecuritySecureRandom *)random;

+ (JavaMathBigInteger *)fromUnsignedByteArrayWithByteArray:(IOSByteArray *)buf;

+ (JavaMathBigInteger *)fromUnsignedByteArrayWithByteArray:(IOSByteArray *)buf
                                                   withInt:(jint)off
                                                   withInt:(jint)length;

+ (jint)getUnsignedByteLengthWithJavaMathBigInteger:(JavaMathBigInteger *)n;

+ (jint)intValueExactWithJavaMathBigInteger:(JavaMathBigInteger *)x;

+ (jlong)longValueExactWithJavaMathBigInteger:(JavaMathBigInteger *)x;

+ (JavaMathBigInteger *)modOddInverseWithJavaMathBigInteger:(JavaMathBigInteger *)M
                                     withJavaMathBigInteger:(JavaMathBigInteger *)X;

+ (JavaMathBigInteger *)modOddInverseVarWithJavaMathBigInteger:(JavaMathBigInteger *)M
                                        withJavaMathBigInteger:(JavaMathBigInteger *)X;

+ (jshort)shortValueExactWithJavaMathBigInteger:(JavaMathBigInteger *)x;

@end

J2OBJC_STATIC_INIT(OrgBouncycastleUtilBigIntegers)

inline JavaMathBigInteger *OrgBouncycastleUtilBigIntegers_get_ZERO(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastleUtilBigIntegers_ZERO;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleUtilBigIntegers, ZERO, JavaMathBigInteger *)

inline JavaMathBigInteger *OrgBouncycastleUtilBigIntegers_get_ONE(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastleUtilBigIntegers_ONE;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleUtilBigIntegers, ONE, JavaMathBigInteger *)

inline JavaMathBigInteger *OrgBouncycastleUtilBigIntegers_get_TWO(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastleUtilBigIntegers_TWO;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleUtilBigIntegers, TWO, JavaMathBigInteger *)

FOUNDATION_EXPORT void OrgBouncycastleUtilBigIntegers_init(OrgBouncycastleUtilBigIntegers *self);

FOUNDATION_EXPORT OrgBouncycastleUtilBigIntegers *new_OrgBouncycastleUtilBigIntegers_init(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleUtilBigIntegers *create_OrgBouncycastleUtilBigIntegers_init(void);

FOUNDATION_EXPORT IOSByteArray *OrgBouncycastleUtilBigIntegers_asUnsignedByteArrayWithJavaMathBigInteger_(JavaMathBigInteger *value);

FOUNDATION_EXPORT IOSByteArray *OrgBouncycastleUtilBigIntegers_asUnsignedByteArrayWithInt_withJavaMathBigInteger_(jint length, JavaMathBigInteger *value);

FOUNDATION_EXPORT void OrgBouncycastleUtilBigIntegers_asUnsignedByteArrayWithJavaMathBigInteger_withByteArray_withInt_withInt_(JavaMathBigInteger *value, IOSByteArray *buf, jint off, jint len);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastleUtilBigIntegers_createRandomInRangeWithJavaMathBigInteger_withJavaMathBigInteger_withJavaSecuritySecureRandom_(JavaMathBigInteger *min, JavaMathBigInteger *max, JavaSecuritySecureRandom *random);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastleUtilBigIntegers_fromUnsignedByteArrayWithByteArray_(IOSByteArray *buf);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastleUtilBigIntegers_fromUnsignedByteArrayWithByteArray_withInt_withInt_(IOSByteArray *buf, jint off, jint length);

FOUNDATION_EXPORT jbyte OrgBouncycastleUtilBigIntegers_byteValueExactWithJavaMathBigInteger_(JavaMathBigInteger *x);

FOUNDATION_EXPORT jshort OrgBouncycastleUtilBigIntegers_shortValueExactWithJavaMathBigInteger_(JavaMathBigInteger *x);

FOUNDATION_EXPORT jint OrgBouncycastleUtilBigIntegers_intValueExactWithJavaMathBigInteger_(JavaMathBigInteger *x);

FOUNDATION_EXPORT jlong OrgBouncycastleUtilBigIntegers_longValueExactWithJavaMathBigInteger_(JavaMathBigInteger *x);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastleUtilBigIntegers_modOddInverseWithJavaMathBigInteger_withJavaMathBigInteger_(JavaMathBigInteger *M, JavaMathBigInteger *X);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastleUtilBigIntegers_modOddInverseVarWithJavaMathBigInteger_withJavaMathBigInteger_(JavaMathBigInteger *M, JavaMathBigInteger *X);

FOUNDATION_EXPORT jint OrgBouncycastleUtilBigIntegers_getUnsignedByteLengthWithJavaMathBigInteger_(JavaMathBigInteger *n);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastleUtilBigIntegers_createRandomBigIntegerWithInt_withJavaSecuritySecureRandom_(jint bitLength, JavaSecuritySecureRandom *random);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastleUtilBigIntegers_createRandomPrimeWithInt_withInt_withJavaSecuritySecureRandom_(jint bitLength, jint certainty, JavaSecuritySecureRandom *random);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleUtilBigIntegers)

#endif

#if !defined (OrgBouncycastleUtilBigIntegers_Cache_) && (INCLUDE_ALL_OrgBouncycastleUtilBigIntegers || defined(INCLUDE_OrgBouncycastleUtilBigIntegers_Cache))
#define OrgBouncycastleUtilBigIntegers_Cache_

@class JavaMathBigInteger;

@interface OrgBouncycastleUtilBigIntegers_Cache : NSObject

#pragma mark Public

- (instancetype)init;

- (void)addWithJavaMathBigInteger:(JavaMathBigInteger *)value;

- (void)clear;

- (jboolean)containsWithJavaMathBigInteger:(JavaMathBigInteger *)value;

- (jint)size;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleUtilBigIntegers_Cache)

FOUNDATION_EXPORT void OrgBouncycastleUtilBigIntegers_Cache_init(OrgBouncycastleUtilBigIntegers_Cache *self);

FOUNDATION_EXPORT OrgBouncycastleUtilBigIntegers_Cache *new_OrgBouncycastleUtilBigIntegers_Cache_init(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleUtilBigIntegers_Cache *create_OrgBouncycastleUtilBigIntegers_Cache_init(void);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleUtilBigIntegers_Cache)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleUtilBigIntegers")
