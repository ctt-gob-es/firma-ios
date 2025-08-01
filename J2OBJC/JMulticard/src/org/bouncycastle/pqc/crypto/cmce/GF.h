//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/cmce/GF.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoCmceGF")
#ifdef RESTRICT_OrgBouncycastlePqcCryptoCmceGF
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoCmceGF 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcCryptoCmceGF 1
#endif
#undef RESTRICT_OrgBouncycastlePqcCryptoCmceGF

#if !defined (OrgBouncycastlePqcCryptoCmceGF_) && (INCLUDE_ALL_OrgBouncycastlePqcCryptoCmceGF || defined(INCLUDE_OrgBouncycastlePqcCryptoCmceGF))
#define OrgBouncycastlePqcCryptoCmceGF_

@interface OrgBouncycastlePqcCryptoCmceGF : NSObject {
 @public
  jint GFBITS_;
  jint GFMASK_;
}

#pragma mark Public

- (instancetype)initPackagePrivateWithInt:(jint)gfbits;

#pragma mark Protected

- (jshort)gf_fracWithShort:(jshort)den
                 withShort:(jshort)num;

- (jshort)gf_invWithShort:(jshort)input;

- (jshort)gf_mulWithShort:(jshort)left
                withShort:(jshort)right;

#pragma mark Package-Private

- (jshort)gf_addWithShort:(jshort)left
                withShort:(jshort)right;

- (jshort)gf_iszeroWithShort:(jshort)a;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastlePqcCryptoCmceGF)

FOUNDATION_EXPORT void OrgBouncycastlePqcCryptoCmceGF_initPackagePrivateWithInt_(OrgBouncycastlePqcCryptoCmceGF *self, jint gfbits);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcCryptoCmceGF)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcCryptoCmceGF")
