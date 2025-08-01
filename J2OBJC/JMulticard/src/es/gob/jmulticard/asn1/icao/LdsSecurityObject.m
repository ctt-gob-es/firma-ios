//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/asn1/icao/LdsSecurityObject.java
//

#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "es/gob/jmulticard/HexUtils.h"
#include "es/gob/jmulticard/asn1/DecoderObject.h"
#include "es/gob/jmulticard/asn1/OptionalDecoderObjectElement.h"
#include "es/gob/jmulticard/asn1/der/DerInteger.h"
#include "es/gob/jmulticard/asn1/der/Sequence.h"
#include "es/gob/jmulticard/asn1/der/x509/AlgorithmIdentifier.h"
#include "es/gob/jmulticard/asn1/icao/DataGroupHash.h"
#include "es/gob/jmulticard/asn1/icao/DataGroupHashValues.h"
#include "es/gob/jmulticard/asn1/icao/LdsSecurityObject.h"
#include "java/lang/StringBuilder.h"

#if !__has_feature(objc_arc)
#error "es/gob/jmulticard/asn1/icao/LdsSecurityObject must be compiled with ARC (-fobjc-arc)"
#endif

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/asn1/icao/LdsSecurityObject.java"


#line 33
@implementation EsGobJmulticardAsn1IcaoLdsSecurityObject

J2OBJC_IGNORE_DESIGNATED_BEGIN
- (instancetype)init {
  EsGobJmulticardAsn1IcaoLdsSecurityObject_init(self);
  return self;
}
J2OBJC_IGNORE_DESIGNATED_END


#line 57
- (NSString *)description {
  
#line 59
  JavaLangStringBuilder *ret = new_JavaLangStringBuilder_initWithNSString_(@"LDSSecurityObject V");
  (void) [ret appendWithId:[self getElementAtWithInt:0]];
  (void) [ret appendWithNSString:@" con huellas para el algoritmo "];
  (void) [ret appendWithId:[self getElementAtWithInt:1]];
  (void) [ret appendWithNSString:@" y con el siguiente contenido:"];
  
#line 65
  EsGobJmulticardAsn1IcaoDataGroupHashValues *dghv = (EsGobJmulticardAsn1IcaoDataGroupHashValues *) cast_chk([self getElementAtWithInt:2], [EsGobJmulticardAsn1IcaoDataGroupHashValues class]);
  {
    IOSObjectArray *a__ =
#line 66
    [((EsGobJmulticardAsn1IcaoDataGroupHashValues *) nil_chk(dghv)) getDataGroupsHashes];
    EsGobJmulticardAsn1IcaoDataGroupHash * const *b__ = ((IOSObjectArray *) nil_chk(a__))->buffer_;
    EsGobJmulticardAsn1IcaoDataGroupHash * const *e__ = b__ + a__->size_;
    while (b__ < e__) {
      EsGobJmulticardAsn1IcaoDataGroupHash *dgh = *b__++;
      
#line 67
      (void) [ret appendWithNSString:@"\n  DG"];
      (void) [ret appendWithInt:[((EsGobJmulticardAsn1IcaoDataGroupHash *) nil_chk(dgh)) getDataGroupNumber]];
      (void) [ret appendWithNSString:@" con huella "];
      (void) [ret appendWithNSString:EsGobJmulticardHexUtils_hexifyWithByteArray_withBoolean_([dgh getDataGroupHashValue], false)];
    }
  }
  
#line 72
  return [ret description];
}


#line 78
- (NSString *)getDigestAlgorithm {
  return [((EsGobJmulticardAsn1DecoderObject *) nil_chk([self getElementAtWithInt:1])) description];
}


#line 84
- (IOSObjectArray *)getDataGroupHashes {
  return [((EsGobJmulticardAsn1IcaoDataGroupHashValues *) nil_chk(((EsGobJmulticardAsn1IcaoDataGroupHashValues *) cast_chk([self getElementAtWithInt:2], [EsGobJmulticardAsn1IcaoDataGroupHashValues class])))) getDataGroupsHashes];
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LNSString;", 0x1, 0, -1, -1, -1, -1, -1 },
    { NULL, "LNSString;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "[LEsGobJmulticardAsn1IcaoDataGroupHash;", 0x1, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(init);
  methods[1].selector = @selector(description);
  methods[2].selector = @selector(getDigestAlgorithm);
  methods[3].selector = @selector(getDataGroupHashes);
  #pragma clang diagnostic pop
  static const void *ptrTable[] = { "toString" };
  static const J2ObjcClassInfo _EsGobJmulticardAsn1IcaoLdsSecurityObject = { "LdsSecurityObject", "es.gob.jmulticard.asn1.icao", ptrTable, methods, NULL, 7, 0x11, 4, 0, -1, -1, -1, -1, -1 };
  return &_EsGobJmulticardAsn1IcaoLdsSecurityObject;
}

@end


#line 36
void EsGobJmulticardAsn1IcaoLdsSecurityObject_init(EsGobJmulticardAsn1IcaoLdsSecurityObject *self) {
  EsGobJmulticardAsn1DerSequence_initWithEsGobJmulticardAsn1OptionalDecoderObjectElementArray_(self, [IOSObjectArray newArrayWithObjects:(id[]){ create_EsGobJmulticardAsn1OptionalDecoderObjectElement_initWithIOSClass_withBoolean_(
#line 39
  EsGobJmulticardAsn1DerDerInteger_class_(),
#line 40
  false), create_EsGobJmulticardAsn1OptionalDecoderObjectElement_initWithIOSClass_withBoolean_(
#line 43
  EsGobJmulticardAsn1DerX509AlgorithmIdentifier_class_(),
#line 44
  false), create_EsGobJmulticardAsn1OptionalDecoderObjectElement_initWithIOSClass_withBoolean_(
#line 47
  EsGobJmulticardAsn1IcaoDataGroupHashValues_class_(),
#line 48
  false), create_EsGobJmulticardAsn1OptionalDecoderObjectElement_initWithIOSClass_withBoolean_(
#line 51
  EsGobJmulticardAsn1DerSequence_class_(),
#line 52
  true) } count:4 type:EsGobJmulticardAsn1OptionalDecoderObjectElement_class_()]);
}


#line 36
EsGobJmulticardAsn1IcaoLdsSecurityObject *new_EsGobJmulticardAsn1IcaoLdsSecurityObject_init() {
  J2OBJC_NEW_IMPL(EsGobJmulticardAsn1IcaoLdsSecurityObject, init)
}


#line 36
EsGobJmulticardAsn1IcaoLdsSecurityObject *create_EsGobJmulticardAsn1IcaoLdsSecurityObject_init() {
  J2OBJC_CREATE_IMPL(EsGobJmulticardAsn1IcaoLdsSecurityObject, init)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(EsGobJmulticardAsn1IcaoLdsSecurityObject)
