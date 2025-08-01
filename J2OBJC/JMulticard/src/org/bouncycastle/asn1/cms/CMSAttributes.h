//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/cms/CMSAttributes.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleAsn1CmsCMSAttributes")
#ifdef RESTRICT_OrgBouncycastleAsn1CmsCMSAttributes
#define INCLUDE_ALL_OrgBouncycastleAsn1CmsCMSAttributes 0
#else
#define INCLUDE_ALL_OrgBouncycastleAsn1CmsCMSAttributes 1
#endif
#undef RESTRICT_OrgBouncycastleAsn1CmsCMSAttributes

#if !defined (OrgBouncycastleAsn1CmsCMSAttributes_) && (INCLUDE_ALL_OrgBouncycastleAsn1CmsCMSAttributes || defined(INCLUDE_OrgBouncycastleAsn1CmsCMSAttributes))
#define OrgBouncycastleAsn1CmsCMSAttributes_

@class OrgBouncycastleAsn1ASN1ObjectIdentifier;

/*!
 @brief <a href="https://tools.ietf.org/html/rfc5652">RFC 5652</a> CMS attribute OID constants, 
 <a href="https://tools.ietf.org/html/rfc6019">RFC 6019</a> Binary Time,
  and <a href="https://tools.ietf.org/html/rfc6211">RFC 6211</a> Algorithm Identifier Protection Attribute.
 @code

  contentType       ::= 1.2.840.113549.1.9.3
  messageDigest     ::= 1.2.840.113549.1.9.4
  signingTime       ::= 1.2.840.113549.1.9.5
  counterSignature  ::= 1.2.840.113549.1.9.6
  binarySigningTime ::= 1.2.840.113549.1.9.16.2.46
  contentHint       ::= 1.2.840.113549.1.9.16.2.4
  cmsAlgorithmProtect := 1.2.840.113549.1.9.52 
  
@endcode
 */
@protocol OrgBouncycastleAsn1CmsCMSAttributes < JavaObject >

@end

@interface OrgBouncycastleAsn1CmsCMSAttributes : NSObject

@end

J2OBJC_STATIC_INIT(OrgBouncycastleAsn1CmsCMSAttributes)

/*!
 @brief PKCS#9: 1.2.840.113549.1.9.3
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1CmsCMSAttributes_get_contentType(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1CmsCMSAttributes_contentType;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1CmsCMSAttributes, contentType, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief PKCS#9: 1.2.840.113549.1.9.4
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1CmsCMSAttributes_get_messageDigest(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1CmsCMSAttributes_messageDigest;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1CmsCMSAttributes, messageDigest, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief PKCS#9: 1.2.840.113549.1.9.5
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1CmsCMSAttributes_get_signingTime(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1CmsCMSAttributes_signingTime;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1CmsCMSAttributes, signingTime, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief PKCS#9: 1.2.840.113549.1.9.6
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1CmsCMSAttributes_get_counterSignature(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1CmsCMSAttributes_counterSignature;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1CmsCMSAttributes, counterSignature, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief PKCS#9: 1.2.840.113549.1.9.16.2.46
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1CmsCMSAttributes_get_binarySigningTime(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1CmsCMSAttributes_binarySigningTime;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1CmsCMSAttributes, binarySigningTime, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief PKCS#9: 1.2.840.113549.1.9.16.6.2.4 - See <a href="https://tools.ietf.org/html/rfc2634">RFC 2634</a>
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1CmsCMSAttributes_get_contentHint(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1CmsCMSAttributes_contentHint;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1CmsCMSAttributes, contentHint, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1CmsCMSAttributes_get_cmsAlgorithmProtect(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1CmsCMSAttributes_cmsAlgorithmProtect;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1CmsCMSAttributes, cmsAlgorithmProtect, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1CmsCMSAttributes)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleAsn1CmsCMSAttributes")
