//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/apdu/iso7816four/SelectDfByNameApduCommand.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "es/gob/jmulticard/apdu/CommandApdu.h"
#include "es/gob/jmulticard/apdu/iso7816four/SelectDfByNameApduCommand.h"

#if !__has_feature(objc_arc)
#error "es/gob/jmulticard/apdu/iso7816four/SelectDfByNameApduCommand must be compiled with ARC (-fobjc-arc)"
#endif

/*!
 @brief Instrucci&oacute;n <i>Select File</i> de ISO 7816-4.
 */
inline jbyte EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand_get_INS_SELECT_FILE(void);
#define EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand_INS_SELECT_FILE -92
J2OBJC_STATIC_FIELD_CONSTANT(EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand, INS_SELECT_FILE, jbyte)

inline jbyte EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand_get_SELECT_DF_BY_NAME(void);
#define EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand_SELECT_DF_BY_NAME 4
J2OBJC_STATIC_FIELD_CONSTANT(EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand, SELECT_DF_BY_NAME, jbyte)

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/apdu/iso7816four/SelectDfByNameApduCommand.java"


#line 47
@implementation EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand


#line 57
- (instancetype)initWithByte:(jbyte)cla
               withByteArray:(IOSByteArray *)name {
  EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand_initWithByte_withByteArray_(self, cla, name);
  return self;
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, 0, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithByte:withByteArray:);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "INS_SELECT_FILE", "B", .constantValue.asChar = EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand_INS_SELECT_FILE, 0x1a, -1, -1, -1, -1 },
    { "SELECT_DF_BY_NAME", "B", .constantValue.asChar = EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand_SELECT_DF_BY_NAME, 0x1a, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "B[B" };
  static const J2ObjcClassInfo _EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand = { "SelectDfByNameApduCommand", "es.gob.jmulticard.apdu.iso7816four", ptrTable, methods, fields, 7, 0x11, 1, 2, -1, -1, -1, -1, -1 };
  return &_EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand;
}

@end


#line 57
void EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand_initWithByte_withByteArray_(EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand *self, jbyte cla, IOSByteArray *name) {
  EsGobJmulticardApduCommandApdu_initWithByte_withByte_withByte_withByte_withByteArray_withJavaLangInteger_(self,
#line 59
  cla,
#line 60
  EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand_INS_SELECT_FILE,
#line 61
  EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand_SELECT_DF_BY_NAME,
#line 62
  (jbyte) (jint) 0x00,
#line 63
  name,
#line 64
  nil);
}


#line 57
EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand *new_EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand_initWithByte_withByteArray_(jbyte cla, IOSByteArray *name) {
  J2OBJC_NEW_IMPL(EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand, initWithByte_withByteArray_, cla, name)
}


#line 57
EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand *create_EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand_initWithByte_withByteArray_(jbyte cla, IOSByteArray *name) {
  J2OBJC_CREATE_IMPL(EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand, initWithByte_withByteArray_, cla, name)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand)
