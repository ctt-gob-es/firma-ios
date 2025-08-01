//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/card/dnie/Dnie3UsrCwa14890Constants.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "es/gob/jmulticard/card/dnie/Dnie3UsrCwa14890Constants.h"
#include "es/gob/jmulticard/card/dnie/Dnie3r1Cwa14890Constants.h"
#include "java/lang/UnsupportedOperationException.h"
#include "java/math/BigInteger.h"
#include "java/security/interfaces/RSAPrivateKey.h"
#include "javax/security/auth/Destroyable.h"

#if !__has_feature(objc_arc)
#error "es/gob/jmulticard/card/dnie/Dnie3UsrCwa14890Constants must be compiled with ARC (-fobjc-arc)"
#endif

/*!
 @brief Certificado de Terminal verificable por la tarjeta.
 (<i>c-CV-IFD-AUT</i>).
 */
inline IOSByteArray *EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_get_C_CV_IFD(void);
static IOSByteArray *EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_C_CV_IFD;
J2OBJC_STATIC_FIELD_OBJ_FINAL(EsGobJmulticardCardDnieDnie3UsrCwa14890Constants, C_CV_IFD, IOSByteArray *)

/*!
 @brief Identificador de la CA intermedia (CHR).El campo ocupa siempre 12 bytes y si el n&uacute;mero de serie es
  de menor longitud se rellena con ceros a la izquierda.
 El n&uacute;mero de serie es de al menos 8 bytes.
  Aqu&iacute; indicamos los 8 bytes del n&uacute;mero de serie obviando el resto del campo (que no se
  utiliza).
  (<i>sn-IFD</i>).
 */
inline IOSByteArray *EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_get_CHR_C_CV_IFD(void);
static IOSByteArray *EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_CHR_C_CV_IFD;
J2OBJC_STATIC_FIELD_OBJ_FINAL(EsGobJmulticardCardDnieDnie3UsrCwa14890Constants, CHR_C_CV_IFD, IOSByteArray *)

/*!
 @brief Clave privada del certificado de Terminal.
 (<i>sk-IFD-AUT</i>).
 */
inline id<JavaSecurityInterfacesRSAPrivateKey> EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_get_IFD_PRIVATE_KEY(void);
static id<JavaSecurityInterfacesRSAPrivateKey> EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_IFD_PRIVATE_KEY;
J2OBJC_STATIC_FIELD_OBJ_FINAL(EsGobJmulticardCardDnieDnie3UsrCwa14890Constants, IFD_PRIVATE_KEY, id<JavaSecurityInterfacesRSAPrivateKey>)

@interface EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1 : NSObject < JavaSecurityInterfacesRSAPrivateKey > {
 @public
  /*!
   @brief (<i>n</i>).
   */
  JavaMathBigInteger *ifdModulus_;
  /*!
   @brief (<i>d</i>).
   */
  JavaMathBigInteger *ifdPrivateExponent_;
}

- (instancetype)init;

- (NSString *)description;

- (JavaMathBigInteger *)getModulus;

- (NSString *)getFormat;

- (IOSByteArray *)getEncoded;

- (NSString *)getAlgorithm;

- (JavaMathBigInteger *)getPrivateExponent;

@end

J2OBJC_EMPTY_STATIC_INIT(EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1)

J2OBJC_FIELD_SETTER(EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1, ifdModulus_, JavaMathBigInteger *)
J2OBJC_FIELD_SETTER(EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1, ifdPrivateExponent_, JavaMathBigInteger *)

inline jlong EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1_get_serialVersionUID(void);
#define EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1_serialVersionUID 6991556885804507378LL
J2OBJC_STATIC_FIELD_CONSTANT(EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1, serialVersionUID, jlong)

__attribute__((unused)) static void EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1_init(EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1 *self);

__attribute__((unused)) static EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1 *new_EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1_init(void) NS_RETURNS_RETAINED;

__attribute__((unused)) static EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1 *create_EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1_init(void);

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/card/dnie/Dnie3UsrCwa14890Constants.java"

J2OBJC_INITIALIZED_DEFN(EsGobJmulticardCardDnieDnie3UsrCwa14890Constants)


#line 49
@implementation EsGobJmulticardCardDnieDnie3UsrCwa14890Constants


#line 49
- (instancetype)initPackagePrivate {
  EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_initPackagePrivate(self);
  return self;
}


#line 163
- (IOSByteArray *)getCCvIfd {
  
#line 165
  return EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_C_CV_IFD;
}


#line 168
- (IOSByteArray *)getChrCCvIfd {
  
#line 170
  return EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_CHR_C_CV_IFD;
}


#line 173
- (id<JavaSecurityInterfacesRSAPrivateKey>)getIfdPrivateKey {
  
#line 175
  return EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_IFD_PRIVATE_KEY;
}


#line 178
- (jint)getIfdKeyLength {
  
#line 180
  return 128;
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x0, -1, -1, -1, -1, -1, -1 },
    { NULL, "[B", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "[B", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LJavaSecurityInterfacesRSAPrivateKey;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "I", 0x1, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initPackagePrivate);
  methods[1].selector = @selector(getCCvIfd);
  methods[2].selector = @selector(getChrCCvIfd);
  methods[3].selector = @selector(getIfdPrivateKey);
  methods[4].selector = @selector(getIfdKeyLength);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "C_CV_IFD", "[B", .constantValue.asLong = 0, 0x1a, -1, 0, -1, -1 },
    { "CHR_C_CV_IFD", "[B", .constantValue.asLong = 0, 0x1a, -1, 1, -1, -1 },
    { "IFD_PRIVATE_KEY", "LJavaSecurityInterfacesRSAPrivateKey;", .constantValue.asLong = 0, 0x1a, -1, 2, -1, -1 },
  };
  static const void *ptrTable[] = { &EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_C_CV_IFD, &EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_CHR_C_CV_IFD, &EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_IFD_PRIVATE_KEY };
  static const J2ObjcClassInfo _EsGobJmulticardCardDnieDnie3UsrCwa14890Constants = { "Dnie3UsrCwa14890Constants", "es.gob.jmulticard.card.dnie", ptrTable, methods, fields, 7, 0x10, 5, 3, -1, -1, -1, -1, -1 };
  return &_EsGobJmulticardCardDnieDnie3UsrCwa14890Constants;
}

+ (void)initialize {
  if (self == [EsGobJmulticardCardDnieDnie3UsrCwa14890Constants class]) {
    EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_C_CV_IFD = [IOSByteArray newArrayWithBytes:(jbyte[]){
#line 54
      (jbyte) (jint) 0x7F, (jbyte) (jint) 0x21, (jbyte) (jint) 0x81, (jbyte) (jint) 0xCD, (jbyte) (jint) 0x5F, (jbyte) (jint) 0x37, (jbyte) (jint) 0x81, (jbyte) (jint) 0x80, (jbyte) (jint) 0x82, (jbyte) (jint) 0x5B,
#line 55
      (jbyte) (jint) 0x69, (jbyte) (jint) 0xC6, (jbyte) (jint) 0x45, (jbyte) (jint) 0x1E, (jbyte) (jint) 0x5F, (jbyte) (jint) 0x51, (jbyte) (jint) 0x70, (jbyte) (jint) 0x74, (jbyte) (jint) 0x38, (jbyte) (jint) 0x5F,
#line 56
      (jbyte) (jint) 0x2F, (jbyte) (jint) 0x17, (jbyte) (jint) 0xD6, (jbyte) (jint) 0x4D, (jbyte) (jint) 0xFE, (jbyte) (jint) 0x2E, (jbyte) (jint) 0x68, (jbyte) (jint) 0x56, (jbyte) (jint) 0x75, (jbyte) (jint) 0x67,
#line 57
      (jbyte) (jint) 0x09, (jbyte) (jint) 0x4B, (jbyte) (jint) 0x57, (jbyte) (jint) 0xF3, (jbyte) (jint) 0xC5, (jbyte) (jint) 0x78, (jbyte) (jint) 0xE8, (jbyte) (jint) 0x30, (jbyte) (jint) 0xE4, (jbyte) (jint) 0x25,
#line 58
      (jbyte) (jint) 0x57, (jbyte) (jint) 0x2D, (jbyte) (jint) 0xE8, (jbyte) (jint) 0x28, (jbyte) (jint) 0xFA, (jbyte) (jint) 0xF4, (jbyte) (jint) 0xDE, (jbyte) (jint) 0x1B, (jbyte) (jint) 0x01, (jbyte) (jint) 0xC3,
#line 59
      (jbyte) (jint) 0x94, (jbyte) (jint) 0xE3, (jbyte) (jint) 0x45, (jbyte) (jint) 0xC2, (jbyte) (jint) 0xFB, (jbyte) (jint) 0x06, (jbyte) (jint) 0x29, (jbyte) (jint) 0xA3, (jbyte) (jint) 0x93, (jbyte) (jint) 0x49,
#line 60
      (jbyte) (jint) 0x2F, (jbyte) (jint) 0x94, (jbyte) (jint) 0xF5, (jbyte) (jint) 0x70, (jbyte) (jint) 0xB0, (jbyte) (jint) 0x0B, (jbyte) (jint) 0x1D, (jbyte) (jint) 0x67, (jbyte) (jint) 0x77, (jbyte) (jint) 0x29,
#line 61
      (jbyte) (jint) 0xF7, (jbyte) (jint) 0x55, (jbyte) (jint) 0xD1, (jbyte) (jint) 0x07, (jbyte) (jint) 0x02, (jbyte) (jint) 0x2B, (jbyte) (jint) 0xB0, (jbyte) (jint) 0xA1, (jbyte) (jint) 0x16, (jbyte) (jint) 0xE1,
#line 62
      (jbyte) (jint) 0xD7, (jbyte) (jint) 0xD7, (jbyte) (jint) 0x65, (jbyte) (jint) 0x9D, (jbyte) (jint) 0xB5, (jbyte) (jint) 0xC4, (jbyte) (jint) 0xAC, (jbyte) (jint) 0x0D, (jbyte) (jint) 0xDE, (jbyte) (jint) 0xAB,
#line 63
      (jbyte) (jint) 0x07, (jbyte) (jint) 0xFF, (jbyte) (jint) 0x04, (jbyte) (jint) 0x5F, (jbyte) (jint) 0x37, (jbyte) (jint) 0xB5, (jbyte) (jint) 0xDA, (jbyte) (jint) 0xF1, (jbyte) (jint) 0x73, (jbyte) (jint) 0x2B,
#line 64
      (jbyte) (jint) 0x54, (jbyte) (jint) 0xEA, (jbyte) (jint) 0xB2, (jbyte) (jint) 0x38, (jbyte) (jint) 0xA2, (jbyte) (jint) 0xCE, (jbyte) (jint) 0x17, (jbyte) (jint) 0xC9, (jbyte) (jint) 0x79, (jbyte) (jint) 0x41,
#line 65
      (jbyte) (jint) 0x87, (jbyte) (jint) 0x75, (jbyte) (jint) 0x9C, (jbyte) (jint) 0xEA, (jbyte) (jint) 0x9F, (jbyte) (jint) 0x92, (jbyte) (jint) 0xA1, (jbyte) (jint) 0x78, (jbyte) (jint) 0x05, (jbyte) (jint) 0xA2,
#line 66
      (jbyte) (jint) 0x7C, (jbyte) (jint) 0x10, (jbyte) (jint) 0x15, (jbyte) (jint) 0xEC, (jbyte) (jint) 0x56, (jbyte) (jint) 0xCC, (jbyte) (jint) 0x7E, (jbyte) (jint) 0x47, (jbyte) (jint) 0x1A, (jbyte) (jint) 0x48,
#line 67
      (jbyte) (jint) 0x8E, (jbyte) (jint) 0x6F, (jbyte) (jint) 0x1B, (jbyte) (jint) 0x91, (jbyte) (jint) 0xF7, (jbyte) (jint) 0xAA, (jbyte) (jint) 0x5F, (jbyte) (jint) 0x38, (jbyte) (jint) 0x3C, (jbyte) (jint) 0xAD,
#line 68
      (jbyte) (jint) 0xFC, (jbyte) (jint) 0x12, (jbyte) (jint) 0xE8, (jbyte) (jint) 0x56, (jbyte) (jint) 0xB2, (jbyte) (jint) 0x02, (jbyte) (jint) 0x34, (jbyte) (jint) 0x6A, (jbyte) (jint) 0xF8, (jbyte) (jint) 0x22,
#line 69
      (jbyte) (jint) 0x6B, (jbyte) (jint) 0x1A, (jbyte) (jint) 0x88, (jbyte) (jint) 0x21, (jbyte) (jint) 0x37, (jbyte) (jint) 0xDC, (jbyte) (jint) 0x3C, (jbyte) (jint) 0x5A, (jbyte) (jint) 0x57, (jbyte) (jint) 0xF0,
#line 70
      (jbyte) (jint) 0xD2, (jbyte) (jint) 0x81, (jbyte) (jint) 0x5C, (jbyte) (jint) 0x1F, (jbyte) (jint) 0xCD, (jbyte) (jint) 0x4B, (jbyte) (jint) 0xB4, (jbyte) (jint) 0x6F, (jbyte) (jint) 0xA9, (jbyte) (jint) 0x15,
#line 71
      (jbyte) (jint) 0x7F, (jbyte) (jint) 0xDF, (jbyte) (jint) 0xFD, (jbyte) (jint) 0x79, (jbyte) (jint) 0xEC, (jbyte) (jint) 0x3A, (jbyte) (jint) 0x10, (jbyte) (jint) 0xA8, (jbyte) (jint) 0x24, (jbyte) (jint) 0xCC,
#line 72
      (jbyte) (jint) 0xC1, (jbyte) (jint) 0xEB, (jbyte) (jint) 0x3C, (jbyte) (jint) 0xE0, (jbyte) (jint) 0xB6, (jbyte) (jint) 0xB4, (jbyte) (jint) 0x39, (jbyte) (jint) 0x6A, (jbyte) (jint) 0xE2, (jbyte) (jint) 0x36,
#line 73
      (jbyte) (jint) 0x59, (jbyte) (jint) 0x00, (jbyte) (jint) 0x16, (jbyte) (jint) 0xBA, (jbyte) (jint) 0x69, (jbyte) (jint) 0x00, (jbyte) (jint) 0x01, (jbyte) (jint) 0x00, (jbyte) (jint) 0x01, (jbyte) (jint) 0x42,
#line 74
      (jbyte) (jint) 0x08, (jbyte) (jint) 0x65, (jbyte) (jint) 0x73, (jbyte) (jint) 0x53, (jbyte) (jint) 0x44, (jbyte) (jint) 0x49, (jbyte) (jint) 0x60, (jbyte) (jint) 0x00, (jbyte) (jint) 0x06 } count:209];
      EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_CHR_C_CV_IFD = [IOSByteArray newArrayWithBytes:(jbyte[]){
#line 83
        (jbyte) (jint) 0x20, (jbyte) (jint) 0x00, (jbyte) (jint) 0x00, (jbyte) (jint) 0x00, (jbyte) (jint) 0x00, (jbyte) (jint) 0x00, (jbyte) (jint) 0x00, (jbyte) (jint) 0x01 } count:8];
        EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_IFD_PRIVATE_KEY = new_EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1_init();
        J2OBJC_SET_INITIALIZED(EsGobJmulticardCardDnieDnie3UsrCwa14890Constants)
      }
    }

@end


#line 49
void EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_initPackagePrivate(EsGobJmulticardCardDnieDnie3UsrCwa14890Constants *self) {
  EsGobJmulticardCardDnieDnie3r1Cwa14890Constants_initPackagePrivate(self);
}


#line 49
EsGobJmulticardCardDnieDnie3UsrCwa14890Constants *new_EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_initPackagePrivate() {
  J2OBJC_NEW_IMPL(EsGobJmulticardCardDnieDnie3UsrCwa14890Constants, initPackagePrivate)
}


#line 49
EsGobJmulticardCardDnieDnie3UsrCwa14890Constants *create_EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_initPackagePrivate() {
  J2OBJC_CREATE_IMPL(EsGobJmulticardCardDnieDnie3UsrCwa14890Constants, initPackagePrivate)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(EsGobJmulticardCardDnieDnie3UsrCwa14890Constants)

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/card/dnie/Dnie3UsrCwa14890Constants.java"


#line 88
@implementation EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1

J2OBJC_IGNORE_DESIGNATED_BEGIN

#line 88
- (instancetype)init {
  EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1_init(self);
  return self;
}
J2OBJC_IGNORE_DESIGNATED_END


#line 92
- (NSString *)description {
  
#line 94
  return @"Clave privada RSA del certificado de Terminal para DNIe 3.0 (canal de usuario)";
}


#line 137
- (JavaMathBigInteger *)getModulus {
  
#line 139
  return JreRetainedLocalValue(self->ifdModulus_);
}


#line 142
- (NSString *)getFormat {
  
#line 144
  return @"PKCS#8";
}


#line 147
- (IOSByteArray *)getEncoded {
  
#line 149
  @throw new_JavaLangUnsupportedOperationException_init();
}


#line 152
- (NSString *)getAlgorithm {
  
#line 154
  return @"RSA";
}


#line 157
- (JavaMathBigInteger *)getPrivateExponent {
  
#line 159
  return JreRetainedLocalValue(self->ifdPrivateExponent_);
}

- (void)destroy {
  JavaxSecurityAuthDestroyable_destroy(self);
}

- (jboolean)isDestroyed {
  return JavaxSecurityAuthDestroyable_isDestroyed(self);
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x0, -1, -1, -1, -1, -1, -1 },
    { NULL, "LNSString;", 0x1, 0, -1, -1, -1, -1, -1 },
    { NULL, "LJavaMathBigInteger;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LNSString;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "[B", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LNSString;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LJavaMathBigInteger;", 0x1, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(init);
  methods[1].selector = @selector(description);
  methods[2].selector = @selector(getModulus);
  methods[3].selector = @selector(getFormat);
  methods[4].selector = @selector(getEncoded);
  methods[5].selector = @selector(getAlgorithm);
  methods[6].selector = @selector(getPrivateExponent);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "serialVersionUID", "J", .constantValue.asLong = EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1_serialVersionUID, 0x1a, -1, -1, -1, -1 },
    { "ifdModulus_", "LJavaMathBigInteger;", .constantValue.asLong = 0, 0x12, -1, -1, -1, -1 },
    { "ifdPrivateExponent_", "LJavaMathBigInteger;", .constantValue.asLong = 0, 0x12, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "toString", "LEsGobJmulticardCardDnieDnie3UsrCwa14890Constants;" };
  static const J2ObjcClassInfo _EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1 = { "", "es.gob.jmulticard.card.dnie", ptrTable, methods, fields, 7, 0x8000, 7, 3, 1, -1, -1, -1, -1 };
  return &_EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1;
}

@end


#line 88
void EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1_init(EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1 *self) {
  NSObject_init(self);
  self->ifdModulus_ = new_JavaMathBigInteger_initWithInt_withByteArray_(
#line 98
  1, [IOSByteArray newArrayWithBytes:(jbyte[]){
#line 99
    (jbyte) (jint) 0xDB, (jbyte) (jint) 0x2C, (jbyte) (jint) 0xB4, (jbyte) (jint) 0x1E, (jbyte) (jint) 0x11, (jbyte) (jint) 0x2B, (jbyte) (jint) 0xAC, (jbyte) (jint) 0xFA,
#line 100
    (jbyte) (jint) 0x2B, (jbyte) (jint) 0xD7, (jbyte) (jint) 0xC3, (jbyte) (jint) 0xD3, (jbyte) (jint) 0xD7, (jbyte) (jint) 0x96, (jbyte) (jint) 0x7E, (jbyte) (jint) 0x84,
#line 101
    (jbyte) (jint) 0xFB, (jbyte) (jint) 0x94, (jbyte) (jint) 0x34, (jbyte) (jint) 0xFC, (jbyte) (jint) 0x26, (jbyte) (jint) 0x1F, (jbyte) (jint) 0x9D, (jbyte) (jint) 0x09,
#line 102
    (jbyte) (jint) 0x0A, (jbyte) (jint) 0x89, (jbyte) (jint) 0x83, (jbyte) (jint) 0x94, (jbyte) (jint) 0x7D, (jbyte) (jint) 0xAF, (jbyte) (jint) 0x84, (jbyte) (jint) 0x88,
#line 103
    (jbyte) (jint) 0xD3, (jbyte) (jint) 0xDF, (jbyte) (jint) 0x8F, (jbyte) (jint) 0xBD, (jbyte) (jint) 0xCC, (jbyte) (jint) 0x1F, (jbyte) (jint) 0x92, (jbyte) (jint) 0x49,
#line 104
    (jbyte) (jint) 0x35, (jbyte) (jint) 0x85, (jbyte) (jint) 0xE1, (jbyte) (jint) 0x34, (jbyte) (jint) 0xA1, (jbyte) (jint) 0xB4, (jbyte) (jint) 0x2D, (jbyte) (jint) 0xE5,
#line 105
    (jbyte) (jint) 0x19, (jbyte) (jint) 0xF4, (jbyte) (jint) 0x63, (jbyte) (jint) 0x24, (jbyte) (jint) 0x4D, (jbyte) (jint) 0x7E, (jbyte) (jint) 0xD3, (jbyte) (jint) 0x84,
#line 106
    (jbyte) (jint) 0xE2, (jbyte) (jint) 0x6D, (jbyte) (jint) 0x51, (jbyte) (jint) 0x6C, (jbyte) (jint) 0xC7, (jbyte) (jint) 0xA4, (jbyte) (jint) 0xFF, (jbyte) (jint) 0x78,
#line 107
    (jbyte) (jint) 0x95, (jbyte) (jint) 0xB1, (jbyte) (jint) 0x99, (jbyte) (jint) 0x21, (jbyte) (jint) 0x40, (jbyte) (jint) 0x04, (jbyte) (jint) 0x3A, (jbyte) (jint) 0xAC,
#line 108
    (jbyte) (jint) 0xAD, (jbyte) (jint) 0xFC, (jbyte) (jint) 0x12, (jbyte) (jint) 0xE8, (jbyte) (jint) 0x56, (jbyte) (jint) 0xB2, (jbyte) (jint) 0x02, (jbyte) (jint) 0x34,
#line 109
    (jbyte) (jint) 0x6A, (jbyte) (jint) 0xF8, (jbyte) (jint) 0x22, (jbyte) (jint) 0x6B, (jbyte) (jint) 0x1A, (jbyte) (jint) 0x88, (jbyte) (jint) 0x21, (jbyte) (jint) 0x37,
#line 110
    (jbyte) (jint) 0xDC, (jbyte) (jint) 0x3C, (jbyte) (jint) 0x5A, (jbyte) (jint) 0x57, (jbyte) (jint) 0xF0, (jbyte) (jint) 0xD2, (jbyte) (jint) 0x81, (jbyte) (jint) 0x5C,
#line 111
    (jbyte) (jint) 0x1F, (jbyte) (jint) 0xCD, (jbyte) (jint) 0x4B, (jbyte) (jint) 0xB4, (jbyte) (jint) 0x6F, (jbyte) (jint) 0xA9, (jbyte) (jint) 0x15, (jbyte) (jint) 0x7F,
#line 112
    (jbyte) (jint) 0xDF, (jbyte) (jint) 0xFD, (jbyte) (jint) 0x79, (jbyte) (jint) 0xEC, (jbyte) (jint) 0x3A, (jbyte) (jint) 0x10, (jbyte) (jint) 0xA8, (jbyte) (jint) 0x24,
#line 113
    (jbyte) (jint) 0xCC, (jbyte) (jint) 0xC1, (jbyte) (jint) 0xEB, (jbyte) (jint) 0x3C, (jbyte) (jint) 0xE0, (jbyte) (jint) 0xB6, (jbyte) (jint) 0xB4, (jbyte) (jint) 0x39,
#line 114
    (jbyte) (jint) 0x6A, (jbyte) (jint) 0xE2, (jbyte) (jint) 0x36, (jbyte) (jint) 0x59, (jbyte) (jint) 0x00, (jbyte) (jint) 0x16, (jbyte) (jint) 0xBA, (jbyte) (jint) 0x69 } count:128]);
    self->ifdPrivateExponent_ = new_JavaMathBigInteger_initWithInt_withByteArray_(
#line 118
    1, [IOSByteArray newArrayWithBytes:(jbyte[]){
#line 119
      (jbyte) (jint) 0x18, (jbyte) (jint) 0xB4, (jbyte) (jint) 0x4A, (jbyte) (jint) 0x3D, (jbyte) (jint) 0x15, (jbyte) (jint) 0x5C, (jbyte) (jint) 0x61, (jbyte) (jint) 0xEB,
#line 120
      (jbyte) (jint) 0xF4, (jbyte) (jint) 0xE3, (jbyte) (jint) 0x26, (jbyte) (jint) 0x1C, (jbyte) (jint) 0x8B, (jbyte) (jint) 0xB1, (jbyte) (jint) 0x57, (jbyte) (jint) 0xE3,
#line 121
      (jbyte) (jint) 0x6F, (jbyte) (jint) 0x63, (jbyte) (jint) 0xFE, (jbyte) (jint) 0x30, (jbyte) (jint) 0xE9, (jbyte) (jint) 0xAF, (jbyte) (jint) 0x28, (jbyte) (jint) 0x89,
#line 122
      (jbyte) (jint) 0x2B, (jbyte) (jint) 0x59, (jbyte) (jint) 0xE2, (jbyte) (jint) 0xAD, (jbyte) (jint) 0xEB, (jbyte) (jint) 0x18, (jbyte) (jint) 0xCC, (jbyte) (jint) 0x8C,
#line 123
      (jbyte) (jint) 0x8B, (jbyte) (jint) 0xAD, (jbyte) (jint) 0x28, (jbyte) (jint) 0x4B, (jbyte) (jint) 0x91, (jbyte) (jint) 0x65, (jbyte) (jint) 0x81, (jbyte) (jint) 0x9C,
#line 124
      (jbyte) (jint) 0xA4, (jbyte) (jint) 0xDE, (jbyte) (jint) 0xC9, (jbyte) (jint) 0x4A, (jbyte) (jint) 0xA0, (jbyte) (jint) 0x6B, (jbyte) (jint) 0x69, (jbyte) (jint) 0xBC,
#line 125
      (jbyte) (jint) 0xE8, (jbyte) (jint) 0x17, (jbyte) (jint) 0x06, (jbyte) (jint) 0xD1, (jbyte) (jint) 0xC1, (jbyte) (jint) 0xB6, (jbyte) (jint) 0x68, (jbyte) (jint) 0xEB,
#line 126
      (jbyte) (jint) 0x12, (jbyte) (jint) 0x86, (jbyte) (jint) 0x95, (jbyte) (jint) 0xE5, (jbyte) (jint) 0xF7, (jbyte) (jint) 0xFE, (jbyte) (jint) 0xDE, (jbyte) (jint) 0x18,
#line 127
      (jbyte) (jint) 0xA9, (jbyte) (jint) 0x08, (jbyte) (jint) 0xA3, (jbyte) (jint) 0x01, (jbyte) (jint) 0x1A, (jbyte) (jint) 0x64, (jbyte) (jint) 0x6A, (jbyte) (jint) 0x48,
#line 128
      (jbyte) (jint) 0x1D, (jbyte) (jint) 0x3E, (jbyte) (jint) 0xA7, (jbyte) (jint) 0x1D, (jbyte) (jint) 0x8A, (jbyte) (jint) 0x38, (jbyte) (jint) 0x7D, (jbyte) (jint) 0x47,
#line 129
      (jbyte) (jint) 0x46, (jbyte) (jint) 0x09, (jbyte) (jint) 0xBD, (jbyte) (jint) 0x57, (jbyte) (jint) 0xA8, (jbyte) (jint) 0x82, (jbyte) (jint) 0xB1, (jbyte) (jint) 0x82,
#line 130
      (jbyte) (jint) 0xE0, (jbyte) (jint) 0x47, (jbyte) (jint) 0xDE, (jbyte) (jint) 0x80, (jbyte) (jint) 0xE0, (jbyte) (jint) 0x4B, (jbyte) (jint) 0x42, (jbyte) (jint) 0x21,
#line 131
      (jbyte) (jint) 0x41, (jbyte) (jint) 0x6B, (jbyte) (jint) 0xD3, (jbyte) (jint) 0x9D, (jbyte) (jint) 0xFA, (jbyte) (jint) 0x1F, (jbyte) (jint) 0xAC, (jbyte) (jint) 0x03,
#line 132
      (jbyte) (jint) 0x00, (jbyte) (jint) 0x64, (jbyte) (jint) 0x19, (jbyte) (jint) 0x62, (jbyte) (jint) 0xAD, (jbyte) (jint) 0xB1, (jbyte) (jint) 0x09, (jbyte) (jint) 0xE2,
#line 133
      (jbyte) (jint) 0x8C, (jbyte) (jint) 0xAF, (jbyte) (jint) 0x50, (jbyte) (jint) 0x06, (jbyte) (jint) 0x1B, (jbyte) (jint) 0x68, (jbyte) (jint) 0xC9, (jbyte) (jint) 0xCA,
#line 134
      (jbyte) (jint) 0xBD, (jbyte) (jint) 0x9B, (jbyte) (jint) 0x00, (jbyte) (jint) 0x31, (jbyte) (jint) 0x3C, (jbyte) (jint) 0x0F, (jbyte) (jint) 0x46, (jbyte) (jint) 0xED } count:128]);
    }


#line 88
EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1 *new_EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1_init() {
  J2OBJC_NEW_IMPL(EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1, init)
}


#line 88
EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1 *create_EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1_init() {
  J2OBJC_CREATE_IMPL(EsGobJmulticardCardDnieDnie3UsrCwa14890Constants_1, init)
}
