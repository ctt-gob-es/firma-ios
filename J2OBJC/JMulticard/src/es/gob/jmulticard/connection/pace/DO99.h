//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/connection/pace/DO99.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_EsGobJmulticardConnectionPaceDO99")
#ifdef RESTRICT_EsGobJmulticardConnectionPaceDO99
#define INCLUDE_ALL_EsGobJmulticardConnectionPaceDO99 0
#else
#define INCLUDE_ALL_EsGobJmulticardConnectionPaceDO99 1
#endif
#undef RESTRICT_EsGobJmulticardConnectionPaceDO99

#if !defined (EsGobJmulticardConnectionPaceDO99_) && (INCLUDE_ALL_EsGobJmulticardConnectionPaceDO99 || defined(INCLUDE_EsGobJmulticardConnectionPaceDO99))
#define EsGobJmulticardConnectionPaceDO99_

@class IOSByteArray;

/*!
 @brief Objeto de Datos 99.
 <code>| 0x99 | 0x02 | SW1, SW2 (2 octetos) |</code>
 @author Tom&aacute;s Garc&iacute;a-Mer&aacute;s
 @author Tobias Senger (tobias@@t-senger.de).
 */
@interface EsGobJmulticardConnectionPaceDO99 : NSObject

#pragma mark Package-Private

- (instancetype)initPackagePrivateWithByteArray:(IOSByteArray *)encodedData;

- (IOSByteArray *)getData;

- (IOSByteArray *)getEncoded;

// Disallowed inherited constructors, do not use.

- (instancetype)init NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(EsGobJmulticardConnectionPaceDO99)

FOUNDATION_EXPORT void EsGobJmulticardConnectionPaceDO99_initPackagePrivateWithByteArray_(EsGobJmulticardConnectionPaceDO99 *self, IOSByteArray *encodedData);

FOUNDATION_EXPORT EsGobJmulticardConnectionPaceDO99 *new_EsGobJmulticardConnectionPaceDO99_initPackagePrivateWithByteArray_(IOSByteArray *encodedData) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT EsGobJmulticardConnectionPaceDO99 *create_EsGobJmulticardConnectionPaceDO99_initPackagePrivateWithByteArray_(IOSByteArray *encodedData);

J2OBJC_TYPE_LITERAL_HEADER(EsGobJmulticardConnectionPaceDO99)

#endif

#pragma pop_macro("INCLUDE_ALL_EsGobJmulticardConnectionPaceDO99")
