#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "bit_reader.h"
#import "bit_reader_inl.h"
#import "bit_writer.h"
#import "color_cache.h"
#import "endian_inl.h"
#import "filters.h"
#import "huffman.h"
#import "huffman_encode.h"
#import "quant_levels.h"
#import "quant_levels_dec.h"
#import "random.h"
#import "rescaler.h"
#import "thread.h"
#import "utils.h"
#import "common_sse2.h"
#import "dsp.h"
#import "lossless.h"
#import "mips_macro.h"
#import "msa_macro.h"
#import "neon.h"
#import "yuv.h"
#import "backward_references.h"
#import "cost.h"
#import "delta_palettization.h"
#import "histogram.h"
#import "vp8enci.h"
#import "vp8li.h"
#import "alphai.h"
#import "common.h"
#import "decode_vp8.h"
#import "vp8i.h"
#import "vp8li.h"
#import "webpi.h"
#import "muxi.h"
#import "decode.h"
#import "demux.h"
#import "encode.h"
#import "extras.h"
#import "format_constants.h"
#import "mux.h"
#import "mux_types.h"
#import "types.h"

FOUNDATION_EXPORT double libwebpVersionNumber;
FOUNDATION_EXPORT const unsigned char libwebpVersionString[];

