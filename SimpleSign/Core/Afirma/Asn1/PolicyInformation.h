/*
 * Generated by asn1c-0.9.22 (http://lionet.info/asn1c)
 * From ASN.1 module "SIGNEDDATA"
 * 	found in "SIGNEDDATA.asn1"
 * 	`asn1c -S/skeletons`
 */

#ifndef	_PolicyInformation_H_
#define	_PolicyInformation_H_


#include "asn_application.h"

/* Including external dependencies */
#include "CertPolicyId.h"
#include "asn_SEQUENCE_OF.h"
#include "constr_SEQUENCE_OF.h"
#include "constr_SEQUENCE.h"

#ifdef __cplusplus
extern "C" {
#endif

/* Forward declarations */
struct PolicyQualifierInfo;

/* PolicyInformation */
typedef struct PolicyInformation {
	CertPolicyId_t	 policyIdentifier;
	struct policyQualifiers {
		A_SEQUENCE_OF(struct PolicyQualifierInfo) list;
		
		/* Context for parsing across buffer boundaries */
		asn_struct_ctx_t _asn_ctx;
	} *policyQualifiers;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} PolicyInformation_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_PolicyInformation;

#ifdef __cplusplus
}
#endif

/* Referred external types */
#include "PolicyQualifierInfo.h"

#endif	/* _PolicyInformation_H_ */
