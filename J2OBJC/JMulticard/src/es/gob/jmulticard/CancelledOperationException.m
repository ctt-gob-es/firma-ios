//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/CancelledOperationException.java
//

#include "J2ObjC_source.h"
#include "es/gob/jmulticard/CancelledOperationException.h"
#include "java/lang/RuntimeException.h"

#if !__has_feature(objc_arc)
#error "es/gob/jmulticard/CancelledOperationException must be compiled with ARC (-fobjc-arc)"
#endif

/*!
 @brief Identificador de versi&oacute;n para la serializaci&oacute;n.
 */
inline jlong EsGobJmulticardCancelledOperationException_get_serialVersionUID(void);
#define EsGobJmulticardCancelledOperationException_serialVersionUID 4447842480432712246LL
J2OBJC_STATIC_FIELD_CONSTANT(EsGobJmulticardCancelledOperationException, serialVersionUID, jlong)

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/CancelledOperationException.java"


#line 46
@implementation EsGobJmulticardCancelledOperationException


#line 53
- (instancetype)initWithNSString:(NSString *)msg {
  EsGobJmulticardCancelledOperationException_initWithNSString_(self, msg);
  return self;
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, 0, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithNSString:);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "serialVersionUID", "J", .constantValue.asLong = EsGobJmulticardCancelledOperationException_serialVersionUID, 0x1a, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "LNSString;" };
  static const J2ObjcClassInfo _EsGobJmulticardCancelledOperationException = { "CancelledOperationException", "es.gob.jmulticard", ptrTable, methods, fields, 7, 0x11, 1, 1, -1, -1, -1, -1, -1 };
  return &_EsGobJmulticardCancelledOperationException;
}

@end


#line 53
void EsGobJmulticardCancelledOperationException_initWithNSString_(EsGobJmulticardCancelledOperationException *self, NSString *msg) {
  JavaLangRuntimeException_initWithNSString_(self, msg);
}


#line 53
EsGobJmulticardCancelledOperationException *new_EsGobJmulticardCancelledOperationException_initWithNSString_(NSString *msg) {
  J2OBJC_NEW_IMPL(EsGobJmulticardCancelledOperationException, initWithNSString_, msg)
}


#line 53
EsGobJmulticardCancelledOperationException *create_EsGobJmulticardCancelledOperationException_initWithNSString_(NSString *msg) {
  J2OBJC_CREATE_IMPL(EsGobJmulticardCancelledOperationException, initWithNSString_, msg)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(EsGobJmulticardCancelledOperationException)
