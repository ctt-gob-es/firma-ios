//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/pqc/jcajce/provider/rainbow/RainbowKeyPairGeneratorSpi.java
//

#include "J2ObjC_header.h"

#pragma push_macro("INCLUDE_ALL_OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi")
#ifdef RESTRICT_OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi
#define INCLUDE_ALL_OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi 0
#else
#define INCLUDE_ALL_OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi 1
#endif
#undef RESTRICT_OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi

#if !defined (OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi_) && (INCLUDE_ALL_OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi || defined(INCLUDE_OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi))
#define OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi_

#define RESTRICT_JavaSecurityKeyPairGenerator 1
#define INCLUDE_JavaSecurityKeyPairGenerator 1
#include "java/security/KeyPairGenerator.h"

@class JavaSecurityKeyPair;
@class JavaSecuritySecureRandom;
@class OrgBouncycastlePqcCryptoRainbowRainbowKeyGenerationParameters;
@class OrgBouncycastlePqcCryptoRainbowRainbowKeyPairGenerator;
@protocol JavaSecuritySpecAlgorithmParameterSpec;

@interface OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi : JavaSecurityKeyPairGenerator {
 @public
  OrgBouncycastlePqcCryptoRainbowRainbowKeyGenerationParameters *param_;
  OrgBouncycastlePqcCryptoRainbowRainbowKeyPairGenerator *engine_;
  jint strength_;
  JavaSecuritySecureRandom *random_;
  jboolean initialised_;
}

#pragma mark Public

- (instancetype)init;

- (JavaSecurityKeyPair *)generateKeyPair;

- (void)initialize__WithJavaSecuritySpecAlgorithmParameterSpec:(id<JavaSecuritySpecAlgorithmParameterSpec>)params
                                  withJavaSecuritySecureRandom:(JavaSecuritySecureRandom *)random OBJC_METHOD_FAMILY_NONE;

- (void)initialize__WithInt:(jint)strength
withJavaSecuritySecureRandom:(JavaSecuritySecureRandom *)random OBJC_METHOD_FAMILY_NONE;

// Disallowed inherited constructors, do not use.

- (instancetype)initWithNSString:(NSString *)arg0 NS_UNAVAILABLE;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi)

J2OBJC_FIELD_SETTER(OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi, param_, OrgBouncycastlePqcCryptoRainbowRainbowKeyGenerationParameters *)
J2OBJC_FIELD_SETTER(OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi, engine_, OrgBouncycastlePqcCryptoRainbowRainbowKeyPairGenerator *)
J2OBJC_FIELD_SETTER(OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi, random_, JavaSecuritySecureRandom *)

FOUNDATION_EXPORT void OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi_init(OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi *self);

FOUNDATION_EXPORT OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi *new_OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi_init(void) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi *create_OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi_init(void);

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi)

#endif

#pragma pop_macro("INCLUDE_ALL_OrgBouncycastlePqcJcajceProviderRainbowRainbowKeyPairGeneratorSpi")
