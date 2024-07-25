//
//  CertificateUtils.m
//  FirmaDigital
//
//  Modified by Carlos Pérez on 25/02/11.
//

#import "CertificateUtils.h"
#import <Foundation/Foundation.h>
#import <Security/Security.h>
#import <UIKit/UIKit.h>
#import "Base64Utils.h"
#import "GlobalConstants.h"
#import "OpenSSLCertificateHelper.h"
#import <openssl/x509.h>


#define SHA1_DIGESTINFO_HEADER_LENGTH 15
static unsigned char SHA1_DIGESTINFO_HEADER[] =
{
    0x30,  0x21,  0x30, 0x09,  0x06,  0x05,  0x2B,  0x0E,  0x03, 0x02,
    0x1A,  0x05,  0x00,  0x04,  0x14
};

#define SHA256_DIGESTINFO_HEADER_LENGTH 19
static unsigned char SHA256_DIGESTINFO_HEADER[] =
{
    0x30, 0x31, 0x30,  0x0D,  0x06,  0x09,  0x60,  0x86, 0x48,  0x01,
    0x65, 0x03, 0x04,  0x02,  0x01,  0x05, 0x00,  0x04, 0x20
};

#define SHA384_DIGESTINFO_HEADER_LENGTH 19
static unsigned char SHA384_DIGESTINFO_HEADER[]=
{
    0x30,  0x41,  0x30,  0x0D,  0x06,  0x09,  0x60,  0x86,  0x48,  0x01,
    0x65,  0x03,  0x04, 0x02, 0x02, 0x05, 0x00,  0x04,  0x30
};

#define SHA512_DIGESTINFO_HEADER_LENGTH 19
static unsigned char  SHA512_DIGESTINFO_HEADER[] =
{
    0x30,  0x51,   0x30,   0x0D,   0x06,   0x09,   0x60,   0x86,   0x48,   0x01,
    0x65,   0x03,   0x04,   0x02,   0x03,   0x05,   0x00,   0x04,   0x40
};

@implementation CertificateUtils

static CertificateUtils *_sharedWrapper = nil;

+(CertificateUtils *)sharedWrapper
{
    @synchronized(self)
    {
        if (!_sharedWrapper) {
            _sharedWrapper = [[self alloc] init];
        }
        return _sharedWrapper;
    }
    
    return nil;
}

+ (NSString *)accessgroup
{
    NSDictionary *query = [NSDictionary dictionaryWithObjectsAndKeys:
                           (__bridge NSString *)kSecClassGenericPassword, (__bridge NSString *)kSecClass,
                           @"bundleSeedID", kSecAttrAccount,
                           @"", kSecAttrService,
                           (id)kCFBooleanTrue, kSecReturnAttributes,
                           nil];
    CFDictionaryRef result = nil;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, (CFTypeRef *)&result);
    
    if (status == errSecItemNotFound) {
        status = SecItemAdd((__bridge CFDictionaryRef)query, (CFTypeRef *)&result);
    }
    
    if (status != errSecSuccess) {
        return nil;
    }
    NSString *accessGroup = [(__bridge NSDictionary *)result objectForKey : (__bridge NSString *)kSecAttrAccessGroup];
    
    return accessGroup;
}

- (OSStatus)loadCertKeyWithName:(NSString *)certName password:(NSString *)pass fromDocument:(BOOL)saveInDocument
{
    NSData *PKCS12Data = nil;
    
    if (saveInDocument) {
        NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:certName];
        PKCS12Data = [NSData dataWithContentsOfFile:filePath];
        
    } else {
        
        // Load PCKCS12 from bundle file
        NSString *thePath = [[NSBundle mainBundle]pathForResource:certName ofType:P12EXTENSION];
        
        if (thePath == nil) {
            
            thePath = [[NSBundle mainBundle]pathForResource:certName ofType:PFXEXTENSION];
            
            if (thePath == nil) {
                return errSecItemNotFound;
            }
        }
        
        PKCS12Data = [[NSData alloc] initWithContentsOfFile:thePath];
    }
    
    CFDataRef inPKCS12Data = (CFDataRef)PKCS12Data;
    OSStatus status = noErr;
    SecTrustRef myTrust;
    
    status = [self extractIdentityAndTrust:&_myIdentity fromPKCS12Data:inPKCS12Data withPassword:pass outIdentity:&myTrust];
    
    if (status != 0) {
        return status;
    }
    
    status = SecIdentityCopyPrivateKey(_myIdentity, &_privateKey);
    
    if (status != 0) {
        return status;
    }
    
    status = SecIdentityCopyCertificate(_myIdentity, &_certificateRef);  // 1
    CFStringRef certSummary = SecCertificateCopySubjectSummary(_certificateRef);  // 2
    _summaryString = [[NSString alloc]initWithString:(NSString *)certSummary];
    
    _publicKey = SecTrustCopyPublicKey(myTrust);
    if (certSummary) {
        CFRelease(certSummary);
    }
    
    return status;
}

- (OSStatus)loadCertKeyChainWithName:(NSString *)certName password:(NSString *)pass fromDocument:(BOOL)saveInDocument
{
    OSStatus status = noErr;
    status = [self loadCertKeyWithName:certName password:pass fromDocument:saveInDocument];
    
    if (status != noErr) {
        return status;
    }
    
    status = [self addKeychainIdentity];
    
    return status;
}

- (OSStatus)extractIdentityAndTrust:(SecIdentityRef *)identity fromPKCS12Data:(CFDataRef)pkcs12Data withPassword:(NSString *)pass outIdentity:(SecTrustRef *)outIdentity
{
    OSStatus securityError = errSecSuccess;
    
    CFStringRef password = (CFStringRef)pass;
    const void *keys[] = { kSecImportExportPassphrase };
    const void *values[] = { password };
    
    CFDictionaryRef optionsDictionary = CFDictionaryCreate(NULL, keys, values, 1, NULL, NULL);
    
    CFArrayRef items = CFArrayCreate(NULL, 0, 0, NULL);
    
    securityError = SecPKCS12Import(pkcs12Data, optionsDictionary, &items);
    
    if (securityError == 0) {
        CFDictionaryRef myIdentityAndTrust = CFArrayGetValueAtIndex(items, 0);
        const void *tempIdentity = NULL;
        tempIdentity = CFDictionaryGetValue(myIdentityAndTrust, kSecImportItemIdentity);
        *identity = (SecIdentityRef)tempIdentity;
        const void *tempTrust = NULL;
        tempTrust = CFDictionaryGetValue(myIdentityAndTrust, kSecImportItemTrust);
        *outIdentity = (SecTrustRef)tempTrust;
    }
    
    if (optionsDictionary) {
        CFRelease(optionsDictionary);
    }
    
    return securityError;
}

- (OSStatus)addKeychainIdentity
{
    OSStatus sanityCheck = noErr;
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    // [dict setObject:(id)kSecClassIdentity forKey:(id) kSecClass];
    [dict setObject:(id)_myIdentity forKey:(id)kSecValueRef];
    
#if TARGET_IPHONE_SIMULATOR
    // Ignore the access group if running on the iPhone simulator.
    //
    // Apps that are built for the simulator aren't signed, so there's no keychain access group
    // for the simulator to check. This means that all apps can see all keychain items when run
    // on the simulator.
    //
    // If a SecItem contains an access group attribute, SecItemAdd and SecItemUpdate on the
    // simulator will return -25243 (errSecNoAccessForItem).
#else
    [dict setObject:[CertificateUtils accessgroup] forKey:(id)kSecAttrAccessGroup];
#endif
    // Remove any existing instance of the key
    sanityCheck = SecItemDelete((CFDictionaryRef)dict);
    
    // Add the new key
    sanityCheck = SecItemAdd((CFDictionaryRef)dict, NULL);
    
    if (dict) {
        CFRelease(dict);
    }
    
    return sanityCheck;
}

- (BOOL)searchIdentityByName:(NSString *)certificateName
{
    OSStatus status = noErr;
    
    SecIdentityRef identityRef = [self getIdentityBySubjectNameCertificate:certificateName];
    
    if (identityRef == nil ) {
        return false;
    }
    
    status = SecIdentityCopyPrivateKey(identityRef, &_privateKey);
        
    if (status != noErr) {
        return false;
    }
    SecCertificateRef certificate;
    status = SecIdentityCopyCertificate(identityRef, &(certificate));
    
    if (status != noErr) {
        return false;
    }
    
    ///// ------------------------ Nuevo -----------------------------
    
    CFDataRef certificateData2 = SecCertificateCopyData(certificate);
    
    NSData *publicKey2 = (NSData *)certificateData2;
    
    NSString *certificateString2 = [Base64Utils encode:publicKey2];
    
    ///// ------------------------- Hasta aquí -------------------------
    
    self.base64UrlSafeCertificateData = certificateString2; //[Base64 encode:CFBridgingRelease(SecCertificateCopyData(certificate))];
    
    
    SecPolicyRef myPolicy   = SecPolicyCreateBasicX509();
    SecTrustRef myTrust;
    status     = SecTrustCreateWithCertificates(certificate, myPolicy, &myTrust);
    
    if (status != noErr) {
        return false;
    }
    
    SecTrustResultType trustResult;
    
    status = SecTrustEvaluate(myTrust, &trustResult);
    
    if (status != noErr) {
        return false;
    }
    _publicKey      = SecTrustCopyPublicKey(myTrust);
    
    CFDataRef certificateData = SecCertificateCopyData(certificate);
    assert(certificateData != NULL);
    _publicKeyBits = publicKey2; // (NSData *)certificateData;
    
    return true;
}

- (SecIdentityRef) getIdentityBySubjectNameCertificate:(NSString *)subjectNameCerrificate
{
    OSStatus status = noErr;
    CFArrayRef resultsArray;

    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:(id)kSecClassIdentity forKey:(id)kSecClass];
    [dict setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnRef];
    dict[(__bridge __strong id)(kSecMatchLimit)] = (__bridge id)(kSecMatchLimitAll);
    
#if TARGET_IPHONE_SIMULATOR
    // Ignore the access group if running on the iPhone simulator.
    //
    // Apps that are built for the simulator aren't signed, so there's no keychain access group
    // for the simulator to check. This means that all apps can see all keychain items when run
    // on the simulator.
    //
    // If a SecItem contains an access group attribute, SecItemAdd and SecItemUpdate on the
    // simulator will return -25243 (errSecNoAccessForItem).
#else
    [dict setObject:[CertificateUtils accessgroup] forKey:(id)kSecAttrAccessGroup];
#endif
    
    status = SecItemCopyMatching((CFDictionaryRef)dict, &resultsArray);
    
    if (dict) {
        CFRelease(dict);
    }
    
    if (status != noErr) {
        return nil;
    }
    
    CFIndex resultCount = CFArrayGetCount(resultsArray);
    if (resultCount == 0) {
        return nil;
    }
    
    SecIdentityRef identityRef = nil;
    for (CFIndex resultIndex = 0; resultIndex < resultCount; resultIndex++) {
        SecIdentityRef identityRefAux = (SecIdentityRef) CFArrayGetValueAtIndex(resultsArray, resultIndex);
        
        SecCertificateRef certificateRef;
        status = SecIdentityCopyCertificate(identityRefAux, &(certificateRef));
        
        if (status == noErr) {
            NSData *certificateData = (__bridge NSData *) SecCertificateCopyData(certificateRef);
            
            const unsigned char *certificateDataBytes = (const unsigned char *)[certificateData bytes];
            X509 *certificateX509 = d2i_X509(NULL, &certificateDataBytes, [certificateData length]);
            
            NSString *labelCertificate = [OpenSSLCertificateHelper getSubjectNameForCertificate: certificateX509];
            
            if ([labelCertificate isEqualToString: subjectNameCerrificate]) {
                identityRef = identityRefAux;
                break;
            }
        }
    }
    return identityRef;
}

- (NSData *)getHashBytesSHA1:(NSData *)plainText
{
    CC_SHA1_CTX ctx;
    uint8_t * hashBytes = NULL;
    NSData * hash = nil;
    
    // Malloc a buffer to hold hash.
    hashBytes = malloc( kChosenDigestLength * sizeof(uint8_t) );
    memset((void *)hashBytes, 0x0, kChosenDigestLength);
    
    // Initialize the context.
    CC_SHA1_Init(&ctx);
    
    // Perform the hash.
    CC_SHA1_Update (&ctx, (void *)[plainText bytes], (CC_LONG)[plainText length]);
    
    // Finalize the output.
    CC_SHA1_Final(hashBytes, &ctx);
    
    // Build up the SHA1 blob.
    hash = [NSData dataWithBytes:(const void *)hashBytes length:(NSUInteger)kChosenDigestLength];
    
    if (hashBytes) free(hashBytes);
    
    return hash;
}

- (NSData *)getHashBytesSHA512:(NSData *)plainText
{
    CC_SHA512_CTX ctx;
    uint8_t * hashBytes = NULL;
    NSData * hash = nil;
    
    // Malloc a buffer to hold hash.
    hashBytes = malloc( CC_SHA512_DIGEST_LENGTH * sizeof(uint8_t) );
    memset((void *)hashBytes, 0x0, CC_SHA512_DIGEST_LENGTH);
    
    // Initialize the context.
    CC_SHA512_Init(&ctx);
    
    // Perform the hash.
    CC_SHA512_Update (&ctx, (void *)[plainText bytes], (CC_LONG)[plainText length]);
    
    // Finalize the output.
    CC_SHA512_Final(hashBytes, &ctx);
    
    // Build up the SHA1 blob.
    hash = [NSData dataWithBytes:(const void *)hashBytes length:(NSUInteger)CC_SHA512_DIGEST_LENGTH];
    
    if (hashBytes) free(hashBytes);
    
    return hash;
}

- (NSData *)getHashBytesSHA256:(NSData *)plainText
{
    CC_SHA256_CTX ctx;
    uint8_t * hashBytes = NULL;
    NSData * hash = nil;
    
    // Malloc a buffer to hold hash.
    hashBytes = malloc( CC_SHA256_DIGEST_LENGTH * sizeof(uint8_t) );
    memset((void *)hashBytes, 0x0, CC_SHA256_DIGEST_LENGTH);
    
    // Initialize the context.
    CC_SHA256_Init(&ctx);
    
    // Perform the hash.
    CC_SHA256_Update (&ctx, (void *)[plainText bytes], (CC_LONG)[plainText length]);
    
    // Finalize the output.
    CC_SHA256_Final(hashBytes, &ctx);
    
    // Build up the SHA1 blob.
    hash = [NSData dataWithBytes:(const void *)hashBytes length:(NSUInteger)CC_SHA256_DIGEST_LENGTH];
    
    if (hashBytes) free(hashBytes);
    
    return hash;
}

- (NSData *)getHashBytesSHA384:(NSData *)plainText
{
    CC_SHA512_CTX ctx;
    uint8_t * hashBytes = NULL;
    NSData * hash = nil;
    
    // Malloc a buffer to hold hash.
    hashBytes = malloc( CC_SHA384_DIGEST_LENGTH * sizeof(uint8_t) );
    memset((void *)hashBytes, 0x0, CC_SHA384_DIGEST_LENGTH);
    
    // Initialize the context.
    CC_SHA384_Init(&ctx);
    
    // Perform the hash.
    CC_SHA384_Update (&ctx, (void *)[plainText bytes], (CC_LONG)[plainText length]);
    
    // Finalize the output.
    CC_SHA384_Final(hashBytes, &ctx);
    
    // Build up the SHA1 blob.
    hash = [NSData dataWithBytes:(const void *)hashBytes length:(NSUInteger)CC_SHA384_DIGEST_LENGTH];
    
    if (hashBytes) free(hashBytes);
    
    return hash;
}

- (NSData *)getSignatureBytesSHA1:(NSData *)plainText
{
    OSStatus sanityCheck = noErr;
    NSData * signedHash = nil;
    
    uint8_t * signedHashBytes = NULL;
    size_t signedHashBytesSize = 0;
    
    signedHashBytesSize = SecKeyGetBlockSize(_privateKey);
    
    // Malloc a buffer to hold signature.
    signedHashBytes = malloc( signedHashBytesSize * sizeof(uint8_t) );
    memset((void *)signedHashBytes, 0x0, signedHashBytesSize);
    
    const uint8_t *hashMessage=[[self getHashBytesSHA1:plainText] bytes];
    
    uint8_t * digestInfo = malloc((CC_SHA1_DIGEST_LENGTH + SHA1_DIGESTINFO_HEADER_LENGTH)* sizeof(uint8_t));
    
    memcpy(digestInfo, SHA1_DIGESTINFO_HEADER, SHA1_DIGESTINFO_HEADER_LENGTH);
    
    for (int i = SHA1_DIGESTINFO_HEADER_LENGTH; i < (CC_SHA1_DIGEST_LENGTH + SHA1_DIGESTINFO_HEADER_LENGTH); i++)
    {
        digestInfo[i] = (uint8_t) hashMessage[i-SHA1_DIGESTINFO_HEADER_LENGTH];
    }
    
    // Sign the SHA1 hash.
    sanityCheck = SecKeyRawSign(_privateKey,
                                kSecPaddingPKCS1,
                                digestInfo,
                                CC_SHA1_DIGEST_LENGTH + SHA1_DIGESTINFO_HEADER_LENGTH,
                                (uint8_t *)signedHashBytes,
                                &signedHashBytesSize
                                );
    
    
    // Build up signed SHA1 blob.
    signedHash = [NSData dataWithBytes:(const void *)signedHashBytes length:(NSUInteger)signedHashBytesSize];
    
    if (signedHashBytes){
        free(signedHashBytes);
    }
    if (digestInfo){
        free(digestInfo);
    }
    
    return signedHash;
}


- (NSData *)getSignatureBytesSHA256:(NSData *)plainText
{
    OSStatus sanityCheck = noErr;
    NSData * signedHash = nil;
    
    uint8_t * signedHashBytes = NULL;
    size_t signedHashBytesSize = 0;
    
    signedHashBytesSize = SecKeyGetBlockSize(_privateKey);
    
    // Malloc a buffer to hold signature.
    signedHashBytes = malloc( signedHashBytesSize * sizeof(uint8_t) );
    memset((void *)signedHashBytes, 0x0, signedHashBytesSize);
    
    const uint8_t *hashMessage=[[self getHashBytesSHA256:plainText] bytes];
    
    uint8_t * digestInfo = malloc((CC_SHA256_DIGEST_LENGTH + SHA256_DIGESTINFO_HEADER_LENGTH)* sizeof(uint8_t));
    memcpy(digestInfo, SHA256_DIGESTINFO_HEADER, SHA256_DIGESTINFO_HEADER_LENGTH);
    
    for (int i=SHA256_DIGESTINFO_HEADER_LENGTH; i<(CC_SHA256_DIGEST_LENGTH + SHA256_DIGESTINFO_HEADER_LENGTH); i++)
    {
        digestInfo[i] = (uint8_t) hashMessage[i-SHA256_DIGESTINFO_HEADER_LENGTH];
    }
    
    // Sign the SHA1 hash.
    sanityCheck = SecKeyRawSign(_privateKey,
                                kSecPaddingPKCS1,
                                digestInfo,
                                CC_SHA256_DIGEST_LENGTH + SHA256_DIGESTINFO_HEADER_LENGTH,
                                (uint8_t *)signedHashBytes,
                                &signedHashBytesSize
                                );
    
    
    // Build up signed SHA256 blob.
    signedHash = [NSData dataWithBytes:(const void *)signedHashBytes length:(NSUInteger)signedHashBytesSize];
    
    if (signedHashBytes) free(signedHashBytes);
    if (digestInfo) free(digestInfo);
    
    return signedHash;
}


- (NSData *)getSignatureBytesSHA384:(NSData *)plainText
{
    OSStatus sanityCheck = noErr;
    NSData * signedHash = nil;
    
    uint8_t * signedHashBytes = NULL;
    size_t signedHashBytesSize = 0;
    
    signedHashBytesSize = SecKeyGetBlockSize(_privateKey);
    
    // Malloc a buffer to hold signature.
    signedHashBytes = malloc( signedHashBytesSize * sizeof(uint8_t) );
    memset((void *)signedHashBytes, 0x0, signedHashBytesSize);
    
    const uint8_t *hashMessage=[[self getHashBytesSHA384:plainText] bytes];
    
    uint8_t * digestInfo = malloc((CC_SHA384_DIGEST_LENGTH + SHA384_DIGESTINFO_HEADER_LENGTH)* sizeof(uint8_t));
    memcpy(digestInfo, SHA384_DIGESTINFO_HEADER, SHA384_DIGESTINFO_HEADER_LENGTH);
    
    for (int i=SHA384_DIGESTINFO_HEADER_LENGTH; i<(CC_SHA384_DIGEST_LENGTH + SHA384_DIGESTINFO_HEADER_LENGTH); i++)
    {
        digestInfo[i] = (uint8_t) hashMessage[i-SHA384_DIGESTINFO_HEADER_LENGTH];
    }
    
    // Sign the SHA1 hash.
    sanityCheck = SecKeyRawSign(_privateKey,
                                kSecPaddingPKCS1,
                                digestInfo,
                                CC_SHA384_DIGEST_LENGTH + SHA384_DIGESTINFO_HEADER_LENGTH,
                                (uint8_t *)signedHashBytes,
                                &signedHashBytesSize
                                );
    
    
    // Build up signed SHA256 blob.
    signedHash = [NSData dataWithBytes:(const void *)signedHashBytes length:(NSUInteger)signedHashBytesSize];
    
    if (signedHashBytes) free(signedHashBytes);
    if (digestInfo) free(digestInfo);
    
    return signedHash;
    
}



- (NSData *)getSignatureBytesSHA512:(NSData *)plainText
{
    OSStatus sanityCheck = noErr;
    NSData * signedHash = nil;
    
    uint8_t * signedHashBytes = NULL;
    size_t signedHashBytesSize = 0;
    
    signedHashBytesSize = SecKeyGetBlockSize(_privateKey);
    
    // Malloc a buffer to hold signature.
    signedHashBytes = malloc( signedHashBytesSize * sizeof(uint8_t) );
    memset((void *)signedHashBytes, 0x0, signedHashBytesSize);
    
    const uint8_t *hashMessage=[[self getHashBytesSHA512:plainText] bytes];
    // Concatenamos SHA512
    //SHA512_DIGESTINFO_HEADER+hashMessage
    
    uint8_t * digestInfo = malloc((CC_SHA512_DIGEST_LENGTH + SHA512_DIGESTINFO_HEADER_LENGTH)* sizeof(uint8_t));
    
    memcpy(digestInfo, SHA512_DIGESTINFO_HEADER, SHA512_DIGESTINFO_HEADER_LENGTH);
    
    for (int i=SHA512_DIGESTINFO_HEADER_LENGTH; i<(CC_SHA512_DIGEST_LENGTH + SHA512_DIGESTINFO_HEADER_LENGTH); i++)
    {
        digestInfo[i] = (uint8_t) hashMessage[i-SHA512_DIGESTINFO_HEADER_LENGTH];
    }
    
    // Sign the SHA1 hash.
    sanityCheck = SecKeyRawSign(_privateKey,
                                kSecPaddingPKCS1,
                                digestInfo,
                                CC_SHA512_DIGEST_LENGTH + SHA512_DIGESTINFO_HEADER_LENGTH,
                                (uint8_t *)signedHashBytes,
                                &signedHashBytesSize
                                );
    
    // Build up signed SHA1 blob.
    signedHash = [NSData dataWithBytes:(const void *)signedHashBytes length:(NSUInteger)signedHashBytesSize];
    
    if (signedHashBytes) free(signedHashBytes);
    if (digestInfo) free(digestInfo);
    
    return signedHash;
}

- (BOOL) isCertificateECDSA:(SecKeyRef)privateKey {
    return [self isCertificateKeyType:privateKey keyType:kSecAttrKeyTypeECSECPrimeRandom];
}

- (BOOL) isCertificateRSA:(SecKeyRef)privateKey {
    return [self isCertificateKeyType:privateKey keyType:kSecAttrKeyTypeRSA];
}

- (BOOL) isCertificateKeyType:(SecKeyRef)privateKey keyType:(CFStringRef) keSecAttrKeyType{
    
    CFDictionaryRef attributes = SecKeyCopyAttributes(privateKey);
    if (!attributes) {
       return nil;
    }
    
    NSString *keyType = ( NSString *)CFDictionaryGetValue(attributes, kSecAttrKeyType);
    CFRelease(attributes);
    
    if (!keyType) {
       NSLog(@"No se pudo determinar el tipo de clave.");
       return nil;
    }

    
    if ([keyType isEqualToString:(__bridge NSString *)keSecAttrKeyType]) {
        return YES;
    }
    
    return NO;
}

- (SecKeyAlgorithm)getAlgorithmByCertificate:(SecKeyRef)privateKey alg:(NSString *)alg{
    if ([self isCertificateRSA:privateKey]) {
        // Es Certificado RSA
	   if ([[alg uppercaseString] containsString:@"SHA1"] ) {
		  return kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA1;
	   }
	   else if ([[alg uppercaseString] containsString:@"SHA256"]){
		  return kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA256;
	   }
	   else if ([[alg uppercaseString] containsString:@"SHA384"]){
		  return kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA384;
	   }
	   else if ([[alg uppercaseString] containsString:@"SHA512"]){
		  return kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA512;
	   }
	   else{
		  return NULL;
	   }
    } else if ([self isCertificateECDSA:privateKey]){
        // Es certificado ECDSA
	   if ([[alg uppercaseString] containsString:@"SHA1"] ) {
		  return kSecKeyAlgorithmECDSASignatureMessageX962SHA1;
	   }
	   else if ([[alg uppercaseString] containsString:@"SHA256"]){
		  return kSecKeyAlgorithmECDSASignatureMessageX962SHA256;
	   }
	   else if ([[alg uppercaseString] containsString:@"SHA384"]){
		  return kSecKeyAlgorithmECDSASignatureMessageX962SHA384;
	   }
	   else if ([[alg uppercaseString] containsString:@"SHA512"]){
		  return kSecKeyAlgorithmECDSASignatureMessageX962SHA512;
	   }
	   else{
		  return NULL;
	   }
    }
    return  NULL;
}

- (void)dealloc {
    _certificateRef = nil;
    _publicKey = nil;
    _privateKey = nil;
    _myIdentity = nil;
    _summaryString = nil;
    _publicKeyBits = nil;
    _selectedCertificateName = nil;
    
    [super dealloc];
}

@end
