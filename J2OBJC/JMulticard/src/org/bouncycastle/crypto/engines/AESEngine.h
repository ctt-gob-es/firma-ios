//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/crypto/engines/AESEngine.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleCryptoEnginesAESEngine")
#ifdef RESTRICT_OrgBouncycastleCryptoEnginesAESEngine
#define INCLUDE_ALL_OrgBouncycastleCryptoEnginesAESEngine 0
#else
#define INCLUDE_ALL_OrgBouncycastleCryptoEnginesAESEngine 1
#endif
#undef RESTRICT_OrgBouncycastleCryptoEnginesAESEngine

#if !defined (OrgBouncycastleCryptoEnginesAESEngine_) && (INCLUDE_ALL_OrgBouncycastleCryptoEnginesAESEngine || defined(INCLUDE_OrgBouncycastleCryptoEnginesAESEngine))
#define OrgBouncycastleCryptoEnginesAESEngine_

#define RESTRICT_OrgBouncycastleCryptoDefaultMultiBlockCipher 1
#define INCLUDE_OrgBouncycastleCryptoDefaultMultiBlockCipher 1
#include "org/bouncycastle/crypto/DefaultMultiBlockCipher.h"

@class IOSByteArray;
@protocol OrgBouncycastleCryptoCipherParameters;
@protocol OrgBouncycastleCryptoMultiBlockCipher;

/*!
 @brief an implementation of the AES (Rijndael), from FIPS-197.
 <p>
  For further details see: <a href="https://csrc.nist.gov/encryption/aes/">https://csrc.nist.gov/encryption/aes/</a>.
  This implementation is based on optimizations from Dr. Brian Gladman's paper and C code at 
 <a href="https://fp.gladman.plus.com/cryptography_technology/rijndael/">https://fp.gladman.plus.com/cryptography_technology/rijndael/</a>
  There are three levels of tradeoff of speed vs memory
  Because java has no preprocessor, they are written as three separate classes from which to choose
  The fastest uses 8Kbytes of static tables to precompute round calculations, 4 256 word tables for encryption
  and 4 for decryption.
  The middle performance version uses only one 256 word table for each, for a total of 2Kbytes,
  adding 12 rotate operations per round to compute the values contained in the other tables from
  the contents of the first.
  The slowest version uses no static tables at all and computes the values in each round. 
 <p>
  This file contains the middle performance version with 2Kbytes of static tables for round precomputation.
 */
@interface OrgBouncycastleCryptoEnginesAESEngine : OrgBouncycastleCryptoDefaultMultiBlockCipher

#pragma mark Public

/*!
 @brief default constructor - 128 bit block size.
 */
- (instancetype)init;

- (NSString *)getAlgorithmName;

- (jint)getBlockSize;

/*!
 @brief initialise an AES cipher.
 @param forEncryption whether or not we are for encryption.
 @param params the parameters required to set up the cipher.
 @throw IllegalArgumentExceptionif the params argument is
  inappropriate.
 */
- (void)init__WithBoolean:(jboolean)forEncryption
withOrgBouncycastleCryptoCipherParameters:(id<OrgBouncycastleCryptoCipherParameters>)params OBJC_METHOD_FAMILY_NONE;

/*!
 @brief Return an AESEngine.
 @return an AES ECB mode cipher.
 */
+ (id<OrgBouncycastleCryptoMultiBlockCipher>)newInstance OBJC_METHOD_FAMILY_NONE;

- (jint)processBlockWithByteArray:(IOSByteArray *)inArg
                          withInt:(jint)inOff
                    withByteArray:(IOSByteArray *)outArg
                          withInt:(jint)outOff;

- (void)reset;

@end

J2OBJC_STATIC_INIT(OrgBouncycastleCryptoEnginesAESEngine)

FOUNDATION_EXPORT id<OrgBouncycastleCryptoMultiBlockCipher> OrgBouncycastleCryptoEnginesAESEngine_newInstance(void);

FOUNDATION_EXPORT void OrgBouncycastleCryptoEnginesAESEngine_init(OrgBouncycastleCryptoEnginesAESEngine *self);

FOUNDATION_EXPORT OrgBouncycastleCryptoEnginesAESEngine *new_OrgBouncycastleCryptoEnginesAESEngine_init(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleCryptoEnginesAESEngine *create_OrgBouncycastleCryptoEnginesAESEngine_init(void);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleCryptoEnginesAESEngine)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleCryptoEnginesAESEngine")
