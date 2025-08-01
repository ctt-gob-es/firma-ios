//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

//OBJC CODE
#import "GlobalConstants.h"
#import "AOCertificateInfo.h"
#import "OpenSSLCertificateHelper.h"
#import "CertificateUtils.h"
#import "CADESSignUtils.h"
#import "CADESConstants.h"
#import "DesCypher.h"
#import "AOXMLReader.h"
#import "GAILogger.h"
#import "GAITracker.h"
#import "GAI.h"
#import "GAIDictionaryBuilder.h"
#import "Base64Utils.h"
#import "AOCounterSignXMLParser.h"
#import "IOSPrimitiveArray.h"
#import "J2ObjC_source.h"
#import "AOUtils.h"
#import "Firma.h"
#import "IOSClass.h"
#import "IOSObjectArray.h"
#import "DNIeSigner.h"
#import "InputParametersBatch.h"
#import "PDFCustomTextAnnotation.h"
#import "PDFImageAnnotation.h"

//JAVA CODE
#include "java/util/Properties.h"
#include "java/security/PrivateKey.h"
#include "java/security/PublicKey.h"
#include "java/security/cert/Certificate.h"
#include "java/security/cert/X509Certificate.h"

//JAVAX
#include "javax/security/auth/callback/Callback.h"
#include "javax/security/auth/callback/CallbackHandler.h"
#include "javax/security/auth/callback/PasswordCallback.h"
#include "javax/security/auth/callback/UnsupportedCallbackException.h"
#include "es/gob/jmulticard/callback/CustomTextInputCallback.h"

//DNI
#include "es/gob/jmulticard/connection/ApduConnectionProtocol.h"
#include "es/gob/jmulticard/connection/ApduConnection.h"
#include "es/gob/jmulticard/apdu/ResponseApdu.h"
#include "es/gob/jmulticard/apdu/CommandApdu.h"
#include "es/gob/jmulticard/connection/AbstractApduConnectionIso7816.h"
#include "es/gob/jmulticard/HexUtils.h"
#include "es/gob/jmulticard/apdu/ResponseApdu.h"
#include "es/gob/jmulticard/apdu/dnie/VerifyApduCommand.h"
#include "es/gob/jmulticard/connection/AbstractApduConnectionIso7816.h"
#include "es/gob/jmulticard/connection/ApduConnection.h"
#include "es/gob/jmulticard/connection/ApduConnectionException.h"
#include "es/gob/jmulticard/connection/ApduConnectionProtocol.h"
#include "es/gob/jmulticard/card/dnie/DnieFactory.h"
#include "es/gob/jmulticard/crypto/BcCryptoHelper.h"
#include "es/gob/jmulticard/card/dnie/DnieNfc.h"
#include "es/gob/jmulticard/card/dnie/Dnie.h"
#include "es/gob/jmulticard/ios/DnieFactoryWrapper.h"
#include "es/gob/jmulticard/ios/DnieWrapper.h"
#include "es/gob/jmulticard/ios/ErrorCode.h"
#include "org/bouncycastle/util/encoders/Base64.h"
#include "es/gob/jmulticard/card/dnie/Dnie3.h"
#include "es/gob/jmulticard/card/CryptoCard.h"

//FRAMEWORKS
#import <PAdESSignature/PAdESSigner.h>
#import <PAdESSignature/PKCS1DecoderUtils.h>
