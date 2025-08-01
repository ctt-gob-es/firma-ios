//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/crypto/digests/XofUtils.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "org/bouncycastle/crypto/digests/XofUtils.h"
#include "org/bouncycastle/util/Arrays.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/crypto/digests/XofUtils must be compiled with ARC (-fobjc-arc)"
#endif

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/crypto/digests/XofUtils.java"


#line 5
@implementation OrgBouncycastleCryptoDigestsXofUtils

J2OBJC_IGNORE_DESIGNATED_BEGIN

#line 5
- (instancetype)init {
  OrgBouncycastleCryptoDigestsXofUtils_init(self);
  return self;
}
J2OBJC_IGNORE_DESIGNATED_END


#line 7
+ (IOSByteArray *)leftEncodeWithLong:(jlong)strLen {
  return OrgBouncycastleCryptoDigestsXofUtils_leftEncodeWithLong_(strLen);
}


#line 29
+ (IOSByteArray *)rightEncodeWithLong:(jlong)strLen {
  return OrgBouncycastleCryptoDigestsXofUtils_rightEncodeWithLong_(strLen);
}


#line 51
+ (IOSByteArray *)encodeWithByte:(jbyte)X {
  return OrgBouncycastleCryptoDigestsXofUtils_encodeWithByte_(X);
}


#line 56
+ (IOSByteArray *)encodeWithByteArray:(IOSByteArray *)inArg
                              withInt:(jint)inOff
                              withInt:(jint)len {
  return OrgBouncycastleCryptoDigestsXofUtils_encodeWithByteArray_withInt_withInt_(inArg, inOff, len);
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "[B", 0x9, 0, 1, -1, -1, -1, -1 },
    { NULL, "[B", 0x9, 2, 1, -1, -1, -1, -1 },
    { NULL, "[B", 0x8, 3, 4, -1, -1, -1, -1 },
    { NULL, "[B", 0x8, 3, 5, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(init);
  methods[1].selector = @selector(leftEncodeWithLong:);
  methods[2].selector = @selector(rightEncodeWithLong:);
  methods[3].selector = @selector(encodeWithByte:);
  methods[4].selector = @selector(encodeWithByteArray:withInt:withInt:);
  #pragma clang diagnostic pop
  static const void *ptrTable[] = { "leftEncode", "J", "rightEncode", "encode", "B", "[BII" };
  static const J2ObjcClassInfo _OrgBouncycastleCryptoDigestsXofUtils = { "XofUtils", "org.bouncycastle.crypto.digests", ptrTable, methods, NULL, 7, 0x1, 5, 0, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleCryptoDigestsXofUtils;
}

@end


#line 5
void OrgBouncycastleCryptoDigestsXofUtils_init(OrgBouncycastleCryptoDigestsXofUtils *self) {
  NSObject_init(self);
}


#line 5
OrgBouncycastleCryptoDigestsXofUtils *new_OrgBouncycastleCryptoDigestsXofUtils_init() {
  J2OBJC_NEW_IMPL(OrgBouncycastleCryptoDigestsXofUtils, init)
}


#line 5
OrgBouncycastleCryptoDigestsXofUtils *create_OrgBouncycastleCryptoDigestsXofUtils_init() {
  J2OBJC_CREATE_IMPL(OrgBouncycastleCryptoDigestsXofUtils, init)
}


#line 7
IOSByteArray *OrgBouncycastleCryptoDigestsXofUtils_leftEncodeWithLong_(jlong strLen) {
  OrgBouncycastleCryptoDigestsXofUtils_initialize();
  jbyte n = 1;
  
#line 11
  jlong v = strLen;
  while ((JreRShiftAssignLong(&v, 8)) != 0) {
    
#line 14
    n++;
  }
  
#line 17
  IOSByteArray *b = [IOSByteArray newArrayWithLength:n + 1];
  
#line 19
  *IOSByteArray_GetRef(b, 0) = n;
  
#line 21
  for (jint i = 1; i <= n; i++) {
    
#line 23
    *IOSByteArray_GetRef(b, i) = (jbyte) (JreRShift64(strLen, (8 * (n - i))));
  }
  
#line 26
  return b;
}


#line 29
IOSByteArray *OrgBouncycastleCryptoDigestsXofUtils_rightEncodeWithLong_(jlong strLen) {
  OrgBouncycastleCryptoDigestsXofUtils_initialize();
  jbyte n = 1;
  
#line 33
  jlong v = strLen;
  while ((JreRShiftAssignLong(&v, 8)) != 0) {
    
#line 36
    n++;
  }
  
#line 39
  IOSByteArray *b = [IOSByteArray newArrayWithLength:n + 1];
  
#line 41
  *IOSByteArray_GetRef(b, n) = n;
  
#line 43
  for (jint i = 0; i < n; i++) {
    
#line 45
    *IOSByteArray_GetRef(b, i) = (jbyte) (JreRShift64(strLen, (8 * (n - i - 1))));
  }
  
#line 48
  return b;
}


#line 51
IOSByteArray *OrgBouncycastleCryptoDigestsXofUtils_encodeWithByte_(jbyte X) {
  OrgBouncycastleCryptoDigestsXofUtils_initialize();
  return OrgBouncycastleUtilArrays_concatenateWithByteArray_withByteArray_(OrgBouncycastleCryptoDigestsXofUtils_leftEncodeWithLong_(8), [IOSByteArray newArrayWithBytes:(jbyte[]){ X } count:1]);
}

IOSByteArray *OrgBouncycastleCryptoDigestsXofUtils_encodeWithByteArray_withInt_withInt_(IOSByteArray *inArg, jint inOff, jint len) {
  OrgBouncycastleCryptoDigestsXofUtils_initialize();
  if (((IOSByteArray *) nil_chk(inArg))->size_ == len) {
    
#line 60
    return OrgBouncycastleUtilArrays_concatenateWithByteArray_withByteArray_(OrgBouncycastleCryptoDigestsXofUtils_leftEncodeWithLong_(len * 8), inArg);
  }
  return OrgBouncycastleUtilArrays_concatenateWithByteArray_withByteArray_(OrgBouncycastleCryptoDigestsXofUtils_leftEncodeWithLong_(len * 8), OrgBouncycastleUtilArrays_copyOfRangeWithByteArray_withInt_withInt_(inArg, inOff, inOff + len));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleCryptoDigestsXofUtils)
