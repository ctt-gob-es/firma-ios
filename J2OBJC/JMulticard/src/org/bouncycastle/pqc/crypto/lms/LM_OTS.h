//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/lms/LM_OTS.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoLmsLM_OTS")
#ifdef RESTRICT_OrgBouncycastlePqcCryptoLmsLM_OTS
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoLmsLM_OTS 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoLmsLM_OTS 1
#endif
#undef RESTRICT_OrgBouncycastlePqcCryptoLmsLM_OTS

#if !defined (OrgBouncycastlePqcCryptoLmsLM_OTS_) && (INCLUDE_ALL_OrgBouncycastlePqcCryptoLmsLM_OTS || defined(INCLUDE_OrgBouncycastlePqcCryptoLmsLM_OTS))
#define OrgBouncycastlePqcCryptoLmsLM_OTS_

@class IOSByteArray;
@class IOSObjectArray;
@class OrgBouncycastlePqcCryptoLmsLMOtsParameters;
@class OrgBouncycastlePqcCryptoLmsLMOtsPrivateKey;
@class OrgBouncycastlePqcCryptoLmsLMOtsPublicKey;
@class OrgBouncycastlePqcCryptoLmsLMOtsSignature;
@class OrgBouncycastlePqcCryptoLmsLMSContext;
@class OrgBouncycastlePqcCryptoLmsLMSigParameters;

@interface OrgBouncycastlePqcCryptoLmsLM_OTS : NSObject

#pragma mark Public

+ (jint)cksmWithByteArray:(IOSByteArray *)S
                  withInt:(jint)sLen
withOrgBouncycastlePqcCryptoLmsLMOtsParameters:(OrgBouncycastlePqcCryptoLmsLMOtsParameters *)parameters;

+ (jint)coefWithByteArray:(IOSByteArray *)S
                  withInt:(jint)i
                  withInt:(jint)w;

+ (OrgBouncycastlePqcCryptoLmsLMOtsSignature *)lm_ots_generate_signatureWithOrgBouncycastlePqcCryptoLmsLMOtsPrivateKey:(OrgBouncycastlePqcCryptoLmsLMOtsPrivateKey *)privateKey
                                                                                                         withByteArray:(IOSByteArray *)Q
                                                                                                         withByteArray:(IOSByteArray *)C;

+ (OrgBouncycastlePqcCryptoLmsLMOtsSignature *)lm_ots_generate_signatureWithOrgBouncycastlePqcCryptoLmsLMSigParameters:(OrgBouncycastlePqcCryptoLmsLMSigParameters *)sigParams
                                                                        withOrgBouncycastlePqcCryptoLmsLMOtsPrivateKey:(OrgBouncycastlePqcCryptoLmsLMOtsPrivateKey *)privateKey
                                                                                                        withByteArray2:(IOSObjectArray *)path
                                                                                                         withByteArray:(IOSByteArray *)message
                                                                                                           withBoolean:(jboolean)preHashed;

+ (jboolean)lm_ots_validate_signatureWithOrgBouncycastlePqcCryptoLmsLMOtsPublicKey:(OrgBouncycastlePqcCryptoLmsLMOtsPublicKey *)publicKey
                                     withOrgBouncycastlePqcCryptoLmsLMOtsSignature:(OrgBouncycastlePqcCryptoLmsLMOtsSignature *)signature
                                                                     withByteArray:(IOSByteArray *)message
                                                                       withBoolean:(jboolean)prehashed;

+ (IOSByteArray *)lm_ots_validate_signature_calculateWithOrgBouncycastlePqcCryptoLmsLMOtsPublicKey:(OrgBouncycastlePqcCryptoLmsLMOtsPublicKey *)publicKey
                                                     withOrgBouncycastlePqcCryptoLmsLMOtsSignature:(OrgBouncycastlePqcCryptoLmsLMOtsSignature *)signature
                                                                                     withByteArray:(IOSByteArray *)message;

+ (IOSByteArray *)lm_ots_validate_signature_calculateWithOrgBouncycastlePqcCryptoLmsLMSContext:(OrgBouncycastlePqcCryptoLmsLMSContext *)context;

+ (OrgBouncycastlePqcCryptoLmsLMOtsPublicKey *)lms_ots_generatePublicKeyWithOrgBouncycastlePqcCryptoLmsLMOtsPrivateKey:(OrgBouncycastlePqcCryptoLmsLMOtsPrivateKey *)privateKey;

#pragma mark Package-Private

- (instancetype)initPackagePrivate;

+ (IOSByteArray *)lms_ots_generatePublicKeyWithOrgBouncycastlePqcCryptoLmsLMOtsParameters:(OrgBouncycastlePqcCryptoLmsLMOtsParameters *)parameter
                                                                            withByteArray:(IOSByteArray *)I
                                                                                  withInt:(jint)q
                                                                            withByteArray:(IOSByteArray *)masterSecret;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastlePqcCryptoLmsLM_OTS)

inline jint OrgBouncycastlePqcCryptoLmsLM_OTS_get_SEED_RANDOMISER_INDEX(void);
#define OrgBouncycastlePqcCryptoLmsLM_OTS_SEED_RANDOMISER_INDEX -3
J2OBJC_STATIC_FIELD_CONSTANT(OrgBouncycastlePqcCryptoLmsLM_OTS, SEED_RANDOMISER_INDEX, jint)

inline jint OrgBouncycastlePqcCryptoLmsLM_OTS_get_SEED_LEN(void);
#define OrgBouncycastlePqcCryptoLmsLM_OTS_SEED_LEN 32
J2OBJC_STATIC_FIELD_CONSTANT(OrgBouncycastlePqcCryptoLmsLM_OTS, SEED_LEN, jint)

inline jint OrgBouncycastlePqcCryptoLmsLM_OTS_get_MAX_HASH(void);
#define OrgBouncycastlePqcCryptoLmsLM_OTS_MAX_HASH 32
J2OBJC_STATIC_FIELD_CONSTANT(OrgBouncycastlePqcCryptoLmsLM_OTS, MAX_HASH, jint)

inline jshort OrgBouncycastlePqcCryptoLmsLM_OTS_get_D_MESG(void);
#define OrgBouncycastlePqcCryptoLmsLM_OTS_D_MESG -32383
J2OBJC_STATIC_FIELD_CONSTANT(OrgBouncycastlePqcCryptoLmsLM_OTS, D_MESG, jshort)

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoLmsLM_OTS_initPackagePrivate(OrgBouncycastlePqcCryptoLmsLM_OTS *self);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoLmsLM_OTS *new_OrgBouncycastlePqcCryptoLmsLM_OTS_initPackagePrivate(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoLmsLM_OTS *create_OrgBouncycastlePqcCryptoLmsLM_OTS_initPackagePrivate(void);

FOUNDATION_EXPORT jint OrgBouncycastlePqcCryptoLmsLM_OTS_coefWithByteArray_withInt_withInt_(IOSByteArray *S, jint i, jint w);

FOUNDATION_EXPORT jint OrgBouncycastlePqcCryptoLmsLM_OTS_cksmWithByteArray_withInt_withOrgBouncycastlePqcCryptoLmsLMOtsParameters_(IOSByteArray *S, jint sLen, OrgBouncycastlePqcCryptoLmsLMOtsParameters *parameters);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoLmsLMOtsPublicKey *OrgBouncycastlePqcCryptoLmsLM_OTS_lms_ots_generatePublicKeyWithOrgBouncycastlePqcCryptoLmsLMOtsPrivateKey_(OrgBouncycastlePqcCryptoLmsLMOtsPrivateKey *privateKey);

FOUNDATION_EXPORT IOSByteArray *OrgBouncycastlePqcCryptoLmsLM_OTS_lms_ots_generatePublicKeyWithOrgBouncycastlePqcCryptoLmsLMOtsParameters_withByteArray_withInt_withByteArray_(OrgBouncycastlePqcCryptoLmsLMOtsParameters *parameter, IOSByteArray *I, jint q, IOSByteArray *masterSecret);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoLmsLMOtsSignature *OrgBouncycastlePqcCryptoLmsLM_OTS_lm_ots_generate_signatureWithOrgBouncycastlePqcCryptoLmsLMSigParameters_withOrgBouncycastlePqcCryptoLmsLMOtsPrivateKey_withByteArray2_withByteArray_withBoolean_(OrgBouncycastlePqcCryptoLmsLMSigParameters *sigParams, OrgBouncycastlePqcCryptoLmsLMOtsPrivateKey *privateKey, IOSObjectArray *path, IOSByteArray *message, jboolean preHashed);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoLmsLMOtsSignature *OrgBouncycastlePqcCryptoLmsLM_OTS_lm_ots_generate_signatureWithOrgBouncycastlePqcCryptoLmsLMOtsPrivateKey_withByteArray_withByteArray_(OrgBouncycastlePqcCryptoLmsLMOtsPrivateKey *privateKey, IOSByteArray *Q, IOSByteArray *C);

FOUNDATION_EXPORT jboolean OrgBouncycastlePqcCryptoLmsLM_OTS_lm_ots_validate_signatureWithOrgBouncycastlePqcCryptoLmsLMOtsPublicKey_withOrgBouncycastlePqcCryptoLmsLMOtsSignature_withByteArray_withBoolean_(OrgBouncycastlePqcCryptoLmsLMOtsPublicKey *publicKey, OrgBouncycastlePqcCryptoLmsLMOtsSignature *signature, IOSByteArray *message, jboolean prehashed);

FOUNDATION_EXPORT IOSByteArray *OrgBouncycastlePqcCryptoLmsLM_OTS_lm_ots_validate_signature_calculateWithOrgBouncycastlePqcCryptoLmsLMOtsPublicKey_withOrgBouncycastlePqcCryptoLmsLMOtsSignature_withByteArray_(OrgBouncycastlePqcCryptoLmsLMOtsPublicKey *publicKey, OrgBouncycastlePqcCryptoLmsLMOtsSignature *signature, IOSByteArray *message);

FOUNDATION_EXPORT IOSByteArray *OrgBouncycastlePqcCryptoLmsLM_OTS_lm_ots_validate_signature_calculateWithOrgBouncycastlePqcCryptoLmsLMSContext_(OrgBouncycastlePqcCryptoLmsLMSContext *context);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcCryptoLmsLM_OTS)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoLmsLM_OTS")
