//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/apdu/iso7816four/SelectDfByNameApduCommand.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand")
#ifdef RESTRICT_EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand
#define INCLUDE_ALL_EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand 0
#else
#define INCLUDE_ALL_EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand 1
#endif
#undef RESTRICT_EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand

#if !defined (EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand_) && (INCLUDE_ALL_EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand || defined(INCLUDE_EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand))
#define EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand_

#define RESTRICT_EsGobJmulticardApduCommandApdu 1
#define INCLUDE_EsGobJmulticardApduCommandApdu 1
#include "es/gob/jmulticard/apdu/CommandApdu.h"

@class IOSByteArray;
@class JavaLangInteger;

/*!
 @brief APDU ISO 7816-4 de selecci&oacute;n de DF por nombre.
 @author Carlos Gamuci Mill&aacute;n
 @author Tom&aacute;s Garc&iacute;a-Mer&aacute;s.
 */
@interface EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand : EsGobJmulticardApduCommandApdu

#pragma mark Public

/*!
 @brief Crea una APDU ISO 7816-4 para la selecci&oacute;n del fichero por nombre.
 @param cla Clase (CLA) de la APDU.
 @param name Nombre del fichero.
 */
- (instancetype)initWithByte:(jbyte)cla
               withByteArray:(IOSByteArray *)name;

// Disallowed inherited constructors, do not use.

- (instancetype)initWithByte:(jbyte)arg0
                    withByte:(jbyte)arg1
                    withByte:(jbyte)arg2
                    withByte:(jbyte)arg3
               withByteArray:(IOSByteArray *)arg4
         withJavaLangInteger:(JavaLangInteger *)arg5 NS_UNAVAILABLE;

- (instancetype)initWithByteArray:(IOSByteArray *)arg0 NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand)

FOUNDATION_EXPORT void EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand_initWithByte_withByteArray_(EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand *self, jbyte cla, IOSByteArray *name);

FOUNDATION_EXPORT EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand *new_EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand_initWithByte_withByteArray_(jbyte cla, IOSByteArray *name) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand *create_EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand_initWithByte_withByteArray_(jbyte cla, IOSByteArray *name);

J2OBJC_TYPE_LITERAL_HEADER(EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand)

#endif

#pragma pop_macro("INCLUDE_ALL_EsGobJmulticardApduIso7816fourSelectDfByNameApduCommand")
