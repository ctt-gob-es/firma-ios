//
//  CADESConstants.h
//  Firma_iOS
//
//

#import <Foundation/Foundation.h>

@interface CADESConstants : NSObject

FOUNDATION_EXPORT NSString *const URL_STORE;
FOUNDATION_EXPORT NSString *const PASS_STORE;
FOUNDATION_EXPORT NSString *const URL_SIGN;
FOUNDATION_EXPORT NSString *const PASS_SIGN;

FOUNDATION_EXPORT NSString *const URL_SERVER;

FOUNDATION_EXPORT NSString *const OPERATION_SIGN;
FOUNDATION_EXPORT NSString *const OPERATION_SELECT_CERTIFICATE;
FOUNDATION_EXPORT NSString *const OPERATION_COSIGN;
FOUNDATION_EXPORT NSString *const OPERATION_COUNTERSIGN;
FOUNDATION_EXPORT NSString *const OPERATION_PRESIGN;
FOUNDATION_EXPORT NSString *const OPERATION_POSTSIGN;
FOUNDATION_EXPORT NSString *const OPERATION_PUT;
FOUNDATION_EXPORT NSString *const OPERATION_GET;
FOUNDATION_EXPORT NSString *const OPERATION_BATCH;
FOUNDATION_EXPORT NSString *const OPERATION_SAVE;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_OPERATION;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_COPERATION;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_METRO;

FOUNDATION_EXPORT NSString *const HTTP_CGI;
FOUNDATION_EXPORT NSString *const HTTP_EQUALS;
FOUNDATION_EXPORT NSString *const HTTP_AND;

FOUNDATION_EXPORT NSString *const PARAMETER_NAME_DOCID;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_ALGORITHM;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_FORMAT;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_CERT;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_EXTRA_PARAM;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_VERSION;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_VERSION_1_0;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_ID;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_CIPHER_KEY;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_DAT;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_STSERVLET;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_RTSERVLET;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_ALGORITHM2;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_PROPERTIES;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_TRIPHASIC_SERVER_URL;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_FILE_ID;

FOUNDATION_EXPORT NSString *const PARAMETER_NAME_BATCH_PRESIGNER_URL;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_BATCH_POSTSIGNER_URL;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_BATCH_JSON;

FOUNDATION_EXPORT NSString *const PROPERTIES_PARAMETER_INCLUDEONLYSIGNINGCERTIFICATE;
FOUNDATION_EXPORT NSString *const PROPERTIES_PARAMETER_MODE;
FOUNDATION_EXPORT NSString *const PROPERTIES_PARAMETER_MODE_IMPLICIT;
FOUNDATION_EXPORT NSString *const PROPERTIES_PARAMETER_MODE_EXPLICIT;
FOUNDATION_EXPORT NSString *const PROPERTIES_PARAMETER_POLICYIDENTIFIER;
FOUNDATION_EXPORT NSString *const PROPERTIES_PARAMETER_POLICYIDENTIFIERHASH;
FOUNDATION_EXPORT NSString *const PROPERTIES_PARAMETER_POLICYIDENTIFIERHASHALGORITHM;
FOUNDATION_EXPORT NSString *const PROPERTIES_PARAMETER_POLICYQUALIFIER;
FOUNDATION_EXPORT NSString *const PROPERTIES_PARAMETER_PRECALCULATEDHASHALGORITHM;
FOUNDATION_EXPORT NSString *const PROPERTIES_PARAMETER_SIGNINGCERTIFICATEV2;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_TARGET;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_TARGET_TREE;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_TARGET_LEAFS;
FOUNDATION_EXPORT NSString *const PARAMETER_LOCAL_SIGNATURE;
FOUNDATION_EXPORT NSString *const PARAMETER_LOCAL_CLOUD_NAME;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_FILENAME;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_EXTENSION;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_RETURN_URL;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_VISIBLE_SIGNATURE;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_APP_NAME;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_STICKY;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_RESET_STICKY;

FOUNDATION_EXPORT NSString *const CADES_FORMAT;
FOUNDATION_EXPORT NSString *const CADES_TRI_FORMAT;
FOUNDATION_EXPORT NSString *const PADES_TRI_FORMAT;
FOUNDATION_EXPORT NSString *const ADOBE_PDF_FORMAT;
FOUNDATION_EXPORT NSString *const XADES_TRI_FORMAT;
FOUNDATION_EXPORT NSString *const PADES_FORMAT;
FOUNDATION_EXPORT NSString *const XADES_FORMAT;
FOUNDATION_EXPORT NSString *const NONE_FORMAT;
FOUNDATION_EXPORT NSString *const NONE_TRI_FORMAT;
FOUNDATION_EXPORT NSString *const FACTURAE_FORMAT;
FOUNDATION_EXPORT NSString *const FACTURAE_TRI_FORMAT;


FOUNDATION_EXPORT NSString *const PROPERTY_NAME_PRESIGN;
FOUNDATION_EXPORT NSString *const PARAMETER_NAME_PKCS1_SIGN;


/* ERRORES */
FOUNDATION_EXPORT NSString *const ERROR_SIGNING;
FOUNDATION_EXPORT NSString *const ERROR_MISSING_DATA_ID;
FOUNDATION_EXPORT NSString *const ERROR_NOT_SUPPORTED_FORMAT;
FOUNDATION_EXPORT NSString *const ERROR_MISSING_DATA;
FOUNDATION_EXPORT NSString *const ERROR_MISSING_OPERATION_NAME;
FOUNDATION_EXPORT NSString *const ERROR_UNSUPPORTED_OPERATION_NAME;
FOUNDATION_EXPORT NSString *const ERROR_NOT_SUPPORTED_ALGORITHM;
FOUNDATION_EXPORT NSString *const ERROR_NOT_CERTIFICATE;
FOUNDATION_EXPORT NSString *const ERROR_NOT_TARGET;

FOUNDATION_EXPORT NSString *const ERROR_SEPARATOR;

FOUNDATION_EXPORT NSString *const DESC_ERROR_SIGNING;
FOUNDATION_EXPORT NSString *const DESC_ERROR_MISSING_DATA_ID;
FOUNDATION_EXPORT NSString *const DESC_ERROR_MISSING_DATA_SERVER_TRIPHASE;
FOUNDATION_EXPORT NSString *const DESC_ERROR_NOT_SUPPORTED_FORMAT;
FOUNDATION_EXPORT NSString *const DESC_ERROR_MISSING_DATA;
FOUNDATION_EXPORT NSString *const DESC_ERROR_MISSING_OPERATION_NAME;
FOUNDATION_EXPORT NSString *const DESC_ERROR_UNSUPPORTED_OPERATION_NAME;
FOUNDATION_EXPORT NSString *const DESC_ERROR_NOT_SUPPORTED_ALGORITHM;
FOUNDATION_EXPORT NSString *const DESC_ERROR_NOT_CERTIFICATE;
FOUNDATION_EXPORT NSString *const DESC_ERROR_NOT_TARGET;

FOUNDATION_EXPORT NSString *const PROPERTY_NAME_PRESIGN_PREFIX;
FOUNDATION_EXPORT NSString *const PROPERTY_NAME_SIGN_COUNT;
FOUNDATION_EXPORT NSString *const PROPERTY_NAME_SESSION_DATA_PREFIX;
FOUNDATION_EXPORT NSString *const PROPERTY_NAME_PKCS1_SIGN_PREFIX;
FOUNDATION_EXPORT NSString *const PROPERTY_NAME_NEED_DATA;
FOUNDATION_EXPORT NSString *const PROPERTY_NAME_NEED_PRE;

@end
