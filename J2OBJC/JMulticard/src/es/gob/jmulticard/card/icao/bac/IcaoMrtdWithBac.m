//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/card/icao/bac/IcaoMrtdWithBac.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "es/gob/jmulticard/CryptoHelper.h"
#include "es/gob/jmulticard/card/PrivateKeyReference.h"
#include "es/gob/jmulticard/card/dnie/Dnie3.h"
#include "es/gob/jmulticard/card/icao/bac/IcaoMrtdWithBac.h"
#include "es/gob/jmulticard/connection/ApduConnection.h"
#include "java/lang/UnsupportedOperationException.h"

#if !__has_feature(objc_arc)
#error "es/gob/jmulticard/card/icao/bac/IcaoMrtdWithBac must be compiled with ARC (-fobjc-arc)"
#endif

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/card/icao/bac/IcaoMrtdWithBac.java"


#line 11
@implementation EsGobJmulticardCardIcaoBacIcaoMrtdWithBac


#line 18
- (instancetype)initWithEsGobJmulticardConnectionApduConnection:(id<EsGobJmulticardConnectionApduConnection>)conn
                                withEsGobJmulticardCryptoHelper:(EsGobJmulticardCryptoHelper *)cryptoHlpr {
  EsGobJmulticardCardIcaoBacIcaoMrtdWithBac_initWithEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_(self, conn, cryptoHlpr);
  return self;
}


#line 28
- (NSString *)getCardName {
  
#line 30
  return @"MRTD accedido de forma inalambrica mediante BAC";
}


#line 33
- (void)openSecureChannelIfNotAlreadyOpened {
  
#line 35
  @throw new_JavaLangUnsupportedOperationException_initWithNSString_(
#line 36
  @"No se permite apertura de canal CWA-14890");
}


#line 40
- (NSString *)description {
  
#line 42
  return [self getCardName];
}


#line 45
- (IOSByteArray *)signWithByteArray:(IOSByteArray *)data
                       withNSString:(NSString *)signAlgorithm
withEsGobJmulticardCardPrivateKeyReference:(id<EsGobJmulticardCardPrivateKeyReference>)privateKeyReference {
  
#line 49
  @throw new_JavaLangUnsupportedOperationException_initWithNSString_(
#line 50
  @"No se permite firmar con un MRTD");
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, 0, 1, -1, -1, -1 },
    { NULL, "LNSString;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "V", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LNSString;", 0x1, 2, -1, -1, -1, -1, -1 },
    { NULL, "[B", 0x1, 3, 4, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithEsGobJmulticardConnectionApduConnection:withEsGobJmulticardCryptoHelper:);
  methods[1].selector = @selector(getCardName);
  methods[2].selector = @selector(openSecureChannelIfNotAlreadyOpened);
  methods[3].selector = @selector(description);
  methods[4].selector = @selector(signWithByteArray:withNSString:withEsGobJmulticardCardPrivateKeyReference:);
  #pragma clang diagnostic pop
  static const void *ptrTable[] = { "LEsGobJmulticardConnectionApduConnection;LEsGobJmulticardCryptoHelper;", "LEsGobJmulticardConnectionApduConnectionException;", "toString", "sign", "[BLNSString;LEsGobJmulticardCardPrivateKeyReference;" };
  static const J2ObjcClassInfo _EsGobJmulticardCardIcaoBacIcaoMrtdWithBac = { "IcaoMrtdWithBac", "es.gob.jmulticard.card.icao.bac", ptrTable, methods, NULL, 7, 0x11, 5, 0, -1, -1, -1, -1, -1 };
  return &_EsGobJmulticardCardIcaoBacIcaoMrtdWithBac;
}

@end


#line 18
void EsGobJmulticardCardIcaoBacIcaoMrtdWithBac_initWithEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_(EsGobJmulticardCardIcaoBacIcaoMrtdWithBac *self, id<EsGobJmulticardConnectionApduConnection> conn, EsGobJmulticardCryptoHelper *cryptoHlpr) {
  EsGobJmulticardCardDnieDnie3_initWithEsGobJmulticardConnectionApduConnection_withJavaxSecurityAuthCallbackPasswordCallback_withEsGobJmulticardCryptoHelper_withJavaxSecurityAuthCallbackCallbackHandler_(self,
#line 21
  conn,
#line 22
  nil,
#line 23
  cryptoHlpr,
#line 24
  nil);
}


#line 18
EsGobJmulticardCardIcaoBacIcaoMrtdWithBac *new_EsGobJmulticardCardIcaoBacIcaoMrtdWithBac_initWithEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_(id<EsGobJmulticardConnectionApduConnection> conn, EsGobJmulticardCryptoHelper *cryptoHlpr) {
  J2OBJC_NEW_IMPL(EsGobJmulticardCardIcaoBacIcaoMrtdWithBac, initWithEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_, conn, cryptoHlpr)
}


#line 18
EsGobJmulticardCardIcaoBacIcaoMrtdWithBac *create_EsGobJmulticardCardIcaoBacIcaoMrtdWithBac_initWithEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_(id<EsGobJmulticardConnectionApduConnection> conn, EsGobJmulticardCryptoHelper *cryptoHlpr) {
  J2OBJC_CREATE_IMPL(EsGobJmulticardCardIcaoBacIcaoMrtdWithBac, initWithEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_, conn, cryptoHlpr)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(EsGobJmulticardCardIcaoBacIcaoMrtdWithBac)
