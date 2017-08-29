; ModuleID = 'tif_luv.ll'
source_filename = "tif_luv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.anon = type { float, i16, i16 }
%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.logLuvState = type { i32, i32, i8**, i16, void (%struct.logLuvState*, i8*, i32)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* }

@TIFFInitSGILog.module = internal constant [15 x i8] c"TIFFInitSGILog\00", align 1
@.str = private unnamed_addr constant [63 x i8] c"scheme == COMPRESSION_SGILOG24 || scheme == COMPRESSION_SGILOG\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"tif_luv.c\00", align 1
@__PRETTY_FUNCTION__.TIFFInitSGILog = private unnamed_addr constant [32 x i8] c"int TIFFInitSGILog(TIFF *, int)\00", align 1
@LogLuvFieldInfo = internal constant [1 x %struct.TIFFFieldInfo] [%struct.TIFFFieldInfo { i32 65560, i16 0, i16 0, i32 3, i16 0, i8 1, i8 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.21, i32 0, i32 0) }], align 16
@.str.2 = private unnamed_addr constant [36 x i8] c"%s: No space for LogLuv state block\00", align 1
@.str.3 = private unnamed_addr constant [71 x i8] c"Inappropriate photometric interpretation %d for SGILog compression; %s\00", align 1
@.str.4 = private unnamed_addr constant [30 x i8] c"must be either LogLUV or LogL\00", align 1
@LogLuvInitState.module = internal constant [16 x i8] c"LogLuvInitState\00", align 16
@.str.5 = private unnamed_addr constant [11 x i8] c"sp != NULL\00", align 1
@__PRETTY_FUNCTION__.LogLuvInitState = private unnamed_addr constant [28 x i8] c"int LogLuvInitState(TIFF *)\00", align 1
@.str.6 = private unnamed_addr constant [41 x i8] c"td->td_photometric == PHOTOMETRIC_LOGLUV\00", align 1
@.str.7 = private unnamed_addr constant [53 x i8] c"SGILog compression cannot handle non-contiguous data\00", align 1
@.str.8 = private unnamed_addr constant [53 x i8] c"No support for converting user data format to LogLuv\00", align 1
@.str.9 = private unnamed_addr constant [43 x i8] c"%s: No space for SGILog translation buffer\00", align 1
@.str.10 = private unnamed_addr constant [7 x i8] c"s == 0\00", align 1
@__PRETTY_FUNCTION__.LogLuvDecode24 = private unnamed_addr constant [57 x i8] c"int LogLuvDecode24(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@.str.11 = private unnamed_addr constant [23 x i8] c"sp->tbuflen >= npixels\00", align 1
@.str.12 = private unnamed_addr constant [60 x i8] c"LogLuvDecode24: Not enough data at row %d (short %d pixels)\00", align 1
@uv_row = internal unnamed_addr constant [163 x %struct.anon] [%struct.anon { float 0x3FCFB36BE0000000, i16 4, i16 0 }, %struct.anon { float 0x3FCF342680000000, i16 6, i16 4 }, %struct.anon { float 0x3FCEEF8060000000, i16 7, i16 10 }, %struct.anon { float 0x3FCE72A7C0000000, i16 9, i16 17 }, %struct.anon { float 0x3FCE322B00000000, i16 10, i16 26 }, %struct.anon { float 0x3FCDB73080000000, i16 12, i16 36 }, %struct.anon { float 0x3FCD3AA360000000, i16 14, i16 48 }, %struct.anon { float 0x3FCCF60E00000000, i16 15, i16 62 }, %struct.anon { float 0x3FCC76A720000000, i16 17, i16 77 }, %struct.anon { float 0x3FCC366520000000, i16 18, i16 94 }, %struct.anon { float 0x3FCB7B9E00000000, i16 21, i16 112 }, %struct.anon { float 0x3FCB3A3660000000, i16 22, i16 133 }, %struct.anon { float 0x3FCAF8E7E0000000, i16 23, i16 155 }, %struct.anon { float 0x3FCA3CA760000000, i16 26, i16 178 }, %struct.anon { float 0x3FC9FB7200000000, i16 27, i16 204 }, %struct.anon { float 0x3FC980DC40000000, i16 29, i16 231 }, %struct.anon { float 0x3FC906F6A0000000, i16 31, i16 260 }, %struct.anon { float 0x3FC8C69300000000, i16 32, i16 291 }, %struct.anon { float 0x3FC84DEC20000000, i16 34, i16 323 }, %struct.anon { float 0x3FC7D5ED00000000, i16 36, i16 357 }, %struct.anon { float 0x3FC7D5ED00000000, i16 36, i16 393 }, %struct.anon { float 0x3FC75F2CC0000000, i16 38, i16 429 }, %struct.anon { float 0x3FC6E99200000000, i16 40, i16 467 }, %struct.anon { float 0x3FC675AB80000000, i16 42, i16 507 }, %struct.anon { float 0x3FC6042100000000, i16 44, i16 549 }, %struct.anon { float 0x3FC6042100000000, i16 44, i16 593 }, %struct.anon { float 0x3FC5951400000000, i16 46, i16 637 }, %struct.anon { float 0x3FC5951400000000, i16 46, i16 683 }, %struct.anon { float 0x3FC4F00680000000, i16 49, i16 729 }, %struct.anon { float 0x3FC44E6180000000, i16 52, i16 778 }, %struct.anon { float 0x3FC44E6180000000, i16 52, i16 830 }, %struct.anon { float 0x3FC44E6180000000, i16 52, i16 882 }, %struct.anon { float 0x3FC3B035C0000000, i16 55, i16 934 }, %struct.anon { float 0x3FC3B035C0000000, i16 55, i16 989 }, %struct.anon { float 0x3FC3159C40000000, i16 58, i16 1044 }, %struct.anon { float 0x3FC3159C40000000, i16 58, i16 1102 }, %struct.anon { float 0x3FC2458040000000, i16 62, i16 1160 }, %struct.anon { float 0x3FC2458040000000, i16 62, i16 1222 }, %struct.anon { float 0x3FC2458040000000, i16 62, i16 1284 }, %struct.anon { float 0x3FC1B2D4E0000000, i16 65, i16 1346 }, %struct.anon { float 0x3FC1B2D4E0000000, i16 65, i16 1411 }, %struct.anon { float 0x3FC1B2D4E0000000, i16 65, i16 1476 }, %struct.anon { float 0x3FC0EAD0C0000000, i16 69, i16 1541 }, %struct.anon { float 0x3FC0EAD0C0000000, i16 69, i16 1610 }, %struct.anon { float 0x3FC02773E0000000, i16 73, i16 1679 }, %struct.anon { float 0x3FC02773E0000000, i16 73, i16 1752 }, %struct.anon { float 0x3FC02773E0000000, i16 73, i16 1825 }, %struct.anon { float 0x3FBED14A00000000, i16 77, i16 1898 }, %struct.anon { float 0x3FBED14A00000000, i16 77, i16 1975 }, %struct.anon { float 0x3FBED14A00000000, i16 77, i16 2052 }, %struct.anon { float 0x3FBED14A00000000, i16 77, i16 2129 }, %struct.anon { float 0x3FBCEB13E0000000, i16 82, i16 2206 }, %struct.anon { float 0x3FBCEB13E0000000, i16 82, i16 2288 }, %struct.anon { float 0x3FBCEB13E0000000, i16 82, i16 2370 }, %struct.anon { float 0x3FBB81D7E0000000, i16 86, i16 2452 }, %struct.anon { float 0x3FBB81D7E0000000, i16 86, i16 2538 }, %struct.anon { float 0x3FBB81D7E0000000, i16 86, i16 2624 }, %struct.anon { float 0x3FBB81D7E0000000, i16 86, i16 2710 }, %struct.anon { float 0x3FB9B01420000000, i16 91, i16 2796 }, %struct.anon { float 0x3FB9B01420000000, i16 91, i16 2887 }, %struct.anon { float 0x3FB9B01420000000, i16 91, i16 2978 }, %struct.anon { float 0x3FB85A2D80000000, i16 95, i16 3069 }, %struct.anon { float 0x3FB85A2D80000000, i16 95, i16 3164 }, %struct.anon { float 0x3FB85A2D80000000, i16 95, i16 3259 }, %struct.anon { float 0x3FB85A2D80000000, i16 95, i16 3354 }, %struct.anon { float 0x3FB6994180000000, i16 100, i16 3449 }, %struct.anon { float 0x3FB6994180000000, i16 100, i16 3549 }, %struct.anon { float 0x3FB6994180000000, i16 100, i16 3649 }, %struct.anon { float 0x3FB6994180000000, i16 100, i16 3749 }, %struct.anon { float 0x3FB4DEB100000000, i16 105, i16 3849 }, %struct.anon { float 0x3FB4DEB100000000, i16 105, i16 3954 }, %struct.anon { float 0x3FB4DEB100000000, i16 105, i16 4059 }, %struct.anon { float 0x3FB4DEB100000000, i16 105, i16 4164 }, %struct.anon { float 0x3FB32A1720000000, i16 110, i16 4269 }, %struct.anon { float 0x3FB32A1720000000, i16 110, i16 4379 }, %struct.anon { float 0x3FB32A1720000000, i16 110, i16 4489 }, %struct.anon { float 0x3FB32A1720000000, i16 110, i16 4599 }, %struct.anon { float 0x3FB17B7420000000, i16 115, i16 4709 }, %struct.anon { float 0x3FB17B7420000000, i16 115, i16 4824 }, %struct.anon { float 0x3FB17B7420000000, i16 115, i16 4939 }, %struct.anon { float 0x3FB17B7420000000, i16 115, i16 5054 }, %struct.anon { float 0x3FB0465200000000, i16 119, i16 5169 }, %struct.anon { float 0x3FB0465200000000, i16 119, i16 5288 }, %struct.anon { float 0x3FB0465200000000, i16 119, i16 5407 }, %struct.anon { float 0x3FB0465200000000, i16 119, i16 5526 }, %struct.anon { float 0x3FAD4BCF00000000, i16 124, i16 5645 }, %struct.anon { float 0x3FAD4BCF00000000, i16 124, i16 5769 }, %struct.anon { float 0x3FAD4BCF00000000, i16 124, i16 5893 }, %struct.anon { float 0x3FAD4BCF00000000, i16 124, i16 6017 }, %struct.anon { float 0x3FAA1AB4C0000000, i16 129, i16 6141 }, %struct.anon { float 0x3FAA1AB4C0000000, i16 129, i16 6270 }, %struct.anon { float 0x3FAA1AB4C0000000, i16 129, i16 6399 }, %struct.anon { float 0x3FAA1AB4C0000000, i16 129, i16 6528 }, %struct.anon { float 0x3FAA1AB4C0000000, i16 129, i16 6657 }, %struct.anon { float 0x3FA6F7C240000000, i16 134, i16 6786 }, %struct.anon { float 0x3FA6F7C240000000, i16 134, i16 6920 }, %struct.anon { float 0x3FA6F7C240000000, i16 134, i16 7054 }, %struct.anon { float 0x3FA6F7C240000000, i16 134, i16 7188 }, %struct.anon { float 0x3FA4C5B8E0000000, i16 138, i16 7322 }, %struct.anon { float 0x3FA4C5B8E0000000, i16 138, i16 7460 }, %struct.anon { float 0x3FA4C5B8E0000000, i16 138, i16 7598 }, %struct.anon { float 0x3FA4C5B8E0000000, i16 138, i16 7736 }, %struct.anon { float 0x3FA29B0680000000, i16 142, i16 7874 }, %struct.anon { float 0x3FA29B0680000000, i16 142, i16 8016 }, %struct.anon { float 0x3FA29B0680000000, i16 142, i16 8158 }, %struct.anon { float 0x3FA29B0680000000, i16 142, i16 8300 }, %struct.anon { float 0x3FA07485E0000000, i16 146, i16 8442 }, %struct.anon { float 0x3FA07485E0000000, i16 146, i16 8588 }, %struct.anon { float 0x3FA07485E0000000, i16 146, i16 8734 }, %struct.anon { float 0x3FA07485E0000000, i16 146, i16 8880 }, %struct.anon { float 0x3F9C9E2360000000, i16 150, i16 9026 }, %struct.anon { float 0x3F9C9E2360000000, i16 150, i16 9176 }, %struct.anon { float 0x3F9C9E2360000000, i16 150, i16 9326 }, %struct.anon { float 0x3F984F0960000000, i16 154, i16 9476 }, %struct.anon { float 0x3F984F0960000000, i16 154, i16 9630 }, %struct.anon { float 0x3F984F0960000000, i16 154, i16 9784 }, %struct.anon { float 0x3F984F0960000000, i16 154, i16 9938 }, %struct.anon { float 0x3F93F8DB40000000, i16 158, i16 10092 }, %struct.anon { float 0x3F93F8DB40000000, i16 158, i16 10250 }, %struct.anon { float 0x3F93F8DB40000000, i16 158, i16 10408 }, %struct.anon { float 0x3F91622820000000, i16 161, i16 10566 }, %struct.anon { float 0x3F91622820000000, i16 161, i16 10727 }, %struct.anon { float 0x3F91622820000000, i16 161, i16 10888 }, %struct.anon { float 0x3F91622820000000, i16 161, i16 11049 }, %struct.anon { float 0x3F89E279E0000000, i16 165, i16 11210 }, %struct.anon { float 0x3F89E279E0000000, i16 165, i16 11375 }, %struct.anon { float 0x3F89E279E0000000, i16 165, i16 11540 }, %struct.anon { float 0x3F84762960000000, i16 168, i16 11705 }, %struct.anon { float 0x3F84762960000000, i16 168, i16 11873 }, %struct.anon { float 0x3F84762960000000, i16 168, i16 12041 }, %struct.anon { float 0x3F8276FB00000000, i16 170, i16 12209 }, %struct.anon { float 0x3F8276FB00000000, i16 170, i16 12379 }, %struct.anon { float 0x3F8276FB00000000, i16 170, i16 12549 }, %struct.anon { float 0x3F7976FF40000000, i16 173, i16 12719 }, %struct.anon { float 0x3F7976FF40000000, i16 173, i16 12892 }, %struct.anon { float 0x3F74E09780000000, i16 175, i16 13065 }, %struct.anon { float 0x3F74E09780000000, i16 175, i16 13240 }, %struct.anon { float 0x3F74E09780000000, i16 175, i16 13415 }, %struct.anon { float 0x3F7002E240000000, i16 177, i16 13590 }, %struct.anon { float 0x3F7002E240000000, i16 177, i16 13767 }, %struct.anon { float 0x3F632B55E0000000, i16 177, i16 13944 }, %struct.anon { float 0x3F639218A0000000, i16 170, i16 14121 }, %struct.anon { float 0x3F517F8440000000, i16 164, i16 14291 }, %struct.anon { float 0x3F5B152F40000000, i16 157, i16 14455 }, %struct.anon { float 0x3F477EA1C0000000, i16 150, i16 14612 }, %struct.anon { float 0x3F5A719B40000000, i16 143, i16 14762 }, %struct.anon { float 0x3F31B1D920000000, i16 136, i16 14905 }, %struct.anon { float 0x3F3FB82C20000000, i16 129, i16 15041 }, %struct.anon { float 0x3F52125140000000, i16 123, i16 15170 }, %struct.anon { float 0x3F54595360000000, i16 115, i16 15293 }, %struct.anon { float 0x3F5376D540000000, i16 109, i16 15408 }, %struct.anon { float 0x3F50907100000000, i16 103, i16 15517 }, %struct.anon { float 0x3F473B85E0000000, i16 97, i16 15620 }, %struct.anon { float 0x3F33B9F120000000, i16 89, i16 15717 }, %struct.anon { float 0x3F63CAB820000000, i16 82, i16 15806 }, %struct.anon { float 0x3F6AA1D760000000, i16 76, i16 15888 }, %struct.anon { float 0x3F6A975B00000000, i16 69, i16 15964 }, %struct.anon { float 0x3F70F62740000000, i16 62, i16 16033 }, %struct.anon { float 0x3F786CA8A0000000, i16 55, i16 16095 }, %struct.anon { float 0x3F821A2E80000000, i16 47, i16 16150 }, %struct.anon { float 0x3F857BC800000000, i16 40, i16 16197 }, %struct.anon { float 0x3F9166E000000000, i16 31, i16 16237 }, %struct.anon { float 0x3F983A10A0000000, i16 21, i16 16268 }], align 16
@__PRETTY_FUNCTION__.LogLuvDecode32 = private unnamed_addr constant [57 x i8] c"int LogLuvDecode32(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@.str.13 = private unnamed_addr constant [60 x i8] c"LogLuvDecode32: Not enough data at row %d (short %d pixels)\00", align 1
@LogL16InitState.module = internal constant [16 x i8] c"LogL16InitState\00", align 16
@__PRETTY_FUNCTION__.LogL16InitState = private unnamed_addr constant [28 x i8] c"int LogL16InitState(TIFF *)\00", align 1
@.str.14 = private unnamed_addr constant [39 x i8] c"td->td_photometric == PHOTOMETRIC_LOGL\00", align 1
@.str.15 = private unnamed_addr constant [51 x i8] c"No support for converting user data format to LogL\00", align 1
@__PRETTY_FUNCTION__.LogL16Decode = private unnamed_addr constant [55 x i8] c"int LogL16Decode(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@.str.16 = private unnamed_addr constant [58 x i8] c"LogL16Decode: Not enough data at row %d (short %d pixels)\00", align 1
@.str.17 = private unnamed_addr constant [15 x i8] c"cc%rowlen == 0\00", align 1
@__PRETTY_FUNCTION__.LogLuvDecodeStrip = private unnamed_addr constant [60 x i8] c"int LogLuvDecodeStrip(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@__PRETTY_FUNCTION__.LogLuvDecodeTile = private unnamed_addr constant [59 x i8] c"int LogLuvDecodeTile(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@.str.18 = private unnamed_addr constant [54 x i8] c"SGILog compression supported only for %s, or raw data\00", align 1
@.str.19 = private unnamed_addr constant [5 x i8] c"Y, L\00", align 1
@.str.20 = private unnamed_addr constant [9 x i8] c"XYZ, Luv\00", align 1
@__PRETTY_FUNCTION__.LogLuvEncode24 = private unnamed_addr constant [57 x i8] c"int LogLuvEncode24(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@__PRETTY_FUNCTION__.LogLuvEncode32 = private unnamed_addr constant [57 x i8] c"int LogLuvEncode32(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@__PRETTY_FUNCTION__.LogL16Encode = private unnamed_addr constant [55 x i8] c"int LogL16Encode(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@__PRETTY_FUNCTION__.LogLuvEncodeStrip = private unnamed_addr constant [60 x i8] c"int LogLuvEncodeStrip(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@__PRETTY_FUNCTION__.LogLuvEncodeTile = private unnamed_addr constant [59 x i8] c"int LogLuvEncodeTile(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@.str.21 = private unnamed_addr constant [14 x i8] c"SGILogDataFmt\00", align 1
@.str.22 = private unnamed_addr constant [46 x i8] c"Unknown data format %d for LogLuv compression\00", align 1
@switch.table = private unnamed_addr constant [4 x i32] [i32 32, i32 16, i32 32, i32 8]
@switch.table.1 = private unnamed_addr constant [4 x i32] [i32 3, i32 2, i32 1, i32 1]
@switch.table.2 = private unnamed_addr constant [4 x i32] [i32 12, i32 6, i32 4, i32 3]

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFInitSGILog(%struct.tiff*, i32) local_unnamed_addr #0 {
  %3 = and i32 %1, -2
  %switch = icmp eq i32 %3, 34676
  br i1 %switch, label %5, label %4

; <label>:4:                                      ; preds = %2
  tail call void @__assert_fail(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 1386, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @__PRETTY_FUNCTION__.TIFFInitSGILog, i64 0, i64 0)) #8
  unreachable

; <label>:5:                                      ; preds = %2
  %6 = tail call i8* @_TIFFmalloc(i32 48) #9
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  store i8* %6, i8** %7, align 8
  %8 = icmp eq i8* %6, null
  br i1 %8, label %33, label %9

; <label>:9:                                      ; preds = %5
  %10 = bitcast i8** %7 to %struct.logLuvState**
  %11 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %12 = bitcast %struct.logLuvState* %11 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %12, i8 0, i64 48, i32 8, i1 false)
  %13 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %11, i64 0, i32 0
  store i32 -1, i32* %13, align 8
  %14 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %11, i64 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @_logLuvNop, void (%struct.logLuvState*, i8*, i32)** %14, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 21
  store i32 (%struct.tiff*)* @LogLuvSetupDecode, i32 (%struct.tiff*)** %15, align 8
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvDecodeStrip, i32 (%struct.tiff*, i8*, i32, i16)** %16, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvDecodeTile, i32 (%struct.tiff*, i8*, i32, i16)** %17, align 8
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 23
  store i32 (%struct.tiff*)* @LogLuvSetupEncode, i32 (%struct.tiff*)** %18, align 8
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 29
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvEncodeStrip, i32 (%struct.tiff*, i8*, i32, i16)** %19, align 8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 31
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvEncodeTile, i32 (%struct.tiff*, i8*, i32, i16)** %20, align 8
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 32
  store void (%struct.tiff*)* @LogLuvClose, void (%struct.tiff*)** %21, align 8
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 34
  store void (%struct.tiff*)* @LogLuvCleanup, void (%struct.tiff*)** %22, align 8
  tail call void @_TIFFMergeFieldInfo(%struct.tiff* nonnull %0, %struct.TIFFFieldInfo* getelementptr inbounds ([1 x %struct.TIFFFieldInfo], [1 x %struct.TIFFFieldInfo]* @LogLuvFieldInfo, i64 0, i64 0), i32 1) #9
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 58
  %24 = bitcast i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %11, i64 0, i32 5
  %27 = bitcast i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %26 to i64*
  store i64 %25, i64* %27, align 8
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @LogLuvVGetField, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %23, align 8
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 57
  %29 = bitcast i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %11, i64 0, i32 6
  %32 = bitcast i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %31 to i64*
  store i64 %30, i64* %32, align 8
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @LogLuvVSetField, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %28, align 8
  br label %36

; <label>:33:                                     ; preds = %5
  %34 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %35 = load i8*, i8** %34, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @TIFFInitSGILog.module, i64 0, i64 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0), i8* %35) #9
  br label %36

; <label>:36:                                     ; preds = %33, %9
  %.0 = phi i32 [ 0, %33 ], [ 1, %9 ]
  ret i32 %.0
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #1

declare i8* @_TIFFmalloc(i32) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal void @_logLuvNop(%struct.logLuvState* nocapture, i8* nocapture, i32) #4 {
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvSetupDecode(%struct.tiff* nocapture) #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %3 = bitcast i8** %2 to %struct.logLuvState**
  %4 = load %struct.logLuvState*, %struct.logLuvState** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 54
  store void (%struct.tiff*, i8*, i32)* @_TIFFNoPostDecode, void (%struct.tiff*, i8*, i32)** %5, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 11
  %7 = load i16, i16* %6, align 2
  switch i16 %7, label %37 [
    i16 -32691, label %8
    i16 -32692, label %28
  ]

; <label>:8:                                      ; preds = %1
  %9 = tail call fastcc i32 @LogLuvInitState(%struct.tiff* nonnull %0)
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %41, label %11

; <label>:11:                                     ; preds = %8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 10
  %13 = load i16, i16* %12, align 8
  %14 = icmp eq i16 %13, -30859
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 26
  br i1 %14, label %16, label %22

; <label>:16:                                     ; preds = %11
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvDecode24, i32 (%struct.tiff*, i8*, i32, i16)** %15, align 8
  %17 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %4, i64 0, i32 0
  %18 = load i32, i32* %17, align 8
  switch i32 %18, label %41 [
    i32 0, label %19
    i32 1, label %.sink.split
    i32 3, label %20
  ]

; <label>:19:                                     ; preds = %16
  br label %.sink.split

; <label>:20:                                     ; preds = %16
  br label %.sink.split

.sink.split:                                      ; preds = %16, %19, %20
  %Luv24toRGB.sink = phi void (%struct.logLuvState*, i8*, i32)* [ @Luv24toRGB, %20 ], [ @Luv24toXYZ, %19 ], [ @Luv24toLuv48, %16 ]
  %21 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %4, i64 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* %Luv24toRGB.sink, void (%struct.logLuvState*, i8*, i32)** %21, align 8
  br label %41

; <label>:22:                                     ; preds = %11
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvDecode32, i32 (%struct.tiff*, i8*, i32, i16)** %15, align 8
  %23 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %4, i64 0, i32 0
  %24 = load i32, i32* %23, align 8
  switch i32 %24, label %41 [
    i32 0, label %25
    i32 1, label %.sink.split1
    i32 3, label %26
  ]

; <label>:25:                                     ; preds = %22
  br label %.sink.split1

; <label>:26:                                     ; preds = %22
  br label %.sink.split1

.sink.split1:                                     ; preds = %22, %25, %26
  %Luv32toRGB.sink = phi void (%struct.logLuvState*, i8*, i32)* [ @Luv32toRGB, %26 ], [ @Luv32toXYZ, %25 ], [ @Luv32toLuv48, %22 ]
  %27 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %4, i64 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* %Luv32toRGB.sink, void (%struct.logLuvState*, i8*, i32)** %27, align 8
  br label %41

; <label>:28:                                     ; preds = %1
  %29 = tail call fastcc i32 @LogL16InitState(%struct.tiff* nonnull %0)
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %41, label %31

; <label>:31:                                     ; preds = %28
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogL16Decode, i32 (%struct.tiff*, i8*, i32, i16)** %32, align 8
  %33 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %4, i64 0, i32 0
  %34 = load i32, i32* %33, align 8
  switch i32 %34, label %41 [
    i32 0, label %35
    i32 3, label %.sink.split2
  ]

; <label>:35:                                     ; preds = %31
  br label %.sink.split2

.sink.split2:                                     ; preds = %31, %35
  %L16toGry.sink = phi void (%struct.logLuvState*, i8*, i32)* [ @L16toY, %35 ], [ @L16toGry, %31 ]
  %36 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %4, i64 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* %L16toGry.sink, void (%struct.logLuvState*, i8*, i32)** %36, align 8
  br label %41

; <label>:37:                                     ; preds = %1
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %39 = load i8*, i8** %38, align 8
  %40 = zext i16 %7 to i32
  tail call void (i8*, i8*, ...) @TIFFError(i8* %39, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.3, i64 0, i64 0), i32 %40, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.4, i64 0, i64 0)) #9
  br label %41

; <label>:41:                                     ; preds = %37, %8, %28, %31, %.sink.split2, %.sink.split, %16, %.sink.split1, %22
  %.0 = phi i32 [ 1, %22 ], [ 1, %.sink.split1 ], [ 1, %16 ], [ 1, %.sink.split ], [ 1, %.sink.split2 ], [ 1, %31 ], [ 0, %28 ], [ 0, %8 ], [ 0, %37 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvDecodeStrip(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = tail call i32 @TIFFScanlineSize(%struct.tiff* %0) #9
  %6 = srem i32 %2, %5
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %.preheader, label %11

.preheader:                                       ; preds = %4
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 26
  %9 = icmp eq i32 %2, 0
  br i1 %9, label %.critedge, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader
  %10 = sext i32 %5 to i64
  br label %12

; <label>:11:                                     ; preds = %4
  tail call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.17, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 324, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @__PRETTY_FUNCTION__.LogLuvDecodeStrip, i64 0, i64 0)) #8
  unreachable

; <label>:12:                                     ; preds = %.lr.ph, %16
  %.03 = phi i32 [ %2, %.lr.ph ], [ %18, %16 ]
  %.012 = phi i8* [ %1, %.lr.ph ], [ %17, %16 ]
  %13 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %8, align 8
  %14 = tail call i32 %13(%struct.tiff* %0, i8* %.012, i32 %5, i16 zeroext %3) #9
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %.critedge.loopexit, label %16

; <label>:16:                                     ; preds = %12
  %17 = getelementptr inbounds i8, i8* %.012, i64 %10
  %18 = sub nsw i32 %.03, %5
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %.critedge.loopexit, label %12

.critedge.loopexit:                               ; preds = %12, %16
  %.lcssa.ph = phi i32 [ 0, %12 ], [ 1, %16 ]
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %.preheader
  %.lcssa = phi i32 [ 1, %.preheader ], [ %.lcssa.ph, %.critedge.loopexit ]
  ret i32 %.lcssa
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvDecodeTile(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = tail call i32 @TIFFTileRowSize(%struct.tiff* %0) #9
  %6 = srem i32 %2, %5
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %.preheader, label %11

.preheader:                                       ; preds = %4
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 26
  %9 = icmp eq i32 %2, 0
  br i1 %9, label %.critedge, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader
  %10 = sext i32 %5 to i64
  br label %12

; <label>:11:                                     ; preds = %4
  tail call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.17, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 340, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__PRETTY_FUNCTION__.LogLuvDecodeTile, i64 0, i64 0)) #8
  unreachable

; <label>:12:                                     ; preds = %.lr.ph, %16
  %.03 = phi i32 [ %2, %.lr.ph ], [ %18, %16 ]
  %.012 = phi i8* [ %1, %.lr.ph ], [ %17, %16 ]
  %13 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %8, align 8
  %14 = tail call i32 %13(%struct.tiff* %0, i8* %.012, i32 %5, i16 zeroext %3) #9
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %.critedge.loopexit, label %16

; <label>:16:                                     ; preds = %12
  %17 = getelementptr inbounds i8, i8* %.012, i64 %10
  %18 = sub nsw i32 %.03, %5
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %.critedge.loopexit, label %12

.critedge.loopexit:                               ; preds = %12, %16
  %.lcssa.ph = phi i32 [ 0, %12 ], [ 1, %16 ]
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %.preheader
  %.lcssa = phi i32 [ 1, %.preheader ], [ %.lcssa.ph, %.critedge.loopexit ]
  ret i32 %.lcssa
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvSetupEncode(%struct.tiff* nocapture) #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %3 = bitcast i8** %2 to %struct.logLuvState**
  %4 = load %struct.logLuvState*, %struct.logLuvState** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 11
  %6 = load i16, i16* %5, align 2
  switch i16 %6, label %38 [
    i16 -32691, label %7
    i16 -32692, label %29
  ]

; <label>:7:                                      ; preds = %1
  %8 = tail call fastcc i32 @LogLuvInitState(%struct.tiff* nonnull %0)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %48, label %10

; <label>:10:                                     ; preds = %7
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 10
  %12 = load i16, i16* %11, align 8
  %13 = icmp eq i16 %12, -30859
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 27
  br i1 %13, label %15, label %22

; <label>:15:                                     ; preds = %10
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvEncode24, i32 (%struct.tiff*, i8*, i32, i16)** %14, align 8
  %16 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %4, i64 0, i32 0
  %17 = load i32, i32* %16, align 8
  switch i32 %17, label %42 [
    i32 0, label %18
    i32 1, label %20
    i32 2, label %48
  ]

; <label>:18:                                     ; preds = %15
  %19 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %4, i64 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @Luv24fromXYZ, void (%struct.logLuvState*, i8*, i32)** %19, align 8
  br label %48

; <label>:20:                                     ; preds = %15
  %21 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %4, i64 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @Luv24fromLuv48, void (%struct.logLuvState*, i8*, i32)** %21, align 8
  br label %48

; <label>:22:                                     ; preds = %10
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvEncode32, i32 (%struct.tiff*, i8*, i32, i16)** %14, align 8
  %23 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %4, i64 0, i32 0
  %24 = load i32, i32* %23, align 8
  switch i32 %24, label %42 [
    i32 0, label %25
    i32 1, label %27
    i32 2, label %48
  ]

; <label>:25:                                     ; preds = %22
  %26 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %4, i64 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @Luv32fromXYZ, void (%struct.logLuvState*, i8*, i32)** %26, align 8
  br label %48

; <label>:27:                                     ; preds = %22
  %28 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %4, i64 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @Luv32fromLuv48, void (%struct.logLuvState*, i8*, i32)** %28, align 8
  br label %48

; <label>:29:                                     ; preds = %1
  %30 = tail call fastcc i32 @LogL16InitState(%struct.tiff* nonnull %0)
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %48, label %32

; <label>:32:                                     ; preds = %29
  %33 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 27
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogL16Encode, i32 (%struct.tiff*, i8*, i32, i16)** %33, align 8
  %34 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %4, i64 0, i32 0
  %35 = load i32, i32* %34, align 8
  switch i32 %35, label %42 [
    i32 0, label %36
    i32 1, label %48
  ]

; <label>:36:                                     ; preds = %32
  %37 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %4, i64 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @L16fromY, void (%struct.logLuvState*, i8*, i32)** %37, align 8
  br label %48

; <label>:38:                                     ; preds = %1
  %39 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %40 = load i8*, i8** %39, align 8
  %41 = zext i16 %6 to i32
  tail call void (i8*, i8*, ...) @TIFFError(i8* %40, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.3, i64 0, i64 0), i32 %41, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.4, i64 0, i64 0)) #9
  br label %48

; <label>:42:                                     ; preds = %32, %22, %15
  %43 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %44 = load i8*, i8** %43, align 8
  %45 = load i16, i16* %5, align 2
  %46 = icmp eq i16 %45, -32692
  %47 = select i1 %46, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.20, i64 0, i64 0)
  tail call void (i8*, i8*, ...) @TIFFError(i8* %44, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.18, i64 0, i64 0), i8* %47) #9
  br label %48

; <label>:48:                                     ; preds = %38, %7, %25, %27, %22, %18, %20, %15, %29, %32, %36, %42
  %.0 = phi i32 [ 0, %42 ], [ 1, %36 ], [ 1, %32 ], [ 1, %29 ], [ 1, %15 ], [ 1, %20 ], [ 1, %18 ], [ 1, %22 ], [ 1, %27 ], [ 1, %25 ], [ 1, %7 ], [ 1, %38 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvEncodeStrip(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = tail call i32 @TIFFScanlineSize(%struct.tiff* %0) #9
  %6 = srem i32 %2, %5
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %.preheader, label %11

.preheader:                                       ; preds = %4
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 27
  %9 = icmp eq i32 %2, 0
  br i1 %9, label %.critedge, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader
  %10 = sext i32 %5 to i64
  br label %12

; <label>:11:                                     ; preds = %4
  tail call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.17, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 577, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @__PRETTY_FUNCTION__.LogLuvEncodeStrip, i64 0, i64 0)) #8
  unreachable

; <label>:12:                                     ; preds = %.lr.ph, %16
  %.03 = phi i32 [ %2, %.lr.ph ], [ %18, %16 ]
  %.012 = phi i8* [ %1, %.lr.ph ], [ %17, %16 ]
  %13 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %8, align 8
  %14 = tail call i32 %13(%struct.tiff* %0, i8* %.012, i32 %5, i16 zeroext %3) #9
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %.critedge.loopexit

; <label>:16:                                     ; preds = %12
  %17 = getelementptr inbounds i8, i8* %.012, i64 %10
  %18 = sub nsw i32 %.03, %5
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %.critedge.loopexit, label %12

.critedge.loopexit:                               ; preds = %16, %12
  %.lcssa.ph = phi i32 [ 1, %16 ], [ 0, %12 ]
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %.preheader
  %.lcssa = phi i32 [ 1, %.preheader ], [ %.lcssa.ph, %.critedge.loopexit ]
  ret i32 %.lcssa
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvEncodeTile(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = tail call i32 @TIFFTileRowSize(%struct.tiff* %0) #9
  %6 = srem i32 %2, %5
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %.preheader, label %11

.preheader:                                       ; preds = %4
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 27
  %9 = icmp eq i32 %2, 0
  br i1 %9, label %.critedge, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader
  %10 = sext i32 %5 to i64
  br label %12

; <label>:11:                                     ; preds = %4
  tail call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.17, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 592, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__PRETTY_FUNCTION__.LogLuvEncodeTile, i64 0, i64 0)) #8
  unreachable

; <label>:12:                                     ; preds = %.lr.ph, %16
  %.03 = phi i32 [ %2, %.lr.ph ], [ %18, %16 ]
  %.012 = phi i8* [ %1, %.lr.ph ], [ %17, %16 ]
  %13 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %8, align 8
  %14 = tail call i32 %13(%struct.tiff* %0, i8* %.012, i32 %5, i16 zeroext %3) #9
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %.critedge.loopexit

; <label>:16:                                     ; preds = %12
  %17 = getelementptr inbounds i8, i8* %.012, i64 %10
  %18 = sub nsw i32 %.03, %5
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %.critedge.loopexit, label %12

.critedge.loopexit:                               ; preds = %16, %12
  %.lcssa.ph = phi i32 [ 1, %16 ], [ 0, %12 ]
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %.preheader
  %.lcssa = phi i32 [ 1, %.preheader ], [ %.lcssa.ph, %.critedge.loopexit ]
  ret i32 %.lcssa
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @LogLuvClose(%struct.tiff* nocapture) #5 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 11
  %3 = load i16, i16* %2, align 2
  %4 = icmp eq i16 %3, -32692
  %5 = select i1 %4, i16 1, i16 3
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  store i16 %5, i16* %6, align 2
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  store i16 16, i16* %7, align 4
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 9
  store i16 2, i16* %8, align 2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @LogLuvCleanup(%struct.tiff* nocapture) #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %3 = bitcast i8** %2 to %struct.logLuvState**
  %4 = load %struct.logLuvState*, %struct.logLuvState** %3, align 8
  %5 = icmp eq %struct.logLuvState* %4, null
  br i1 %5, label %15, label %6

; <label>:6:                                      ; preds = %1
  %7 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %4, i64 0, i32 2
  %8 = load i8**, i8*** %7, align 8
  %9 = icmp eq i8** %8, null
  br i1 %9, label %13, label %10

; <label>:10:                                     ; preds = %6
  %11 = bitcast i8*** %7 to i8**
  %12 = load i8*, i8** %11, align 8
  tail call void @_TIFFfree(i8* %12) #9
  br label %13

; <label>:13:                                     ; preds = %6, %10
  %14 = bitcast %struct.logLuvState* %4 to i8*
  tail call void @_TIFFfree(i8* %14) #9
  store i8* null, i8** %2, align 8
  br label %15

; <label>:15:                                     ; preds = %1, %13
  ret void
}

declare void @_TIFFMergeFieldInfo(%struct.tiff*, %struct.TIFFFieldInfo*, i32) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvVGetField(%struct.tiff*, i32, %struct.__va_list_tag*) #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %5 = bitcast i8** %4 to %struct.logLuvState**
  %6 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %cond = icmp eq i32 %1, 65560
  br i1 %cond, label %7, label %26

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %6, i64 0, i32 0
  %9 = load i32, i32* %8, align 8
  %10 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %11 = load i32, i32* %10, align 8
  %12 = icmp ult i32 %11, 41
  br i1 %12, label %13, label %19

; <label>:13:                                     ; preds = %7
  %14 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %15 = load i8*, i8** %14, align 8
  %16 = sext i32 %11 to i64
  %17 = getelementptr i8, i8* %15, i64 %16
  %18 = add i32 %11, 8
  store i32 %18, i32* %10, align 8
  br label %23

; <label>:19:                                     ; preds = %7
  %20 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %21 = load i8*, i8** %20, align 8
  %22 = getelementptr i8, i8* %21, i64 8
  store i8* %22, i8** %20, align 8
  br label %23

; <label>:23:                                     ; preds = %19, %13
  %.in = phi i8* [ %17, %13 ], [ %21, %19 ]
  %24 = bitcast i8* %.in to i32**
  %25 = load i32*, i32** %24, align 8
  store i32 %9, i32* %25, align 4
  br label %30

; <label>:26:                                     ; preds = %3
  %27 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %6, i64 0, i32 5
  %28 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %27, align 8
  %29 = tail call i32 %28(%struct.tiff* nonnull %0, i32 %1, %struct.__va_list_tag* %2) #9
  br label %30

; <label>:30:                                     ; preds = %26, %23
  %.0 = phi i32 [ %29, %26 ], [ 1, %23 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvVSetField(%struct.tiff*, i32, %struct.__va_list_tag*) #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %5 = bitcast i8** %4 to %struct.logLuvState**
  %6 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %cond = icmp eq i32 %1, 65560
  br i1 %cond, label %7, label %37

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %9 = load i32, i32* %8, align 8
  %10 = icmp ult i32 %9, 41
  br i1 %10, label %11, label %17

; <label>:11:                                     ; preds = %7
  %12 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %13 = load i8*, i8** %12, align 8
  %14 = sext i32 %9 to i64
  %15 = getelementptr i8, i8* %13, i64 %14
  %16 = add i32 %9, 8
  store i32 %16, i32* %8, align 8
  br label %21

; <label>:17:                                     ; preds = %7
  %18 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %19 = load i8*, i8** %18, align 8
  %20 = getelementptr i8, i8* %19, i64 8
  store i8* %20, i8** %18, align 8
  br label %21

; <label>:21:                                     ; preds = %17, %11
  %.in = phi i8* [ %15, %11 ], [ %19, %17 ]
  %22 = bitcast i8* %.in to i32*
  %23 = load i32, i32* %22, align 4
  %24 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %6, i64 0, i32 0
  store i32 %23, i32* %24, align 8
  %25 = icmp ult i32 %23, 4
  br i1 %25, label %switch.lookup, label %26

; <label>:26:                                     ; preds = %21
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %28 = load i8*, i8** %27, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %28, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.22, i64 0, i64 0), i32 %23) #9
  br label %41

switch.lookup:                                    ; preds = %21
  %29 = sext i32 %23 to i64
  %switch.gep = getelementptr inbounds [4 x i32], [4 x i32]* @switch.table, i64 0, i64 %29
  %switch.load = load i32, i32* %switch.gep, align 4
  %30 = sext i32 %23 to i64
  %switch.gep3 = getelementptr inbounds [4 x i32], [4 x i32]* @switch.table.1, i64 0, i64 %30
  %switch.load4 = load i32, i32* %switch.gep3, align 4
  %31 = tail call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %0, i32 258, i32 %switch.load) #9
  %32 = tail call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %0, i32 339, i32 %switch.load4) #9
  %33 = tail call i32 @TIFFTileSize(%struct.tiff* nonnull %0) #9
  %34 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 20
  store i32 %33, i32* %34, align 4
  %35 = tail call i32 @TIFFScanlineSize(%struct.tiff* nonnull %0) #9
  %36 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 38
  store i32 %35, i32* %36, align 8
  br label %41

; <label>:37:                                     ; preds = %3
  %38 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %6, i64 0, i32 6
  %39 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %38, align 8
  %40 = tail call i32 %39(%struct.tiff* nonnull %0, i32 %1, %struct.__va_list_tag* %2) #9
  br label %41

; <label>:41:                                     ; preds = %37, %switch.lookup, %26
  %.0 = phi i32 [ %40, %37 ], [ 0, %26 ], [ 1, %switch.lookup ]
  ret i32 %.0
}

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #2

declare void @_TIFFNoPostDecode(%struct.tiff*, i8*, i32) #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @LogLuvInitState(%struct.tiff* nocapture readonly) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %4 = bitcast i8** %3 to %struct.logLuvState**
  %5 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %6 = icmp eq %struct.logLuvState* %5, null
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %1
  tail call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 1115, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__PRETTY_FUNCTION__.LogLuvInitState, i64 0, i64 0)) #8
  unreachable

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 11
  %10 = load i16, i16* %9, align 2
  %11 = icmp eq i16 %10, -32691
  br i1 %11, label %13, label %12

; <label>:12:                                     ; preds = %8
  tail call void @__assert_fail(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 1116, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__PRETTY_FUNCTION__.LogLuvInitState, i64 0, i64 0)) #8
  unreachable

; <label>:13:                                     ; preds = %8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %15 = load i16, i16* %14, align 2
  %16 = icmp eq i16 %15, 1
  br i1 %16, label %18, label %17

; <label>:17:                                     ; preds = %13
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @LogLuvInitState.module, i64 0, i64 0), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.7, i64 0, i64 0)) #9
  br label %47

; <label>:18:                                     ; preds = %13
  %19 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %5, i64 0, i32 0
  %20 = load i32, i32* %19, align 8
  %21 = icmp eq i32 %20, -1
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %18
  %23 = tail call fastcc i32 @LogLuvGuessDataFmt(%struct.TIFFDirectory* nonnull %2)
  store i32 %23, i32* %19, align 8
  br label %24

; <label>:24:                                     ; preds = %22, %18
  %25 = phi i32 [ %23, %22 ], [ %20, %18 ]
  %26 = icmp ult i32 %25, 4
  br i1 %26, label %switch.lookup, label %27

; <label>:27:                                     ; preds = %24
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %29 = load i8*, i8** %28, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %29, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.8, i64 0, i64 0)) #9
  br label %47

switch.lookup:                                    ; preds = %24
  %30 = sext i32 %25 to i64
  %switch.gep = getelementptr inbounds [4 x i32], [4 x i32]* @switch.table.2, i64 0, i64 %30
  %switch.load = load i32, i32* %switch.gep, align 4
  %31 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %5, i64 0, i32 1
  store i32 %switch.load, i32* %31, align 4
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  %33 = load i32, i32* %32, align 8
  %34 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %35 = load i32, i32* %34, align 4
  %36 = mul i32 %35, %33
  %37 = trunc i32 %36 to i16
  %38 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %5, i64 0, i32 3
  store i16 %37, i16* %38, align 8
  %sext = shl i32 %36, 16
  %39 = ashr exact i32 %sext, 14
  %40 = tail call i8* @_TIFFmalloc(i32 %39) #9
  %41 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %5, i64 0, i32 2
  %42 = bitcast i8*** %41 to i8**
  store i8* %40, i8** %42, align 8
  %43 = icmp eq i8* %40, null
  br i1 %43, label %44, label %47

; <label>:44:                                     ; preds = %switch.lookup
  %45 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %46 = load i8*, i8** %45, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @LogLuvInitState.module, i64 0, i64 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.9, i64 0, i64 0), i8* %46) #9
  br label %47

; <label>:47:                                     ; preds = %switch.lookup, %44, %27, %17
  %.0 = phi i32 [ 0, %17 ], [ 0, %27 ], [ 0, %44 ], [ 1, %switch.lookup ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvDecode24(%struct.tiff* nocapture, i8*, i32, i16 zeroext) #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %6 = bitcast i8** %5 to %struct.logLuvState**
  %7 = load %struct.logLuvState*, %struct.logLuvState** %6, align 8
  %8 = icmp eq i16 %3, 0
  br i1 %8, label %10, label %9

; <label>:9:                                      ; preds = %4
  tail call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 224, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvDecode24, i64 0, i64 0)) #8
  unreachable

; <label>:10:                                     ; preds = %4
  %11 = icmp eq %struct.logLuvState* %7, null
  br i1 %11, label %12, label %13

; <label>:12:                                     ; preds = %10
  tail call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 225, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvDecode24, i64 0, i64 0)) #8
  unreachable

; <label>:13:                                     ; preds = %10
  %14 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 1
  %15 = load i32, i32* %14, align 4
  %16 = sdiv i32 %2, %15
  %17 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 0
  %18 = load i32, i32* %17, align 8
  %19 = icmp eq i32 %18, 2
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %13
  %21 = bitcast i8* %1 to i32*
  br label %33

; <label>:22:                                     ; preds = %13
  %23 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 3
  %24 = load i16, i16* %23, align 8
  %25 = sext i16 %24 to i32
  %26 = icmp slt i32 %25, %16
  br i1 %26, label %27, label %28

; <label>:27:                                     ; preds = %22
  tail call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 232, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvDecode24, i64 0, i64 0)) #8
  unreachable

; <label>:28:                                     ; preds = %22
  %29 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 2
  %30 = bitcast i8*** %29 to i32**
  %31 = load i32*, i32** %30, align 8
  %32 = bitcast i32* %31 to i8*
  br label %33

; <label>:33:                                     ; preds = %28, %20
  %34 = phi i8* [ %1, %20 ], [ %32, %28 ]
  %.01 = phi i32* [ %21, %20 ], [ %31, %28 ]
  %35 = shl i32 %16, 2
  tail call void @_TIFFmemset(i8* %34, i32 0, i32 %35) #9
  %36 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %37 = load i8*, i8** %36, align 8
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %39 = load i32, i32* %38, align 8
  %40 = icmp sgt i32 %16, 0
  %41 = icmp sgt i32 %39, 0
  %.5 = and i1 %41, %40
  br i1 %.5, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %33
  %42 = sext i32 %16 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph ]
  %.028 = phi i8* [ %37, %.lr.ph.preheader ], [ %57, %.lr.ph ]
  %.046 = phi i32 [ %39, %.lr.ph.preheader ], [ %56, %.lr.ph ]
  %43 = load i8, i8* %.028, align 1
  %44 = zext i8 %43 to i32
  %45 = shl nuw nsw i32 %44, 16
  %46 = getelementptr inbounds i8, i8* %.028, i64 1
  %47 = load i8, i8* %46, align 1
  %48 = zext i8 %47 to i32
  %49 = shl nuw nsw i32 %48, 8
  %50 = or i32 %49, %45
  %51 = getelementptr inbounds i8, i8* %.028, i64 2
  %52 = load i8, i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = or i32 %50, %53
  %55 = getelementptr inbounds i32, i32* %.01, i64 %indvars.iv
  store i32 %54, i32* %55, align 4
  %56 = add nsw i32 %.046, -3
  %57 = getelementptr inbounds i8, i8* %.028, i64 3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %58 = icmp sgt i64 %42, %indvars.iv.next
  %59 = icmp sgt i32 %.046, 3
  %. = and i1 %59, %58
  br i1 %., label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  %60 = trunc i64 %indvars.iv.next to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %33
  %.04.lcssa = phi i32 [ %39, %33 ], [ %56, %._crit_edge.loopexit ]
  %.03.lcssa = phi i32 [ 0, %33 ], [ %60, %._crit_edge.loopexit ]
  %.02.lcssa = phi i8* [ %37, %33 ], [ %57, %._crit_edge.loopexit ]
  store i8* %.02.lcssa, i8** %36, align 8
  store i32 %.04.lcssa, i32* %38, align 8
  %61 = icmp eq i32 %16, %.03.lcssa
  br i1 %61, label %68, label %62

; <label>:62:                                     ; preds = %._crit_edge
  %63 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %64 = load i8*, i8** %63, align 8
  %65 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %66 = load i32, i32* %65, align 8
  %67 = sub nsw i32 %16, %.03.lcssa
  tail call void (i8*, i8*, ...) @TIFFError(i8* %64, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.12, i64 0, i64 0), i32 %66, i32 %67) #9
  br label %71

; <label>:68:                                     ; preds = %._crit_edge
  %69 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 4
  %70 = load void (%struct.logLuvState*, i8*, i32)*, void (%struct.logLuvState*, i8*, i32)** %69, align 8
  tail call void %70(%struct.logLuvState* nonnull %7, i8* %1, i32 %16) #9
  br label %71

; <label>:71:                                     ; preds = %68, %62
  %.0 = phi i32 [ 0, %62 ], [ 1, %68 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal void @Luv24toXYZ(%struct.logLuvState* nocapture readonly, i8* nocapture, i32) #0 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %5 = bitcast i8* %1 to float*
  %6 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %0, i64 0, i32 2
  %7 = bitcast i8*** %6 to i32**
  %8 = load i32*, i32** %7, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.05 = phi float* [ %11, %.lr.ph ], [ %5, %.lr.ph.preheader ]
  %.014 = phi i32* [ %12, %.lr.ph ], [ %8, %.lr.ph.preheader ]
  %.023 = phi i32 [ %9, %.lr.ph ], [ %2, %.lr.ph.preheader ]
  %9 = add nsw i32 %.023, -1
  %10 = load i32, i32* %.014, align 4
  tail call fastcc void @pix24toXYZ(i32 %10, float* %.05)
  %11 = getelementptr inbounds float, float* %.05, i64 3
  %12 = getelementptr inbounds i32, i32* %.014, i64 1
  %13 = icmp sgt i32 %.023, 1
  br i1 %13, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @Luv24toLuv48(%struct.logLuvState* nocapture readonly, i8* nocapture, i32) #5 {
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = icmp sgt i32 %2, 0
  br i1 %6, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %7 = bitcast i8* %1 to i16*
  %8 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %0, i64 0, i32 2
  %9 = bitcast i8*** %8 to i32**
  %10 = load i32*, i32** %9, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %23
  %.in = phi i32 [ %11, %23 ], [ %2, %.lr.ph.preheader ]
  %.04 = phi i16* [ %31, %23 ], [ %7, %.lr.ph.preheader ]
  %.013 = phi i32* [ %32, %23 ], [ %10, %.lr.ph.preheader ]
  %11 = add nsw i32 %.in, -1
  %12 = load i32, i32* %.013, align 4
  %13 = lshr i32 %12, 12
  %14 = and i32 %13, 4093
  %15 = add nuw nsw i32 %14, 13314
  %16 = trunc i32 %15 to i16
  %17 = getelementptr inbounds i16, i16* %.04, i64 1
  store i16 %16, i16* %.04, align 2
  %18 = load i32, i32* %.013, align 4
  %19 = and i32 %18, 16383
  %20 = call fastcc i32 @uv_decode(double* nonnull %4, double* nonnull %5, i32 %19)
  %21 = icmp slt i32 %20, 0
  br i1 %21, label %22, label %23

; <label>:22:                                     ; preds = %.lr.ph
  store double 0x3FCAF286BD156C1A, double* %4, align 8
  store double 0x3FDE50D794B8199E, double* %5, align 8
  br label %23

; <label>:23:                                     ; preds = %22, %.lr.ph
  %24 = load double, double* %4, align 8
  %25 = fmul double %24, 3.276800e+04
  %26 = fptosi double %25 to i16
  %27 = getelementptr inbounds i16, i16* %.04, i64 2
  store i16 %26, i16* %17, align 2
  %28 = load double, double* %5, align 8
  %29 = fmul double %28, 3.276800e+04
  %30 = fptosi double %29 to i16
  %31 = getelementptr inbounds i16, i16* %.04, i64 3
  store i16 %30, i16* %27, align 2
  %32 = getelementptr inbounds i32, i32* %.013, i64 1
  %33 = icmp sgt i32 %.in, 1
  br i1 %33, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %23
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Luv24toRGB(%struct.logLuvState* nocapture readonly, i8* nocapture, i32) #0 {
  %4 = alloca [3 x float], align 4
  %5 = icmp sgt i32 %2, 0
  br i1 %5, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  %6 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %0, i64 0, i32 2
  %7 = bitcast i8*** %6 to i32**
  %8 = load i32*, i32** %7, align 8
  %9 = getelementptr inbounds [3 x float], [3 x float]* %4, i64 0, i64 0
  br label %10

; <label>:10:                                     ; preds = %.lr.ph, %10
  %.05 = phi i8* [ %1, %.lr.ph ], [ %14, %10 ]
  %.014 = phi i32* [ %8, %.lr.ph ], [ %12, %10 ]
  %.023 = phi i32 [ %2, %.lr.ph ], [ %11, %10 ]
  %11 = add nsw i32 %.023, -1
  %12 = getelementptr inbounds i32, i32* %.014, i64 1
  %13 = load i32, i32* %.014, align 4
  call fastcc void @pix24toXYZ(i32 %13, float* nonnull %9)
  call fastcc void @XYZtoRGB24(float* nonnull %9, i8* %.05)
  %14 = getelementptr inbounds i8, i8* %.05, i64 3
  %15 = icmp sgt i32 %.023, 1
  br i1 %15, label %10, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %10
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvDecode32(%struct.tiff* nocapture, i8*, i32, i16 zeroext) #0 {
  %5 = icmp eq i16 %3, 0
  br i1 %5, label %7, label %6

; <label>:6:                                      ; preds = %4
  tail call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 269, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvDecode32, i64 0, i64 0)) #8
  unreachable

; <label>:7:                                      ; preds = %4
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %9 = bitcast i8** %8 to %struct.logLuvState**
  %10 = load %struct.logLuvState*, %struct.logLuvState** %9, align 8
  %11 = icmp eq %struct.logLuvState* %10, null
  br i1 %11, label %12, label %13

; <label>:12:                                     ; preds = %7
  tail call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 271, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvDecode32, i64 0, i64 0)) #8
  unreachable

; <label>:13:                                     ; preds = %7
  %14 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %10, i64 0, i32 1
  %15 = load i32, i32* %14, align 4
  %16 = sdiv i32 %2, %15
  %17 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %10, i64 0, i32 0
  %18 = load i32, i32* %17, align 8
  %19 = icmp eq i32 %18, 2
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %13
  %21 = bitcast i8* %1 to i32*
  br label %33

; <label>:22:                                     ; preds = %13
  %23 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %10, i64 0, i32 3
  %24 = load i16, i16* %23, align 8
  %25 = sext i16 %24 to i32
  %26 = icmp slt i32 %25, %16
  br i1 %26, label %27, label %28

; <label>:27:                                     ; preds = %22
  tail call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 278, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvDecode32, i64 0, i64 0)) #8
  unreachable

; <label>:28:                                     ; preds = %22
  %29 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %10, i64 0, i32 2
  %30 = bitcast i8*** %29 to i32**
  %31 = load i32*, i32** %30, align 8
  %32 = bitcast i32* %31 to i8*
  br label %33

; <label>:33:                                     ; preds = %28, %20
  %34 = phi i8* [ %1, %20 ], [ %32, %28 ]
  %.05 = phi i32* [ %21, %20 ], [ %31, %28 ]
  %35 = shl i32 %16, 2
  tail call void @_TIFFmemset(i8* %34, i32 0, i32 %35) #9
  %36 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %37 = load i8*, i8** %36, align 8
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %39 = load i32, i32* %38, align 8
  %40 = icmp sgt i32 %16, 0
  br i1 %40, label %.split.us.preheader, label %.preheader

.split.us.preheader:                              ; preds = %33
  br label %.split.us

.split.us:                                        ; preds = %.split.us.preheader, %._crit_edge.us
  %.014.us = phi i32 [ %41, %._crit_edge.us ], [ 32, %.split.us.preheader ]
  %.06.us = phi i8* [ %.17.lcssa.us, %._crit_edge.us ], [ %37, %.split.us.preheader ]
  %.02.us = phi i32 [ %.13.lcssa.us, %._crit_edge.us ], [ %39, %.split.us.preheader ]
  %41 = add nsw i32 %.014.us, -8
  %42 = icmp sgt i32 %41, -1
  br i1 %42, label %.preheader.us, label %.us-lcssa.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %.backedge.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.preheader.us
  %.010.lcssa.us = phi i32 [ 0, %.preheader.us ], [ %.010.be.us, %._crit_edge.us.loopexit ]
  %.17.lcssa.us = phi i8* [ %.06.us, %.preheader.us ], [ %.17.be.us, %._crit_edge.us.loopexit ]
  %.13.lcssa.us = phi i32 [ %.02.us, %.preheader.us ], [ %.13.be.us, %._crit_edge.us.loopexit ]
  %43 = icmp eq i32 %16, %.010.lcssa.us
  br i1 %43, label %.split.us, label %.us-lcssa38.us.loopexit

.lr.ph34.us:                                      ; preds = %.lr.ph34.us.preheader, %.backedge.us
  %.1333.us = phi i32 [ %.13.be.us, %.backedge.us ], [ %.02.us, %.lr.ph34.us.preheader ]
  %.1732.us = phi i8* [ %.17.be.us, %.backedge.us ], [ %.06.us, %.lr.ph34.us.preheader ]
  %.01031.us = phi i32 [ %.010.be.us, %.backedge.us ], [ 0, %.lr.ph34.us.preheader ]
  %44 = load i8, i8* %.1732.us, align 1
  %45 = icmp slt i8 %44, 0
  %46 = getelementptr inbounds i8, i8* %.1732.us, i64 1
  br i1 %45, label %67, label %47

; <label>:47:                                     ; preds = %.lr.ph34.us
  %48 = add nsw i32 %.1333.us, -1
  %49 = icmp eq i32 %48, 0
  %50 = icmp ne i8 %44, 0
  %not.1520.us = xor i1 %49, true
  %51 = and i1 %50, %not.1520.us
  br i1 %51, label %.lr.ph.us.preheader, label %.backedge.us

.lr.ph.us.preheader:                              ; preds = %47
  %52 = zext i8 %44 to i32
  %53 = sext i32 %.01031.us to i64
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %.lr.ph.us
  %indvars.iv = phi i64 [ %53, %.lr.ph.us.preheader ], [ %indvars.iv.next, %.lr.ph.us ]
  %54 = phi i1 [ %49, %.lr.ph.us.preheader ], [ %64, %.lr.ph.us ]
  %55 = phi i32 [ %48, %.lr.ph.us.preheader ], [ %63, %.lr.ph.us ]
  %.2823.us = phi i8* [ %46, %.lr.ph.us.preheader ], [ %.28.us, %.lr.ph.us ]
  %.122.us = phi i32 [ %52, %.lr.ph.us.preheader ], [ %.2.us, %.lr.ph.us ]
  %not..us = xor i1 %54, true
  %56 = sext i1 %not..us to i32
  %.2.us = add nsw i32 %56, %.122.us
  %57 = load i8, i8* %.2823.us, align 1
  %58 = zext i8 %57 to i32
  %59 = shl i32 %58, %41
  %indvars.iv.next = add i64 %indvars.iv, 1
  %60 = getelementptr inbounds i32, i32* %.05, i64 %indvars.iv
  %61 = load i32, i32* %60, align 4
  %62 = or i32 %59, %61
  store i32 %62, i32* %60, align 4
  %.28.us = getelementptr inbounds i8, i8* %.2823.us, i64 1
  %63 = add nsw i32 %55, -1
  %64 = icmp eq i32 %63, 0
  %65 = icmp ne i32 %.2.us, 0
  %not.15.us = xor i1 %64, true
  %66 = and i1 %65, %not.15.us
  br i1 %66, label %.lr.ph.us, label %.backedge.us.loopexit39

; <label>:67:                                     ; preds = %.lr.ph34.us
  %68 = zext i8 %44 to i32
  %69 = add nsw i32 %68, -126
  %70 = getelementptr inbounds i8, i8* %.1732.us, i64 2
  %71 = load i8, i8* %46, align 1
  %72 = zext i8 %71 to i32
  %73 = shl i32 %72, %41
  %74 = add nsw i32 %.1333.us, -2
  %75 = icmp eq i32 %69, 0
  br i1 %75, label %.backedge.us, label %.lr.ph28.us.preheader

.lr.ph28.us.preheader:                            ; preds = %67
  %76 = sext i32 %.01031.us to i64
  %77 = add nsw i32 %68, -127
  %xtraiter = and i32 %69, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph28.us.prol.loopexit, label %.lr.ph28.us.prol.preheader

.lr.ph28.us.prol.preheader:                       ; preds = %.lr.ph28.us.preheader
  br label %.lr.ph28.us.prol

.lr.ph28.us.prol:                                 ; preds = %.lr.ph28.us.prol.preheader, %.lr.ph28.us.prol
  %indvars.iv46.prol = phi i64 [ %indvars.iv.next47.prol, %.lr.ph28.us.prol ], [ %76, %.lr.ph28.us.prol.preheader ]
  %.0127.us.prol = phi i32 [ %78, %.lr.ph28.us.prol ], [ %69, %.lr.ph28.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph28.us.prol ], [ %xtraiter, %.lr.ph28.us.prol.preheader ]
  %78 = add nsw i32 %.0127.us.prol, -1
  %indvars.iv.next47.prol = add nsw i64 %indvars.iv46.prol, 1
  %79 = getelementptr inbounds i32, i32* %.05, i64 %indvars.iv46.prol
  %80 = load i32, i32* %79, align 4
  %81 = or i32 %80, %73
  store i32 %81, i32* %79, align 4
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph28.us.prol.loopexit.loopexit, label %.lr.ph28.us.prol, !llvm.loop !1

.lr.ph28.us.prol.loopexit.loopexit:               ; preds = %.lr.ph28.us.prol
  br label %.lr.ph28.us.prol.loopexit

.lr.ph28.us.prol.loopexit:                        ; preds = %.lr.ph28.us.prol.loopexit.loopexit, %.lr.ph28.us.preheader
  %indvars.iv46.unr = phi i64 [ %76, %.lr.ph28.us.preheader ], [ %indvars.iv.next47.prol, %.lr.ph28.us.prol.loopexit.loopexit ]
  %.0127.us.unr = phi i32 [ %69, %.lr.ph28.us.preheader ], [ %78, %.lr.ph28.us.prol.loopexit.loopexit ]
  %82 = icmp ult i32 %77, 3
  br i1 %82, label %.backedge.us.loopexit, label %.lr.ph28.us.preheader56

.lr.ph28.us.preheader56:                          ; preds = %.lr.ph28.us.prol.loopexit
  br label %.lr.ph28.us

.lr.ph28.us:                                      ; preds = %.lr.ph28.us.preheader56, %.lr.ph28.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.3, %.lr.ph28.us ], [ %indvars.iv46.unr, %.lr.ph28.us.preheader56 ]
  %.0127.us = phi i32 [ %92, %.lr.ph28.us ], [ %.0127.us.unr, %.lr.ph28.us.preheader56 ]
  %indvars.iv.next47 = add nsw i64 %indvars.iv46, 1
  %83 = getelementptr inbounds i32, i32* %.05, i64 %indvars.iv46
  %84 = load i32, i32* %83, align 4
  %85 = or i32 %84, %73
  store i32 %85, i32* %83, align 4
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %86 = getelementptr inbounds i32, i32* %.05, i64 %indvars.iv.next47
  %87 = load i32, i32* %86, align 4
  %88 = or i32 %87, %73
  store i32 %88, i32* %86, align 4
  %indvars.iv.next47.2 = add nsw i64 %indvars.iv46, 3
  %89 = getelementptr inbounds i32, i32* %.05, i64 %indvars.iv.next47.1
  %90 = load i32, i32* %89, align 4
  %91 = or i32 %90, %73
  store i32 %91, i32* %89, align 4
  %92 = add nsw i32 %.0127.us, -4
  %indvars.iv.next47.3 = add nsw i64 %indvars.iv46, 4
  %93 = getelementptr inbounds i32, i32* %.05, i64 %indvars.iv.next47.2
  %94 = load i32, i32* %93, align 4
  %95 = or i32 %94, %73
  store i32 %95, i32* %93, align 4
  %96 = icmp eq i32 %92, 0
  br i1 %96, label %.backedge.us.loopexit.loopexit, label %.lr.ph28.us

.preheader.us:                                    ; preds = %.split.us
  %97 = icmp sgt i32 %.02.us, 0
  br i1 %97, label %.lr.ph34.us.preheader, label %._crit_edge.us

.lr.ph34.us.preheader:                            ; preds = %.preheader.us
  br label %.lr.ph34.us

.backedge.us.loopexit.loopexit:                   ; preds = %.lr.ph28.us
  br label %.backedge.us.loopexit

.backedge.us.loopexit:                            ; preds = %.backedge.us.loopexit.loopexit, %.lr.ph28.us.prol.loopexit
  %98 = add i32 %.01031.us, 1
  %99 = add i32 %98, %77
  br label %.backedge.us

.backedge.us.loopexit39:                          ; preds = %.lr.ph.us
  %100 = trunc i64 %indvars.iv.next to i32
  br label %.backedge.us

.backedge.us:                                     ; preds = %.backedge.us.loopexit39, %.backedge.us.loopexit, %47, %67
  %.010.be.us = phi i32 [ %.01031.us, %67 ], [ %.01031.us, %47 ], [ %99, %.backedge.us.loopexit ], [ %100, %.backedge.us.loopexit39 ]
  %.17.be.us = phi i8* [ %70, %67 ], [ %46, %47 ], [ %70, %.backedge.us.loopexit ], [ %.28.us, %.backedge.us.loopexit39 ]
  %.13.be.us = phi i32 [ %74, %67 ], [ %48, %47 ], [ %74, %.backedge.us.loopexit ], [ %63, %.backedge.us.loopexit39 ]
  %101 = icmp sgt i32 %16, %.010.be.us
  %102 = icmp sgt i32 %.13.be.us, 0
  %..us = and i1 %101, %102
  br i1 %..us, label %.lr.ph34.us, label %._crit_edge.us.loopexit

.preheader:                                       ; preds = %33
  %103 = icmp eq i32 %16, 0
  br i1 %103, label %.us-lcssa.us, label %.us-lcssa38.us

.us-lcssa38.us.loopexit:                          ; preds = %._crit_edge.us
  br label %.us-lcssa38.us

.us-lcssa38.us:                                   ; preds = %.us-lcssa38.us.loopexit, %.preheader
  %.010.lcssa.lcssa = phi i32 [ 0, %.preheader ], [ %.010.lcssa.us, %.us-lcssa38.us.loopexit ]
  %.17.lcssa.lcssa = phi i8* [ %37, %.preheader ], [ %.17.lcssa.us, %.us-lcssa38.us.loopexit ]
  %.13.lcssa.lcssa = phi i32 [ %39, %.preheader ], [ %.13.lcssa.us, %.us-lcssa38.us.loopexit ]
  %104 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %105 = load i8*, i8** %104, align 8
  %106 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %107 = load i32, i32* %106, align 8
  %108 = sub nsw i32 %16, %.010.lcssa.lcssa
  tail call void (i8*, i8*, ...) @TIFFError(i8* %105, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.13, i64 0, i64 0), i32 %107, i32 %108) #9
  br label %111

.us-lcssa.us.loopexit:                            ; preds = %.split.us
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit, %.preheader
  %.06.lcssa = phi i8* [ %37, %.preheader ], [ %.06.us, %.us-lcssa.us.loopexit ]
  %.02.lcssa = phi i32 [ %39, %.preheader ], [ %.02.us, %.us-lcssa.us.loopexit ]
  %109 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %10, i64 0, i32 4
  %110 = load void (%struct.logLuvState*, i8*, i32)*, void (%struct.logLuvState*, i8*, i32)** %109, align 8
  tail call void %110(%struct.logLuvState* nonnull %10, i8* %1, i32 %16) #9
  br label %111

; <label>:111:                                    ; preds = %.us-lcssa.us, %.us-lcssa38.us
  %.06.sink = phi i8* [ %.06.lcssa, %.us-lcssa.us ], [ %.17.lcssa.lcssa, %.us-lcssa38.us ]
  %.02.sink = phi i32 [ %.02.lcssa, %.us-lcssa.us ], [ %.13.lcssa.lcssa, %.us-lcssa38.us ]
  %.0 = phi i32 [ 1, %.us-lcssa.us ], [ 0, %.us-lcssa38.us ]
  store i8* %.06.sink, i8** %36, align 8
  store i32 %.02.sink, i32* %38, align 8
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal void @Luv32toXYZ(%struct.logLuvState* nocapture readonly, i8* nocapture, i32) #0 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %5 = bitcast i8* %1 to float*
  %6 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %0, i64 0, i32 2
  %7 = bitcast i8*** %6 to i32**
  %8 = load i32*, i32** %7, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.05 = phi float* [ %12, %.lr.ph ], [ %5, %.lr.ph.preheader ]
  %.014 = phi i32* [ %10, %.lr.ph ], [ %8, %.lr.ph.preheader ]
  %.023 = phi i32 [ %9, %.lr.ph ], [ %2, %.lr.ph.preheader ]
  %9 = add nsw i32 %.023, -1
  %10 = getelementptr inbounds i32, i32* %.014, i64 1
  %11 = load i32, i32* %.014, align 4
  tail call fastcc void @pix32toXYZ(i32 %11, float* %.05)
  %12 = getelementptr inbounds float, float* %.05, i64 3
  %13 = icmp sgt i32 %.023, 1
  br i1 %13, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @Luv32toLuv48(%struct.logLuvState* nocapture readonly, i8* nocapture, i32) #5 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %5 = bitcast i8* %1 to i16*
  %6 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %0, i64 0, i32 2
  %7 = bitcast i8*** %6 to i32**
  %8 = load i32*, i32** %7, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.05 = phi i16* [ %29, %.lr.ph ], [ %5, %.lr.ph.preheader ]
  %.014 = phi i32* [ %30, %.lr.ph ], [ %8, %.lr.ph.preheader ]
  %.023 = phi i32 [ %9, %.lr.ph ], [ %2, %.lr.ph.preheader ]
  %9 = add nsw i32 %.023, -1
  %10 = load i32, i32* %.014, align 4
  %11 = lshr i32 %10, 16
  %12 = trunc i32 %11 to i16
  %13 = getelementptr inbounds i16, i16* %.05, i64 1
  store i16 %12, i16* %.05, align 2
  %14 = load i32, i32* %.014, align 4
  %15 = lshr i32 %14, 8
  %16 = and i32 %15, 255
  %17 = uitofp i32 %16 to double
  %18 = fadd double %17, 5.000000e-01
  %19 = fmul double %18, 0x3F63FB013FB013FB
  %20 = and i32 %14, 255
  %21 = uitofp i32 %20 to double
  %22 = fadd double %21, 5.000000e-01
  %23 = fmul double %22, 0x3F63FB013FB013FB
  %24 = fmul double %19, 3.276800e+04
  %25 = fptosi double %24 to i16
  %26 = getelementptr inbounds i16, i16* %.05, i64 2
  store i16 %25, i16* %13, align 2
  %27 = fmul double %23, 3.276800e+04
  %28 = fptosi double %27 to i16
  %29 = getelementptr inbounds i16, i16* %.05, i64 3
  store i16 %28, i16* %26, align 2
  %30 = getelementptr inbounds i32, i32* %.014, i64 1
  %31 = icmp sgt i32 %.023, 1
  br i1 %31, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Luv32toRGB(%struct.logLuvState* nocapture readonly, i8* nocapture, i32) #0 {
  %4 = alloca [3 x float], align 4
  %5 = icmp sgt i32 %2, 0
  br i1 %5, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  %6 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %0, i64 0, i32 2
  %7 = bitcast i8*** %6 to i32**
  %8 = load i32*, i32** %7, align 8
  %9 = getelementptr inbounds [3 x float], [3 x float]* %4, i64 0, i64 0
  br label %10

; <label>:10:                                     ; preds = %.lr.ph, %10
  %.05 = phi i8* [ %1, %.lr.ph ], [ %14, %10 ]
  %.014 = phi i32* [ %8, %.lr.ph ], [ %12, %10 ]
  %.023 = phi i32 [ %2, %.lr.ph ], [ %11, %10 ]
  %11 = add nsw i32 %.023, -1
  %12 = getelementptr inbounds i32, i32* %.014, i64 1
  %13 = load i32, i32* %.014, align 4
  call fastcc void @pix32toXYZ(i32 %13, float* nonnull %9)
  call fastcc void @XYZtoRGB24(float* nonnull %9, i8* %.05)
  %14 = getelementptr inbounds i8, i8* %.05, i64 3
  %15 = icmp sgt i32 %.023, 1
  br i1 %15, label %10, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %10
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @LogL16InitState(%struct.tiff* nocapture readonly) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %4 = bitcast i8** %3 to %struct.logLuvState**
  %5 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %6 = icmp eq %struct.logLuvState* %5, null
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %1
  tail call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 1025, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__PRETTY_FUNCTION__.LogL16InitState, i64 0, i64 0)) #8
  unreachable

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 11
  %10 = load i16, i16* %9, align 2
  %11 = icmp eq i16 %10, -32692
  br i1 %11, label %13, label %12

; <label>:12:                                     ; preds = %8
  tail call void @__assert_fail(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.14, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 1026, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__PRETTY_FUNCTION__.LogL16InitState, i64 0, i64 0)) #8
  unreachable

; <label>:13:                                     ; preds = %8
  %14 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %5, i64 0, i32 0
  %15 = load i32, i32* %14, align 8
  %16 = icmp eq i32 %15, -1
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %13
  %18 = tail call fastcc i32 @LogL16GuessDataFmt(%struct.TIFFDirectory* nonnull %2)
  store i32 %18, i32* %14, align 8
  br label %19

; <label>:19:                                     ; preds = %17, %13
  %20 = phi i32 [ %18, %17 ], [ %15, %13 ]
  switch i32 %20, label %23 [
    i32 0, label %21
    i32 1, label %26
    i32 3, label %22
  ]

; <label>:21:                                     ; preds = %19
  br label %26

; <label>:22:                                     ; preds = %19
  br label %26

; <label>:23:                                     ; preds = %19
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %25 = load i8*, i8** %24, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %25, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.15, i64 0, i64 0)) #9
  br label %43

; <label>:26:                                     ; preds = %19, %22, %21
  %.sink = phi i32 [ 1, %22 ], [ 4, %21 ], [ 2, %19 ]
  %27 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %5, i64 0, i32 1
  store i32 %.sink, i32* %27, align 4
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  %29 = load i32, i32* %28, align 8
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %31 = load i32, i32* %30, align 4
  %32 = mul i32 %31, %29
  %33 = trunc i32 %32 to i16
  %34 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %5, i64 0, i32 3
  store i16 %33, i16* %34, align 8
  %sext = shl i32 %32, 16
  %35 = ashr exact i32 %sext, 15
  %36 = tail call i8* @_TIFFmalloc(i32 %35) #9
  %37 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %5, i64 0, i32 2
  %38 = bitcast i8*** %37 to i8**
  store i8* %36, i8** %38, align 8
  %39 = icmp eq i8* %36, null
  br i1 %39, label %40, label %43

; <label>:40:                                     ; preds = %26
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %42 = load i8*, i8** %41, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @LogL16InitState.module, i64 0, i64 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.9, i64 0, i64 0), i8* %42) #9
  br label %43

; <label>:43:                                     ; preds = %26, %40, %23
  %.0 = phi i32 [ 0, %23 ], [ 0, %40 ], [ 1, %26 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogL16Decode(%struct.tiff* nocapture, i8*, i32, i16 zeroext) #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %6 = bitcast i8** %5 to %struct.logLuvState**
  %7 = load %struct.logLuvState*, %struct.logLuvState** %6, align 8
  %8 = icmp eq i16 %3, 0
  br i1 %8, label %10, label %9

; <label>:9:                                      ; preds = %4
  tail call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 169, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__PRETTY_FUNCTION__.LogL16Decode, i64 0, i64 0)) #8
  unreachable

; <label>:10:                                     ; preds = %4
  %11 = icmp eq %struct.logLuvState* %7, null
  br i1 %11, label %12, label %13

; <label>:12:                                     ; preds = %10
  tail call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 170, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__PRETTY_FUNCTION__.LogL16Decode, i64 0, i64 0)) #8
  unreachable

; <label>:13:                                     ; preds = %10
  %14 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 1
  %15 = load i32, i32* %14, align 4
  %16 = sdiv i32 %2, %15
  %17 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 0
  %18 = load i32, i32* %17, align 8
  %19 = icmp eq i32 %18, 1
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %13
  %21 = bitcast i8* %1 to i16*
  br label %33

; <label>:22:                                     ; preds = %13
  %23 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 3
  %24 = load i16, i16* %23, align 8
  %25 = sext i16 %24 to i32
  %26 = icmp slt i32 %25, %16
  br i1 %26, label %27, label %28

; <label>:27:                                     ; preds = %22
  tail call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 177, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__PRETTY_FUNCTION__.LogL16Decode, i64 0, i64 0)) #8
  unreachable

; <label>:28:                                     ; preds = %22
  %29 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 2
  %30 = bitcast i8*** %29 to i16**
  %31 = load i16*, i16** %30, align 8
  %32 = bitcast i16* %31 to i8*
  br label %33

; <label>:33:                                     ; preds = %28, %20
  %34 = phi i8* [ %1, %20 ], [ %32, %28 ]
  %.05 = phi i16* [ %21, %20 ], [ %31, %28 ]
  %35 = shl i32 %16, 1
  tail call void @_TIFFmemset(i8* %34, i32 0, i32 %35) #9
  %36 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %37 = load i8*, i8** %36, align 8
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %39 = load i32, i32* %38, align 8
  %40 = icmp sgt i32 %16, 0
  br i1 %40, label %.split.us.preheader, label %.preheader

.split.us.preheader:                              ; preds = %33
  br label %.split.us

.split.us:                                        ; preds = %.split.us.preheader, %._crit_edge.us
  %.014.us = phi i32 [ %41, %._crit_edge.us ], [ 16, %.split.us.preheader ]
  %.06.us = phi i8* [ %.17.lcssa.us, %._crit_edge.us ], [ %37, %.split.us.preheader ]
  %.02.us = phi i32 [ %.13.lcssa.us, %._crit_edge.us ], [ %39, %.split.us.preheader ]
  %41 = add nsw i32 %.014.us, -8
  %42 = icmp sgt i32 %41, -1
  br i1 %42, label %.preheader.us, label %.us-lcssa.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %.backedge.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.preheader.us
  %.010.lcssa.us = phi i32 [ 0, %.preheader.us ], [ %.010.be.us, %._crit_edge.us.loopexit ]
  %.17.lcssa.us = phi i8* [ %.06.us, %.preheader.us ], [ %.17.be.us, %._crit_edge.us.loopexit ]
  %.13.lcssa.us = phi i32 [ %.02.us, %.preheader.us ], [ %.13.be.us, %._crit_edge.us.loopexit ]
  %43 = icmp eq i32 %16, %.010.lcssa.us
  br i1 %43, label %.split.us, label %.us-lcssa38.us.loopexit

.lr.ph34.us:                                      ; preds = %.lr.ph34.us.preheader, %.backedge.us
  %.1333.us = phi i32 [ %.13.be.us, %.backedge.us ], [ %.02.us, %.lr.ph34.us.preheader ]
  %.1732.us = phi i8* [ %.17.be.us, %.backedge.us ], [ %.06.us, %.lr.ph34.us.preheader ]
  %.01031.us = phi i32 [ %.010.be.us, %.backedge.us ], [ 0, %.lr.ph34.us.preheader ]
  %44 = load i8, i8* %.1732.us, align 1
  %45 = icmp slt i8 %44, 0
  %46 = getelementptr inbounds i8, i8* %.1732.us, i64 1
  br i1 %45, label %69, label %47

; <label>:47:                                     ; preds = %.lr.ph34.us
  %48 = add nsw i32 %.1333.us, -1
  %49 = icmp eq i32 %48, 0
  %50 = icmp ne i8 %44, 0
  %not.1520.us = xor i1 %49, true
  %51 = and i1 %50, %not.1520.us
  br i1 %51, label %.lr.ph.us.preheader, label %.backedge.us

.lr.ph.us.preheader:                              ; preds = %47
  %52 = zext i8 %44 to i32
  %53 = sext i32 %.01031.us to i64
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %.lr.ph.us
  %indvars.iv = phi i64 [ %53, %.lr.ph.us.preheader ], [ %indvars.iv.next, %.lr.ph.us ]
  %54 = phi i1 [ %49, %.lr.ph.us.preheader ], [ %66, %.lr.ph.us ]
  %55 = phi i32 [ %48, %.lr.ph.us.preheader ], [ %65, %.lr.ph.us ]
  %.2823.us = phi i8* [ %46, %.lr.ph.us.preheader ], [ %.28.us, %.lr.ph.us ]
  %.122.us = phi i32 [ %52, %.lr.ph.us.preheader ], [ %.2.us, %.lr.ph.us ]
  %not..us = xor i1 %54, true
  %56 = sext i1 %not..us to i32
  %.2.us = add nsw i32 %56, %.122.us
  %57 = load i8, i8* %.2823.us, align 1
  %58 = zext i8 %57 to i32
  %59 = shl i32 %58, %41
  %indvars.iv.next = add i64 %indvars.iv, 1
  %60 = getelementptr inbounds i16, i16* %.05, i64 %indvars.iv
  %61 = load i16, i16* %60, align 2
  %62 = zext i16 %61 to i32
  %63 = or i32 %62, %59
  %64 = trunc i32 %63 to i16
  store i16 %64, i16* %60, align 2
  %.28.us = getelementptr inbounds i8, i8* %.2823.us, i64 1
  %65 = add nsw i32 %55, -1
  %66 = icmp eq i32 %65, 0
  %67 = icmp ne i32 %.2.us, 0
  %not.15.us = xor i1 %66, true
  %68 = and i1 %67, %not.15.us
  br i1 %68, label %.lr.ph.us, label %.backedge.us.loopexit39

; <label>:69:                                     ; preds = %.lr.ph34.us
  %70 = zext i8 %44 to i32
  %71 = add nsw i32 %70, -126
  %72 = getelementptr inbounds i8, i8* %.1732.us, i64 2
  %73 = load i8, i8* %46, align 1
  %74 = zext i8 %73 to i32
  %75 = shl i32 %74, %41
  %76 = add nsw i32 %.1333.us, -2
  %77 = icmp eq i32 %71, 0
  br i1 %77, label %.backedge.us, label %.lr.ph28.us.preheader

.lr.ph28.us.preheader:                            ; preds = %69
  %78 = sext i32 %.01031.us to i64
  %79 = add nsw i32 %70, -127
  %xtraiter = and i32 %71, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph28.us.prol.loopexit, label %.lr.ph28.us.prol.preheader

.lr.ph28.us.prol.preheader:                       ; preds = %.lr.ph28.us.preheader
  br label %.lr.ph28.us.prol

.lr.ph28.us.prol:                                 ; preds = %.lr.ph28.us.prol.preheader, %.lr.ph28.us.prol
  %indvars.iv46.prol = phi i64 [ %indvars.iv.next47.prol, %.lr.ph28.us.prol ], [ %78, %.lr.ph28.us.prol.preheader ]
  %.0127.us.prol = phi i32 [ %80, %.lr.ph28.us.prol ], [ %71, %.lr.ph28.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph28.us.prol ], [ %xtraiter, %.lr.ph28.us.prol.preheader ]
  %80 = add nsw i32 %.0127.us.prol, -1
  %indvars.iv.next47.prol = add nsw i64 %indvars.iv46.prol, 1
  %81 = getelementptr inbounds i16, i16* %.05, i64 %indvars.iv46.prol
  %82 = load i16, i16* %81, align 2
  %83 = zext i16 %82 to i32
  %84 = or i32 %83, %75
  %85 = trunc i32 %84 to i16
  store i16 %85, i16* %81, align 2
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph28.us.prol.loopexit.loopexit, label %.lr.ph28.us.prol, !llvm.loop !3

.lr.ph28.us.prol.loopexit.loopexit:               ; preds = %.lr.ph28.us.prol
  br label %.lr.ph28.us.prol.loopexit

.lr.ph28.us.prol.loopexit:                        ; preds = %.lr.ph28.us.prol.loopexit.loopexit, %.lr.ph28.us.preheader
  %indvars.iv46.unr = phi i64 [ %78, %.lr.ph28.us.preheader ], [ %indvars.iv.next47.prol, %.lr.ph28.us.prol.loopexit.loopexit ]
  %.0127.us.unr = phi i32 [ %71, %.lr.ph28.us.preheader ], [ %80, %.lr.ph28.us.prol.loopexit.loopexit ]
  %86 = icmp ult i32 %79, 3
  br i1 %86, label %.backedge.us.loopexit, label %.lr.ph28.us.preheader56

.lr.ph28.us.preheader56:                          ; preds = %.lr.ph28.us.prol.loopexit
  br label %.lr.ph28.us

.lr.ph28.us:                                      ; preds = %.lr.ph28.us.preheader56, %.lr.ph28.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.3, %.lr.ph28.us ], [ %indvars.iv46.unr, %.lr.ph28.us.preheader56 ]
  %.0127.us = phi i32 [ %102, %.lr.ph28.us ], [ %.0127.us.unr, %.lr.ph28.us.preheader56 ]
  %indvars.iv.next47 = add nsw i64 %indvars.iv46, 1
  %87 = getelementptr inbounds i16, i16* %.05, i64 %indvars.iv46
  %88 = load i16, i16* %87, align 2
  %89 = zext i16 %88 to i32
  %90 = or i32 %89, %75
  %91 = trunc i32 %90 to i16
  store i16 %91, i16* %87, align 2
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %92 = getelementptr inbounds i16, i16* %.05, i64 %indvars.iv.next47
  %93 = load i16, i16* %92, align 2
  %94 = zext i16 %93 to i32
  %95 = or i32 %94, %75
  %96 = trunc i32 %95 to i16
  store i16 %96, i16* %92, align 2
  %indvars.iv.next47.2 = add nsw i64 %indvars.iv46, 3
  %97 = getelementptr inbounds i16, i16* %.05, i64 %indvars.iv.next47.1
  %98 = load i16, i16* %97, align 2
  %99 = zext i16 %98 to i32
  %100 = or i32 %99, %75
  %101 = trunc i32 %100 to i16
  store i16 %101, i16* %97, align 2
  %102 = add nsw i32 %.0127.us, -4
  %indvars.iv.next47.3 = add nsw i64 %indvars.iv46, 4
  %103 = getelementptr inbounds i16, i16* %.05, i64 %indvars.iv.next47.2
  %104 = load i16, i16* %103, align 2
  %105 = zext i16 %104 to i32
  %106 = or i32 %105, %75
  %107 = trunc i32 %106 to i16
  store i16 %107, i16* %103, align 2
  %108 = icmp eq i32 %102, 0
  br i1 %108, label %.backedge.us.loopexit.loopexit, label %.lr.ph28.us

.preheader.us:                                    ; preds = %.split.us
  %109 = icmp sgt i32 %.02.us, 0
  br i1 %109, label %.lr.ph34.us.preheader, label %._crit_edge.us

.lr.ph34.us.preheader:                            ; preds = %.preheader.us
  br label %.lr.ph34.us

.backedge.us.loopexit.loopexit:                   ; preds = %.lr.ph28.us
  br label %.backedge.us.loopexit

.backedge.us.loopexit:                            ; preds = %.backedge.us.loopexit.loopexit, %.lr.ph28.us.prol.loopexit
  %110 = add i32 %.01031.us, 1
  %111 = add i32 %110, %79
  br label %.backedge.us

.backedge.us.loopexit39:                          ; preds = %.lr.ph.us
  %112 = trunc i64 %indvars.iv.next to i32
  br label %.backedge.us

.backedge.us:                                     ; preds = %.backedge.us.loopexit39, %.backedge.us.loopexit, %47, %69
  %.010.be.us = phi i32 [ %.01031.us, %69 ], [ %.01031.us, %47 ], [ %111, %.backedge.us.loopexit ], [ %112, %.backedge.us.loopexit39 ]
  %.17.be.us = phi i8* [ %72, %69 ], [ %46, %47 ], [ %72, %.backedge.us.loopexit ], [ %.28.us, %.backedge.us.loopexit39 ]
  %.13.be.us = phi i32 [ %76, %69 ], [ %48, %47 ], [ %76, %.backedge.us.loopexit ], [ %65, %.backedge.us.loopexit39 ]
  %113 = icmp sgt i32 %16, %.010.be.us
  %114 = icmp sgt i32 %.13.be.us, 0
  %..us = and i1 %113, %114
  br i1 %..us, label %.lr.ph34.us, label %._crit_edge.us.loopexit

.preheader:                                       ; preds = %33
  %115 = icmp eq i32 %16, 0
  br i1 %115, label %.us-lcssa.us, label %.us-lcssa38.us

.us-lcssa38.us.loopexit:                          ; preds = %._crit_edge.us
  br label %.us-lcssa38.us

.us-lcssa38.us:                                   ; preds = %.us-lcssa38.us.loopexit, %.preheader
  %.010.lcssa.lcssa = phi i32 [ 0, %.preheader ], [ %.010.lcssa.us, %.us-lcssa38.us.loopexit ]
  %.17.lcssa.lcssa = phi i8* [ %37, %.preheader ], [ %.17.lcssa.us, %.us-lcssa38.us.loopexit ]
  %.13.lcssa.lcssa = phi i32 [ %39, %.preheader ], [ %.13.lcssa.us, %.us-lcssa38.us.loopexit ]
  %116 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %117 = load i8*, i8** %116, align 8
  %118 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %119 = load i32, i32* %118, align 8
  %120 = sub nsw i32 %16, %.010.lcssa.lcssa
  tail call void (i8*, i8*, ...) @TIFFError(i8* %117, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.16, i64 0, i64 0), i32 %119, i32 %120) #9
  br label %123

.us-lcssa.us.loopexit:                            ; preds = %.split.us
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit, %.preheader
  %.06.lcssa = phi i8* [ %37, %.preheader ], [ %.06.us, %.us-lcssa.us.loopexit ]
  %.02.lcssa = phi i32 [ %39, %.preheader ], [ %.02.us, %.us-lcssa.us.loopexit ]
  %121 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 4
  %122 = load void (%struct.logLuvState*, i8*, i32)*, void (%struct.logLuvState*, i8*, i32)** %121, align 8
  tail call void %122(%struct.logLuvState* nonnull %7, i8* %1, i32 %16) #9
  br label %123

; <label>:123:                                    ; preds = %.us-lcssa.us, %.us-lcssa38.us
  %.06.sink = phi i8* [ %.06.lcssa, %.us-lcssa.us ], [ %.17.lcssa.lcssa, %.us-lcssa38.us ]
  %.02.sink = phi i32 [ %.02.lcssa, %.us-lcssa.us ], [ %.13.lcssa.lcssa, %.us-lcssa38.us ]
  %.0 = phi i32 [ 1, %.us-lcssa.us ], [ 0, %.us-lcssa38.us ]
  store i8* %.06.sink, i8** %36, align 8
  store i32 %.02.sink, i32* %38, align 8
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal void @L16toY(%struct.logLuvState* nocapture readonly, i8* nocapture, i32) #0 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %5 = bitcast i8* %1 to float*
  %6 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %0, i64 0, i32 2
  %7 = bitcast i8*** %6 to i16**
  %8 = load i16*, i16** %7, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.05 = phi float* [ %15, %.lr.ph ], [ %5, %.lr.ph.preheader ]
  %.014 = phi i16* [ %10, %.lr.ph ], [ %8, %.lr.ph.preheader ]
  %.023 = phi i32 [ %9, %.lr.ph ], [ %2, %.lr.ph.preheader ]
  %9 = add nsw i32 %.023, -1
  %10 = getelementptr inbounds i16, i16* %.014, i64 1
  %11 = load i16, i16* %.014, align 2
  %12 = sext i16 %11 to i32
  %13 = tail call fastcc double @pix16toY(i32 %12)
  %14 = fptrunc double %13 to float
  %15 = getelementptr inbounds float, float* %.05, i64 1
  store float %14, float* %.05, align 4
  %16 = icmp sgt i32 %.023, 1
  br i1 %16, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @L16toGry(%struct.logLuvState* nocapture readonly, i8* nocapture, i32) #0 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %5 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %0, i64 0, i32 2
  %6 = bitcast i8*** %5 to i16**
  %7 = load i16*, i16** %6, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %20
  %.in = phi i32 [ %8, %20 ], [ %2, %.lr.ph.preheader ]
  %.04 = phi i8* [ %23, %20 ], [ %1, %.lr.ph.preheader ]
  %.013 = phi i16* [ %9, %20 ], [ %7, %.lr.ph.preheader ]
  %8 = add nsw i32 %.in, -1
  %9 = getelementptr inbounds i16, i16* %.013, i64 1
  %10 = load i16, i16* %.013, align 2
  %11 = sext i16 %10 to i32
  %12 = tail call fastcc double @pix16toY(i32 %11)
  %13 = fcmp ugt double %12, 0.000000e+00
  br i1 %13, label %14, label %20

; <label>:14:                                     ; preds = %.lr.ph
  %15 = fcmp ult double %12, 1.000000e+00
  br i1 %15, label %16, label %20

; <label>:16:                                     ; preds = %14
  %17 = tail call double @sqrt(double %12) #9
  %18 = fmul double %17, 2.560000e+02
  %19 = fptosi double %18 to i32
  br label %20

; <label>:20:                                     ; preds = %16, %14, %.lr.ph
  %21 = phi i32 [ 0, %.lr.ph ], [ %19, %16 ], [ 255, %14 ]
  %22 = trunc i32 %21 to i8
  %23 = getelementptr inbounds i8, i8* %.04, i64 1
  store i8 %22, i8* %.04, align 1
  %24 = icmp sgt i32 %.in, 1
  br i1 %24, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %20
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal fastcc i32 @LogLuvGuessDataFmt(%struct.TIFFDirectory* nocapture readonly) unnamed_addr #6 {
  %2 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %0, i64 0, i32 8
  %3 = load i16, i16* %2, align 4
  %4 = zext i16 %3 to i32
  %5 = shl nuw nsw i32 %4, 3
  %6 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %0, i64 0, i32 9
  %7 = load i16, i16* %6, align 2
  %8 = zext i16 %7 to i32
  %9 = or i32 %5, %8
  %trunc = trunc i32 %9 to i19
  switch i19 %trunc, label %13 [
    i19 259, label %14
    i19 260, label %10
    i19 257, label %10
    i19 258, label %10
    i19 132, label %11
    i19 130, label %11
    i19 129, label %11
    i19 68, label %12
    i19 65, label %12
  ]

; <label>:10:                                     ; preds = %1, %1, %1
  br label %14

; <label>:11:                                     ; preds = %1, %1, %1
  br label %14

; <label>:12:                                     ; preds = %1, %1
  br label %14

; <label>:13:                                     ; preds = %1
  br label %14

; <label>:14:                                     ; preds = %1, %13, %12, %11, %10
  %.0 = phi i32 [ -1, %13 ], [ 3, %12 ], [ 1, %11 ], [ 2, %10 ], [ 0, %1 ]
  %15 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %0, i64 0, i32 15
  %16 = load i16, i16* %15, align 2
  switch i16 %16, label %21 [
    i16 1, label %17
    i16 3, label %19
  ]

; <label>:17:                                     ; preds = %14
  %18 = icmp eq i32 %.0, 2
  %.0. = select i1 %18, i32 2, i32 -1
  br label %21

; <label>:19:                                     ; preds = %14
  %20 = icmp eq i32 %.0, 2
  %..0 = select i1 %20, i32 -1, i32 %.0
  br label %21

; <label>:21:                                     ; preds = %14, %19, %17
  %.3 = phi i32 [ %..0, %19 ], [ %.0., %17 ], [ -1, %14 ]
  ret i32 %.3
}

declare void @_TIFFmemset(i8*, i32, i32) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @pix24toXYZ(i32, float* nocapture) unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = lshr i32 %0, 14
  %6 = and i32 %5, 1023
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %11

; <label>:8:                                      ; preds = %2
  %9 = getelementptr inbounds float, float* %1, i64 2
  store float 0.000000e+00, float* %9, align 4
  %10 = getelementptr inbounds float, float* %1, i64 1
  store float 0.000000e+00, float* %10, align 4
  store float 0.000000e+00, float* %1, align 4
  br label %44

; <label>:11:                                     ; preds = %2
  %12 = sitofp i32 %6 to double
  %13 = fadd double %12, 5.000000e-01
  %14 = fmul double %13, 0x3F862E42FEFA39EF
  %15 = fadd double %14, 0xC020A2B23F3BAB73
  %16 = tail call double @exp(double %15) #9
  %17 = and i32 %0, 16383
  %18 = call fastcc i32 @uv_decode(double* nonnull %3, double* nonnull %4, i32 %17)
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %20, label %21

; <label>:20:                                     ; preds = %11
  store double 0x3FCAF286BD156C1A, double* %3, align 8
  store double 0x3FDE50D794B8199E, double* %4, align 8
  br label %21

; <label>:21:                                     ; preds = %20, %11
  %22 = load double, double* %3, align 8
  %23 = fmul double %22, 6.000000e+00
  %24 = load double, double* %4, align 8
  %25 = fmul double %24, 1.600000e+01
  %26 = fsub double %23, %25
  %27 = fadd double %26, 1.200000e+01
  %28 = fdiv double 1.000000e+00, %27
  %29 = fmul double %22, 9.000000e+00
  %30 = fmul double %29, %28
  %31 = fmul double %24, 4.000000e+00
  %32 = fmul double %31, %28
  %33 = fdiv double %30, %32
  %34 = fmul double %16, %33
  %35 = fptrunc double %34 to float
  store float %35, float* %1, align 4
  %36 = fptrunc double %16 to float
  %37 = getelementptr inbounds float, float* %1, i64 1
  store float %36, float* %37, align 4
  %38 = fsub double 1.000000e+00, %30
  %39 = fsub double %38, %32
  %40 = fdiv double %39, %32
  %41 = fmul double %16, %40
  %42 = fptrunc double %41 to float
  %43 = getelementptr inbounds float, float* %1, i64 2
  store float %42, float* %43, align 4
  br label %44

; <label>:44:                                     ; preds = %21, %8
  ret void
}

; Function Attrs: nounwind
declare double @exp(double) local_unnamed_addr #7

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc i32 @uv_decode(double* nocapture, double* nocapture, i32) unnamed_addr #5 {
  %4 = icmp ugt i32 %2, 16288
  br i1 %4, label %35, label %.preheader.preheader

.preheader.preheader:                             ; preds = %3
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %15
  %.02 = phi i32 [ %.13, %15 ], [ 163, %.preheader.preheader ]
  %.01 = phi i32 [ %.1, %15 ], [ 0, %.preheader.preheader ]
  %5 = add nsw i32 %.01, %.02
  %6 = ashr i32 %5, 1
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [163 x %struct.anon], [163 x %struct.anon]* @uv_row, i64 0, i64 %7, i32 2
  %9 = load i16, i16* %8, align 2
  %10 = sext i16 %9 to i32
  %11 = sub nsw i32 %2, %10
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %15, label %13

; <label>:13:                                     ; preds = %.preheader
  %14 = icmp slt i32 %11, 0
  br i1 %14, label %15, label %18

; <label>:15:                                     ; preds = %.preheader, %13
  %.13 = phi i32 [ %.02, %.preheader ], [ %6, %13 ]
  %.1 = phi i32 [ %6, %.preheader ], [ %.01, %13 ]
  %16 = sub nsw i32 %.13, %.1
  %17 = icmp sgt i32 %16, 1
  br i1 %17, label %.preheader, label %18

; <label>:18:                                     ; preds = %13, %15
  %.2 = phi i32 [ %.1, %15 ], [ %.01, %13 ]
  %19 = sext i32 %.2 to i64
  %20 = getelementptr inbounds [163 x %struct.anon], [163 x %struct.anon]* @uv_row, i64 0, i64 %19, i32 2
  %21 = load i16, i16* %20, align 2
  %22 = sext i16 %21 to i32
  %23 = sub nsw i32 %2, %22
  %24 = getelementptr inbounds [163 x %struct.anon], [163 x %struct.anon]* @uv_row, i64 0, i64 %19, i32 0
  %25 = load float, float* %24, align 8
  %26 = fpext float %25 to double
  %27 = sitofp i32 %23 to double
  %28 = fadd double %27, 5.000000e-01
  %29 = fmul double %28, 0x3F6CAC0840000000
  %30 = fadd double %26, %29
  store double %30, double* %0, align 8
  %31 = sitofp i32 %.2 to double
  %32 = fadd double %31, 5.000000e-01
  %33 = fmul double %32, 0x3F6CAC0840000000
  %34 = fadd double %33, 0x3F9158B820000000
  store double %34, double* %1, align 8
  br label %35

; <label>:35:                                     ; preds = %3, %18
  %.0 = phi i32 [ 0, %18 ], [ -1, %3 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @XYZtoRGB24(float* nocapture readonly, i8* nocapture) unnamed_addr #0 {
  %3 = load float, float* %0, align 4
  %4 = fpext float %3 to double
  %5 = fmul double %4, 2.690000e+00
  %6 = getelementptr inbounds float, float* %0, i64 1
  %7 = load float, float* %6, align 4
  %8 = fpext float %7 to double
  %9 = fmul double %8, 1.276000e+00
  %10 = fsub double %5, %9
  %11 = getelementptr inbounds float, float* %0, i64 2
  %12 = load float, float* %11, align 4
  %13 = fpext float %12 to double
  %14 = fmul double %13, 4.140000e-01
  %15 = fsub double %10, %14
  %16 = fmul double %4, 1.022000e+00
  %17 = fmul double %8, 1.978000e+00
  %18 = fsub double %17, %16
  %19 = fmul double %13, 4.400000e-02
  %20 = fadd double %18, %19
  %21 = fmul double %4, 6.100000e-02
  %22 = fmul double %8, 2.240000e-01
  %23 = fsub double %21, %22
  %24 = fmul double %13, 1.163000e+00
  %25 = fadd double %23, %24
  %26 = fcmp ugt double %15, 0.000000e+00
  br i1 %26, label %27, label %33

; <label>:27:                                     ; preds = %2
  %28 = fcmp ult double %15, 1.000000e+00
  br i1 %28, label %29, label %33

; <label>:29:                                     ; preds = %27
  %30 = tail call double @sqrt(double %15) #9
  %31 = fmul double %30, 2.560000e+02
  %32 = fptosi double %31 to i32
  %phitmp = trunc i32 %32 to i8
  br label %33

; <label>:33:                                     ; preds = %29, %27, %2
  %34 = phi i8 [ 0, %2 ], [ %phitmp, %29 ], [ -1, %27 ]
  store i8 %34, i8* %1, align 1
  %35 = fcmp ugt double %20, 0.000000e+00
  br i1 %35, label %36, label %42

; <label>:36:                                     ; preds = %33
  %37 = fcmp ult double %20, 1.000000e+00
  br i1 %37, label %38, label %42

; <label>:38:                                     ; preds = %36
  %39 = tail call double @sqrt(double %20) #9
  %40 = fmul double %39, 2.560000e+02
  %41 = fptosi double %40 to i32
  %phitmp1 = trunc i32 %41 to i8
  br label %42

; <label>:42:                                     ; preds = %38, %36, %33
  %43 = phi i8 [ 0, %33 ], [ %phitmp1, %38 ], [ -1, %36 ]
  %44 = getelementptr inbounds i8, i8* %1, i64 1
  store i8 %43, i8* %44, align 1
  %45 = fcmp ugt double %25, 0.000000e+00
  br i1 %45, label %46, label %52

; <label>:46:                                     ; preds = %42
  %47 = fcmp ult double %25, 1.000000e+00
  br i1 %47, label %48, label %52

; <label>:48:                                     ; preds = %46
  %49 = tail call double @sqrt(double %25) #9
  %50 = fmul double %49, 2.560000e+02
  %51 = fptosi double %50 to i32
  %phitmp2 = trunc i32 %51 to i8
  br label %52

; <label>:52:                                     ; preds = %48, %46, %42
  %53 = phi i8 [ 0, %42 ], [ %phitmp2, %48 ], [ -1, %46 ]
  %54 = getelementptr inbounds i8, i8* %1, i64 2
  store i8 %53, i8* %54, align 1
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #7

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @pix32toXYZ(i32, float* nocapture) unnamed_addr #0 {
  %3 = ashr i32 %0, 16
  %4 = tail call fastcc double @pix16toY(i32 %3)
  %5 = fcmp oeq double %4, 0.000000e+00
  br i1 %5, label %6, label %9

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds float, float* %1, i64 2
  store float 0.000000e+00, float* %7, align 4
  %8 = getelementptr inbounds float, float* %1, i64 1
  store float 0.000000e+00, float* %8, align 4
  store float 0.000000e+00, float* %1, align 4
  br label %39

; <label>:9:                                      ; preds = %2
  %10 = lshr i32 %0, 8
  %11 = and i32 %10, 255
  %12 = uitofp i32 %11 to double
  %13 = fadd double %12, 5.000000e-01
  %14 = fmul double %13, 0x3F63FB013FB013FB
  %15 = and i32 %0, 255
  %16 = uitofp i32 %15 to double
  %17 = fadd double %16, 5.000000e-01
  %18 = fmul double %17, 0x3F63FB013FB013FB
  %19 = fmul double %14, 6.000000e+00
  %20 = fmul double %18, 1.600000e+01
  %21 = fsub double %19, %20
  %22 = fadd double %21, 1.200000e+01
  %23 = fdiv double 1.000000e+00, %22
  %24 = fmul double %14, 9.000000e+00
  %25 = fmul double %24, %23
  %26 = fmul double %18, 4.000000e+00
  %27 = fmul double %26, %23
  %28 = fdiv double %25, %27
  %29 = fmul double %28, %4
  %30 = fptrunc double %29 to float
  store float %30, float* %1, align 4
  %31 = fptrunc double %4 to float
  %32 = getelementptr inbounds float, float* %1, i64 1
  store float %31, float* %32, align 4
  %33 = fsub double 1.000000e+00, %25
  %34 = fsub double %33, %27
  %35 = fdiv double %34, %27
  %36 = fmul double %35, %4
  %37 = fptrunc double %36 to float
  %38 = getelementptr inbounds float, float* %1, i64 2
  store float %37, float* %38, align 4
  br label %39

; <label>:39:                                     ; preds = %9, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc double @pix16toY(i32) unnamed_addr #0 {
  %2 = and i32 %0, 32767
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %13, label %4

; <label>:4:                                      ; preds = %1
  %5 = sitofp i32 %2 to double
  %6 = fadd double %5, 5.000000e-01
  %7 = fmul double %6, 0x3F662E42FEFA39EF
  %8 = fadd double %7, 0xC0462E42FEFA39EF
  %9 = tail call double @exp(double %8) #9
  %10 = trunc i32 %0 to i16
  %11 = icmp slt i16 %10, 0
  %12 = fsub double -0.000000e+00, %9
  %. = select i1 %11, double %12, double %9
  ret double %.

; <label>:13:                                     ; preds = %1
  ret double 0.000000e+00
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal fastcc i32 @LogL16GuessDataFmt(%struct.TIFFDirectory* nocapture readonly) unnamed_addr #6 {
  %2 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %0, i64 0, i32 8
  %3 = load i16, i16* %2, align 4
  %4 = zext i16 %3 to i32
  %5 = shl nuw nsw i32 %4, 6
  %6 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %0, i64 0, i32 15
  %7 = load i16, i16* %6, align 2
  %8 = zext i16 %7 to i32
  %9 = shl nuw nsw i32 %8, 3
  %10 = or i32 %9, %5
  %11 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %0, i64 0, i32 9
  %12 = load i16, i16* %11, align 2
  %13 = zext i16 %12 to i32
  %14 = or i32 %10, %13
  %trunc = trunc i32 %14 to i22
  switch i22 %trunc, label %17 [
    i22 2059, label %18
    i22 1036, label %15
    i22 1034, label %15
    i22 1033, label %15
    i22 524, label %16
    i22 521, label %16
  ]

; <label>:15:                                     ; preds = %1, %1, %1
  br label %18

; <label>:16:                                     ; preds = %1, %1
  br label %18

; <label>:17:                                     ; preds = %1
  br label %18

; <label>:18:                                     ; preds = %1, %17, %16, %15
  %.0 = phi i32 [ -1, %17 ], [ 3, %16 ], [ 1, %15 ], [ 0, %1 ]
  ret i32 %.0
}

declare i32 @TIFFScanlineSize(%struct.tiff*) local_unnamed_addr #2

declare i32 @TIFFTileRowSize(%struct.tiff*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvEncode24(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %6 = bitcast i8** %5 to %struct.logLuvState**
  %7 = load %struct.logLuvState*, %struct.logLuvState** %6, align 8
  %8 = icmp eq i16 %3, 0
  br i1 %8, label %10, label %9

; <label>:9:                                      ; preds = %4
  tail call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 445, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvEncode24, i64 0, i64 0)) #8
  unreachable

; <label>:10:                                     ; preds = %4
  %11 = icmp eq %struct.logLuvState* %7, null
  br i1 %11, label %12, label %13

; <label>:12:                                     ; preds = %10
  tail call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 446, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvEncode24, i64 0, i64 0)) #8
  unreachable

; <label>:13:                                     ; preds = %10
  %14 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 1
  %15 = load i32, i32* %14, align 4
  %16 = sdiv i32 %2, %15
  %17 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 0
  %18 = load i32, i32* %17, align 8
  %19 = icmp eq i32 %18, 2
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %13
  %21 = bitcast i8* %1 to i32*
  br label %34

; <label>:22:                                     ; preds = %13
  %23 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 3
  %24 = load i16, i16* %23, align 8
  %25 = sext i16 %24 to i32
  %26 = icmp slt i32 %25, %16
  br i1 %26, label %27, label %28

; <label>:27:                                     ; preds = %22
  tail call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 453, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvEncode24, i64 0, i64 0)) #8
  unreachable

; <label>:28:                                     ; preds = %22
  %29 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 2
  %30 = bitcast i8*** %29 to i32**
  %31 = load i32*, i32** %30, align 8
  %32 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 4
  %33 = load void (%struct.logLuvState*, i8*, i32)*, void (%struct.logLuvState*, i8*, i32)** %32, align 8
  tail call void %33(%struct.logLuvState* nonnull %7, i8* %1, i32 %16) #9
  br label %34

; <label>:34:                                     ; preds = %28, %20
  %.01 = phi i32* [ %21, %20 ], [ %31, %28 ]
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %36 = load i8*, i8** %35, align 8
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %38 = load i32, i32* %37, align 8
  %39 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %40 = load i32, i32* %39, align 8
  %41 = sub nsw i32 %38, %40
  %42 = icmp eq i32 %16, 0
  br i1 %42, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %34
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %55
  %.in = phi i32 [ %43, %55 ], [ %16, %.lr.ph.preheader ]
  %.111 = phi i32* [ %64, %55 ], [ %.01, %.lr.ph.preheader ]
  %.0210 = phi i8* [ %67, %55 ], [ %36, %.lr.ph.preheader ]
  %.049 = phi i32 [ %68, %55 ], [ %41, %.lr.ph.preheader ]
  %43 = add nsw i32 %.in, -1
  %44 = icmp slt i32 %.049, 3
  br i1 %44, label %45, label %55

; <label>:45:                                     ; preds = %.lr.ph
  store i8* %.0210, i8** %35, align 8
  %46 = load i32, i32* %37, align 8
  %47 = sub nsw i32 %46, %.049
  store i32 %47, i32* %39, align 8
  %48 = tail call i32 @TIFFFlushData1(%struct.tiff* %0) #9
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %.loopexit.loopexit, label %50

; <label>:50:                                     ; preds = %45
  %51 = load i8*, i8** %35, align 8
  %52 = load i32, i32* %37, align 8
  %53 = load i32, i32* %39, align 8
  %54 = sub nsw i32 %52, %53
  br label %55

; <label>:55:                                     ; preds = %50, %.lr.ph
  %.15 = phi i32 [ %54, %50 ], [ %.049, %.lr.ph ]
  %.13 = phi i8* [ %51, %50 ], [ %.0210, %.lr.ph ]
  %56 = load i32, i32* %.111, align 4
  %57 = lshr i32 %56, 16
  %58 = trunc i32 %57 to i8
  %59 = getelementptr inbounds i8, i8* %.13, i64 1
  store i8 %58, i8* %.13, align 1
  %60 = load i32, i32* %.111, align 4
  %61 = lshr i32 %60, 8
  %62 = trunc i32 %61 to i8
  %63 = getelementptr inbounds i8, i8* %.13, i64 2
  store i8 %62, i8* %59, align 1
  %64 = getelementptr inbounds i32, i32* %.111, i64 1
  %65 = load i32, i32* %.111, align 4
  %66 = trunc i32 %65 to i8
  %67 = getelementptr inbounds i8, i8* %.13, i64 3
  store i8 %66, i8* %63, align 1
  %68 = add nsw i32 %.15, -3
  %69 = icmp eq i32 %43, 0
  br i1 %69, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %55
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %34
  %.04.lcssa = phi i32 [ %41, %34 ], [ %68, %._crit_edge.loopexit ]
  %.02.lcssa = phi i8* [ %36, %34 ], [ %67, %._crit_edge.loopexit ]
  store i8* %.02.lcssa, i8** %35, align 8
  %70 = load i32, i32* %37, align 8
  %71 = sub nsw i32 %70, %.04.lcssa
  store i32 %71, i32* %39, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %45
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge
  %.0 = phi i32 [ 0, %._crit_edge ], [ -1, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal void @Luv24fromXYZ(%struct.logLuvState* nocapture readonly, i8* nocapture readonly, i32) #0 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %5 = bitcast i8* %1 to float*
  %6 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %0, i64 0, i32 2
  %7 = bitcast i8*** %6 to i32**
  %8 = load i32*, i32** %7, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.05 = phi float* [ %12, %.lr.ph ], [ %5, %.lr.ph.preheader ]
  %.014 = phi i32* [ %11, %.lr.ph ], [ %8, %.lr.ph.preheader ]
  %.023 = phi i32 [ %9, %.lr.ph ], [ %2, %.lr.ph.preheader ]
  %9 = add nsw i32 %.023, -1
  %10 = tail call fastcc i32 @pix24fromXYZ(float* %.05)
  %11 = getelementptr inbounds i32, i32* %.014, i64 1
  store i32 %10, i32* %.014, align 4
  %12 = getelementptr inbounds float, float* %.05, i64 3
  %13 = icmp sgt i32 %.023, 1
  br i1 %13, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @Luv24fromLuv48(%struct.logLuvState* nocapture readonly, i8* nocapture readonly, i32) #5 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %5 = bitcast i8* %1 to i16*
  %6 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %0, i64 0, i32 2
  %7 = bitcast i8*** %6 to i32**
  %8 = load i32*, i32** %7, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %32
  %.in = phi i32 [ %9, %32 ], [ %2, %.lr.ph.preheader ]
  %.036 = phi i32* [ %18, %32 ], [ %8, %.lr.ph.preheader ]
  %.045 = phi i16* [ %35, %32 ], [ %5, %.lr.ph.preheader ]
  %9 = add nsw i32 %.in, -1
  %10 = load i16, i16* %.045, align 2
  %11 = icmp slt i16 %10, 1
  br i1 %11, label %17, label %12

; <label>:12:                                     ; preds = %.lr.ph
  %13 = icmp sgt i16 %10, 7409
  %14 = sext i16 %10 to i32
  %15 = add nsw i32 %14, -3314
  %16 = ashr i32 %15, 2
  %. = select i1 %13, i32 1023, i32 %16
  br label %17

; <label>:17:                                     ; preds = %12, %.lr.ph
  %.1 = phi i32 [ 0, %.lr.ph ], [ %., %12 ]
  %18 = getelementptr inbounds i32, i32* %.036, i64 1
  %19 = load i32, i32* %18, align 4
  %20 = uitofp i32 %19 to double
  %21 = fadd double %20, 5.000000e-01
  %22 = fmul double %21, 0x3F00000000000000
  %23 = getelementptr inbounds i32, i32* %.036, i64 2
  %24 = load i32, i32* %23, align 4
  %25 = uitofp i32 %24 to double
  %26 = fadd double %25, 5.000000e-01
  %27 = fmul double %26, 0x3F00000000000000
  %28 = tail call fastcc i32 @uv_encode(double %22, double %27)
  %29 = icmp slt i32 %28, 0
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %17
  %31 = tail call fastcc i32 @uv_encode(double 0x3FCAF286BD156C1A, double 0x3FDE50D794B8199E)
  br label %32

; <label>:32:                                     ; preds = %30, %17
  %.0 = phi i32 [ %31, %30 ], [ %28, %17 ]
  %33 = shl nsw i32 %.1, 14
  %34 = or i32 %.0, %33
  store i32 %34, i32* %.036, align 4
  %35 = getelementptr inbounds i16, i16* %.045, i64 3
  %36 = icmp sgt i32 %.in, 1
  br i1 %36, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvEncode32(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %6 = bitcast i8** %5 to %struct.logLuvState**
  %7 = load %struct.logLuvState*, %struct.logLuvState** %6, align 8
  %8 = icmp eq i16 %3, 0
  br i1 %8, label %10, label %9

; <label>:9:                                      ; preds = %4
  tail call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 492, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvEncode32, i64 0, i64 0)) #8
  unreachable

; <label>:10:                                     ; preds = %4
  %11 = icmp eq %struct.logLuvState* %7, null
  br i1 %11, label %12, label %13

; <label>:12:                                     ; preds = %10
  tail call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 493, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvEncode32, i64 0, i64 0)) #8
  unreachable

; <label>:13:                                     ; preds = %10
  %14 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 1
  %15 = load i32, i32* %14, align 4
  %16 = sdiv i32 %2, %15
  %17 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 0
  %18 = load i32, i32* %17, align 8
  %19 = icmp eq i32 %18, 2
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %13
  %21 = bitcast i8* %1 to i32*
  br label %34

; <label>:22:                                     ; preds = %13
  %23 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 3
  %24 = load i16, i16* %23, align 8
  %25 = sext i16 %24 to i32
  %26 = icmp slt i32 %25, %16
  br i1 %26, label %27, label %28

; <label>:27:                                     ; preds = %22
  tail call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 501, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvEncode32, i64 0, i64 0)) #8
  unreachable

; <label>:28:                                     ; preds = %22
  %29 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 2
  %30 = bitcast i8*** %29 to i32**
  %31 = load i32*, i32** %30, align 8
  %32 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 4
  %33 = load void (%struct.logLuvState*, i8*, i32)*, void (%struct.logLuvState*, i8*, i32)** %32, align 8
  tail call void %33(%struct.logLuvState* nonnull %7, i8* %1, i32 %16) #9
  br label %34

; <label>:34:                                     ; preds = %28, %20
  %.09 = phi i32* [ %21, %20 ], [ %31, %28 ]
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %36 = load i8*, i8** %35, align 8
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %38 = load i32, i32* %37, align 8
  %39 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %40 = load i32, i32* %39, align 8
  %41 = sub nsw i32 %38, %40
  %42 = icmp sgt i32 %16, 0
  %43 = sext i32 %16 to i64
  br label %.preheader34

.loopexit35.loopexit:                             ; preds = %173
  br label %.loopexit35

.loopexit35:                                      ; preds = %.loopexit35.loopexit, %.preheader34
  %.120.lcssa = phi i8* [ %.01983, %.preheader34 ], [ %.827, %.loopexit35.loopexit ]
  %.14.lcssa = phi i32 [ %.0384, %.preheader34 ], [ %.8, %.loopexit35.loopexit ]
  %.1.lcssa = phi i32 [ %.0285, %.preheader34 ], [ %.5, %.loopexit35.loopexit ]
  %44 = add nsw i32 %46, -8
  %45 = icmp sgt i32 %44, -1
  br i1 %45, label %.preheader34, label %176

.preheader34:                                     ; preds = %34, %.loopexit35
  %46 = phi i32 [ 24, %34 ], [ %44, %.loopexit35 ]
  %.0285 = phi i32 [ 0, %34 ], [ %.1.lcssa, %.loopexit35 ]
  %.0384 = phi i32 [ %41, %34 ], [ %.14.lcssa, %.loopexit35 ]
  %.01983 = phi i8* [ %36, %34 ], [ %.120.lcssa, %.loopexit35 ]
  br i1 %42, label %.lr.ph79, label %.loopexit35

.lr.ph79:                                         ; preds = %.preheader34
  %47 = shl i32 255, %46
  br label %48

; <label>:48:                                     ; preds = %.lr.ph79, %173
  %.178 = phi i32 [ %.0285, %.lr.ph79 ], [ %.5, %173 ]
  %.1477 = phi i32 [ %.0384, %.lr.ph79 ], [ %.8, %173 ]
  %.01176 = phi i32 [ 0, %.lr.ph79 ], [ %174, %173 ]
  %.12075 = phi i8* [ %.01983, %.lr.ph79 ], [ %.827, %173 ]
  %49 = icmp slt i32 %.1477, 4
  br i1 %49, label %50, label %60

; <label>:50:                                     ; preds = %48
  store i8* %.12075, i8** %35, align 8
  %51 = load i32, i32* %37, align 8
  %52 = sub nsw i32 %51, %.1477
  store i32 %52, i32* %39, align 8
  %53 = tail call i32 @TIFFFlushData1(%struct.tiff* %0) #9
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %.loopexit33.loopexit112, label %55

; <label>:55:                                     ; preds = %50
  %56 = load i8*, i8** %35, align 8
  %57 = load i32, i32* %37, align 8
  %58 = load i32, i32* %39, align 8
  %59 = sub nsw i32 %57, %58
  br label %60

; <label>:60:                                     ; preds = %55, %48
  %.221 = phi i8* [ %56, %55 ], [ %.12075, %48 ]
  %.25 = phi i32 [ %59, %55 ], [ %.1477, %48 ]
  %61 = icmp slt i32 %.01176, %16
  br i1 %61, label %.lr.ph107.preheader, label %.critedge._crit_edge

.lr.ph107.preheader:                              ; preds = %60
  br label %.lr.ph107

.lr.ph107:                                        ; preds = %.lr.ph107.preheader, %.critedge.thread.backedge
  %.01105 = phi i32 [ %.01.be, %.critedge.thread.backedge ], [ %.01176, %.lr.ph107.preheader ]
  %62 = sext i32 %.01105 to i64
  %63 = getelementptr inbounds i32, i32* %.09, i64 %62
  %64 = load i32, i32* %63, align 4
  %65 = add nsw i32 %.01105, 1
  %66 = icmp slt i32 %65, %16
  br i1 %66, label %.lr.ph.preheader, label %.critedge.thread.backedge

.lr.ph.preheader:                                 ; preds = %.lr.ph107
  %67 = sext i32 %.01105 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %76
  %indvars.iv = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next, %76 ]
  %68 = phi i32 [ %65, %.lr.ph.preheader ], [ %81, %76 ]
  %.353 = phi i32 [ 1, %.lr.ph.preheader ], [ %77, %76 ]
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32* %.09, i64 %69
  %71 = load i32, i32* %70, align 4
  %72 = xor i32 %71, %64
  %73 = and i32 %72, %47
  %74 = icmp eq i32 %73, 0
  %75 = trunc i64 %indvars.iv to i32
  br i1 %74, label %76, label %.critedge

; <label>:76:                                     ; preds = %.lr.ph
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %77 = add nuw nsw i32 %.353, 1
  %78 = icmp slt i64 %indvars.iv.next, 129
  %79 = add nsw i64 %indvars.iv.next, %67
  %80 = icmp slt i64 %79, %43
  %or.cond = and i1 %78, %80
  %81 = trunc i64 %79 to i32
  %82 = trunc i64 %79 to i32
  br i1 %or.cond, label %.lr.ph, label %.critedge

.critedge:                                        ; preds = %.lr.ph, %76
  %.3.lcssa = phi i32 [ %75, %.lr.ph ], [ %77, %76 ]
  %.lcssa = phi i32 [ %68, %.lr.ph ], [ %82, %76 ]
  %83 = icmp sgt i32 %.3.lcssa, 3
  br i1 %83, label %.critedge._crit_edge.loopexit, label %.critedge.thread.backedge

.critedge.thread.backedge:                        ; preds = %.critedge, %.lr.ph107
  %.2.be = phi i32 [ %.3.lcssa, %.critedge ], [ 1, %.lr.ph107 ]
  %.01.be = phi i32 [ %.lcssa, %.critedge ], [ %65, %.lr.ph107 ]
  %84 = icmp slt i32 %.01.be, %16
  br i1 %84, label %.lr.ph107, label %.critedge._crit_edge.loopexit

.critedge._crit_edge.loopexit:                    ; preds = %.critedge, %.critedge.thread.backedge
  %.01.lcssa.ph = phi i32 [ %.01.be, %.critedge.thread.backedge ], [ %.01105, %.critedge ]
  %.4.ph = phi i32 [ %.2.be, %.critedge.thread.backedge ], [ %.3.lcssa, %.critedge ]
  br label %.critedge._crit_edge

.critedge._crit_edge:                             ; preds = %.critedge._crit_edge.loopexit, %60
  %.01.lcssa = phi i32 [ %.01176, %60 ], [ %.01.lcssa.ph, %.critedge._crit_edge.loopexit ]
  %.4 = phi i32 [ %.178, %60 ], [ %.4.ph, %.critedge._crit_edge.loopexit ]
  %85 = sub nsw i32 %.01.lcssa, %.01176
  %86 = and i32 %85, -2
  %87 = icmp eq i32 %86, 2
  br i1 %87, label %88, label %.preheader32

; <label>:88:                                     ; preds = %.critedge._crit_edge
  %89 = sext i32 %.01176 to i64
  %90 = getelementptr inbounds i32, i32* %.09, i64 %89
  %91 = load i32, i32* %90, align 4
  %92 = and i32 %91, %47
  %93 = add nsw i32 %.01176, 1
  %94 = sext i32 %93 to i64
  br label %95

; <label>:95:                                     ; preds = %100, %88
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %100 ], [ %94, %88 ]
  %indvars.iv.next93 = add nsw i64 %indvars.iv92, 1
  %96 = getelementptr inbounds i32, i32* %.09, i64 %indvars.iv92
  %97 = load i32, i32* %96, align 4
  %98 = and i32 %97, %47
  %99 = icmp eq i32 %98, %92
  br i1 %99, label %100, label %.preheader32.loopexit

; <label>:100:                                    ; preds = %95
  %101 = trunc i64 %indvars.iv.next93 to i32
  %102 = icmp eq i32 %101, %.01.lcssa
  br i1 %102, label %103, label %95

; <label>:103:                                    ; preds = %100
  %104 = trunc i64 %indvars.iv92 to i32
  %105 = sub i32 127, %.01176
  %106 = add i32 %105, %104
  %107 = trunc i32 %106 to i8
  %108 = getelementptr inbounds i8, i8* %.221, i64 1
  store i8 %107, i8* %.221, align 1
  %109 = lshr i32 %92, %46
  %110 = trunc i32 %109 to i8
  %111 = getelementptr inbounds i8, i8* %.221, i64 2
  store i8 %110, i8* %108, align 1
  %112 = add nsw i32 %.25, -2
  br label %.preheader32

.preheader32.loopexit:                            ; preds = %95
  br label %.preheader32

.preheader32:                                     ; preds = %.preheader32.loopexit, %103, %.critedge._crit_edge
  %.524.ph = phi i8* [ %111, %103 ], [ %.221, %.critedge._crit_edge ], [ %.221, %.preheader32.loopexit ]
  %.314.ph = phi i32 [ %.01.lcssa, %103 ], [ %.01176, %.critedge._crit_edge ], [ %.01176, %.preheader32.loopexit ]
  %.58.ph = phi i32 [ %112, %103 ], [ %.25, %.critedge._crit_edge ], [ %.25, %.preheader32.loopexit ]
  %113 = icmp sgt i32 %.01.lcssa, %.314.ph
  br i1 %113, label %.lr.ph71.preheader, label %._crit_edge

.lr.ph71.preheader:                               ; preds = %.preheader32
  %114 = xor i32 %.01.lcssa, -1
  br label %.lr.ph71

.loopexit.loopexit.loopexit:                      ; preds = %.lr.ph64
  br label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.loopexit.loopexit.loopexit, %.lr.ph64.prol.loopexit
  %.lcssa91.wide = phi i64 [ %.lcssa91.wide.unr, %.lr.ph64.prol.loopexit ], [ %indvars.iv.next95.3, %.loopexit.loopexit.loopexit ]
  %.726.lcssa90 = phi i8* [ %.726.lcssa90.unr, %.lr.ph64.prol.loopexit ], [ %.726.3, %.loopexit.loopexit.loopexit ]
  %.7.lcssa89 = phi i32 [ %.7.lcssa89.unr, %.lr.ph64.prol.loopexit ], [ %.7.3, %.loopexit.loopexit.loopexit ]
  %115 = trunc i64 %.lcssa91.wide to i32
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader
  %.415.lcssa = phi i32 [ %.31469, %.preheader ], [ %115, %.loopexit.loopexit ]
  %.726.lcssa = phi i8* [ %.72658, %.preheader ], [ %.726.lcssa90, %.loopexit.loopexit ]
  %.7.lcssa = phi i32 [ %.759, %.preheader ], [ %.7.lcssa89, %.loopexit.loopexit ]
  %116 = icmp sgt i32 %.01.lcssa, %.415.lcssa
  br i1 %116, label %.lr.ph71, label %._crit_edge.loopexit

.lr.ph71:                                         ; preds = %.lr.ph71.preheader, %.loopexit
  %.5870 = phi i32 [ %.7.lcssa, %.loopexit ], [ %.58.ph, %.lr.ph71.preheader ]
  %.31469 = phi i32 [ %.415.lcssa, %.loopexit ], [ %.314.ph, %.lr.ph71.preheader ]
  %.52468 = phi i8* [ %.726.lcssa, %.loopexit ], [ %.524.ph, %.lr.ph71.preheader ]
  %117 = sub nsw i32 %.01.lcssa, %.31469
  %118 = icmp slt i32 %117, 127
  %. = select i1 %118, i32 %117, i32 127
  %119 = add nsw i32 %., 3
  %120 = icmp slt i32 %.5870, %119
  br i1 %120, label %121, label %.preheader

; <label>:121:                                    ; preds = %.lr.ph71
  store i8* %.52468, i8** %35, align 8
  %122 = load i32, i32* %37, align 8
  %123 = sub nsw i32 %122, %.5870
  store i32 %123, i32* %39, align 8
  %124 = tail call i32 @TIFFFlushData1(%struct.tiff* %0) #9
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %.loopexit33.loopexit, label %126

; <label>:126:                                    ; preds = %121
  %127 = load i8*, i8** %35, align 8
  %128 = load i32, i32* %37, align 8
  %129 = load i32, i32* %39, align 8
  %130 = sub nsw i32 %128, %129
  br label %.preheader

.preheader:                                       ; preds = %126, %.lr.ph71
  %.726.sink.ph = phi i8* [ %.52468, %.lr.ph71 ], [ %127, %126 ]
  %.7.in.ph = phi i32 [ %.5870, %.lr.ph71 ], [ %130, %126 ]
  %131 = trunc i32 %. to i8
  store i8 %131, i8* %.726.sink.ph, align 1
  %.72658 = getelementptr inbounds i8, i8* %.726.sink.ph, i64 1
  %.759 = add nsw i32 %.7.in.ph, -1
  %132 = icmp eq i32 %., 0
  br i1 %132, label %.loopexit, label %.lr.ph64.preheader

.lr.ph64.preheader:                               ; preds = %.preheader
  %133 = sext i32 %.31469 to i64
  %134 = add i32 %.31469, %114
  %135 = icmp sgt i32 %134, -128
  %smax = select i1 %135, i32 %134, i32 -128
  %136 = sub i32 -2, %smax
  %xtraiter = and i32 %., 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph64.prol.loopexit, label %.lr.ph64.prol.preheader

.lr.ph64.prol.preheader:                          ; preds = %.lr.ph64.preheader
  br label %.lr.ph64.prol

.lr.ph64.prol:                                    ; preds = %.lr.ph64.prol.preheader, %.lr.ph64.prol
  %indvars.iv94.prol = phi i64 [ %indvars.iv.next95.prol, %.lr.ph64.prol ], [ %133, %.lr.ph64.prol.preheader ]
  %.763.prol = phi i32 [ %.7.prol, %.lr.ph64.prol ], [ %.759, %.lr.ph64.prol.preheader ]
  %.72662.prol = phi i8* [ %.726.prol, %.lr.ph64.prol ], [ %.72658, %.lr.ph64.prol.preheader ]
  %.21860.prol = phi i32 [ %137, %.lr.ph64.prol ], [ %., %.lr.ph64.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph64.prol ], [ %xtraiter, %.lr.ph64.prol.preheader ]
  %137 = add nsw i32 %.21860.prol, -1
  %indvars.iv.next95.prol = add nsw i64 %indvars.iv94.prol, 1
  %138 = getelementptr inbounds i32, i32* %.09, i64 %indvars.iv94.prol
  %139 = load i32, i32* %138, align 4
  %140 = lshr i32 %139, %46
  %141 = trunc i32 %140 to i8
  store i8 %141, i8* %.72662.prol, align 1
  %.726.prol = getelementptr inbounds i8, i8* %.72662.prol, i64 1
  %.7.prol = add nsw i32 %.763.prol, -1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph64.prol.loopexit.loopexit, label %.lr.ph64.prol, !llvm.loop !4

.lr.ph64.prol.loopexit.loopexit:                  ; preds = %.lr.ph64.prol
  br label %.lr.ph64.prol.loopexit

.lr.ph64.prol.loopexit:                           ; preds = %.lr.ph64.prol.loopexit.loopexit, %.lr.ph64.preheader
  %.lcssa91.wide.unr = phi i64 [ undef, %.lr.ph64.preheader ], [ %indvars.iv.next95.prol, %.lr.ph64.prol.loopexit.loopexit ]
  %.726.lcssa90.unr = phi i8* [ undef, %.lr.ph64.preheader ], [ %.726.prol, %.lr.ph64.prol.loopexit.loopexit ]
  %.7.lcssa89.unr = phi i32 [ undef, %.lr.ph64.preheader ], [ %.7.prol, %.lr.ph64.prol.loopexit.loopexit ]
  %indvars.iv94.unr = phi i64 [ %133, %.lr.ph64.preheader ], [ %indvars.iv.next95.prol, %.lr.ph64.prol.loopexit.loopexit ]
  %.763.unr = phi i32 [ %.759, %.lr.ph64.preheader ], [ %.7.prol, %.lr.ph64.prol.loopexit.loopexit ]
  %.72662.unr = phi i8* [ %.72658, %.lr.ph64.preheader ], [ %.726.prol, %.lr.ph64.prol.loopexit.loopexit ]
  %.21860.unr = phi i32 [ %., %.lr.ph64.preheader ], [ %137, %.lr.ph64.prol.loopexit.loopexit ]
  %142 = icmp ult i32 %136, 3
  br i1 %142, label %.loopexit.loopexit, label %.lr.ph64.preheader111

.lr.ph64.preheader111:                            ; preds = %.lr.ph64.prol.loopexit
  br label %.lr.ph64

.lr.ph64:                                         ; preds = %.lr.ph64.preheader111, %.lr.ph64
  %indvars.iv94 = phi i64 [ %indvars.iv.next95.3, %.lr.ph64 ], [ %indvars.iv94.unr, %.lr.ph64.preheader111 ]
  %.763 = phi i32 [ %.7.3, %.lr.ph64 ], [ %.763.unr, %.lr.ph64.preheader111 ]
  %.72662 = phi i8* [ %.726.3, %.lr.ph64 ], [ %.72662.unr, %.lr.ph64.preheader111 ]
  %.21860 = phi i32 [ %155, %.lr.ph64 ], [ %.21860.unr, %.lr.ph64.preheader111 ]
  %indvars.iv.next95 = add nsw i64 %indvars.iv94, 1
  %143 = getelementptr inbounds i32, i32* %.09, i64 %indvars.iv94
  %144 = load i32, i32* %143, align 4
  %145 = lshr i32 %144, %46
  %146 = trunc i32 %145 to i8
  store i8 %146, i8* %.72662, align 1
  %.726 = getelementptr inbounds i8, i8* %.72662, i64 1
  %indvars.iv.next95.1 = add nsw i64 %indvars.iv94, 2
  %147 = getelementptr inbounds i32, i32* %.09, i64 %indvars.iv.next95
  %148 = load i32, i32* %147, align 4
  %149 = lshr i32 %148, %46
  %150 = trunc i32 %149 to i8
  store i8 %150, i8* %.726, align 1
  %.726.1 = getelementptr inbounds i8, i8* %.72662, i64 2
  %indvars.iv.next95.2 = add nsw i64 %indvars.iv94, 3
  %151 = getelementptr inbounds i32, i32* %.09, i64 %indvars.iv.next95.1
  %152 = load i32, i32* %151, align 4
  %153 = lshr i32 %152, %46
  %154 = trunc i32 %153 to i8
  store i8 %154, i8* %.726.1, align 1
  %.726.2 = getelementptr inbounds i8, i8* %.72662, i64 3
  %155 = add nsw i32 %.21860, -4
  %indvars.iv.next95.3 = add nsw i64 %indvars.iv94, 4
  %156 = getelementptr inbounds i32, i32* %.09, i64 %indvars.iv.next95.2
  %157 = load i32, i32* %156, align 4
  %158 = lshr i32 %157, %46
  %159 = trunc i32 %158 to i8
  store i8 %159, i8* %.726.2, align 1
  %.726.3 = getelementptr inbounds i8, i8* %.72662, i64 4
  %.7.3 = add nsw i32 %.763, -4
  %160 = icmp eq i32 %155, 0
  br i1 %160, label %.loopexit.loopexit.loopexit, label %.lr.ph64

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader32
  %.524.lcssa = phi i8* [ %.524.ph, %.preheader32 ], [ %.726.lcssa, %._crit_edge.loopexit ]
  %.314.lcssa = phi i32 [ %.314.ph, %.preheader32 ], [ %.415.lcssa, %._crit_edge.loopexit ]
  %.58.lcssa = phi i32 [ %.58.ph, %.preheader32 ], [ %.7.lcssa, %._crit_edge.loopexit ]
  %161 = icmp sgt i32 %.4, 3
  br i1 %161, label %162, label %173

; <label>:162:                                    ; preds = %._crit_edge
  %163 = add nsw i32 %.4, 126
  %164 = trunc i32 %163 to i8
  %165 = getelementptr inbounds i8, i8* %.524.lcssa, i64 1
  store i8 %164, i8* %.524.lcssa, align 1
  %166 = sext i32 %.01.lcssa to i64
  %167 = getelementptr inbounds i32, i32* %.09, i64 %166
  %168 = load i32, i32* %167, align 4
  %169 = lshr i32 %168, %46
  %170 = trunc i32 %169 to i8
  %171 = getelementptr inbounds i8, i8* %.524.lcssa, i64 2
  store i8 %170, i8* %165, align 1
  %172 = add nsw i32 %.58.lcssa, -2
  br label %173

; <label>:173:                                    ; preds = %162, %._crit_edge
  %.827 = phi i8* [ %171, %162 ], [ %.524.lcssa, %._crit_edge ]
  %.8 = phi i32 [ %172, %162 ], [ %.58.lcssa, %._crit_edge ]
  %.5 = phi i32 [ %.4, %162 ], [ 0, %._crit_edge ]
  %174 = add nsw i32 %.5, %.314.lcssa
  %175 = icmp slt i32 %174, %16
  br i1 %175, label %48, label %.loopexit35.loopexit

; <label>:176:                                    ; preds = %.loopexit35
  store i8* %.120.lcssa, i8** %35, align 8
  %177 = load i32, i32* %37, align 8
  %178 = sub nsw i32 %177, %.14.lcssa
  store i32 %178, i32* %39, align 8
  br label %.loopexit33

.loopexit33.loopexit:                             ; preds = %121
  br label %.loopexit33

.loopexit33.loopexit112:                          ; preds = %50
  br label %.loopexit33

.loopexit33:                                      ; preds = %.loopexit33.loopexit112, %.loopexit33.loopexit, %176
  %.0 = phi i32 [ 0, %176 ], [ -1, %.loopexit33.loopexit ], [ -1, %.loopexit33.loopexit112 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal void @Luv32fromXYZ(%struct.logLuvState* nocapture readonly, i8* nocapture readonly, i32) #0 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %5 = bitcast i8* %1 to float*
  %6 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %0, i64 0, i32 2
  %7 = bitcast i8*** %6 to i32**
  %8 = load i32*, i32** %7, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.05 = phi float* [ %12, %.lr.ph ], [ %5, %.lr.ph.preheader ]
  %.014 = phi i32* [ %11, %.lr.ph ], [ %8, %.lr.ph.preheader ]
  %.023 = phi i32 [ %9, %.lr.ph ], [ %2, %.lr.ph.preheader ]
  %9 = add nsw i32 %.023, -1
  %10 = tail call fastcc i32 @pix32fromXYZ(float* %.05)
  %11 = getelementptr inbounds i32, i32* %.014, i64 1
  store i32 %10, i32* %.014, align 4
  %12 = getelementptr inbounds float, float* %.05, i64 3
  %13 = icmp sgt i32 %.023, 1
  br i1 %13, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @Luv32fromLuv48(%struct.logLuvState* nocapture readonly, i8* nocapture readonly, i32) #5 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %5 = bitcast i8* %1 to i16*
  %6 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %0, i64 0, i32 2
  %7 = bitcast i8*** %6 to i32**
  %8 = load i32*, i32** %7, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.05 = phi i16* [ %28, %.lr.ph ], [ %5, %.lr.ph.preheader ]
  %.014 = phi i32* [ %27, %.lr.ph ], [ %8, %.lr.ph.preheader ]
  %.023 = phi i32 [ %9, %.lr.ph ], [ %2, %.lr.ph.preheader ]
  %9 = add nsw i32 %.023, -1
  %10 = load i16, i16* %.05, align 2
  %11 = zext i16 %10 to i32
  %12 = shl nuw i32 %11, 16
  %13 = getelementptr inbounds i16, i16* %.05, i64 1
  %14 = load i16, i16* %13, align 2
  %15 = sext i16 %14 to i32
  %16 = mul nsw i32 %15, 410
  %17 = lshr i32 %16, 7
  %18 = and i32 %17, 65280
  %19 = or i32 %18, %12
  %20 = getelementptr inbounds i16, i16* %.05, i64 2
  %21 = load i16, i16* %20, align 2
  %22 = sext i16 %21 to i32
  %23 = mul nsw i32 %22, 410
  %24 = lshr i32 %23, 15
  %25 = and i32 %24, 255
  %26 = or i32 %19, %25
  %27 = getelementptr inbounds i32, i32* %.014, i64 1
  store i32 %26, i32* %.014, align 4
  %28 = getelementptr inbounds i16, i16* %.05, i64 3
  %29 = icmp sgt i32 %.023, 1
  br i1 %29, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogL16Encode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %6 = bitcast i8** %5 to %struct.logLuvState**
  %7 = load %struct.logLuvState*, %struct.logLuvState** %6, align 8
  %8 = icmp eq i16 %3, 0
  br i1 %8, label %10, label %9

; <label>:9:                                      ; preds = %4
  tail call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 359, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__PRETTY_FUNCTION__.LogL16Encode, i64 0, i64 0)) #8
  unreachable

; <label>:10:                                     ; preds = %4
  %11 = icmp eq %struct.logLuvState* %7, null
  br i1 %11, label %12, label %13

; <label>:12:                                     ; preds = %10
  tail call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 360, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__PRETTY_FUNCTION__.LogL16Encode, i64 0, i64 0)) #8
  unreachable

; <label>:13:                                     ; preds = %10
  %14 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 1
  %15 = load i32, i32* %14, align 4
  %16 = sdiv i32 %2, %15
  %17 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 0
  %18 = load i32, i32* %17, align 8
  %19 = icmp eq i32 %18, 1
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %13
  %21 = bitcast i8* %1 to i16*
  br label %34

; <label>:22:                                     ; preds = %13
  %23 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 3
  %24 = load i16, i16* %23, align 8
  %25 = sext i16 %24 to i32
  %26 = icmp slt i32 %25, %16
  br i1 %26, label %27, label %28

; <label>:27:                                     ; preds = %22
  tail call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 367, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__PRETTY_FUNCTION__.LogL16Encode, i64 0, i64 0)) #8
  unreachable

; <label>:28:                                     ; preds = %22
  %29 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 2
  %30 = bitcast i8*** %29 to i16**
  %31 = load i16*, i16** %30, align 8
  %32 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %7, i64 0, i32 4
  %33 = load void (%struct.logLuvState*, i8*, i32)*, void (%struct.logLuvState*, i8*, i32)** %32, align 8
  tail call void %33(%struct.logLuvState* nonnull %7, i8* %1, i32 %16) #9
  br label %34

; <label>:34:                                     ; preds = %28, %20
  %.09 = phi i16* [ %21, %20 ], [ %31, %28 ]
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %36 = load i8*, i8** %35, align 8
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %38 = load i32, i32* %37, align 8
  %39 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %40 = load i32, i32* %39, align 8
  %41 = sub nsw i32 %38, %40
  %42 = icmp sgt i32 %16, 0
  %43 = sext i32 %16 to i64
  %scevgep116 = getelementptr i16, i16* %.09, i64 2
  br label %.preheader36

.loopexit37.loopexit:                             ; preds = %246
  br label %.loopexit37

.loopexit37:                                      ; preds = %.loopexit37.loopexit, %.preheader36
  %.120.lcssa = phi i8* [ %.01987, %.preheader36 ], [ %.827, %.loopexit37.loopexit ]
  %.14.lcssa = phi i32 [ %.0388, %.preheader36 ], [ %.8, %.loopexit37.loopexit ]
  %.1.lcssa = phi i32 [ %.0289, %.preheader36 ], [ %.5, %.loopexit37.loopexit ]
  %44 = add nsw i32 %46, -8
  %45 = icmp sgt i32 %44, -1
  br i1 %45, label %.preheader36, label %249

.preheader36:                                     ; preds = %34, %.loopexit37
  %46 = phi i32 [ 8, %34 ], [ %44, %.loopexit37 ]
  %.0289 = phi i32 [ 0, %34 ], [ %.1.lcssa, %.loopexit37 ]
  %.0388 = phi i32 [ %41, %34 ], [ %.14.lcssa, %.loopexit37 ]
  %.01987 = phi i8* [ %36, %34 ], [ %.120.lcssa, %.loopexit37 ]
  br i1 %42, label %.lr.ph83, label %.loopexit37

.lr.ph83:                                         ; preds = %.preheader36
  %47 = shl i32 255, %46
  %broadcast.splatinsert135 = insertelement <4 x i32> undef, i32 %46, i32 0
  %broadcast.splat136 = shufflevector <4 x i32> %broadcast.splatinsert135, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %48

; <label>:48:                                     ; preds = %.lr.ph83, %246
  %.182 = phi i32 [ %.0289, %.lr.ph83 ], [ %.5, %246 ]
  %.1481 = phi i32 [ %.0388, %.lr.ph83 ], [ %.8, %246 ]
  %.01180 = phi i32 [ 0, %.lr.ph83 ], [ %247, %246 ]
  %.12079 = phi i8* [ %.01987, %.lr.ph83 ], [ %.827, %246 ]
  %49 = icmp slt i32 %.1481, 4
  br i1 %49, label %50, label %60

; <label>:50:                                     ; preds = %48
  store i8* %.12079, i8** %35, align 8
  %51 = load i32, i32* %37, align 8
  %52 = sub nsw i32 %51, %.1481
  store i32 %52, i32* %39, align 8
  %53 = tail call i32 @TIFFFlushData1(%struct.tiff* %0) #9
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %.loopexit35.loopexit142, label %55

; <label>:55:                                     ; preds = %50
  %56 = load i8*, i8** %35, align 8
  %57 = load i32, i32* %37, align 8
  %58 = load i32, i32* %39, align 8
  %59 = sub nsw i32 %57, %58
  br label %60

; <label>:60:                                     ; preds = %55, %48
  %.221 = phi i8* [ %56, %55 ], [ %.12079, %48 ]
  %.25 = phi i32 [ %59, %55 ], [ %.1481, %48 ]
  %61 = icmp slt i32 %.01180, %16
  br i1 %61, label %.lr.ph109.preheader, label %.critedge._crit_edge

.lr.ph109.preheader:                              ; preds = %60
  br label %.lr.ph109

.lr.ph109:                                        ; preds = %.lr.ph109.preheader, %.critedge.thread.backedge
  %.01107 = phi i32 [ %.01.be, %.critedge.thread.backedge ], [ %.01180, %.lr.ph109.preheader ]
  %62 = add nsw i32 %.01107, 1
  %63 = icmp slt i32 %62, %16
  br i1 %63, label %.lr.ph, label %.critedge.thread.backedge

.lr.ph:                                           ; preds = %.lr.ph109
  %64 = sext i32 %.01107 to i64
  %65 = getelementptr inbounds i16, i16* %.09, i64 %64
  %66 = load i16, i16* %65, align 2
  %67 = zext i16 %66 to i32
  %68 = and i32 %67, %47
  %sext29 = shl nuw i32 %68, 16
  %69 = ashr exact i32 %sext29, 16
  %70 = sext i32 %.01107 to i64
  br label %71

; <label>:71:                                     ; preds = %.lr.ph, %80
  %indvars.iv = phi i64 [ 1, %.lr.ph ], [ %indvars.iv.next, %80 ]
  %72 = phi i32 [ %62, %.lr.ph ], [ %85, %80 ]
  %.357 = phi i32 [ 1, %.lr.ph ], [ %81, %80 ]
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i16, i16* %.09, i64 %73
  %75 = load i16, i16* %74, align 2
  %76 = sext i16 %75 to i32
  %77 = and i32 %76, %47
  %78 = icmp eq i32 %77, %69
  %79 = trunc i64 %indvars.iv to i32
  br i1 %78, label %80, label %.critedge

; <label>:80:                                     ; preds = %71
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %81 = add nuw nsw i32 %.357, 1
  %82 = icmp slt i64 %indvars.iv.next, 129
  %83 = add nsw i64 %indvars.iv.next, %70
  %84 = icmp slt i64 %83, %43
  %or.cond = and i1 %82, %84
  %85 = trunc i64 %83 to i32
  %86 = trunc i64 %83 to i32
  br i1 %or.cond, label %71, label %.critedge

.critedge:                                        ; preds = %71, %80
  %.3.lcssa = phi i32 [ %79, %71 ], [ %81, %80 ]
  %.lcssa = phi i32 [ %72, %71 ], [ %86, %80 ]
  %87 = icmp sgt i32 %.3.lcssa, 3
  br i1 %87, label %.critedge._crit_edge.loopexit, label %.critedge.thread.backedge

.critedge.thread.backedge:                        ; preds = %.critedge, %.lr.ph109
  %.2.be = phi i32 [ %.3.lcssa, %.critedge ], [ 1, %.lr.ph109 ]
  %.01.be = phi i32 [ %.lcssa, %.critedge ], [ %62, %.lr.ph109 ]
  %88 = icmp slt i32 %.01.be, %16
  br i1 %88, label %.lr.ph109, label %.critedge._crit_edge.loopexit

.critedge._crit_edge.loopexit:                    ; preds = %.critedge, %.critedge.thread.backedge
  %.01.lcssa.ph = phi i32 [ %.01.be, %.critedge.thread.backedge ], [ %.01107, %.critedge ]
  %.4.ph = phi i32 [ %.2.be, %.critedge.thread.backedge ], [ %.3.lcssa, %.critedge ]
  br label %.critedge._crit_edge

.critedge._crit_edge:                             ; preds = %.critedge._crit_edge.loopexit, %60
  %.01.lcssa = phi i32 [ %.01180, %60 ], [ %.01.lcssa.ph, %.critedge._crit_edge.loopexit ]
  %.4 = phi i32 [ %.182, %60 ], [ %.4.ph, %.critedge._crit_edge.loopexit ]
  %89 = sub nsw i32 %.01.lcssa, %.01180
  %90 = and i32 %89, -2
  %91 = icmp eq i32 %90, 2
  br i1 %91, label %92, label %.preheader34

; <label>:92:                                     ; preds = %.critedge._crit_edge
  %93 = sext i32 %.01180 to i64
  %94 = getelementptr inbounds i16, i16* %.09, i64 %93
  %95 = load i16, i16* %94, align 2
  %96 = zext i16 %95 to i32
  %97 = and i32 %96, %47
  %98 = add nsw i32 %.01180, 1
  %sext = shl nuw i32 %97, 16
  %99 = ashr exact i32 %sext, 16
  %100 = sext i32 %98 to i64
  br label %101

; <label>:101:                                    ; preds = %107, %92
  %indvars.iv96 = phi i64 [ %indvars.iv.next97, %107 ], [ %100, %92 ]
  %indvars.iv.next97 = add nsw i64 %indvars.iv96, 1
  %102 = getelementptr inbounds i16, i16* %.09, i64 %indvars.iv96
  %103 = load i16, i16* %102, align 2
  %104 = sext i16 %103 to i32
  %105 = and i32 %104, %47
  %106 = icmp eq i32 %105, %99
  br i1 %106, label %107, label %.preheader34.loopexit

; <label>:107:                                    ; preds = %101
  %108 = trunc i64 %indvars.iv.next97 to i32
  %109 = icmp eq i32 %108, %.01.lcssa
  br i1 %109, label %110, label %101

; <label>:110:                                    ; preds = %107
  %111 = trunc i64 %indvars.iv96 to i32
  %112 = sub i32 127, %.01180
  %113 = add i32 %112, %111
  %114 = trunc i32 %113 to i8
  %115 = getelementptr inbounds i8, i8* %.221, i64 1
  store i8 %114, i8* %.221, align 1
  %116 = ashr i32 %99, %46
  %117 = trunc i32 %116 to i8
  %118 = getelementptr inbounds i8, i8* %.221, i64 2
  store i8 %117, i8* %115, align 1
  %119 = add nsw i32 %.25, -2
  br label %.preheader34

.preheader34.loopexit:                            ; preds = %101
  br label %.preheader34

.preheader34:                                     ; preds = %.preheader34.loopexit, %110, %.critedge._crit_edge
  %.524.ph = phi i8* [ %118, %110 ], [ %.221, %.critedge._crit_edge ], [ %.221, %.preheader34.loopexit ]
  %.314.ph = phi i32 [ %.01.lcssa, %110 ], [ %.01180, %.critedge._crit_edge ], [ %.01180, %.preheader34.loopexit ]
  %.58.ph = phi i32 [ %119, %110 ], [ %.25, %.critedge._crit_edge ], [ %.25, %.preheader34.loopexit ]
  %120 = icmp sgt i32 %.01.lcssa, %.314.ph
  br i1 %120, label %.lr.ph75.preheader, label %._crit_edge

.lr.ph75.preheader:                               ; preds = %.preheader34
  %121 = xor i32 %.01.lcssa, -1
  br label %.lr.ph75

.loopexit.loopexit.loopexit.unr-lcssa:            ; preds = %.lr.ph68
  br label %.loopexit.loopexit.loopexit

.loopexit.loopexit.loopexit:                      ; preds = %.lr.ph68.prol.loopexit146, %.loopexit.loopexit.loopexit.unr-lcssa
  %indvars.iv.next99.1.lcssa = phi i64 [ %indvars.iv.next99.1.lcssa.unr.ph, %.lr.ph68.prol.loopexit146 ], [ %indvars.iv.next99.1.1, %.loopexit.loopexit.loopexit.unr-lcssa ]
  %.726.1.lcssa = phi i8* [ %.726.1.lcssa.unr.ph, %.lr.ph68.prol.loopexit146 ], [ %.726.1.1, %.loopexit.loopexit.loopexit.unr-lcssa ]
  %.7.1.lcssa = phi i32 [ %.7.1.lcssa.unr.ph, %.lr.ph68.prol.loopexit146 ], [ %.7.1.1, %.loopexit.loopexit.loopexit.unr-lcssa ]
  br label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.loopexit.loopexit.loopexit, %middle.block, %.lr.ph68.prol.loopexit
  %.lcssa95.wide = phi i64 [ %.lcssa95.wide.unr.ph, %.lr.ph68.prol.loopexit ], [ %ind.end, %middle.block ], [ %indvars.iv.next99.1.lcssa, %.loopexit.loopexit.loopexit ]
  %.726.lcssa94 = phi i8* [ %.726.lcssa94.unr.ph, %.lr.ph68.prol.loopexit ], [ %ind.end120, %middle.block ], [ %.726.1.lcssa, %.loopexit.loopexit.loopexit ]
  %.7.lcssa93 = phi i32 [ %.7.lcssa93.unr.ph, %.lr.ph68.prol.loopexit ], [ %195, %middle.block ], [ %.7.1.lcssa, %.loopexit.loopexit.loopexit ]
  %122 = trunc i64 %.lcssa95.wide to i32
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader
  %.415.lcssa = phi i32 [ %.31473, %.preheader ], [ %122, %.loopexit.loopexit ]
  %.726.lcssa = phi i8* [ %.72662, %.preheader ], [ %.726.lcssa94, %.loopexit.loopexit ]
  %.7.lcssa = phi i32 [ %.763, %.preheader ], [ %.7.lcssa93, %.loopexit.loopexit ]
  %123 = icmp sgt i32 %.01.lcssa, %.415.lcssa
  br i1 %123, label %.lr.ph75, label %._crit_edge.loopexit

.lr.ph75:                                         ; preds = %.lr.ph75.preheader, %.loopexit
  %.5874 = phi i32 [ %.7.lcssa, %.loopexit ], [ %.58.ph, %.lr.ph75.preheader ]
  %.31473 = phi i32 [ %.415.lcssa, %.loopexit ], [ %.314.ph, %.lr.ph75.preheader ]
  %.52472 = phi i8* [ %.726.lcssa, %.loopexit ], [ %.524.ph, %.lr.ph75.preheader ]
  %124 = sub nsw i32 %.01.lcssa, %.31473
  %125 = icmp slt i32 %124, 127
  %. = select i1 %125, i32 %124, i32 127
  %126 = add nsw i32 %., 3
  %127 = icmp slt i32 %.5874, %126
  br i1 %127, label %128, label %.preheader

; <label>:128:                                    ; preds = %.lr.ph75
  store i8* %.52472, i8** %35, align 8
  %129 = load i32, i32* %37, align 8
  %130 = sub nsw i32 %129, %.5874
  store i32 %130, i32* %39, align 8
  %131 = tail call i32 @TIFFFlushData1(%struct.tiff* %0) #9
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %.loopexit35.loopexit, label %133

; <label>:133:                                    ; preds = %128
  %134 = load i8*, i8** %35, align 8
  %135 = load i32, i32* %37, align 8
  %136 = load i32, i32* %39, align 8
  %137 = sub nsw i32 %135, %136
  br label %.preheader

.preheader:                                       ; preds = %133, %.lr.ph75
  %.726.sink.ph = phi i8* [ %.52472, %.lr.ph75 ], [ %134, %133 ]
  %.7.in.ph = phi i32 [ %.5874, %.lr.ph75 ], [ %137, %133 ]
  %138 = trunc i32 %. to i8
  store i8 %138, i8* %.726.sink.ph, align 1
  %.72662 = getelementptr inbounds i8, i8* %.726.sink.ph, i64 1
  %.763 = add nsw i32 %.7.in.ph, -1
  %139 = icmp eq i32 %., 0
  br i1 %139, label %.loopexit, label %.lr.ph68.preheader

.lr.ph68.preheader:                               ; preds = %.preheader
  %140 = sext i32 %.31473 to i64
  %141 = add i32 %.31473, %121
  %xtraiter = and i32 %., 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph68.prol.loopexit, label %.lr.ph68.prol

.lr.ph68.prol:                                    ; preds = %.lr.ph68.preheader
  %142 = add nsw i32 %., -1
  %indvars.iv.next99.prol = add nsw i64 %140, 1
  %143 = getelementptr inbounds i16, i16* %.09, i64 %140
  %144 = load i16, i16* %143, align 2
  %145 = sext i16 %144 to i32
  %146 = ashr i32 %145, %46
  %147 = trunc i32 %146 to i8
  store i8 %147, i8* %.72662, align 1
  %.726.prol = getelementptr inbounds i8, i8* %.726.sink.ph, i64 2
  %.7.prol = add nsw i32 %.7.in.ph, -2
  br label %.lr.ph68.prol.loopexit

.lr.ph68.prol.loopexit:                           ; preds = %.lr.ph68.prol, %.lr.ph68.preheader
  %.lcssa95.wide.unr.ph = phi i64 [ %indvars.iv.next99.prol, %.lr.ph68.prol ], [ undef, %.lr.ph68.preheader ]
  %.726.lcssa94.unr.ph = phi i8* [ %.726.prol, %.lr.ph68.prol ], [ undef, %.lr.ph68.preheader ]
  %.7.lcssa93.unr.ph = phi i32 [ %.7.prol, %.lr.ph68.prol ], [ undef, %.lr.ph68.preheader ]
  %indvars.iv98.unr.ph = phi i64 [ %indvars.iv.next99.prol, %.lr.ph68.prol ], [ %140, %.lr.ph68.preheader ]
  %.767.unr.ph = phi i32 [ %.7.prol, %.lr.ph68.prol ], [ %.763, %.lr.ph68.preheader ]
  %.72666.unr.ph = phi i8* [ %.726.prol, %.lr.ph68.prol ], [ %.72662, %.lr.ph68.preheader ]
  %.21864.unr.ph = phi i32 [ %142, %.lr.ph68.prol ], [ %., %.lr.ph68.preheader ]
  %148 = icmp eq i32 %141, -2
  br i1 %148, label %.loopexit.loopexit, label %.lr.ph68.preheader104

.lr.ph68.preheader104:                            ; preds = %.lr.ph68.prol.loopexit
  %149 = add i32 %.21864.unr.ph, -2
  %150 = lshr i32 %149, 1
  %addconv = add nuw i32 %150, 1
  %151 = zext i32 %addconv to i64
  %min.iters.check = icmp ult i32 %addconv, 8
  br i1 %min.iters.check, label %.lr.ph68.preheader141, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph68.preheader104
  %n.mod.vf = and i64 %151, 7
  %n.vec = sub nsw i64 %151, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %152 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %.767.unr.ph, i32 0
  br i1 %cmp.zero, label %.lr.ph68.preheader141, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i8, i8* %.72666.unr.ph, i64 2
  %153 = add i32 %.21864.unr.ph, -2
  %154 = and i32 %153, -2
  %155 = zext i32 %154 to i64
  %scevgep113 = getelementptr i8, i8* %scevgep, i64 %155
  %scevgep114 = getelementptr i16, i16* %.09, i64 %indvars.iv98.unr.ph
  %scevgep114115 = bitcast i16* %scevgep114 to i8*
  %156 = add nsw i64 %indvars.iv98.unr.ph, %155
  %scevgep117 = getelementptr i16, i16* %scevgep116, i64 %156
  %scevgep117118 = bitcast i16* %scevgep117 to i8*
  %bound0 = icmp ult i8* %.72666.unr.ph, %scevgep117118
  %bound1 = icmp ult i8* %scevgep114115, %scevgep113
  %memcheck.conflict = and i1 %bound0, %bound1
  %157 = add nsw i64 %indvars.iv98.unr.ph, 2
  %158 = shl nuw i32 %150, 1
  %159 = zext i32 %158 to i64
  %160 = add nsw i64 %157, %159
  %161 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub nsw i64 %160, %161
  %162 = shl nsw i64 %n.vec, 1
  %ind.end120 = getelementptr i8, i8* %.72666.unr.ph, i64 %162
  %cast.crd = trunc i64 %n.vec to i32
  %163 = shl i32 %cast.crd, 1
  %ind.end122 = sub i32 %.21864.unr.ph, %163
  br i1 %memcheck.conflict, label %.lr.ph68.preheader141, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %152, %vector.ph ], [ %192, %vector.body ]
  %vec.phi124 = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %193, %vector.body ]
  %164 = shl i64 %index, 1
  %offset.idx = add i64 %indvars.iv98.unr.ph, %164
  %165 = add i64 %indvars.iv98.unr.ph, %164
  %166 = add i64 %offset.idx, 8
  %167 = shl i64 %index, 1
  %next.gep = getelementptr i8, i8* %.72666.unr.ph, i64 %167
  %168 = shl i64 %index, 1
  %169 = or i64 %168, 8
  %next.gep125 = getelementptr i8, i8* %.72666.unr.ph, i64 %169
  %170 = getelementptr inbounds i16, i16* %.09, i64 %165
  %171 = getelementptr inbounds i16, i16* %.09, i64 %166
  %172 = bitcast i16* %170 to <8 x i16>*
  %173 = bitcast i16* %171 to <8 x i16>*
  %wide.vec = load <8 x i16>, <8 x i16>* %172, align 2, !alias.scope !5
  %wide.vec131 = load <8 x i16>, <8 x i16>* %173, align 2, !alias.scope !5
  %strided.vec = shufflevector <8 x i16> %wide.vec, <8 x i16> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %strided.vec132 = shufflevector <8 x i16> %wide.vec131, <8 x i16> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %strided.vec133 = shufflevector <8 x i16> %wide.vec, <8 x i16> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %strided.vec134 = shufflevector <8 x i16> %wide.vec131, <8 x i16> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %174 = sext <4 x i16> %strided.vec to <4 x i32>
  %175 = sext <4 x i16> %strided.vec132 to <4 x i32>
  %176 = ashr <4 x i32> %174, %broadcast.splat136
  %177 = ashr <4 x i32> %175, %broadcast.splat136
  %178 = trunc <4 x i32> %176 to <4 x i8>
  %179 = trunc <4 x i32> %177 to <4 x i8>
  %180 = getelementptr inbounds i8, i8* %next.gep, i64 1
  %181 = getelementptr inbounds i8, i8* %next.gep125, i64 1
  %182 = sext <4 x i16> %strided.vec133 to <4 x i32>
  %183 = sext <4 x i16> %strided.vec134 to <4 x i32>
  %184 = ashr <4 x i32> %182, %broadcast.splat136
  %185 = ashr <4 x i32> %183, %broadcast.splat136
  %186 = trunc <4 x i32> %184 to <4 x i8>
  %187 = trunc <4 x i32> %185 to <4 x i8>
  %188 = getelementptr i8, i8* %180, i64 -1
  %189 = bitcast i8* %188 to <8 x i8>*
  %190 = getelementptr i8, i8* %181, i64 -1
  %191 = bitcast i8* %190 to <8 x i8>*
  %interleaved.vec = shufflevector <4 x i8> %178, <4 x i8> %186, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x i8> %interleaved.vec, <8 x i8>* %189, align 1, !alias.scope !8, !noalias !5
  %interleaved.vec137 = shufflevector <4 x i8> %179, <4 x i8> %187, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x i8> %interleaved.vec137, <8 x i8>* %191, align 1, !alias.scope !8, !noalias !5
  %192 = add nsw <4 x i32> %vec.phi, <i32 -2, i32 -2, i32 -2, i32 -2>
  %193 = add nsw <4 x i32> %vec.phi124, <i32 -2, i32 -2, i32 -2, i32 -2>
  %index.next = add i64 %index, 8
  %194 = icmp eq i64 %index.next, %n.vec
  br i1 %194, label %middle.block, label %vector.body, !llvm.loop !10

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <4 x i32> %193, %192
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx138 = add <4 x i32> %bin.rdx, %rdx.shuf
  %rdx.shuf139 = shufflevector <4 x i32> %bin.rdx138, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx140 = add <4 x i32> %bin.rdx138, %rdx.shuf139
  %195 = extractelement <4 x i32> %bin.rdx140, i32 0
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.loopexit.loopexit, label %.lr.ph68.preheader141

.lr.ph68.preheader141:                            ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph68.preheader104
  %indvars.iv98.ph = phi i64 [ %indvars.iv98.unr.ph, %vector.memcheck ], [ %indvars.iv98.unr.ph, %min.iters.checked ], [ %indvars.iv98.unr.ph, %.lr.ph68.preheader104 ], [ %ind.end, %middle.block ]
  %.767.ph = phi i32 [ %.767.unr.ph, %vector.memcheck ], [ %.767.unr.ph, %min.iters.checked ], [ %.767.unr.ph, %.lr.ph68.preheader104 ], [ %195, %middle.block ]
  %.72666.ph = phi i8* [ %.72666.unr.ph, %vector.memcheck ], [ %.72666.unr.ph, %min.iters.checked ], [ %.72666.unr.ph, %.lr.ph68.preheader104 ], [ %ind.end120, %middle.block ]
  %.21864.ph = phi i32 [ %.21864.unr.ph, %vector.memcheck ], [ %.21864.unr.ph, %min.iters.checked ], [ %.21864.unr.ph, %.lr.ph68.preheader104 ], [ %ind.end122, %middle.block ]
  %196 = add i32 %.21864.ph, -2
  %197 = lshr i32 %196, 1
  %198 = and i32 %197, 1
  %lcmp.mod148 = icmp eq i32 %198, 0
  br i1 %lcmp.mod148, label %.lr.ph68.prol.preheader, label %.lr.ph68.prol.loopexit146.unr-lcssa

.lr.ph68.prol.preheader:                          ; preds = %.lr.ph68.preheader141
  br label %.lr.ph68.prol149

.lr.ph68.prol149:                                 ; preds = %.lr.ph68.prol.preheader
  %indvars.iv.next99.prol150 = add nsw i64 %indvars.iv98.ph, 1
  %199 = getelementptr inbounds i16, i16* %.09, i64 %indvars.iv98.ph
  %200 = load i16, i16* %199, align 2
  %201 = sext i16 %200 to i32
  %202 = ashr i32 %201, %46
  %203 = trunc i32 %202 to i8
  store i8 %203, i8* %.72666.ph, align 1
  %.726.prol151 = getelementptr inbounds i8, i8* %.72666.ph, i64 1
  %204 = add nsw i32 %.21864.ph, -2
  %indvars.iv.next99.1.prol = add nsw i64 %indvars.iv98.ph, 2
  %205 = getelementptr inbounds i16, i16* %.09, i64 %indvars.iv.next99.prol150
  %206 = load i16, i16* %205, align 2
  %207 = sext i16 %206 to i32
  %208 = ashr i32 %207, %46
  %209 = trunc i32 %208 to i8
  store i8 %209, i8* %.726.prol151, align 1
  %.726.1.prol = getelementptr inbounds i8, i8* %.72666.ph, i64 2
  %.7.1.prol = add nsw i32 %.767.ph, -2
  br label %.lr.ph68.prol.loopexit146.unr-lcssa

.lr.ph68.prol.loopexit146.unr-lcssa:              ; preds = %.lr.ph68.preheader141, %.lr.ph68.prol149
  %indvars.iv.next99.1.lcssa.unr.ph = phi i64 [ %indvars.iv.next99.1.prol, %.lr.ph68.prol149 ], [ undef, %.lr.ph68.preheader141 ]
  %.726.1.lcssa.unr.ph = phi i8* [ %.726.1.prol, %.lr.ph68.prol149 ], [ undef, %.lr.ph68.preheader141 ]
  %.7.1.lcssa.unr.ph = phi i32 [ %.7.1.prol, %.lr.ph68.prol149 ], [ undef, %.lr.ph68.preheader141 ]
  %indvars.iv98.unr.ph152 = phi i64 [ %indvars.iv.next99.1.prol, %.lr.ph68.prol149 ], [ %indvars.iv98.ph, %.lr.ph68.preheader141 ]
  %.767.unr.ph153 = phi i32 [ %.7.1.prol, %.lr.ph68.prol149 ], [ %.767.ph, %.lr.ph68.preheader141 ]
  %.72666.unr.ph154 = phi i8* [ %.726.1.prol, %.lr.ph68.prol149 ], [ %.72666.ph, %.lr.ph68.preheader141 ]
  %.21864.unr.ph155 = phi i32 [ %204, %.lr.ph68.prol149 ], [ %.21864.ph, %.lr.ph68.preheader141 ]
  br label %.lr.ph68.prol.loopexit146

.lr.ph68.prol.loopexit146:                        ; preds = %.lr.ph68.prol.loopexit146.unr-lcssa
  %210 = icmp eq i32 %197, 0
  br i1 %210, label %.loopexit.loopexit.loopexit, label %.lr.ph68.preheader141.new

.lr.ph68.preheader141.new:                        ; preds = %.lr.ph68.prol.loopexit146
  br label %.lr.ph68

.lr.ph68:                                         ; preds = %.lr.ph68, %.lr.ph68.preheader141.new
  %indvars.iv98 = phi i64 [ %indvars.iv98.unr.ph152, %.lr.ph68.preheader141.new ], [ %indvars.iv.next99.1.1, %.lr.ph68 ]
  %.767 = phi i32 [ %.767.unr.ph153, %.lr.ph68.preheader141.new ], [ %.7.1.1, %.lr.ph68 ]
  %.72666 = phi i8* [ %.72666.unr.ph154, %.lr.ph68.preheader141.new ], [ %.726.1.1, %.lr.ph68 ]
  %.21864 = phi i32 [ %.21864.unr.ph155, %.lr.ph68.preheader141.new ], [ %226, %.lr.ph68 ]
  %indvars.iv.next99 = add nsw i64 %indvars.iv98, 1
  %211 = getelementptr inbounds i16, i16* %.09, i64 %indvars.iv98
  %212 = load i16, i16* %211, align 2
  %213 = sext i16 %212 to i32
  %214 = ashr i32 %213, %46
  %215 = trunc i32 %214 to i8
  store i8 %215, i8* %.72666, align 1
  %.726 = getelementptr inbounds i8, i8* %.72666, i64 1
  %indvars.iv.next99.1 = add nsw i64 %indvars.iv98, 2
  %216 = getelementptr inbounds i16, i16* %.09, i64 %indvars.iv.next99
  %217 = load i16, i16* %216, align 2
  %218 = sext i16 %217 to i32
  %219 = ashr i32 %218, %46
  %220 = trunc i32 %219 to i8
  store i8 %220, i8* %.726, align 1
  %.726.1 = getelementptr inbounds i8, i8* %.72666, i64 2
  %indvars.iv.next99.1156 = add nsw i64 %indvars.iv98, 3
  %221 = getelementptr inbounds i16, i16* %.09, i64 %indvars.iv.next99.1
  %222 = load i16, i16* %221, align 2
  %223 = sext i16 %222 to i32
  %224 = ashr i32 %223, %46
  %225 = trunc i32 %224 to i8
  store i8 %225, i8* %.726.1, align 1
  %.726.1157 = getelementptr inbounds i8, i8* %.72666, i64 3
  %226 = add nsw i32 %.21864, -4
  %indvars.iv.next99.1.1 = add nsw i64 %indvars.iv98, 4
  %227 = getelementptr inbounds i16, i16* %.09, i64 %indvars.iv.next99.1156
  %228 = load i16, i16* %227, align 2
  %229 = sext i16 %228 to i32
  %230 = ashr i32 %229, %46
  %231 = trunc i32 %230 to i8
  store i8 %231, i8* %.726.1157, align 1
  %.726.1.1 = getelementptr inbounds i8, i8* %.72666, i64 4
  %.7.1.1 = add nsw i32 %.767, -4
  %232 = icmp eq i32 %226, 0
  br i1 %232, label %.loopexit.loopexit.loopexit.unr-lcssa, label %.lr.ph68, !llvm.loop !13

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader34
  %.524.lcssa = phi i8* [ %.524.ph, %.preheader34 ], [ %.726.lcssa, %._crit_edge.loopexit ]
  %.314.lcssa = phi i32 [ %.314.ph, %.preheader34 ], [ %.415.lcssa, %._crit_edge.loopexit ]
  %.58.lcssa = phi i32 [ %.58.ph, %.preheader34 ], [ %.7.lcssa, %._crit_edge.loopexit ]
  %233 = icmp sgt i32 %.4, 3
  br i1 %233, label %234, label %246

; <label>:234:                                    ; preds = %._crit_edge
  %235 = add nsw i32 %.4, 126
  %236 = trunc i32 %235 to i8
  %237 = getelementptr inbounds i8, i8* %.524.lcssa, i64 1
  store i8 %236, i8* %.524.lcssa, align 1
  %238 = sext i32 %.01.lcssa to i64
  %239 = getelementptr inbounds i16, i16* %.09, i64 %238
  %240 = load i16, i16* %239, align 2
  %241 = sext i16 %240 to i32
  %242 = ashr i32 %241, %46
  %243 = trunc i32 %242 to i8
  %244 = getelementptr inbounds i8, i8* %.524.lcssa, i64 2
  store i8 %243, i8* %237, align 1
  %245 = add nsw i32 %.58.lcssa, -2
  br label %246

; <label>:246:                                    ; preds = %234, %._crit_edge
  %.827 = phi i8* [ %244, %234 ], [ %.524.lcssa, %._crit_edge ]
  %.8 = phi i32 [ %245, %234 ], [ %.58.lcssa, %._crit_edge ]
  %.5 = phi i32 [ %.4, %234 ], [ 0, %._crit_edge ]
  %247 = add nsw i32 %.5, %.314.lcssa
  %248 = icmp slt i32 %247, %16
  br i1 %248, label %48, label %.loopexit37.loopexit

; <label>:249:                                    ; preds = %.loopexit37
  store i8* %.120.lcssa, i8** %35, align 8
  %250 = load i32, i32* %37, align 8
  %251 = sub nsw i32 %250, %.14.lcssa
  store i32 %251, i32* %39, align 8
  br label %.loopexit35

.loopexit35.loopexit:                             ; preds = %128
  br label %.loopexit35

.loopexit35.loopexit142:                          ; preds = %50
  br label %.loopexit35

.loopexit35:                                      ; preds = %.loopexit35.loopexit142, %.loopexit35.loopexit, %249
  %.0 = phi i32 [ 0, %249 ], [ -1, %.loopexit35.loopexit ], [ -1, %.loopexit35.loopexit142 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal void @L16fromY(%struct.logLuvState* nocapture readonly, i8* nocapture readonly, i32) #0 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %5 = bitcast i8* %1 to float*
  %6 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %0, i64 0, i32 2
  %7 = bitcast i8*** %6 to i16**
  %8 = load i16*, i16** %7, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.05 = phi float* [ %10, %.lr.ph ], [ %5, %.lr.ph.preheader ]
  %.014 = phi i16* [ %15, %.lr.ph ], [ %8, %.lr.ph.preheader ]
  %.023 = phi i32 [ %9, %.lr.ph ], [ %2, %.lr.ph.preheader ]
  %9 = add nsw i32 %.023, -1
  %10 = getelementptr inbounds float, float* %.05, i64 1
  %11 = load float, float* %.05, align 4
  %12 = fpext float %11 to double
  %13 = tail call fastcc i32 @pix16fromY(double %12)
  %14 = trunc i32 %13 to i16
  %15 = getelementptr inbounds i16, i16* %.014, i64 1
  store i16 %14, i16* %.014, align 2
  %16 = icmp sgt i32 %.023, 1
  br i1 %16, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

declare i32 @TIFFFlushData1(%struct.tiff*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @pix24fromXYZ(float* nocapture readonly) unnamed_addr #0 {
  %2 = getelementptr inbounds float, float* %0, i64 1
  %3 = load float, float* %2, align 4
  %4 = fpext float %3 to double
  %5 = fcmp ult float %3, 1.600000e+01
  br i1 %5, label %6, label %14

; <label>:6:                                      ; preds = %1
  %7 = fcmp ugt float %3, 0x3F30000000000000
  br i1 %7, label %8, label %14

; <label>:8:                                      ; preds = %6
  %9 = tail call double @log(double %4) #9
  %10 = fmul double %9, 0x3FF71547652B82FE
  %11 = fadd double %10, 1.200000e+01
  %12 = fmul double %11, 6.400000e+01
  %13 = fptosi double %12 to i32
  %phitmp = shl i32 %13, 14
  br label %14

; <label>:14:                                     ; preds = %8, %6, %1
  %.1 = phi i32 [ 16760832, %1 ], [ %phitmp, %8 ], [ 0, %6 ]
  %15 = load float, float* %0, align 4
  %16 = fpext float %15 to double
  %17 = load float, float* %2, align 4
  %18 = fpext float %17 to double
  %19 = fmul double %18, 1.500000e+01
  %20 = fadd double %16, %19
  %21 = getelementptr inbounds float, float* %0, i64 2
  %22 = load float, float* %21, align 4
  %23 = fpext float %22 to double
  %24 = fmul double %23, 3.000000e+00
  %25 = fadd double %20, %24
  %26 = fcmp oeq double %25, 0.000000e+00
  br i1 %26, label %32, label %27

; <label>:27:                                     ; preds = %14
  %28 = fmul double %16, 4.000000e+00
  %29 = fdiv double %28, %25
  %30 = fmul double %18, 9.000000e+00
  %31 = fdiv double %30, %25
  br label %32

; <label>:32:                                     ; preds = %14, %27
  %.03 = phi double [ %29, %27 ], [ 0x3FCAF286BD156C1A, %14 ]
  %.0 = phi double [ %31, %27 ], [ 0x3FDE50D794B8199E, %14 ]
  %33 = tail call fastcc i32 @uv_encode(double %.03, double %.0)
  %34 = icmp slt i32 %33, 0
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %32
  %36 = tail call fastcc i32 @uv_encode(double 0x3FCAF286BD156C1A, double 0x3FDE50D794B8199E)
  br label %37

; <label>:37:                                     ; preds = %35, %32
  %.02 = phi i32 [ %36, %35 ], [ %33, %32 ]
  %38 = or i32 %.02, %.1
  ret i32 %38
}

; Function Attrs: nounwind
declare double @log(double) local_unnamed_addr #7

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal fastcc i32 @uv_encode(double, double) unnamed_addr #4 {
  %3 = fcmp olt double %1, 0x3F9158B820000000
  br i1 %3, label %28, label %4

; <label>:4:                                      ; preds = %2
  %5 = fadd double %1, 0xBF9158B820000000
  %6 = fmul double %5, 0x4071DB6DAD9C14EB
  %7 = fptosi double %6 to i32
  %8 = icmp sgt i32 %7, 162
  br i1 %8, label %28, label %9

; <label>:9:                                      ; preds = %4
  %10 = sext i32 %7 to i64
  %11 = getelementptr inbounds [163 x %struct.anon], [163 x %struct.anon]* @uv_row, i64 0, i64 %10, i32 0
  %12 = load float, float* %11, align 8
  %13 = fpext float %12 to double
  %14 = fcmp ogt double %13, %0
  br i1 %14, label %28, label %15

; <label>:15:                                     ; preds = %9
  %16 = fsub double %0, %13
  %17 = fmul double %16, 0x4071DB6DAD9C14EB
  %18 = fptosi double %17 to i32
  %19 = getelementptr inbounds [163 x %struct.anon], [163 x %struct.anon]* @uv_row, i64 0, i64 %10, i32 1
  %20 = load i16, i16* %19, align 4
  %21 = sext i16 %20 to i32
  %22 = icmp slt i32 %18, %21
  br i1 %22, label %23, label %28

; <label>:23:                                     ; preds = %15
  %24 = getelementptr inbounds [163 x %struct.anon], [163 x %struct.anon]* @uv_row, i64 0, i64 %10, i32 2
  %25 = load i16, i16* %24, align 2
  %26 = sext i16 %25 to i32
  %27 = add nsw i32 %26, %18
  br label %28

; <label>:28:                                     ; preds = %15, %9, %4, %2, %23
  %.0 = phi i32 [ %27, %23 ], [ -1, %2 ], [ -1, %4 ], [ -1, %9 ], [ -1, %15 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @pix32fromXYZ(float* nocapture readonly) unnamed_addr #0 {
  %2 = getelementptr inbounds float, float* %0, i64 1
  %3 = load float, float* %2, align 4
  %4 = fpext float %3 to double
  %5 = tail call fastcc i32 @pix16fromY(double %4)
  %6 = load float, float* %0, align 4
  %7 = fpext float %6 to double
  %8 = load float, float* %2, align 4
  %9 = fpext float %8 to double
  %10 = fmul double %9, 1.500000e+01
  %11 = fadd double %7, %10
  %12 = getelementptr inbounds float, float* %0, i64 2
  %13 = load float, float* %12, align 4
  %14 = fpext float %13 to double
  %15 = fmul double %14, 3.000000e+00
  %16 = fadd double %11, %15
  %17 = fcmp oeq double %16, 0.000000e+00
  br i1 %17, label %23, label %18

; <label>:18:                                     ; preds = %1
  %19 = fmul double %7, 4.000000e+00
  %20 = fdiv double %19, %16
  %21 = fmul double %9, 9.000000e+00
  %22 = fdiv double %21, %16
  br label %23

; <label>:23:                                     ; preds = %1, %18
  %.01 = phi double [ %20, %18 ], [ 0x3FCAF286BD156C1A, %1 ]
  %.0 = phi double [ %22, %18 ], [ 0x3FDE50D794B8199E, %1 ]
  %24 = fcmp ugt double %.01, 0.000000e+00
  %25 = fmul double %.01, 4.100000e+02
  %26 = fptoui double %25 to i32
  %.02 = select i1 %24, i32 %26, i32 0
  %27 = icmp ult i32 %.02, 255
  %..02 = select i1 %27, i32 %.02, i32 255
  %28 = fcmp ugt double %.0, 0.000000e+00
  %29 = fmul double %.0, 4.100000e+02
  %30 = fptoui double %29 to i32
  %.03 = select i1 %28, i32 %30, i32 0
  %31 = icmp ult i32 %.03, 255
  %..03 = select i1 %31, i32 %.03, i32 255
  %32 = shl i32 %5, 16
  %33 = shl nuw i32 %..02, 8
  %34 = or i32 %33, %32
  %35 = or i32 %34, %..03
  ret i32 %35
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @pix16fromY(double) unnamed_addr #0 {
  %2 = fcmp ult double %0, 1.844670e+19
  br i1 %2, label %3, label %23

; <label>:3:                                      ; preds = %1
  %4 = fcmp ugt double %0, -1.844670e+19
  br i1 %4, label %5, label %23

; <label>:5:                                      ; preds = %3
  %6 = fcmp ogt double %0, 5.435710e-20
  br i1 %6, label %7, label %13

; <label>:7:                                      ; preds = %5
  %8 = tail call double @log(double %0) #9
  %9 = fmul double %8, 0x3FF71547652B82FE
  %10 = fadd double %9, 6.400000e+01
  %11 = fmul double %10, 2.560000e+02
  %12 = fptosi double %11 to i32
  br label %23

; <label>:13:                                     ; preds = %5
  %14 = fcmp olt double %0, -5.435710e-20
  br i1 %14, label %15, label %23

; <label>:15:                                     ; preds = %13
  %16 = fsub double -0.000000e+00, %0
  %17 = tail call double @log(double %16) #9
  %18 = fmul double %17, 0x3FF71547652B82FE
  %19 = fadd double %18, 6.400000e+01
  %20 = fmul double %19, 2.560000e+02
  %21 = fptosi double %20 to i32
  %22 = or i32 %21, -32768
  br label %23

; <label>:23:                                     ; preds = %13, %3, %1, %15, %7
  %.0 = phi i32 [ %12, %7 ], [ %22, %15 ], [ 32767, %1 ], [ 65535, %3 ], [ 0, %13 ]
  ret i32 %.0
}

declare void @_TIFFfree(i8*) local_unnamed_addr #2

declare i32 @TIFFSetField(%struct.tiff*, i32, ...) local_unnamed_addr #2

declare i32 @TIFFTileSize(%struct.tiff*) local_unnamed_addr #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = !{!6}
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !"LVerDomain"}
!8 = !{!9}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.vectorize.width", i32 1}
!12 = !{!"llvm.loop.interleave.count", i32 1}
!13 = distinct !{!13, !11, !12}
