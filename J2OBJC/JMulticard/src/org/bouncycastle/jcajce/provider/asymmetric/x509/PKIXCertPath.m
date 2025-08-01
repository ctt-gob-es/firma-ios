//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/jcajce/provider/asymmetric/x509/PKIXCertPath.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/io/BufferedInputStream.h"
#include "java/io/ByteArrayInputStream.h"
#include "java/io/ByteArrayOutputStream.h"
#include "java/io/IOException.h"
#include "java/io/InputStream.h"
#include "java/io/OutputStreamWriter.h"
#include "java/lang/Exception.h"
#include "java/security/NoSuchProviderException.h"
#include "java/security/cert/CertPath.h"
#include "java/security/cert/Certificate.h"
#include "java/security/cert/CertificateEncodingException.h"
#include "java/security/cert/CertificateException.h"
#include "java/security/cert/CertificateFactory.h"
#include "java/security/cert/X509Certificate.h"
#include "java/util/ArrayList.h"
#include "java/util/Collections.h"
#include "java/util/Enumeration.h"
#include "java/util/Iterator.h"
#include "java/util/List.h"
#include "java/util/ListIterator.h"
#include "javax/security/auth/x500/X500Principal.h"
#include "org/bouncycastle/asn1/ASN1Encodable.h"
#include "org/bouncycastle/asn1/ASN1EncodableVector.h"
#include "org/bouncycastle/asn1/ASN1Encoding.h"
#include "org/bouncycastle/asn1/ASN1InputStream.h"
#include "org/bouncycastle/asn1/ASN1Integer.h"
#include "org/bouncycastle/asn1/ASN1ObjectIdentifier.h"
#include "org/bouncycastle/asn1/ASN1Primitive.h"
#include "org/bouncycastle/asn1/ASN1Sequence.h"
#include "org/bouncycastle/asn1/DERSequence.h"
#include "org/bouncycastle/asn1/DERSet.h"
#include "org/bouncycastle/asn1/pkcs/ContentInfo.h"
#include "org/bouncycastle/asn1/pkcs/PKCSObjectIdentifiers.h"
#include "org/bouncycastle/asn1/pkcs/SignedData.h"
#include "org/bouncycastle/jcajce/provider/asymmetric/x509/PKIXCertPath.h"
#include "org/bouncycastle/jcajce/util/BCJcaJceHelper.h"
#include "org/bouncycastle/jcajce/util/JcaJceHelper.h"
#include "org/bouncycastle/util/io/pem/PemObject.h"
#include "org/bouncycastle/util/io/pem/PemWriter.h"

#if !__has_feature(objc_arc)
#error "org/bouncycastle/jcajce/provider/asymmetric/x509/PKIXCertPath must be compiled with ARC (-fobjc-arc)"
#endif

@interface OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath () {
 @public
  id<OrgBouncycastleJcajceUtilJcaJceHelper> helper_;
  id<JavaUtilList> certificates_;
}

/*!
 @param certs
 */
- (id<JavaUtilList>)sortCertsWithJavaUtilList:(id<JavaUtilList>)certs;

/*!
 @brief Return a DERObject containing the encoded certificate.
 @param cert the X509Certificate object to be encoded
 @return the DERObject
 */
- (OrgBouncycastleAsn1ASN1Primitive *)toASN1ObjectWithJavaSecurityCertX509Certificate:(JavaSecurityCertX509Certificate *)cert;

- (IOSByteArray *)toDEREncodedWithOrgBouncycastleAsn1ASN1Encodable:(id<OrgBouncycastleAsn1ASN1Encodable>)obj;

@end

J2OBJC_FIELD_SETTER(OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath, helper_, id<OrgBouncycastleJcajceUtilJcaJceHelper>)
J2OBJC_FIELD_SETTER(OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath, certificates_, id<JavaUtilList>)

__attribute__((unused)) static id<JavaUtilList> OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_sortCertsWithJavaUtilList_(OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath *self, id<JavaUtilList> certs);

__attribute__((unused)) static OrgBouncycastleAsn1ASN1Primitive *OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_toASN1ObjectWithJavaSecurityCertX509Certificate_(OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath *self, JavaSecurityCertX509Certificate *cert);

__attribute__((unused)) static IOSByteArray *OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_toDEREncodedWithOrgBouncycastleAsn1ASN1Encodable_(OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath *self, id<OrgBouncycastleAsn1ASN1Encodable> obj);

#line 1 "/Users/desarrolloabamobile/Downloads/jmulticard-ios/src/main/java/org/bouncycastle/jcajce/provider/asymmetric/x509/PKIXCertPath.java"

J2OBJC_INITIALIZED_DEFN(OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath)

id<JavaUtilList> OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_certPathEncodings;


#line 45
@implementation OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath


#line 66
- (id<JavaUtilList>)sortCertsWithJavaUtilList:(id<JavaUtilList>)certs {
  return OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_sortCertsWithJavaUtilList_(self, certs);
}


#line 156
- (instancetype)initWithJavaUtilList:(id<JavaUtilList>)certificates {
  OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_initWithJavaUtilList_(self, certificates);
  return self;
}


#line 167
- (instancetype)initWithJavaIoInputStream:(JavaIoInputStream *)inStream
                             withNSString:(NSString *)encoding {
  OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_initWithJavaIoInputStream_withNSString_(self, inStream, encoding);
  return self;
}


#line 230
- (id<JavaUtilIterator>)getEncodings {
  
#line 233
  return [((id<JavaUtilList>) nil_chk(OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_certPathEncodings)) iterator];
}


#line 243
- (IOSByteArray *)getEncoded {
  
#line 247
  id<JavaUtilIterator> iter = [self getEncodings];
  if ([((id<JavaUtilIterator>) nil_chk(iter)) hasNext]) {
    
#line 250
    id enc = [iter next];
    if ([enc isKindOfClass:[NSString class]]) {
      
#line 253
      return [self getEncodedWithNSString:(NSString *) enc];
    }
  }
  return nil;
}


#line 269
- (IOSByteArray *)getEncodedWithNSString:(NSString *)encoding {
  
#line 273
  if ([((NSString *) nil_chk(encoding)) java_equalsIgnoreCase:@"PkiPath"]) {
    
#line 275
    OrgBouncycastleAsn1ASN1EncodableVector *v = new_OrgBouncycastleAsn1ASN1EncodableVector_init();
    
#line 277
    id<JavaUtilListIterator> iter = [((id<JavaUtilList>) nil_chk(certificates_)) listIteratorWithInt:[certificates_ size]];
    while ([((id<JavaUtilListIterator>) nil_chk(iter)) hasPrevious]) {
      
#line 280
      [v addWithOrgBouncycastleAsn1ASN1Encodable:OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_toASN1ObjectWithJavaSecurityCertX509Certificate_(self, (JavaSecurityCertX509Certificate *) cast_chk([iter previous], [JavaSecurityCertX509Certificate class]))];
    }
    
#line 283
    return OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_toDEREncodedWithOrgBouncycastleAsn1ASN1Encodable_(self, new_OrgBouncycastleAsn1DERSequence_initWithOrgBouncycastleAsn1ASN1EncodableVector_(v));
  }
  else if ([encoding java_equalsIgnoreCase:@"PKCS7"]) {
    
#line 287
    OrgBouncycastleAsn1PkcsContentInfo *encInfo = new_OrgBouncycastleAsn1PkcsContentInfo_initWithOrgBouncycastleAsn1ASN1ObjectIdentifier_withOrgBouncycastleAsn1ASN1Encodable_(JreLoadStatic(OrgBouncycastleAsn1PkcsPKCSObjectIdentifiers, data), nil);
    
#line 289
    OrgBouncycastleAsn1ASN1EncodableVector *v = new_OrgBouncycastleAsn1ASN1EncodableVector_init();
    for (jint i = 0; i != [((id<JavaUtilList>) nil_chk(certificates_)) size]; i++) {
      
#line 292
      [v addWithOrgBouncycastleAsn1ASN1Encodable:OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_toASN1ObjectWithJavaSecurityCertX509Certificate_(self, (JavaSecurityCertX509Certificate *) cast_chk([((id<JavaUtilList>) nil_chk(certificates_)) getWithInt:i], [JavaSecurityCertX509Certificate class]))];
    }
    
#line 295
    OrgBouncycastleAsn1PkcsSignedData *sd = new_OrgBouncycastleAsn1PkcsSignedData_initWithOrgBouncycastleAsn1ASN1Integer_withOrgBouncycastleAsn1ASN1Set_withOrgBouncycastleAsn1PkcsContentInfo_withOrgBouncycastleAsn1ASN1Set_withOrgBouncycastleAsn1ASN1Set_withOrgBouncycastleAsn1ASN1Set_(new_OrgBouncycastleAsn1ASN1Integer_initWithLong_(
#line 296
    1), new_OrgBouncycastleAsn1DERSet_init(),
#line 298
    encInfo, new_OrgBouncycastleAsn1DERSet_initWithOrgBouncycastleAsn1ASN1EncodableVector_(
#line 299
    v),
#line 300
    nil, new_OrgBouncycastleAsn1DERSet_init());
    
#line 303
    return OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_toDEREncodedWithOrgBouncycastleAsn1ASN1Encodable_(self, new_OrgBouncycastleAsn1PkcsContentInfo_initWithOrgBouncycastleAsn1ASN1ObjectIdentifier_withOrgBouncycastleAsn1ASN1Encodable_(JreLoadStatic(OrgBouncycastleAsn1PkcsPKCSObjectIdentifiers, signedData),
#line 304
    sd));
  }
  else if ([encoding java_equalsIgnoreCase:@"PEM"]) {
    
#line 308
    JavaIoByteArrayOutputStream *bOut = new_JavaIoByteArrayOutputStream_init();
    OrgBouncycastleUtilIoPemPemWriter *pWrt = new_OrgBouncycastleUtilIoPemPemWriter_initWithJavaIoWriter_(new_JavaIoOutputStreamWriter_initWithJavaIoOutputStream_(bOut));
    
#line 311
    @try {
      
#line 313
      for (jint i = 0; i != [((id<JavaUtilList>) nil_chk(certificates_)) size]; i++) {
        
#line 315
        [pWrt writeObjectWithOrgBouncycastleUtilIoPemPemObjectGenerator:new_OrgBouncycastleUtilIoPemPemObject_initWithNSString_withByteArray_(@"CERTIFICATE", [((JavaSecurityCertX509Certificate *) nil_chk(((JavaSecurityCertX509Certificate *) cast_chk([((id<JavaUtilList>) nil_chk(certificates_)) getWithInt:i], [JavaSecurityCertX509Certificate class])))) getEncoded])];
      }
      
#line 318
      [pWrt close];
    }
    @catch (JavaLangException *e) {
      
#line 322
      @throw new_JavaSecurityCertCertificateEncodingException_initWithNSString_(@"can't encode certificate for PEM encoded path");
    }
    
#line 325
    return [bOut toByteArray];
  }
  else {
    
#line 329
    @throw new_JavaSecurityCertCertificateEncodingException_initWithNSString_(JreStrcat("$$", @"unsupported encoding: ", encoding));
  }
}


#line 339
- (id<JavaUtilList>)getCertificates {
  
#line 342
  return JavaUtilCollections_unmodifiableListWithJavaUtilList_(new_JavaUtilArrayList_initWithJavaUtilCollection_(certificates_));
}


#line 352
- (OrgBouncycastleAsn1ASN1Primitive *)toASN1ObjectWithJavaSecurityCertX509Certificate:(JavaSecurityCertX509Certificate *)cert {
  return OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_toASN1ObjectWithJavaSecurityCertX509Certificate_(self, cert);
}


#line 366
- (IOSByteArray *)toDEREncodedWithOrgBouncycastleAsn1ASN1Encodable:(id<OrgBouncycastleAsn1ASN1Encodable>)obj {
  return OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_toDEREncodedWithOrgBouncycastleAsn1ASN1Encodable_(self, obj);
}

+ (const J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { NULL, "LJavaUtilList;", 0x2, 0, 1, -1, -1, -1, -1 },
    { NULL, NULL, 0x0, -1, 1, -1, -1, -1, -1 },
    { NULL, NULL, 0x0, -1, 2, 3, -1, -1, -1 },
    { NULL, "LJavaUtilIterator;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "[B", 0x1, -1, -1, 4, -1, -1, -1 },
    { NULL, "[B", 0x1, 5, 6, 4, -1, -1, -1 },
    { NULL, "LJavaUtilList;", 0x1, -1, -1, -1, -1, -1, -1 },
    { NULL, "LOrgBouncycastleAsn1ASN1Primitive;", 0x2, 7, 8, 4, -1, -1, -1 },
    { NULL, "[B", 0x2, 9, 10, 4, -1, -1, -1 },
  };
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-multiple-method-names"
  #pragma clang diagnostic ignored "-Wundeclared-selector"
  methods[0].selector = @selector(sortCertsWithJavaUtilList:);
  methods[1].selector = @selector(initWithJavaUtilList:);
  methods[2].selector = @selector(initWithJavaIoInputStream:withNSString:);
  methods[3].selector = @selector(getEncodings);
  methods[4].selector = @selector(getEncoded);
  methods[5].selector = @selector(getEncodedWithNSString:);
  methods[6].selector = @selector(getCertificates);
  methods[7].selector = @selector(toASN1ObjectWithJavaSecurityCertX509Certificate:);
  methods[8].selector = @selector(toDEREncodedWithOrgBouncycastleAsn1ASN1Encodable:);
  #pragma clang diagnostic pop
  static const J2ObjcFieldInfo fields[] = {
    { "helper_", "LOrgBouncycastleJcajceUtilJcaJceHelper;", .constantValue.asLong = 0, 0x12, -1, -1, -1, -1 },
    { "certPathEncodings", "LJavaUtilList;", .constantValue.asLong = 0, 0x18, -1, 11, -1, -1 },
    { "certificates_", "LJavaUtilList;", .constantValue.asLong = 0, 0x2, -1, -1, -1, -1 },
  };
  static const void *ptrTable[] = { "sortCerts", "LJavaUtilList;", "LJavaIoInputStream;LNSString;", "LJavaSecurityCertCertificateException;", "LJavaSecurityCertCertificateEncodingException;", "getEncoded", "LNSString;", "toASN1Object", "LJavaSecurityCertX509Certificate;", "toDEREncoded", "LOrgBouncycastleAsn1ASN1Encodable;", &OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_certPathEncodings };
  static const J2ObjcClassInfo _OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath = { "PKIXCertPath", "org.bouncycastle.jcajce.provider.asymmetric.x509", ptrTable, methods, fields, 7, 0x1, 9, 3, -1, -1, -1, -1, -1 };
  return &_OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath;
}

+ (void)initialize {
  if (self == [OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath class]) {
    {
      
#line 54
      id<JavaUtilList> encodings = new_JavaUtilArrayList_init();
      [encodings addWithId:@"PkiPath"];
      [encodings addWithId:@"PEM"];
      [encodings addWithId:@"PKCS7"];
      OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_certPathEncodings = JavaUtilCollections_unmodifiableListWithJavaUtilList_(encodings);
    }
    J2OBJC_SET_INITIALIZED(OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath)
  }
}

@end


#line 66
id<JavaUtilList> OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_sortCertsWithJavaUtilList_(OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath *self, id<JavaUtilList> certs) {
  
#line 69
  if ([((id<JavaUtilList>) nil_chk(certs)) size] < 2) {
    
#line 71
    return certs;
  }
  
#line 74
  JavaxSecurityAuthX500X500Principal *issuer = [((JavaSecurityCertX509Certificate *) nil_chk(((JavaSecurityCertX509Certificate *) cast_chk([certs getWithInt:0], [JavaSecurityCertX509Certificate class])))) getIssuerX500Principal];
  jboolean okay = true;
  
#line 77
  for (jint i = 1; i != [certs size]; i++) {
    
#line 79
    JavaSecurityCertX509Certificate *cert = (JavaSecurityCertX509Certificate *) cast_chk([certs getWithInt:i], [JavaSecurityCertX509Certificate class]);
    
#line 81
    if ([((JavaxSecurityAuthX500X500Principal *) nil_chk(issuer)) isEqual:[((JavaSecurityCertX509Certificate *) nil_chk(cert)) getSubjectX500Principal]]) {
      
#line 83
      issuer = [((JavaSecurityCertX509Certificate *) nil_chk(((JavaSecurityCertX509Certificate *) cast_chk([certs getWithInt:i], [JavaSecurityCertX509Certificate class])))) getIssuerX500Principal];
    }
    else {
      
#line 87
      okay = false;
      break;
    }
  }
  
#line 92
  if (okay) {
    
#line 94
    return certs;
  }
  
#line 98
  id<JavaUtilList> retList = new_JavaUtilArrayList_initWithInt_([certs size]);
  id<JavaUtilList> orig = new_JavaUtilArrayList_initWithJavaUtilCollection_(certs);
  
#line 101
  for (jint i = 0; i < [certs size]; i++) {
    
#line 103
    JavaSecurityCertX509Certificate *cert = (JavaSecurityCertX509Certificate *) cast_chk([certs getWithInt:i], [JavaSecurityCertX509Certificate class]);
    jboolean found = false;
    
#line 106
    JavaxSecurityAuthX500X500Principal *subject = [((JavaSecurityCertX509Certificate *) nil_chk(cert)) getSubjectX500Principal];
    
#line 108
    for (jint j = 0; j != [certs size]; j++) {
      
#line 110
      JavaSecurityCertX509Certificate *c = (JavaSecurityCertX509Certificate *) cast_chk([certs getWithInt:j], [JavaSecurityCertX509Certificate class]);
      if ([((JavaxSecurityAuthX500X500Principal *) nil_chk([((JavaSecurityCertX509Certificate *) nil_chk(c)) getIssuerX500Principal])) isEqual:subject]) {
        
#line 113
        found = true;
        break;
      }
    }
    
#line 118
    if (!found) {
      
#line 120
      [retList addWithId:cert];
      (void) [certs removeWithInt:i];
    }
  }
  
#line 126
  if ([retList size] > 1) {
    
#line 128
    return orig;
  }
  
#line 131
  for (jint i = 0; i != [retList size]; i++) {
    
#line 133
    issuer = [((JavaSecurityCertX509Certificate *) nil_chk(((JavaSecurityCertX509Certificate *) cast_chk([retList getWithInt:i], [JavaSecurityCertX509Certificate class])))) getIssuerX500Principal];
    
#line 135
    for (jint j = 0; j < [certs size]; j++) {
      
#line 137
      JavaSecurityCertX509Certificate *c = (JavaSecurityCertX509Certificate *) cast_chk([certs getWithInt:j], [JavaSecurityCertX509Certificate class]);
      if ([((JavaxSecurityAuthX500X500Principal *) nil_chk(issuer)) isEqual:[((JavaSecurityCertX509Certificate *) nil_chk(c)) getSubjectX500Principal]]) {
        
#line 140
        [retList addWithId:c];
        (void) [certs removeWithInt:j];
        break;
      }
    }
  }
  
#line 148
  if ([certs size] > 0) {
    
#line 150
    return orig;
  }
  
#line 153
  return retList;
}


#line 156
void OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_initWithJavaUtilList_(OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath *self, id<JavaUtilList> certificates) {
  JavaSecurityCertCertPath_initWithNSString_(self,
#line 158
  @"X.509");
  self->helper_ = new_OrgBouncycastleJcajceUtilBCJcaJceHelper_init();
  
#line 159
  self->certificates_ = OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_sortCertsWithJavaUtilList_(self, new_JavaUtilArrayList_initWithJavaUtilCollection_(certificates));
}


#line 156
OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath *new_OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_initWithJavaUtilList_(id<JavaUtilList> certificates) {
  J2OBJC_NEW_IMPL(OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath, initWithJavaUtilList_, certificates)
}


#line 156
OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath *create_OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_initWithJavaUtilList_(id<JavaUtilList> certificates) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath, initWithJavaUtilList_, certificates)
}


#line 167
void OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_initWithJavaIoInputStream_withNSString_(OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath *self, JavaIoInputStream *inStream, NSString *encoding) {
  JavaSecurityCertCertPath_initWithNSString_(self,
#line 172
  @"X.509");
  self->helper_ = new_OrgBouncycastleJcajceUtilBCJcaJceHelper_init();
  
#line 173
  @try {
    
#line 175
    if ([((NSString *) nil_chk(encoding)) java_equalsIgnoreCase:@"PkiPath"]) {
      
#line 177
      OrgBouncycastleAsn1ASN1InputStream *derInStream = new_OrgBouncycastleAsn1ASN1InputStream_initWithJavaIoInputStream_(inStream);
      OrgBouncycastleAsn1ASN1Primitive *derObject = [derInStream readObject];
      if (!([derObject isKindOfClass:[OrgBouncycastleAsn1ASN1Sequence class]])) {
        
#line 181
        @throw new_JavaSecurityCertCertificateException_initWithNSString_(@"input stream does not contain a ASN1 SEQUENCE while reading PkiPath encoded data to load CertPath");
      }
      id<JavaUtilEnumeration> e = [((OrgBouncycastleAsn1ASN1Sequence *) nil_chk(((OrgBouncycastleAsn1ASN1Sequence *) cast_chk(derObject, [OrgBouncycastleAsn1ASN1Sequence class])))) getObjects];
      self->certificates_ = new_JavaUtilArrayList_init();
      JavaSecurityCertCertificateFactory *certFactory = [self->helper_ createCertificateFactoryWithNSString:@"X.509"];
      while ([((id<JavaUtilEnumeration>) nil_chk(e)) hasMoreElements]) {
        
#line 188
        id<OrgBouncycastleAsn1ASN1Encodable> element = (id<OrgBouncycastleAsn1ASN1Encodable>) cast_check([e nextElement], OrgBouncycastleAsn1ASN1Encodable_class_());
        IOSByteArray *encoded = [((OrgBouncycastleAsn1ASN1Primitive *) nil_chk([((id<OrgBouncycastleAsn1ASN1Encodable>) nil_chk(element)) toASN1Primitive])) getEncodedWithNSString:OrgBouncycastleAsn1ASN1Encoding_DER];
        [((id<JavaUtilList>) nil_chk(self->certificates_)) addWithInt:0 withId:[((JavaSecurityCertCertificateFactory *) nil_chk(certFactory)) generateCertificateWithJavaIoInputStream:new_JavaIoByteArrayInputStream_initWithByteArray_(
#line 191
        encoded)]];
      }
    }
    else if ([encoding java_equalsIgnoreCase:@"PKCS7"] || [encoding java_equalsIgnoreCase:@"PEM"]) {
      
#line 196
      inStream = new_JavaIoBufferedInputStream_initWithJavaIoInputStream_(inStream);
      self->certificates_ = new_JavaUtilArrayList_init();
      JavaSecurityCertCertificateFactory *certFactory = [self->helper_ createCertificateFactoryWithNSString:@"X.509"];
      JavaSecurityCertCertificate *cert;
      while ((cert = [((JavaSecurityCertCertificateFactory *) nil_chk(certFactory)) generateCertificateWithJavaIoInputStream:inStream]) != nil) {
        
#line 202
        [((id<JavaUtilList>) nil_chk(self->certificates_)) addWithId:cert];
      }
    }
    else {
      
#line 207
      @throw new_JavaSecurityCertCertificateException_initWithNSString_(JreStrcat("$$", @"unsupported encoding: ", encoding));
    }
  }
  @catch (JavaIoIOException *ex) {
    
#line 212
    @throw new_JavaSecurityCertCertificateException_initWithNSString_(JreStrcat("$$", @"IOException throw while decoding CertPath:\n", [ex description]));
  }
  @catch (JavaSecurityNoSuchProviderException *ex) {
    
#line 216
    @throw new_JavaSecurityCertCertificateException_initWithNSString_(JreStrcat("$$", @"BouncyCastle provider not found while trying to get a CertificateFactory:\n", [ex description]));
  }
  
#line 219
  self->certificates_ = OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_sortCertsWithJavaUtilList_(self, self->certificates_);
}


#line 167
OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath *new_OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_initWithJavaIoInputStream_withNSString_(JavaIoInputStream *inStream, NSString *encoding) {
  J2OBJC_NEW_IMPL(OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath, initWithJavaIoInputStream_withNSString_, inStream, encoding)
}


#line 167
OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath *create_OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_initWithJavaIoInputStream_withNSString_(JavaIoInputStream *inStream, NSString *encoding) {
  J2OBJC_CREATE_IMPL(OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath, initWithJavaIoInputStream_withNSString_, inStream, encoding)
}


#line 352
OrgBouncycastleAsn1ASN1Primitive *OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_toASN1ObjectWithJavaSecurityCertX509Certificate_(OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath *self, JavaSecurityCertX509Certificate *cert) {
  
#line 356
  @try {
    
#line 358
    return [new_OrgBouncycastleAsn1ASN1InputStream_initWithByteArray_([((JavaSecurityCertX509Certificate *) nil_chk(cert)) getEncoded]) readObject];
  }
  @catch (JavaLangException *e) {
    
#line 362
    @throw new_JavaSecurityCertCertificateEncodingException_initWithNSString_(JreStrcat("$$", @"Exception while encoding certificate: ", [e description]));
  }
}


#line 366
IOSByteArray *OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath_toDEREncodedWithOrgBouncycastleAsn1ASN1Encodable_(OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath *self, id<OrgBouncycastleAsn1ASN1Encodable> obj) {
  
#line 369
  @try {
    
#line 371
    return [((OrgBouncycastleAsn1ASN1Primitive *) nil_chk([((id<OrgBouncycastleAsn1ASN1Encodable>) nil_chk(obj)) toASN1Primitive])) getEncodedWithNSString:OrgBouncycastleAsn1ASN1Encoding_DER];
  }
  @catch (JavaIoIOException *e) {
    
#line 375
    @throw new_JavaSecurityCertCertificateEncodingException_initWithNSString_(JreStrcat("$@", @"Exception thrown: ", e));
  }
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleJcajceProviderAsymmetricX509PKIXCertPath)
