/*
 * Generated by asn1c-0.9.22 (http://lionet.info/asn1c)
 * From ASN.1 module "SIGNEDDATA"
 * 	found in "SIGNEDDATA.asn1"
 * 	`asn1c -S/skeletons`
 */

#ifndef	_ContentHints_H_
#define	_ContentHints_H_


#include "asn_application.h"

/* Including external dependencies */
#include "UTF8String.h"
#include "ContentType.h"
#include "constr_SEQUENCE.h"

#ifdef __cplusplus
extern "C" {
#endif

/* ContentHints */
typedef struct ContentHints {
	UTF8String_t	*contentDescription	/* OPTIONAL */;
	ContentType_t	 contentType;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} ContentHints_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_ContentHints;

#ifdef __cplusplus
}
#endif

#endif	/* _ContentHints_H_ */
