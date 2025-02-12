//
//  HashAlgorithmType.h
//  PAdESSignature
//
//  Created by Luis Nicieza on 11/2/25.
//

#ifndef HASH_ALGORITHM_TYPE_H
#define HASH_ALGORITHM_TYPE_H

#import <Foundation/Foundation.h>

typedef NSString * HashAlgorithmType NS_STRING_ENUM;

FOUNDATION_EXPORT HashAlgorithmType const HashAlgorithmTypeSHA1;
FOUNDATION_EXPORT HashAlgorithmType const HashAlgorithmTypeSHA256;
FOUNDATION_EXPORT HashAlgorithmType const HashAlgorithmTypeSHA384;
FOUNDATION_EXPORT HashAlgorithmType const HashAlgorithmTypeSHA512;

#endif
