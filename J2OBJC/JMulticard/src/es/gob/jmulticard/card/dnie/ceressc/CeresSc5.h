//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/card/dnie/ceressc/CeresSc5.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_EsGobJmulticardCardDnieCeresscCeresSc5")
#ifdef RESTRICT_EsGobJmulticardCardDnieCeresscCeresSc5
#define INCLUDE_ALL_EsGobJmulticardCardDnieCeresscCeresSc5 0
#else
#define INCLUDE_ALL_EsGobJmulticardCardDnieCeresscCeresSc5 1
#endif
#undef RESTRICT_EsGobJmulticardCardDnieCeresscCeresSc5

#if !defined (EsGobJmulticardCardDnieCeresscCeresSc5_) && (INCLUDE_ALL_EsGobJmulticardCardDnieCeresscCeresSc5 || defined(INCLUDE_EsGobJmulticardCardDnieCeresscCeresSc5))
#define EsGobJmulticardCardDnieCeresscCeresSc5_

#define RESTRICT_EsGobJmulticardCardDnieDnie 1
#define INCLUDE_EsGobJmulticardCardDnieDnie 1
#include "es/gob/jmulticard/card/dnie/Dnie.h"

@class EsGobJmulticardCryptoHelper;
@class JavaxSecurityAuthCallbackPasswordCallback;
@protocol EsGobJmulticardCardCwa14890Cwa14890PrivateConstants;
@protocol EsGobJmulticardCardCwa14890Cwa14890PublicConstants;
@protocol EsGobJmulticardConnectionApduConnection;
@protocol JavaxSecurityAuthCallbackCallbackHandler;

/*!
 @brief Tarjetas CERES v5.
 @author Tom&aacute;s Garc&iacute;a-Mer&aacute;s.
 */
@interface EsGobJmulticardCardDnieCeresscCeresSc5 : EsGobJmulticardCardDnieDnie

#pragma mark Public

/*!
 @brief Construye una clase que representa una tarjeta FNMT CERES v5.x con canal EAC 2.
 @param conn Conexi &oacute; n con la tarjeta.
 @param pwc <i> PasswordCallback </i>  para obtener el PIN del DNIe.
 @param cryptoHlpr Funcionalidades criptogr &aacute; ficas de utilidad que                    pueden variar entre m &aacute; quinas virtuales.
 @param ch Gestor de  <i> callbacks </i>  para la solicitud de datos al usuario.
 @throw ApduConnectionExceptionSi la conexi&oacute;n con la tarjeta se proporciona
                                  cerrada y no es posible abrirla.
 @throw IcaoExceptionSi se producen errores abriendo el canal PACE.
 */
- (instancetype)initWithEsGobJmulticardConnectionApduConnection:(id<EsGobJmulticardConnectionApduConnection>)conn
                  withJavaxSecurityAuthCallbackPasswordCallback:(JavaxSecurityAuthCallbackPasswordCallback *)pwc
                                withEsGobJmulticardCryptoHelper:(EsGobJmulticardCryptoHelper *)cryptoHlpr
                   withJavaxSecurityAuthCallbackCallbackHandler:(id<JavaxSecurityAuthCallbackCallbackHandler>)ch;

- (NSString *)getCardName;

#pragma mark Protected

- (id<EsGobJmulticardCardCwa14890Cwa14890PrivateConstants>)getCwa14890PrivateConstants;

- (id<EsGobJmulticardCardCwa14890Cwa14890PublicConstants>)getCwa14890PublicConstants;

@end

J2OBJC_EMPTY_STATIC_INIT(EsGobJmulticardCardDnieCeresscCeresSc5)

FOUNDATION_EXPORT void EsGobJmulticardCardDnieCeresscCeresSc5_initWithEsGobJmulticardConnectionApduConnection_withJavaxSecurityAuthCallbackPasswordCallback_withEsGobJmulticardCryptoHelper_withJavaxSecurityAuthCallbackCallbackHandler_(EsGobJmulticardCardDnieCeresscCeresSc5 *self, id<EsGobJmulticardConnectionApduConnection> conn, JavaxSecurityAuthCallbackPasswordCallback *pwc, EsGobJmulticardCryptoHelper *cryptoHlpr, id<JavaxSecurityAuthCallbackCallbackHandler> ch);

FOUNDATION_EXPORT EsGobJmulticardCardDnieCeresscCeresSc5 *new_EsGobJmulticardCardDnieCeresscCeresSc5_initWithEsGobJmulticardConnectionApduConnection_withJavaxSecurityAuthCallbackPasswordCallback_withEsGobJmulticardCryptoHelper_withJavaxSecurityAuthCallbackCallbackHandler_(id<EsGobJmulticardConnectionApduConnection> conn, JavaxSecurityAuthCallbackPasswordCallback *pwc, EsGobJmulticardCryptoHelper *cryptoHlpr, id<JavaxSecurityAuthCallbackCallbackHandler> ch) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT EsGobJmulticardCardDnieCeresscCeresSc5 *create_EsGobJmulticardCardDnieCeresscCeresSc5_initWithEsGobJmulticardConnectionApduConnection_withJavaxSecurityAuthCallbackPasswordCallback_withEsGobJmulticardCryptoHelper_withJavaxSecurityAuthCallbackCallbackHandler_(id<EsGobJmulticardConnectionApduConnection> conn, JavaxSecurityAuthCallbackPasswordCallback *pwc, EsGobJmulticardCryptoHelper *cryptoHlpr, id<JavaxSecurityAuthCallbackCallbackHandler> ch);

J2OBJC_TYPE_LITERAL_HEADER(EsGobJmulticardCardDnieCeresscCeresSc5)

#endif

#pragma pop_macro("INCLUDE_ALL_EsGobJmulticardCardDnieCeresscCeresSc5")
