//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/util/encoders/Hex.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/io/ByteArrayOutputStream.h"
#include "java/io/OutputStream.h"
#include "java/lang/Exception.h"
#include "org/bouncycastle/util/Strings.h"
#include "org/bouncycastle/util/encoders/DecoderException.h"
#include "org/bouncycastle/util/encoders/EncoderException.h"
#include "org/bouncycastle/util/encoders/Hex.h"
#include "org/bouncycastle/util/encoders/HexEncoder.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/util/encoders/Hex must be compiled with ARC (-fobjc-arc)"
#endif

inline OrgBouncycastleUtilEncodersHexEncoder *OrgBouncycastleUtilEncodersHex_get_encoder(void);
static OrgBouncycastleUtilEncodersHexEncoder *OrgBouncycastleUtilEncodersHex_encoder;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgBouncycastleUtilEncodersHex, encoder, OrgBouncycastleUtilEncodersHexEncoder *)

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/util/encoders/Hex.java"

J2OBJC_INITIALIZED_DEFN(OrgBouncycastleUtilEncodersHex)


#line 12
@implementation OrgBouncycastleUtilEncodersHex

J2OBJC_IGNORE_DESIGNATED_BEGIN

#line 12
- (instancetype)init {
  OrgBouncycastleUtilEncodersHex_init(self);
  return self;
}
J2OBJC_IGNORE_DESIGNATED_END


#line 16
+ (NSString *)toHexStringWithByteArray:(IOSByteArray *)data {
  return OrgBouncycastleUtilEncodersHex_toHexStringWithByteArray_(data);
}


#line 22
+ (NSString *)toHexStringWithByteArray:(IOSByteArray *)data
                               withInt:(jint)off
                               withInt:(jint)length {
  return OrgBouncycastleUtilEncodersHex_toHexStringWithByteArray_withInt_withInt_(data, off, length);
}


#line 36
+ (IOSByteArray *)encodeWithByteArray:(IOSByteArray *)data {
  return OrgBouncycastleUtilEncodersHex_encodeWithByteArray_(data);
}


#line 47
+ (IOSByteArray *)encodeWithByteArray:(IOSByteArray *)data
                              withInt:(jint)off
                              withInt:(jint)length {
  return OrgBouncycastleUtilEncodersHex_encodeWithByteArray_withInt_withInt_(data, off, length);
}


#line 71
+ (jint)encodeWithByteArray:(IOSByteArray *)data
     withJavaIoOutputStream:(JavaIoOutputStream *)outArg {
  return OrgBouncycastleUtilEncodersHex_encodeWithByteArray_withJavaIoOutputStream_(data, outArg);
}


#line 84
+ (jint)encodeWithByteArray:(IOSByteArray *)data
                    withInt:(jint)off
                    withInt:(jint)length
     withJavaIoOutputStream:(JavaIoOutputStream *)outArg {
  return OrgBouncycastleUtilEncodersHex_encodeWithByteArray_withInt_withInt_withJavaIoOutputStream_(data, off, length, outArg);
}


#line 99
+ (IOSByteArray *)decodeWithByteArray:(IOSByteArray *)data {
  return OrgBouncycastleUtilEncodersHex_decodeWithByteArray_(data);
}


#line 121
+ (IOSByteArray *)decodeWithNSString:(NSString *)data {
  return OrgBouncycastleUtilEncodersHex_decodeWithNSString_(data);
}


#line 144
+ (jint)decodeWithNSString:(NSString *)data
    withJavaIoOutputStream:(JavaIoOutputStream *)outArg {
  return OrgBouncycastleUtilEncodersHex_decodeWithNSString_withJavaIoOutputStream_(data, outArg);
}


#line 158
+ (IOSByteArray *)decodeStrictWithNSString:(NSString *)str {
  return OrgBouncycastleUtilEncodersHex_decodeStrictWithNSString_(str);
}


#line 176
+ (IOSByteArray *)decodeStrictWithNSString:(NSString *)str
                                   withInt:(jint)off
                                   withInt:(jint)len {
  return OrgBouncycastleUtilEncodersHex_decodeStrictWithNSString_withInt_withInt_(str, off, len);
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LNSString;", 0x9, 0, 1, -1, -1, -1, -1 },
    { NULL, "LNSString;", 0x9, 0, 2, -1, -1, -1, -1 },
    { NULL, "[B", 0x9, 3, 1, -1, -1, -1, -1 },
    { NULL, "[B", 0x9, 3, 2, -1, -1, -1, -1 },
    { NULL, "I", 0x9, 3, 4, 5, -1, -1, -1 },
    { NULL, "I", 0x9, 3, 6, 5, -1, -1, -1 },
    { NULL, "[B", 0x9, 7, 1, -1, -1, -1, -1 },
    { NULL, "[B", 0x9, 7, 8, -1, -1, -1, -1 },
    { NULL, "I", 0x9, 7, 9, 5, -1, -1, -1 },
    { NULL, "[B", 0x9, 10, 8, -1, -1, -1, -1 },
    { NULL, "[B", 0x9, 10, 11, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(init);
  methods[1].selector = @selector(toHexStringWithByteArray:);
  methods[2].selector = @selector(toHexStringWithByteArray:withInt:withInt:);
  methods[3].selector = @selector(encodeWithByteArray:);
  methods[4].selector = @selector(encodeWithByteArray:withInt:withInt:);
  methods[5].selector = @selector(encodeWithByteArray:withJavaIoOutputStream:);
  methods[6].selector = @selector(encodeWithByteArray:withInt:withInt:withJavaIoOutputStream:);
  methods[7].selector = @selector(decodeWithByteArray:);
  methods[8].selector = @selector(decodeWithNSString:);
  methods[9].selector = @selector(decodeWithNSString:withJavaIoOutputStream:);
  methods[10].selector = @selector(decodeStrictWithNSString:);
  methods[11].selector = @selector(decodeStrictWithNSString:withInt:withInt:);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "encoder", "LOrgBouncycastleUtilEncodersHexEncoder;", .constantValue.asLong = 0, 0x1a, -1, 12, -1, -1 },
  };
  static const void *ptrTable[] = { "toHexString", "[B", "[BII", "encode", "[BLJavaIoOutputStream;", "LJavaIoIOException;", "[BIILJavaIoOutputStream;", "decode", "LNSString;", "LNSString;LJavaIoOutputStream;", "decodeStrict", "LNSString;II", &OrgBouncycastleUtilEncodersHex_encoder };
  static const J2ObjcClassInfo _OrgBouncycastleUtilEncodersHex = { "Hex", "org.bouncycastle.util.encoders", ptrTable, methods, fields, 7, 0x1, 12, 1, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleUtilEncodersHex;
}

+ (void)initialize {
  if (self == [OrgBouncycastleUtilEncodersHex class]) {
    OrgBouncycastleUtilEncodersHex_encoder = new_OrgBouncycastleUtilEncodersHexEncoder_init();
    J2OBJC_SET_INITIALIZED(OrgBouncycastleUtilEncodersHex)
  }
}

@end


#line 12
void OrgBouncycastleUtilEncodersHex_init(OrgBouncycastleUtilEncodersHex *self) {
  NSObject_init(self);
}


#line 12
OrgBouncycastleUtilEncodersHex *new_OrgBouncycastleUtilEncodersHex_init() {
  J2OBJC_NEW_IMPL(OrgBouncycastleUtilEncodersHex, init)
}


#line 12
OrgBouncycastleUtilEncodersHex *create_OrgBouncycastleUtilEncodersHex_init() {
  J2OBJC_CREATE_IMPL(OrgBouncycastleUtilEncodersHex, init)
}

NSString *OrgBouncycastleUtilEncodersHex_toHexStringWithByteArray_(IOSByteArray *data) {
  OrgBouncycastleUtilEncodersHex_initialize();
  
#line 19
  return OrgBouncycastleUtilEncodersHex_toHexStringWithByteArray_withInt_withInt_(data, 0, ((IOSByteArray *) nil_chk(data))->size_);
}


#line 22
NSString *OrgBouncycastleUtilEncodersHex_toHexStringWithByteArray_withInt_withInt_(IOSByteArray *data, jint off, jint length) {
  OrgBouncycastleUtilEncodersHex_initialize();
  
#line 27
  IOSByteArray *encoded = OrgBouncycastleUtilEncodersHex_encodeWithByteArray_withInt_withInt_(data, off, length);
  return OrgBouncycastleUtilStrings_fromByteArrayWithByteArray_(encoded);
}


#line 36
IOSByteArray *OrgBouncycastleUtilEncodersHex_encodeWithByteArray_(IOSByteArray *data) {
  OrgBouncycastleUtilEncodersHex_initialize();
  
#line 39
  return OrgBouncycastleUtilEncodersHex_encodeWithByteArray_withInt_withInt_(data, 0, ((IOSByteArray *) nil_chk(data))->size_);
}


#line 47
IOSByteArray *OrgBouncycastleUtilEncodersHex_encodeWithByteArray_withInt_withInt_(IOSByteArray *data, jint off, jint length) {
  OrgBouncycastleUtilEncodersHex_initialize();
  
#line 52
  JavaIoByteArrayOutputStream *bOut = new_JavaIoByteArrayOutputStream_init();
  
#line 54
  @try {
    
#line 56
    [((OrgBouncycastleUtilEncodersHexEncoder *) nil_chk(OrgBouncycastleUtilEncodersHex_encoder)) encodeWithByteArray:data withInt:off withInt:length withJavaIoOutputStream:bOut];
  }
  @catch (JavaLangException *e) {
    
#line 60
    @throw new_OrgBouncycastleUtilEncodersEncoderException_initWithNSString_withJavaLangThrowable_(JreStrcat("$$", @"exception encoding Hex string: ", [e getMessage]), e);
  }
  
#line 63
  return [bOut toByteArray];
}


#line 71
jint OrgBouncycastleUtilEncodersHex_encodeWithByteArray_withJavaIoOutputStream_(IOSByteArray *data, JavaIoOutputStream *outArg) {
  OrgBouncycastleUtilEncodersHex_initialize();
  
#line 76
  return [((OrgBouncycastleUtilEncodersHexEncoder *) nil_chk(OrgBouncycastleUtilEncodersHex_encoder)) encodeWithByteArray:data withInt:0 withInt:((IOSByteArray *) nil_chk(data))->size_ withJavaIoOutputStream:outArg];
}


#line 84
jint OrgBouncycastleUtilEncodersHex_encodeWithByteArray_withInt_withInt_withJavaIoOutputStream_(IOSByteArray *data, jint off, jint length, JavaIoOutputStream *outArg) {
  OrgBouncycastleUtilEncodersHex_initialize();
  
#line 91
  return [((OrgBouncycastleUtilEncodersHexEncoder *) nil_chk(OrgBouncycastleUtilEncodersHex_encoder)) encodeWithByteArray:data withInt:off withInt:length withJavaIoOutputStream:outArg];
}


#line 99
IOSByteArray *OrgBouncycastleUtilEncodersHex_decodeWithByteArray_(IOSByteArray *data) {
  OrgBouncycastleUtilEncodersHex_initialize();
  
#line 102
  JavaIoByteArrayOutputStream *bOut = new_JavaIoByteArrayOutputStream_init();
  
#line 104
  @try {
    
#line 106
    [((OrgBouncycastleUtilEncodersHexEncoder *) nil_chk(OrgBouncycastleUtilEncodersHex_encoder)) decodeWithByteArray:data withInt:0 withInt:((IOSByteArray *) nil_chk(data))->size_ withJavaIoOutputStream:bOut];
  }
  @catch (JavaLangException *e) {
    
#line 110
    @throw new_OrgBouncycastleUtilEncodersDecoderException_initWithNSString_withJavaLangThrowable_(JreStrcat("$$", @"exception decoding Hex data: ", [e getMessage]), e);
  }
  
#line 113
  return [bOut toByteArray];
}

IOSByteArray *OrgBouncycastleUtilEncodersHex_decodeWithNSString_(NSString *data) {
  OrgBouncycastleUtilEncodersHex_initialize();
  
#line 124
  JavaIoByteArrayOutputStream *bOut = new_JavaIoByteArrayOutputStream_init();
  
#line 126
  @try {
    
#line 128
    [((OrgBouncycastleUtilEncodersHexEncoder *) nil_chk(OrgBouncycastleUtilEncodersHex_encoder)) decodeWithNSString:data withJavaIoOutputStream:bOut];
  }
  @catch (JavaLangException *e) {
    
#line 132
    @throw new_OrgBouncycastleUtilEncodersDecoderException_initWithNSString_withJavaLangThrowable_(JreStrcat("$$", @"exception decoding Hex string: ", [e getMessage]), e);
  }
  
#line 135
  return [bOut toByteArray];
}


#line 144
jint OrgBouncycastleUtilEncodersHex_decodeWithNSString_withJavaIoOutputStream_(NSString *data, JavaIoOutputStream *outArg) {
  OrgBouncycastleUtilEncodersHex_initialize();
  
#line 149
  return [((OrgBouncycastleUtilEncodersHexEncoder *) nil_chk(OrgBouncycastleUtilEncodersHex_encoder)) decodeWithNSString:data withJavaIoOutputStream:outArg];
}


#line 158
IOSByteArray *OrgBouncycastleUtilEncodersHex_decodeStrictWithNSString_(NSString *str) {
  OrgBouncycastleUtilEncodersHex_initialize();
  @try {
    
#line 162
    return [((OrgBouncycastleUtilEncodersHexEncoder *) nil_chk(OrgBouncycastleUtilEncodersHex_encoder)) decodeStrictWithNSString:str withInt:0 withInt:[((NSString *) nil_chk(str)) java_length]];
  }
  @catch (JavaLangException *e) {
    
#line 166
    @throw new_OrgBouncycastleUtilEncodersDecoderException_initWithNSString_withJavaLangThrowable_(JreStrcat("$$", @"exception decoding Hex string: ", [e getMessage]), e);
  }
}


#line 176
IOSByteArray *OrgBouncycastleUtilEncodersHex_decodeStrictWithNSString_withInt_withInt_(NSString *str, jint off, jint len) {
  OrgBouncycastleUtilEncodersHex_initialize();
  @try {
    
#line 180
    return [((OrgBouncycastleUtilEncodersHexEncoder *) nil_chk(OrgBouncycastleUtilEncodersHex_encoder)) decodeStrictWithNSString:str withInt:off withInt:len];
  }
  @catch (JavaLangException *e) {
    
#line 184
    @throw new_OrgBouncycastleUtilEncodersDecoderException_initWithNSString_withJavaLangThrowable_(JreStrcat("$$", @"exception decoding Hex string: ", [e getMessage]), e);
  }
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleUtilEncodersHex)
