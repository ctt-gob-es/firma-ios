//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/ConstructedOctetStream.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/io/IOException.h"
#include "java/io/InputStream.h"
#include "org/bouncycastle/asn1/ASN1Encodable.h"
#include "org/bouncycastle/asn1/ASN1OctetStringParser.h"
#include "org/bouncycastle/asn1/ASN1StreamParser.h"
#include "org/bouncycastle/asn1/ConstructedOctetStream.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/asn1/ConstructedOctetStream must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastleAsn1ConstructedOctetStream () {
 @public
  OrgBouncycastleAsn1ASN1StreamParser *_parser_;
  jboolean _first_;
  JavaIoInputStream *_currentStream_;
}

- (id<OrgBouncycastleAsn1ASN1OctetStringParser>)getNextParser;

@end

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1ConstructedOctetStream, _parser_, OrgBouncycastleAsn1ASN1StreamParser *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1ConstructedOctetStream, _currentStream_, JavaIoInputStream *)

__attribute__((unused)) static id<OrgBouncycastleAsn1ASN1OctetStringParser> OrgBouncycastleAsn1ConstructedOctetStream_getNextParser(OrgBouncycastleAsn1ConstructedOctetStream *self);

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/ConstructedOctetStream.java"


#line 6
@implementation OrgBouncycastleAsn1ConstructedOctetStream


#line 14
- (instancetype)initPackagePrivateWithOrgBouncycastleAsn1ASN1StreamParser:(OrgBouncycastleAsn1ASN1StreamParser *)parser {
  OrgBouncycastleAsn1ConstructedOctetStream_initPackagePrivateWithOrgBouncycastleAsn1ASN1StreamParser_(self, parser);
  return self;
}


#line 20
- (jint)readWithByteArray:(IOSByteArray *)b
                  withInt:(jint)off
                  withInt:(jint)len {
  if (_currentStream_ == nil) {
    
#line 25
    if (!_first_) {
      
#line 27
      return -1;
    }
    
#line 30
    id<OrgBouncycastleAsn1ASN1OctetStringParser> next = OrgBouncycastleAsn1ConstructedOctetStream_getNextParser(self);
    if (next == nil) {
      
#line 33
      return -1;
    }
    
#line 36
    _first_ = false;
    _currentStream_ = [next getOctetStream];
  }
  
#line 40
  jint totalRead = 0;
  
#line 42
  for (; ; ) {
    
#line 44
    jint numRead = [((JavaIoInputStream *) nil_chk(_currentStream_)) readWithByteArray:b withInt:off + totalRead withInt:len - totalRead];
    
#line 46
    if (numRead >= 0) {
      
#line 48
      totalRead += numRead;
      
#line 50
      if (totalRead == len) {
        
#line 52
        return totalRead;
      }
    }
    else {
      
#line 57
      id<OrgBouncycastleAsn1ASN1OctetStringParser> next = OrgBouncycastleAsn1ConstructedOctetStream_getNextParser(self);
      if (next == nil) {
        
#line 60
        _currentStream_ = nil;
        return totalRead < 1 ? -1 : totalRead;
      }
      
#line 64
      _currentStream_ = [next getOctetStream];
    }
  }
}


#line 69
- (jint)read {
  
#line 73
  if (_currentStream_ == nil) {
    
#line 75
    if (!_first_) {
      
#line 77
      return -1;
    }
    
#line 80
    id<OrgBouncycastleAsn1ASN1OctetStringParser> next = OrgBouncycastleAsn1ConstructedOctetStream_getNextParser(self);
    if (next == nil) {
      
#line 83
      return -1;
    }
    
#line 86
    _first_ = false;
    _currentStream_ = [next getOctetStream];
  }
  
#line 90
  for (; ; ) {
    
#line 92
    jint b = [((JavaIoInputStream *) nil_chk(_currentStream_)) read];
    
#line 94
    if (b >= 0) {
      
#line 96
      return b;
    }
    
#line 99
    id<OrgBouncycastleAsn1ASN1OctetStringParser> next = OrgBouncycastleAsn1ConstructedOctetStream_getNextParser(self);
    if (next == nil) {
      
#line 102
      _currentStream_ = nil;
      return -1;
    }
    
#line 106
    _currentStream_ = [next getOctetStream];
  }
}


#line 110
- (id<OrgBouncycastleAsn1ASN1OctetStringParser>)getNextParser {
  return OrgBouncycastleAsn1ConstructedOctetStream_getNextParser(self);
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x0, -1, 0, -1, -1, -1, -1 },
    { NULL, "I", 0x1, 1, 2, 3, -1, -1, -1 },
    { NULL, "I", 0x1, -1, -1, 3, -1, -1, -1 },
    { NULL, "LOrgBouncycastleAsn1ASN1OctetStringParser;", 0x2, -1, -1, 3, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initPackagePrivateWithOrgBouncycastleAsn1ASN1StreamParser:);
  methods[1].selector = @selector(readWithByteArray:withInt:withInt:);
  methods[2].selector = @selector(read);
  methods[3].selector = @selector(getNextParser);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "_parser_", "LOrgBouncycastleAsn1ASN1StreamParser;", .constantValue.asLong = 0, 0x12, -1, -1, -1, -1 },
    { "_first_", "Z", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "_currentStream_", "LJavaIoInputStream;", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "LOrgBouncycastleAsn1ASN1StreamParser;", "read", "[BII", "LJavaIoIOException;" };
  static const J2ObjcClassInfo _OrgBouncycastleAsn1ConstructedOctetStream = { "ConstructedOctetStream", "org.bouncycastle.asn1", ptrTable, methods, fields, 7, 0x0, 4, 3, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleAsn1ConstructedOctetStream;
}

@end


#line 14
void OrgBouncycastleAsn1ConstructedOctetStream_initPackagePrivateWithOrgBouncycastleAsn1ASN1StreamParser_(OrgBouncycastleAsn1ConstructedOctetStream *self, OrgBouncycastleAsn1ASN1StreamParser *parser) {
  JavaIoInputStream_init(self);
  self->_first_ =
#line 11
  true;
  
#line 17
  self->_parser_ = parser;
}


#line 14
OrgBouncycastleAsn1ConstructedOctetStream *new_OrgBouncycastleAsn1ConstructedOctetStream_initPackagePrivateWithOrgBouncycastleAsn1ASN1StreamParser_(OrgBouncycastleAsn1ASN1StreamParser *parser) {
  J2OBJC_NEW_IMPL(OrgBouncycastleAsn1ConstructedOctetStream, initPackagePrivateWithOrgBouncycastleAsn1ASN1StreamParser_, parser)
}


#line 14
OrgBouncycastleAsn1ConstructedOctetStream *create_OrgBouncycastleAsn1ConstructedOctetStream_initPackagePrivateWithOrgBouncycastleAsn1ASN1StreamParser_(OrgBouncycastleAsn1ASN1StreamParser *parser) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleAsn1ConstructedOctetStream, initPackagePrivateWithOrgBouncycastleAsn1ASN1StreamParser_, parser)
}


#line 110
id<OrgBouncycastleAsn1ASN1OctetStringParser> OrgBouncycastleAsn1ConstructedOctetStream_getNextParser(OrgBouncycastleAsn1ConstructedOctetStream *self) {
  
#line 112
  id<OrgBouncycastleAsn1ASN1Encodable> asn1Obj = [((OrgBouncycastleAsn1ASN1StreamParser *) nil_chk(self->_parser_)) readObject];
  if (asn1Obj == nil) {
    
#line 115
    return nil;
  }
  
#line 118
  if ([OrgBouncycastleAsn1ASN1OctetStringParser_class_() isInstance:asn1Obj]) {
    
#line 120
    return (id<OrgBouncycastleAsn1ASN1OctetStringParser>) cast_check(asn1Obj, OrgBouncycastleAsn1ASN1OctetStringParser_class_());
  }
  
#line 123
  @throw new_JavaIoIOException_initWithNSString_(JreStrcat("$@", @"unknown object encountered: ", [asn1Obj java_getClass]));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1ConstructedOctetStream)
