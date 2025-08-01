//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/x509/X509Name.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleAsn1X509X509Name")
#ifdef RESTRICT_OrgBouncycastleAsn1X509X509Name
#define INCLUDE_ALL_OrgBouncycastleAsn1X509X509Name 0
#else
#define INCLUDE_ALL_OrgBouncycastleAsn1X509X509Name 1
#endif
#undef RESTRICT_OrgBouncycastleAsn1X509X509Name

#if !defined (OrgBouncycastleAsn1X509X509Name_) && (INCLUDE_ALL_OrgBouncycastleAsn1X509X509Name || defined(INCLUDE_OrgBouncycastleAsn1X509X509Name))
#define OrgBouncycastleAsn1X509X509Name_

#define RESTRICT_OrgBouncycastleAsn1ASN1Object 1
#define INCLUDE_OrgBouncycastleAsn1ASN1Object 1
#include "org/bouncycastle/asn1/ASN1Object.h"

@class JavaUtilHashtable;
@class JavaUtilVector;
@class OrgBouncycastleAsn1ASN1ObjectIdentifier;
@class OrgBouncycastleAsn1ASN1Primitive;
@class OrgBouncycastleAsn1ASN1Sequence;
@class OrgBouncycastleAsn1ASN1TaggedObject;
@class OrgBouncycastleAsn1X509X509NameEntryConverter;

/*!
 @brief @code

      RDNSequence ::= SEQUENCE OF RelativeDistinguishedName
      RelativeDistinguishedName ::= SET SIZE (1..MAX) OF AttributeTypeAndValue
      AttributeTypeAndValue ::= SEQUENCE {
                                    type  OBJECT IDENTIFIER,
                                    value ANY }
  
@endcode
 */
@interface OrgBouncycastleAsn1X509X509Name : OrgBouncycastleAsn1ASN1Object

#pragma mark Public

/*!
 @brief Constructor from ASN1Sequence
  the principal will be a list of constructed sets, each containing an (OID, String) pair.
 */
- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq;

/*!
 @brief Takes an X509 dir name as a string of the format "C=AU, ST=Victoria", or
  some such, converting it into an ordered set of name attributes.lookUp
  should provide a table of lookups, indexed by lowercase only strings and
  yielding a ASN1ObjectIdentifier, other than that OID. and numeric oids
  will be processed automatically.
 <br>
  If reverse is true, create the encoded version of the sequence
  starting from the last element in the string.
 @param reverse true if we should start scanning from the end (RFC 2553).
 @param lookUp table of names and their oids.
 @param dirName the X.500 string to be parsed.
 */
- (instancetype)initWithBoolean:(jboolean)reverse
          withJavaUtilHashtable:(JavaUtilHashtable *)lookUp
                   withNSString:(NSString *)dirName;

/*!
 @brief Takes an X509 dir name as a string of the format "C=AU, ST=Victoria", or
  some such, converting it into an ordered set of name attributes.lookUp
  should provide a table of lookups, indexed by lowercase only strings and
  yielding a ASN1ObjectIdentifier, other than that OID. and numeric oids
  will be processed automatically.
 The passed in converter is used to convert the
  string values to the right of each equals sign to their ASN.1 counterparts. 
 <br>
 @param reverse true if we should start scanning from the end, false otherwise.
 @param lookUp table of names and oids.
 @param dirName the string dirName
 @param converter the converter to convert string values into their ASN.1 equivalents
 */
- (instancetype)initWithBoolean:(jboolean)reverse
          withJavaUtilHashtable:(JavaUtilHashtable *)lookUp
                   withNSString:(NSString *)dirName
withOrgBouncycastleAsn1X509X509NameEntryConverter:(OrgBouncycastleAsn1X509X509NameEntryConverter *)converter;

/*!
 @brief Takes an X509 dir name as a string of the format "C=AU, ST=Victoria", or
  some such, converting it into an ordered set of name attributes.If reverse
  is true, create the encoded version of the sequence starting from the
  last element in the string.
 */
- (instancetype)initWithBoolean:(jboolean)reverse
                   withNSString:(NSString *)dirName;

/*!
 @brief Takes an X509 dir name as a string of the format "C=AU, ST=Victoria", or
  some such, converting it into an ordered set of name attributes with each
  string value being converted to its associated ASN.1 type using the passed
  in converter.If reverse is true the ASN.1 sequence representing the DN will
  be built by starting at the end of the string, rather than the start.
 */
- (instancetype)initWithBoolean:(jboolean)reverse
                   withNSString:(NSString *)dirName
withOrgBouncycastleAsn1X509X509NameEntryConverter:(OrgBouncycastleAsn1X509X509NameEntryConverter *)converter;

/*!
 @brief constructor from a table of attributes.
 <p>
  it's is assumed the table contains OID/String pairs, and the contents
  of the table are copied into an internal table as part of the
  construction process. 
 <p>
  <b>Note:</b> if the name you are trying to generate should be
  following a specific ordering, you should use the constructor
  with the ordering specified below.
 */
- (instancetype)initWithJavaUtilHashtable:(JavaUtilHashtable *)attributes;

/*!
 @brief Takes an X509 dir name as a string of the format "C=AU, ST=Victoria", or
  some such, converting it into an ordered set of name attributes.
 */
- (instancetype)initWithNSString:(NSString *)dirName;

/*!
 @brief Takes an X509 dir name as a string of the format "C=AU, ST=Victoria", or
  some such, converting it into an ordered set of name attributes with each
  string value being converted to its associated ASN.1 type using the passed
  in converter.
 */
- (instancetype)initWithNSString:(NSString *)dirName
withOrgBouncycastleAsn1X509X509NameEntryConverter:(OrgBouncycastleAsn1X509X509NameEntryConverter *)converter;

/*!
 @brief Constructor from a table of attributes with ordering.
 <p>
  it's is assumed the table contains OID/String pairs, and the contents
  of the table are copied into an internal table as part of the
  construction process. The ordering vector should contain the OIDs
  in the order they are meant to be encoded or printed in toString.
 */
- (instancetype)initWithJavaUtilVector:(JavaUtilVector *)ordering
                 withJavaUtilHashtable:(JavaUtilHashtable *)attributes;

/*!
 @brief Constructor from a table of attributes with ordering.
 <p>
  it's is assumed the table contains OID/String pairs, and the contents
  of the table are copied into an internal table as part of the
  construction process. The ordering vector should contain the OIDs
  in the order they are meant to be encoded or printed in toString. 
 <p>
  The passed in converter will be used to convert the strings into their
  ASN.1 counterparts.
 */
- (instancetype)initWithJavaUtilVector:(JavaUtilVector *)ordering
                 withJavaUtilHashtable:(JavaUtilHashtable *)attributes
withOrgBouncycastleAsn1X509X509NameEntryConverter:(OrgBouncycastleAsn1X509X509NameEntryConverter *)converter;

/*!
 @brief Takes two vectors one of the oids and the other of the values.
 */
- (instancetype)initWithJavaUtilVector:(JavaUtilVector *)oids
                    withJavaUtilVector:(JavaUtilVector *)values;

/*!
 @brief Takes two vectors one of the oids and the other of the values.
 <p>
  The passed in converter will be used to convert the strings into their
  ASN.1 counterparts.
 */
- (instancetype)initWithJavaUtilVector:(JavaUtilVector *)oids
                    withJavaUtilVector:(JavaUtilVector *)values
withOrgBouncycastleAsn1X509X509NameEntryConverter:(OrgBouncycastleAsn1X509X509NameEntryConverter *)converter;

/*!
 @brief test for equality - note: case is ignored.
 */
- (jboolean)isEqual:(id)obj;

/*!
 @param inOrder if true the order of both X509 names must be the same,  as well as the values associated with each element.
 */
- (jboolean)equalsWithId:(id)obj
             withBoolean:(jboolean)inOrder;

/*!
 @brief Return a X509Name based on the passed in tagged object.
 @param obj tag object holding name.
 @param explicit_ true if explicitly tagged false otherwise.
 @return the X509Name
 */
+ (OrgBouncycastleAsn1X509X509Name *)getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject:(OrgBouncycastleAsn1ASN1TaggedObject *)obj
                                                                            withBoolean:(jboolean)explicit_;

+ (OrgBouncycastleAsn1X509X509Name *)getInstanceWithId:(id)obj;

/*!
 @brief return a vector of the oids in the name, in the order they were found.
 */
- (JavaUtilVector *)getOIDs;

/*!
 @brief return a vector of the values found in the name, in the order they
  were found.
 */
- (JavaUtilVector *)getValues;

/*!
 @brief return a vector of the values found in the name, in the order they
  were found, with the DN label corresponding to passed in oid.
 */
- (JavaUtilVector *)getValuesWithOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)oid;

- (NSUInteger)hash;

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive;

- (NSString *)description;

/*!
 @brief convert the structure to a string - if reverse is true the
  oids and values are listed out starting with the last element
  in the sequence (ala RFC 2253), otherwise the string will begin
  with the first element of the structure.If no string definition
  for the oid is found in oidSymbols the string value of the oid is
  added.
 Two standard symbol tables are provided DefaultSymbols, and
  RFC2253Symbols as part of this class.
 @param reverse if true start at the end of the sequence and work back.
 @param oidSymbols look up table strings for oids.
 */
- (NSString *)toStringWithBoolean:(jboolean)reverse
            withJavaUtilHashtable:(JavaUtilHashtable *)oidSymbols;

#pragma mark Protected

- (instancetype)init;

@end

J2OBJC_STATIC_INIT(OrgBouncycastleAsn1X509X509Name)

/*!
 @brief country code - StringType(SIZE(2))
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_C(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_C;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, C, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief organization - StringType(SIZE(1..64))
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_O(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_O;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, O, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief organizational unit name - StringType(SIZE(1..64))
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_OU(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_OU;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, OU, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief Title
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_T(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_T;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, T, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief common name - StringType(SIZE(1..64))
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_CN(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_CN;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, CN, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief device serial number name - StringType(SIZE(1..64))
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_SN(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_SN;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, SN, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief street - StringType(SIZE(1..64))
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_STREET(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_STREET;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, STREET, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief device serial number name - StringType(SIZE(1..64))
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_SERIALNUMBER(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_SERIALNUMBER;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, SERIALNUMBER, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief locality name - StringType(SIZE(1..64))
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_L(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_L;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, L, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief state, or province name - StringType(SIZE(1..64))
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_ST(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_ST;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, ST, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief Naming attributes of type X520name
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_SURNAME(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_SURNAME;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, SURNAME, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_GIVENNAME(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_GIVENNAME;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, GIVENNAME, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_INITIALS(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_INITIALS;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, INITIALS, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_GENERATION(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_GENERATION;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, GENERATION, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_UNIQUE_IDENTIFIER(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_UNIQUE_IDENTIFIER;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, UNIQUE_IDENTIFIER, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief businessCategory - DirectoryString(SIZE(1..128)
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_BUSINESS_CATEGORY(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_BUSINESS_CATEGORY;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, BUSINESS_CATEGORY, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief postalCode - DirectoryString(SIZE(1..40)
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_POSTAL_CODE(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_POSTAL_CODE;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, POSTAL_CODE, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief dnQualifier - DirectoryString(SIZE(1..64)
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_DN_QUALIFIER(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_DN_QUALIFIER;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, DN_QUALIFIER, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief RFC 3039 Pseudonym - DirectoryString(SIZE(1..64)
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_PSEUDONYM(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_PSEUDONYM;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, PSEUDONYM, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief RFC 3039 DateOfBirth - GeneralizedTime - YYYYMMDD000000Z
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_DATE_OF_BIRTH(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_DATE_OF_BIRTH;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, DATE_OF_BIRTH, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief RFC 3039 PlaceOfBirth - DirectoryString(SIZE(1..128)
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_PLACE_OF_BIRTH(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_PLACE_OF_BIRTH;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, PLACE_OF_BIRTH, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief RFC 3039 Gender - PrintableString (SIZE(1)) -- "M", "F", "m" or "f"
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_GENDER(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_GENDER;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, GENDER, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief RFC 3039 CountryOfCitizenship - PrintableString (SIZE (2)) -- ISO 3166
  codes only
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_COUNTRY_OF_CITIZENSHIP(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_COUNTRY_OF_CITIZENSHIP;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, COUNTRY_OF_CITIZENSHIP, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief RFC 3039 CountryOfResidence - PrintableString (SIZE (2)) -- ISO 3166
  codes only
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_COUNTRY_OF_RESIDENCE(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_COUNTRY_OF_RESIDENCE;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, COUNTRY_OF_RESIDENCE, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief ISIS-MTT NameAtBirth - DirectoryString(SIZE(1..64)
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_NAME_AT_BIRTH(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_NAME_AT_BIRTH;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, NAME_AT_BIRTH, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief RFC 3039 PostalAddress - SEQUENCE SIZE (1..6) OF
  DirectoryString(SIZE(1..30))
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_POSTAL_ADDRESS(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_POSTAL_ADDRESS;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, POSTAL_ADDRESS, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief RFC 2256 dmdName
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_DMD_NAME(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_DMD_NAME;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, DMD_NAME, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief id-at-telephoneNumber
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_TELEPHONE_NUMBER(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_TELEPHONE_NUMBER;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, TELEPHONE_NUMBER, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief id-at-name
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_NAME(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_NAME;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, NAME, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief Email address (RSA PKCS#9 extension) - IA5String.
 <p>Note: if you're trying to be ultra orthodox, don't use this! It shouldn't be in here.
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_EmailAddress(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_EmailAddress;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, EmailAddress, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief more from PKCS#9
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_UnstructuredName(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_UnstructuredName;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, UnstructuredName, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_UnstructuredAddress(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_UnstructuredAddress;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, UnstructuredAddress, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief email address in Verisign certificates
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_E(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_E;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, E, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_DC(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_DC;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, DC, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief LDAP User id.
 */
inline OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_get_UID(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1X509X509Name_UID;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, UID, OrgBouncycastleAsn1ASN1ObjectIdentifier *)

/*!
 @brief determines whether or not strings should be processed and printed
  from back to front.
 */
inline jboolean OrgBouncycastleAsn1X509X509Name_get_DefaultReverse(void);
inline jboolean OrgBouncycastleAsn1X509X509Name_set_DefaultReverse(jboolean value);
inline jboolean *OrgBouncycastleAsn1X509X509Name_getRef_DefaultReverse(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT jboolean OrgBouncycastleAsn1X509X509Name_DefaultReverse;
J2OBJC_STATIC_FIELD_PRIMITIVE(OrgBouncycastleAsn1X509X509Name, DefaultReverse, jboolean)

/*!
 @brief default look up table translating OID values into their common symbols following
  the convention in RFC 2253 with a few extras
 */
inline JavaUtilHashtable *OrgBouncycastleAsn1X509X509Name_get_DefaultSymbols(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT JavaUtilHashtable *OrgBouncycastleAsn1X509X509Name_DefaultSymbols;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, DefaultSymbols, JavaUtilHashtable *)

/*!
 @brief look up table translating OID values into their common symbols following the convention in RFC 2253
 */
inline JavaUtilHashtable *OrgBouncycastleAsn1X509X509Name_get_RFC2253Symbols(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT JavaUtilHashtable *OrgBouncycastleAsn1X509X509Name_RFC2253Symbols;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, RFC2253Symbols, JavaUtilHashtable *)

/*!
 @brief look up table translating OID values into their common symbols following the convention in RFC 1779
 */
inline JavaUtilHashtable *OrgBouncycastleAsn1X509X509Name_get_RFC1779Symbols(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT JavaUtilHashtable *OrgBouncycastleAsn1X509X509Name_RFC1779Symbols;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, RFC1779Symbols, JavaUtilHashtable *)

/*!
 @brief look up table translating common symbols into their OIDS.
 */
inline JavaUtilHashtable *OrgBouncycastleAsn1X509X509Name_get_DefaultLookUp(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT JavaUtilHashtable *OrgBouncycastleAsn1X509X509Name_DefaultLookUp;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, DefaultLookUp, JavaUtilHashtable *)

/*!
 @brief look up table translating OID values into their common symbols
 */
inline JavaUtilHashtable *OrgBouncycastleAsn1X509X509Name_get_OIDLookUp(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT JavaUtilHashtable *OrgBouncycastleAsn1X509X509Name_OIDLookUp;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, OIDLookUp, JavaUtilHashtable *)

/*!
 @brief look up table translating string values into their OIDS -
 */
inline JavaUtilHashtable *OrgBouncycastleAsn1X509X509Name_get_SymbolLookUp(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT JavaUtilHashtable *OrgBouncycastleAsn1X509X509Name_SymbolLookUp;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1X509X509Name, SymbolLookUp, JavaUtilHashtable *)

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *OrgBouncycastleAsn1X509X509Name_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(OrgBouncycastleAsn1ASN1TaggedObject *obj, jboolean explicit_);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *OrgBouncycastleAsn1X509X509Name_getInstanceWithId_(id obj);

FOUNDATION_EXPORT void OrgBouncycastleAsn1X509X509Name_init(OrgBouncycastleAsn1X509X509Name *self);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *new_OrgBouncycastleAsn1X509X509Name_init(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *create_OrgBouncycastleAsn1X509X509Name_init(void);

FOUNDATION_EXPORT void OrgBouncycastleAsn1X509X509Name_initWithOrgBouncycastleAsn1ASN1Sequence_(OrgBouncycastleAsn1X509X509Name *self, OrgBouncycastleAsn1ASN1Sequence *seq);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *new_OrgBouncycastleAsn1X509X509Name_initWithOrgBouncycastleAsn1ASN1Sequence_(OrgBouncycastleAsn1ASN1Sequence *seq) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *create_OrgBouncycastleAsn1X509X509Name_initWithOrgBouncycastleAsn1ASN1Sequence_(OrgBouncycastleAsn1ASN1Sequence *seq);

FOUNDATION_EXPORT void OrgBouncycastleAsn1X509X509Name_initWithJavaUtilHashtable_(OrgBouncycastleAsn1X509X509Name *self, JavaUtilHashtable *attributes);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *new_OrgBouncycastleAsn1X509X509Name_initWithJavaUtilHashtable_(JavaUtilHashtable *attributes) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *create_OrgBouncycastleAsn1X509X509Name_initWithJavaUtilHashtable_(JavaUtilHashtable *attributes);

FOUNDATION_EXPORT void OrgBouncycastleAsn1X509X509Name_initWithJavaUtilVector_withJavaUtilHashtable_(OrgBouncycastleAsn1X509X509Name *self, JavaUtilVector *ordering, JavaUtilHashtable *attributes);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *new_OrgBouncycastleAsn1X509X509Name_initWithJavaUtilVector_withJavaUtilHashtable_(JavaUtilVector *ordering, JavaUtilHashtable *attributes) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *create_OrgBouncycastleAsn1X509X509Name_initWithJavaUtilVector_withJavaUtilHashtable_(JavaUtilVector *ordering, JavaUtilHashtable *attributes);

FOUNDATION_EXPORT void OrgBouncycastleAsn1X509X509Name_initWithJavaUtilVector_withJavaUtilHashtable_withOrgBouncycastleAsn1X509X509NameEntryConverter_(OrgBouncycastleAsn1X509X509Name *self, JavaUtilVector *ordering, JavaUtilHashtable *attributes, OrgBouncycastleAsn1X509X509NameEntryConverter *converter);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *new_OrgBouncycastleAsn1X509X509Name_initWithJavaUtilVector_withJavaUtilHashtable_withOrgBouncycastleAsn1X509X509NameEntryConverter_(JavaUtilVector *ordering, JavaUtilHashtable *attributes, OrgBouncycastleAsn1X509X509NameEntryConverter *converter) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *create_OrgBouncycastleAsn1X509X509Name_initWithJavaUtilVector_withJavaUtilHashtable_withOrgBouncycastleAsn1X509X509NameEntryConverter_(JavaUtilVector *ordering, JavaUtilHashtable *attributes, OrgBouncycastleAsn1X509X509NameEntryConverter *converter);

FOUNDATION_EXPORT void OrgBouncycastleAsn1X509X509Name_initWithJavaUtilVector_withJavaUtilVector_(OrgBouncycastleAsn1X509X509Name *self, JavaUtilVector *oids, JavaUtilVector *values);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *new_OrgBouncycastleAsn1X509X509Name_initWithJavaUtilVector_withJavaUtilVector_(JavaUtilVector *oids, JavaUtilVector *values) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *create_OrgBouncycastleAsn1X509X509Name_initWithJavaUtilVector_withJavaUtilVector_(JavaUtilVector *oids, JavaUtilVector *values);

FOUNDATION_EXPORT void OrgBouncycastleAsn1X509X509Name_initWithJavaUtilVector_withJavaUtilVector_withOrgBouncycastleAsn1X509X509NameEntryConverter_(OrgBouncycastleAsn1X509X509Name *self, JavaUtilVector *oids, JavaUtilVector *values, OrgBouncycastleAsn1X509X509NameEntryConverter *converter);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *new_OrgBouncycastleAsn1X509X509Name_initWithJavaUtilVector_withJavaUtilVector_withOrgBouncycastleAsn1X509X509NameEntryConverter_(JavaUtilVector *oids, JavaUtilVector *values, OrgBouncycastleAsn1X509X509NameEntryConverter *converter) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *create_OrgBouncycastleAsn1X509X509Name_initWithJavaUtilVector_withJavaUtilVector_withOrgBouncycastleAsn1X509X509NameEntryConverter_(JavaUtilVector *oids, JavaUtilVector *values, OrgBouncycastleAsn1X509X509NameEntryConverter *converter);

FOUNDATION_EXPORT void OrgBouncycastleAsn1X509X509Name_initWithNSString_(OrgBouncycastleAsn1X509X509Name *self, NSString *dirName);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *new_OrgBouncycastleAsn1X509X509Name_initWithNSString_(NSString *dirName) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *create_OrgBouncycastleAsn1X509X509Name_initWithNSString_(NSString *dirName);

FOUNDATION_EXPORT void OrgBouncycastleAsn1X509X509Name_initWithNSString_withOrgBouncycastleAsn1X509X509NameEntryConverter_(OrgBouncycastleAsn1X509X509Name *self, NSString *dirName, OrgBouncycastleAsn1X509X509NameEntryConverter *converter);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *new_OrgBouncycastleAsn1X509X509Name_initWithNSString_withOrgBouncycastleAsn1X509X509NameEntryConverter_(NSString *dirName, OrgBouncycastleAsn1X509X509NameEntryConverter *converter) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *create_OrgBouncycastleAsn1X509X509Name_initWithNSString_withOrgBouncycastleAsn1X509X509NameEntryConverter_(NSString *dirName, OrgBouncycastleAsn1X509X509NameEntryConverter *converter);

FOUNDATION_EXPORT void OrgBouncycastleAsn1X509X509Name_initWithBoolean_withNSString_(OrgBouncycastleAsn1X509X509Name *self, jboolean reverse, NSString *dirName);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *new_OrgBouncycastleAsn1X509X509Name_initWithBoolean_withNSString_(jboolean reverse, NSString *dirName) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *create_OrgBouncycastleAsn1X509X509Name_initWithBoolean_withNSString_(jboolean reverse, NSString *dirName);

FOUNDATION_EXPORT void OrgBouncycastleAsn1X509X509Name_initWithBoolean_withNSString_withOrgBouncycastleAsn1X509X509NameEntryConverter_(OrgBouncycastleAsn1X509X509Name *self, jboolean reverse, NSString *dirName, OrgBouncycastleAsn1X509X509NameEntryConverter *converter);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *new_OrgBouncycastleAsn1X509X509Name_initWithBoolean_withNSString_withOrgBouncycastleAsn1X509X509NameEntryConverter_(jboolean reverse, NSString *dirName, OrgBouncycastleAsn1X509X509NameEntryConverter *converter) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *create_OrgBouncycastleAsn1X509X509Name_initWithBoolean_withNSString_withOrgBouncycastleAsn1X509X509NameEntryConverter_(jboolean reverse, NSString *dirName, OrgBouncycastleAsn1X509X509NameEntryConverter *converter);

FOUNDATION_EXPORT void OrgBouncycastleAsn1X509X509Name_initWithBoolean_withJavaUtilHashtable_withNSString_(OrgBouncycastleAsn1X509X509Name *self, jboolean reverse, JavaUtilHashtable *lookUp, NSString *dirName);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *new_OrgBouncycastleAsn1X509X509Name_initWithBoolean_withJavaUtilHashtable_withNSString_(jboolean reverse, JavaUtilHashtable *lookUp, NSString *dirName) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *create_OrgBouncycastleAsn1X509X509Name_initWithBoolean_withJavaUtilHashtable_withNSString_(jboolean reverse, JavaUtilHashtable *lookUp, NSString *dirName);

FOUNDATION_EXPORT void OrgBouncycastleAsn1X509X509Name_initWithBoolean_withJavaUtilHashtable_withNSString_withOrgBouncycastleAsn1X509X509NameEntryConverter_(OrgBouncycastleAsn1X509X509Name *self, jboolean reverse, JavaUtilHashtable *lookUp, NSString *dirName, OrgBouncycastleAsn1X509X509NameEntryConverter *converter);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *new_OrgBouncycastleAsn1X509X509Name_initWithBoolean_withJavaUtilHashtable_withNSString_withOrgBouncycastleAsn1X509X509NameEntryConverter_(jboolean reverse, JavaUtilHashtable *lookUp, NSString *dirName, OrgBouncycastleAsn1X509X509NameEntryConverter *converter) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleAsn1X509X509Name *create_OrgBouncycastleAsn1X509X509Name_initWithBoolean_withJavaUtilHashtable_withNSString_withOrgBouncycastleAsn1X509X509NameEntryConverter_(jboolean reverse, JavaUtilHashtable *lookUp, NSString *dirName, OrgBouncycastleAsn1X509X509NameEntryConverter *converter);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1X509X509Name)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleAsn1X509X509Name")
