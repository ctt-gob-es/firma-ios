//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/math/ec/endo/EndoPreCompInfo.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastleMathEcEndoEndoPreCompInfo")
#ifdef RESTRICT_OrgBouncycastleMathEcEndoEndoPreCompInfo
#define INCLUDE_ALL_OrgBouncycastleMathEcEndoEndoPreCompInfo 0
#else
#define INCLUDE_ALL_OrgBouncycastleMathEcEndoEndoPreCompInfo 1
#endif
#undef RESTRICT_OrgBouncycastleMathEcEndoEndoPreCompInfo

#if !defined (OrgBouncycastleMathEcEndoEndoPreCompInfo_) && (INCLUDE_ALL_OrgBouncycastleMathEcEndoEndoPreCompInfo || defined(INCLUDE_OrgBouncycastleMathEcEndoEndoPreCompInfo))
#define OrgBouncycastleMathEcEndoEndoPreCompInfo_

#define RESTRICT_OrgBouncycastleMathEcPreCompInfo 1
#define INCLUDE_OrgBouncycastleMathEcPreCompInfo 1
#include "org/bouncycastle/math/ec/PreCompInfo.h"

@class OrgBouncycastleMathEcECPoint;
@protocol OrgBouncycastleMathEcEndoECEndomorphism;

@interface OrgBouncycastleMathEcEndoEndoPreCompInfo : NSObject < OrgBouncycastleMathEcPreCompInfo > {
 @public
  id<OrgBouncycastleMathEcEndoECEndomorphism> endomorphism_;
  OrgBouncycastleMathEcECPoint *mappedPoint_;
}

#pragma mark Public

- (instancetype)init;

- (id<OrgBouncycastleMathEcEndoECEndomorphism>)getEndomorphism;

- (OrgBouncycastleMathEcECPoint *)getMappedPoint;

- (void)setEndomorphismWithOrgBouncycastleMathEcEndoECEndomorphism:(id<OrgBouncycastleMathEcEndoECEndomorphism>)endomorphism;

- (void)setMappedPointWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)mappedPoint;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleMathEcEndoEndoPreCompInfo)

J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcEndoEndoPreCompInfo, endomorphism_, id<OrgBouncycastleMathEcEndoECEndomorphism>)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcEndoEndoPreCompInfo, mappedPoint_, OrgBouncycastleMathEcECPoint *)

FOUNDATION_EXPORT void OrgBouncycastleMathEcEndoEndoPreCompInfo_init(OrgBouncycastleMathEcEndoEndoPreCompInfo *self);

FOUNDATION_EXPORT OrgBouncycastleMathEcEndoEndoPreCompInfo *new_OrgBouncycastleMathEcEndoEndoPreCompInfo_init(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastleMathEcEndoEndoPreCompInfo *create_OrgBouncycastleMathEcEndoEndoPreCompInfo_init(void);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathEcEndoEndoPreCompInfo)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastleMathEcEndoEndoPreCompInfo")
