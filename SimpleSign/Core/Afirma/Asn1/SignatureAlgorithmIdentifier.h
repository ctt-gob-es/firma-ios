/*
 * Generated by asn1c-0.9.22 (http://lionet.info/asn1c)
 * From ASN.1 module "SIGNEDDATA"
 * 	found in "SIGNEDDATA.asn1"
 * 	`asn1c -S/skeletons`
 */

#ifndef	_SignatureAlgorithmIdentifier_H_
#define	_SignatureAlgorithmIdentifier_H_


#include "asn_application.h"

/* Including external dependencies */
#include "AlgorithmIdentifierIOS.h"

#ifdef __cplusplus
extern "C" {
#endif

/* SignatureAlgorithmIdentifier */
typedef AlgorithmIdentifier_t	 SignatureAlgorithmIdentifier_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_SignatureAlgorithmIdentifier;
asn_struct_free_f SignatureAlgorithmIdentifier_free;
asn_struct_print_f SignatureAlgorithmIdentifier_print;
asn_constr_check_f SignatureAlgorithmIdentifier_constraint;
ber_type_decoder_f SignatureAlgorithmIdentifier_decode_ber;
der_type_encoder_f SignatureAlgorithmIdentifier_encode_der;
xer_type_decoder_f SignatureAlgorithmIdentifier_decode_xer;
xer_type_encoder_f SignatureAlgorithmIdentifier_encode_xer;

#ifdef __cplusplus
}
#endif

#endif	/* _SignatureAlgorithmIdentifier_H_ */
