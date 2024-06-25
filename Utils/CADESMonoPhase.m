//
//  CADESMonoPhase.m
//  Firma_iOS
//
//

#import "CADESMonoPhase.h"
#include <openssl/x509.h>
#include "CADESOID.h"
#include "EncapsulatedSignedData.h"
#include "CADESSigner.h"
#include "CADESSignUtils.h"
#include "CertificateUtils.h"
#include "CADESConstants.h"
#include "Base64.h"
#include "CADESSignedAttributes.h"

@implementation CADESMonoPhase

+(NSData*) getCadesMonoPhase:(NSString*) base64UrlSafeCertificateData
                        mode:(NSString*)mode
                 contentData:(NSData*)contentData
                  privateKey:(SecKeyRef*)privateKeyPkcs12
               signAlgoInUse:(NSString *) signAlgoInUse
          contentDescription:(NSString*)contentDescription
                   policyOID:(NSString*)policyOID
                  policyHash:(NSString*)policyHash
               policiHashAlg:(char*)policyHashAlg
                   policyUri:(NSString*)policyUri
               signAlgorithm:(char*)signAlgorithm
        signingCertificateV2:(int)signingCertificateV2
  precalculatedHashAlgorithm:(char*)precalculatedHashAlgorithm
           precalculatedHash:(NSData*)precalculatedHash {
    
    NSData *sCertificate = [Base64 decode:base64UrlSafeCertificateData urlSafe:true];
    
    const unsigned char *certificateDataBytes = (const unsigned char *)[sCertificate bytes];
    X509 *certificateX509 = d2i_X509(NULL, &certificateDataBytes, [sCertificate length]);
    
    
    /****************************************************/
    /****     PREPARAMOS LOS DATOS PARA LA FIRMA     ****/
    /****************************************************/
    
    /***** ALGORITMO DE HASHING *******/
    char *hashAlgorithm = NULL;
    if(precalculatedHashAlgorithm != NULL){
         hashAlgorithm = precalculatedHashAlgorithm;    
    }
    else{
         hashAlgorithm = [CADESSignUtils getAlgorithmOID:signAlgoInUse];
    }
    
    /*** EL SIGNING TIME LO CALCULAMOS FUERA. ESTO ES PORQUE AL GENERAR PRIMERO LOS ATRIBUTOS DEL FIRMANTE  PARA FIRMARLOS Y LUEGO VOLVER A GENERARLOS PARA CREAR LA ESTRUCTURA CADES, LAS FECHAS NO COINCIDIRÍAN. ***/
    
    struct tm *local;
    time_t t;
    t = time(NULL);
    local = gmtime(&t);
    
    /**** CALCULAMOS EL HASH DE LOS DATOS ******/
    NSData *dataHash = NULL;
    if(precalculatedHashAlgorithm!=NULL){
        dataHash = precalculatedHash;
    }
    else{
        dataHash =[CADESSignUtils hashData:signAlgoInUse
                                      data:contentData];
    }
    
    /**** CALCULAMOS EL HASH DEL CERTIFICADO ******/
    NSData *certHash = [CADESSignUtils hashData:signAlgoInUse
                                           data:sCertificate ];
    
    /**** CALCULAMOS LOS ATRIBUTOS FIRMADOS *****/
    SignedAttributes_t *CADESSignedAttributes;
    getCADESSignedAttributes(&CADESSignedAttributes,
                             certificateX509,
                             (char*)[dataHash bytes],
                             (int)[dataHash length],
                             (char*)[contentDescription UTF8String],
                             (char*)[policyOID UTF8String],
                             (char*)[policyHash UTF8String],
                             policyHashAlg,
                             (char*)[policyUri UTF8String],
                             (char*)[certHash bytes],
                             (int)[certHash length],
                             hashAlgorithm,
                             signingCertificateV2,
                             local);
    
    
    /**** CODIFICAMOS LOS ATRIBUTOS FIRMADOS EN UN ARRAY DE BYTES ***/
    /**** ESTA SERIA LA MEJOR FORMA. ASI NOS EVITARIAMOS DE CREAR EL
     FICHERO TEMPORAL A PRIORI. LO SUYO SERÍA SABER EL TAMAÑO DE LOS ATRIBUTOS FIRMADOS PARA PODER UTILIZAR EL METODO "der_encode_to_buffer()" PARA OBTENER LOS ATRIBUTOS CODIFICADOS Y PODER FIRMARLOS.
     COMO NO PODEMOS OBENER DICHO TAMAÑO, CREAMOS UN FICHERO TEMPORAL CON LOS DATOS CODIFICADOSY LO VOLVEMOS A LEER. */
    /*
     char buff[sizeof(*CADESSignedAttributes)];
     NSData *proba = [[NSData alloc] init];
     der_encode_to_buffer(&asn_DEF_SignedAttributes,
     CADESSignedAttributes,
     [proba bytes],
     320);
     */
    //xer_fprint(stdout, &asn_DEF_SignedAttributes, CADESSignedAttributes);
    
    /* CREAMOS EL FICHERO TEMPORAL DONDE SE ALOJARAN LOS DATOS DEL FIRMANTE CODIFICADOS. */
    /* Miramos cuál es la ruta temporal*/
    NSURL *documentDir = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] objectAtIndex:0];
    NSURL *tmpDir = [[documentDir URLByDeletingLastPathComponent] URLByAppendingPathComponent:@"tmp" isDirectory:YES];
    
    NSString *directory = [tmpDir path];
    directory= [directory stringByAppendingString:@"/firmantes.csig"];
    char *nombre2 = (char*)[directory UTF8String];
    /* Codificamos los atributos firmados y los guardamos en un fichero */
    FILE *fichero2;
    fichero2 = fopen( nombre2, "wb" );
    der_encode(&asn_DEF_SignedAttributes, CADESSignedAttributes, write_out, fichero2);
    fclose(fichero2);
    /* leemos el fichero con los atributos firmados */
    NSData *signAttrib = [[NSFileManager defaultManager] contentsAtPath:directory];
    
    /*** FIRMAMOS LOS ATRIBUTOS FIRMADOS ****/
    CADESSignUtils *signUtils = [[CADESSignUtils alloc] init];
    NSData *dataSigned = [signUtils signDataWithPrivateKey:privateKeyPkcs12 data:signAttrib algorithm:signAlgoInUse];
    
    /****************************************************/
    /**** METEMOS EL SIGNED DATA EN UN CONTENT TYPE *****/
    /****************************************************/
    
    EncapsulatedSignedData_t *encapsulatedSignedData;
    encapsulatedSignedData = calloc(1, sizeof(*encapsulatedSignedData));
    
    ContentType_t *eContentSignedData;
    eContentSignedData = calloc(1,sizeof(*eContentSignedData));
    *eContentSignedData = makeOID(SIGNED_DATA_OID);
    encapsulatedSignedData->oid = *eContentSignedData;
    
    //creamos el objeto signedData
    SignedData_t *signedData;
    signedData = calloc(1, sizeof(*signedData));
    
    NSString *contentDataString = NULL;
    if([mode isEqualToString:PROPERTIES_PARAMETER_MODE_IMPLICIT])
    {
        contentDataString = [[NSString alloc] initWithData:contentData encoding:NSUTF8StringEncoding];
    }
    /*** GENERAMOS LA ESTRUCTURA CADES ****/
    getSignedDataStructure(&signedData,
                           certificateX509,
                           (char*)[contentDataString UTF8String],
                           [sCertificate bytes],
                           (int)[sCertificate length],
                           (char*)[dataSigned bytes],
                           (int)[dataSigned length],
                           (char*)[dataHash bytes],
                           (int)[dataHash length],
                           (char*)[contentDescription UTF8String],
                           (char*)[policyOID UTF8String],
                           (char*)[policyHash UTF8String],
                           policyHashAlg,
                           (char*)[policyUri UTF8String],
                           (char*)[certHash bytes],
                           (int)[certHash length],
                           hashAlgorithm,
                           signingCertificateV2,
                           signAlgorithm,
                           local);
    
    encapsulatedSignedData->content = signedData;
    
    NSString *directorySign = [tmpDir path];
    directorySign= [directorySign stringByAppendingString:@"/sign.csig"];
    char *rutaSign = (char*)[directorySign UTF8String];
    
    /* Codificamos la firma y los guardamos en un fichero */
    FILE *ficheroSign;
    ficheroSign = fopen( rutaSign, "wb" );
    der_encode(&asn_DEF_EncapsulatedSignedData, encapsulatedSignedData, write_out, ficheroSign);
    fclose(ficheroSign);
    
    /* leemos el fichero con la firma */
    NSData *sign = [[NSFileManager defaultManager] contentsAtPath: directorySign];
    
    /* devolvemos la firma */
    return sign;  
       
}

static int write_out(const void *buffer, size_t size, void *app_key){
    FILE *out_fp = app_key;
    size_t wrote;
    wrote = fwrite(buffer, 1, size, out_fp);
    
    return (wrote == size) ? 0 : -1;
}

@end
