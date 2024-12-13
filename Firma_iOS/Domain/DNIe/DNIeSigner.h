//
//  DNIeSigner.h
//  Firma_iOS
//
//  Created by Desarrollo Abamobile on 8/10/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

#import <Foundation/Foundation.h>
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
#include "es/gob/jmulticard/card/dnie/Dnie3.h"
#include "es/gob/jmulticard/card/CryptoCard.h"
#import "IOSObjectArray.h"
#include "es/gob/jmulticard/card/PrivateKeyReference.h"

@interface DNIeSigner : NSObject

+ (IOSByteArray *)signData:(IOSByteArray *)data
		  usingFactory:(EsGobJmulticardCardDnieDnieNfc *)factory
		  withPrivateKey:(id<EsGobJmulticardCardPrivateKeyReference>)privateKey
		  algorithm:(NSString *)algorithm;

@end
