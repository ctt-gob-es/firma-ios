//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/sphincs/SPHINCS256Signer.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer")
#ifdef RESTRICT_OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer 1
#endif
#undef RESTRICT_OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer

#if !defined (OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer_) && (INCLUDE_ALL_OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer || defined(INCLUDE_OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer))
#define OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer_

#define RESTRICT_OrgBouncycastlePqcCryptoMessageSigner 1
#define INCLUDE_OrgBouncycastlePqcCryptoMessageSigner 1
#include "org/bouncycastle/pqc/crypto/MessageSigner.h"

@class IOSByteArray;
@class OrgBouncycastlePqcCryptoSphincsHashFunctions;
@class OrgBouncycastlePqcCryptoSphincsTree_leafaddr;
@protocol OrgBouncycastleCryptoCipherParameters;
@protocol OrgBouncycastleCryptoDigest;

/*!
 @brief SPHINCS-256 signer.
 <p>
  This implementation is heavily based on the reference implementation in SUPERCOP, the main difference being the digests used
  for message hashing and tree construction are now configurable (within limits...) and that the implementation produces
  detached signatures. 
 </p>
  <p>
  The SPHINCS reference implementation is public domain, as per the statement in the second last paragraph of
  section 1 in https://eprint.iacr.org/2014/795.pdf 
 </p>
 */
@interface OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer : NSObject < OrgBouncycastlePqcCryptoMessageSigner >

#pragma mark Public

/*!
 @brief Base constructor.
 @param nDigest the "n-digest" must produce 32 bytes of output - used for tree construction.
 @param twoNDigest the "2n-digest" must produce 64 bytes of output - used for initial message/key/seed hashing.
 */
- (instancetype)initWithOrgBouncycastleCryptoDigest:(id<OrgBouncycastleCryptoDigest>)nDigest
                    withOrgBouncycastleCryptoDigest:(id<OrgBouncycastleCryptoDigest>)twoNDigest;

- (IOSByteArray *)generateSignatureWithByteArray:(IOSByteArray *)message;

- (void)init__WithBoolean:(jboolean)forSigning
withOrgBouncycastleCryptoCipherParameters:(id<OrgBouncycastleCryptoCipherParameters>)param OBJC_METHOD_FAMILY_NONE;

- (jboolean)verifySignatureWithByteArray:(IOSByteArray *)message
                           withByteArray:(IOSByteArray *)signature;

#pragma mark Package-Private

+ (void)compute_authpath_wotsWithOrgBouncycastlePqcCryptoSphincsHashFunctions:(OrgBouncycastlePqcCryptoSphincsHashFunctions *)hs
                                                                withByteArray:(IOSByteArray *)root
                                                                withByteArray:(IOSByteArray *)authpath
                                                                      withInt:(jint)authOff
                             withOrgBouncycastlePqcCryptoSphincsTree_leafaddr:(OrgBouncycastlePqcCryptoSphincsTree_leafaddr *)a
                                                                withByteArray:(IOSByteArray *)sk
                                                                withByteArray:(IOSByteArray *)masks
                                                                      withInt:(jint)height;

- (IOSByteArray *)crypto_signWithOrgBouncycastlePqcCryptoSphincsHashFunctions:(OrgBouncycastlePqcCryptoSphincsHashFunctions *)hs
                                                                withByteArray:(IOSByteArray *)m
                                                                withByteArray:(IOSByteArray *)sk;

+ (void)validate_authpathWithOrgBouncycastlePqcCryptoSphincsHashFunctions:(OrgBouncycastlePqcCryptoSphincsHashFunctions *)hs
                                                            withByteArray:(IOSByteArray *)root
                                                            withByteArray:(IOSByteArray *)leaf
                                                                  withInt:(jint)leafidx
                                                            withByteArray:(IOSByteArray *)authpath
                                                                  withInt:(jint)auOff
                                                            withByteArray:(IOSByteArray *)masks
                                                                  withInt:(jint)height;

- (jboolean)verifyWithOrgBouncycastlePqcCryptoSphincsHashFunctions:(OrgBouncycastlePqcCryptoSphincsHashFunctions *)hs
                                                     withByteArray:(IOSByteArray *)m
                                                     withByteArray:(IOSByteArray *)sm
                                                     withByteArray:(IOSByteArray *)pk;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer)

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer_initWithOrgBouncycastleCryptoDigest_withOrgBouncycastleCryptoDigest_(OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer *self, id<OrgBouncycastleCryptoDigest> nDigest, id<OrgBouncycastleCryptoDigest> twoNDigest);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer *new_OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer_initWithOrgBouncycastleCryptoDigest_withOrgBouncycastleCryptoDigest_(id<OrgBouncycastleCryptoDigest> nDigest, id<OrgBouncycastleCryptoDigest> twoNDigest) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer *create_OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer_initWithOrgBouncycastleCryptoDigest_withOrgBouncycastleCryptoDigest_(id<OrgBouncycastleCryptoDigest> nDigest, id<OrgBouncycastleCryptoDigest> twoNDigest);

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer_validate_authpathWithOrgBouncycastlePqcCryptoSphincsHashFunctions_withByteArray_withByteArray_withInt_withByteArray_withInt_withByteArray_withInt_(OrgBouncycastlePqcCryptoSphincsHashFunctions *hs, IOSByteArray *root, IOSByteArray *leaf, jint leafidx, IOSByteArray *authpath, jint auOff, IOSByteArray *masks, jint height);

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer_compute_authpath_wotsWithOrgBouncycastlePqcCryptoSphincsHashFunctions_withByteArray_withByteArray_withInt_withOrgBouncycastlePqcCryptoSphincsTree_leafaddr_withByteArray_withByteArray_withInt_(OrgBouncycastlePqcCryptoSphincsHashFunctions *hs, IOSByteArray *root, IOSByteArray *authpath, jint authOff, OrgBouncycastlePqcCryptoSphincsTree_leafaddr *a, IOSByteArray *sk, IOSByteArray *masks, jint height);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoSphincsSPHINCS256Signer")
