//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/crypto/digests/SHA224Digest.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/lang/System.h"
#include "org/bouncycastle/crypto/digests/GeneralDigest.h"
#include "org/bouncycastle/crypto/digests/SHA224Digest.h"
#include "org/bouncycastle/util/Memoable.h"
#include "org/bouncycastle/util/Pack.h"

static void (*OrgBouncycastleCryptoDigestsSHA224Digest_super$_copyInWithOrgBouncycastleCryptoDigestsGeneralDigest_)(id, SEL, id);

#if !__has_feature(objc_arc)
#error "org/bouncycastle/crypto/digests/SHA224Digest must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastleCryptoDigestsSHA224Digest () {
 @public
  jint H1_;
  jint H2_;
  jint H3_;
  jint H4_;
  jint H5_;
  jint H6_;
  jint H7_;
  jint H8_;
  IOSIntArray *X_;
  jint xOff_;
}

- (void)doCopyWithOrgBouncycastleCryptoDigestsSHA224Digest:(OrgBouncycastleCryptoDigestsSHA224Digest *)t;

- (jint)ChWithInt:(jint)x
          withInt:(jint)y
          withInt:(jint)z;

- (jint)MajWithInt:(jint)x
           withInt:(jint)y
           withInt:(jint)z;

- (jint)Sum0WithInt:(jint)x;

- (jint)Sum1WithInt:(jint)x;

- (jint)Theta0WithInt:(jint)x;

- (jint)Theta1WithInt:(jint)x;

@end

J2OBJC_FIELD_SETTER(OrgBouncycastleCryptoDigestsSHA224Digest, X_, IOSIntArray *)

inline jint OrgBouncycastleCryptoDigestsSHA224Digest_get_DIGEST_LENGTH(void);
#define OrgBouncycastleCryptoDigestsSHA224Digest_DIGEST_LENGTH 28
J2OBJC_STATIC_FIELD_CONSTANT(OrgBouncycastleCryptoDigestsSHA224Digest, DIGEST_LENGTH, jint)

__attribute__((unused)) static void OrgBouncycastleCryptoDigestsSHA224Digest_doCopyWithOrgBouncycastleCryptoDigestsSHA224Digest_(OrgBouncycastleCryptoDigestsSHA224Digest *self, OrgBouncycastleCryptoDigestsSHA224Digest *t);

__attribute__((unused)) static jint OrgBouncycastleCryptoDigestsSHA224Digest_ChWithInt_withInt_withInt_(OrgBouncycastleCryptoDigestsSHA224Digest *self, jint x, jint y, jint z);

__attribute__((unused)) static jint OrgBouncycastleCryptoDigestsSHA224Digest_MajWithInt_withInt_withInt_(OrgBouncycastleCryptoDigestsSHA224Digest *self, jint x, jint y, jint z);

__attribute__((unused)) static jint OrgBouncycastleCryptoDigestsSHA224Digest_Sum0WithInt_(OrgBouncycastleCryptoDigestsSHA224Digest *self, jint x);

__attribute__((unused)) static jint OrgBouncycastleCryptoDigestsSHA224Digest_Sum1WithInt_(OrgBouncycastleCryptoDigestsSHA224Digest *self, jint x);

__attribute__((unused)) static jint OrgBouncycastleCryptoDigestsSHA224Digest_Theta0WithInt_(OrgBouncycastleCryptoDigestsSHA224Digest *self, jint x);

__attribute__((unused)) static jint OrgBouncycastleCryptoDigestsSHA224Digest_Theta1WithInt_(OrgBouncycastleCryptoDigestsSHA224Digest *self, jint x);

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/crypto/digests/SHA224Digest.java"

J2OBJC_INITIALIZED_DEFN(OrgBouncycastleCryptoDigestsSHA224Digest)

IOSIntArray *OrgBouncycastleCryptoDigestsSHA224Digest_K;


#line 19
@implementation OrgBouncycastleCryptoDigestsSHA224Digest

J2OBJC_IGNORE_DESIGNATED_BEGIN

#line 33
- (instancetype)init {
  OrgBouncycastleCryptoDigestsSHA224Digest_init(self);
  return self;
}
J2OBJC_IGNORE_DESIGNATED_END


#line 42
- (instancetype)initWithOrgBouncycastleCryptoDigestsSHA224Digest:(OrgBouncycastleCryptoDigestsSHA224Digest *)t {
  OrgBouncycastleCryptoDigestsSHA224Digest_initWithOrgBouncycastleCryptoDigestsSHA224Digest_(self, t);
  return self;
}


#line 49
- (void)doCopyWithOrgBouncycastleCryptoDigestsSHA224Digest:(OrgBouncycastleCryptoDigestsSHA224Digest *)t {
  OrgBouncycastleCryptoDigestsSHA224Digest_doCopyWithOrgBouncycastleCryptoDigestsSHA224Digest_(self, t);
}


#line 71
- (instancetype)initWithByteArray:(IOSByteArray *)encodedState {
  OrgBouncycastleCryptoDigestsSHA224Digest_initWithByteArray_(self, encodedState);
  return self;
}


#line 91
- (NSString *)getAlgorithmName {
  
#line 94
  return @"SHA-224";
}

- (jint)getDigestSize {
  
#line 100
  return OrgBouncycastleCryptoDigestsSHA224Digest_DIGEST_LENGTH;
}

- (void)processWordWithByteArray:(IOSByteArray *)inArg
                         withInt:(jint)inOff {
  
#line 110
  jint n = JreLShift32(IOSByteArray_Get(nil_chk(inArg), inOff), 24);
  n |= JreLShift32((IOSByteArray_Get(inArg, ++inOff) & (jint) 0xff), 16);
  n |= JreLShift32((IOSByteArray_Get(inArg, ++inOff) & (jint) 0xff), 8);
  n |= (IOSByteArray_Get(inArg, ++inOff) & (jint) 0xff);
  *IOSIntArray_GetRef(nil_chk(X_), xOff_) = n;
  
#line 116
  if (++xOff_ == 16) {
    
#line 118
    [self processBlock];
  }
}


#line 122
- (void)processLengthWithLong:(jlong)bitLength {
  
#line 126
  if (xOff_ > 14) {
    
#line 128
    [self processBlock];
  }
  
#line 131
  *IOSIntArray_GetRef(nil_chk(X_), 14) = (jint) (JreURShift64(bitLength, 32));
  *IOSIntArray_GetRef(X_, 15) = (jint) (bitLength & (jint) 0xffffffff);
}


#line 135
- (jint)doFinalWithByteArray:(IOSByteArray *)outArg
                     withInt:(jint)outOff {
  
#line 140
  [self finish];
  
#line 142
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H1_, outArg, outOff);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H2_, outArg, outOff + 4);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H3_, outArg, outOff + 8);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H4_, outArg, outOff + 12);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H5_, outArg, outOff + 16);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H6_, outArg, outOff + 20);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H7_, outArg, outOff + 24);
  
#line 150
  [self reset];
  
#line 152
  return OrgBouncycastleCryptoDigestsSHA224Digest_DIGEST_LENGTH;
}


#line 158
- (void)reset {
  
#line 161
  [super reset];
  
#line 166
  H1_ = (jint) 0xc1059ed8;
  H2_ = (jint) 0x367cd507;
  H3_ = (jint) 0x3070dd17;
  H4_ = (jint) 0xf70e5939;
  H5_ = (jint) 0xffc00b31;
  H6_ = (jint) 0x68581511;
  H7_ = (jint) 0x64f98fa7;
  H8_ = (jint) 0xbefa4fa4;
  
#line 175
  xOff_ = 0;
  for (jint i = 0; i != ((IOSIntArray *) nil_chk(X_))->size_; i++) {
    
#line 178
    *IOSIntArray_GetRef(X_, i) = 0;
  }
}

- (void)processBlock {
  
#line 188
  for (jint t = 16; t <= 63; t++) {
    
#line 190
    *IOSIntArray_GetRef(nil_chk(X_), t) = OrgBouncycastleCryptoDigestsSHA224Digest_Theta1WithInt_(self, IOSIntArray_Get(X_, t - 2)) + IOSIntArray_Get(nil_chk(X_), t - 7) + OrgBouncycastleCryptoDigestsSHA224Digest_Theta0WithInt_(self, IOSIntArray_Get(X_, t - 15)) + IOSIntArray_Get(nil_chk(X_), t - 16);
  }
  
#line 196
  jint a = H1_;
  jint b = H2_;
  jint c = H3_;
  jint d = H4_;
  jint e = H5_;
  jint f = H6_;
  jint g = H7_;
  jint h = H8_;
  
#line 206
  jint t = 0;
  for (jint i = 0; i < 8; i++) {
    
#line 210
    h += OrgBouncycastleCryptoDigestsSHA224Digest_Sum1WithInt_(self, e) + OrgBouncycastleCryptoDigestsSHA224Digest_ChWithInt_withInt_withInt_(self, e, f, g) + IOSIntArray_Get(nil_chk(OrgBouncycastleCryptoDigestsSHA224Digest_K), t) + IOSIntArray_Get(nil_chk(X_), t);
    d += h;
    h += OrgBouncycastleCryptoDigestsSHA224Digest_Sum0WithInt_(self, a) + OrgBouncycastleCryptoDigestsSHA224Digest_MajWithInt_withInt_withInt_(self, a, b, c);
    ++t;
    
#line 216
    g += OrgBouncycastleCryptoDigestsSHA224Digest_Sum1WithInt_(self, d) + OrgBouncycastleCryptoDigestsSHA224Digest_ChWithInt_withInt_withInt_(self, d, e, f) + IOSIntArray_Get(OrgBouncycastleCryptoDigestsSHA224Digest_K, t) + IOSIntArray_Get(nil_chk(X_), t);
    c += g;
    g += OrgBouncycastleCryptoDigestsSHA224Digest_Sum0WithInt_(self, h) + OrgBouncycastleCryptoDigestsSHA224Digest_MajWithInt_withInt_withInt_(self, h, a, b);
    ++t;
    
#line 222
    f += OrgBouncycastleCryptoDigestsSHA224Digest_Sum1WithInt_(self, c) + OrgBouncycastleCryptoDigestsSHA224Digest_ChWithInt_withInt_withInt_(self, c, d, e) + IOSIntArray_Get(OrgBouncycastleCryptoDigestsSHA224Digest_K, t) + IOSIntArray_Get(nil_chk(X_), t);
    b += f;
    f += OrgBouncycastleCryptoDigestsSHA224Digest_Sum0WithInt_(self, g) + OrgBouncycastleCryptoDigestsSHA224Digest_MajWithInt_withInt_withInt_(self, g, h, a);
    ++t;
    
#line 228
    e += OrgBouncycastleCryptoDigestsSHA224Digest_Sum1WithInt_(self, b) + OrgBouncycastleCryptoDigestsSHA224Digest_ChWithInt_withInt_withInt_(self, b, c, d) + IOSIntArray_Get(OrgBouncycastleCryptoDigestsSHA224Digest_K, t) + IOSIntArray_Get(nil_chk(X_), t);
    a += e;
    e += OrgBouncycastleCryptoDigestsSHA224Digest_Sum0WithInt_(self, f) + OrgBouncycastleCryptoDigestsSHA224Digest_MajWithInt_withInt_withInt_(self, f, g, h);
    ++t;
    
#line 234
    d += OrgBouncycastleCryptoDigestsSHA224Digest_Sum1WithInt_(self, a) + OrgBouncycastleCryptoDigestsSHA224Digest_ChWithInt_withInt_withInt_(self, a, b, c) + IOSIntArray_Get(OrgBouncycastleCryptoDigestsSHA224Digest_K, t) + IOSIntArray_Get(nil_chk(X_), t);
    h += d;
    d += OrgBouncycastleCryptoDigestsSHA224Digest_Sum0WithInt_(self, e) + OrgBouncycastleCryptoDigestsSHA224Digest_MajWithInt_withInt_withInt_(self, e, f, g);
    ++t;
    
#line 240
    c += OrgBouncycastleCryptoDigestsSHA224Digest_Sum1WithInt_(self, h) + OrgBouncycastleCryptoDigestsSHA224Digest_ChWithInt_withInt_withInt_(self, h, a, b) + IOSIntArray_Get(OrgBouncycastleCryptoDigestsSHA224Digest_K, t) + IOSIntArray_Get(nil_chk(X_), t);
    g += c;
    c += OrgBouncycastleCryptoDigestsSHA224Digest_Sum0WithInt_(self, d) + OrgBouncycastleCryptoDigestsSHA224Digest_MajWithInt_withInt_withInt_(self, d, e, f);
    ++t;
    
#line 246
    b += OrgBouncycastleCryptoDigestsSHA224Digest_Sum1WithInt_(self, g) + OrgBouncycastleCryptoDigestsSHA224Digest_ChWithInt_withInt_withInt_(self, g, h, a) + IOSIntArray_Get(OrgBouncycastleCryptoDigestsSHA224Digest_K, t) + IOSIntArray_Get(nil_chk(X_), t);
    f += b;
    b += OrgBouncycastleCryptoDigestsSHA224Digest_Sum0WithInt_(self, c) + OrgBouncycastleCryptoDigestsSHA224Digest_MajWithInt_withInt_withInt_(self, c, d, e);
    ++t;
    
#line 252
    a += OrgBouncycastleCryptoDigestsSHA224Digest_Sum1WithInt_(self, f) + OrgBouncycastleCryptoDigestsSHA224Digest_ChWithInt_withInt_withInt_(self, f, g, h) + IOSIntArray_Get(OrgBouncycastleCryptoDigestsSHA224Digest_K, t) + IOSIntArray_Get(nil_chk(X_), t);
    e += a;
    a += OrgBouncycastleCryptoDigestsSHA224Digest_Sum0WithInt_(self, b) + OrgBouncycastleCryptoDigestsSHA224Digest_MajWithInt_withInt_withInt_(self, b, c, d);
    ++t;
  }
  
#line 258
  H1_ += a;
  H2_ += b;
  H3_ += c;
  H4_ += d;
  H5_ += e;
  H6_ += f;
  H7_ += g;
  H8_ += h;
  
#line 270
  xOff_ = 0;
  for (jint i = 0; i < 16; i++) {
    
#line 273
    *IOSIntArray_GetRef(nil_chk(X_), i) = 0;
  }
}


#line 278
- (jint)ChWithInt:(jint)x
          withInt:(jint)y
          withInt:(jint)z {
  return OrgBouncycastleCryptoDigestsSHA224Digest_ChWithInt_withInt_withInt_(self, x, y, z);
}


#line 286
- (jint)MajWithInt:(jint)x
           withInt:(jint)y
           withInt:(jint)z {
  return OrgBouncycastleCryptoDigestsSHA224Digest_MajWithInt_withInt_withInt_(self, x, y, z);
}


#line 294
- (jint)Sum0WithInt:(jint)x {
  return OrgBouncycastleCryptoDigestsSHA224Digest_Sum0WithInt_(self, x);
}


#line 300
- (jint)Sum1WithInt:(jint)x {
  return OrgBouncycastleCryptoDigestsSHA224Digest_Sum1WithInt_(self, x);
}


#line 306
- (jint)Theta0WithInt:(jint)x {
  return OrgBouncycastleCryptoDigestsSHA224Digest_Theta0WithInt_(self, x);
}


#line 312
- (jint)Theta1WithInt:(jint)x {
  return OrgBouncycastleCryptoDigestsSHA224Digest_Theta1WithInt_(self, x);
}


#line 332
- (id<OrgBouncycastleUtilMemoable>)copy__ {
  
#line 335
  return new_OrgBouncycastleCryptoDigestsSHA224Digest_initWithOrgBouncycastleCryptoDigestsSHA224Digest_(self);
}

- (void)resetWithOrgBouncycastleUtilMemoable:(id<OrgBouncycastleUtilMemoable>)other {
  
#line 341
  OrgBouncycastleCryptoDigestsSHA224Digest *d = (OrgBouncycastleCryptoDigestsSHA224Digest *) cast_chk(other, [OrgBouncycastleCryptoDigestsSHA224Digest class]);
  
#line 343
  OrgBouncycastleCryptoDigestsSHA224Digest_doCopyWithOrgBouncycastleCryptoDigestsSHA224Digest_(self, d);
}


#line 346
- (IOSByteArray *)getEncodedState {
  
#line 349
  IOSByteArray *state = [IOSByteArray newArrayWithLength:52 + xOff_ * 4];
  
#line 351
  [super populateStateWithByteArray:state];
  
#line 353
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H1_, state, 16);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H2_, state, 20);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H3_, state, 24);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H4_, state, 28);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H5_, state, 32);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H6_, state, 36);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H7_, state, 40);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H8_, state, 44);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(xOff_, state, 48);
  
#line 363
  for (jint i = 0; i != xOff_; i++) {
    
#line 365
    OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(IOSIntArray_Get(nil_chk(X_), i), state, 52 + (i * 4));
  }
  
#line 368
  return state;
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, NULL, 0x1, -1, 0, -1, -1, -1, -1 },
    { NULL, "V", 0x2, 1, 0, -1, -1, -1, -1 },
    { NULL, NULL, 0x1, -1, 2, -1, -1, -1, -1 },
    { NULL, "LNSString;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "I", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "V", 0x4, 3, 4, -1, -1, -1, -1 },
    { NULL, "V", 0x4, 5, 6, -1, -1, -1, -1 },
    { NULL, "I", 0x1, 7, 4, -1, -1, -1, -1 },
    { NULL, "V", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "V", 0x4, -1, -1, -1, -1, -1, -1 },
    { NULL, "I", 0x2, 8, 9, -1, -1, -1, -1 },
    { NULL, "I", 0x2, 10, 9, -1, -1, -1, -1 },
    { NULL, "I", 0x2, 11, 12, -1, -1, -1, -1 },
    { NULL, "I", 0x2, 13, 12, -1, -1, -1, -1 },
    { NULL, "I", 0x2, 14, 12, -1, -1, -1, -1 },
    { NULL, "I", 0x2, 15, 12, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleUtilMemoable;", 0x1, 16, -1, -1, -1, -1, -1 },
    { NULL, "V", 0x1, 17, 18, -1, -1, -1, -1 },
    { NULL, "[B", 0x1, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(init);
  methods[1].selector = @selector(initWithOrgBouncycastleCryptoDigestsSHA224Digest:);
  methods[2].selector = @selector(doCopyWithOrgBouncycastleCryptoDigestsSHA224Digest:);
  methods[3].selector = @selector(initWithByteArray:);
  methods[4].selector = @selector(getAlgorithmName);
  methods[5].selector = @selector(getDigestSize);
  methods[6].selector = @selector(processWordWithByteArray:withInt:);
  methods[7].selector = @selector(processLengthWithLong:);
  methods[8].selector = @selector(doFinalWithByteArray:withInt:);
  methods[9].selector = @selector(reset);
  methods[10].selector = @selector(processBlock);
  methods[11].selector = @selector(ChWithInt:withInt:withInt:);
  methods[12].selector = @selector(MajWithInt:withInt:withInt:);
  methods[13].selector = @selector(Sum0WithInt:);
  methods[14].selector = @selector(Sum1WithInt:);
  methods[15].selector = @selector(Theta0WithInt:);
  methods[16].selector = @selector(Theta1WithInt:);
  methods[17].selector = @selector(copy__);
  methods[18].selector = @selector(resetWithOrgBouncycastleUtilMemoable:);
  methods[19].selector = @selector(getEncodedState);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "DIGEST_LENGTH", "I", .constantValue.asInt = OrgBouncycastleCryptoDigestsSHA224Digest_DIGEST_LENGTH, 0x1a, -1, -1, -1, -1 },
    { "H1_", "I", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "H2_", "I", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "H3_", "I", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "H4_", "I", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "H5_", "I", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "H6_", "I", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "H7_", "I", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "H8_", "I", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "X_", "[I", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "xOff_", "I", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "K", "[I", .constantValue.asLong = 0, 0x18, -1, 19, -1, -1 },
  };
  static const void *ptrTable[] = { "LOrgBouncycastleCryptoDigestsSHA224Digest;", "doCopy", "[B", "processWord", "[BI", "processLength", "J", "doFinal", "Ch", "III", "Maj", "Sum0", "I", "Sum1", "Theta0", "Theta1", "copy", "reset", "LOrgBouncycastleUtilMemoable;", &OrgBouncycastleCryptoDigestsSHA224Digest_K };
  static const J2ObjcClassInfo _OrgBouncycastleCryptoDigestsSHA224Digest = { "SHA224Digest", "org.bouncycastle.crypto.digests", ptrTable, methods, fields, 7, 0x1, 20, 12, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleCryptoDigestsSHA224Digest;
}

+ (void)initialize {
  if (self == [OrgBouncycastleCryptoDigestsSHA224Digest class]) {
    OrgBouncycastleCryptoDigestsSHA224Digest_super$_copyInWithOrgBouncycastleCryptoDigestsGeneralDigest_ = (void (*)(id, SEL, id))[OrgBouncycastleCryptoDigestsGeneralDigest instanceMethodForSelector:@selector(copyInWithOrgBouncycastleCryptoDigestsGeneralDigest:)];
    OrgBouncycastleCryptoDigestsSHA224Digest_K = [IOSIntArray newArrayWithInts:(jint[]){
#line 323
      (jint) 0x428a2f98, (jint) 0x71374491, (jint) 0xb5c0fbcf, (jint) 0xe9b5dba5, (jint) 0x3956c25b, (jint) 0x59f111f1, (jint) 0x923f82a4, (jint) 0xab1c5ed5,
#line 324
      (jint) 0xd807aa98, (jint) 0x12835b01, (jint) 0x243185be, (jint) 0x550c7dc3, (jint) 0x72be5d74, (jint) 0x80deb1fe, (jint) 0x9bdc06a7, (jint) 0xc19bf174,
#line 325
      (jint) 0xe49b69c1, (jint) 0xefbe4786, (jint) 0x0fc19dc6, (jint) 0x240ca1cc, (jint) 0x2de92c6f, (jint) 0x4a7484aa, (jint) 0x5cb0a9dc, (jint) 0x76f988da,
#line 326
      (jint) 0x983e5152, (jint) 0xa831c66d, (jint) 0xb00327c8, (jint) 0xbf597fc7, (jint) 0xc6e00bf3, (jint) 0xd5a79147, (jint) 0x06ca6351, (jint) 0x14292967,
#line 327
      (jint) 0x27b70a85, (jint) 0x2e1b2138, (jint) 0x4d2c6dfc, (jint) 0x53380d13, (jint) 0x650a7354, (jint) 0x766a0abb, (jint) 0x81c2c92e, (jint) 0x92722c85,
#line 328
      (jint) 0xa2bfe8a1, (jint) 0xa81a664b, (jint) 0xc24b8b70, (jint) 0xc76c51a3, (jint) 0xd192e819, (jint) 0xd6990624, (jint) 0xf40e3585, (jint) 0x106aa070, (jint) 0x19a4c116, (jint) 0x1e376c08, (jint) 0x2748774c, (jint) 0x34b0bcb5, (jint) 0x391c0cb3, (jint) 0x4ed8aa4a, (jint) 0x5b9cca4f, (jint) 0x682e6ff3,
#line 329
      (jint) 0x748f82ee, (jint) 0x78a5636f, (jint) 0x84c87814, (jint) 0x8cc70208, (jint) 0x90befffa, (jint) 0xa4506ceb, (jint) 0xbef9a3f7, (jint) 0xc67178f2 } count:64];
      J2OBJC_SET_INITIALIZED(OrgBouncycastleCryptoDigestsSHA224Digest)
    }
  }

@end


#line 33
void OrgBouncycastleCryptoDigestsSHA224Digest_init(OrgBouncycastleCryptoDigestsSHA224Digest *self) {
  OrgBouncycastleCryptoDigestsGeneralDigest_init(self);
  self->X_ = [IOSIntArray newArrayWithLength:
#line 27
  64];
  
#line 35
  [self reset];
}


#line 33
OrgBouncycastleCryptoDigestsSHA224Digest *new_OrgBouncycastleCryptoDigestsSHA224Digest_init() {
  J2OBJC_NEW_IMPL(OrgBouncycastleCryptoDigestsSHA224Digest, init)
}


#line 33
OrgBouncycastleCryptoDigestsSHA224Digest *create_OrgBouncycastleCryptoDigestsSHA224Digest_init() {
  J2OBJC_CREATE_IMPL(OrgBouncycastleCryptoDigestsSHA224Digest, init)
}


#line 42
void OrgBouncycastleCryptoDigestsSHA224Digest_initWithOrgBouncycastleCryptoDigestsSHA224Digest_(OrgBouncycastleCryptoDigestsSHA224Digest *self, OrgBouncycastleCryptoDigestsSHA224Digest *t) {
  OrgBouncycastleCryptoDigestsGeneralDigest_initWithOrgBouncycastleCryptoDigestsGeneralDigest_(self,
#line 44
  t);
  self->X_ = [IOSIntArray newArrayWithLength:
#line 27
  64];
  
#line 46
  OrgBouncycastleCryptoDigestsSHA224Digest_doCopyWithOrgBouncycastleCryptoDigestsSHA224Digest_(self, t);
}


#line 42
OrgBouncycastleCryptoDigestsSHA224Digest *new_OrgBouncycastleCryptoDigestsSHA224Digest_initWithOrgBouncycastleCryptoDigestsSHA224Digest_(OrgBouncycastleCryptoDigestsSHA224Digest *t) {
  J2OBJC_NEW_IMPL(OrgBouncycastleCryptoDigestsSHA224Digest, initWithOrgBouncycastleCryptoDigestsSHA224Digest_, t)
}


#line 42
OrgBouncycastleCryptoDigestsSHA224Digest *create_OrgBouncycastleCryptoDigestsSHA224Digest_initWithOrgBouncycastleCryptoDigestsSHA224Digest_(OrgBouncycastleCryptoDigestsSHA224Digest *t) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleCryptoDigestsSHA224Digest, initWithOrgBouncycastleCryptoDigestsSHA224Digest_, t)
}


#line 49
void OrgBouncycastleCryptoDigestsSHA224Digest_doCopyWithOrgBouncycastleCryptoDigestsSHA224Digest_(OrgBouncycastleCryptoDigestsSHA224Digest *self, OrgBouncycastleCryptoDigestsSHA224Digest *t) {
  
#line 51
  OrgBouncycastleCryptoDigestsSHA224Digest_super$_copyInWithOrgBouncycastleCryptoDigestsGeneralDigest_(self, @selector(copyInWithOrgBouncycastleCryptoDigestsGeneralDigest:), t);
  
#line 53
  self->H1_ = ((OrgBouncycastleCryptoDigestsSHA224Digest *) nil_chk(t))->H1_;
  self->H2_ = t->H2_;
  self->H3_ = t->H3_;
  self->H4_ = t->H4_;
  self->H5_ = t->H5_;
  self->H6_ = t->H6_;
  self->H7_ = t->H7_;
  self->H8_ = t->H8_;
  
#line 62
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(t->X_, 0, self->X_, 0, ((IOSIntArray *) nil_chk(t->X_))->size_);
  self->xOff_ = t->xOff_;
}


#line 71
void OrgBouncycastleCryptoDigestsSHA224Digest_initWithByteArray_(OrgBouncycastleCryptoDigestsSHA224Digest *self, IOSByteArray *encodedState) {
  OrgBouncycastleCryptoDigestsGeneralDigest_initWithByteArray_(self,
#line 73
  encodedState);
  self->X_ = [IOSIntArray newArrayWithLength:
#line 27
  64];
  
#line 75
  self->H1_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 16);
  self->H2_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 20);
  self->H3_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 24);
  self->H4_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 28);
  self->H5_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 32);
  self->H6_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 36);
  self->H7_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 40);
  self->H8_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 44);
  
#line 84
  self->xOff_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 48);
  for (jint i = 0; i != self->xOff_; i++) {
    
#line 87
    *IOSIntArray_GetRef(nil_chk(self->X_), i) = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 52 + (i * 4));
  }
}


#line 71
OrgBouncycastleCryptoDigestsSHA224Digest *new_OrgBouncycastleCryptoDigestsSHA224Digest_initWithByteArray_(IOSByteArray *encodedState) {
  J2OBJC_NEW_IMPL(OrgBouncycastleCryptoDigestsSHA224Digest, initWithByteArray_, encodedState)
}


#line 71
OrgBouncycastleCryptoDigestsSHA224Digest *create_OrgBouncycastleCryptoDigestsSHA224Digest_initWithByteArray_(IOSByteArray *encodedState) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleCryptoDigestsSHA224Digest, initWithByteArray_, encodedState)
}


#line 278
jint OrgBouncycastleCryptoDigestsSHA224Digest_ChWithInt_withInt_withInt_(OrgBouncycastleCryptoDigestsSHA224Digest *self, jint x, jint y, jint z) {
  
#line 283
  return ((x & y) ^ ((~x) & z));
}


#line 286
jint OrgBouncycastleCryptoDigestsSHA224Digest_MajWithInt_withInt_withInt_(OrgBouncycastleCryptoDigestsSHA224Digest *self, jint x, jint y, jint z) {
  
#line 291
  return ((x & y) ^ (x & z) ^ (y & z));
}


#line 294
jint OrgBouncycastleCryptoDigestsSHA224Digest_Sum0WithInt_(OrgBouncycastleCryptoDigestsSHA224Digest *self, jint x) {
  
#line 297
  return ((JreURShift32(x, 2)) | (JreLShift32(x, 30))) ^ ((JreURShift32(x, 13)) | (JreLShift32(x, 19))) ^ ((JreURShift32(x, 22)) | (JreLShift32(x, 10)));
}

jint OrgBouncycastleCryptoDigestsSHA224Digest_Sum1WithInt_(OrgBouncycastleCryptoDigestsSHA224Digest *self, jint x) {
  
#line 303
  return ((JreURShift32(x, 6)) | (JreLShift32(x, 26))) ^ ((JreURShift32(x, 11)) | (JreLShift32(x, 21))) ^ ((JreURShift32(x, 25)) | (JreLShift32(x, 7)));
}

jint OrgBouncycastleCryptoDigestsSHA224Digest_Theta0WithInt_(OrgBouncycastleCryptoDigestsSHA224Digest *self, jint x) {
  
#line 309
  return ((JreURShift32(x, 7)) | (JreLShift32(x, 25))) ^ ((JreURShift32(x, 18)) | (JreLShift32(x, 14))) ^ (JreURShift32(x, 3));
}

jint OrgBouncycastleCryptoDigestsSHA224Digest_Theta1WithInt_(OrgBouncycastleCryptoDigestsSHA224Digest *self, jint x) {
  
#line 315
  return ((JreURShift32(x, 17)) | (JreLShift32(x, 15))) ^ ((JreURShift32(x, 19)) | (JreLShift32(x, 13))) ^ (JreURShift32(x, 10));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleCryptoDigestsSHA224Digest)
