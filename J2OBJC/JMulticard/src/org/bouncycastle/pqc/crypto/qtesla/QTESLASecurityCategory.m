//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/qtesla/QTESLASecurityCategory.java
//

#include "J2ObjC_source.h"
#include "java/lang/IllegalArgumentException.h"
#include "org/bouncycastle/pqc/crypto/qtesla/QTESLASecurityCategory.h"
#include "org/bouncycastle/pqc/crypto/qtesla/QTesla1p.h"
#include "org/bouncycastle/pqc/crypto/qtesla/QTesla3p.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/pqc/crypto/qtesla/QTESLASecurityCategory must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory ()

- (instancetype)init;

@end

__attribute__((unused)) static void OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_init(OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory *self);

__attribute__((unused)) static OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory *new_OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_init(void) NS_RETURNS_RETAINED;

__attribute__((unused)) static OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory *create_OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_init(void);

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/qtesla/QTESLASecurityCategory.java"


#line 6
@implementation OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory

J2OBJC_IGNORE_DESIGNATED_BEGIN

#line 11
- (instancetype)init {
  OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_init(self);
  return self;
}
J2OBJC_IGNORE_DESIGNATED_END


#line 15
+ (void)validateWithInt:(jint)securityCategory {
  OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_validateWithInt_(securityCategory);
}


#line 27
+ (jint)getPrivateSizeWithInt:(jint)securityCategory {
  return OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_getPrivateSizeWithInt_(securityCategory);
}


#line 41
+ (jint)getPublicSizeWithInt:(jint)securityCategory {
  return OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_getPublicSizeWithInt_(securityCategory);
}


#line 55
+ (jint)getSignatureSizeWithInt:(jint)securityCategory {
  return OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_getSignatureSizeWithInt_(securityCategory);
}


#line 75
+ (NSString *)getNameWithInt:(jint)securityCategory {
  return OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_getNameWithInt_(securityCategory);
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x2, -1, -1, -1, -1, -1, -1 },
    { NULL, "V", 0x8, 0, 1, -1, -1, -1, -1 },
    { NULL, "I", 0x8, 2, 1, -1, -1, -1, -1 },
    { NULL, "I", 0x8, 3, 1, -1, -1, -1, -1 },
    { NULL, "I", 0x8, 4, 1, -1, -1, -1, -1 },
    { NULL, "LNSString;", 0x9, 5, 1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(init);
  methods[1].selector = @selector(validateWithInt:);
  methods[2].selector = @selector(getPrivateSizeWithInt:);
  methods[3].selector = @selector(getPublicSizeWithInt:);
  methods[4].selector = @selector(getSignatureSizeWithInt:);
  methods[5].selector = @selector(getNameWithInt:);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "PROVABLY_SECURE_I", "I", .constantValue.asInt = OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_PROVABLY_SECURE_I, 0x19, -1, -1, -1, -1 },
    { "PROVABLY_SECURE_III", "I", .constantValue.asInt = OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_PROVABLY_SECURE_III, 0x19, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "validate", "I", "getPrivateSize", "getPublicSize", "getSignatureSize", "getName" };
  static const J2ObjcClassInfo _OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory = { "QTESLASecurityCategory", "org.bouncycastle.pqc.crypto.qtesla", ptrTable, methods, fields, 7, 0x1, 6, 2, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory;
}

@end


#line 11
void OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_init(OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory *self) {
  NSObject_init(self);
}


#line 11
OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory *new_OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_init() {
  J2OBJC_NEW_IMPL(OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory, init)
}


#line 11
OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory *create_OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_init() {
  J2OBJC_CREATE_IMPL(OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory, init)
}

void OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_validateWithInt_(jint securityCategory) {
  OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_initialize();
  switch (securityCategory) {
    
#line 19
    case OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_PROVABLY_SECURE_I:
    case OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_PROVABLY_SECURE_III:
    break;
    default:
    @throw new_JavaLangIllegalArgumentException_initWithNSString_(JreStrcat("$I", @"unknown security category: ", securityCategory));
  }
}


#line 27
jint OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_getPrivateSizeWithInt_(jint securityCategory) {
  OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_initialize();
  switch (securityCategory) {
    
#line 31
    case OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_PROVABLY_SECURE_I:
    return OrgBouncycastlePqcCryptoQteslaQTesla1p_CRYPTO_SECRETKEYBYTES;
    case OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_PROVABLY_SECURE_III:
    return OrgBouncycastlePqcCryptoQteslaQTesla3p_CRYPTO_SECRETKEYBYTES;
    
#line 36
    default:
    @throw new_JavaLangIllegalArgumentException_initWithNSString_(JreStrcat("$I", @"unknown security category: ", securityCategory));
  }
}


#line 41
jint OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_getPublicSizeWithInt_(jint securityCategory) {
  OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_initialize();
  switch (securityCategory) {
    
#line 45
    case OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_PROVABLY_SECURE_I:
    return OrgBouncycastlePqcCryptoQteslaQTesla1p_CRYPTO_PUBLICKEYBYTES;
    case OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_PROVABLY_SECURE_III:
    return OrgBouncycastlePqcCryptoQteslaQTesla3p_CRYPTO_PUBLICKEYBYTES;
    
#line 50
    default:
    @throw new_JavaLangIllegalArgumentException_initWithNSString_(JreStrcat("$I", @"unknown security category: ", securityCategory));
  }
}


#line 55
jint OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_getSignatureSizeWithInt_(jint securityCategory) {
  OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_initialize();
  switch (securityCategory) {
    
#line 60
    case OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_PROVABLY_SECURE_I:
    return OrgBouncycastlePqcCryptoQteslaQTesla1p_CRYPTO_BYTES;
    case OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_PROVABLY_SECURE_III:
    return OrgBouncycastlePqcCryptoQteslaQTesla3p_CRYPTO_BYTES;
    default:
    @throw new_JavaLangIllegalArgumentException_initWithNSString_(JreStrcat("$I", @"unknown security category: ", securityCategory));
  }
}


#line 75
NSString *OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_getNameWithInt_(jint securityCategory) {
  OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_initialize();
  switch (securityCategory) {
    
#line 79
    case OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_PROVABLY_SECURE_I:
    return @"qTESLA-p-I";
    case OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory_PROVABLY_SECURE_III:
    return @"qTESLA-p-III";
    default:
    @throw new_JavaLangIllegalArgumentException_initWithNSString_(JreStrcat("$I", @"unknown security category: ", securityCategory));
  }
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastlePqcCryptoQteslaQTESLASecurityCategory)
