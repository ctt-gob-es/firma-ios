//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/crypto/AsymmetricCipherKeyPairGenerator.java
//

#include "J2ObjC_source.h"
#include "org/bouncycastle/crypto/AsymmetricCipherKeyPairGenerator.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/crypto/AsymmetricCipherKeyPairGenerator must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastleCryptoAsymmetricCipherKeyPairGenerator : NSObject

@end

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/crypto/AsymmetricCipherKeyPairGenerator.java"


#line 6
@implementation OrgBouncycastleCryptoAsymmetricCipherKeyPairGenerator

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, "V", 0x401, 0, 1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleCryptoAsymmetricCipherKeyPair;", 0x401, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(init__WithOrgBouncycastleCryptoKeyGenerationParameters:);
  methods[1].selector = @selector(generateKeyPair);
  #pragma clang diagnostic pop
  static const void *ptrTable[] = { "init", "LOrgBouncycastleCryptoKeyGenerationParameters;" };
  static const J2ObjcClassInfo _OrgBouncycastleCryptoAsymmetricCipherKeyPairGenerator = { "AsymmetricCipherKeyPairGenerator", "org.bouncycastle.crypto", ptrTable, methods, NULL, 7, 0x609, 2, 0, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleCryptoAsymmetricCipherKeyPairGenerator;
}

@end

J2OBJC_INTERFACE_TYPE_LITERAL_SOURCE(OrgBouncycastleCryptoAsymmetricCipherKeyPairGenerator)
