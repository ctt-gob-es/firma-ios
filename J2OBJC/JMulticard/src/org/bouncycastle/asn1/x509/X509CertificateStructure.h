//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/x509/X509CertificateStructure.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleAsn1X509X509CertificateStructure")
#ifdef RESTRICT_OrgBouncycastleAsn1X509X509CertificateStructure
#define INCLUDE_ALL_OrgBouncycastleAsn1X509X509CertificateStructure 0
#else
#define INCLUDE_ALL_OrgBouncycastleAsn1X509X509CertificateStructure 1
#endif
#undef RESTRICT_OrgBouncycastleAsn1X509X509CertificateStructure

#if !defined (OrgBouncycastleAsn1X509X509CertificateStructure_) && (INCLUDE_ALL_OrgBouncycastleAsn1X509X509CertificateStructure || defined(INCLUDE_OrgBouncycastleAsn1X509X509CertificateStructure))
#define OrgBouncycastleAsn1X509X509CertificateStructure_

#define RESTRICT_OrgBouncycastleAsn1ASN1Object 1
#define INCLUDE_OrgBouncycastleAsn1ASN1Object 1
#include "org/bouncycastle/asn1/ASN1Object.h"

#define RESTRICT_OrgBouncycastleAsn1X509X509ObjectIdentifiers 1
#define INCLUDE_OrgBouncycastleAsn1X509X509ObjectIdentifiers 1
#include "org/bouncycastle/asn1/x509/X509ObjectIdentifiers.h"

#define RESTRICT_OrgBouncycastleAsn1PkcsPKCSObjectIdentifiers 1
#define INCLUDE_OrgBouncycastleAsn1PkcsPKCSObjectIdentifiers 1
#include "org/bouncycastle/asn1/pkcs/PKCSObjectIdentifiers.h"

@class OrgBouncycastleAsn1ASN1BitString;
@class OrgBouncycastleAsn1ASN1Integer;
@class OrgBouncycastleAsn1ASN1Primitive;
@class OrgBouncycastleAsn1ASN1Sequence;
@class OrgBouncycastleAsn1ASN1TaggedObject;
@class OrgBouncycastleAsn1X500X500Name;
@class OrgBouncycastleAsn1X509AlgorithmIdentifier;
@class OrgBouncycastleAsn1X509SubjectPublicKeyInfo;
@class OrgBouncycastleAsn1X509TBSCertificateStructure;
@class OrgBouncycastleAsn1X509Time;

/*!
 @brief an X509Certificate structure.
 @code

   Certificate ::= SEQUENCE {
       tbsCertificate          TBSCertificate,
       signatureAlgorithm      AlgorithmIdentifier,
       signature               BIT STRING
   } 
  
@endcode
 */
@interface OrgBouncycastleAsn1X509X509CertificateStructure : OrgBouncycastleAsn1ASN1Object < OrgBouncycastleAsn1X509X509ObjectIdentifiers, OrgBouncycastleAsn1PkcsPKCSObjectIdentifiers > {
 @public
  OrgBouncycastleAsn1ASN1Sequence *seq_;
  OrgBouncycastleAsn1X509TBSCertificateStructure *tbsCert_;
  OrgBouncycastleAsn1X509AlgorithmIdentifier *sigAlgId_;
  OrgBouncycastleAsn1ASN1BitString *sig_;
}

#pragma mark Public

- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq;

- (OrgBouncycastleAsn1X509Time *)getEndDate;

+ (OrgBouncycastleAsn1X509X509CertificateStructure *)getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject:(OrgBouncycastleAsn1ASN1TaggedObject *)obj
                                                                                            withBoolean:(jboolean)explicit_;

+ (OrgBouncycastleAsn1X509X509CertificateStructure *)getInstanceWithId:(id)obj;

- (OrgBouncycastleAsn1X500X500Name *)getIssuer;

- (OrgBouncycastleAsn1ASN1Integer *)getSerialNumber;

- (OrgBouncycastleAsn1ASN1BitString *)getSignature;

- (OrgBouncycastleAsn1X509AlgorithmIdentifier *)getSignatureAlgorithm;

- (OrgBouncycastleAsn1X509Time *)getStartDate;

- (OrgBouncycastleAsn1X500X500Name *)getSubject;

- (OrgBouncycastleAsn1X509SubjectPublicKeyInfo *)getSubjectPublicKeyInfo;

- (OrgBouncycastleAsn1X509TBSCertificateStructure *)getTBSCertificate;

- (jint)getVersion;

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleAsn1X509X509CertificateStructure)

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1X509X509CertificateStructure, seq_, OrgBouncycastleAsn1ASN1Sequence *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1X509X509CertificateStructure, tbsCert_, OrgBouncycastleAsn1X509TBSCertificateStructure *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1X509X509CertificateStructure, sigAlgId_, OrgBouncycastleAsn1X509AlgorithmIdentifier *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1X509X509CertificateStructure, sig_, OrgBouncycastleAsn1ASN1BitString *)

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509CertificateStructure *OrgBouncycastleAsn1X509X509CertificateStructure_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(OrgBouncycastleAsn1ASN1TaggedObject *obj, jboolean explicit_);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509CertificateStructure *OrgBouncycastleAsn1X509X509CertificateStructure_getInstanceWithId_(id obj);

FOUNDATION_EXPORT void OrgBouncycastleAsn1X509X509CertificateStructure_initWithOrgBouncycastleAsn1ASN1Sequence_(OrgBouncycastleAsn1X509X509CertificateStructure *self, OrgBouncycastleAsn1ASN1Sequence *seq);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509CertificateStructure *new_OrgBouncycastleAsn1X509X509CertificateStructure_initWithOrgBouncycastleAsn1ASN1Sequence_(OrgBouncycastleAsn1ASN1Sequence *seq) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509CertificateStructure *create_OrgBouncycastleAsn1X509X509CertificateStructure_initWithOrgBouncycastleAsn1ASN1Sequence_(OrgBouncycastleAsn1ASN1Sequence *seq);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1X509X509CertificateStructure)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleAsn1X509X509CertificateStructure")
