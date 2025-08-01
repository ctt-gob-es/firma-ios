//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/card/icao/WirelessInitializerPin.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "es/gob/jmulticard/HexUtils.h"
#include "es/gob/jmulticard/apdu/iso7816four/pace/MseSetPaceAlgorithmApduCommand.h"
#include "es/gob/jmulticard/card/icao/WirelessInitializerPin.h"
#include "java/lang/IllegalArgumentException.h"

#if !__has_feature(objc_arc)
#error "es/gob/jmulticard/card/icao/WirelessInitializerPin must be compiled with ARC (-fobjc-arc)"
#endif

@interface EsGobJmulticardCardIcaoWirelessInitializerPin () {
 @public
  /*!
   @brief PIN del eMRTD.
   */
  IOSCharArray *pin_;
}

@end

J2OBJC_FIELD_SETTER(EsGobJmulticardCardIcaoWirelessInitializerPin, pin_, IOSCharArray *)

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/card/icao/WirelessInitializerPin.java"


#line 9
@implementation EsGobJmulticardCardIcaoWirelessInitializerPin


#line 16
- (instancetype)initWithCharArray:(IOSCharArray *)personalIdentificationNumber {
  EsGobJmulticardCardIcaoWirelessInitializerPin_initWithCharArray_(self, personalIdentificationNumber);
  return self;
}


#line 23
- (IOSByteArray *)getBytes {
  
#line 25
  return EsGobJmulticardHexUtils_charArrayToByteArrayWithCharArray_(pin_);
}


#line 28
- (NSString *)description {
  
#line 30
  return [NSString java_stringWithCharacters:pin_];
}


#line 33
- (EsGobJmulticardApduIso7816fourPaceMseSetPaceAlgorithmApduCommand_PacePasswordType *)getPasswordType {
  
#line 35
  return JreLoadEnum(EsGobJmulticardApduIso7816fourPaceMseSetPaceAlgorithmApduCommand_PacePasswordType, PIN);
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, 0, -1, -1, -1, -1 },
    { NULL, "[B", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LNSString;", 0x1, 1, -1, -1, -1, -1, -1 },
    { NULL, "LEsGobJmulticardApduIso7816fourPaceMseSetPaceAlgorithmApduCommand_PacePasswordType;", 0x1, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithCharArray:);
  methods[1].selector = @selector(getBytes);
  methods[2].selector = @selector(description);
  methods[3].selector = @selector(getPasswordType);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "pin_", "[C", .constantValue.asLong = 0, 0x12, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "[C", "toString" };
  static const J2ObjcClassInfo _EsGobJmulticardCardIcaoWirelessInitializerPin = { "WirelessInitializerPin", "es.gob.jmulticard.card.icao", ptrTable, methods, fields, 7, 0x11, 4, 1, -1, -1, -1, -1, -1 };
  return &_EsGobJmulticardCardIcaoWirelessInitializerPin;
}

@end


#line 16
void EsGobJmulticardCardIcaoWirelessInitializerPin_initWithCharArray_(EsGobJmulticardCardIcaoWirelessInitializerPin *self, IOSCharArray *personalIdentificationNumber) {
  NSObject_init(self);
  
#line 17
  if (personalIdentificationNumber == nil || personalIdentificationNumber->size_ < 1) {
    @throw new_JavaLangIllegalArgumentException_initWithNSString_(@"El valor del PIN no puede ser nulo ni vacio");
  }
  self->pin_ = personalIdentificationNumber;
}


#line 16
EsGobJmulticardCardIcaoWirelessInitializerPin *new_EsGobJmulticardCardIcaoWirelessInitializerPin_initWithCharArray_(IOSCharArray *personalIdentificationNumber) {
  J2OBJC_NEW_IMPL(EsGobJmulticardCardIcaoWirelessInitializerPin, initWithCharArray_, personalIdentificationNumber)
}


#line 16
EsGobJmulticardCardIcaoWirelessInitializerPin *create_EsGobJmulticardCardIcaoWirelessInitializerPin_initWithCharArray_(IOSCharArray *personalIdentificationNumber) {
  J2OBJC_CREATE_IMPL(EsGobJmulticardCardIcaoWirelessInitializerPin, initWithCharArray_, personalIdentificationNumber)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(EsGobJmulticardCardIcaoWirelessInitializerPin)
