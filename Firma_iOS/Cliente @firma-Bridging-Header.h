//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

//OBJC CODE
#import "AOSignViewController.h"
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
#import "BatchSignUseCase.h"
#import "Base64Utils.h"
#import "AOCounterSignXMLParser.h"
#import "Pkcs1Utils.h"
#import "IOSPrimitiveArray.h"
#import "J2ObjC_source.h"
#import "AOUtils.h"
#import "Firma.h"
#import "AOPadesUtils.h"
#import "PadesUtils.h"
#import "SignatureResult.h"
#import "IOSClass.h"
#import "IOSObjectArray.h"


//JAVA CODE
#include "java/util/Properties.h"
#include "java/security/PrivateKey.h"
#include "java/security/PublicKey.h"
#include "java/security/cert/Certificate.h"
