//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/ASN1BitStringParser.java
//

#include "J2ObjC_source.h"
#include "org/bouncycastle/asn1/ASN1BitStringParser.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/asn1/ASN1BitStringParser must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastleAsn1ASN1BitStringParser : NSObject

@end

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/ASN1BitStringParser.java"


#line 9
@implementation OrgBouncycastleAsn1ASN1BitStringParser

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, "LJavaIoInputStream;", 0x401, -1, -1, 0, -1, -1, -1 },
    { NULL, "LJavaIoInputStream;", 0x401, -1, -1, 0, -1, -1, -1 },
    { NULL, "I", 0x401, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(getBitStream);
  methods[1].selector = @selector(getOctetStream);
  methods[2].selector = @selector(getPadBits);
  #pragma clang diagnostic pop
  static const void *ptrTable[] = { "LJavaIoIOException;" };
  static const J2ObjcClassInfo _OrgBouncycastleAsn1ASN1BitStringParser = { "ASN1BitStringParser", "org.bouncycastle.asn1", ptrTable, methods, NULL, 7, 0x609, 3, 0, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleAsn1ASN1BitStringParser;
}

@end

J2OBJC_INTERFACE_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1ASN1BitStringParser)
