//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/cmce/GF13.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "org/bouncycastle/pqc/crypto/cmce/GF.h"
#include "org/bouncycastle/pqc/crypto/cmce/GF13.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/pqc/crypto/cmce/GF13 must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastlePqcCryptoCmceGF13 ()

- (jshort)gf_sqmulWithShort:(jshort)inArg
                  withShort:(jshort)m;

- (jshort)gf_sq2mulWithShort:(jshort)inArg
                   withShort:(jshort)m;

@end

__attribute__((unused)) static jshort OrgBouncycastlePqcCryptoCmceGF13_gf_sqmulWithShort_withShort_(OrgBouncycastlePqcCryptoCmceGF13 *self, jshort inArg, jshort m);

__attribute__((unused)) static jshort OrgBouncycastlePqcCryptoCmceGF13_gf_sq2mulWithShort_withShort_(OrgBouncycastlePqcCryptoCmceGF13 *self, jshort inArg, jshort m);

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/cmce/GF13.java"


#line 3
@implementation OrgBouncycastlePqcCryptoCmceGF13


#line 6
- (instancetype)initPackagePrivateWithInt:(jint)gfbits {
  OrgBouncycastlePqcCryptoCmceGF13_initPackagePrivateWithInt_(self, gfbits);
  return self;
}

- (jshort)gf_mulWithShort:(jshort)in0
                withShort:(jshort)in1 {
  
#line 14
  jint i;
  
#line 16
  jlong tmp;
  jlong t0;
  jlong t1;
  jlong t;
  
#line 21
  t0 = in0;
  t1 = in1;
  
#line 24
  tmp = t0 * (t1 & 1);
  
#line 26
  for (i = 1; i < GFBITS_; i++)
#line 27
  tmp ^= (t0 * (t1 & (JreLShift32(1, i))));
  
#line 31
  t = tmp & (jlong) 0x1FF0000LL;
  tmp ^= (JreRShift64(t, 9)) ^ (JreRShift64(t, 10)) ^ (JreRShift64(t, 12)) ^ (JreRShift64(t, 13));
  
#line 34
  t = tmp & (jlong) 0x000E000LL;
  tmp ^= (JreRShift64(t, 9)) ^ (JreRShift64(t, 10)) ^ (JreRShift64(t, 12)) ^ (JreRShift64(t, 13));
  
#line 37
  return (jshort) (tmp & GFMASK_);
}


#line 42
- (jshort)gf_sq2WithShort:(jshort)inArg {
  
#line 44
  jint i;
  
#line 46
  IOSLongArray *B = [IOSLongArray newArrayWithLongs:(jlong[]){ (jlong) 0x1111111111111111LL,
#line 47
  (jlong) 0x0303030303030303LL,
#line 48
  (jlong) 0x000F000F000F000FLL,
#line 49
  (jlong) 0x000000FF000000FFLL } count:4];
  
#line 51
  IOSLongArray *M = [IOSLongArray newArrayWithLongs:(jlong[]){ (jlong) 0x0001FF0000000000LL,
#line 52
  (jlong) 0x000000FF80000000LL,
#line 53
  (jlong) 0x000000007FC00000LL,
#line 54
  (jlong) 0x00000000003FE000LL } count:4];
  
#line 56
  jlong x = inArg;
  jlong t;
  
#line 59
  x = (x | (JreLShift64(x, 24))) & IOSLongArray_Get(B, 3);
  x = (x | (JreLShift64(x, 12))) & IOSLongArray_Get(B, 2);
  x = (x | (JreLShift64(x, 6))) & IOSLongArray_Get(B, 1);
  x = (x | (JreLShift64(x, 3))) & IOSLongArray_Get(B, 0);
  
#line 64
  for (i = 0; i < 4; i++) {
    
#line 66
    t = x & IOSLongArray_Get(M, i);
    x ^= (JreRShift64(t, 9)) ^ (JreRShift64(t, 10)) ^ (JreRShift64(t, 12)) ^ (JreRShift64(t, 13));
  }
  
#line 70
  return (jshort) (x & GFMASK_);
}


#line 75
- (jshort)gf_sqmulWithShort:(jshort)inArg
                  withShort:(jshort)m {
  return OrgBouncycastlePqcCryptoCmceGF13_gf_sqmulWithShort_withShort_(self, inArg, m);
}


#line 113
- (jshort)gf_sq2mulWithShort:(jshort)inArg
                   withShort:(jshort)m {
  return OrgBouncycastlePqcCryptoCmceGF13_gf_sq2mulWithShort_withShort_(self, inArg, m);
}


#line 154
- (jshort)gf_fracWithShort:(jshort)den
                 withShort:(jshort)num {
  
#line 157
  jshort tmp_11;
  jshort tmp_1111;
  jshort out;
  
#line 161
  tmp_11 = OrgBouncycastlePqcCryptoCmceGF13_gf_sqmulWithShort_withShort_(self, den, den);
  tmp_1111 = OrgBouncycastlePqcCryptoCmceGF13_gf_sq2mulWithShort_withShort_(self, tmp_11, tmp_11);
  out = [self gf_sq2WithShort:tmp_1111];
  out = OrgBouncycastlePqcCryptoCmceGF13_gf_sq2mulWithShort_withShort_(self, out, tmp_1111);
  out = [self gf_sq2WithShort:out];
  out = OrgBouncycastlePqcCryptoCmceGF13_gf_sq2mulWithShort_withShort_(self, out, tmp_1111);
  
#line 168
  return OrgBouncycastlePqcCryptoCmceGF13_gf_sqmulWithShort_withShort_(self, out, num);
}


#line 171
- (jshort)gf_invWithShort:(jshort)den {
  
#line 174
  return [self gf_fracWithShort:den withShort:((jshort) 1)];
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, 0, -1, -1, -1, -1 },
    { NULL, "S", 0x4, 1, 2, -1, -1, -1, -1 },
    { NULL, "S", 0x4, 3, 4, -1, -1, -1, -1 },
    { NULL, "S", 0x2, 5, 2, -1, -1, -1, -1 },
    { NULL, "S", 0x2, 6, 2, -1, -1, -1, -1 },
    { NULL, "S", 0x4, 7, 2, -1, -1, -1, -1 },
    { NULL, "S", 0x4, 8, 4, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initPackagePrivateWithInt:);
  methods[1].selector = @selector(gf_mulWithShort:withShort:);
  methods[2].selector = @selector(gf_sq2WithShort:);
  methods[3].selector = @selector(gf_sqmulWithShort:withShort:);
  methods[4].selector = @selector(gf_sq2mulWithShort:withShort:);
  methods[5].selector = @selector(gf_fracWithShort:withShort:);
  methods[6].selector = @selector(gf_invWithShort:);
  #pragma clang diagnostic pop
  static const void *ptrTable[] = { "I", "gf_mul", "SS", "gf_sq2", "S", "gf_sqmul", "gf_sq2mul", "gf_frac", "gf_inv" };
  static const J2ObjcClassInfo _OrgBouncycastlePqcCryptoCmceGF13 = { "GF13", "org.bouncycastle.pqc.crypto.cmce", ptrTable, methods, NULL, 7, 0x0, 7, 0, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastlePqcCryptoCmceGF13;
}

@end


#line 6
void OrgBouncycastlePqcCryptoCmceGF13_initPackagePrivateWithInt_(OrgBouncycastlePqcCryptoCmceGF13 *self, jint gfbits) {
  OrgBouncycastlePqcCryptoCmceGF_initPackagePrivateWithInt_(self,
#line 8
  gfbits);
}


#line 6
OrgBouncycastlePqcCryptoCmceGF13 *new_OrgBouncycastlePqcCryptoCmceGF13_initPackagePrivateWithInt_(jint gfbits) {
  J2OBJC_NEW_IMPL(OrgBouncycastlePqcCryptoCmceGF13, initPackagePrivateWithInt_, gfbits)
}


#line 6
OrgBouncycastlePqcCryptoCmceGF13 *create_OrgBouncycastlePqcCryptoCmceGF13_initPackagePrivateWithInt_(jint gfbits) {
  J2OBJC_CREATE_IMPL(OrgBouncycastlePqcCryptoCmceGF13, initPackagePrivateWithInt_, gfbits)
}


#line 75
jshort OrgBouncycastlePqcCryptoCmceGF13_gf_sqmulWithShort_withShort_(OrgBouncycastlePqcCryptoCmceGF13 *self, jshort inArg, jshort m) {
  
#line 77
  jint i;
  
#line 79
  jlong x;
  jlong t0;
  jlong t1;
  jlong t;
  
#line 84
  IOSLongArray *M = [IOSLongArray newArrayWithLongs:(jlong[]){ (jlong) 0x0000001FF0000000LL,
#line 85
  (jlong) 0x000000000FF80000LL,
#line 86
  (jlong) 0x000000000007E000LL } count:3];
  
#line 88
  t0 = inArg;
  t1 = m;
  
#line 91
  x = (JreLShift64(t1, 6)) * (t0 & (JreLShift32(1, 6)));
  
#line 93
  t0 ^= (JreLShift64(t0, 7));
  
#line 95
  x ^= (t1 * (t0 & ((jint) 0x04001)));
  x ^= JreLShift64((t1 * (t0 & ((jint) 0x08002))), 1);
  x ^= JreLShift64((t1 * (t0 & ((jint) 0x10004))), 2);
  x ^= JreLShift64((t1 * (t0 & ((jint) 0x20008))), 3);
  x ^= JreLShift64((t1 * (t0 & ((jint) 0x40010))), 4);
  x ^= JreLShift64((t1 * (t0 & ((jint) 0x80020))), 5);
  
#line 102
  for (i = 0; i < 3; i++) {
    
#line 104
    t = x & IOSLongArray_Get(M, i);
    x ^= (JreRShift64(t, 9)) ^ (JreRShift64(t, 10)) ^ (JreRShift64(t, 12)) ^ (JreRShift64(t, 13));
  }
  
#line 108
  return (jshort) (x & self->GFMASK_);
}


#line 113
jshort OrgBouncycastlePqcCryptoCmceGF13_gf_sq2mulWithShort_withShort_(OrgBouncycastlePqcCryptoCmceGF13 *self, jshort inArg, jshort m) {
  
#line 115
  jint i;
  
#line 117
  jlong x;
  jlong t0;
  jlong t1;
  jlong t;
  
#line 122
  IOSLongArray *M = [IOSLongArray newArrayWithLongs:(jlong[]){ (jlong) 0x1FF0000000000000LL,
#line 123
  (jlong) 0x000FF80000000000LL,
#line 124
  (jlong) 0x000007FC00000000LL,
#line 125
  (jlong) 0x00000003FE000000LL,
#line 126
  (jlong) 0x0000000001FE0000LL,
#line 127
  (jlong) 0x000000000001E000LL } count:6];
  
#line 129
  t0 = inArg;
  t1 = m;
  
#line 132
  x = (JreLShift64(t1, 18)) * (t0 & (JreLShift32(1, 6)));
  
#line 134
  t0 ^= (JreLShift64(t0, 21));
  
#line 136
  x ^= (t1 * (t0 & ((jlong) 0x010000001LL)));
  x ^= JreLShift64((t1 * (t0 & ((jlong) 0x020000002LL))), 3);
  x ^= JreLShift64((t1 * (t0 & ((jlong) 0x040000004LL))), 6);
  x ^= JreLShift64((t1 * (t0 & ((jlong) 0x080000008LL))), 9);
  x ^= JreLShift64((t1 * (t0 & ((jlong) 0x100000010LL))), 12);
  x ^= JreLShift64((t1 * (t0 & ((jlong) 0x200000020LL))), 15);
  
#line 143
  for (i = 0; i < 6; i++) {
    
#line 145
    t = x & IOSLongArray_Get(M, i);
    x ^= (JreRShift64(t, 9)) ^ (JreRShift64(t, 10)) ^ (JreRShift64(t, 12)) ^ (JreRShift64(t, 13));
  }
  
#line 149
  return (jshort) (x & self->GFMASK_);
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastlePqcCryptoCmceGF13)
