/*
 * Generated by asn1c-0.9.22 (http://lionet.info/asn1c)
 * From ASN.1 module "SIGNEDDATA"
 * 	found in "SIGNEDDATA.asn1"
 * 	`asn1c -S/skeletons`
 */

#include "asn_internal.h"

#include "AttributeTypeAndValue.h"

static asn_TYPE_member_t asn_MBR_AttributeTypeAndValue_1[] = {
	{ ATF_NOFLAGS, 0, offsetof(struct AttributeTypeAndValue, type),
		(ASN_TAG_CLASS_UNIVERSAL | (6 << 2)),
		0,
		&asn_DEF_AttributeType,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"type"
		},
	{ ATF_OPEN_TYPE | ATF_NOFLAGS, 0, offsetof(struct AttributeTypeAndValue, value),
		-1 /* Ambiguous tag (ANY?) */,
		0,
		&asn_DEF_AttributeValue,
		0,	/* Defer constraints checking to the member type */
		0,	/* PER is not compiled, use -gen-PER */
		0,
		"value"
		},
};
static ber_tlv_tag_t asn_DEF_AttributeTypeAndValue_tags_1[] = {
	(ASN_TAG_CLASS_UNIVERSAL | (16 << 2))
};
static asn_TYPE_tag2member_t asn_MAP_AttributeTypeAndValue_tag2el_1[] = {
    { (ASN_TAG_CLASS_UNIVERSAL | (6 << 2)), 0, 0, 0 } /* type at 59 */
};
static asn_SEQUENCE_specifics_t asn_SPC_AttributeTypeAndValue_specs_1 = {
	sizeof(struct AttributeTypeAndValue),
	offsetof(struct AttributeTypeAndValue, _asn_ctx),
	asn_MAP_AttributeTypeAndValue_tag2el_1,
	1,	/* Count of tags in the map */
	0, 0, 0,	/* Optional elements (not needed) */
	-1,	/* Start extensions */
	-1	/* Stop extensions */
};
asn_TYPE_descriptor_t asn_DEF_AttributeTypeAndValue = {
	"AttributeTypeAndValue",
	"AttributeTypeAndValue",
	SEQUENCE_free,
	SEQUENCE_print,
	SEQUENCE_constraint,
	SEQUENCE_decode_ber,
	SEQUENCE_encode_der,
	SEQUENCE_decode_xer,
	SEQUENCE_encode_xer,
	0, 0,	/* No PER support, use "-gen-PER" to enable */
	0,	/* Use generic outmost tag fetcher */
	asn_DEF_AttributeTypeAndValue_tags_1,
	sizeof(asn_DEF_AttributeTypeAndValue_tags_1)
		/sizeof(asn_DEF_AttributeTypeAndValue_tags_1[0]), /* 1 */
	asn_DEF_AttributeTypeAndValue_tags_1,	/* Same as above */
	sizeof(asn_DEF_AttributeTypeAndValue_tags_1)
		/sizeof(asn_DEF_AttributeTypeAndValue_tags_1[0]), /* 1 */
	0,	/* No PER visible constraints */
	asn_MBR_AttributeTypeAndValue_1,
	2,	/* Elements count */
	&asn_SPC_AttributeTypeAndValue_specs_1	/* Additional specs */
};

