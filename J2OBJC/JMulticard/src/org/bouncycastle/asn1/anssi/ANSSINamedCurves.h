//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/anssi/ANSSINamedCurves.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleAsn1AnssiANSSINamedCurves")
#ifdef RESTRICT_OrgBouncycastleAsn1AnssiANSSINamedCurves
#define INCLUDE_ALL_OrgBouncycastleAsn1AnssiANSSINamedCurves 0
#else
#define INCLUDE_ALL_OrgBouncycastleAsn1AnssiANSSINamedCurves 1
#endif
#undef RESTRICT_OrgBouncycastleAsn1AnssiANSSINamedCurves

#if !defined (OrgBouncycastleAsn1AnssiANSSINamedCurves_) && (INCLUDE_ALL_OrgBouncycastleAsn1AnssiANSSINamedCurves || defined(INCLUDE_OrgBouncycastleAsn1AnssiANSSINamedCurves))
#define OrgBouncycastleAsn1AnssiANSSINamedCurves_

@class JavaMathBigInteger;
@class JavaUtilHashtable;
@class OrgBouncycastleAsn1ASN1ObjectIdentifier;
@class OrgBouncycastleAsn1X9X9ECParameters;
@class OrgBouncycastleAsn1X9X9ECParametersHolder;
@class OrgBouncycastleAsn1X9X9ECPoint;
@class OrgBouncycastleMathEcECCurve;
@protocol JavaUtilEnumeration;

/*!
 @brief ANSSI Elliptic curve table.
 */
@interface OrgBouncycastleAsn1AnssiANSSINamedCurves : NSObject

#pragma mark Public

- (instancetype)init;

+ (OrgBouncycastleAsn1X9X9ECParameters *)getByNameWithNSString:(NSString *)name;

+ (OrgBouncycastleAsn1X9X9ECParametersHolder *)getByNameLazyWithNSString:(NSString *)name;

/*!
 @brief return the X9ECParameters object for the named curve represented by
  the passed in object identifier.Null if the curve isn't present.
 @param oid an object identifier representing a named curve, if present.
 */
+ (OrgBouncycastleAsn1X9X9ECParameters *)getByOIDWithOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)oid;

+ (OrgBouncycastleAsn1X9X9ECParametersHolder *)getByOIDLazyWithOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)oid;

/*!
 @brief return the named curve name represented by the given object identifier.
 */
+ (NSString *)getNameWithOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)oid;

/*!
 @brief returns an enumeration containing the name strings for curves
  contained in this structure.
 */
+ (id<JavaUtilEnumeration>)getNames;

/*!
 @brief return the object identifier signified by the passed in name.Null
  if there is no object identifier associated with name.
 @return the object identifier associated with name, if present.
 */
+ (OrgBouncycastleAsn1ASN1ObjectIdentifier *)getOIDWithNSString:(NSString *)name;

#pragma mark Package-Private

+ (OrgBouncycastleAsn1X9X9ECPoint *)configureBasepointWithOrgBouncycastleMathEcECCurve:(OrgBouncycastleMathEcECCurve *)curve
                                                                          withNSString:(NSString *)encoding;

+ (OrgBouncycastleMathEcECCurve *)configureCurveWithOrgBouncycastleMathEcECCurve:(OrgBouncycastleMathEcECCurve *)curve;

+ (void)defineCurveWithNSString:(NSString *)name
withOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)oid
withOrgBouncycastleAsn1X9X9ECParametersHolder:(OrgBouncycastleAsn1X9X9ECParametersHolder *)holder;

+ (JavaMathBigInteger *)fromHexWithNSString:(NSString *)hex;

@end

J2OBJC_STATIC_INIT(OrgBouncycastleAsn1AnssiANSSINamedCurves)

inline OrgBouncycastleAsn1X9X9ECParametersHolder *OrgBouncycastleAsn1AnssiANSSINamedCurves_get_FRP256v1(void);
inline OrgBouncycastleAsn1X9X9ECParametersHolder *OrgBouncycastleAsn1AnssiANSSINamedCurves_set_FRP256v1(OrgBouncycastleAsn1X9X9ECParametersHolder *value);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT OrgBouncycastleAsn1X9X9ECParametersHolder *OrgBouncycastleAsn1AnssiANSSINamedCurves_FRP256v1;
J2OBJC_STATIC_FIELD_OBJ(OrgBouncycastleAsn1AnssiANSSINamedCurves, FRP256v1, OrgBouncycastleAsn1X9X9ECParametersHolder *)

inline JavaUtilHashtable *OrgBouncycastleAsn1AnssiANSSINamedCurves_get_objIds(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT JavaUtilHashtable *OrgBouncycastleAsn1AnssiANSSINamedCurves_objIds;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1AnssiANSSINamedCurves, objIds, JavaUtilHashtable *)

inline JavaUtilHashtable *OrgBouncycastleAsn1AnssiANSSINamedCurves_get_curves(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT JavaUtilHashtable *OrgBouncycastleAsn1AnssiANSSINamedCurves_curves;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1AnssiANSSINamedCurves, curves, JavaUtilHashtable *)

inline JavaUtilHashtable *OrgBouncycastleAsn1AnssiANSSINamedCurves_get_names(void);
/*! INTERNAL ONLY - Use accessor function from above. */
FOUNDATION_EXPORT JavaUtilHashtable *OrgBouncycastleAsn1AnssiANSSINamedCurves_names;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleAsn1AnssiANSSINamedCurves, names, JavaUtilHashtable *)

FOUNDATION_EXPORT void OrgBouncycastleAsn1AnssiANSSINamedCurves_init(OrgBouncycastleAsn1AnssiANSSINamedCurves *self);

FOUNDATION_EXPORT OrgBouncycastleAsn1AnssiANSSINamedCurves *new_OrgBouncycastleAsn1AnssiANSSINamedCurves_init(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleAsn1AnssiANSSINamedCurves *create_OrgBouncycastleAsn1AnssiANSSINamedCurves_init(void);

FOUNDATION_EXPORT OrgBouncycastleAsn1X9X9ECPoint *OrgBouncycastleAsn1AnssiANSSINamedCurves_configureBasepointWithOrgBouncycastleMathEcECCurve_withNSString_(OrgBouncycastleMathEcECCurve *curve, NSString *encoding);

FOUNDATION_EXPORT OrgBouncycastleMathEcECCurve *OrgBouncycastleAsn1AnssiANSSINamedCurves_configureCurveWithOrgBouncycastleMathEcECCurve_(OrgBouncycastleMathEcECCurve *curve);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastleAsn1AnssiANSSINamedCurves_fromHexWithNSString_(NSString *hex);

FOUNDATION_EXPORT void OrgBouncycastleAsn1AnssiANSSINamedCurves_defineCurveWithNSString_withOrgBouncycastleAsn1ASN1ObjectIdentifier_withOrgBouncycastleAsn1X9X9ECParametersHolder_(NSString *name, OrgBouncycastleAsn1ASN1ObjectIdentifier *oid, OrgBouncycastleAsn1X9X9ECParametersHolder *holder);

FOUNDATION_EXPORT OrgBouncycastleAsn1X9X9ECParameters *OrgBouncycastleAsn1AnssiANSSINamedCurves_getByNameWithNSString_(NSString *name);

FOUNDATION_EXPORT OrgBouncycastleAsn1X9X9ECParametersHolder *OrgBouncycastleAsn1AnssiANSSINamedCurves_getByNameLazyWithNSString_(NSString *name);

FOUNDATION_EXPORT OrgBouncycastleAsn1X9X9ECParameters *OrgBouncycastleAsn1AnssiANSSINamedCurves_getByOIDWithOrgBouncycastleAsn1ASN1ObjectIdentifier_(OrgBouncycastleAsn1ASN1ObjectIdentifier *oid);

FOUNDATION_EXPORT OrgBouncycastleAsn1X9X9ECParametersHolder *OrgBouncycastleAsn1AnssiANSSINamedCurves_getByOIDLazyWithOrgBouncycastleAsn1ASN1ObjectIdentifier_(OrgBouncycastleAsn1ASN1ObjectIdentifier *oid);

FOUNDATION_EXPORT OrgBouncycastleAsn1ASN1ObjectIdentifier *OrgBouncycastleAsn1AnssiANSSINamedCurves_getOIDWithNSString_(NSString *name);

FOUNDATION_EXPORT NSString *OrgBouncycastleAsn1AnssiANSSINamedCurves_getNameWithOrgBouncycastleAsn1ASN1ObjectIdentifier_(OrgBouncycastleAsn1ASN1ObjectIdentifier *oid);

FOUNDATION_EXPORT id<JavaUtilEnumeration> OrgBouncycastleAsn1AnssiANSSINamedCurves_getNames(void);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1AnssiANSSINamedCurves)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleAsn1AnssiANSSINamedCurves")
