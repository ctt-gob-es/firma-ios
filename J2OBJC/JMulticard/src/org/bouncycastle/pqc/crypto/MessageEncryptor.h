//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/MessageEncryptor.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoMessageEncryptor")
#ifdef RESTRICT_OrgBouncycastlePqcCryptoMessageEncryptor
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoMessageEncryptor 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoMessageEncryptor 1
#endif
#undef RESTRICT_OrgBouncycastlePqcCryptoMessageEncryptor

#if !defined (OrgBouncycastlePqcCryptoMessageEncryptor_) && (INCLUDE_ALL_OrgBouncycastlePqcCryptoMessageEncryptor || defined(INCLUDE_OrgBouncycastlePqcCryptoMessageEncryptor))
#define OrgBouncycastlePqcCryptoMessageEncryptor_

@class IOSByteArray;
@protocol OrgBouncycastleCryptoCipherParameters;

/*!
 @brief Base interface for a PQC encryption algorithm.
 */
@protocol OrgBouncycastlePqcCryptoMessageEncryptor < JavaObject >

/*!
 @param forEncrypting true if we are encrypting a signature, false  otherwise.
 @param param key parameters for encryption or decryption.
 */
- (void)init__WithBoolean:(jboolean)forEncrypting
withOrgBouncycastleCryptoCipherParameters:(id<OrgBouncycastleCryptoCipherParameters>)param OBJC_METHOD_FAMILY_NONE;

/*!
 @param message the message to be signed.
 */
- (IOSByteArray *)messageEncryptWithByteArray:(IOSByteArray *)message;

/*!
 @param cipher the cipher text of the message
 @throw InvalidCipherTextException
 */
- (IOSByteArray *)messageDecryptWithByteArray:(IOSByteArray *)cipher;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastlePqcCryptoMessageEncryptor)

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcCryptoMessageEncryptor)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoMessageEncryptor")
