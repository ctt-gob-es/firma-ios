//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/xmss/BDS.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoXmssBDS")
#ifdef RESTRICT_OrgBouncycastlePqcCryptoXmssBDS
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoXmssBDS 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoXmssBDS 1
#endif
#undef RESTRICT_OrgBouncycastlePqcCryptoXmssBDS

#if !defined (OrgBouncycastlePqcCryptoXmssBDS_) && (INCLUDE_ALL_OrgBouncycastlePqcCryptoXmssBDS || defined(INCLUDE_OrgBouncycastlePqcCryptoXmssBDS))
#define OrgBouncycastlePqcCryptoXmssBDS_

#define RESTRICT_JavaIoSerializable 1
#define INCLUDE_JavaIoSerializable 1
#include "java/io/Serializable.h"

@class IOSByteArray;
@class OrgBouncycastleAsn1ASN1ObjectIdentifier;
@class OrgBouncycastlePqcCryptoXmssOTSHashAddress;
@class OrgBouncycastlePqcCryptoXmssXMSSNode;
@class OrgBouncycastlePqcCryptoXmssXMSSParameters;
@protocol JavaUtilList;

/*!
 @brief BDS.
 */
@interface OrgBouncycastlePqcCryptoXmssBDS : NSObject < JavaIoSerializable >

#pragma mark Public

- (jint)getMaxIndex;

- (OrgBouncycastlePqcCryptoXmssBDS *)getNextStateWithByteArray:(IOSByteArray *)publicSeed
                                                 withByteArray:(IOSByteArray *)secretKeySeed
                withOrgBouncycastlePqcCryptoXmssOTSHashAddress:(OrgBouncycastlePqcCryptoXmssOTSHashAddress *)otsHashAddress;

- (OrgBouncycastlePqcCryptoXmssBDS *)withMaxIndexWithInt:(jint)maxIndex
             withOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)digestName;

- (OrgBouncycastlePqcCryptoXmssBDS *)withWOTSDigestWithOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)digestName;

#pragma mark Protected

- (id<JavaUtilList>)getAuthenticationPath;

- (jint)getIndex;

- (OrgBouncycastlePqcCryptoXmssXMSSNode *)getRoot;

- (jint)getTreeHeight;

#pragma mark Package-Private

- (instancetype)initWithOrgBouncycastlePqcCryptoXmssBDS:(OrgBouncycastlePqcCryptoXmssBDS *)last;

/*!
 @brief Set up constructor.
 @param params tree parameters
 @param publicSeed public seed for tree
 @param secretKeySeed secret seed for tree
 @param otsHashAddress hash address
 */
- (instancetype)initWithOrgBouncycastlePqcCryptoXmssXMSSParameters:(OrgBouncycastlePqcCryptoXmssXMSSParameters *)params
                                                     withByteArray:(IOSByteArray *)publicSeed
                                                     withByteArray:(IOSByteArray *)secretKeySeed
                    withOrgBouncycastlePqcCryptoXmssOTSHashAddress:(OrgBouncycastlePqcCryptoXmssOTSHashAddress *)otsHashAddress;

/*!
 @brief Set up constructor for a tree where the original BDS state was lost.
 @param params tree parameters
 @param publicSeed public seed for tree
 @param secretKeySeed secret seed for tree
 @param otsHashAddress hash address
 @param index index counter for the state to be at.
 */
- (instancetype)initWithOrgBouncycastlePqcCryptoXmssXMSSParameters:(OrgBouncycastlePqcCryptoXmssXMSSParameters *)params
                                                     withByteArray:(IOSByteArray *)publicSeed
                                                     withByteArray:(IOSByteArray *)secretKeySeed
                    withOrgBouncycastlePqcCryptoXmssOTSHashAddress:(OrgBouncycastlePqcCryptoXmssOTSHashAddress *)otsHashAddress
                                                           withInt:(jint)index;

/*!
 @brief Place holder BDS for when state is exhausted.
 @param params tree parameters
 @param index the index that has been reached.
 */
- (instancetype)initWithOrgBouncycastlePqcCryptoXmssXMSSParameters:(OrgBouncycastlePqcCryptoXmssXMSSParameters *)params
                                                           withInt:(jint)maxIndex
                                                           withInt:(jint)index;

- (jboolean)isUsed;

- (void)markUsed;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastlePqcCryptoXmssBDS)

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoXmssBDS_initWithOrgBouncycastlePqcCryptoXmssXMSSParameters_withInt_withInt_(OrgBouncycastlePqcCryptoXmssBDS *self, OrgBouncycastlePqcCryptoXmssXMSSParameters *params, jint maxIndex, jint index);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoXmssBDS *new_OrgBouncycastlePqcCryptoXmssBDS_initWithOrgBouncycastlePqcCryptoXmssXMSSParameters_withInt_withInt_(OrgBouncycastlePqcCryptoXmssXMSSParameters *params, jint maxIndex, jint index) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoXmssBDS *create_OrgBouncycastlePqcCryptoXmssBDS_initWithOrgBouncycastlePqcCryptoXmssXMSSParameters_withInt_withInt_(OrgBouncycastlePqcCryptoXmssXMSSParameters *params, jint maxIndex, jint index);

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoXmssBDS_initWithOrgBouncycastlePqcCryptoXmssXMSSParameters_withByteArray_withByteArray_withOrgBouncycastlePqcCryptoXmssOTSHashAddress_(OrgBouncycastlePqcCryptoXmssBDS *self, OrgBouncycastlePqcCryptoXmssXMSSParameters *params, IOSByteArray *publicSeed, IOSByteArray *secretKeySeed, OrgBouncycastlePqcCryptoXmssOTSHashAddress *otsHashAddress);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoXmssBDS *new_OrgBouncycastlePqcCryptoXmssBDS_initWithOrgBouncycastlePqcCryptoXmssXMSSParameters_withByteArray_withByteArray_withOrgBouncycastlePqcCryptoXmssOTSHashAddress_(OrgBouncycastlePqcCryptoXmssXMSSParameters *params, IOSByteArray *publicSeed, IOSByteArray *secretKeySeed, OrgBouncycastlePqcCryptoXmssOTSHashAddress *otsHashAddress) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoXmssBDS *create_OrgBouncycastlePqcCryptoXmssBDS_initWithOrgBouncycastlePqcCryptoXmssXMSSParameters_withByteArray_withByteArray_withOrgBouncycastlePqcCryptoXmssOTSHashAddress_(OrgBouncycastlePqcCryptoXmssXMSSParameters *params, IOSByteArray *publicSeed, IOSByteArray *secretKeySeed, OrgBouncycastlePqcCryptoXmssOTSHashAddress *otsHashAddress);

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoXmssBDS_initWithOrgBouncycastlePqcCryptoXmssXMSSParameters_withByteArray_withByteArray_withOrgBouncycastlePqcCryptoXmssOTSHashAddress_withInt_(OrgBouncycastlePqcCryptoXmssBDS *self, OrgBouncycastlePqcCryptoXmssXMSSParameters *params, IOSByteArray *publicSeed, IOSByteArray *secretKeySeed, OrgBouncycastlePqcCryptoXmssOTSHashAddress *otsHashAddress, jint index);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoXmssBDS *new_OrgBouncycastlePqcCryptoXmssBDS_initWithOrgBouncycastlePqcCryptoXmssXMSSParameters_withByteArray_withByteArray_withOrgBouncycastlePqcCryptoXmssOTSHashAddress_withInt_(OrgBouncycastlePqcCryptoXmssXMSSParameters *params, IOSByteArray *publicSeed, IOSByteArray *secretKeySeed, OrgBouncycastlePqcCryptoXmssOTSHashAddress *otsHashAddress, jint index) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoXmssBDS *create_OrgBouncycastlePqcCryptoXmssBDS_initWithOrgBouncycastlePqcCryptoXmssXMSSParameters_withByteArray_withByteArray_withOrgBouncycastlePqcCryptoXmssOTSHashAddress_withInt_(OrgBouncycastlePqcCryptoXmssXMSSParameters *params, IOSByteArray *publicSeed, IOSByteArray *secretKeySeed, OrgBouncycastlePqcCryptoXmssOTSHashAddress *otsHashAddress, jint index);

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoXmssBDS_initWithOrgBouncycastlePqcCryptoXmssBDS_(OrgBouncycastlePqcCryptoXmssBDS *self, OrgBouncycastlePqcCryptoXmssBDS *last);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoXmssBDS *new_OrgBouncycastlePqcCryptoXmssBDS_initWithOrgBouncycastlePqcCryptoXmssBDS_(OrgBouncycastlePqcCryptoXmssBDS *last) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoXmssBDS *create_OrgBouncycastlePqcCryptoXmssBDS_initWithOrgBouncycastlePqcCryptoXmssBDS_(OrgBouncycastlePqcCryptoXmssBDS *last);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcCryptoXmssBDS)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoXmssBDS")
