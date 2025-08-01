//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/connection/cwa14890/Cwa14890OneV1Connection.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection")
#ifdef RESTRICT_EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection
#define INCLUDE_ALL_EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection 0
#else
#define INCLUDE_ALL_EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection 1
#endif
#undef RESTRICT_EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection

#if !defined (EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection_) && (INCLUDE_ALL_EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection || defined(INCLUDE_EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection))
#define EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection_

#define RESTRICT_EsGobJmulticardConnectionCwa14890Cwa14890Connection 1
#define INCLUDE_EsGobJmulticardConnectionCwa14890Cwa14890Connection 1
#include "es/gob/jmulticard/connection/cwa14890/Cwa14890Connection.h"

@class EsGobJmulticardApduCommandApdu;
@class EsGobJmulticardApduResponseApdu;
@class EsGobJmulticardConnectionAbstractApduEncrypter;
@class EsGobJmulticardConnectionApduConnectionProtocol;
@class EsGobJmulticardCryptoHelper;
@class IOSByteArray;
@class IOSLongArray;
@protocol EsGobJmulticardCardCwa14890Cwa14890Card;
@protocol EsGobJmulticardCardCwa14890Cwa14890PrivateConstants;
@protocol EsGobJmulticardCardCwa14890Cwa14890PublicConstants;
@protocol EsGobJmulticardConnectionApduConnection;
@protocol JavaSecurityInterfacesRSAPrivateKey;
@protocol JavaSecurityInterfacesRSAPublicKey;

/*!
 @brief Utilidad para el establecimiento y control del canal seguro CWA-14890
  con cifrado DES y MAC de cuatro octetos.
 @author Carlos Gamuci
 @author Tom&aacute;s Garc&iacute;a-Mer&aacute;s.
 */
@interface EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection : NSObject < EsGobJmulticardConnectionCwa14890Cwa14890Connection > {
 @public
  /*!
   @brief Conexi&oacute;n subyacente para el env&iacute;o de APDUs.
   */
  id<EsGobJmulticardConnectionApduConnection> subConnection_;
  /*!
   @brief Indica el estado de la conexi&oacute;n.
   */
  jboolean openState_;
}

#pragma mark Public

/*!
 @brief Crea el canal seguro CWA-14890 para la comunicaci&oacute;n de la tarjeta.
 Es necesario abrir el canal asoci&aacute;ndolo a una conexi&oacute;n para
  poder trasmitir APDUs.
  Si no se indica una conexi&oacute;n se utilizar&aacute;a la conexi&oacute;n
  impl&iacute;cita de la tarjeta indicada.
 @param connectedCard Tarjeta con la funcionalidad CWA-14890.
 @param connection Conexi &oacute; n sobre la cual montar el canal seguro.
 @param cryptoHlpr Motor de operaciones criptogr &aacute; ficas.
 @param cwaConsts Clase de claves p &uacute; blicas CWA-14890.
 @param cwaPrivConsts Clase de claves privadas CWA-14890.
 */
- (instancetype)initWithEsGobJmulticardCardCwa14890Cwa14890Card:(id<EsGobJmulticardCardCwa14890Cwa14890Card>)connectedCard
                    withEsGobJmulticardConnectionApduConnection:(id<EsGobJmulticardConnectionApduConnection>)connection
                                withEsGobJmulticardCryptoHelper:(EsGobJmulticardCryptoHelper *)cryptoHlpr
         withEsGobJmulticardCardCwa14890Cwa14890PublicConstants:(id<EsGobJmulticardCardCwa14890Cwa14890PublicConstants>)cwaConsts
        withEsGobJmulticardCardCwa14890Cwa14890PrivateConstants:(id<EsGobJmulticardCardCwa14890Cwa14890PrivateConstants>)cwaPrivConsts;

- (void)close;

- (IOSByteArray *)getKenc;

- (IOSByteArray *)getKmac;

- (IOSByteArray *)getSsc;

- (id<EsGobJmulticardConnectionApduConnection>)getSubConnection;

- (NSString *)getTerminalInfoWithInt:(jint)terminal;

- (IOSLongArray *)getTerminalsWithBoolean:(jboolean)onlyWithCardPresent;

/*!
 @brief Solicita a la tarjeta un mensaje firmado de autenticaci&oacute;n interna.
 @param card Tarjeta que se desea autenticar.
 @param pubConsts Constantes p &uacute; blicas para la apertura de canal CWA-14890.
 @param randomIfd Aleatorio del desaf &iacute; o del terminal.
 @return Mensaje de autenticaci&oacute;n interna firmado por la tarjeta con su clave privada de componente.
 @throw ApduConnectionExceptionSi hay cualquier error durante el proceso.
 */
+ (IOSByteArray *)internalAuthGetInternalAuthenticateMessageWithEsGobJmulticardCardCwa14890Cwa14890Card:(id<EsGobJmulticardCardCwa14890Cwa14890Card>)card
                                                 withEsGobJmulticardCardCwa14890Cwa14890PublicConstants:(id<EsGobJmulticardCardCwa14890Cwa14890PublicConstants>)pubConsts
                                                                                          withByteArray:(IOSByteArray *)randomIfd;

/*!
 @brief Valida un mensaje de autenticaci&oacute;n interna generado por una tarjeta.
 @param chrCCvIfd CHR de la clave p &uacute; blica del certificado de terminal.
 @param sigMinCiphered Mensaje de autenticaci &oacute; n generado por la tarjeta.
 @param randomIfd Aleatorio del desaf &iacute; o del terminal.
 @param ifdPrivateKey Clave privada del certificado de terminal.
 @param ifdKeyLength Longitud,  <u> en octetos </u> , de las claves RSA del certificado de
                       componente del terminal.
 @param pubConsts Constantes p &uacute; blicas para la apertura de canal CWA-14890.
 @param iccPublicKey Clave p &uacute; blica del certificado de componente.
 @param cryptoHelper Utilidad para la ejecuci &oacute; n de funciones criptogr &aacute; ficas.
 @return Kicc para el cifrado de APDUs con esta tarjeta.
 @throw IOExceptionSi el mensaje no es v&aacute;lido o no se ha podido validar.
 */
+ (IOSByteArray *)internalAuthValidateInternalAuthenticateMessageWithByteArray:(IOSByteArray *)chrCCvIfd
                                                                 withByteArray:(IOSByteArray *)sigMinCiphered
                                                                 withByteArray:(IOSByteArray *)randomIfd
                                       withJavaSecurityInterfacesRSAPrivateKey:(id<JavaSecurityInterfacesRSAPrivateKey>)ifdPrivateKey
                                                                       withInt:(jint)ifdKeyLength
                        withEsGobJmulticardCardCwa14890Cwa14890PublicConstants:(id<EsGobJmulticardCardCwa14890Cwa14890PublicConstants>)pubConsts
                                        withJavaSecurityInterfacesRSAPublicKey:(id<JavaSecurityInterfacesRSAPublicKey>)iccPublicKey
                                               withEsGobJmulticardCryptoHelper:(EsGobJmulticardCryptoHelper *)cryptoHelper;

- (jboolean)isOpen;

/*!
 @brief Abre el canal seguro con la tarjeta.
 La conexi&oacute;n se reiniciar&aacute; previamente a la apertura del canal.
 */
- (void)open;

- (IOSByteArray *)reset;

- (void)setProtocolWithEsGobJmulticardConnectionApduConnectionProtocol:(EsGobJmulticardConnectionApduConnectionProtocol *)p;

- (void)setTerminalWithInt:(jint)t;

- (NSString *)description;

- (EsGobJmulticardApduResponseApdu *)transmitWithEsGobJmulticardApduCommandApdu:(EsGobJmulticardApduCommandApdu *)command;

#pragma mark Protected

/*!
 @brief Obtiene la clase de utilidad para encriptar las APDU.
 @return Clase de utilidad para encriptar las APDU.
 */
- (EsGobJmulticardConnectionAbstractApduEncrypter *)instantiateApduEncrypter;

#pragma mark Package-Private

/*!
 @brief Crea el canal seguro CWA-14890 para la comunicaci&oacute;n de la tarjeta.
 Es necesario abrir el canal asoci&aacute;ndolo a una conexi&oacute;n para
  poder trasmitir APDUs.
  Si no se indica una conexi&oacute;n se utilizar&aacute;a la conexi&oacute;n
  impl&iacute;cita de la tarjeta indicada.
 @param connection Conexi &oacute; n sobre la cual montar el canal seguro.
 @param cryptoHlpr Motor de operaciones criptogr &aacute; ficas.
 */
- (instancetype)initWithEsGobJmulticardConnectionApduConnection:(id<EsGobJmulticardConnectionApduConnection>)connection
                                withEsGobJmulticardCryptoHelper:(EsGobJmulticardCryptoHelper *)cryptoHlpr;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_STATIC_INIT(EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection)

J2OBJC_FIELD_SETTER(EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection, subConnection_, id<EsGobJmulticardConnectionApduConnection>)

FOUNDATION_EXPORT void EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection_initWithEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_(EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection *self, id<EsGobJmulticardConnectionApduConnection> connection, EsGobJmulticardCryptoHelper *cryptoHlpr);

FOUNDATION_EXPORT EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection *new_EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection_initWithEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_(id<EsGobJmulticardConnectionApduConnection> connection, EsGobJmulticardCryptoHelper *cryptoHlpr) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection *create_EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection_initWithEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_(id<EsGobJmulticardConnectionApduConnection> connection, EsGobJmulticardCryptoHelper *cryptoHlpr);

FOUNDATION_EXPORT void EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection_initWithEsGobJmulticardCardCwa14890Cwa14890Card_withEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_withEsGobJmulticardCardCwa14890Cwa14890PublicConstants_withEsGobJmulticardCardCwa14890Cwa14890PrivateConstants_(EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection *self, id<EsGobJmulticardCardCwa14890Cwa14890Card> connectedCard, id<EsGobJmulticardConnectionApduConnection> connection, EsGobJmulticardCryptoHelper *cryptoHlpr, id<EsGobJmulticardCardCwa14890Cwa14890PublicConstants> cwaConsts, id<EsGobJmulticardCardCwa14890Cwa14890PrivateConstants> cwaPrivConsts);

FOUNDATION_EXPORT EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection *new_EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection_initWithEsGobJmulticardCardCwa14890Cwa14890Card_withEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_withEsGobJmulticardCardCwa14890Cwa14890PublicConstants_withEsGobJmulticardCardCwa14890Cwa14890PrivateConstants_(id<EsGobJmulticardCardCwa14890Cwa14890Card> connectedCard, id<EsGobJmulticardConnectionApduConnection> connection, EsGobJmulticardCryptoHelper *cryptoHlpr, id<EsGobJmulticardCardCwa14890Cwa14890PublicConstants> cwaConsts, id<EsGobJmulticardCardCwa14890Cwa14890PrivateConstants> cwaPrivConsts) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection *create_EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection_initWithEsGobJmulticardCardCwa14890Cwa14890Card_withEsGobJmulticardConnectionApduConnection_withEsGobJmulticardCryptoHelper_withEsGobJmulticardCardCwa14890Cwa14890PublicConstants_withEsGobJmulticardCardCwa14890Cwa14890PrivateConstants_(id<EsGobJmulticardCardCwa14890Cwa14890Card> connectedCard, id<EsGobJmulticardConnectionApduConnection> connection, EsGobJmulticardCryptoHelper *cryptoHlpr, id<EsGobJmulticardCardCwa14890Cwa14890PublicConstants> cwaConsts, id<EsGobJmulticardCardCwa14890Cwa14890PrivateConstants> cwaPrivConsts);

FOUNDATION_EXPORT IOSByteArray *EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection_internalAuthGetInternalAuthenticateMessageWithEsGobJmulticardCardCwa14890Cwa14890Card_withEsGobJmulticardCardCwa14890Cwa14890PublicConstants_withByteArray_(id<EsGobJmulticardCardCwa14890Cwa14890Card> card, id<EsGobJmulticardCardCwa14890Cwa14890PublicConstants> pubConsts, IOSByteArray *randomIfd);

FOUNDATION_EXPORT IOSByteArray *EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection_internalAuthValidateInternalAuthenticateMessageWithByteArray_withByteArray_withByteArray_withJavaSecurityInterfacesRSAPrivateKey_withInt_withEsGobJmulticardCardCwa14890Cwa14890PublicConstants_withJavaSecurityInterfacesRSAPublicKey_withEsGobJmulticardCryptoHelper_(IOSByteArray *chrCCvIfd, IOSByteArray *sigMinCiphered, IOSByteArray *randomIfd, id<JavaSecurityInterfacesRSAPrivateKey> ifdPrivateKey, jint ifdKeyLength, id<EsGobJmulticardCardCwa14890Cwa14890PublicConstants> pubConsts, id<JavaSecurityInterfacesRSAPublicKey> iccPublicKey, EsGobJmulticardCryptoHelper *cryptoHelper);

J2OBJC_TYPE_LITERAL_HEADER(EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection)

#endif

#pragma pop_macro("INCLUDE_ALL_EsGobJmulticardConnectionCwa14890Cwa14890OneV1Connection")
