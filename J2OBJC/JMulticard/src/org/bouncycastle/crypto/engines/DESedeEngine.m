//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/crypto/engines/DESedeEngine.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/lang/IllegalArgumentException.h"
#include "java/lang/IllegalStateException.h"
#include "java/lang/System.h"
#include "org/bouncycastle/crypto/CipherParameters.h"
#include "org/bouncycastle/crypto/DataLengthException.h"
#include "org/bouncycastle/crypto/OutputLengthException.h"
#include "org/bouncycastle/crypto/engines/DESEngine.h"
#include "org/bouncycastle/crypto/engines/DESedeEngine.h"
#include "org/bouncycastle/crypto/params/KeyParameter.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/crypto/engines/DESedeEngine must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastleCryptoEnginesDESedeEngine () {
 @public
  IOSIntArray *workingKey1_;
  IOSIntArray *workingKey2_;
  IOSIntArray *workingKey3_;
  jboolean forEncryption_;
}

@end

J2OBJC_FIELD_SETTER(OrgBouncycastleCryptoEnginesDESedeEngine, workingKey1_, IOSIntArray *)
J2OBJC_FIELD_SETTER(OrgBouncycastleCryptoEnginesDESedeEngine, workingKey2_, IOSIntArray *)
J2OBJC_FIELD_SETTER(OrgBouncycastleCryptoEnginesDESedeEngine, workingKey3_, IOSIntArray *)

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/crypto/engines/DESedeEngine.java"


#line 11
@implementation OrgBouncycastleCryptoEnginesDESedeEngine

J2OBJC_IGNORE_DESIGNATED_BEGIN

#line 25
- (instancetype)init {
  OrgBouncycastleCryptoEnginesDESedeEngine_init(self);
  return self;
}
J2OBJC_IGNORE_DESIGNATED_END


#line 37
- (void)init__WithBoolean:(jboolean)encrypting
withOrgBouncycastleCryptoCipherParameters:(id<OrgBouncycastleCryptoCipherParameters>)params {
  
#line 42
  if (!([params isKindOfClass:[OrgBouncycastleCryptoParamsKeyParameter class]])) {
    
#line 44
    @throw new_JavaLangIllegalArgumentException_initWithNSString_(JreStrcat("$$", @"invalid parameter passed to DESede init - ", [[((id<OrgBouncycastleCryptoCipherParameters>) nil_chk(params)) java_getClass] getName]));
  }
  
#line 47
  IOSByteArray *keyMaster = [((OrgBouncycastleCryptoParamsKeyParameter *) nil_chk(((OrgBouncycastleCryptoParamsKeyParameter *) cast_chk(params, [OrgBouncycastleCryptoParamsKeyParameter class])))) getKey];
  
#line 49
  if (((IOSByteArray *) nil_chk(keyMaster))->size_ != 24 && keyMaster->size_ != 16) {
    
#line 51
    @throw new_JavaLangIllegalArgumentException_initWithNSString_(@"key size must be 16 or 24 bytes.");
  }
  
#line 54
  self->forEncryption_ = encrypting;
  
#line 56
  IOSByteArray *key1 = [IOSByteArray newArrayWithLength:8];
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(keyMaster, 0, key1, 0, key1->size_);
  workingKey1_ = [self generateWorkingKeyWithBoolean:encrypting withByteArray:key1];
  
#line 60
  IOSByteArray *key2 = [IOSByteArray newArrayWithLength:8];
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(keyMaster, 8, key2, 0, key2->size_);
  workingKey2_ = [self generateWorkingKeyWithBoolean:!encrypting withByteArray:key2];
  
#line 64
  if (keyMaster->size_ == 24) {
    
#line 66
    IOSByteArray *key3 = [IOSByteArray newArrayWithLength:8];
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(keyMaster, 16, key3, 0, key3->size_);
    workingKey3_ = [self generateWorkingKeyWithBoolean:encrypting withByteArray:key3];
  }
  else {
    
#line 72
    workingKey3_ = workingKey1_;
  }
}


#line 76
- (NSString *)getAlgorithmName {
  
#line 79
  return @"DESede";
}

- (jint)getBlockSize {
  
#line 85
  return OrgBouncycastleCryptoEnginesDESedeEngine_BLOCK_SIZE;
}

- (jint)processBlockWithByteArray:(IOSByteArray *)inArg
                          withInt:(jint)inOff
                    withByteArray:(IOSByteArray *)outArg
                          withInt:(jint)outOff {
  
#line 95
  if (workingKey1_ == nil) {
    
#line 97
    @throw new_JavaLangIllegalStateException_initWithNSString_(@"DESede engine not initialised");
  }
  
#line 100
  if ((inOff + OrgBouncycastleCryptoEnginesDESedeEngine_BLOCK_SIZE) > ((IOSByteArray *) nil_chk(inArg))->size_) {
    
#line 102
    @throw new_OrgBouncycastleCryptoDataLengthException_initWithNSString_(@"input buffer too short");
  }
  
#line 105
  if ((outOff + OrgBouncycastleCryptoEnginesDESedeEngine_BLOCK_SIZE) > ((IOSByteArray *) nil_chk(outArg))->size_) {
    
#line 107
    @throw new_OrgBouncycastleCryptoOutputLengthException_initWithNSString_(@"output buffer too short");
  }
  
#line 110
  IOSByteArray *temp = [IOSByteArray newArrayWithLength:OrgBouncycastleCryptoEnginesDESedeEngine_BLOCK_SIZE];
  
#line 112
  if (forEncryption_) {
    
#line 114
    [self desFuncWithIntArray:workingKey1_ withByteArray:inArg withInt:inOff withByteArray:temp withInt:0];
    [self desFuncWithIntArray:workingKey2_ withByteArray:temp withInt:0 withByteArray:temp withInt:0];
    [self desFuncWithIntArray:workingKey3_ withByteArray:temp withInt:0 withByteArray:outArg withInt:outOff];
  }
  else {
    
#line 120
    [self desFuncWithIntArray:workingKey3_ withByteArray:inArg withInt:inOff withByteArray:temp withInt:0];
    [self desFuncWithIntArray:workingKey2_ withByteArray:temp withInt:0 withByteArray:temp withInt:0];
    [self desFuncWithIntArray:workingKey1_ withByteArray:temp withInt:0 withByteArray:outArg withInt:outOff];
  }
  
#line 125
  return OrgBouncycastleCryptoEnginesDESedeEngine_BLOCK_SIZE;
}


#line 128
- (void)reset {
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "V", 0x1, 0, 1, -1, -1, -1, -1 },
    { NULL, "LNSString;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "I", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "I", 0x1, 2, 3, -1, -1, -1, -1 },
    { NULL, "V", 0x1, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(init);
  methods[1].selector = @selector(init__WithBoolean:withOrgBouncycastleCryptoCipherParameters:);
  methods[2].selector = @selector(getAlgorithmName);
  methods[3].selector = @selector(getBlockSize);
  methods[4].selector = @selector(processBlockWithByteArray:withInt:withByteArray:withInt:);
  methods[5].selector = @selector(reset);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "BLOCK_SIZE", "I", .constantValue.asInt = OrgBouncycastleCryptoEnginesDESedeEngine_BLOCK_SIZE, 0x1c, -1, -1, -1, -1 },
    { "workingKey1_", "[I", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "workingKey2_", "[I", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "workingKey3_", "[I", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
    { "forEncryption_", "Z", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "init", "ZLOrgBouncycastleCryptoCipherParameters;", "processBlock", "[BI[BI" };
  static const J2ObjcClassInfo _OrgBouncycastleCryptoEnginesDESedeEngine = { "DESedeEngine", "org.bouncycastle.crypto.engines", ptrTable, methods, fields, 7, 0x1, 6, 5, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleCryptoEnginesDESedeEngine;
}

@end


#line 25
void OrgBouncycastleCryptoEnginesDESedeEngine_init(OrgBouncycastleCryptoEnginesDESedeEngine *self) {
  OrgBouncycastleCryptoEnginesDESEngine_init(self);
  self->workingKey1_ =
#line 16
  nil;
  self->workingKey2_ = nil;
  self->workingKey3_ = nil;
}


#line 25
OrgBouncycastleCryptoEnginesDESedeEngine *new_OrgBouncycastleCryptoEnginesDESedeEngine_init() {
  J2OBJC_NEW_IMPL(OrgBouncycastleCryptoEnginesDESedeEngine, init)
}


#line 25
OrgBouncycastleCryptoEnginesDESedeEngine *create_OrgBouncycastleCryptoEnginesDESedeEngine_init() {
  J2OBJC_CREATE_IMPL(OrgBouncycastleCryptoEnginesDESedeEngine, init)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleCryptoEnginesDESedeEngine)
