//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/connection/ApduEncrypterDesMac8.java
//

#include "J2ObjC_source.h"
#include "es/gob/jmulticard/connection/ApduEncrypterDes.h"
#include "es/gob/jmulticard/connection/ApduEncrypterDesMac8.h"

#if !__has_feature(objc_arc)
#error "es/gob/jmulticard/connection/ApduEncrypterDesMac8 must be compiled with ARC (-fobjc-arc)"
#endif

/*!
 @brief Longitud de la MAC de las APDU cifradas.
 */
inline jbyte EsGobJmulticardConnectionApduEncrypterDesMac8_get_MAC_LENGTH_8(void);
#define EsGobJmulticardConnectionApduEncrypterDesMac8_MAC_LENGTH_8 8
J2OBJC_STATIC_FIELD_CONSTANT(EsGobJmulticardConnectionApduEncrypterDesMac8, MAC_LENGTH_8, jbyte)

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/connection/ApduEncrypterDesMac8.java"


#line 45
@implementation EsGobJmulticardConnectionApduEncrypterDesMac8

J2OBJC_IGNORE_DESIGNATED_BEGIN

#line 45
- (instancetype)init {
  EsGobJmulticardConnectionApduEncrypterDesMac8_init(self);
  return self;
}
J2OBJC_IGNORE_DESIGNATED_END


#line 50
- (jint)getMacLength {
  
#line 52
  return EsGobJmulticardConnectionApduEncrypterDesMac8_MAC_LENGTH_8;
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "I", 0x4, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(init);
  methods[1].selector = @selector(getMacLength);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "MAC_LENGTH_8", "B", .constantValue.asChar = EsGobJmulticardConnectionApduEncrypterDesMac8_MAC_LENGTH_8, 0x1a, -1, -1, -1, -1 },
  };
  static const J2ObjcClassInfo _EsGobJmulticardConnectionApduEncrypterDesMac8 = { "ApduEncrypterDesMac8", "es.gob.jmulticard.connection", NULL, methods, fields, 7, 0x11, 2, 1, -1, -1, -1, -1, -1 };
  return &_EsGobJmulticardConnectionApduEncrypterDesMac8;
}

@end


#line 45
void EsGobJmulticardConnectionApduEncrypterDesMac8_init(EsGobJmulticardConnectionApduEncrypterDesMac8 *self) {
  EsGobJmulticardConnectionApduEncrypterDes_init(self);
}


#line 45
EsGobJmulticardConnectionApduEncrypterDesMac8 *new_EsGobJmulticardConnectionApduEncrypterDesMac8_init() {
  J2OBJC_NEW_IMPL(EsGobJmulticardConnectionApduEncrypterDesMac8, init)
}


#line 45
EsGobJmulticardConnectionApduEncrypterDesMac8 *create_EsGobJmulticardConnectionApduEncrypterDesMac8_init() {
  J2OBJC_CREATE_IMPL(EsGobJmulticardConnectionApduEncrypterDesMac8, init)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(EsGobJmulticardConnectionApduEncrypterDesMac8)
