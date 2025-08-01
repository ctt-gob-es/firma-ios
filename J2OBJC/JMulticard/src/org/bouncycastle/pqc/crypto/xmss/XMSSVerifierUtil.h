//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/xmss/XMSSVerifierUtil.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil")
#ifdef RESTRICT_OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil 1
#endif
#undef RESTRICT_OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil

#if !defined (OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil_) && (INCLUDE_ALL_OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil || defined(INCLUDE_OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil))
#define OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil_

@class IOSByteArray;
@class OrgBouncycastlePqcCryptoXmssOTSHashAddress;
@class OrgBouncycastlePqcCryptoXmssWOTSPlus;
@class OrgBouncycastlePqcCryptoXmssXMSSNode;
@class OrgBouncycastlePqcCryptoXmssXMSSReducedSignature;

@interface OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil : NSObject

#pragma mark Package-Private

- (instancetype)initPackagePrivate;

/*!
 @brief Compute a root node from a tree signature.
 @param messageDigest Message digest.
 @param signature XMSS signature.
 @return Root node calculated from signature.
 */
+ (OrgBouncycastlePqcCryptoXmssXMSSNode *)getRootNodeFromSignatureWithOrgBouncycastlePqcCryptoXmssWOTSPlus:(OrgBouncycastlePqcCryptoXmssWOTSPlus *)wotsPlus
                                                                                                   withInt:(jint)height
                                                                                             withByteArray:(IOSByteArray *)messageDigest
                                                      withOrgBouncycastlePqcCryptoXmssXMSSReducedSignature:(OrgBouncycastlePqcCryptoXmssXMSSReducedSignature *)signature
                                                            withOrgBouncycastlePqcCryptoXmssOTSHashAddress:(OrgBouncycastlePqcCryptoXmssOTSHashAddress *)otsHashAddress
                                                                                                   withInt:(jint)indexLeaf;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil)

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil_initPackagePrivate(OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil *self);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil *new_OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil_initPackagePrivate(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil *create_OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil_initPackagePrivate(void);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoXmssXMSSNode *OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil_getRootNodeFromSignatureWithOrgBouncycastlePqcCryptoXmssWOTSPlus_withInt_withByteArray_withOrgBouncycastlePqcCryptoXmssXMSSReducedSignature_withOrgBouncycastlePqcCryptoXmssOTSHashAddress_withInt_(OrgBouncycastlePqcCryptoXmssWOTSPlus *wotsPlus, jint height, IOSByteArray *messageDigest, OrgBouncycastlePqcCryptoXmssXMSSReducedSignature *signature, OrgBouncycastlePqcCryptoXmssOTSHashAddress *otsHashAddress, jint indexLeaf);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoXmssXMSSVerifierUtil")
