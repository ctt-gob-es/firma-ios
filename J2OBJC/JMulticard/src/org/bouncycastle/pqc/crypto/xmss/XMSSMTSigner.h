//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/xmss/XMSSMTSigner.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoXmssXMSSMTSigner")
#ifdef RESTRICT_OrgBouncycastlePqcCryptoXmssXMSSMTSigner
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoXmssXMSSMTSigner 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoXmssXMSSMTSigner 1
#endif
#undef RESTRICT_OrgBouncycastlePqcCryptoXmssXMSSMTSigner

#if !defined (OrgBouncycastlePqcCryptoXmssXMSSMTSigner_) && (INCLUDE_ALL_OrgBouncycastlePqcCryptoXmssXMSSMTSigner || defined(INCLUDE_OrgBouncycastlePqcCryptoXmssXMSSMTSigner))
#define OrgBouncycastlePqcCryptoXmssXMSSMTSigner_

#define RESTRICT_OrgBouncycastlePqcCryptoStateAwareMessageSigner 1
#define INCLUDE_OrgBouncycastlePqcCryptoStateAwareMessageSigner 1
#include "org/bouncycastle/pqc/crypto/StateAwareMessageSigner.h"

@class IOSByteArray;
@class OrgBouncycastleCryptoParamsAsymmetricKeyParameter;
@protocol OrgBouncycastleCryptoCipherParameters;

/*!
 @brief XMSS^MT Signer class.
 */
@interface OrgBouncycastlePqcCryptoXmssXMSSMTSigner : NSObject < OrgBouncycastlePqcCryptoStateAwareMessageSigner >

#pragma mark Public

- (instancetype)init;

- (IOSByteArray *)generateSignatureWithByteArray:(IOSByteArray *)message;

- (OrgBouncycastleCryptoParamsAsymmetricKeyParameter *)getUpdatedPrivateKey;

- (jlong)getUsagesRemaining;

- (void)init__WithBoolean:(jboolean)forSigning
withOrgBouncycastleCryptoCipherParameters:(id<OrgBouncycastleCryptoCipherParameters>)param OBJC_METHOD_FAMILY_NONE;

- (jboolean)verifySignatureWithByteArray:(IOSByteArray *)message
                           withByteArray:(IOSByteArray *)signature;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastlePqcCryptoXmssXMSSMTSigner)

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoXmssXMSSMTSigner_init(OrgBouncycastlePqcCryptoXmssXMSSMTSigner *self);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoXmssXMSSMTSigner *new_OrgBouncycastlePqcCryptoXmssXMSSMTSigner_init(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoXmssXMSSMTSigner *create_OrgBouncycastlePqcCryptoXmssXMSSMTSigner_init(void);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcCryptoXmssXMSSMTSigner)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoXmssXMSSMTSigner")
