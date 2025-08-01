//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/mceliece/Conversions.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoMcelieceConversions")
#ifdef RESTRICT_OrgBouncycastlePqcCryptoMcelieceConversions
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoMcelieceConversions 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoMcelieceConversions 1
#endif
#undef RESTRICT_OrgBouncycastlePqcCryptoMcelieceConversions

#if !defined (OrgBouncycastlePqcCryptoMcelieceConversions_) && (INCLUDE_ALL_OrgBouncycastlePqcCryptoMcelieceConversions || defined(INCLUDE_OrgBouncycastlePqcCryptoMcelieceConversions))
#define OrgBouncycastlePqcCryptoMcelieceConversions_

@class IOSByteArray;
@class OrgBouncycastlePqcMathLinearalgebraGF2Vector;

/*!
 @brief Provides methods for CCA2-Secure Conversions of McEliece PKCS
 */
@interface OrgBouncycastlePqcCryptoMcelieceConversions : NSObject

#pragma mark Public

/*!
 @brief Decode a binary vector of length n and weight t into a number between 0
  and (n|t) (binomial coefficient).The result is given as a byte array of
  length floor[(s+7)/8], where s = floor[log(n|t)].
 @param n integer
 @param t integer
 @param vec the binary vector
 @return the decoded vector as a byte array
 */
+ (IOSByteArray *)decodeWithInt:(jint)n
                        withInt:(jint)t
withOrgBouncycastlePqcMathLinearalgebraGF2Vector:(OrgBouncycastlePqcMathLinearalgebraGF2Vector *)vec;

/*!
 @brief Encode a number between 0 and (n|t) (binomial coefficient) into a binary
  vector of length n with weight t.The number is given as a byte array.
 Only the first s bits are used, where s = floor[log(n|t)].
 @param n integer
 @param t integer
 @param m the message as a byte array
 @return the encoded message as <code>GF2Vector</code>
 */
+ (OrgBouncycastlePqcMathLinearalgebraGF2Vector *)encodeWithInt:(jint)n
                                                        withInt:(jint)t
                                                  withByteArray:(IOSByteArray *)m;

/*!
 @brief Compute a message representative of a message given as a vector of length 
 <tt>n</tt> bit and of hamming weight <tt>t</tt>.The result is a
  byte array of length <tt>(s+7)/8</tt>, where 
 <tt>s = floor[log(n|t)]</tt>.
 @param n integer
 @param t integer
 @param m the message vector as a byte array
 @return a message representative for <tt>m</tt>
 */
+ (IOSByteArray *)signConversionWithInt:(jint)n
                                withInt:(jint)t
                          withByteArray:(IOSByteArray *)m;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_STATIC_INIT(OrgBouncycastlePqcCryptoMcelieceConversions)

FOUNDATION_EXPORT OrgBouncycastlePqcMathLinearalgebraGF2Vector *OrgBouncycastlePqcCryptoMcelieceConversions_encodeWithInt_withInt_withByteArray_(jint n, jint t, IOSByteArray *m);

FOUNDATION_EXPORT IOSByteArray *OrgBouncycastlePqcCryptoMcelieceConversions_decodeWithInt_withInt_withOrgBouncycastlePqcMathLinearalgebraGF2Vector_(jint n, jint t, OrgBouncycastlePqcMathLinearalgebraGF2Vector *vec);

FOUNDATION_EXPORT IOSByteArray *OrgBouncycastlePqcCryptoMcelieceConversions_signConversionWithInt_withInt_withByteArray_(jint n, jint t, IOSByteArray *m);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcCryptoMcelieceConversions)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoMcelieceConversions")
