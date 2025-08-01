//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/misc/NetscapeCertType.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/lang/Integer.h"
#include "org/bouncycastle/asn1/ASN1BitString.h"
#include "org/bouncycastle/asn1/DERBitString.h"
#include "org/bouncycastle/asn1/misc/NetscapeCertType.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/asn1/misc/NetscapeCertType must be compiled with ARC (-fobjc-arc)"
#endif

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/misc/NetscapeCertType.java"


#line 20
@implementation OrgBouncycastleAsn1MiscNetscapeCertType


#line 39
- (instancetype)initWithInt:(jint)usage {
  OrgBouncycastleAsn1MiscNetscapeCertType_initWithInt_(self, usage);
  return self;
}


#line 45
- (instancetype)initWithOrgBouncycastleAsn1ASN1BitString:(OrgBouncycastleAsn1ASN1BitString *)usage {
  OrgBouncycastleAsn1MiscNetscapeCertType_initWithOrgBouncycastleAsn1ASN1BitString_(self, usage);
  return self;
}


#line 51
- (jboolean)hasUsagesWithInt:(jint)usages {
  
#line 53
  return ([self intValue] & usages) == usages;
}


#line 56
- (NSString *)description {
  
#line 59
  return JreStrcat("$$", @"NetscapeCertType: 0x", JavaLangInteger_toHexStringWithInt_([self intValue]));
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, 0, -1, -1, -1, -1 },
    { NULL, NULL, 0x1, -1, 1, -1, -1, -1, -1 },
    { NULL, "Z", 0x1, 2, 0, -1, -1, -1, -1 },
    { NULL, "LNSString;", 0x1, 3, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithInt:);
  methods[1].selector = @selector(initWithOrgBouncycastleAsn1ASN1BitString:);
  methods[2].selector = @selector(hasUsagesWithInt:);
  methods[3].selector = @selector(description);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "sslClient", "I", .constantValue.asInt = OrgBouncycastleAsn1MiscNetscapeCertType_sslClient, 0x19, -1, -1, -1, -1 },
    { "sslServer", "I", .constantValue.asInt = OrgBouncycastleAsn1MiscNetscapeCertType_sslServer, 0x19, -1, -1, -1, -1 },
    { "smime", "I", .constantValue.asInt = OrgBouncycastleAsn1MiscNetscapeCertType_smime, 0x19, -1, -1, -1, -1 },
    { "objectSigning", "I", .constantValue.asInt = OrgBouncycastleAsn1MiscNetscapeCertType_objectSigning, 0x19, -1, -1, -1, -1 },
    { "reserved", "I", .constantValue.asInt = OrgBouncycastleAsn1MiscNetscapeCertType_reserved, 0x19, -1, -1, -1, -1 },
    { "sslCA", "I", .constantValue.asInt = OrgBouncycastleAsn1MiscNetscapeCertType_sslCA, 0x19, -1, -1, -1, -1 },
    { "smimeCA", "I", .constantValue.asInt = OrgBouncycastleAsn1MiscNetscapeCertType_smimeCA, 0x19, -1, -1, -1, -1 },
    { "objectSigningCA", "I", .constantValue.asInt = OrgBouncycastleAsn1MiscNetscapeCertType_objectSigningCA, 0x19, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "I", "LOrgBouncycastleAsn1ASN1BitString;", "hasUsages", "toString" };
  static const J2ObjcClassInfo _OrgBouncycastleAsn1MiscNetscapeCertType = { "NetscapeCertType", "org.bouncycastle.asn1.misc", ptrTable, methods, fields, 7, 0x1, 4, 8, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleAsn1MiscNetscapeCertType;
}

@end


#line 39
void OrgBouncycastleAsn1MiscNetscapeCertType_initWithInt_(OrgBouncycastleAsn1MiscNetscapeCertType *self, jint usage) {
  OrgBouncycastleAsn1DERBitString_initWithByteArray_withInt_(self, OrgBouncycastleAsn1ASN1BitString_getBytesWithInt_(
#line 42
  usage), OrgBouncycastleAsn1ASN1BitString_getPadBitsWithInt_(usage));
}


#line 39
OrgBouncycastleAsn1MiscNetscapeCertType *new_OrgBouncycastleAsn1MiscNetscapeCertType_initWithInt_(jint usage) {
  J2OBJC_NEW_IMPL(OrgBouncycastleAsn1MiscNetscapeCertType, initWithInt_, usage)
}


#line 39
OrgBouncycastleAsn1MiscNetscapeCertType *create_OrgBouncycastleAsn1MiscNetscapeCertType_initWithInt_(jint usage) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleAsn1MiscNetscapeCertType, initWithInt_, usage)
}


#line 45
void OrgBouncycastleAsn1MiscNetscapeCertType_initWithOrgBouncycastleAsn1ASN1BitString_(OrgBouncycastleAsn1MiscNetscapeCertType *self, OrgBouncycastleAsn1ASN1BitString *usage) {
  OrgBouncycastleAsn1DERBitString_initWithByteArray_withInt_(self,
#line 48
  [((OrgBouncycastleAsn1ASN1BitString *) nil_chk(usage)) getBytes], [usage getPadBits]);
}


#line 45
OrgBouncycastleAsn1MiscNetscapeCertType *new_OrgBouncycastleAsn1MiscNetscapeCertType_initWithOrgBouncycastleAsn1ASN1BitString_(OrgBouncycastleAsn1ASN1BitString *usage) {
  J2OBJC_NEW_IMPL(OrgBouncycastleAsn1MiscNetscapeCertType, initWithOrgBouncycastleAsn1ASN1BitString_, usage)
}


#line 45
OrgBouncycastleAsn1MiscNetscapeCertType *create_OrgBouncycastleAsn1MiscNetscapeCertType_initWithOrgBouncycastleAsn1ASN1BitString_(OrgBouncycastleAsn1ASN1BitString *usage) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleAsn1MiscNetscapeCertType, initWithOrgBouncycastleAsn1ASN1BitString_, usage)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1MiscNetscapeCertType)
