//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/cmce/BENES.java
//

#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "org/bouncycastle/pqc/crypto/cmce/BENES.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/pqc/crypto/cmce/BENES must be compiled with ARC (-fobjc-arc)"
#endif

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/cmce/BENES.java"


#line 3
@implementation OrgBouncycastlePqcCryptoCmceBENES


#line 9
- (instancetype)initPackagePrivateWithInt:(jint)n
                                  withInt:(jint)t
                                  withInt:(jint)m {
  OrgBouncycastlePqcCryptoCmceBENES_initPackagePrivateWithInt_withInt_withInt_(self, n, t, m);
  return self;
}


#line 18
+ (void)transpose_64x64WithLongArray:(IOSLongArray *)outArg
                       withLongArray:(IOSLongArray *)inArg {
  OrgBouncycastlePqcCryptoCmceBENES_transpose_64x64WithLongArray_withLongArray_(outArg, inArg);
}


#line 53
+ (void)transpose_64x64WithLongArray:(IOSLongArray *)outArg
                       withLongArray:(IOSLongArray *)inArg
                             withInt:(jint)offset {
  OrgBouncycastlePqcCryptoCmceBENES_transpose_64x64WithLongArray_withLongArray_withInt_(outArg, inArg, offset);
}


#line 89
- (void)support_genWithShortArray:(IOSShortArray *)s
                    withByteArray:(IOSByteArray *)c {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, 0, -1, -1, -1, -1 },
    { NULL, "V", 0x8, 1, 2, -1, -1, -1, -1 },
    { NULL, "V", 0x8, 1, 3, -1, -1, -1, -1 },
    { NULL, "V", 0x404, 4, 5, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initPackagePrivateWithInt:withInt:withInt:);
  methods[1].selector = @selector(transpose_64x64WithLongArray:withLongArray:);
  methods[2].selector = @selector(transpose_64x64WithLongArray:withLongArray:withInt:);
  methods[3].selector = @selector(support_genWithShortArray:withByteArray:);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "SYS_N_", "I", .constantValue.asLong = 0, 0x14, -1, -1, -1, -1 },
    { "SYS_T_", "I", .constantValue.asLong = 0, 0x14, -1, -1, -1, -1 },
    { "GFBITS_", "I", .constantValue.asLong = 0, 0x14, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "III", "transpose_64x64", "[J[J", "[J[JI", "support_gen", "[S[B" };
  static const J2ObjcClassInfo _OrgBouncycastlePqcCryptoCmceBENES = { "BENES", "org.bouncycastle.pqc.crypto.cmce", ptrTable, methods, fields, 7, 0x400, 4, 3, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastlePqcCryptoCmceBENES;
}

@end


#line 9
void OrgBouncycastlePqcCryptoCmceBENES_initPackagePrivateWithInt_withInt_withInt_(OrgBouncycastlePqcCryptoCmceBENES *self, jint n, jint t, jint m) {
  NSObject_init(self);
  self->SYS_N_ = n;
  self->SYS_T_ = t;
  self->GFBITS_ = m;
}


#line 18
void OrgBouncycastlePqcCryptoCmceBENES_transpose_64x64WithLongArray_withLongArray_(IOSLongArray *outArg, IOSLongArray *inArg) {
  OrgBouncycastlePqcCryptoCmceBENES_initialize();
  jint i;
  
#line 20
  jint j;
  
#line 20
  jint s;
  
#line 20
  jint d;
  
#line 22
  jlong x;
  
#line 22
  jlong y;
  IOSObjectArray *masks = [IOSObjectArray newArrayWithObjects:(id[]){ [IOSLongArray newArrayWithLongs:(jlong[]){
#line 24
    (jlong) 0x5555555555555555LL, (jlong) 0xAAAAAAAAAAAAAAAALL } count:2], [IOSLongArray newArrayWithLongs:(jlong[]){
#line 25
      (jlong) 0x3333333333333333LL, (jlong) 0xCCCCCCCCCCCCCCCCLL } count:2], [IOSLongArray newArrayWithLongs:(jlong[]){
#line 26
        (jlong) 0x0F0F0F0F0F0F0F0FLL, (jlong) 0xF0F0F0F0F0F0F0F0LL } count:2], [IOSLongArray newArrayWithLongs:(jlong[]){
#line 27
          (jlong) 0x00FF00FF00FF00FFLL, (jlong) 0xFF00FF00FF00FF00LL } count:2], [IOSLongArray newArrayWithLongs:(jlong[]){
#line 28
            (jlong) 0x0000FFFF0000FFFFLL, (jlong) 0xFFFF0000FFFF0000LL } count:2], [IOSLongArray newArrayWithLongs:(jlong[]){
#line 29
              (jlong) 0x00000000FFFFFFFFLL, (jlong) 0xFFFFFFFF00000000LL } count:2] } count:6 type:IOSClass_longArray(1)];
              
#line 32
              for (i = 0; i < 64; i++)
#line 33
              *IOSLongArray_GetRef(nil_chk(outArg), i) = IOSLongArray_Get(nil_chk(inArg), i);
              
#line 35
              for (d = 5; d >= 0; d--) {
                
#line 37
                s = JreLShift32(1, d);
                for (i = 0; i < 64; i += s * 2) {
                  
#line 40
                  for (j = i; j < i + s; j++) {
                    
#line 42
                    x = (IOSLongArray_Get(nil_chk(outArg), j) & IOSLongArray_Get(nil_chk(IOSObjectArray_Get(masks, d)), 0)) | (JreLShift64((IOSLongArray_Get(outArg, j + s) & IOSLongArray_Get(nil_chk(IOSObjectArray_Get(masks, d)), 0)), s));
                    y = (JreURShift64((IOSLongArray_Get(outArg, j) & IOSLongArray_Get(nil_chk(IOSObjectArray_Get(masks, d)), 1)), s)) | (IOSLongArray_Get(outArg, j + s) & IOSLongArray_Get(nil_chk(IOSObjectArray_Get(masks, d)), 1));
                    
#line 45
                    *IOSLongArray_GetRef(outArg, j + 0) = x;
                    *IOSLongArray_GetRef(outArg, j + s) = y;
                  }
                }
              }
            }


#line 53
void OrgBouncycastlePqcCryptoCmceBENES_transpose_64x64WithLongArray_withLongArray_withInt_(IOSLongArray *outArg, IOSLongArray *inArg, jint offset) {
  OrgBouncycastlePqcCryptoCmceBENES_initialize();
  jint i;
  
#line 55
  jint j;
  
#line 55
  jint s;
  
#line 55
  jint d;
  
#line 57
  jlong x;
  
#line 57
  jlong y;
  IOSObjectArray *masks = [IOSObjectArray newArrayWithObjects:(id[]){ [IOSLongArray newArrayWithLongs:(jlong[]){
#line 59
    (jlong) 0x5555555555555555LL, (jlong) 0xAAAAAAAAAAAAAAAALL } count:2], [IOSLongArray newArrayWithLongs:(jlong[]){
#line 60
      (jlong) 0x3333333333333333LL, (jlong) 0xCCCCCCCCCCCCCCCCLL } count:2], [IOSLongArray newArrayWithLongs:(jlong[]){
#line 61
        (jlong) 0x0F0F0F0F0F0F0F0FLL, (jlong) 0xF0F0F0F0F0F0F0F0LL } count:2], [IOSLongArray newArrayWithLongs:(jlong[]){
#line 62
          (jlong) 0x00FF00FF00FF00FFLL, (jlong) 0xFF00FF00FF00FF00LL } count:2], [IOSLongArray newArrayWithLongs:(jlong[]){
#line 63
            (jlong) 0x0000FFFF0000FFFFLL, (jlong) 0xFFFF0000FFFF0000LL } count:2], [IOSLongArray newArrayWithLongs:(jlong[]){
#line 64
              (jlong) 0x00000000FFFFFFFFLL, (jlong) 0xFFFFFFFF00000000LL } count:2] } count:6 type:IOSClass_longArray(1)];
              
#line 67
              for (i = 0; i < 64; i++)
#line 68
              *IOSLongArray_GetRef(nil_chk(outArg), i + offset) = IOSLongArray_Get(nil_chk(inArg), i + offset);
              
#line 70
              for (d = 5; d >= 0; d--) {
                
#line 72
                s = JreLShift32(1, d);
                for (i = 0; i < 64; i += s * 2) {
                  
#line 75
                  for (j = i; j < i + s; j++) {
                    
#line 77
                    x = (IOSLongArray_Get(nil_chk(outArg), j + offset) & IOSLongArray_Get(nil_chk(IOSObjectArray_Get(masks, d)), 0)) | (JreLShift64((IOSLongArray_Get(outArg, j + s + offset) & IOSLongArray_Get(nil_chk(IOSObjectArray_Get(masks, d)), 0)), s));
                    y = (JreURShift64((IOSLongArray_Get(outArg, j + offset) & IOSLongArray_Get(nil_chk(IOSObjectArray_Get(masks, d)), 1)), s)) | (IOSLongArray_Get(outArg, j + s + offset) & IOSLongArray_Get(nil_chk(IOSObjectArray_Get(masks, d)), 1));
                    
#line 80
                    *IOSLongArray_GetRef(outArg, j + 0 + offset) = x;
                    *IOSLongArray_GetRef(outArg, j + s + offset) = y;
                  }
                }
              }
            }

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastlePqcCryptoCmceBENES)
