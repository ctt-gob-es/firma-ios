//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/xmss/LTreeAddress.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "org/bouncycastle/pqc/crypto/xmss/LTreeAddress.h"
#include "org/bouncycastle/pqc/crypto/xmss/XMSSAddress.h"
#include "org/bouncycastle/util/Pack.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/pqc/crypto/xmss/LTreeAddress must be compiled with ARC (-fobjc-arc)"
#endif

#pragma clang diagnostic ignored "-Wincomplete-implementation"

@interface OrgBouncycastlePqcCryptoXmssLTreeAddress () {
 @public
  jint lTreeAddress_;
  jint treeHeight_;
  jint treeIndex_;
}

@end

inline jint OrgBouncycastlePqcCryptoXmssLTreeAddress_get_TYPE(void);
#define OrgBouncycastlePqcCryptoXmssLTreeAddress_TYPE 1
J2OBJC_STATIC_FIELD_CONSTANT(OrgBouncycastlePqcCryptoXmssLTreeAddress, TYPE, jint)

@interface OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder () {
 @public
  jint lTreeAddress_;
  jint treeHeight_;
  jint treeIndex_;
}

@end

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/xmss/LTreeAddress.java"


#line 8
@implementation OrgBouncycastlePqcCryptoXmssLTreeAddress


#line 18
- (instancetype)initPackagePrivateWithOrgBouncycastlePqcCryptoXmssLTreeAddress_Builder:(OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder *)builder {
  OrgBouncycastlePqcCryptoXmssLTreeAddress_initPackagePrivateWithOrgBouncycastlePqcCryptoXmssLTreeAddress_Builder_(self, builder);
  return self;
}


#line 68
- (IOSByteArray *)toByteArray {
  
#line 71
  IOSByteArray *byteRepresentation = [super toByteArray];
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(lTreeAddress_, byteRepresentation, 16);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(treeHeight_, byteRepresentation, 20);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(treeIndex_, byteRepresentation, 24);
  return byteRepresentation;
}

- (jint)getLTreeAddress {
  
#line 80
  return lTreeAddress_;
}


#line 83
- (jint)getTreeHeight {
  
#line 85
  return treeHeight_;
}


#line 88
- (jint)getTreeIndex {
  
#line 90
  return treeIndex_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x0, -1, 0, -1, -1, -1, -1 },
    { NULL, "[B", 0x4, -1, -1, -1, -1, -1, -1 },
    { NULL, "I", 0x4, -1, -1, -1, -1, -1, -1 },
    { NULL, "I", 0x4, -1, -1, -1, -1, -1, -1 },
    { NULL, "I", 0x4, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initPackagePrivateWithOrgBouncycastlePqcCryptoXmssLTreeAddress_Builder:);
  methods[1].selector = @selector(toByteArray);
  methods[2].selector = @selector(getLTreeAddress);
  methods[3].selector = @selector(getTreeHeight);
  methods[4].selector = @selector(getTreeIndex);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "TYPE", "I", .constantValue.asInt = OrgBouncycastlePqcCryptoXmssLTreeAddress_TYPE, 0x1a, -1, -1, -1, -1 },
    { "lTreeAddress_", "I", .constantValue.asLong = 0, 0x12, -1, -1, -1, -1 },
    { "treeHeight_", "I", .constantValue.asLong = 0, 0x12, -1, -1, -1, -1 },
    { "treeIndex_", "I", .constantValue.asLong = 0, 0x12, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "LOrgBouncycastlePqcCryptoXmssLTreeAddress_Builder;" };
  static const J2ObjcClassInfo _OrgBouncycastlePqcCryptoXmssLTreeAddress = { "LTreeAddress", "org.bouncycastle.pqc.crypto.xmss", ptrTable, methods, fields, 7, 0x10, 5, 4, -1, 0, -1, -1, -1 };
  return &_OrgBouncycastlePqcCryptoXmssLTreeAddress;
}

@end


#line 18
void OrgBouncycastlePqcCryptoXmssLTreeAddress_initPackagePrivateWithOrgBouncycastlePqcCryptoXmssLTreeAddress_Builder_(OrgBouncycastlePqcCryptoXmssLTreeAddress *self, OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder *builder) {
  OrgBouncycastlePqcCryptoXmssXMSSAddress_initWithOrgBouncycastlePqcCryptoXmssXMSSAddress_Builder_(self, builder);
  self->lTreeAddress_ = ((OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder *) nil_chk(builder))->lTreeAddress_;
  self->treeHeight_ = builder->treeHeight_;
  self->treeIndex_ = builder->treeIndex_;
}


#line 18
OrgBouncycastlePqcCryptoXmssLTreeAddress *new_OrgBouncycastlePqcCryptoXmssLTreeAddress_initPackagePrivateWithOrgBouncycastlePqcCryptoXmssLTreeAddress_Builder_(OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder *builder) {
  J2OBJC_NEW_IMPL(OrgBouncycastlePqcCryptoXmssLTreeAddress, initPackagePrivateWithOrgBouncycastlePqcCryptoXmssLTreeAddress_Builder_, builder)
}


#line 18
OrgBouncycastlePqcCryptoXmssLTreeAddress *create_OrgBouncycastlePqcCryptoXmssLTreeAddress_initPackagePrivateWithOrgBouncycastlePqcCryptoXmssLTreeAddress_Builder_(OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder *builder) {
  J2OBJC_CREATE_IMPL(OrgBouncycastlePqcCryptoXmssLTreeAddress, initPackagePrivateWithOrgBouncycastlePqcCryptoXmssLTreeAddress_Builder_, builder)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastlePqcCryptoXmssLTreeAddress)

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/xmss/LTreeAddress.java"


#line 25
@implementation OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder

J2OBJC_IGNORE_DESIGNATED_BEGIN

#line 32
- (instancetype)init {
  OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder_init(self);
  return self;
}
J2OBJC_IGNORE_DESIGNATED_END


#line 37
- (OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder *)withLTreeAddressWithInt:(jint)val {
  
#line 39
  lTreeAddress_ = val;
  return self;
}


#line 43
- (OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder *)withTreeHeightWithInt:(jint)val {
  
#line 45
  treeHeight_ = val;
  return self;
}


#line 49
- (OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder *)withTreeIndexWithInt:(jint)val {
  
#line 51
  treeIndex_ = val;
  return self;
}


#line 55
- (OrgBouncycastlePqcCryptoXmssXMSSAddress *)build {
  
#line 58
  return new_OrgBouncycastlePqcCryptoXmssLTreeAddress_initPackagePrivateWithOrgBouncycastlePqcCryptoXmssLTreeAddress_Builder_(self);
}

- (OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder *)getThis {
  
#line 64
  return self;
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x4, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastlePqcCryptoXmssLTreeAddress_Builder;", 0x4, 0, 1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastlePqcCryptoXmssLTreeAddress_Builder;", 0x4, 2, 1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastlePqcCryptoXmssLTreeAddress_Builder;", 0x4, 3, 1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastlePqcCryptoXmssXMSSAddress;", 0x4, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastlePqcCryptoXmssLTreeAddress_Builder;", 0x4, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(init);
  methods[1].selector = @selector(withLTreeAddressWithInt:);
  methods[2].selector = @selector(withTreeHeightWithInt:);
  methods[3].selector = @selector(withTreeIndexWithInt:);
  methods[4].selector = @selector(build);
  methods[5].selector = @selector(getThis);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "lTreeAddress_", "I", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "treeHeight_", "I", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "treeIndex_", "I", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "withLTreeAddress", "I", "withTreeHeight", "withTreeIndex", "LOrgBouncycastlePqcCryptoXmssLTreeAddress;", "Lorg/bouncycastle/pqc/crypto/xmss/XMSSAddress$Builder<Lorg/bouncycastle/pqc/crypto/xmss/LTreeAddress$Builder;>;" };
  static const J2ObjcClassInfo _OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder = { "Builder", "org.bouncycastle.pqc.crypto.xmss", ptrTable, methods, fields, 7, 0xc, 6, 3, 4, -1, -1, 5, -1 };
  return &_OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder;
}

@end


#line 32
void OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder_init(OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder *self) {
  OrgBouncycastlePqcCryptoXmssXMSSAddress_Builder_initWithInt_(self, OrgBouncycastlePqcCryptoXmssLTreeAddress_TYPE);
  self->lTreeAddress_ =
#line 28
  0;
  self->treeHeight_ = 0;
  self->treeIndex_ = 0;
}


#line 32
OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder *new_OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder_init() {
  J2OBJC_NEW_IMPL(OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder, init)
}


#line 32
OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder *create_OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder_init() {
  J2OBJC_CREATE_IMPL(OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder, init)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastlePqcCryptoXmssLTreeAddress_Builder)
