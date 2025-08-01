/*
 * Generated by asn1c-0.9.22 (http://lionet.info/asn1c)
 * From ASN.1 module "SIGNEDDATA"
 * 	found in "SIGNEDDATA.asn1"
 * 	`asn1c -S/skeletons`
 */

#ifndef	_SignerInfos_H_
#define	_SignerInfos_H_


#include "asn_application.h"

/* Including external dependencies */
#include "asn_SET_OF.h"
#include "constr_SET_OF.h"

#ifdef __cplusplus
extern "C" {
#endif

/* Forward declarations */
struct SignerInfo;

/* SignerInfos */
typedef struct SignerInfos {
	A_SET_OF(struct SignerInfo) list;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} SignerInfos_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_SignerInfos;

#ifdef __cplusplus
}
#endif

/* Referred external types */
#include "SignerInfoIOS.h"

#endif	/* _SignerInfos_H_ */
