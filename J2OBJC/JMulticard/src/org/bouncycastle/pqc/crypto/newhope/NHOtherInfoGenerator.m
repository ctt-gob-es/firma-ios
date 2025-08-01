//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/newhope/NHOtherInfoGenerator.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/io/IOException.h"
#include "java/lang/IllegalStateException.h"
#include "java/security/SecureRandom.h"
#include "org/bouncycastle/asn1/ASN1BitString.h"
#include "org/bouncycastle/asn1/ASN1ObjectIdentifier.h"
#include "org/bouncycastle/asn1/x509/AlgorithmIdentifier.h"
#include "org/bouncycastle/asn1/x509/SubjectPublicKeyInfo.h"
#include "org/bouncycastle/crypto/AsymmetricCipherKeyPair.h"
#include "org/bouncycastle/crypto/KeyGenerationParameters.h"
#include "org/bouncycastle/crypto/params/AsymmetricKeyParameter.h"
#include "org/bouncycastle/crypto/util/DEROtherInfo.h"
#include "org/bouncycastle/pqc/asn1/PQCObjectIdentifiers.h"
#include "org/bouncycastle/pqc/crypto/ExchangePair.h"
#include "org/bouncycastle/pqc/crypto/newhope/NHAgreement.h"
#include "org/bouncycastle/pqc/crypto/newhope/NHExchangePairGenerator.h"
#include "org/bouncycastle/pqc/crypto/newhope/NHKeyPairGenerator.h"
#include "org/bouncycastle/pqc/crypto/newhope/NHOtherInfoGenerator.h"
#include "org/bouncycastle/pqc/crypto/newhope/NHPublicKeyParameters.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/pqc/crypto/newhope/NHOtherInfoGenerator must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyU () {
 @public
  OrgBouncycastleCryptoAsymmetricCipherKeyPair *aKp_;
  OrgBouncycastlePqcCryptoNewhopeNHAgreement *agreement_;
}

@end

J2OBJC_FIELD_SETTER(OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyU, aKp_, OrgBouncycastleCryptoAsymmetricCipherKeyPair *)
J2OBJC_FIELD_SETTER(OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyU, agreement_, OrgBouncycastlePqcCryptoNewhopeNHAgreement *)

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/newhope/NHOtherInfoGenerator.java"


#line 18
@implementation OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator


#line 33
- (instancetype)initWithOrgBouncycastleAsn1X509AlgorithmIdentifier:(OrgBouncycastleAsn1X509AlgorithmIdentifier *)algorithmID
                                                     withByteArray:(IOSByteArray *)partyUInfo
                                                     withByteArray:(IOSByteArray *)partyVInfo
                                      withJavaSecuritySecureRandom:(JavaSecuritySecureRandom *)random {
  OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_(self, algorithmID, partyUInfo, partyVInfo, random);
  return self;
}


#line 142
+ (IOSByteArray *)getEncodedWithOrgBouncycastlePqcCryptoNewhopeNHPublicKeyParameters:(OrgBouncycastlePqcCryptoNewhopeNHPublicKeyParameters *)pubKey {
  return OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_getEncodedWithOrgBouncycastlePqcCryptoNewhopeNHPublicKeyParameters_(pubKey);
}


#line 158
+ (OrgBouncycastlePqcCryptoNewhopeNHPublicKeyParameters *)getPublicKeyWithByteArray:(IOSByteArray *)enc {
  return OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_getPublicKeyWithByteArray_(enc);
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, 0, -1, -1, -1, -1 },
    { NULL, "[B", 0x8, 1, 2, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastlePqcCryptoNewhopeNHPublicKeyParameters;", 0x8, 3, 4, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithOrgBouncycastleAsn1X509AlgorithmIdentifier:withByteArray:withByteArray:withJavaSecuritySecureRandom:);
  methods[1].selector = @selector(getEncodedWithOrgBouncycastlePqcCryptoNewhopeNHPublicKeyParameters:);
  methods[2].selector = @selector(getPublicKeyWithByteArray:);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "otherInfoBuilder_", "LOrgBouncycastleCryptoUtilDEROtherInfo_Builder;", .constantValue.asLong = 0, 0x14, -1, -1, -1, -1 },
    { "random_", "LJavaSecuritySecureRandom;", .constantValue.asLong = 0, 0x14, -1, -1, -1, -1 },
    { "used_", "Z", .constantValue.asLong = 0, 0x4, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "LOrgBouncycastleAsn1X509AlgorithmIdentifier;[B[BLJavaSecuritySecureRandom;", "getEncoded", "LOrgBouncycastlePqcCryptoNewhopeNHPublicKeyParameters;", "getPublicKey", "[B", "LOrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyU;LOrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyV;" };
  static const J2ObjcClassInfo _OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator = { "NHOtherInfoGenerator", "org.bouncycastle.pqc.crypto.newhope", ptrTable, methods, fields, 7, 0x1, 3, 3, -1, 5, -1, -1, -1 };
  return &_OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator;
}

@end


#line 33
void OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_(OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator *self, OrgBouncycastleAsn1X509AlgorithmIdentifier *algorithmID, IOSByteArray *partyUInfo, IOSByteArray *partyVInfo, JavaSecuritySecureRandom *random) {
  NSObject_init(self);
  self->used_ =
#line 23
  false;
  
#line 35
  self->otherInfoBuilder_ = new_OrgBouncycastleCryptoUtilDEROtherInfo_Builder_initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_(algorithmID, partyUInfo, partyVInfo);
  self->random_ = random;
}


#line 33
OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator *new_OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_(OrgBouncycastleAsn1X509AlgorithmIdentifier *algorithmID, IOSByteArray *partyUInfo, IOSByteArray *partyVInfo, JavaSecuritySecureRandom *random) {
  J2OBJC_NEW_IMPL(OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator, initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_, algorithmID, partyUInfo, partyVInfo, random)
}


#line 33
OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator *create_OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_(OrgBouncycastleAsn1X509AlgorithmIdentifier *algorithmID, IOSByteArray *partyUInfo, IOSByteArray *partyVInfo, JavaSecuritySecureRandom *random) {
  J2OBJC_CREATE_IMPL(OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator, initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_, algorithmID, partyUInfo, partyVInfo, random)
}


#line 142
IOSByteArray *OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_getEncodedWithOrgBouncycastlePqcCryptoNewhopeNHPublicKeyParameters_(OrgBouncycastlePqcCryptoNewhopeNHPublicKeyParameters *pubKey) {
  OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_initialize();
  OrgBouncycastleAsn1X509SubjectPublicKeyInfo *pki;
  @try {
    
#line 147
    OrgBouncycastleAsn1X509AlgorithmIdentifier *algorithmIdentifier = new_OrgBouncycastleAsn1X509AlgorithmIdentifier_initWithOrgBouncycastleAsn1ASN1ObjectIdentifier_(JreLoadStatic(OrgBouncycastlePqcAsn1PQCObjectIdentifiers, newHope));
    pki = new_OrgBouncycastleAsn1X509SubjectPublicKeyInfo_initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_(algorithmIdentifier, [((OrgBouncycastlePqcCryptoNewhopeNHPublicKeyParameters *) nil_chk(pubKey)) getPubData]);
    
#line 150
    return [pki getEncoded];
  }
  @catch (JavaIoIOException *e) {
    
#line 154
    return nil;
  }
}


#line 158
OrgBouncycastlePqcCryptoNewhopeNHPublicKeyParameters *OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_getPublicKeyWithByteArray_(IOSByteArray *enc) {
  OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_initialize();
  OrgBouncycastleAsn1X509SubjectPublicKeyInfo *pki = OrgBouncycastleAsn1X509SubjectPublicKeyInfo_getInstanceWithId_(enc);
  
#line 162
  return new_OrgBouncycastlePqcCryptoNewhopeNHPublicKeyParameters_initWithByteArray_([((OrgBouncycastleAsn1ASN1BitString *) nil_chk([((OrgBouncycastleAsn1X509SubjectPublicKeyInfo *) nil_chk(pki)) getPublicKeyData])) getOctets]);
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator)

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/newhope/NHOtherInfoGenerator.java"


#line 42
@implementation OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyU


#line 48
- (instancetype)initWithOrgBouncycastleAsn1X509AlgorithmIdentifier:(OrgBouncycastleAsn1X509AlgorithmIdentifier *)algorithmID
                                                     withByteArray:(IOSByteArray *)partyUInfo
                                                     withByteArray:(IOSByteArray *)partyVInfo
                                      withJavaSecuritySecureRandom:(JavaSecuritySecureRandom *)random {
  OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyU_initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_(self, algorithmID, partyUInfo, partyVInfo, random);
  return self;
}


#line 67
- (OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator *)withSuppPubInfoWithByteArray:(IOSByteArray *)suppPubInfo {
  
#line 69
  (void) [((OrgBouncycastleCryptoUtilDEROtherInfo_Builder *) nil_chk(self->otherInfoBuilder_)) withSuppPubInfoWithByteArray:suppPubInfo];
  
#line 71
  return self;
}


#line 74
- (IOSByteArray *)getSuppPrivInfoPartA {
  
#line 76
  return OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_getEncodedWithOrgBouncycastlePqcCryptoNewhopeNHPublicKeyParameters_((OrgBouncycastlePqcCryptoNewhopeNHPublicKeyParameters *) cast_chk([((OrgBouncycastleCryptoAsymmetricCipherKeyPair *) nil_chk(aKp_)) getPublic], [OrgBouncycastlePqcCryptoNewhopeNHPublicKeyParameters class]));
}


#line 79
- (OrgBouncycastleCryptoUtilDEROtherInfo *)generateWithByteArray:(IOSByteArray *)suppPrivInfoPartB {
  
#line 81
  if (used_) {
    
#line 83
    @throw new_JavaLangIllegalStateException_initWithNSString_(@"builder already used");
  }
  
#line 86
  used_ = true;
  
#line 88
  (void) [((OrgBouncycastleCryptoUtilDEROtherInfo_Builder *) nil_chk(self->otherInfoBuilder_)) withSuppPrivInfoWithByteArray:[((OrgBouncycastlePqcCryptoNewhopeNHAgreement *) nil_chk(agreement_)) calculateAgreementWithOrgBouncycastleCryptoCipherParameters:OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_getPublicKeyWithByteArray_(suppPrivInfoPartB)]];
  
#line 90
  return [otherInfoBuilder_ build];
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, 0, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator;", 0x1, 1, 2, -1, -1, -1, -1 },
    { NULL, "[B", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleCryptoUtilDEROtherInfo;", 0x1, 3, 2, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithOrgBouncycastleAsn1X509AlgorithmIdentifier:withByteArray:withByteArray:withJavaSecuritySecureRandom:);
  methods[1].selector = @selector(withSuppPubInfoWithByteArray:);
  methods[2].selector = @selector(getSuppPrivInfoPartA);
  methods[3].selector = @selector(generateWithByteArray:);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "aKp_", "LOrgBouncycastleCryptoAsymmetricCipherKeyPair;", .constantValue.asLong = 0, 0x12, -1, -1, -1, -1 },
    { "agreement_", "LOrgBouncycastlePqcCryptoNewhopeNHAgreement;", .constantValue.asLong = 0, 0x12, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "LOrgBouncycastleAsn1X509AlgorithmIdentifier;[B[BLJavaSecuritySecureRandom;", "withSuppPubInfo", "[B", "generate", "LOrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator;" };
  static const J2ObjcClassInfo _OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyU = { "PartyU", "org.bouncycastle.pqc.crypto.newhope", ptrTable, methods, fields, 7, 0x9, 4, 2, 4, -1, -1, -1, -1 };
  return &_OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyU;
}

@end


#line 48
void OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyU_initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_(OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyU *self, OrgBouncycastleAsn1X509AlgorithmIdentifier *algorithmID, IOSByteArray *partyUInfo, IOSByteArray *partyVInfo, JavaSecuritySecureRandom *random) {
  OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_(self,
#line 50
  algorithmID, partyUInfo, partyVInfo, random);
  self->agreement_ = new_OrgBouncycastlePqcCryptoNewhopeNHAgreement_init();
  OrgBouncycastlePqcCryptoNewhopeNHKeyPairGenerator *kpGen = new_OrgBouncycastlePqcCryptoNewhopeNHKeyPairGenerator_init();
  
#line 54
  [kpGen init__WithOrgBouncycastleCryptoKeyGenerationParameters:new_OrgBouncycastleCryptoKeyGenerationParameters_initWithJavaSecuritySecureRandom_withInt_(random, 2048)];
  
#line 56
  self->aKp_ = [kpGen generateKeyPair];
  
#line 58
  [self->agreement_ init__WithOrgBouncycastleCryptoCipherParameters:[((OrgBouncycastleCryptoAsymmetricCipherKeyPair *) nil_chk(self->aKp_)) getPrivate]];
}


#line 48
OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyU *new_OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyU_initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_(OrgBouncycastleAsn1X509AlgorithmIdentifier *algorithmID, IOSByteArray *partyUInfo, IOSByteArray *partyVInfo, JavaSecuritySecureRandom *random) {
  J2OBJC_NEW_IMPL(OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyU, initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_, algorithmID, partyUInfo, partyVInfo, random)
}


#line 48
OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyU *create_OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyU_initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_(OrgBouncycastleAsn1X509AlgorithmIdentifier *algorithmID, IOSByteArray *partyUInfo, IOSByteArray *partyVInfo, JavaSecuritySecureRandom *random) {
  J2OBJC_CREATE_IMPL(OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyU, initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_, algorithmID, partyUInfo, partyVInfo, random)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyU)

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/crypto/newhope/NHOtherInfoGenerator.java"


#line 97
@implementation OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyV


#line 100
- (instancetype)initWithOrgBouncycastleAsn1X509AlgorithmIdentifier:(OrgBouncycastleAsn1X509AlgorithmIdentifier *)algorithmID
                                                     withByteArray:(IOSByteArray *)partyUInfo
                                                     withByteArray:(IOSByteArray *)partyVInfo
                                      withJavaSecuritySecureRandom:(JavaSecuritySecureRandom *)random {
  OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyV_initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_(self, algorithmID, partyUInfo, partyVInfo, random);
  return self;
}


#line 111
- (OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator *)withSuppPubInfoWithByteArray:(IOSByteArray *)suppPubInfo {
  
#line 113
  (void) [((OrgBouncycastleCryptoUtilDEROtherInfo_Builder *) nil_chk(self->otherInfoBuilder_)) withSuppPubInfoWithByteArray:suppPubInfo];
  
#line 115
  return self;
}


#line 118
- (IOSByteArray *)getSuppPrivInfoPartBWithByteArray:(IOSByteArray *)suppPrivInfoPartA {
  
#line 120
  OrgBouncycastlePqcCryptoNewhopeNHExchangePairGenerator *exchGen = new_OrgBouncycastlePqcCryptoNewhopeNHExchangePairGenerator_initWithJavaSecuritySecureRandom_(random_);
  
#line 122
  OrgBouncycastlePqcCryptoExchangePair *bEp = [exchGen generateExchangeWithOrgBouncycastleCryptoParamsAsymmetricKeyParameter:OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_getPublicKeyWithByteArray_(suppPrivInfoPartA)];
  
#line 124
  (void) [((OrgBouncycastleCryptoUtilDEROtherInfo_Builder *) nil_chk(self->otherInfoBuilder_)) withSuppPrivInfoWithByteArray:[((OrgBouncycastlePqcCryptoExchangePair *) nil_chk(bEp)) getSharedValue]];
  
#line 126
  return OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_getEncodedWithOrgBouncycastlePqcCryptoNewhopeNHPublicKeyParameters_((OrgBouncycastlePqcCryptoNewhopeNHPublicKeyParameters *) cast_chk([bEp getPublicKey], [OrgBouncycastlePqcCryptoNewhopeNHPublicKeyParameters class]));
}


#line 129
- (OrgBouncycastleCryptoUtilDEROtherInfo *)generate {
  
#line 131
  if (used_) {
    
#line 133
    @throw new_JavaLangIllegalStateException_initWithNSString_(@"builder already used");
  }
  
#line 136
  used_ = true;
  
#line 138
  return [((OrgBouncycastleCryptoUtilDEROtherInfo_Builder *) nil_chk(otherInfoBuilder_)) build];
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, 0, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator;", 0x1, 1, 2, -1, -1, -1, -1 },
    { NULL, "[B", 0x1, 3, 2, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleCryptoUtilDEROtherInfo;", 0x1, -1, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithOrgBouncycastleAsn1X509AlgorithmIdentifier:withByteArray:withByteArray:withJavaSecuritySecureRandom:);
  methods[1].selector = @selector(withSuppPubInfoWithByteArray:);
  methods[2].selector = @selector(getSuppPrivInfoPartBWithByteArray:);
  methods[3].selector = @selector(generate);
  #pragma clang diagnostic pop
  static const void *ptrTable[] = { "LOrgBouncycastleAsn1X509AlgorithmIdentifier;[B[BLJavaSecuritySecureRandom;", "withSuppPubInfo", "[B", "getSuppPrivInfoPartB", "LOrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator;" };
  static const J2ObjcClassInfo _OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyV = { "PartyV", "org.bouncycastle.pqc.crypto.newhope", ptrTable, methods, NULL, 7, 0x9, 4, 0, 4, -1, -1, -1, -1 };
  return &_OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyV;
}

@end


#line 100
void OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyV_initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_(OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyV *self, OrgBouncycastleAsn1X509AlgorithmIdentifier *algorithmID, IOSByteArray *partyUInfo, IOSByteArray *partyVInfo, JavaSecuritySecureRandom *random) {
  OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_(self,
#line 102
  algorithmID, partyUInfo, partyVInfo, random);
}


#line 100
OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyV *new_OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyV_initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_(OrgBouncycastleAsn1X509AlgorithmIdentifier *algorithmID, IOSByteArray *partyUInfo, IOSByteArray *partyVInfo, JavaSecuritySecureRandom *random) {
  J2OBJC_NEW_IMPL(OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyV, initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_, algorithmID, partyUInfo, partyVInfo, random)
}


#line 100
OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyV *create_OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyV_initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_(OrgBouncycastleAsn1X509AlgorithmIdentifier *algorithmID, IOSByteArray *partyUInfo, IOSByteArray *partyVInfo, JavaSecuritySecureRandom *random) {
  J2OBJC_CREATE_IMPL(OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyV, initWithOrgBouncycastleAsn1X509AlgorithmIdentifier_withByteArray_withByteArray_withJavaSecuritySecureRandom_, algorithmID, partyUInfo, partyVInfo, random)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastlePqcCryptoNewhopeNHOtherInfoGenerator_PartyV)
