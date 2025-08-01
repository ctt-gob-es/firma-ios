//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/sphincsplus/SK.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "org/bouncycastle/pqc/crypto/sphincsplus/SK.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/pqc/crypto/sphincsplus/SK must be compiled with ARC (-fobjc-arc)"
#endif

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/sphincsplus/SK.java"


#line 3
@implementation OrgBouncycastlePqcCryptoSphincsplusSK


#line 8
- (instancetype)initPackagePrivateWithByteArray:(IOSByteArray *)seed
                                  withByteArray:(IOSByteArray *)prf {
  OrgBouncycastlePqcCryptoSphincsplusSK_initPackagePrivateWithByteArray_withByteArray_(self, seed, prf);
  return self;
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x0, -1, 0, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initPackagePrivateWithByteArray:withByteArray:);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "seed_", "[B", .constantValue.asLong = 0, 0x10, -1, -1, -1, -1 },
    { "prf_", "[B", .constantValue.asLong = 0, 0x10, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "[B[B" };
  static const J2ObjcClassInfo _OrgBouncycastlePqcCryptoSphincsplusSK = { "SK", "org.bouncycastle.pqc.crypto.sphincsplus", ptrTable, methods, fields, 7, 0x0, 1, 2, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastlePqcCryptoSphincsplusSK;
}

@end


#line 8
void OrgBouncycastlePqcCryptoSphincsplusSK_initPackagePrivateWithByteArray_withByteArray_(OrgBouncycastlePqcCryptoSphincsplusSK *self, IOSByteArray *seed, IOSByteArray *prf) {
  NSObject_init(self);
  self->seed_ = seed;
  self->prf_ = prf;
}


#line 8
OrgBouncycastlePqcCryptoSphincsplusSK *new_OrgBouncycastlePqcCryptoSphincsplusSK_initPackagePrivateWithByteArray_withByteArray_(IOSByteArray *seed, IOSByteArray *prf) {
  J2OBJC_NEW_IMPL(OrgBouncycastlePqcCryptoSphincsplusSK, initPackagePrivateWithByteArray_withByteArray_, seed, prf)
}


#line 8
OrgBouncycastlePqcCryptoSphincsplusSK *create_OrgBouncycastlePqcCryptoSphincsplusSK_initPackagePrivateWithByteArray_withByteArray_(IOSByteArray *seed, IOSByteArray *prf) {
  J2OBJC_CREATE_IMPL(OrgBouncycastlePqcCryptoSphincsplusSK, initPackagePrivateWithByteArray_withByteArray_, seed, prf)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastlePqcCryptoSphincsplusSK)
