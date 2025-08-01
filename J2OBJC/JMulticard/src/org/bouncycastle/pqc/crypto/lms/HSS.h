//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/lms/HSS.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoLmsHSS")
#ifdef RESTRICT_OrgBouncycastlePqcCryptoLmsHSS
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoLmsHSS 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoLmsHSS 1
#endif
#undef RESTRICT_OrgBouncycastlePqcCryptoLmsHSS

#if !defined (OrgBouncycastlePqcCryptoLmsHSS_) && (INCLUDE_ALL_OrgBouncycastlePqcCryptoLmsHSS || defined(INCLUDE_OrgBouncycastlePqcCryptoLmsHSS))
#define OrgBouncycastlePqcCryptoLmsHSS_

@class IOSByteArray;
@class OrgBouncycastlePqcCryptoLmsHSSKeyGenerationParameters;
@class OrgBouncycastlePqcCryptoLmsHSSPrivateKeyParameters;
@class OrgBouncycastlePqcCryptoLmsHSSPublicKeyParameters;
@class OrgBouncycastlePqcCryptoLmsHSSSignature;
@class OrgBouncycastlePqcCryptoLmsLMSContext;

@interface OrgBouncycastlePqcCryptoLmsHSS : NSObject

#pragma mark Public

+ (OrgBouncycastlePqcCryptoLmsHSSPrivateKeyParameters *)generateHSSKeyPairWithOrgBouncycastlePqcCryptoLmsHSSKeyGenerationParameters:(OrgBouncycastlePqcCryptoLmsHSSKeyGenerationParameters *)parameters;

+ (OrgBouncycastlePqcCryptoLmsHSSSignature *)generateSignatureWithOrgBouncycastlePqcCryptoLmsHSSPrivateKeyParameters:(OrgBouncycastlePqcCryptoLmsHSSPrivateKeyParameters *)keyPair
                                                                                                       withByteArray:(IOSByteArray *)message;

+ (OrgBouncycastlePqcCryptoLmsHSSSignature *)generateSignatureWithInt:(jint)L
                            withOrgBouncycastlePqcCryptoLmsLMSContext:(OrgBouncycastlePqcCryptoLmsLMSContext *)context;

/*!
 @brief Increments an HSS private key without doing any work on it.
 HSS private keys are automatically incremented when when used to create signatures. 
 <p>
  The HSS private key is ranged tested before this incrementation is applied.
  LMS keys will be replaced as required.
 @param keyPair
 */
+ (void)incrementIndexWithOrgBouncycastlePqcCryptoLmsHSSPrivateKeyParameters:(OrgBouncycastlePqcCryptoLmsHSSPrivateKeyParameters *)keyPair;

+ (jboolean)verifySignatureWithOrgBouncycastlePqcCryptoLmsHSSPublicKeyParameters:(OrgBouncycastlePqcCryptoLmsHSSPublicKeyParameters *)publicKey
                                     withOrgBouncycastlePqcCryptoLmsHSSSignature:(OrgBouncycastlePqcCryptoLmsHSSSignature *)signature
                                                                   withByteArray:(IOSByteArray *)message;

#pragma mark Package-Private

- (instancetype)initPackagePrivate;

+ (void)rangeTestKeysWithOrgBouncycastlePqcCryptoLmsHSSPrivateKeyParameters:(OrgBouncycastlePqcCryptoLmsHSSPrivateKeyParameters *)keyPair;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastlePqcCryptoLmsHSS)

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoLmsHSS_initPackagePrivate(OrgBouncycastlePqcCryptoLmsHSS *self);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoLmsHSS *new_OrgBouncycastlePqcCryptoLmsHSS_initPackagePrivate(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoLmsHSS *create_OrgBouncycastlePqcCryptoLmsHSS_initPackagePrivate(void);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoLmsHSSPrivateKeyParameters *OrgBouncycastlePqcCryptoLmsHSS_generateHSSKeyPairWithOrgBouncycastlePqcCryptoLmsHSSKeyGenerationParameters_(OrgBouncycastlePqcCryptoLmsHSSKeyGenerationParameters *parameters);

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoLmsHSS_incrementIndexWithOrgBouncycastlePqcCryptoLmsHSSPrivateKeyParameters_(OrgBouncycastlePqcCryptoLmsHSSPrivateKeyParameters *keyPair);

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoLmsHSS_rangeTestKeysWithOrgBouncycastlePqcCryptoLmsHSSPrivateKeyParameters_(OrgBouncycastlePqcCryptoLmsHSSPrivateKeyParameters *keyPair);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoLmsHSSSignature *OrgBouncycastlePqcCryptoLmsHSS_generateSignatureWithOrgBouncycastlePqcCryptoLmsHSSPrivateKeyParameters_withByteArray_(OrgBouncycastlePqcCryptoLmsHSSPrivateKeyParameters *keyPair, IOSByteArray *message);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoLmsHSSSignature *OrgBouncycastlePqcCryptoLmsHSS_generateSignatureWithInt_withOrgBouncycastlePqcCryptoLmsLMSContext_(jint L, OrgBouncycastlePqcCryptoLmsLMSContext *context);

FOUNDATION_EXPORT jboolean OrgBouncycastlePqcCryptoLmsHSS_verifySignatureWithOrgBouncycastlePqcCryptoLmsHSSPublicKeyParameters_withOrgBouncycastlePqcCryptoLmsHSSSignature_withByteArray_(OrgBouncycastlePqcCryptoLmsHSSPublicKeyParameters *publicKey, OrgBouncycastlePqcCryptoLmsHSSSignature *signature, IOSByteArray *message);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcCryptoLmsHSS)

#endif

#if !defined (OrgBouncycastlePqcCryptoLmsHSS_PlaceholderLMSPrivateKey_) && (INCLUDE_ALL_OrgBouncycastlePqcCryptoLmsHSS || defined(INCLUDE_OrgBouncycastlePqcCryptoLmsHSS_PlaceholderLMSPrivateKey))
#define OrgBouncycastlePqcCryptoLmsHSS_PlaceholderLMSPrivateKey_

#define RESTRICT_OrgBouncycastlePqcCryptoLmsLMSPrivateKeyParameters 1
#define INCLUDE_OrgBouncycastlePqcCryptoLmsLMSPrivateKeyParameters 1
#include "org/bouncycastle/pqc/crypto/lms/LMSPrivateKeyParameters.h"

@class IOSByteArray;
@class OrgBouncycastlePqcCryptoLmsLMOtsParameters;
@class OrgBouncycastlePqcCryptoLmsLMOtsPrivateKey;
@class OrgBouncycastlePqcCryptoLmsLMSPublicKeyParameters;
@class OrgBouncycastlePqcCryptoLmsLMSigParameters;

@interface OrgBouncycastlePqcCryptoLmsHSS_PlaceholderLMSPrivateKey : OrgBouncycastlePqcCryptoLmsLMSPrivateKeyParameters

#pragma mark Public

- (instancetype)initWithOrgBouncycastlePqcCryptoLmsLMSigParameters:(OrgBouncycastlePqcCryptoLmsLMSigParameters *)lmsParameter
                    withOrgBouncycastlePqcCryptoLmsLMOtsParameters:(OrgBouncycastlePqcCryptoLmsLMOtsParameters *)otsParameters
                                                           withInt:(jint)q
                                                     withByteArray:(IOSByteArray *)I
                                                           withInt:(jint)maxQ
                                                     withByteArray:(IOSByteArray *)masterSecret;

- (OrgBouncycastlePqcCryptoLmsLMSPublicKeyParameters *)getPublicKey;

#pragma mark Package-Private

- (OrgBouncycastlePqcCryptoLmsLMOtsPrivateKey *)getNextOtsPrivateKey;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastlePqcCryptoLmsHSS_PlaceholderLMSPrivateKey)

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoLmsHSS_PlaceholderLMSPrivateKey_initWithOrgBouncycastlePqcCryptoLmsLMSigParameters_withOrgBouncycastlePqcCryptoLmsLMOtsParameters_withInt_withByteArray_withInt_withByteArray_(OrgBouncycastlePqcCryptoLmsHSS_PlaceholderLMSPrivateKey *self, OrgBouncycastlePqcCryptoLmsLMSigParameters *lmsParameter, OrgBouncycastlePqcCryptoLmsLMOtsParameters *otsParameters, jint q, IOSByteArray *I, jint maxQ, IOSByteArray *masterSecret);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoLmsHSS_PlaceholderLMSPrivateKey *new_OrgBouncycastlePqcCryptoLmsHSS_PlaceholderLMSPrivateKey_initWithOrgBouncycastlePqcCryptoLmsLMSigParameters_withOrgBouncycastlePqcCryptoLmsLMOtsParameters_withInt_withByteArray_withInt_withByteArray_(OrgBouncycastlePqcCryptoLmsLMSigParameters *lmsParameter, OrgBouncycastlePqcCryptoLmsLMOtsParameters *otsParameters, jint q, IOSByteArray *I, jint maxQ, IOSByteArray *masterSecret) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoLmsHSS_PlaceholderLMSPrivateKey *create_OrgBouncycastlePqcCryptoLmsHSS_PlaceholderLMSPrivateKey_initWithOrgBouncycastlePqcCryptoLmsLMSigParameters_withOrgBouncycastlePqcCryptoLmsLMOtsParameters_withInt_withByteArray_withInt_withByteArray_(OrgBouncycastlePqcCryptoLmsLMSigParameters *lmsParameter, OrgBouncycastlePqcCryptoLmsLMOtsParameters *otsParameters, jint q, IOSByteArray *I, jint maxQ, IOSByteArray *masterSecret);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcCryptoLmsHSS_PlaceholderLMSPrivateKey)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoLmsHSS")
