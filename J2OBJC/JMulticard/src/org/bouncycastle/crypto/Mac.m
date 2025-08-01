//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/crypto/Mac.java
//

#include "J2ObjC_source.h"
#include "org/bouncycastle/crypto/Mac.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/crypto/Mac must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastleCryptoMac : NSObject

@end

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/crypto/Mac.java"


#line 7
@implementation OrgBouncycastleCryptoMac

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, "V", 0x401, 0, 1, 2, -1, -1, -1 },
    { NULL, "LNSString;", 0x401, -1, -1, -1, -1, -1, -1 },
    { NULL, "I", 0x401, -1, -1, -1, -1, -1, -1 },
    { NULL, "V", 0x401, 3, 4, 5, -1, -1, -1 },
    { NULL, "V", 0x401, 3, 6, 7, -1, -1, -1 },
    { NULL, "I", 0x401, 8, 9, 7, -1, -1, -1 },
    { NULL, "V", 0x401, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(init__WithOrgBouncycastleCryptoCipherParameters:);
  methods[1].selector = @selector(getAlgorithmName);
  methods[2].selector = @selector(getMacSize);
  methods[3].selector = @selector(updateWithByte:);
  methods[4].selector = @selector(updateWithByteArray:withInt:withInt:);
  methods[5].selector = @selector(doFinalWithByteArray:withInt:);
  methods[6].selector = @selector(reset);
  #pragma clang diagnostic pop
  static const void *ptrTable[] = { "init", "LOrgBouncycastleCryptoCipherParameters;", "LJavaLangIllegalArgumentException;", "update", "B", "LJavaLangIllegalStateException;", "[BII", "LOrgBouncycastleCryptoDataLengthException;LJavaLangIllegalStateException;", "doFinal", "[BI" };
  static const J2ObjcClassInfo _OrgBouncycastleCryptoMac = { "Mac", "org.bouncycastle.crypto", ptrTable, methods, NULL, 7, 0x609, 7, 0, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleCryptoMac;
}

@end

J2OBJC_INTERFACE_TYPE_LITERAL_SOURCE(OrgBouncycastleCryptoMac)
