//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/apdu/iso7816four/MseSetComputationApduCommand.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "es/gob/jmulticard/apdu/iso7816four/MseSetApduCommand.h"
#include "es/gob/jmulticard/apdu/iso7816four/MseSetComputationApduCommand.h"
#include "es/gob/jmulticard/asn1/Tlv.h"
#include "java/io/ByteArrayOutputStream.h"
#include "java/lang/Exception.h"
#include "java/lang/IllegalArgumentException.h"
#include "java/lang/IllegalStateException.h"

#if !__has_feature(objc_arc)
#error "es/gob/jmulticard/apdu/iso7816four/MseSetComputationApduCommand must be compiled with ARC (-fobjc-arc)"
#endif

@interface EsGobJmulticardApduIso7816fourMseSetComputationApduCommand ()

+ (IOSByteArray *)createDstWithByteArray:(IOSByteArray *)privateKeyReference
                           withByteArray:(IOSByteArray *)algorithmReference;

@end

__attribute__((unused)) static IOSByteArray *EsGobJmulticardApduIso7816fourMseSetComputationApduCommand_createDstWithByteArray_withByteArray_(IOSByteArray *privateKeyReference, IOSByteArray *algorithmReference);

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/apdu/iso7816four/MseSetComputationApduCommand.java"


#line 10
@implementation EsGobJmulticardApduIso7816fourMseSetComputationApduCommand


#line 17
- (instancetype)initWithByte:(jbyte)cla
               withByteArray:(IOSByteArray *)privateKeyReference
               withByteArray:(IOSByteArray *)algorithmReference {
  EsGobJmulticardApduIso7816fourMseSetComputationApduCommand_initWithByte_withByteArray_withByteArray_(self, cla, privateKeyReference, algorithmReference);
  return self;
}


#line 28
+ (IOSByteArray *)createDstWithByteArray:(IOSByteArray *)privateKeyReference
                           withByteArray:(IOSByteArray *)algorithmReference {
  return EsGobJmulticardApduIso7816fourMseSetComputationApduCommand_createDstWithByteArray_withByteArray_(privateKeyReference, algorithmReference);
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, 0, -1, -1, -1, -1 },
    { NULL, "[B", 0xa, 1, 2, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithByte:withByteArray:withByteArray:);
  methods[1].selector = @selector(createDstWithByteArray:withByteArray:);
  #pragma clang diagnostic pop
  static const void *ptrTable[] = { "B[B[B", "createDst", "[B[B" };
  static const J2ObjcClassInfo _EsGobJmulticardApduIso7816fourMseSetComputationApduCommand = { "MseSetComputationApduCommand", "es.gob.jmulticard.apdu.iso7816four", ptrTable, methods, NULL, 7, 0x11, 2, 0, -1, -1, -1, -1, -1 };
  return &_EsGobJmulticardApduIso7816fourMseSetComputationApduCommand;
}

@end


#line 17
void EsGobJmulticardApduIso7816fourMseSetComputationApduCommand_initWithByte_withByteArray_withByteArray_(EsGobJmulticardApduIso7816fourMseSetComputationApduCommand *self, jbyte cla, IOSByteArray *privateKeyReference, IOSByteArray *algorithmReference) {
  EsGobJmulticardApduIso7816fourMseSetApduCommand_initPackagePrivateWithByte_withByte_withByte_withByteArray_(self,
#line 21
  cla, EsGobJmulticardApduIso7816fourMseSetApduCommand_SET_FOR_COMPUTATION, EsGobJmulticardApduIso7816fourMseSetApduCommand_DST, EsGobJmulticardApduIso7816fourMseSetComputationApduCommand_createDstWithByteArray_withByteArray_(
#line 24
  privateKeyReference, algorithmReference));
}


#line 17
EsGobJmulticardApduIso7816fourMseSetComputationApduCommand *new_EsGobJmulticardApduIso7816fourMseSetComputationApduCommand_initWithByte_withByteArray_withByteArray_(jbyte cla, IOSByteArray *privateKeyReference, IOSByteArray *algorithmReference) {
  J2OBJC_NEW_IMPL(EsGobJmulticardApduIso7816fourMseSetComputationApduCommand, initWithByte_withByteArray_withByteArray_, cla, privateKeyReference, algorithmReference)
}


#line 17
EsGobJmulticardApduIso7816fourMseSetComputationApduCommand *create_EsGobJmulticardApduIso7816fourMseSetComputationApduCommand_initWithByte_withByteArray_withByteArray_(jbyte cla, IOSByteArray *privateKeyReference, IOSByteArray *algorithmReference) {
  J2OBJC_CREATE_IMPL(EsGobJmulticardApduIso7816fourMseSetComputationApduCommand, initWithByte_withByteArray_withByteArray_, cla, privateKeyReference, algorithmReference)
}


#line 28
IOSByteArray *EsGobJmulticardApduIso7816fourMseSetComputationApduCommand_createDstWithByteArray_withByteArray_(IOSByteArray *privateKeyReference, IOSByteArray *algorithmReference) {
  EsGobJmulticardApduIso7816fourMseSetComputationApduCommand_initialize();
  
#line 31
  if (privateKeyReference == nil) {
    @throw new_JavaLangIllegalArgumentException_initWithNSString_(
#line 33
    @"La referencia a la clave privada no puede ser nula");
  }
  
#line 37
  EsGobJmulticardAsn1Tlv *prkRefTlv = new_EsGobJmulticardAsn1Tlv_initWithByte_withByteArray_(EsGobJmulticardApduIso7816fourMseSetApduCommand_PRIVATE_KEY_REFERENCE, privateKeyReference);
  EsGobJmulticardAsn1Tlv *algRefTlv = nil;
  if (algorithmReference != nil) {
    algRefTlv = new_EsGobJmulticardAsn1Tlv_initWithByte_withByteArray_(EsGobJmulticardApduIso7816fourMseSetApduCommand_ALGORITHM_REFERENCE, algorithmReference);
  }
  
#line 43
  JavaIoByteArrayOutputStream *dstData = new_JavaIoByteArrayOutputStream_init();
  @try {
    [dstData writeWithByteArray:[prkRefTlv getBytes]];
    if (algRefTlv != nil) {
      [dstData writeWithByteArray:[algRefTlv getBytes]];
    }
  }
  @catch (JavaLangException *e) {
    @throw new_JavaLangIllegalStateException_initWithNSString_withJavaLangThrowable_(
#line 52
    @"Error creando el cuerpo del DST", e);
  }
  
#line 55
  return [dstData toByteArray];
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(EsGobJmulticardApduIso7816fourMseSetComputationApduCommand)
