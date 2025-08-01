//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/jcajce/provider/asymmetric/x509/X509CRLInternal.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/security/cert/CRLException.h"
#include "org/bouncycastle/asn1/x509/CertificateList.h"
#include "org/bouncycastle/jcajce/provider/asymmetric/x509/X509CRLImpl.h"
#include "org/bouncycastle/jcajce/provider/asymmetric/x509/X509CRLInternal.h"
#include "org/bouncycastle/jcajce/util/JcaJceHelper.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/jcajce/provider/asymmetric/x509/X509CRLInternal must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastleJcajceProviderAsymmetricX509X509CRLInternal () {
 @public
  IOSByteArray *encoding_;
  JavaSecurityCertCRLException *exception_;
}

@end

J2OBJC_FIELD_SETTER(OrgBouncycastleJcajceProviderAsymmetricX509X509CRLInternal, encoding_, IOSByteArray *)
J2OBJC_FIELD_SETTER(OrgBouncycastleJcajceProviderAsymmetricX509X509CRLInternal, exception_, JavaSecurityCertCRLException *)

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/jcajce/provider/asymmetric/x509/X509CRLInternal.java"


#line 14
@implementation OrgBouncycastleJcajceProviderAsymmetricX509X509CRLInternal


#line 19
- (instancetype)initPackagePrivateWithOrgBouncycastleJcajceUtilJcaJceHelper:(id<OrgBouncycastleJcajceUtilJcaJceHelper>)bcHelper
                                 withOrgBouncycastleAsn1X509CertificateList:(OrgBouncycastleAsn1X509CertificateList *)c
                                                               withNSString:(NSString *)sigAlgName
                                                              withByteArray:(IOSByteArray *)sigAlgParams
                                                                withBoolean:(jboolean)isIndirect
                                                              withByteArray:(IOSByteArray *)encoding
                                           withJavaSecurityCertCRLException:(JavaSecurityCertCRLException *)exception {
  OrgBouncycastleJcajceProviderAsymmetricX509X509CRLInternal_initPackagePrivateWithOrgBouncycastleJcajceUtilJcaJceHelper_withOrgBouncycastleAsn1X509CertificateList_withNSString_withByteArray_withBoolean_withByteArray_withJavaSecurityCertCRLException_(self, bcHelper, c, sigAlgName, sigAlgParams, isIndirect, encoding, exception);
  return self;
}


#line 28
- (IOSByteArray *)getEncoded {
  
#line 31
  if (nil != exception_) {
    
#line 33
    @throw exception_;
  }
  
#line 36
  if (nil == encoding_) {
    
#line 38
    @throw new_JavaSecurityCertCRLException_init();
  }
  
#line 45
  return encoding_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, NULL, 0x0, -1, 0, -1, -1, -1, -1 },
    { NULL, "[B", 0x1, -1, -1, 1, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(initPackagePrivateWithOrgBouncycastleJcajceUtilJcaJceHelper:withOrgBouncycastleAsn1X509CertificateList:withNSString:withByteArray:withBoolean:withByteArray:withJavaSecurityCertCRLException:);
  methods[1].selector = @selector(getEncoded);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "encoding_", "[B", .constantValue.asLong = 0, 0x12, -1, -1, -1, -1 },
    { "exception_", "LJavaSecurityCertCRLException;", .constantValue.asLong = 0, 0x12, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "LOrgBouncycastleJcajceUtilJcaJceHelper;LOrgBouncycastleAsn1X509CertificateList;LNSString;[BZ[BLJavaSecurityCertCRLException;", "LJavaSecurityCertCRLException;" };
  static const J2ObjcClassInfo _OrgBouncycastleJcajceProviderAsymmetricX509X509CRLInternal = { "X509CRLInternal", "org.bouncycastle.jcajce.provider.asymmetric.x509", ptrTable, methods, fields, 7, 0x0, 2, 2, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleJcajceProviderAsymmetricX509X509CRLInternal;
}

@end


#line 19
void OrgBouncycastleJcajceProviderAsymmetricX509X509CRLInternal_initPackagePrivateWithOrgBouncycastleJcajceUtilJcaJceHelper_withOrgBouncycastleAsn1X509CertificateList_withNSString_withByteArray_withBoolean_withByteArray_withJavaSecurityCertCRLException_(OrgBouncycastleJcajceProviderAsymmetricX509X509CRLInternal *self, id<OrgBouncycastleJcajceUtilJcaJceHelper> bcHelper, OrgBouncycastleAsn1X509CertificateList *c, NSString *sigAlgName, IOSByteArray *sigAlgParams, jboolean isIndirect, IOSByteArray *encoding, JavaSecurityCertCRLException *exception) {
  OrgBouncycastleJcajceProviderAsymmetricX509X509CRLImpl_initPackagePrivateWithOrgBouncycastleJcajceUtilJcaJceHelper_withOrgBouncycastleAsn1X509CertificateList_withNSString_withByteArray_withBoolean_(self,
#line 22
  bcHelper, c, sigAlgName, sigAlgParams, isIndirect);
  
#line 24
  self->encoding_ = encoding;
  self->exception_ = exception;
}


#line 19
OrgBouncycastleJcajceProviderAsymmetricX509X509CRLInternal *new_OrgBouncycastleJcajceProviderAsymmetricX509X509CRLInternal_initPackagePrivateWithOrgBouncycastleJcajceUtilJcaJceHelper_withOrgBouncycastleAsn1X509CertificateList_withNSString_withByteArray_withBoolean_withByteArray_withJavaSecurityCertCRLException_(id<OrgBouncycastleJcajceUtilJcaJceHelper> bcHelper, OrgBouncycastleAsn1X509CertificateList *c, NSString *sigAlgName, IOSByteArray *sigAlgParams, jboolean isIndirect, IOSByteArray *encoding, JavaSecurityCertCRLException *exception) {
  J2OBJC_NEW_IMPL(OrgBouncycastleJcajceProviderAsymmetricX509X509CRLInternal, initPackagePrivateWithOrgBouncycastleJcajceUtilJcaJceHelper_withOrgBouncycastleAsn1X509CertificateList_withNSString_withByteArray_withBoolean_withByteArray_withJavaSecurityCertCRLException_, bcHelper, c, sigAlgName, sigAlgParams, isIndirect, encoding, exception)
}


#line 19
OrgBouncycastleJcajceProviderAsymmetricX509X509CRLInternal *create_OrgBouncycastleJcajceProviderAsymmetricX509X509CRLInternal_initPackagePrivateWithOrgBouncycastleJcajceUtilJcaJceHelper_withOrgBouncycastleAsn1X509CertificateList_withNSString_withByteArray_withBoolean_withByteArray_withJavaSecurityCertCRLException_(id<OrgBouncycastleJcajceUtilJcaJceHelper> bcHelper, OrgBouncycastleAsn1X509CertificateList *c, NSString *sigAlgName, IOSByteArray *sigAlgParams, jboolean isIndirect, IOSByteArray *encoding, JavaSecurityCertCRLException *exception) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleJcajceProviderAsymmetricX509X509CRLInternal, initPackagePrivateWithOrgBouncycastleJcajceUtilJcaJceHelper_withOrgBouncycastleAsn1X509CertificateList_withNSString_withByteArray_withBoolean_withByteArray_withJavaSecurityCertCRLException_, bcHelper, c, sigAlgName, sigAlgParams, isIndirect, encoding, exception)
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleJcajceProviderAsymmetricX509X509CRLInternal)
