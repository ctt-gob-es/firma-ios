//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/sphincsplus/SPHINCSPlusSigner.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusSigner")
#ifdef RESTRICT_OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusSigner
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusSigner 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusSigner 1
#endif
#undef RESTRICT_OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusSigner

#if !defined (OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusSigner_) && (INCLUDE_ALL_OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusSigner || defined(INCLUDE_OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusSigner))
#define OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusSigner_

#define RESTRICT_OrgBouncycastlePqcCryptoMessageSigner 1
#define INCLUDE_OrgBouncycastlePqcCryptoMessageSigner 1
#include "org/bouncycastle/pqc/crypto/MessageSigner.h"

@class IOSByteArray;
@protocol OrgBouncycastleCryptoCipherParameters;

/*!
 @brief SPHINCS+ signer.
 <p>
      This version is based on the 3rd submission with deference to the updated reference
      implementation on github as at November 9th 2021. This version includes the changes
      for the countermeasure for the long-message second preimage attack - see
      "https://github.com/sphincs/sphincsplus/commit/61cd2695c6f984b4f4d6ed675378ed9a486cbede"
      for further details. 
 </p>
 */
@interface OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusSigner : NSObject < OrgBouncycastlePqcCryptoMessageSigner >

#pragma mark Public

/*!
 @brief Base constructor.
 */
- (instancetype)init;

- (IOSByteArray *)generateSignatureWithByteArray:(IOSByteArray *)message;

- (void)init__WithBoolean:(jboolean)forSigning
withOrgBouncycastleCryptoCipherParameters:(id<OrgBouncycastleCryptoCipherParameters>)param OBJC_METHOD_FAMILY_NONE;

- (jboolean)verifySignatureWithByteArray:(IOSByteArray *)message
                           withByteArray:(IOSByteArray *)signature;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusSigner)

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusSigner_init(OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusSigner *self);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusSigner *new_OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusSigner_init(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusSigner *create_OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusSigner_init(void);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusSigner)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoSphincsplusSPHINCSPlusSigner")
