//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/crypto/digests/SHA3Digest.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/lang/IllegalArgumentException.h"
#include "org/bouncycastle/crypto/digests/KeccakDigest.h"
#include "org/bouncycastle/crypto/digests/SHA3Digest.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/crypto/digests/SHA3Digest must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastleCryptoDigestsSHA3Digest ()

+ (jint)checkBitLengthWithInt:(jint)bitLength;

@end

__attribute__((unused)) static jint OrgBouncycastleCryptoDigestsSHA3Digest_checkBitLengthWithInt_(jint bitLength);

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/crypto/digests/SHA3Digest.java"


#line 9
@implementation OrgBouncycastleCryptoDigestsSHA3Digest


#line 12
+ (jint)checkBitLengthWithInt:(jint)bitLength {
  return OrgBouncycastleCryptoDigestsSHA3Digest_checkBitLengthWithInt_(bitLength);
}

J2OBJC_IGNORE_DESIGNATED_BEGIN

#line 26
- (instancetype)init {
  OrgBouncycastleCryptoDigestsSHA3Digest_init(self);
  return self;
}
J2OBJC_IGNORE_DESIGNATED_END


#line 31
- (instancetype)initWithInt:(jint)bitLength {
  OrgBouncycastleCryptoDigestsSHA3Digest_initWithInt_(self, bitLength);
  return self;
}

- (instancetype)initWithOrgBouncycastleCryptoDigestsSHA3Digest:(OrgBouncycastleCryptoDigestsSHA3Digest *)source {
  OrgBouncycastleCryptoDigestsSHA3Digest_initWithOrgBouncycastleCryptoDigestsSHA3Digest_(self, source);
  return self;
}

- (NSString *)getAlgorithmName {
  
#line 44
  return JreStrcat("$I", @"SHA3-", fixedOutputLength_);
}

- (jint)doFinalWithByteArray:(IOSByteArray *)outArg
                     withInt:(jint)outOff {
  
#line 50
  [self absorbBitsWithInt:(jint) 0x02 withInt:2];
  
#line 52
  return [super doFinalWithByteArray:outArg withInt:outOff];
}


#line 58
- (jint)doFinalWithByteArray:(IOSByteArray *)outArg
                     withInt:(jint)outOff
                    withByte:(jbyte)partialByte
                     withInt:(jint)partialBits {
  
#line 61
  if (partialBits < 0 || partialBits > 7) {
    
#line 63
    @throw new_JavaLangIllegalArgumentException_initWithNSString_(@"'partialBits' must be in the range [0,7]");
  }
  
#line 66
  jint finalInput = (partialByte & ((JreLShift32(1, partialBits)) - 1)) | (JreLShift32((jint) 0x02, partialBits));
  jint finalBits = partialBits + 2;
  
#line 69
  if (finalBits >= 8) {
    
#line 71
    [self absorbWithByte:(jbyte) finalInput];
    finalBits -= 8;
    JreURShiftAssignInt(&finalInput, 8);
  }
  
#line 76
  return [super doFinalWithByteArray:outArg withInt:outOff withByte:(jbyte) finalInput withInt:finalBits];
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, "I", 0xa, 0, 1, -1, -1, -1, -1 },
    { NULL, NULL, 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, NULL, 0x1, -1, 1, -1, -1, -1, -1 },
    { NULL, NULL, 0x1, -1, 2, -1, -1, -1, -1 },
    { NULL, "LNSString;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "I", 0x1, 3, 4, -1, -1, -1, -1 },
    { NULL, "I", 0x4, 3, 5, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(checkBitLengthWithInt:);
  methods[1].selector = @selector(init);
  methods[2].selector = @selector(initWithInt:);
  methods[3].selector = @selector(initWithOrgBouncycastleCryptoDigestsSHA3Digest:);
  methods[4].selector = @selector(getAlgorithmName);
  methods[5].selector = @selector(doFinalWithByteArray:withInt:);
  methods[6].selector = @selector(doFinalWithByteArray:withInt:withByte:withInt:);
  #pragma clang diagnostic pop
  static const void *ptrTable[] = { "checkBitLength", "I", "LOrgBouncycastleCryptoDigestsSHA3Digest;", "doFinal", "[BI", "[BIBI" };
  static const J2ObjcClassInfo _OrgBouncycastleCryptoDigestsSHA3Digest = { "SHA3Digest", "org.bouncycastle.crypto.digests", ptrTable, methods, NULL, 7, 0x1, 7, 0, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleCryptoDigestsSHA3Digest;
}

@end


#line 12
jint OrgBouncycastleCryptoDigestsSHA3Digest_checkBitLengthWithInt_(jint bitLength) {
  OrgBouncycastleCryptoDigestsSHA3Digest_initialize();
  switch (bitLength) {
    
#line 16
    case 224:
    case 256:
    case 384:
    case 512:
    return bitLength;
    default:
    @throw new_JavaLangIllegalArgumentException_initWithNSString_(JreStrcat("$I$", @"'bitLength' ", bitLength, @" not supported for SHA-3"));
  }
}


#line 26
void OrgBouncycastleCryptoDigestsSHA3Digest_init(OrgBouncycastleCryptoDigestsSHA3Digest *self) {
  OrgBouncycastleCryptoDigestsSHA3Digest_initWithInt_(self,
#line 28
  256);
}


#line 26
OrgBouncycastleCryptoDigestsSHA3Digest *new_OrgBouncycastleCryptoDigestsSHA3Digest_init() {
  J2OBJC_NEW_IMPL(OrgBouncycastleCryptoDigestsSHA3Digest, init)
}


#line 26
OrgBouncycastleCryptoDigestsSHA3Digest *create_OrgBouncycastleCryptoDigestsSHA3Digest_init() {
  J2OBJC_CREATE_IMPL(OrgBouncycastleCryptoDigestsSHA3Digest, init)
}


#line 31
void OrgBouncycastleCryptoDigestsSHA3Digest_initWithInt_(OrgBouncycastleCryptoDigestsSHA3Digest *self, jint bitLength) {
  OrgBouncycastleCryptoDigestsKeccakDigest_initWithInt_(self, OrgBouncycastleCryptoDigestsSHA3Digest_checkBitLengthWithInt_(
#line 33
  bitLength));
}


#line 31
OrgBouncycastleCryptoDigestsSHA3Digest *new_OrgBouncycastleCryptoDigestsSHA3Digest_initWithInt_(jint bitLength) {
  J2OBJC_NEW_IMPL(OrgBouncycastleCryptoDigestsSHA3Digest, initWithInt_, bitLength)
}


#line 31
OrgBouncycastleCryptoDigestsSHA3Digest *create_OrgBouncycastleCryptoDigestsSHA3Digest_initWithInt_(jint bitLength) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleCryptoDigestsSHA3Digest, initWithInt_, bitLength)
}


#line 36
void OrgBouncycastleCryptoDigestsSHA3Digest_initWithOrgBouncycastleCryptoDigestsSHA3Digest_(OrgBouncycastleCryptoDigestsSHA3Digest *self, OrgBouncycastleCryptoDigestsSHA3Digest *source) {
  OrgBouncycastleCryptoDigestsKeccakDigest_initWithOrgBouncycastleCryptoDigestsKeccakDigest_(self,
#line 38
  source);
}


#line 36
OrgBouncycastleCryptoDigestsSHA3Digest *new_OrgBouncycastleCryptoDigestsSHA3Digest_initWithOrgBouncycastleCryptoDigestsSHA3Digest_(OrgBouncycastleCryptoDigestsSHA3Digest *source) {
  J2OBJC_NEW_IMPL(OrgBouncycastleCryptoDigestsSHA3Digest, initWithOrgBouncycastleCryptoDigestsSHA3Digest_, source)
}


#line 36
OrgBouncycastleCryptoDigestsSHA3Digest *create_OrgBouncycastleCryptoDigestsSHA3Digest_initWithOrgBouncycastleCryptoDigestsSHA3Digest_(OrgBouncycastleCryptoDigestsSHA3Digest *source) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleCryptoDigestsSHA3Digest, initWithOrgBouncycastleCryptoDigestsSHA3Digest_, source)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleCryptoDigestsSHA3Digest)
