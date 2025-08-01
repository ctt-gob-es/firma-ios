//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/DLSetParser.java
//

#include "J2ObjC_source.h"
#include "java/io/IOException.h"
#include "org/bouncycastle/asn1/ASN1Encodable.h"
#include "org/bouncycastle/asn1/ASN1EncodableVector.h"
#include "org/bouncycastle/asn1/ASN1ParsingException.h"
#include "org/bouncycastle/asn1/ASN1Primitive.h"
#include "org/bouncycastle/asn1/ASN1StreamParser.h"
#include "org/bouncycastle/asn1/DLFactory.h"
#include "org/bouncycastle/asn1/DLSet.h"
#include "org/bouncycastle/asn1/DLSetParser.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/asn1/DLSetParser must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastleAsn1DLSetParser () {
 @public
  OrgBouncycastleAsn1ASN1StreamParser *_parser_;
}

@end

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1DLSetParser, _parser_, OrgBouncycastleAsn1ASN1StreamParser *)

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/DLSetParser.java"


#line 10
@implementation OrgBouncycastleAsn1DLSetParser


#line 15
- (instancetype)initWithOrgBouncycastleAsn1ASN1StreamParser:(OrgBouncycastleAsn1ASN1StreamParser *)parser {
  OrgBouncycastleAsn1DLSetParser_initWithOrgBouncycastleAsn1ASN1StreamParser_(self, parser);
  return self;
}


#line 26
- (id<OrgBouncycastleAsn1ASN1Encodable>)readObject {
  
#line 30
  return [((OrgBouncycastleAsn1ASN1StreamParser *) nil_chk(_parser_)) readObject];
}


#line 39
- (OrgBouncycastleAsn1ASN1Primitive *)getLoadedObject {
  
#line 43
  return OrgBouncycastleAsn1DLFactory_createSetWithOrgBouncycastleAsn1ASN1EncodableVector_([((OrgBouncycastleAsn1ASN1StreamParser *) nil_chk(_parser_)) readVector]);
}


#line 51
- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive {
  
#line 54
  @try {
    
#line 56
    return [self getLoadedObject];
  }
  @catch (JavaIoIOException *e) {
    
#line 60
    @throw new_OrgBouncycastleAsn1ASN1ParsingException_initWithNSString_withJavaLangThrowable_([e getMessage], e);
  }
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x0, -1, 0, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleAsn1ASN1Encodable;", 0x1, -1, -1, 1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleAsn1ASN1Primitive;", 0x1, -1, -1, 1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleAsn1ASN1Primitive;", 0x1, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithOrgBouncycastleAsn1ASN1StreamParser:);
  methods[1].selector = @selector(readObject);
  methods[2].selector = @selector(getLoadedObject);
  methods[3].selector = @selector(toASN1Primitive);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "_parser_", "LOrgBouncycastleAsn1ASN1StreamParser;", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "LOrgBouncycastleAsn1ASN1StreamParser;", "LJavaIoIOException;" };
  static const J2ObjcClassInfo _OrgBouncycastleAsn1DLSetParser = { "DLSetParser", "org.bouncycastle.asn1", ptrTable, methods, fields, 7, 0x1, 4, 1, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleAsn1DLSetParser;
}

@end


#line 15
void OrgBouncycastleAsn1DLSetParser_initWithOrgBouncycastleAsn1ASN1StreamParser_(OrgBouncycastleAsn1DLSetParser *self, OrgBouncycastleAsn1ASN1StreamParser *parser) {
  NSObject_init(self);
  self->_parser_ = parser;
}


#line 15
OrgBouncycastleAsn1DLSetParser *new_OrgBouncycastleAsn1DLSetParser_initWithOrgBouncycastleAsn1ASN1StreamParser_(OrgBouncycastleAsn1ASN1StreamParser *parser) {
  J2OBJC_NEW_IMPL(OrgBouncycastleAsn1DLSetParser, initWithOrgBouncycastleAsn1ASN1StreamParser_, parser)
}


#line 15
OrgBouncycastleAsn1DLSetParser *create_OrgBouncycastleAsn1DLSetParser_initWithOrgBouncycastleAsn1ASN1StreamParser_(OrgBouncycastleAsn1ASN1StreamParser *parser) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleAsn1DLSetParser, initWithOrgBouncycastleAsn1ASN1StreamParser_, parser)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1DLSetParser)
