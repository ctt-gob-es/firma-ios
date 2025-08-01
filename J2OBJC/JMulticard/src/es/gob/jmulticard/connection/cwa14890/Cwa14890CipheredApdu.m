//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/connection/cwa14890/Cwa14890CipheredApdu.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "es/gob/jmulticard/apdu/CommandApdu.h"
#include "es/gob/jmulticard/connection/cwa14890/Cwa14890CipheredApdu.h"
#include "java/io/ByteArrayOutputStream.h"
#include "java/lang/Exception.h"
#include "java/lang/IllegalArgumentException.h"
#include "java/lang/IllegalStateException.h"
#include "java/lang/System.h"
#include "java/lang/UnsupportedOperationException.h"

#if !__has_feature(objc_arc)
#error "es/gob/jmulticard/connection/cwa14890/Cwa14890CipheredApdu must be compiled with ARC (-fobjc-arc)"
#endif

@interface EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu () {
 @public
  IOSByteArray *mac_;
  IOSByteArray *data_;
}

+ (IOSByteArray *)buildDataWithByteArray:(IOSByteArray *)data
                           withByteArray:(IOSByteArray *)mac;

@end

J2OBJC_FIELD_SETTER(EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu, mac_, IOSByteArray *)
J2OBJC_FIELD_SETTER(EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu, data_, IOSByteArray *)

inline jbyte EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu_get_TAG_CRYPTOGRAPHIC_CHECKSUM(void);
#define EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu_TAG_CRYPTOGRAPHIC_CHECKSUM -114
J2OBJC_STATIC_FIELD_CONSTANT(EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu, TAG_CRYPTOGRAPHIC_CHECKSUM, jbyte)

__attribute__((unused)) static IOSByteArray *EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu_buildDataWithByteArray_withByteArray_(IOSByteArray *data, IOSByteArray *mac);

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/connection/cwa14890/Cwa14890CipheredApdu.java"


#line 50
@implementation EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu


#line 57
- (IOSByteArray *)getMac {
  IOSByteArray *out = [IOSByteArray newArrayWithLength:((IOSByteArray *) nil_chk(mac_))->size_];
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(mac_, 0, out, 0, mac_->size_);
  return out;
}

- (IOSByteArray *)getCryptogramData {
  IOSByteArray *out = [IOSByteArray newArrayWithLength:((IOSByteArray *) nil_chk(data_))->size_];
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(data_, 0, out, 0, data_->size_);
  return out;
}


#line 76
- (instancetype)initWithByte:(jbyte)cla
                    withByte:(jbyte)ins
                    withByte:(jbyte)p1
                    withByte:(jbyte)p2
               withByteArray:(IOSByteArray *)apduData
               withByteArray:(IOSByteArray *)apduMac {
  EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu_initWithByte_withByte_withByte_withByte_withByteArray_withByteArray_(self, cla, ins, p1, p2, apduData, apduMac);
  return self;
}


#line 96
+ (IOSByteArray *)buildDataWithByteArray:(IOSByteArray *)data
                           withByteArray:(IOSByteArray *)mac {
  return EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu_buildDataWithByteArray_withByteArray_(data, mac);
}


#line 120
- (void)setLeWithInt:(jint)le {
  
#line 122
  @throw new_JavaLangUnsupportedOperationException_initWithNSString_(@"No se puede establecer el Le en una APDU cifrada");
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, "[B", 0x0, -1, -1, -1, -1, -1, -1 },
    { NULL, "[B", 0x0, -1, -1, -1, -1, -1, -1 },
    { NULL, NULL, 0x0, -1, 0, -1, -1, -1, -1 },
    { NULL, "[B", 0xa, 1, 2, -1, -1, -1, -1 },
    { NULL, "V", 0x1, 3, 4, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(getMac);
  methods[1].selector = @selector(getCryptogramData);
  methods[2].selector = @selector(initWithByte:withByte:withByte:withByte:withByteArray:withByteArray:);
  methods[3].selector = @selector(buildDataWithByteArray:withByteArray:);
  methods[4].selector = @selector(setLeWithInt:);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "TAG_CRYPTOGRAPHIC_CHECKSUM", "B", .constantValue.asChar = EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu_TAG_CRYPTOGRAPHIC_CHECKSUM, 0x1a, -1, -1, -1, -1 },
    { "mac_", "[B", .constantValue.asLong = 0, 0x12, -1, -1, -1, -1 },
    { "data_", "[B", .constantValue.asLong = 0, 0x12, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "BBBB[B[B", "buildData", "[B[B", "setLe", "I" };
  static const J2ObjcClassInfo _EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu = { "Cwa14890CipheredApdu", "es.gob.jmulticard.connection.cwa14890", ptrTable, methods, fields, 7, 0x11, 5, 3, -1, -1, -1, -1, -1 };
  return &_EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu;
}

@end


#line 76
void EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu_initWithByte_withByte_withByte_withByte_withByteArray_withByteArray_(EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu *self, jbyte cla, jbyte ins, jbyte p1, jbyte p2, IOSByteArray *apduData, IOSByteArray *apduMac) {
  EsGobJmulticardApduCommandApdu_initWithByte_withByte_withByte_withByte_withByteArray_withJavaLangInteger_(self,
#line 83
  cla,
#line 84
  ins,
#line 85
  p1,
#line 86
  p2, EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu_buildDataWithByteArray_withByteArray_(
#line 87
  apduData, apduMac),
#line 88
  nil);
  
#line 90
  self->mac_ = [IOSByteArray newArrayWithLength:((IOSByteArray *) nil_chk(apduMac))->size_];
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(apduMac, 0, self->mac_, 0, apduMac->size_);
  self->data_ = [IOSByteArray newArrayWithLength:((IOSByteArray *) nil_chk(apduData))->size_];
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(apduData, 0, self->data_, 0, apduData->size_);
}


#line 76
EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu *new_EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu_initWithByte_withByte_withByte_withByte_withByteArray_withByteArray_(jbyte cla, jbyte ins, jbyte p1, jbyte p2, IOSByteArray *apduData, IOSByteArray *apduMac) {
  J2OBJC_NEW_IMPL(EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu, initWithByte_withByte_withByte_withByte_withByteArray_withByteArray_, cla, ins, p1, p2, apduData, apduMac)
}


#line 76
EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu *create_EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu_initWithByte_withByte_withByte_withByte_withByteArray_withByteArray_(jbyte cla, jbyte ins, jbyte p1, jbyte p2, IOSByteArray *apduData, IOSByteArray *apduMac) {
  J2OBJC_CREATE_IMPL(EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu, initWithByte_withByte_withByte_withByte_withByteArray_withByteArray_, cla, ins, p1, p2, apduData, apduMac)
}


#line 96
IOSByteArray *EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu_buildDataWithByteArray_withByteArray_(IOSByteArray *data, IOSByteArray *mac) {
  EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu_initialize();
  
#line 97
  if (data == nil || mac == nil) {
    @throw new_JavaLangIllegalArgumentException_initWithNSString_(@"Ni los datos (TLV) ni el MAC pueden ser nulos");
  }
  if (mac->size_ != 4 && mac->size_ != 8) {
    @throw new_JavaLangIllegalArgumentException_initWithNSString_(JreStrcat("$I$", @"El MAC debe medir cuatro u ocho octetos, y el recibido mide ",
#line 102
    mac->size_, @" octetos"));
  }
  
#line 105
  JavaIoByteArrayOutputStream *baos = new_JavaIoByteArrayOutputStream_init();
  @try {
    [baos writeWithByteArray:data];
    [baos writeWithInt:EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu_TAG_CRYPTOGRAPHIC_CHECKSUM];
    [baos writeWithInt:(jbyte) mac->size_];
    [baos writeWithByteArray:mac];
  }
  @catch (JavaLangException *e) {
    @throw new_JavaLangIllegalStateException_initWithNSString_withJavaLangThrowable_(
#line 114
    @"Error creando la APDU cifrada", e);
  }
  
#line 117
  return [baos toByteArray];
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(EsGobJmulticardConnectionCwa14890Cwa14890CipheredApdu)
