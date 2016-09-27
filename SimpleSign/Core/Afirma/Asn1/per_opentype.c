/*
 * Copyright (c) 2007 Lev Walkin <vlm@lionet.info>. All rights reserved.
 * Redistribution and modifications are permitted subject to BSD license.
 */
#include "asn_internal.h"
#include "per_support.h"
#include "constr_TYPE.h"
#include "per_opentype.h"

typedef struct uper_ugot_key {
	asn_per_data_t oldpd;	/* Old per data source */
	size_t unclaimed;
	size_t ot_moved;	/* Number of bits moved by OT processing */
	int repeat;
} uper_ugot_key;

static int uper_ugot_refill(asn_per_data_t *pd);
static int per_skip_bits(asn_per_data_t *pd, int skip_nbits);
static asn_dec_rval_t uper_sot_suck(asn_codec_ctx_t *, asn_TYPE_descriptor_t *td, asn_per_constraints_t *constraints, void **sptr, asn_per_data_t *pd);

int asn_debug_indent;

/*
 * Encode an "open type field".
 * #10.1, #10.2
 */
int
uper_open_type_put(asn_TYPE_descriptor_t *td, asn_per_constraints_t *constraints, void *sptr, asn_per_outp_t *po) {
	void *buf;
	void *bptr;
	ssize_t size;
	size_t toGo;

	size = uper_encode_to_new_buffer(td, constraints, sptr, &buf);
	if(size <= 0) return -1;

	for(bptr = buf, toGo = size; toGo;) {
		ssize_t maySave = uper_put_length(po, toGo);
		if(maySave < 0) break;
		if(per_put_many_bits(po, bptr, maySave * 8)) break;
		bptr = (char *)bptr + maySave;
		toGo -= maySave;
	}

	FREEMEM(buf);
	if(toGo) return -1;

	return 0;
}

static asn_dec_rval_t
uper_open_type_get_simple(asn_codec_ctx_t *ctx, asn_TYPE_descriptor_t *td,
	asn_per_constraints_t *constraints, void **sptr, asn_per_data_t *pd) {
	asn_dec_rval_t rv;
	ssize_t chunk_bytes;
	int repeat;
	uint8_t *buf = 0;
	size_t bufLen = 0;
	size_t bufSize = 0;
	asn_per_data_t spd;
	size_t padding;

	_ASN_STACK_OVERFLOW_CHECK(ctx);

	ASN_DEBUG("Getting open type %s...", td->name);

	do {
		chunk_bytes = uper_get_length(pd, -1, &repeat);
		if(chunk_bytes < 0) {
			FREEMEM(buf);
			_ASN_DECODE_STARVED;
		}
		if(bufLen + chunk_bytes > bufSize) {
			void *ptr;
			bufSize = chunk_bytes + (bufSize << 2);
			ptr = REALLOC(buf, bufSize);
			if(!ptr) {
				FREEMEM(buf);
				_ASN_DECODE_FAILED;
			}
			buf = ptr;
		}
		if(per_get_many_bits(pd, buf + bufLen, 0, chunk_bytes << 3)) {
			FREEMEM(buf);
			_ASN_DECODE_STARVED;
		}
		bufLen += chunk_bytes;
	} while(repeat);

	memset(&spd, 0, sizeof(spd));
	spd.buffer = buf;
	spd.nbits = bufLen << 3;

	asn_debug_indent += 4;
	rv = td->uper_decoder(ctx, td, constraints, sptr, &spd);
	asn_debug_indent -= 4;

	if(rv.code == RC_OK) {
		/* Check padding validity */
		padding = spd.nbits - spd.nboff;
		if(padding < 8 && per_get_few_bits(&spd, padding) == 0) {
			/* Everything is cool */
			FREEMEM(buf);
			return rv;
		}
		FREEMEM(buf);
		if(padding >= 8)
        {
			_ASN_DECODE_FAILED;
		}
        else
        {
			_ASN_DECODE_FAILED;
		}
	}
    else
    {
		FREEMEM(buf);
		/* rv.code could be RC_WMORE, nonsense in this context */
		rv.code = RC_FAIL; /* Noone would give us more */
	}

	return rv;
}

static asn_dec_rval_t GCC_NOTUSED
uper_open_type_get_complex(asn_codec_ctx_t *ctx, asn_TYPE_descriptor_t *td,
	asn_per_constraints_t *constraints, void **sptr, asn_per_data_t *pd) {
	uper_ugot_key arg;
	asn_dec_rval_t rv;
	ssize_t padding;

	_ASN_STACK_OVERFLOW_CHECK(ctx);

	arg.oldpd = *pd;
	arg.unclaimed = 0;
	arg.ot_moved = 0;
	arg.repeat = 1;
	pd->refill = uper_ugot_refill;
	pd->refill_key = &arg;
	pd->nbits = pd->nboff;	/* 0 good bits at this point, will refill */
	pd->moved = 0;	/* This now counts the open type size in bits */

	asn_debug_indent += 4;
	rv = td->uper_decoder(ctx, td, constraints, sptr, pd);
	asn_debug_indent -= 4;

#define	UPDRESTOREPD	do {						\
	/* buffer and nboff are valid, preserve them. */		\
	pd->nbits = arg.oldpd.nbits - (pd->moved - arg.ot_moved);	\
	pd->moved = arg.oldpd.moved + (pd->moved - arg.ot_moved);	\
	pd->refill = arg.oldpd.refill;					\
	pd->refill_key = arg.oldpd.refill_key;				\
  } while(0)

	if(rv.code != RC_OK) {
		UPDRESTOREPD;
		return rv;
	}

	padding = pd->moved % 8;
	if(padding) {
		int32_t pvalue;
		if(padding > 7)
        {
			rv.code = RC_FAIL;
			UPDRESTOREPD;
			return rv;
		}
		padding = 8 - padding;
		pvalue = per_get_few_bits(pd, padding);
		switch(pvalue) {
		case -1:
			UPDRESTOREPD;
			_ASN_DECODE_STARVED;
		case 0: break;
		default:
			UPDRESTOREPD;
			_ASN_DECODE_FAILED;
		}
	}
	if(pd->nboff != pd->nbits) {
		if(1) {
			UPDRESTOREPD;
			_ASN_DECODE_FAILED;
		} else {
			arg.unclaimed += pd->nbits - pd->nboff;
		}
	}

	/* Adjust pd back so it points to original data */
	UPDRESTOREPD;

	/* Skip data not consumed by the decoder */
	if(arg.unclaimed) {
		switch(per_skip_bits(pd, arg.unclaimed)) {
		case -1:
			_ASN_DECODE_STARVED;
		case 0:
			break;
		default:
			/* Padding must be blank */
			_ASN_DECODE_FAILED;
		}
		arg.unclaimed = 0;
	}

	if(arg.repeat) {
		rv.code = RC_FAIL;
		return rv;
	}

	return rv;
}


asn_dec_rval_t
uper_open_type_get(asn_codec_ctx_t *ctx, asn_TYPE_descriptor_t *td,
	asn_per_constraints_t *constraints, void **sptr, asn_per_data_t *pd) {

	return uper_open_type_get_simple(ctx, td, constraints,
		sptr, pd);

}

int
uper_open_type_skip(asn_codec_ctx_t *ctx, asn_per_data_t *pd) {
	asn_TYPE_descriptor_t s_td;
	asn_dec_rval_t rv;

	s_td.name = "<unknown extension>";
	s_td.uper_decoder = uper_sot_suck;

	rv = uper_open_type_get(ctx, &s_td, 0, 0, pd);
	if(rv.code != RC_OK)
		return -1;
	else
		return 0;
}

/*
 * Internal functions.
 */

static asn_dec_rval_t
uper_sot_suck(asn_codec_ctx_t *ctx, asn_TYPE_descriptor_t *td,
	asn_per_constraints_t *constraints, void **sptr, asn_per_data_t *pd) {
	asn_dec_rval_t rv;

	(void)ctx;
	(void)td;
	(void)constraints;
	(void)sptr;

	while(per_get_few_bits(pd, 24) >= 0);

	rv.code = RC_OK;
	rv.consumed = pd->moved;

	return rv;
}

static int
uper_ugot_refill(asn_per_data_t *pd) {
	uper_ugot_key *arg = pd->refill_key;
	ssize_t next_chunk_bytes, next_chunk_bits;
	ssize_t avail;

	asn_per_data_t *oldpd = &arg->oldpd;

	/* Advance our position to where pd is */
	oldpd->buffer = pd->buffer;
	oldpd->nboff  = pd->nboff;
	oldpd->nbits -= pd->moved - arg->ot_moved;
	oldpd->moved += pd->moved - arg->ot_moved;
	arg->ot_moved = pd->moved;

	if(arg->unclaimed) {
		/* Refill the container */
		if(per_get_few_bits(oldpd, 1))
			return -1;
		if(oldpd->nboff == 0) {
			assert(0);
			return -1;
		}
		pd->buffer = oldpd->buffer;
		pd->nboff = oldpd->nboff - 1;
		pd->nbits = oldpd->nbits;
		return 0;
	}

	if(!arg->repeat) {
		ASN_DEBUG("Want more but refill doesn't have it");
		return -1;
	}

	next_chunk_bytes = uper_get_length(oldpd, -1, &arg->repeat);
	if(next_chunk_bytes < 0) return -1;
	if(next_chunk_bytes == 0) {
		pd->refill = 0;	/* No more refills, naturally */
		assert(!arg->repeat);	/* Implementation guarantee */
	}
	next_chunk_bits = next_chunk_bytes << 3;
	avail = oldpd->nbits - oldpd->nboff;
	if(avail >= next_chunk_bits) {
		pd->nbits = oldpd->nboff + next_chunk_bits;
		arg->unclaimed = 0;
	}
    else
    {
		pd->nbits = oldpd->nbits;
		arg->unclaimed = next_chunk_bits - avail;
	}
	pd->buffer = oldpd->buffer;
	pd->nboff = oldpd->nboff;
	ASN_DEBUG("Refilled pd%s old%s",
		per_data_string(pd), per_data_string(oldpd));
	return 0;
}

static int
per_skip_bits(asn_per_data_t *pd, int skip_nbits) {
	int hasNonZeroBits = 0;
	while(skip_nbits > 0) {
		int skip;
		if(skip_nbits < skip)
			skip = skip_nbits;
		else
			skip = 24;
		skip_nbits -= skip;

		switch(per_get_few_bits(pd, skip)) {
		case -1: return -1;	/* Starving */
		case 0: continue;	/* Skipped empty space */
		default: hasNonZeroBits = 1; continue;
		}
	}
	return hasNonZeroBits;
}
