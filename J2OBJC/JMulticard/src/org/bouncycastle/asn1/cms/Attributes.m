//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/cms/Attributes.java
//

#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "J2ObjC_source.h"
#include "org/bouncycastle/asn1/ASN1Encodable.h"
#include "org/bouncycastle/asn1/ASN1EncodableVector.h"
#include "org/bouncycastle/asn1/ASN1Object.h"
#include "org/bouncycastle/asn1/ASN1Primitive.h"
#include "org/bouncycastle/asn1/ASN1Set.h"
#include "org/bouncycastle/asn1/ASN1TaggedObject.h"
#include "org/bouncycastle/asn1/DLSet.h"
#include "org/bouncycastle/asn1/cms/Attribute.h"
#include "org/bouncycastle/asn1/cms/Attributes.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/asn1/cms/Attributes must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastleAsn1CmsAttributes () {
 @public
  OrgBouncycastleAsn1ASN1Set *attributes_;
}

- (instancetype)initWithOrgBouncycastleAsn1ASN1Set:(OrgBouncycastleAsn1ASN1Set *)set;

@end

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1CmsAttributes, attributes_, OrgBouncycastleAsn1ASN1Set *)

__attribute__((unused)) static void OrgBouncycastleAsn1CmsAttributes_initWithOrgBouncycastleAsn1ASN1Set_(OrgBouncycastleAsn1CmsAttributes *self, OrgBouncycastleAsn1ASN1Set *set);

__attribute__((unused)) static OrgBouncycastleAsn1CmsAttributes *new_OrgBouncycastleAsn1CmsAttributes_initWithOrgBouncycastleAsn1ASN1Set_(OrgBouncycastleAsn1ASN1Set *set) NS_RETURNS_RETAINED;

__attribute__((unused)) static OrgBouncycastleAsn1CmsAttributes *create_OrgBouncycastleAsn1CmsAttributes_initWithOrgBouncycastleAsn1ASN1Set_(OrgBouncycastleAsn1ASN1Set *set);

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/asn1/cms/Attributes.java"


#line 25
@implementation OrgBouncycastleAsn1CmsAttributes


#line 30
- (instancetype)initWithOrgBouncycastleAsn1ASN1Set:(OrgBouncycastleAsn1ASN1Set *)set {
  OrgBouncycastleAsn1CmsAttributes_initWithOrgBouncycastleAsn1ASN1Set_(self, set);
  return self;
}

- (instancetype)initWithOrgBouncycastleAsn1ASN1EncodableVector:(OrgBouncycastleAsn1ASN1EncodableVector *)v {
  OrgBouncycastleAsn1CmsAttributes_initWithOrgBouncycastleAsn1ASN1EncodableVector_(self, v);
  return self;
}


#line 53
+ (OrgBouncycastleAsn1CmsAttributes *)getInstanceWithId:(id)obj {
  return OrgBouncycastleAsn1CmsAttributes_getInstanceWithId_(obj);
}


#line 67
+ (OrgBouncycastleAsn1CmsAttributes *)getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject:(OrgBouncycastleAsn1ASN1TaggedObject *)obj
                                                                             withBoolean:(jboolean)explicit_ {
  return OrgBouncycastleAsn1CmsAttributes_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(obj, explicit_);
}


#line 74
- (IOSObjectArray *)getAttributes {
  
#line 76
  IOSObjectArray *rv = [IOSObjectArray newArrayWithLength:[((OrgBouncycastleAsn1ASN1Set *) nil_chk(attributes_)) size] type:OrgBouncycastleAsn1CmsAttribute_class_()];
  
#line 78
  for (jint i = 0; i != rv->size_; i++) {
    
#line 80
    (void) IOSObjectArray_Set(rv, i, OrgBouncycastleAsn1CmsAttribute_getInstanceWithId_([attributes_ getObjectAtWithInt:i]));
  }
  
#line 83
  return rv;
}


#line 89
- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive {
  
#line 92
  return attributes_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x2, -1, 0, -1, -1, -1, -1 },
    { NULL, NULL, 0x1, -1, 1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleAsn1CmsAttributes;", 0x9, 2, 3, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleAsn1CmsAttributes;", 0x9, 2, 4, -1, -1, -1, -1 },
    { NULL, "[LOrgBouncycastleAsn1CmsAttribute;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleAsn1ASN1Primitive;", 0x1, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithOrgBouncycastleAsn1ASN1Set:);
  methods[1].selector = @selector(initWithOrgBouncycastleAsn1ASN1EncodableVector:);
  methods[2].selector = @selector(getInstanceWithId:);
  methods[3].selector = @selector(getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject:withBoolean:);
  methods[4].selector = @selector(getAttributes);
  methods[5].selector = @selector(toASN1Primitive);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "attributes_", "LOrgBouncycastleAsn1ASN1Set;", .constantValue.asLong = 0, 0x12, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "LOrgBouncycastleAsn1ASN1Set;", "LOrgBouncycastleAsn1ASN1EncodableVector;", "getInstance", "LNSObject;", "LOrgBouncycastleAsn1ASN1TaggedObject;Z" };
  static const J2ObjcClassInfo _OrgBouncycastleAsn1CmsAttributes = { "Attributes", "org.bouncycastle.asn1.cms", ptrTable, methods, fields, 7, 0x1, 6, 1, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleAsn1CmsAttributes;
}

@end


#line 30
void OrgBouncycastleAsn1CmsAttributes_initWithOrgBouncycastleAsn1ASN1Set_(OrgBouncycastleAsn1CmsAttributes *self, OrgBouncycastleAsn1ASN1Set *set) {
  OrgBouncycastleAsn1ASN1Object_init(self);
  self->attributes_ = set;
}


#line 30
OrgBouncycastleAsn1CmsAttributes *new_OrgBouncycastleAsn1CmsAttributes_initWithOrgBouncycastleAsn1ASN1Set_(OrgBouncycastleAsn1ASN1Set *set) {
  J2OBJC_NEW_IMPL(OrgBouncycastleAsn1CmsAttributes, initWithOrgBouncycastleAsn1ASN1Set_, set)
}


#line 30
OrgBouncycastleAsn1CmsAttributes *create_OrgBouncycastleAsn1CmsAttributes_initWithOrgBouncycastleAsn1ASN1Set_(OrgBouncycastleAsn1ASN1Set *set) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleAsn1CmsAttributes, initWithOrgBouncycastleAsn1ASN1Set_, set)
}


#line 35
void OrgBouncycastleAsn1CmsAttributes_initWithOrgBouncycastleAsn1ASN1EncodableVector_(OrgBouncycastleAsn1CmsAttributes *self, OrgBouncycastleAsn1ASN1EncodableVector *v) {
  OrgBouncycastleAsn1ASN1Object_init(self);
  self->attributes_ = new_OrgBouncycastleAsn1DLSet_initWithOrgBouncycastleAsn1ASN1EncodableVector_(v);
}


#line 35
OrgBouncycastleAsn1CmsAttributes *new_OrgBouncycastleAsn1CmsAttributes_initWithOrgBouncycastleAsn1ASN1EncodableVector_(OrgBouncycastleAsn1ASN1EncodableVector *v) {
  J2OBJC_NEW_IMPL(OrgBouncycastleAsn1CmsAttributes, initWithOrgBouncycastleAsn1ASN1EncodableVector_, v)
}


#line 35
OrgBouncycastleAsn1CmsAttributes *create_OrgBouncycastleAsn1CmsAttributes_initWithOrgBouncycastleAsn1ASN1EncodableVector_(OrgBouncycastleAsn1ASN1EncodableVector *v) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleAsn1CmsAttributes, initWithOrgBouncycastleAsn1ASN1EncodableVector_, v)
}


#line 53
OrgBouncycastleAsn1CmsAttributes *OrgBouncycastleAsn1CmsAttributes_getInstanceWithId_(id obj) {
  OrgBouncycastleAsn1CmsAttributes_initialize();
  if ([obj isKindOfClass:[OrgBouncycastleAsn1CmsAttributes class]]) {
    
#line 57
    return (OrgBouncycastleAsn1CmsAttributes *) obj;
  }
  else if (obj != nil) {
    
#line 61
    return new_OrgBouncycastleAsn1CmsAttributes_initWithOrgBouncycastleAsn1ASN1Set_(OrgBouncycastleAsn1ASN1Set_getInstanceWithId_(obj));
  }
  
#line 64
  return nil;
}


#line 67
OrgBouncycastleAsn1CmsAttributes *OrgBouncycastleAsn1CmsAttributes_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(OrgBouncycastleAsn1ASN1TaggedObject *obj, jboolean explicit_) {
  OrgBouncycastleAsn1CmsAttributes_initialize();
  
#line 71
  return OrgBouncycastleAsn1CmsAttributes_getInstanceWithId_(OrgBouncycastleAsn1ASN1Set_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(obj, explicit_));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1CmsAttributes)
