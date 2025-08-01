//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/DERGraphicString.java
//

#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/lang/Deprecated.h"
#include "java/lang/Exception.h"
#include "java/lang/IllegalArgumentException.h"
#include "java/lang/annotation/Annotation.h"
#include "org/bouncycastle/asn1/ASN1GraphicString.h"
#include "org/bouncycastle/asn1/ASN1OctetString.h"
#include "org/bouncycastle/asn1/ASN1Primitive.h"
#include "org/bouncycastle/asn1/ASN1TaggedObject.h"
#include "org/bouncycastle/asn1/DERGraphicString.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/asn1/DERGraphicString must be compiled with ARC (-fobjc-arc)"
#endif

__attribute__((unused)) static IOSObjectArray *OrgBouncycastleAsn1DERGraphicString__Annotations$0(void);

__attribute__((unused)) static IOSObjectArray *OrgBouncycastleAsn1DERGraphicString__Annotations$1(void);

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/DERGraphicString.java"


#line 3
@implementation OrgBouncycastleAsn1DERGraphicString


#line 15
+ (OrgBouncycastleAsn1DERGraphicString *)getInstanceWithId:(id)obj {
  return OrgBouncycastleAsn1DERGraphicString_getInstanceWithId_(obj);
}


#line 55
+ (OrgBouncycastleAsn1DERGraphicString *)getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject:(OrgBouncycastleAsn1ASN1TaggedObject *)obj
                                                                                withBoolean:(jboolean)explicit_ {
  return OrgBouncycastleAsn1DERGraphicString_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(obj, explicit_);
}


#line 72
- (instancetype)initWithByteArray:(IOSByteArray *)octets {
  OrgBouncycastleAsn1DERGraphicString_initWithByteArray_(self, octets);
  return self;
}

- (instancetype)initWithByteArray:(IOSByteArray *)contents
                      withBoolean:(jboolean)clone {
  OrgBouncycastleAsn1DERGraphicString_initWithByteArray_withBoolean_(self, contents, clone);
  return self;
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, "LOrgBouncycastleAsn1DERGraphicString;", 0x9, 0, 1, -1, -1, 2, -1 },
    { NULL, "LOrgBouncycastleAsn1DERGraphicString;", 0x9, 0, 3, -1, -1, 4, -1 },
    { NULL, NULL, 0x1, -1, 5, -1, -1, -1, -1 },
    { NULL, NULL, 0x0, -1, 6, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(getInstanceWithId:);
  methods[1].selector = @selector(getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject:withBoolean:);
  methods[2].selector = @selector(initWithByteArray:);
  methods[3].selector = @selector(initWithByteArray:withBoolean:);
  #pragma clang diagnostic pop
  static const void *ptrTable[] = { "getInstance", "LNSObject;", (void *)&OrgBouncycastleAsn1DERGraphicString__Annotations$0, "LOrgBouncycastleAsn1ASN1TaggedObject;Z", (void *)&OrgBouncycastleAsn1DERGraphicString__Annotations$1, "[B", "[BZ" };
  static const J2ObjcClassInfo _OrgBouncycastleAsn1DERGraphicString = { "DERGraphicString", "org.bouncycastle.asn1", ptrTable, methods, NULL, 7, 0x1, 4, 0, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleAsn1DERGraphicString;
}

@end


#line 15
OrgBouncycastleAsn1DERGraphicString *OrgBouncycastleAsn1DERGraphicString_getInstanceWithId_(id obj) {
  OrgBouncycastleAsn1DERGraphicString_initialize();
  
#line 19
  if (obj == nil || [obj isKindOfClass:[OrgBouncycastleAsn1DERGraphicString class]]) {
    
#line 21
    return (OrgBouncycastleAsn1DERGraphicString *) cast_chk(obj, [OrgBouncycastleAsn1DERGraphicString class]);
  }
  if ([obj isKindOfClass:[OrgBouncycastleAsn1ASN1GraphicString class]]) {
    
#line 25
    return new_OrgBouncycastleAsn1DERGraphicString_initWithByteArray_withBoolean_(((OrgBouncycastleAsn1ASN1GraphicString *) obj)->contents_, false);
  }
  if ([obj isKindOfClass:[IOSByteArray class]]) {
    
#line 29
    @try {
      
#line 31
      return (OrgBouncycastleAsn1DERGraphicString *) cast_chk(OrgBouncycastleAsn1ASN1Primitive_fromByteArrayWithByteArray_((IOSByteArray *) cast_chk(obj, [IOSByteArray class])), [OrgBouncycastleAsn1DERGraphicString class]);
    }
    @catch (JavaLangException *e) {
      
#line 35
      @throw new_JavaLangIllegalArgumentException_initWithNSString_(JreStrcat("$$", @"encoding error in getInstance: ", [e description]));
    }
  }
  
#line 39
  @throw new_JavaLangIllegalArgumentException_initWithNSString_(JreStrcat("$$", @"illegal object in getInstance: ", [[obj java_getClass] getName]));
}


#line 55
OrgBouncycastleAsn1DERGraphicString *OrgBouncycastleAsn1DERGraphicString_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(OrgBouncycastleAsn1ASN1TaggedObject *obj, jboolean explicit_) {
  OrgBouncycastleAsn1DERGraphicString_initialize();
  
#line 60
  OrgBouncycastleAsn1ASN1Primitive *o = [((OrgBouncycastleAsn1ASN1TaggedObject *) nil_chk(obj)) getObject];
  
#line 62
  if (explicit_ || [o isKindOfClass:[OrgBouncycastleAsn1DERGraphicString class]]) {
    
#line 64
    return OrgBouncycastleAsn1DERGraphicString_getInstanceWithId_(o);
  }
  else {
    
#line 68
    return new_OrgBouncycastleAsn1DERGraphicString_initWithByteArray_([((OrgBouncycastleAsn1ASN1OctetString *) nil_chk(OrgBouncycastleAsn1ASN1OctetString_getInstanceWithId_(o))) getOctets]);
  }
}


#line 72
void OrgBouncycastleAsn1DERGraphicString_initWithByteArray_(OrgBouncycastleAsn1DERGraphicString *self, IOSByteArray *octets) {
  OrgBouncycastleAsn1DERGraphicString_initWithByteArray_withBoolean_(self,
#line 74
  octets, true);
}


#line 72
OrgBouncycastleAsn1DERGraphicString *new_OrgBouncycastleAsn1DERGraphicString_initWithByteArray_(IOSByteArray *octets) {
  J2OBJC_NEW_IMPL(OrgBouncycastleAsn1DERGraphicString, initWithByteArray_, octets)
}


#line 72
OrgBouncycastleAsn1DERGraphicString *create_OrgBouncycastleAsn1DERGraphicString_initWithByteArray_(IOSByteArray *octets) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleAsn1DERGraphicString, initWithByteArray_, octets)
}


#line 77
void OrgBouncycastleAsn1DERGraphicString_initWithByteArray_withBoolean_(OrgBouncycastleAsn1DERGraphicString *self, IOSByteArray *contents, jboolean clone) {
  OrgBouncycastleAsn1ASN1GraphicString_initWithByteArray_withBoolean_(self,
#line 79
  contents, clone);
}


#line 77
OrgBouncycastleAsn1DERGraphicString *new_OrgBouncycastleAsn1DERGraphicString_initWithByteArray_withBoolean_(IOSByteArray *contents, jboolean clone) {
  J2OBJC_NEW_IMPL(OrgBouncycastleAsn1DERGraphicString, initWithByteArray_withBoolean_, contents, clone)
}


#line 77
OrgBouncycastleAsn1DERGraphicString *create_OrgBouncycastleAsn1DERGraphicString_initWithByteArray_withBoolean_(IOSByteArray *contents, jboolean clone) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleAsn1DERGraphicString, initWithByteArray_withBoolean_, contents, clone)
}

IOSObjectArray *OrgBouncycastleAsn1DERGraphicString__Annotations$0() {
  return [IOSObjectArray newArrayWithObjects:(id[]){ create_JavaLangDeprecated() } count:1 type:JavaLangAnnotationAnnotation_class_()];
}

IOSObjectArray *OrgBouncycastleAsn1DERGraphicString__Annotations$1() {
  return [IOSObjectArray newArrayWithObjects:(id[]){ create_JavaLangDeprecated() } count:1 type:JavaLangAnnotationAnnotation_class_()];
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1DERGraphicString)
