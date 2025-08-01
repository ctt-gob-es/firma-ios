//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/es/gob/jmulticard/card/icao/Gender.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_EsGobJmulticardCardIcaoGender")
#ifdef RESTRICT_EsGobJmulticardCardIcaoGender
#define INCLUDE_ALL_EsGobJmulticardCardIcaoGender 0
#else
#define INCLUDE_ALL_EsGobJmulticardCardIcaoGender 1
#endif
#undef RESTRICT_EsGobJmulticardCardIcaoGender

#if __has_feature(nullability)
#pragma clang diagnostic push
#pragma GCC diagnostic ignored "-Wnullability"
#pragma GCC diagnostic ignored "-Wnullability-completeness"
#endif

#if !defined (EsGobJmulticardCardIcaoGender_) && (INCLUDE_ALL_EsGobJmulticardCardIcaoGender || defined(INCLUDE_EsGobJmulticardCardIcaoGender))
#define EsGobJmulticardCardIcaoGender_

#define RESTRICT_JavaLangEnum 1
#define INCLUDE_JavaLangEnum 1
#include "java/lang/Enum.h"

@class IOSObjectArray;

typedef NS_ENUM(NSUInteger, EsGobJmulticardCardIcaoGender_Enum) {
  EsGobJmulticardCardIcaoGender_Enum_MALE = 0,
  EsGobJmulticardCardIcaoGender_Enum_FEMALE = 1,
  EsGobJmulticardCardIcaoGender_Enum_OTHER = 2,
};

/*!
 @brief Sexo del titular de un MRTD.
 @author Tom&aacute;s Garc&iacute;a-Mer&aacute;s.
 */
@interface EsGobJmulticardCardIcaoGender : JavaLangEnum

#pragma mark Public

/*!
 @brief Obtiene el sexo del titular a partir del texto correspondiente en la MRZ del MRTD.
 @param text Texto correspondiente al sexo en la MRZ del MRTD.              Debe ser "F" (
  <i> female </i> ) o "M" ( <i> male </i> ).
 @return Sexo del titular del MRTD.
 */
+ (EsGobJmulticardCardIcaoGender *)getGenderWithNSString:(NSString *)text;

- (NSString *)description;

+ (EsGobJmulticardCardIcaoGender *)valueOfWithNSString:(NSString *)name;

+ (IOSObjectArray *)values;

#pragma mark Package-Private

- (EsGobJmulticardCardIcaoGender_Enum)toNSEnum;

@end

J2OBJC_STATIC_INIT(EsGobJmulticardCardIcaoGender)

/*! INTERNAL ONLY - Use enum accessors declared below. */
FOUNDATION_EXPORT EsGobJmulticardCardIcaoGender *EsGobJmulticardCardIcaoGender_values_[];

/*!
 @brief Hombre.
 */
inline EsGobJmulticardCardIcaoGender *EsGobJmulticardCardIcaoGender_get_MALE(void);
J2OBJC_ENUM_CONSTANT(EsGobJmulticardCardIcaoGender, MALE)

/*!
 @brief Mujer.
 */
inline EsGobJmulticardCardIcaoGender *EsGobJmulticardCardIcaoGender_get_FEMALE(void);
J2OBJC_ENUM_CONSTANT(EsGobJmulticardCardIcaoGender, FEMALE)

/*!
 @brief Desconocido.
 */
inline EsGobJmulticardCardIcaoGender *EsGobJmulticardCardIcaoGender_get_OTHER(void);
J2OBJC_ENUM_CONSTANT(EsGobJmulticardCardIcaoGender, OTHER)

FOUNDATION_EXPORT EsGobJmulticardCardIcaoGender *EsGobJmulticardCardIcaoGender_getGenderWithNSString_(NSString *text);

FOUNDATION_EXPORT IOSObjectArray *EsGobJmulticardCardIcaoGender_values(void);

FOUNDATION_EXPORT EsGobJmulticardCardIcaoGender *EsGobJmulticardCardIcaoGender_valueOfWithNSString_(NSString *name);

FOUNDATION_EXPORT EsGobJmulticardCardIcaoGender *EsGobJmulticardCardIcaoGender_fromOrdinal(NSUInteger ordinal);

J2OBJC_TYPE_LITERAL_HEADER(EsGobJmulticardCardIcaoGender)

#endif


#if __has_feature(nullability)
#pragma clang diagnostic pop
#endif
#pragma pop_macro("INCLUDE_ALL_EsGobJmulticardCardIcaoGender")
