/*
 * Copyright 1992 by Jutta Degener and Carsten Bormann, Technische
 * Universitaet Berlin.  See the accompanying file "COPYRIGHT" for
 * details.  THERE IS ABSOLUTELY NO WARRANTY FOR THIS SOFTWARE.
 */

/* $Header: /home/mguthaus/.cvsroot/mibench/telecomm/gsm/src/toast_alaw.c,v 1.1.1.1 2000/11/06 19:54:26 mguthaus Exp $ */

#include	"toast.h"

/*  toast_alaw.c -- manipulate A-law encoded sound.
 */

extern FILE	* in, * out;

#define	A2S(x)	(a2s[  (unsigned char )(x)       ])
#define	S2A(x)	(s2a[ ((unsigned short)(x)) >> 4 ])

static unsigned short a2s[] = {

 	 5120,60160,  320,65200,20480,44032, 1280,64192,
	 2560,62848,   64,65456,10240,54784,  640,64864,
	 7168,58112,  448,65072,28672,35840, 1792,63680,
	 3584,61824,  192,65328,14336,50688,  896,64608,
	 4096,61184,  256,65264,16384,48128, 1024,64448,
	 2048,63360,    0,65520, 8192,56832,  512,64992,
	 6144,59136,  384,65136,24576,39936, 1536,63936,
	 3072,62336,  128,65392,12288,52736,  768,64736,
	 5632,59648,  352,65168,22528,41984, 1408,64064,
	 2816,62592,   96,65424,11264,53760,  704,64800,
	 7680,57600,  480,65040,30720,33792, 1920,63552,
	 3840,61568,  224,65296,15360,49664,  960,64544,
	 4608,60672,  288,65232,18432,46080, 1152,64320,
	 2304,63104,   32,65488, 9216,55808,  576,64928,
	 6656,58624,  416,65104,26624,37888, 1664,63808,
	 3328,62080,  160,65360,13312,51712,  832,64672,
	 5376,59904,  336,65184,21504,43008, 1344,64128,
	 2688,62720,   80,65440,10752,54272,  672,64832,
	 7424,57856,  464,65056,29696,34816, 1856,63616,
	 3712,61696,  208,65312,14848,50176,  928,64576,
	 4352,60928,  272,65248,17408,47104, 1088,64384,
	 2176,63232,   16,65504, 8704,56320,  544,64960,
	 6400,58880,  400,65120,25600,38912, 1600,63872,
	 3200,62208,  144,65376,12800,52224,  800,64704,
	 5888,59392,  368,65152,23552,40960, 1472,64000,
	 2944,62464,  112,65408,11776,53248,  736,64768,
	 7936,57344,  496,65024,31744,32768, 1984,63488,
	 3968,61440,  240,65280,15872,49152,  992,64512,
	 4864,60416,  304,65216,19456,45056, 1216,64256,
	 2432,62976,   48,65472, 9728,55296,  608,64896,
	 6912,58368,  432,65088,27648,36864, 1728,63744,
	 3456,61952,  176,65344,13824,51200,  864,64640
};


static unsigned char  s2a[] = {

	170, 42,234,106,138, 10,202, 74,186, 58,250,122,154, 26,218, 90,
	162, 34,226, 98,130,  2,194, 66,178, 50,242,114,146, 18,210, 82,
	174, 46, 46,238,238,110,110,142,142, 14, 14,206,206, 78, 78,190,
	190, 62, 62,254,254,126,126,158,158, 30, 30,222,222, 94, 94,166,
	166, 38, 38, 38, 38,230,230,230,230,102,102,102,102,134,134,134,
	134,  6,  6,  6,  6,198,198,198,198, 70, 70, 70, 70,182,182,182,
	182, 54, 54, 54, 54,246,246,246,246,118,118,118,118,150,150,150,
	150, 22, 22, 22, 22,214,214,214,214, 86, 86, 86, 86,168,168,168,
	168, 40, 40, 40, 40, 40, 40, 40, 40,232,232,232,232,232,232,232,
	232,104,104,104,104,104,104,104,104,136,136,136,136,136,136,136,
	136,  8,  8,  8,  8,  8,  8,  8,  8,200,200,200,200,200,200,200,
	200, 72, 72, 72, 72, 72, 72, 72, 72,184,184,184,184,184,184,184,
	184, 56, 56, 56, 56, 56, 56, 56, 56,248,248,248,248,248,248,248,
	248,120,120,120,120,120,120,120,120,152,152,152,152,152,152,152,
	152, 24, 24, 24, 24, 24, 24, 24, 24,216,216,216,216,216,216,216,
	216, 88, 88, 88, 88, 88, 88, 88, 88,160,160,160,160,160,160,160,
	160, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
	 32,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,
	224, 96, 96, 96, 96, 96, 96, 96, 96, 96, 96, 96, 96, 96, 96, 96,
	 96,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,
	128,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
	  0,192,192,192,192,192,192,192,192,192,192,192,192,192,192,192,
	192, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
	 64,176,176,176,176,176,176,176,176,176,176,176,176,176,176,176,
	176, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48,
	 48,240,240,240,240,240,240,240,240,240,240,240,240,240,240,240,
	240,112,112,112,112,112,112,112,112,112,112,112,112,112,112,112,
	112,144,144,144,144,144,144,144,144,144,144,144,144,144,144,144,
	144, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
	 16,208,208,208,208,208,208,208,208,208,208,208,208,208,208,208,
	208, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80,
	 80,172,172,172,172,172,172,172,172,172,172,172,172,172,172,172,
	172, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44,
	 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44,
	 44,236,236,236,236,236,236,236,236,236,236,236,236,236,236,236,
	236,236,236,236,236,236,236,236,236,236,236,236,236,236,236,236,
	236,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,
	108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,
	108,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,
	140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,
	140, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
	 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
	 12,204,204,204,204,204,204,204,204,204,204,204,204,204,204,204,
	204,204,204,204,204,204,204,204,204,204,204,204,204,204,204,204,
	204, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76,
	 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76,
	 76,188,188,188,188,188,188,188,188,188,188,188,188,188,188,188,
	188,188,188,188,188,188,188,188,188,188,188,188,188,188,188,188,
	188, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60,
	 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60,
	 60,252,252,252,252,252,252,252,252,252,252,252,252,252,252,252,
	252,252,252,252,252,252,252,252,252,252,252,252,252,252,252,252,
	252,124,124,124,124,124,124,124,124,124,124,124,124,124,124,124,
	124,124,124,124,124,124,124,124,124,124,124,124,124,124,124,124,
	124,156,156,156,156,156,156,156,156,156,156,156,156,156,156,156,
	156,156,156,156,156,156,156,156,156,156,156,156,156,156,156,156,
	156, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28,
	 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28,
	 28,220,220,220,220,220,220,220,220,220,220,220,220,220,220,220,
	220,220,220,220,220,220,220,220,220,220,220,220,220,220,220,220,
	220, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92,
	 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92,
	 92,164,164,164,164,164,164,164,164,164,164,164,164,164,164,164,
	164,164,164,164,164,164,164,164,164,164,164,164,164,164,164,164,
	164, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36,
	 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36,
	 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36,
	 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36,
	 36,228,228,228,228,228,228,228,228,228,228,228,228,228,228,228,
	228,228,228,228,228,228,228,228,228,228,228,228,228,228,228,228,
	228,228,228,228,228,228,228,228,228,228,228,228,228,228,228,228,
	228,228,228,228,228,228,228,228,228,228,228,228,228,228,228,228,
	228,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,
	100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,
	100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,
	100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,
	100,132,132,132,132,132,132,132,132,132,132,132,132,132,132,132,
	132,132,132,132,132,132,132,132,132,132,132,132,132,132,132,132,
	132,132,132,132,132,132,132,132,132,132,132,132,132,132,132,132,
	132,132,132,132,132,132,132,132,132,132,132,132,132,132,132,132,
	132,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,
	  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,
	  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,
	  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,
	  4,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,
	196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,
	196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,
	196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,
	196, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68,
	 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68,
	 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68,
	 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68,
	 68,180,180,180,180,180,180,180,180,180,180,180,180,180,180,180,
	180,180,180,180,180,180,180,180,180,180,180,180,180,180,180,180,
	180,180,180,180,180,180,180,180,180,180,180,180,180,180,180,180,
	180,180,180,180,180,180,180,180,180,180,180,180,180,180,180,180,
	180, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
	 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
	 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
	 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
	 52,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,
	244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,
	244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,
	244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,244,
	244,116,116,116,116,116,116,116,116,116,116,116,116,116,116,116,
	116,116,116,116,116,116,116,116,116,116,116,116,116,116,116,116,
	116,116,116,116,116,116,116,116,116,116,116,116,116,116,116,116,
	116,116,116,116,116,116,116,116,116,116,116,116,116,116,116,116,
	116,148,148,148,148,148,148,148,148,148,148,148,148,148,148,148,
	148,148,148,148,148,148,148,148,148,148,148,148,148,148,148,148,
	148,148,148,148,148,148,148,148,148,148,148,148,148,148,148,148,
	148,148,148,148,148,148,148,148,148,148,148,148,148,148,148,148,
	148, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
	 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
	 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
	 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
	 20,212,212,212,212,212,212,212,212,212,212,212,212,212,212,212,
	212,212,212,212,212,212,212,212,212,212,212,212,212,212,212,212,
	212,212,212,212,212,212,212,212,212,212,212,212,212,212,212,212,
	212,212,212,212,212,212,212,212,212,212,212,212,212,212,212,212,
	212, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84,
	 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84,
	 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84,
	 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84,
	 84, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85,
	 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85,
	 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85,
	 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85,
	 85,213,213,213,213,213,213,213,213,213,213,213,213,213,213,213,
	213,213,213,213,213,213,213,213,213,213,213,213,213,213,213,213,
	213,213,213,213,213,213,213,213,213,213,213,213,213,213,213,213,
	213,213,213,213,213,213,213,213,213,213,213,213,213,213,213,213,
	213, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	 21,149,149,149,149,149,149,149,149,149,149,149,149,149,149,149,
	149,149,149,149,149,149,149,149,149,149,149,149,149,149,149,149,
	149,149,149,149,149,149,149,149,149,149,149,149,149,149,149,149,
	149,149,149,149,149,149,149,149,149,149,149,149,149,149,149,149,
	149,117,117,117,117,117,117,117,117,117,117,117,117,117,117,117,
	117,117,117,117,117,117,117,117,117,117,117,117,117,117,117,117,
	117,117,117,117,117,117,117,117,117,117,117,117,117,117,117,117,
	117,117,117,117,117,117,117,117,117,117,117,117,117,117,117,117,
	117,245,245,245,245,245,245,245,245,245,245,245,245,245,245,245,
	245,245,245,245,245,245,245,245,245,245,245,245,245,245,245,245,
	245,245,245,245,245,245,245,245,245,245,245,245,245,245,245,245,
	245,245,245,245,245,245,245,245,245,245,245,245,245,245,245,245,
	245, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53,
	 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53,
	 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53,
	 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53,
	 53,181,181,181,181,181,181,181,181,181,181,181,181,181,181,181,
	181,181,181,181,181,181,181,181,181,181,181,181,181,181,181,181,
	181,181,181,181,181,181,181,181,181,181,181,181,181,181,181,181,
	181,181,181,181,181,181,181,181,181,181,181,181,181,181,181,181,
	181, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69,
	 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69,
	 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69,
	 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69,
	 69,197,197,197,197,197,197,197,197,197,197,197,197,197,197,197,
	197,197,197,197,197,197,197,197,197,197,197,197,197,197,197,197,
	197,197,197,197,197,197,197,197,197,197,197,197,197,197,197,197,
	197,197,197,197,197,197,197,197,197,197,197,197,197,197,197,197,
	197,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
	  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
	  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
	  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
	  5,133,133,133,133,133,133,133,133,133,133,133,133,133,133,133,
	133,133,133,133,133,133,133,133,133,133,133,133,133,133,133,133,
	133,133,133,133,133,133,133,133,133,133,133,133,133,133,133,133,
	133,133,133,133,133,133,133,133,133,133,133,133,133,133,133,133,
	133,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,
	101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,
	101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,
	101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,
	101,229,229,229,229,229,229,229,229,229,229,229,229,229,229,229,
	229,229,229,229,229,229,229,229,229,229,229,229,229,229,229,229,
	229,229,229,229,229,229,229,229,229,229,229,229,229,229,229,229,
	229,229,229,229,229,229,229,229,229,229,229,229,229,229,229,229,
	229, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37,
	 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37,
	 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37,
	 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37,
	 37,165,165,165,165,165,165,165,165,165,165,165,165,165,165,165,
	165,165,165,165,165,165,165,165,165,165,165,165,165,165,165,165,
	165,165,165,165,165,165,165,165,165,165,165,165,165,165,165,165,
	165,165,165,165,165,165,165,165,165,165,165,165,165,165,165,165,
	165, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93,
	 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93,
	 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93,
	 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93,
	 93,221,221,221,221,221,221,221,221,221,221,221,221,221,221,221,
	221,221,221,221,221,221,221,221,221,221,221,221,221,221,221,221,
	221, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29,
	 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29,
	 29,157,157,157,157,157,157,157,157,157,157,157,157,157,157,157,
	157,157,157,157,157,157,157,157,157,157,157,157,157,157,157,157,
	157,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,
	125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,
	125,253,253,253,253,253,253,253,253,253,253,253,253,253,253,253,
	253,253,253,253,253,253,253,253,253,253,253,253,253,253,253,253,
	253, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61,
	 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61,
	 61,189,189,189,189,189,189,189,189,189,189,189,189,189,189,189,
	189,189,189,189,189,189,189,189,189,189,189,189,189,189,189,189,
	189, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77,
	 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77,
	 77,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,
	205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,
	205, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13,
	 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13,
	 13,141,141,141,141,141,141,141,141,141,141,141,141,141,141,141,
	141,141,141,141,141,141,141,141,141,141,141,141,141,141,141,141,
	141,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,
	109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,
	109,237,237,237,237,237,237,237,237,237,237,237,237,237,237,237,
	237,237,237,237,237,237,237,237,237,237,237,237,237,237,237,237,
	237, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
	 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
	 45,173,173,173,173,173,173,173,173,173,173,173,173,173,173,173,
	173,173,173,173,173,173,173,173,173,173,173,173,173,173,173,173,
	173, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81,
	 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81,
	 81,209,209,209,209,209,209,209,209,209,209,209,209,209,209,209,
	209, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17,
	 17,145,145,145,145,145,145,145,145,145,145,145,145,145,145,145,
	145,113,113,113,113,113,113,113,113,113,113,113,113,113,113,113,
	113,241,241,241,241,241,241,241,241,241,241,241,241,241,241,241,
	241, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
	 49,177,177,177,177,177,177,177,177,177,177,177,177,177,177,177,
	177, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65,
	 65,193,193,193,193,193,193,193,193,193,193,193,193,193,193,193,
	193,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
	  1,129,129,129,129,129,129,129,129,129,129,129,129,129,129,129,
	129, 97, 97, 97, 97, 97, 97, 97, 97, 97, 97, 97, 97, 97, 97, 97,
	 97,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,
	225, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33,
	 33,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,
	161, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89,
	 89,217,217,217,217,217,217,217,217, 25, 25, 25, 25, 25, 25, 25,
	 25,153,153,153,153,153,153,153,153,121,121,121,121,121,121,121,
	121,249,249,249,249,249,249,249,249, 57, 57, 57, 57, 57, 57, 57,
	 57,185,185,185,185,185,185,185,185, 73, 73, 73, 73, 73, 73, 73,
	 73,201,201,201,201,201,201,201,201,  9,  9,  9,  9,  9,  9,  9,
	  9,137,137,137,137,137,137,137,137,105,105,105,105,105,105,105,
	105,233,233,233,233,233,233,233,233, 41, 41, 41, 41, 41, 41, 41,
	 41,169,169,169,169,169,169,169,169, 87, 87, 87, 87, 87, 87, 87,
	 87,215,215,215,215, 23, 23, 23, 23,151,151,151,151,119,119,119,
	119,247,247,247,247, 55, 55, 55, 55,183,183,183,183, 71, 71, 71,
	 71,199,199,199,199,  7,  7,  7,  7,135,135,135,135,103,103,103,
	103,231,231,231,231, 39, 39, 39, 39,167,167,167,167, 95, 95, 95,
	 95,223,223, 31, 31,159,159,127,127,255,255, 63, 63,191,191, 79,
	 79,207,207, 15, 15,143,143,111,111,239,239, 47, 47,175,175, 83,
	 83,211, 19,147,115,243, 51,179, 67,195,  3,131, 99,227, 35,163,
	 91,219, 27,155,123,251, 59,187, 75,203, 11,139,107,235, 43,171
};

int alaw_input P1((buf), gsm_signal * buf) 
{
	int  i, c;

	for (i = 0; i < 160 && (c = fgetc(in)) != EOF; i++) buf[i] = A2S( c );
	if (c == EOF && ferror(in)) return -1;
	return i;
}

int alaw_output P1((buf), gsm_signal * buf) 
{
	int  i;

	for (i = 0; i < 160; i++, buf++)
		if (fputc( S2A( *buf ), out) == EOF) return -1;
	return 0;
}

