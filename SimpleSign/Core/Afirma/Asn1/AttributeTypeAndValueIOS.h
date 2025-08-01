/*
 * Generated by asn1c-0.9.22 (http://lionet.info/asn1c)
 * From ASN.1 module "SIGNEDDATA"
 * 	found in "SIGNEDDATA.asn1"
 * 	`asn1c -S/skeletons`
 */

#ifndef	_AttributeTypeAndValueIOS_H_
#define	_AttributeTypeAndValueIOS_H_


#include "asn_application.h"

/* Including external dependencies */
#include "AttributeType.h"
#include "AttributeValue.h"
#include "constr_SEQUENCE.h"

#ifdef __cplusplus
extern "C" {
#endif

/* AttributeTypeAndValue */
typedef struct AttributeTypeAndValue {
	AttributeType_t	 type;
	AttributeValue_t	 value;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} AttributeTypeAndValue_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_AttributeTypeAndValue;

#ifdef __cplusplus
}
#endif

#endif	/* _AttributeTypeAndValue_H_ */
