/*
 * Generated by asn1c-0.9.22 (http://lionet.info/asn1c)
 * From ASN.1 module "SIGNEDDATA"
 * 	found in "SIGNEDDATA.asn1"
 * 	`asn1c -S/skeletons`
 */

#ifndef	_SignedDataIOS_H_
#define	_SignedDataIOS_H_


#include "asn_application.h"

/* Including external dependencies */
#include "CMSVersion.h"
#include "DigestAlgorithmIdentifiers.h"
#include "EncapsulatedContentInfo.h"
#include "CertificateSet.h"
#include "RevocationInfoChoices.h"
#include "SignerInfos.h"
#include "constr_SEQUENCE.h"

#ifdef __cplusplus
extern "C" {
#endif

/* SignedData */
typedef struct SignedData {
	CMSVersion_t	 version;
	DigestAlgorithmIdentifiers_t	 digestAlgorithms;
	EncapsulatedContentInfo_t	 encapContentInfo;
	CertificateSet_t	*certificates	/* OPTIONAL */;
	RevocationInfoChoices_t	*crls	/* OPTIONAL */;
	SignerInfos_t	 signerInfos;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} SignedData_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_SignedData;

#ifdef __cplusplus
}
#endif

#endif	/* _SignedData_H_ */
