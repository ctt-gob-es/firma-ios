//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/lms/LMSSignature.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoLmsLMSSignature")
#ifdef RESTRICT_OrgBouncycastlePqcCryptoLmsLMSSignature
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoLmsLMSSignature 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoLmsLMSSignature 1
#endif
#undef RESTRICT_OrgBouncycastlePqcCryptoLmsLMSSignature

#if !defined (OrgBouncycastlePqcCryptoLmsLMSSignature_) && (INCLUDE_ALL_OrgBouncycastlePqcCryptoLmsLMSSignature || defined(INCLUDE_OrgBouncycastlePqcCryptoLmsLMSSignature))
#define OrgBouncycastlePqcCryptoLmsLMSSignature_

#define RESTRICT_OrgBouncycastleUtilEncodable 1
#define INCLUDE_OrgBouncycastleUtilEncodable 1
#include "org/bouncycastle/util/Encodable.h"

@class IOSByteArray;
@class IOSObjectArray;
@class OrgBouncycastlePqcCryptoLmsLMOtsSignature;
@class OrgBouncycastlePqcCryptoLmsLMSigParameters;

@interface OrgBouncycastlePqcCryptoLmsLMSSignature : NSObject < OrgBouncycastleUtilEncodable >

#pragma mark Public

- (instancetype)initPackagePrivateWithInt:(jint)q
withOrgBouncycastlePqcCryptoLmsLMOtsSignature:(OrgBouncycastlePqcCryptoLmsLMOtsSignature *)otsSignature
withOrgBouncycastlePqcCryptoLmsLMSigParameters:(OrgBouncycastlePqcCryptoLmsLMSigParameters *)parameter
                           withByteArray2:(IOSObjectArray *)y;

- (jboolean)isEqual:(id)o;

- (IOSByteArray *)getEncoded;

+ (OrgBouncycastlePqcCryptoLmsLMSSignature *)getInstanceWithId:(id)src;

- (OrgBouncycastlePqcCryptoLmsLMOtsSignature *)getOtsSignature;

- (OrgBouncycastlePqcCryptoLmsLMSigParameters *)getParameter;

- (jint)getQ;

- (IOSObjectArray *)getY;

- (NSUInteger)hash;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastlePqcCryptoLmsLMSSignature)

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoLmsLMSSignature_initPackagePrivateWithInt_withOrgBouncycastlePqcCryptoLmsLMOtsSignature_withOrgBouncycastlePqcCryptoLmsLMSigParameters_withByteArray2_(OrgBouncycastlePqcCryptoLmsLMSSignature *self, jint q, OrgBouncycastlePqcCryptoLmsLMOtsSignature *otsSignature, OrgBouncycastlePqcCryptoLmsLMSigParameters *parameter, IOSObjectArray *y);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoLmsLMSSignature *new_OrgBouncycastlePqcCryptoLmsLMSSignature_initPackagePrivateWithInt_withOrgBouncycastlePqcCryptoLmsLMOtsSignature_withOrgBouncycastlePqcCryptoLmsLMSigParameters_withByteArray2_(jint q, OrgBouncycastlePqcCryptoLmsLMOtsSignature *otsSignature, OrgBouncycastlePqcCryptoLmsLMSigParameters *parameter, IOSObjectArray *y) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoLmsLMSSignature *create_OrgBouncycastlePqcCryptoLmsLMSSignature_initPackagePrivateWithInt_withOrgBouncycastlePqcCryptoLmsLMOtsSignature_withOrgBouncycastlePqcCryptoLmsLMSigParameters_withByteArray2_(jint q, OrgBouncycastlePqcCryptoLmsLMOtsSignature *otsSignature, OrgBouncycastlePqcCryptoLmsLMSigParameters *parameter, IOSObjectArray *y);

FOUNDATION_EXPORT OrgBouncycastlePqcCryptoLmsLMSSignature *OrgBouncycastlePqcCryptoLmsLMSSignature_getInstanceWithId_(id src);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcCryptoLmsLMSSignature)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoLmsLMSSignature")
