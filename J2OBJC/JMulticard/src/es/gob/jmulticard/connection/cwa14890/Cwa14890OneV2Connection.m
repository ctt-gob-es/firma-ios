//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/connection/cwa14890/Cwa14890OneV2Connection.java
//

#include "J2ObjC_source.h"
#include "es/gob/jmulticard/CryptoHelper.h"
#include "es/gob/jmulticard/card/cwa14890/Cwa14890Card.h"
#include "es/gob/jmulticard/card/cwa14890/Cwa14890PrivateConstants.h"
#include "es/gob/jmulticard/card/cwa14890/Cwa14890PublicConstants.h"
#include "es/gob/jmulticard/connection/AbstractApduEncrypter.h"
#include "es/gob/jmulticard/connection/ApduConnection.h"
#include "es/gob/jmulticard/connection/ApduEncrypterDesMac8.h"
#include "es/gob/jmulticard/connection/cwa14890/ChannelType.h"
#include "es/gob/jmulticard/connection/cwa14890/Cwa14890OneV1Connection.h"
#include "es/gob/jmulticard/connection/cwa14890/Cwa14890OneV2Connection.h"

#if !__has_feature(objc_arc)
#error "es/gob/jmulticard/connection/cwa14890/Cwa14890OneV2Connection must be compiled with ARC (-fobjc-arc)"
#endif

@interface EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection () {
 @public
  EsGobJmulticardConnectionCwa14890ChannelType *channelType_;
}

@end

J2OBJC_FIELD_SETTER(EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection, channelType_, EsGobJmulticardConnectionCwa14890ChannelType *)

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/connection/cwa14890/Cwa14890OneV2Connection.java"


#line 53
@implementation EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection


#line 65
- (instancetype)initWithEsGobJmulticardConnectionApduConnection:(id<EsGobJmulticardConnectionApduConnection>)connection
                                withEsGobJmulticardCryptoHelper:(EsGobJmulticardCryptoHelper *)cryptoHlpr
               withEsGobJmulticardConnectionCwa14890ChannelType:(EsGobJmulticardConnectionCwa14890ChannelType *)chType {
  EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection_initWithEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_withEsGobJmulticardConnectionCwa14890ChannelType_(self, connection, cryptoHlpr, chType);
  return self;
}


#line 83
- (instancetype)initWithEsGobJmulticardCardCwa14890Cwa14890Card:(id<EsGobJmulticardCardCwa14890Cwa14890Card>)card
                    withEsGobJmulticardConnectionApduConnection:(id<EsGobJmulticardConnectionApduConnection>)connection
                                withEsGobJmulticardCryptoHelper:(EsGobJmulticardCryptoHelper *)cryptoHlpr
         withEsGobJmulticardCardCwa14890Cwa14890PublicConstants:(id<EsGobJmulticardCardCwa14890Cwa14890PublicConstants>)cwaConsts
        withEsGobJmulticardCardCwa14890Cwa14890PrivateConstants:(id<EsGobJmulticardCardCwa14890Cwa14890PrivateConstants>)cwaPrivConsts
               withEsGobJmulticardConnectionCwa14890ChannelType:(EsGobJmulticardConnectionCwa14890ChannelType *)chType {
  EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection_initWithEsGobJmulticardCardCwa14890Cwa14890Card_withEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_withEsGobJmulticardCardCwa14890Cwa14890PublicConstants_withEsGobJmulticardCardCwa14890Cwa14890PrivateConstants_withEsGobJmulticardConnectionCwa14890ChannelType_(self, card, connection, cryptoHlpr, cwaConsts, cwaPrivConsts, chType);
  return self;
}


#line 95
- (EsGobJmulticardConnectionCwa14890ChannelType *)getChannelType {
  return channelType_;
}

- (EsGobJmulticardConnectionAbstractApduEncrypter *)instantiateApduEncrypter {
  
#line 101
  return new_EsGobJmulticardConnectionApduEncrypterDesMac8_init();
}


#line 104
- (NSString *)description {
  
#line 106
  return JreStrcat("$$", @"Conexion de tipo CWA-14890-V2 ",
#line 107
  ([self isOpen] ? JreStrcat("$@", @"abierta sobre ",
#line 108
  [self getSubConnection]) :
#line 109
  @"cerrada"));
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x1, -1, 0, -1, -1, -1, -1 },
    { NULL, NULL, 0x1, -1, 1, -1, -1, -1, -1 },
    { NULL, "LEsGobJmulticardConnectionCwa14890ChannelType;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LEsGobJmulticardConnectionAbstractApduEncrypter;", 0x4, -1, -1, -1, -1, -1, -1 },
    { NULL, "LNSString;", 0x1, 2, -1, -1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initWithEsGobJmulticardConnectionApduConnection:withEsGobJmulticardCryptoHelper:withEsGobJmulticardConnectionCwa14890ChannelType:);
  methods[1].selector = @selector(initWithEsGobJmulticardCardCwa14890Cwa14890Card:withEsGobJmulticardConnectionApduConnection:withEsGobJmulticardCryptoHelper:withEsGobJmulticardCardCwa14890Cwa14890PublicConstants:withEsGobJmulticardCardCwa14890Cwa14890PrivateConstants:withEsGobJmulticardConnectionCwa14890ChannelType:);
  methods[2].selector = @selector(getChannelType);
  methods[3].selector = @selector(instantiateApduEncrypter);
  methods[4].selector = @selector(description);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "channelType_", "LEsGobJmulticardConnectionCwa14890ChannelType;", .constantValue.asLong = 0, 0x12, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "LEsGobJmulticardConnectionApduConnection;LEsGobJmulticardCryptoHelper;LEsGobJmulticardConnectionCwa14890ChannelType;", "LEsGobJmulticardCardCwa14890Cwa14890Card;LEsGobJmulticardConnectionApduConnection;LEsGobJmulticardCryptoHelper;LEsGobJmulticardCardCwa14890Cwa14890PublicConstants;LEsGobJmulticardCardCwa14890Cwa14890PrivateConstants;LEsGobJmulticardConnectionCwa14890ChannelType;", "toString" };
  static const J2ObjcClassInfo _EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection = { "Cwa14890OneV2Connection", "es.gob.jmulticard.connection.cwa14890", ptrTable, methods, fields, 7, 0x1, 5, 1, -1, -1, -1, -1, -1 };
  return &_EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection;
}

@end


#line 65
void EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection_initWithEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_withEsGobJmulticardConnectionCwa14890ChannelType_(EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection *self, id<EsGobJmulticardConnectionApduConnection> connection, EsGobJmulticardCryptoHelper *cryptoHlpr, EsGobJmulticardConnectionCwa14890ChannelType *chType) {
  EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection_initWithEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_(self,
#line 68
  connection, cryptoHlpr);
  self->channelType_ = chType;
}


#line 65
EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection *new_EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection_initWithEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_withEsGobJmulticardConnectionCwa14890ChannelType_(id<EsGobJmulticardConnectionApduConnection> connection, EsGobJmulticardCryptoHelper *cryptoHlpr, EsGobJmulticardConnectionCwa14890ChannelType *chType) {
  J2OBJC_NEW_IMPL(EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection, initWithEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_withEsGobJmulticardConnectionCwa14890ChannelType_, connection, cryptoHlpr, chType)
}


#line 65
EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection *create_EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection_initWithEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_withEsGobJmulticardConnectionCwa14890ChannelType_(id<EsGobJmulticardConnectionApduConnection> connection, EsGobJmulticardCryptoHelper *cryptoHlpr, EsGobJmulticardConnectionCwa14890ChannelType *chType) {
  J2OBJC_CREATE_IMPL(EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection, initWithEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_withEsGobJmulticardConnectionCwa14890ChannelType_, connection, cryptoHlpr, chType)
}


#line 83
void EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection_initWithEsGobJmulticardCardCwa14890Cwa14890Card_withEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_withEsGobJmulticardCardCwa14890Cwa14890PublicConstants_withEsGobJmulticardCardCwa14890Cwa14890PrivateConstants_withEsGobJmulticardConnectionCwa14890ChannelType_(EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection *self, id<EsGobJmulticardCardCwa14890Cwa14890Card> card, id<EsGobJmulticardConnectionApduConnection> connection, EsGobJmulticardCryptoHelper *cryptoHlpr, id<EsGobJmulticardCardCwa14890Cwa14890PublicConstants> cwaConsts, id<EsGobJmulticardCardCwa14890Cwa14890PrivateConstants> cwaPrivConsts, EsGobJmulticardConnectionCwa14890ChannelType *chType) {
  EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection_initWithEsGobJmulticardCardCwa14890Cwa14890Card_withEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_withEsGobJmulticardCardCwa14890Cwa14890PublicConstants_withEsGobJmulticardCardCwa14890Cwa14890PrivateConstants_(self,
#line 89
  card, connection, cryptoHlpr, cwaConsts, cwaPrivConsts);
  self->channelType_ = chType;
}


#line 83
EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection *new_EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection_initWithEsGobJmulticardCardCwa14890Cwa14890Card_withEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_withEsGobJmulticardCardCwa14890Cwa14890PublicConstants_withEsGobJmulticardCardCwa14890Cwa14890PrivateConstants_withEsGobJmulticardConnectionCwa14890ChannelType_(id<EsGobJmulticardCardCwa14890Cwa14890Card> card, id<EsGobJmulticardConnectionApduConnection> connection, EsGobJmulticardCryptoHelper *cryptoHlpr, id<EsGobJmulticardCardCwa14890Cwa14890PublicConstants> cwaConsts, id<EsGobJmulticardCardCwa14890Cwa14890PrivateConstants> cwaPrivConsts, EsGobJmulticardConnectionCwa14890ChannelType *chType) {
  J2OBJC_NEW_IMPL(EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection, initWithEsGobJmulticardCardCwa14890Cwa14890Card_withEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_withEsGobJmulticardCardCwa14890Cwa14890PublicConstants_withEsGobJmulticardCardCwa14890Cwa14890PrivateConstants_withEsGobJmulticardConnectionCwa14890ChannelType_, card, connection, cryptoHlpr, cwaConsts, cwaPrivConsts, chType)
}


#line 83
EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection *create_EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection_initWithEsGobJmulticardCardCwa14890Cwa14890Card_withEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_withEsGobJmulticardCardCwa14890Cwa14890PublicConstants_withEsGobJmulticardCardCwa14890Cwa14890PrivateConstants_withEsGobJmulticardConnectionCwa14890ChannelType_(id<EsGobJmulticardCardCwa14890Cwa14890Card> card, id<EsGobJmulticardConnectionApduConnection> connection, EsGobJmulticardCryptoHelper *cryptoHlpr, id<EsGobJmulticardCardCwa14890Cwa14890PublicConstants> cwaConsts, id<EsGobJmulticardCardCwa14890Cwa14890PrivateConstants> cwaPrivConsts, EsGobJmulticardConnectionCwa14890ChannelType *chType) {
  J2OBJC_CREATE_IMPL(EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection, initWithEsGobJmulticardCardCwa14890Cwa14890Card_withEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_withEsGobJmulticardCardCwa14890Cwa14890PublicConstants_withEsGobJmulticardCardCwa14890Cwa14890PrivateConstants_withEsGobJmulticardConnectionCwa14890ChannelType_, card, connection, cryptoHlpr, cwaConsts, cwaPrivConsts, chType)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(EsGobJmulticardConnectionCwa14890Cwa14890OneV2Connection)
