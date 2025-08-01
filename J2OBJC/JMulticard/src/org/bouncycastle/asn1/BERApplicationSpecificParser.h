//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/BERApplicationSpecificParser.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleAsn1BERApplicationSpecificParser")
#ifdef RESTRICT_OrgBouncycastleAsn1BERApplicationSpecificParser
#define INCLUDE_ALL_OrgBouncycastleAsn1BERApplicationSpecificParser 0
#else
#define INCLUDE_ALL_OrgBouncycastleAsn1BERApplicationSpecificParser 1
#endif
#undef RESTRICT_OrgBouncycastleAsn1BERApplicationSpecificParser

#if !defined (OrgBouncycastleAsn1BERApplicationSpecificParser_) && (INCLUDE_ALL_OrgBouncycastleAsn1BERApplicationSpecificParser || defined(INCLUDE_OrgBouncycastleAsn1BERApplicationSpecificParser))
#define OrgBouncycastleAsn1BERApplicationSpecificParser_

#define RESTRICT_OrgBouncycastleAsn1BERTaggedObjectParser 1
#define INCLUDE_OrgBouncycastleAsn1BERTaggedObjectParser 1
#include "org/bouncycastle/asn1/BERTaggedObjectParser.h"

#define RESTRICT_OrgBouncycastleAsn1ASN1ApplicationSpecificParser 1
#define INCLUDE_OrgBouncycastleAsn1ASN1ApplicationSpecificParser 1
#include "org/bouncycastle/asn1/ASN1ApplicationSpecificParser.h"

@class OrgBouncycastleAsn1ASN1StreamParser;
@protocol OrgBouncycastleAsn1ASN1Encodable;

/*!
 @brief A parser for indefinite-length ASN.1 ApplicationSpecific objects.
 */
@interface OrgBouncycastleAsn1BERApplicationSpecificParser : OrgBouncycastleAsn1BERTaggedObjectParser < OrgBouncycastleAsn1ASN1ApplicationSpecificParser >

#pragma mark Public

/*!
 @brief Return the object contained in this application specific object,
 @return the contained object.
 @throw IOExceptionif the underlying stream cannot be read, or does not contain an ASN.1 encoding.
 */
- (id<OrgBouncycastleAsn1ASN1Encodable>)readObject;

#pragma mark Package-Private

- (instancetype)initWithInt:(jint)tagNo
withOrgBouncycastleAsn1ASN1StreamParser:(OrgBouncycastleAsn1ASN1StreamParser *)parser;

// Disallowed inherited constructors, do not use.

- (instancetype)initWithInt:(jint)arg0
                    withInt:(jint)arg1
withOrgBouncycastleAsn1ASN1StreamParser:(OrgBouncycastleAsn1ASN1StreamParser *)arg2 NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleAsn1BERApplicationSpecificParser)

FOUNDATION_EXPORT void OrgBouncycastleAsn1BERApplicationSpecificParser_initWithInt_withOrgBouncycastleAsn1ASN1StreamParser_(OrgBouncycastleAsn1BERApplicationSpecificParser *self, jint tagNo, OrgBouncycastleAsn1ASN1StreamParser *parser);

FOUNDATION_EXPORT OrgBouncycastleAsn1BERApplicationSpecificParser *new_OrgBouncycastleAsn1BERApplicationSpecificParser_initWithInt_withOrgBouncycastleAsn1ASN1StreamParser_(jint tagNo, OrgBouncycastleAsn1ASN1StreamParser *parser) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleAsn1BERApplicationSpecificParser *create_OrgBouncycastleAsn1BERApplicationSpecificParser_initWithInt_withOrgBouncycastleAsn1ASN1StreamParser_(jint tagNo, OrgBouncycastleAsn1ASN1StreamParser *parser);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1BERApplicationSpecificParser)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleAsn1BERApplicationSpecificParser")
