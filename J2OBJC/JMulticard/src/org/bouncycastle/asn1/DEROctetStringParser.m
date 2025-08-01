//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/DEROctetStringParser.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/io/IOException.h"
#include "java/io/InputStream.h"
#include "org/bouncycastle/asn1/ASN1ParsingException.h"
#include "org/bouncycastle/asn1/ASN1Primitive.h"
#include "org/bouncycastle/asn1/DEROctetString.h"
#include "org/bouncycastle/asn1/DEROctetStringParser.h"
#include "org/bouncycastle/asn1/DefiniteLengthInputStream.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/asn1/DEROctetStringParser must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastleAsn1DEROctetStringParser () {
 @public
  OrgBouncycastleAsn1DefiniteLengthInputStream *stream_;
}

@end

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1DEROctetStringParser, stream_, OrgBouncycastleAsn1DefiniteLengthInputStream *)

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/DEROctetStringParser.java"


#line 9
@implementation OrgBouncycastleAsn1DEROctetStringParser


#line 14
- (instancetype)initWithOrgBouncycastleAsn1DefiniteLengthInputStream:(OrgBouncycastleAsn1DefiniteLengthInputStream *)stream {
  OrgBouncycastleAsn1DEROctetStringParser_initWithOrgBouncycastleAsn1DefiniteLengthInputStream_(self, stream);
  return self;
}


#line 25
- (JavaIoInputStream *)getOctetStream {
  
#line 28
  return stream_;
}


#line 37
- (OrgBouncycastleAsn1ASN1Primitive *)getLoadedObject {
  
#line 41
  return new_OrgBouncycastleAsn1DEROctetString_initWithByteArray_([((OrgBouncycastleAsn1DefiniteLengthInputStream *) nil_chk(stream_)) toByteArray]);
}


#line 49
- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive {
  
#line 52
  @try {
    
#line 54
    return [self getLoadedObject];
  }
  @catch (JavaIoIOException *e) {
    
#line 58
    @throw new_OrgBouncycastleAsn1ASN1ParsingException_initWithNSString_withJavaLangThrowable_(JreStrcat("$$", @"IOException converting stream to byte array: ", [e getMessage]), e);
  }
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x0, -1, 0, -1, -1, -1, -1 },
    { NULL, "LJavaIoInputStream;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleAsn1ASN1Primitive;", 0x1, -1, -1, 1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleAsn1ASN1Primitive;", 0x1, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithOrgBouncycastleAsn1DefiniteLengthInputStream:);
  methods[1].selector = @selector(getOctetStream);
  methods[2].selector = @selector(getLoadedObject);
  methods[3].selector = @selector(toASN1Primitive);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "stream_", "LOrgBouncycastleAsn1DefiniteLengthInputStream;", .constantValue.asLong = 0, 0x12, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "LOrgBouncycastleAsn1DefiniteLengthInputStream;", "LJavaIoIOException;" };
  static const J2ObjcClassInfo _OrgBouncycastleAsn1DEROctetStringParser = { "DEROctetStringParser", "org.bouncycastle.asn1", ptrTable, methods, fields, 7, 0x1, 4, 1, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleAsn1DEROctetStringParser;
}

@end


#line 14
void OrgBouncycastleAsn1DEROctetStringParser_initWithOrgBouncycastleAsn1DefiniteLengthInputStream_(OrgBouncycastleAsn1DEROctetStringParser *self, OrgBouncycastleAsn1DefiniteLengthInputStream *stream) {
  NSObject_init(self);
  
#line 17
  self->stream_ = stream;
}


#line 14
OrgBouncycastleAsn1DEROctetStringParser *new_OrgBouncycastleAsn1DEROctetStringParser_initWithOrgBouncycastleAsn1DefiniteLengthInputStream_(OrgBouncycastleAsn1DefiniteLengthInputStream *stream) {
  J2OBJC_NEW_IMPL(OrgBouncycastleAsn1DEROctetStringParser, initWithOrgBouncycastleAsn1DefiniteLengthInputStream_, stream)
}


#line 14
OrgBouncycastleAsn1DEROctetStringParser *create_OrgBouncycastleAsn1DEROctetStringParser_initWithOrgBouncycastleAsn1DefiniteLengthInputStream_(OrgBouncycastleAsn1DefiniteLengthInputStream *stream) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleAsn1DEROctetStringParser, initWithOrgBouncycastleAsn1DefiniteLengthInputStream_, stream)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1DEROctetStringParser)
