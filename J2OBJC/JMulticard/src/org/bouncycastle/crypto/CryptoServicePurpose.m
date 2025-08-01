//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/crypto/CryptoServicePurpose.java
//

#include "IOSObjectArray.h"
#include "J2ObjC_source.h"
#include "java/lang/Enum.h"
#include "java/lang/IllegalArgumentException.h"
#include "org/bouncycastle/crypto/CryptoServicePurpose.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/crypto/CryptoServicePurpose must be compiled with ARC (-fobjc-arc)"
#endif

__attribute__((unused)) static void OrgBouncycastleCryptoCryptoServicePurpose_initWithNSString_withInt_(OrgBouncycastleCryptoCryptoServicePurpose *self, NSString *__name, jint __ordinal);

__attribute__((unused)) static OrgBouncycastleCryptoCryptoServicePurpose *new_OrgBouncycastleCryptoCryptoServicePurpose_initWithNSString_withInt_(NSString *__name, jint __ordinal) NS_RETURNS_RETAINED;

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/crypto/CryptoServicePurpose.java"

J2OBJC_INITIALIZED_DEFN(OrgBouncycastleCryptoCryptoServicePurpose)

OrgBouncycastleCryptoCryptoServicePurpose *OrgBouncycastleCryptoCryptoServicePurpose_values_[10];


#line 3
@implementation OrgBouncycastleCryptoCryptoServicePurpose

+ (IOSObjectArray *)values {
  return OrgBouncycastleCryptoCryptoServicePurpose_values();
}

+ (OrgBouncycastleCryptoCryptoServicePurpose *)valueOfWithNSString:(NSString *)name {
  return OrgBouncycastleCryptoCryptoServicePurpose_valueOfWithNSString_(name);
}

- (OrgBouncycastleCryptoCryptoServicePurpose_Enum)toNSEnum {
  return (OrgBouncycastleCryptoCryptoServicePurpose_Enum)[self ordinal];
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, "[LOrgBouncycastleCryptoCryptoServicePurpose;", 0x9, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleCryptoCryptoServicePurpose;", 0x9, 0, 1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(values);
  methods[1].selector = @selector(valueOfWithNSString:);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "AGREEMENT", "LOrgBouncycastleCryptoCryptoServicePurpose;", .constantValue.asLong = 0, 0x4019, -1, 2, -1, -1 },
    { "ENCRYPTION", "LOrgBouncycastleCryptoCryptoServicePurpose;", .constantValue.asLong = 0, 0x4019, -1, 3, -1, -1 },
    { "DECRYPTION", "LOrgBouncycastleCryptoCryptoServicePurpose;", .constantValue.asLong = 0, 0x4019, -1, 4, -1, -1 },
    { "KEYGEN", "LOrgBouncycastleCryptoCryptoServicePurpose;", .constantValue.asLong = 0, 0x4019, -1, 5, -1, -1 },
    { "SIGNING", "LOrgBouncycastleCryptoCryptoServicePurpose;", .constantValue.asLong = 0, 0x4019, -1, 6, -1, -1 },
    { "VERIFYING", "LOrgBouncycastleCryptoCryptoServicePurpose;", .constantValue.asLong = 0, 0x4019, -1, 7, -1, -1 },
    { "AUTHENTICATION", "LOrgBouncycastleCryptoCryptoServicePurpose;", .constantValue.asLong = 0, 0x4019, -1, 8, -1, -1 },
    { "VERIFICATION", "LOrgBouncycastleCryptoCryptoServicePurpose;", .constantValue.asLong = 0, 0x4019, -1, 9, -1, -1 },
    { "PRF", "LOrgBouncycastleCryptoCryptoServicePurpose;", .constantValue.asLong = 0, 0x4019, -1, 10, -1, -1 },
    { "ANY", "LOrgBouncycastleCryptoCryptoServicePurpose;", .constantValue.asLong = 0, 0x4019, -1, 11, -1, -1 },
  };
  static const void *ptrTable[] = { "valueOf", "LNSString;", &JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, AGREEMENT), &JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, ENCRYPTION), &JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, DECRYPTION), &JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, KEYGEN), &JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, SIGNING), &JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, VERIFYING), &JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, AUTHENTICATION), &JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, VERIFICATION), &JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, PRF), &JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, ANY), "Ljava/lang/Enum<Lorg/bouncycastle/crypto/CryptoServicePurpose;>;" };
  static const J2ObjcClassInfo _OrgBouncycastleCryptoCryptoServicePurpose = { "CryptoServicePurpose", "org.bouncycastle.crypto", ptrTable, methods, fields, 7, 0x4011, 2, 10, -1, -1, -1, 12, -1 };
  return &_OrgBouncycastleCryptoCryptoServicePurpose;
}

+ (void)initialize {
  if (self == [OrgBouncycastleCryptoCryptoServicePurpose class]) {
    JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, AGREEMENT) = new_OrgBouncycastleCryptoCryptoServicePurpose_initWithNSString_withInt_(JreEnumConstantName(OrgBouncycastleCryptoCryptoServicePurpose_class_(), 0), 0);
    JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, ENCRYPTION) = new_OrgBouncycastleCryptoCryptoServicePurpose_initWithNSString_withInt_(JreEnumConstantName(OrgBouncycastleCryptoCryptoServicePurpose_class_(), 1), 1);
    JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, DECRYPTION) = new_OrgBouncycastleCryptoCryptoServicePurpose_initWithNSString_withInt_(JreEnumConstantName(OrgBouncycastleCryptoCryptoServicePurpose_class_(), 2), 2);
    JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, KEYGEN) = new_OrgBouncycastleCryptoCryptoServicePurpose_initWithNSString_withInt_(JreEnumConstantName(OrgBouncycastleCryptoCryptoServicePurpose_class_(), 3), 3);
    JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, SIGNING) = new_OrgBouncycastleCryptoCryptoServicePurpose_initWithNSString_withInt_(JreEnumConstantName(OrgBouncycastleCryptoCryptoServicePurpose_class_(), 4), 4);
    JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, VERIFYING) = new_OrgBouncycastleCryptoCryptoServicePurpose_initWithNSString_withInt_(JreEnumConstantName(OrgBouncycastleCryptoCryptoServicePurpose_class_(), 5), 5);
    JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, AUTHENTICATION) = new_OrgBouncycastleCryptoCryptoServicePurpose_initWithNSString_withInt_(JreEnumConstantName(OrgBouncycastleCryptoCryptoServicePurpose_class_(), 6), 6);
    JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, VERIFICATION) = new_OrgBouncycastleCryptoCryptoServicePurpose_initWithNSString_withInt_(JreEnumConstantName(OrgBouncycastleCryptoCryptoServicePurpose_class_(), 7), 7);
    JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, PRF) = new_OrgBouncycastleCryptoCryptoServicePurpose_initWithNSString_withInt_(JreEnumConstantName(OrgBouncycastleCryptoCryptoServicePurpose_class_(), 8), 8);
    JreEnum(OrgBouncycastleCryptoCryptoServicePurpose, ANY) = new_OrgBouncycastleCryptoCryptoServicePurpose_initWithNSString_withInt_(JreEnumConstantName(OrgBouncycastleCryptoCryptoServicePurpose_class_(), 9), 9);
    J2OBJC_SET_INITIALIZED(OrgBouncycastleCryptoCryptoServicePurpose)
  }
}

@end


#line 3
void OrgBouncycastleCryptoCryptoServicePurpose_initWithNSString_withInt_(OrgBouncycastleCryptoCryptoServicePurpose *self, NSString *__name, jint __ordinal) {
  JavaLangEnum_initWithNSString_withInt_(self, __name, __ordinal);
}


#line 3
OrgBouncycastleCryptoCryptoServicePurpose *new_OrgBouncycastleCryptoCryptoServicePurpose_initWithNSString_withInt_(NSString *__name, jint __ordinal) {
  J2OBJC_NEW_IMPL(OrgBouncycastleCryptoCryptoServicePurpose, initWithNSString_withInt_, __name, __ordinal)
}

IOSObjectArray *OrgBouncycastleCryptoCryptoServicePurpose_values() {
  OrgBouncycastleCryptoCryptoServicePurpose_initialize();
  return [IOSObjectArray arrayWithObjects:OrgBouncycastleCryptoCryptoServicePurpose_values_ count:10 type:OrgBouncycastleCryptoCryptoServicePurpose_class_()];
}

OrgBouncycastleCryptoCryptoServicePurpose *OrgBouncycastleCryptoCryptoServicePurpose_valueOfWithNSString_(NSString *name) {
  OrgBouncycastleCryptoCryptoServicePurpose_initialize();
  for (int i = 0; i < 10; i++) {
    OrgBouncycastleCryptoCryptoServicePurpose *e = OrgBouncycastleCryptoCryptoServicePurpose_values_[i];
    if ([name isEqual:[e name]]) {
      return e;
    }
  }
  @throw create_JavaLangIllegalArgumentException_initWithNSString_(name);
  return nil;
}

OrgBouncycastleCryptoCryptoServicePurpose *OrgBouncycastleCryptoCryptoServicePurpose_fromOrdinal(NSUInteger ordinal) {
  OrgBouncycastleCryptoCryptoServicePurpose_initialize();
  if (ordinal >= 10) {
    return nil;
  }
  return OrgBouncycastleCryptoCryptoServicePurpose_values_[ordinal];
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleCryptoCryptoServicePurpose)
