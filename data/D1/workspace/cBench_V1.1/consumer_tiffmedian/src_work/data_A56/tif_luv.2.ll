; ModuleID = 'tmp1.ll'
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

$__llvm_profile_raw_version = comdat any

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
@uv_row = internal global [163 x %struct.anon] [%struct.anon { float 0x3FCFB36BE0000000, i16 4, i16 0 }, %struct.anon { float 0x3FCF342680000000, i16 6, i16 4 }, %struct.anon { float 0x3FCEEF8060000000, i16 7, i16 10 }, %struct.anon { float 0x3FCE72A7C0000000, i16 9, i16 17 }, %struct.anon { float 0x3FCE322B00000000, i16 10, i16 26 }, %struct.anon { float 0x3FCDB73080000000, i16 12, i16 36 }, %struct.anon { float 0x3FCD3AA360000000, i16 14, i16 48 }, %struct.anon { float 0x3FCCF60E00000000, i16 15, i16 62 }, %struct.anon { float 0x3FCC76A720000000, i16 17, i16 77 }, %struct.anon { float 0x3FCC366520000000, i16 18, i16 94 }, %struct.anon { float 0x3FCB7B9E00000000, i16 21, i16 112 }, %struct.anon { float 0x3FCB3A3660000000, i16 22, i16 133 }, %struct.anon { float 0x3FCAF8E7E0000000, i16 23, i16 155 }, %struct.anon { float 0x3FCA3CA760000000, i16 26, i16 178 }, %struct.anon { float 0x3FC9FB7200000000, i16 27, i16 204 }, %struct.anon { float 0x3FC980DC40000000, i16 29, i16 231 }, %struct.anon { float 0x3FC906F6A0000000, i16 31, i16 260 }, %struct.anon { float 0x3FC8C69300000000, i16 32, i16 291 }, %struct.anon { float 0x3FC84DEC20000000, i16 34, i16 323 }, %struct.anon { float 0x3FC7D5ED00000000, i16 36, i16 357 }, %struct.anon { float 0x3FC7D5ED00000000, i16 36, i16 393 }, %struct.anon { float 0x3FC75F2CC0000000, i16 38, i16 429 }, %struct.anon { float 0x3FC6E99200000000, i16 40, i16 467 }, %struct.anon { float 0x3FC675AB80000000, i16 42, i16 507 }, %struct.anon { float 0x3FC6042100000000, i16 44, i16 549 }, %struct.anon { float 0x3FC6042100000000, i16 44, i16 593 }, %struct.anon { float 0x3FC5951400000000, i16 46, i16 637 }, %struct.anon { float 0x3FC5951400000000, i16 46, i16 683 }, %struct.anon { float 0x3FC4F00680000000, i16 49, i16 729 }, %struct.anon { float 0x3FC44E6180000000, i16 52, i16 778 }, %struct.anon { float 0x3FC44E6180000000, i16 52, i16 830 }, %struct.anon { float 0x3FC44E6180000000, i16 52, i16 882 }, %struct.anon { float 0x3FC3B035C0000000, i16 55, i16 934 }, %struct.anon { float 0x3FC3B035C0000000, i16 55, i16 989 }, %struct.anon { float 0x3FC3159C40000000, i16 58, i16 1044 }, %struct.anon { float 0x3FC3159C40000000, i16 58, i16 1102 }, %struct.anon { float 0x3FC2458040000000, i16 62, i16 1160 }, %struct.anon { float 0x3FC2458040000000, i16 62, i16 1222 }, %struct.anon { float 0x3FC2458040000000, i16 62, i16 1284 }, %struct.anon { float 0x3FC1B2D4E0000000, i16 65, i16 1346 }, %struct.anon { float 0x3FC1B2D4E0000000, i16 65, i16 1411 }, %struct.anon { float 0x3FC1B2D4E0000000, i16 65, i16 1476 }, %struct.anon { float 0x3FC0EAD0C0000000, i16 69, i16 1541 }, %struct.anon { float 0x3FC0EAD0C0000000, i16 69, i16 1610 }, %struct.anon { float 0x3FC02773E0000000, i16 73, i16 1679 }, %struct.anon { float 0x3FC02773E0000000, i16 73, i16 1752 }, %struct.anon { float 0x3FC02773E0000000, i16 73, i16 1825 }, %struct.anon { float 0x3FBED14A00000000, i16 77, i16 1898 }, %struct.anon { float 0x3FBED14A00000000, i16 77, i16 1975 }, %struct.anon { float 0x3FBED14A00000000, i16 77, i16 2052 }, %struct.anon { float 0x3FBED14A00000000, i16 77, i16 2129 }, %struct.anon { float 0x3FBCEB13E0000000, i16 82, i16 2206 }, %struct.anon { float 0x3FBCEB13E0000000, i16 82, i16 2288 }, %struct.anon { float 0x3FBCEB13E0000000, i16 82, i16 2370 }, %struct.anon { float 0x3FBB81D7E0000000, i16 86, i16 2452 }, %struct.anon { float 0x3FBB81D7E0000000, i16 86, i16 2538 }, %struct.anon { float 0x3FBB81D7E0000000, i16 86, i16 2624 }, %struct.anon { float 0x3FBB81D7E0000000, i16 86, i16 2710 }, %struct.anon { float 0x3FB9B01420000000, i16 91, i16 2796 }, %struct.anon { float 0x3FB9B01420000000, i16 91, i16 2887 }, %struct.anon { float 0x3FB9B01420000000, i16 91, i16 2978 }, %struct.anon { float 0x3FB85A2D80000000, i16 95, i16 3069 }, %struct.anon { float 0x3FB85A2D80000000, i16 95, i16 3164 }, %struct.anon { float 0x3FB85A2D80000000, i16 95, i16 3259 }, %struct.anon { float 0x3FB85A2D80000000, i16 95, i16 3354 }, %struct.anon { float 0x3FB6994180000000, i16 100, i16 3449 }, %struct.anon { float 0x3FB6994180000000, i16 100, i16 3549 }, %struct.anon { float 0x3FB6994180000000, i16 100, i16 3649 }, %struct.anon { float 0x3FB6994180000000, i16 100, i16 3749 }, %struct.anon { float 0x3FB4DEB100000000, i16 105, i16 3849 }, %struct.anon { float 0x3FB4DEB100000000, i16 105, i16 3954 }, %struct.anon { float 0x3FB4DEB100000000, i16 105, i16 4059 }, %struct.anon { float 0x3FB4DEB100000000, i16 105, i16 4164 }, %struct.anon { float 0x3FB32A1720000000, i16 110, i16 4269 }, %struct.anon { float 0x3FB32A1720000000, i16 110, i16 4379 }, %struct.anon { float 0x3FB32A1720000000, i16 110, i16 4489 }, %struct.anon { float 0x3FB32A1720000000, i16 110, i16 4599 }, %struct.anon { float 0x3FB17B7420000000, i16 115, i16 4709 }, %struct.anon { float 0x3FB17B7420000000, i16 115, i16 4824 }, %struct.anon { float 0x3FB17B7420000000, i16 115, i16 4939 }, %struct.anon { float 0x3FB17B7420000000, i16 115, i16 5054 }, %struct.anon { float 0x3FB0465200000000, i16 119, i16 5169 }, %struct.anon { float 0x3FB0465200000000, i16 119, i16 5288 }, %struct.anon { float 0x3FB0465200000000, i16 119, i16 5407 }, %struct.anon { float 0x3FB0465200000000, i16 119, i16 5526 }, %struct.anon { float 0x3FAD4BCF00000000, i16 124, i16 5645 }, %struct.anon { float 0x3FAD4BCF00000000, i16 124, i16 5769 }, %struct.anon { float 0x3FAD4BCF00000000, i16 124, i16 5893 }, %struct.anon { float 0x3FAD4BCF00000000, i16 124, i16 6017 }, %struct.anon { float 0x3FAA1AB4C0000000, i16 129, i16 6141 }, %struct.anon { float 0x3FAA1AB4C0000000, i16 129, i16 6270 }, %struct.anon { float 0x3FAA1AB4C0000000, i16 129, i16 6399 }, %struct.anon { float 0x3FAA1AB4C0000000, i16 129, i16 6528 }, %struct.anon { float 0x3FAA1AB4C0000000, i16 129, i16 6657 }, %struct.anon { float 0x3FA6F7C240000000, i16 134, i16 6786 }, %struct.anon { float 0x3FA6F7C240000000, i16 134, i16 6920 }, %struct.anon { float 0x3FA6F7C240000000, i16 134, i16 7054 }, %struct.anon { float 0x3FA6F7C240000000, i16 134, i16 7188 }, %struct.anon { float 0x3FA4C5B8E0000000, i16 138, i16 7322 }, %struct.anon { float 0x3FA4C5B8E0000000, i16 138, i16 7460 }, %struct.anon { float 0x3FA4C5B8E0000000, i16 138, i16 7598 }, %struct.anon { float 0x3FA4C5B8E0000000, i16 138, i16 7736 }, %struct.anon { float 0x3FA29B0680000000, i16 142, i16 7874 }, %struct.anon { float 0x3FA29B0680000000, i16 142, i16 8016 }, %struct.anon { float 0x3FA29B0680000000, i16 142, i16 8158 }, %struct.anon { float 0x3FA29B0680000000, i16 142, i16 8300 }, %struct.anon { float 0x3FA07485E0000000, i16 146, i16 8442 }, %struct.anon { float 0x3FA07485E0000000, i16 146, i16 8588 }, %struct.anon { float 0x3FA07485E0000000, i16 146, i16 8734 }, %struct.anon { float 0x3FA07485E0000000, i16 146, i16 8880 }, %struct.anon { float 0x3F9C9E2360000000, i16 150, i16 9026 }, %struct.anon { float 0x3F9C9E2360000000, i16 150, i16 9176 }, %struct.anon { float 0x3F9C9E2360000000, i16 150, i16 9326 }, %struct.anon { float 0x3F984F0960000000, i16 154, i16 9476 }, %struct.anon { float 0x3F984F0960000000, i16 154, i16 9630 }, %struct.anon { float 0x3F984F0960000000, i16 154, i16 9784 }, %struct.anon { float 0x3F984F0960000000, i16 154, i16 9938 }, %struct.anon { float 0x3F93F8DB40000000, i16 158, i16 10092 }, %struct.anon { float 0x3F93F8DB40000000, i16 158, i16 10250 }, %struct.anon { float 0x3F93F8DB40000000, i16 158, i16 10408 }, %struct.anon { float 0x3F91622820000000, i16 161, i16 10566 }, %struct.anon { float 0x3F91622820000000, i16 161, i16 10727 }, %struct.anon { float 0x3F91622820000000, i16 161, i16 10888 }, %struct.anon { float 0x3F91622820000000, i16 161, i16 11049 }, %struct.anon { float 0x3F89E279E0000000, i16 165, i16 11210 }, %struct.anon { float 0x3F89E279E0000000, i16 165, i16 11375 }, %struct.anon { float 0x3F89E279E0000000, i16 165, i16 11540 }, %struct.anon { float 0x3F84762960000000, i16 168, i16 11705 }, %struct.anon { float 0x3F84762960000000, i16 168, i16 11873 }, %struct.anon { float 0x3F84762960000000, i16 168, i16 12041 }, %struct.anon { float 0x3F8276FB00000000, i16 170, i16 12209 }, %struct.anon { float 0x3F8276FB00000000, i16 170, i16 12379 }, %struct.anon { float 0x3F8276FB00000000, i16 170, i16 12549 }, %struct.anon { float 0x3F7976FF40000000, i16 173, i16 12719 }, %struct.anon { float 0x3F7976FF40000000, i16 173, i16 12892 }, %struct.anon { float 0x3F74E09780000000, i16 175, i16 13065 }, %struct.anon { float 0x3F74E09780000000, i16 175, i16 13240 }, %struct.anon { float 0x3F74E09780000000, i16 175, i16 13415 }, %struct.anon { float 0x3F7002E240000000, i16 177, i16 13590 }, %struct.anon { float 0x3F7002E240000000, i16 177, i16 13767 }, %struct.anon { float 0x3F632B55E0000000, i16 177, i16 13944 }, %struct.anon { float 0x3F639218A0000000, i16 170, i16 14121 }, %struct.anon { float 0x3F517F8440000000, i16 164, i16 14291 }, %struct.anon { float 0x3F5B152F40000000, i16 157, i16 14455 }, %struct.anon { float 0x3F477EA1C0000000, i16 150, i16 14612 }, %struct.anon { float 0x3F5A719B40000000, i16 143, i16 14762 }, %struct.anon { float 0x3F31B1D920000000, i16 136, i16 14905 }, %struct.anon { float 0x3F3FB82C20000000, i16 129, i16 15041 }, %struct.anon { float 0x3F52125140000000, i16 123, i16 15170 }, %struct.anon { float 0x3F54595360000000, i16 115, i16 15293 }, %struct.anon { float 0x3F5376D540000000, i16 109, i16 15408 }, %struct.anon { float 0x3F50907100000000, i16 103, i16 15517 }, %struct.anon { float 0x3F473B85E0000000, i16 97, i16 15620 }, %struct.anon { float 0x3F33B9F120000000, i16 89, i16 15717 }, %struct.anon { float 0x3F63CAB820000000, i16 82, i16 15806 }, %struct.anon { float 0x3F6AA1D760000000, i16 76, i16 15888 }, %struct.anon { float 0x3F6A975B00000000, i16 69, i16 15964 }, %struct.anon { float 0x3F70F62740000000, i16 62, i16 16033 }, %struct.anon { float 0x3F786CA8A0000000, i16 55, i16 16095 }, %struct.anon { float 0x3F821A2E80000000, i16 47, i16 16150 }, %struct.anon { float 0x3F857BC800000000, i16 40, i16 16197 }, %struct.anon { float 0x3F9166E000000000, i16 31, i16 16237 }, %struct.anon { float 0x3F983A10A0000000, i16 21, i16 16268 }], align 16
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
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFInitSGILog = private constant [14 x i8] c"TIFFInitSGILog"
@__profn_tmp1.ll__logLuvNop = private constant [18 x i8] c"tmp1.ll:_logLuvNop"
@__profn_tmp1.ll_LogLuvSetupDecode = private constant [25 x i8] c"tmp1.ll:LogLuvSetupDecode"
@__profn_tmp1.ll_LogLuvDecodeStrip = private constant [25 x i8] c"tmp1.ll:LogLuvDecodeStrip"
@__profn_tmp1.ll_LogLuvDecodeTile = private constant [24 x i8] c"tmp1.ll:LogLuvDecodeTile"
@__profn_tmp1.ll_LogLuvSetupEncode = private constant [25 x i8] c"tmp1.ll:LogLuvSetupEncode"
@__profn_tmp1.ll_LogLuvEncodeStrip = private constant [25 x i8] c"tmp1.ll:LogLuvEncodeStrip"
@__profn_tmp1.ll_LogLuvEncodeTile = private constant [24 x i8] c"tmp1.ll:LogLuvEncodeTile"
@__profn_tmp1.ll_LogLuvClose = private constant [19 x i8] c"tmp1.ll:LogLuvClose"
@__profn_tmp1.ll_LogLuvCleanup = private constant [21 x i8] c"tmp1.ll:LogLuvCleanup"
@__profn_tmp1.ll_LogLuvVGetField = private constant [23 x i8] c"tmp1.ll:LogLuvVGetField"
@__profn_tmp1.ll_LogLuvVSetField = private constant [23 x i8] c"tmp1.ll:LogLuvVSetField"
@__profn_tmp1.ll_LogLuvInitState = private constant [23 x i8] c"tmp1.ll:LogLuvInitState"
@__profn_tmp1.ll_LogLuvDecode24 = private constant [22 x i8] c"tmp1.ll:LogLuvDecode24"
@__profn_tmp1.ll_Luv24toXYZ = private constant [18 x i8] c"tmp1.ll:Luv24toXYZ"
@__profn_tmp1.ll_Luv24toLuv48 = private constant [20 x i8] c"tmp1.ll:Luv24toLuv48"
@__profn_tmp1.ll_Luv24toRGB = private constant [18 x i8] c"tmp1.ll:Luv24toRGB"
@__profn_tmp1.ll_LogLuvDecode32 = private constant [22 x i8] c"tmp1.ll:LogLuvDecode32"
@__profn_tmp1.ll_Luv32toXYZ = private constant [18 x i8] c"tmp1.ll:Luv32toXYZ"
@__profn_tmp1.ll_Luv32toLuv48 = private constant [20 x i8] c"tmp1.ll:Luv32toLuv48"
@__profn_tmp1.ll_Luv32toRGB = private constant [18 x i8] c"tmp1.ll:Luv32toRGB"
@__profn_tmp1.ll_LogL16InitState = private constant [23 x i8] c"tmp1.ll:LogL16InitState"
@__profn_tmp1.ll_LogL16Decode = private constant [20 x i8] c"tmp1.ll:LogL16Decode"
@__profn_tmp1.ll_L16toY = private constant [14 x i8] c"tmp1.ll:L16toY"
@__profn_tmp1.ll_L16toGry = private constant [16 x i8] c"tmp1.ll:L16toGry"
@__profn_tmp1.ll_LogLuvGuessDataFmt = private constant [26 x i8] c"tmp1.ll:LogLuvGuessDataFmt"
@__profn_tmp1.ll_pix24toXYZ = private constant [18 x i8] c"tmp1.ll:pix24toXYZ"
@__profn_tmp1.ll_uv_decode = private constant [17 x i8] c"tmp1.ll:uv_decode"
@__profn_tmp1.ll_XYZtoRGB24 = private constant [18 x i8] c"tmp1.ll:XYZtoRGB24"
@__profn_tmp1.ll_pix32toXYZ = private constant [18 x i8] c"tmp1.ll:pix32toXYZ"
@__profn_tmp1.ll_pix16toY = private constant [16 x i8] c"tmp1.ll:pix16toY"
@__profn_tmp1.ll_LogL16GuessDataFmt = private constant [26 x i8] c"tmp1.ll:LogL16GuessDataFmt"
@__profn_tmp1.ll_LogLuvEncode24 = private constant [22 x i8] c"tmp1.ll:LogLuvEncode24"
@__profn_tmp1.ll_Luv24fromXYZ = private constant [20 x i8] c"tmp1.ll:Luv24fromXYZ"
@__profn_tmp1.ll_Luv24fromLuv48 = private constant [22 x i8] c"tmp1.ll:Luv24fromLuv48"
@__profn_tmp1.ll_LogLuvEncode32 = private constant [22 x i8] c"tmp1.ll:LogLuvEncode32"
@__profn_tmp1.ll_Luv32fromXYZ = private constant [20 x i8] c"tmp1.ll:Luv32fromXYZ"
@__profn_tmp1.ll_Luv32fromLuv48 = private constant [22 x i8] c"tmp1.ll:Luv32fromLuv48"
@__profn_tmp1.ll_LogL16Encode = private constant [20 x i8] c"tmp1.ll:LogL16Encode"
@__profn_tmp1.ll_L16fromY = private constant [16 x i8] c"tmp1.ll:L16fromY"
@__profn_tmp1.ll_pix24fromXYZ = private constant [20 x i8] c"tmp1.ll:pix24fromXYZ"
@__profn_tmp1.ll_uv_encode = private constant [17 x i8] c"tmp1.ll:uv_encode"
@__profn_tmp1.ll_pix32fromXYZ = private constant [20 x i8] c"tmp1.ll:pix32fromXYZ"
@__profn_tmp1.ll_pix16fromY = private constant [18 x i8] c"tmp1.ll:pix16fromY"
@__profc_TIFFInitSGILog = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFInitSGILog = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5147309960539829752, i64 62762508574, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFInitSGILog, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32)* @TIFFInitSGILog to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll__logLuvNop = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll__logLuvNop = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6819547500862037178, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__logLuvNop, i32 0, i32 0), i8* bitcast (void (%struct.logLuvState*, i8*, i32)* @_logLuvNop to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogLuvSetupDecode = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_LogLuvSetupDecode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8759022352530831478, i64 165498534656, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @LogLuvSetupDecode to i8*), i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogLuvDecodeStrip = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_LogLuvDecodeStrip = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_LogLuvDecodeStrip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8171547435593124648, i64 281538201850451, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvDecodeStrip, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvDecodeStrip to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_LogLuvDecodeStrip to i8*), i32 4, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogLuvDecodeTile = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_LogLuvDecodeTile = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_LogLuvDecodeTile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4707664473901854854, i64 281538201850451, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvDecodeTile, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvDecodeTile to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_LogLuvDecodeTile to i8*), i32 4, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogLuvSetupEncode = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_LogLuvSetupEncode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5355876254103214072, i64 72057774673128068, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @LogLuvSetupEncode to i8*), i8* null, i32 15, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogLuvEncodeStrip = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_LogLuvEncodeStrip = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_LogLuvEncodeStrip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7579428259259843619, i64 281538201850451, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvEncodeStrip, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvEncodeStrip to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_LogLuvEncodeStrip to i8*), i32 4, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogLuvEncodeTile = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_LogLuvEncodeTile = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_LogLuvEncodeTile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5707249080422277031, i64 281538201850451, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvEncodeTile, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvEncodeTile to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_LogLuvEncodeTile to i8*), i32 4, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogLuvClose = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_LogLuvClose = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2017575897095988260, i64 72057606922829823, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_LogLuvClose, i32 0, i32 0), i8* bitcast (void (%struct.tiff*)* @LogLuvClose to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogLuvCleanup = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_LogLuvCleanup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7024192349833463732, i64 35373395463, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_LogLuvCleanup, i32 0, i32 0), i8* bitcast (void (%struct.tiff*)* @LogLuvCleanup to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogLuvVGetField = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_LogLuvVGetField = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_LogLuvVGetField = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6306691291003438041, i64 281520977482628, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_LogLuvVGetField, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @LogLuvVGetField to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_LogLuvVGetField to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogLuvVSetField = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_LogLuvVSetField = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_LogLuvVSetField = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1152463436722999666, i64 281562135380342, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogLuvVSetField, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @LogLuvVSetField to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_LogLuvVSetField to i8*), i32 7, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogLuvInitState = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_LogLuvInitState = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5810233363213650268, i64 138381791913, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i32 0, i32 0), i8* null, i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogLuvDecode24 = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_LogLuvDecode24 = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_LogLuvDecode24 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3725024193165713928, i64 281619730008128, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvDecode24, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvDecode24 to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_LogLuvDecode24 to i8*), i32 8, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Luv24toXYZ = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Luv24toXYZ = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2294985493229459098, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv24toXYZ, i32 0, i32 0), i8* bitcast (void (%struct.logLuvState*, i8*, i32)* @Luv24toXYZ to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Luv24toLuv48 = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Luv24toLuv48 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3922858478003257363, i64 41122367911, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Luv24toLuv48, i32 0, i32 0), i8* bitcast (void (%struct.logLuvState*, i8*, i32)* @Luv24toLuv48 to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Luv24toRGB = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Luv24toRGB = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1738786201232529708, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv24toRGB, i32 0, i32 0), i8* bitcast (void (%struct.logLuvState*, i8*, i32)* @Luv24toRGB to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogLuvDecode32 = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_LogLuvDecode32 = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_LogLuvDecode32 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 718853656035400207, i64 281696582763792, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvDecode32 to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_LogLuvDecode32 to i8*), i32 13, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Luv32toXYZ = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Luv32toXYZ = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8886242239697327340, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32toXYZ, i32 0, i32 0), i8* bitcast (void (%struct.logLuvState*, i8*, i32)* @Luv32toXYZ to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Luv32toLuv48 = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Luv32toLuv48 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4133033757003586291, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32toLuv48, i32 0, i32 0), i8* bitcast (void (%struct.logLuvState*, i8*, i32)* @Luv32toLuv48 to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Luv32toRGB = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Luv32toRGB = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4098138863616575564, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32toRGB, i32 0, i32 0), i8* bitcast (void (%struct.logLuvState*, i8*, i32)* @Luv32toRGB to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogL16InitState = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_LogL16InitState = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5312651247024760078, i64 116621897961, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogL16InitState, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogL16Decode = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_LogL16Decode = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_LogL16Decode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8037180867093745317, i64 281696582763792, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @LogL16Decode to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_LogL16Decode to i8*), i32 13, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_L16toY = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_L16toY = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5439259009530827597, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_L16toY, i32 0, i32 0), i8* bitcast (void (%struct.logLuvState*, i8*, i32)* @L16toY to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_L16toGry = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_L16toGry = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8213784013313812708, i64 63022740560, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_L16toGry, i32 0, i32 0), i8* bitcast (void (%struct.logLuvState*, i8*, i32)* @L16toGry to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogLuvGuessDataFmt = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_LogLuvGuessDataFmt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7750265594634792297, i64 126770463963, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i32 0, i32 0), i8* null, i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pix24toXYZ = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_pix24toXYZ = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7151210761789711206, i64 41716471419, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pix24toXYZ, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_uv_decode = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_uv_decode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4109853957346543756, i64 88752948934, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_uv_decode, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_XYZtoRGB24 = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_XYZtoRGB24 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -829391531964710351, i64 112404309158, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_XYZtoRGB24, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pix32toXYZ = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_pix32toXYZ = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3191006796038176653, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_pix32toXYZ, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pix16toY = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_pix16toY = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5771680222897998448, i64 42754363654, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pix16toY, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogL16GuessDataFmt = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_LogL16GuessDataFmt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5480831345793581942, i64 59344903774, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogL16GuessDataFmt, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogLuvEncode24 = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_LogLuvEncode24 = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_LogLuvEncode24 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1249336169011908233, i64 281613832406779, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvEncode24, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvEncode24 to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_LogLuvEncode24 to i8*), i32 8, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Luv24fromXYZ = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Luv24fromXYZ = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8967698630246064785, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv24fromXYZ, i32 0, i32 0), i8* bitcast (void (%struct.logLuvState*, i8*, i32)* @Luv24fromXYZ to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Luv24fromLuv48 = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Luv24fromLuv48 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -602444875188444228, i64 73128930763, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Luv24fromLuv48, i32 0, i32 0), i8* bitcast (void (%struct.logLuvState*, i8*, i32)* @Luv24fromLuv48 to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogLuvEncode32 = private global [24 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_LogLuvEncode32 = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_LogLuvEncode32 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1627927324949063323, i64 281851872669502, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvEncode32 to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_LogLuvEncode32 to i8*), i32 24, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Luv32fromXYZ = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Luv32fromXYZ = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5324208740874399916, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32fromXYZ, i32 0, i32 0), i8* bitcast (void (%struct.logLuvState*, i8*, i32)* @Luv32fromXYZ to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Luv32fromLuv48 = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Luv32fromLuv48 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7019865011434355284, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32fromLuv48, i32 0, i32 0), i8* bitcast (void (%struct.logLuvState*, i8*, i32)* @Luv32fromLuv48 to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LogL16Encode = private global [24 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_LogL16Encode = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_LogL16Encode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1414879610454132958, i64 281851872669502, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @LogL16Encode to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_LogL16Encode to i8*), i32 24, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_L16fromY = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_L16fromY = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5382531586869842543, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_L16fromY, i32 0, i32 0), i8* bitcast (void (%struct.logLuvState*, i8*, i32)* @L16fromY to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pix24fromXYZ = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_pix24fromXYZ = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3976748659474787029, i64 75674488522, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix24fromXYZ, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_uv_encode = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_uv_encode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6562624713322270972, i64 66257271633, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_uv_encode, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pix32fromXYZ = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_pix32fromXYZ = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3183400047957294196, i64 88591327847, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_pix32fromXYZ, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pix16fromY = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_pix16fromY = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8960909345102173463, i64 66257271633, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix16fromY, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [12 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [942 x i8] c"\AB\07\00TIFFInitSGILog\01tmp1.ll:_logLuvNop\01tmp1.ll:LogLuvSetupDecode\01tmp1.ll:LogLuvDecodeStrip\01tmp1.ll:LogLuvDecodeTile\01tmp1.ll:LogLuvSetupEncode\01tmp1.ll:LogLuvEncodeStrip\01tmp1.ll:LogLuvEncodeTile\01tmp1.ll:LogLuvClose\01tmp1.ll:LogLuvCleanup\01tmp1.ll:LogLuvVGetField\01tmp1.ll:LogLuvVSetField\01tmp1.ll:LogLuvInitState\01tmp1.ll:LogLuvDecode24\01tmp1.ll:Luv24toXYZ\01tmp1.ll:Luv24toLuv48\01tmp1.ll:Luv24toRGB\01tmp1.ll:LogLuvDecode32\01tmp1.ll:Luv32toXYZ\01tmp1.ll:Luv32toLuv48\01tmp1.ll:Luv32toRGB\01tmp1.ll:LogL16InitState\01tmp1.ll:LogL16Decode\01tmp1.ll:L16toY\01tmp1.ll:L16toGry\01tmp1.ll:LogLuvGuessDataFmt\01tmp1.ll:pix24toXYZ\01tmp1.ll:uv_decode\01tmp1.ll:XYZtoRGB24\01tmp1.ll:pix32toXYZ\01tmp1.ll:pix16toY\01tmp1.ll:LogL16GuessDataFmt\01tmp1.ll:LogLuvEncode24\01tmp1.ll:Luv24fromXYZ\01tmp1.ll:Luv24fromLuv48\01tmp1.ll:LogLuvEncode32\01tmp1.ll:Luv32fromXYZ\01tmp1.ll:Luv32fromLuv48\01tmp1.ll:LogL16Encode\01tmp1.ll:L16fromY\01tmp1.ll:pix24fromXYZ\01tmp1.ll:uv_encode\01tmp1.ll:pix32fromXYZ\01tmp1.ll:pix16fromY", section "__llvm_prf_names"
@llvm.used = appending global [46 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFInitSGILog to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll__logLuvNop to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvSetupDecode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvDecodeStrip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvDecodeTile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvSetupEncode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvEncodeStrip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvEncodeTile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvClose to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvCleanup to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvVGetField to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvVSetField to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvInitState to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvDecode24 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Luv24toXYZ to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Luv24toLuv48 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Luv24toRGB to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvDecode32 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Luv32toXYZ to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Luv32toLuv48 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Luv32toRGB to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogL16InitState to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogL16Decode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_L16toY to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_L16toGry to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvGuessDataFmt to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pix24toXYZ to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_uv_decode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_XYZtoRGB24 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pix32toXYZ to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pix16toY to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogL16GuessDataFmt to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvEncode24 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Luv24fromXYZ to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Luv24fromLuv48 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvEncode32 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Luv32fromXYZ to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Luv32fromLuv48 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogL16Encode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_L16fromY to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pix24fromXYZ to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_uv_encode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pix32fromXYZ to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pix16fromY to i8*), i8* bitcast ([12 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([942 x i8], [942 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFInitSGILog(%struct.tiff*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.logLuvState*, align 8
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %7 = load i32, i32* %5, align 4
  %8 = icmp eq i32 %7, 34677
  br i1 %8, label %13, label %9

; <label>:9:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFInitSGILog, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFInitSGILog, i64 0, i64 1)
  %11 = load i32, i32* %5, align 4
  %12 = icmp eq i32 %11, 34676
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %9, %2
  br label %17

; <label>:14:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFInitSGILog, i64 0, i64 3)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFInitSGILog, i64 0, i64 3)
  call void @__assert_fail(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 1386, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @__PRETTY_FUNCTION__.TIFFInitSGILog, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %17

; <label>:17:                                     ; preds = %16, %13
  %18 = call i8* @_TIFFmalloc(i32 48)
  %19 = load %struct.tiff*, %struct.tiff** %4, align 8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %19, i32 0, i32 37
  store i8* %18, i8** %20, align 8
  %21 = load %struct.tiff*, %struct.tiff** %4, align 8
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %21, i32 0, i32 37
  %23 = load i8*, i8** %22, align 8
  %24 = icmp eq i8* %23, null
  br i1 %24, label %25, label %26

; <label>:25:                                     ; preds = %17
  br label %69

; <label>:26:                                     ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFInitSGILog, i64 0, i64 0)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFInitSGILog, i64 0, i64 0)
  %28 = load %struct.tiff*, %struct.tiff** %4, align 8
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %28, i32 0, i32 37
  %30 = load i8*, i8** %29, align 8
  %31 = bitcast i8* %30 to %struct.logLuvState*
  store %struct.logLuvState* %31, %struct.logLuvState** %6, align 8
  %32 = load %struct.logLuvState*, %struct.logLuvState** %6, align 8
  %33 = bitcast %struct.logLuvState* %32 to i8*
  call void @llvm.memset.p0i8.i64(i8* %33, i8 0, i64 48, i32 8, i1 false)
  %34 = load %struct.logLuvState*, %struct.logLuvState** %6, align 8
  %35 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %34, i32 0, i32 0
  store i32 -1, i32* %35, align 8
  %36 = load %struct.logLuvState*, %struct.logLuvState** %6, align 8
  %37 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %36, i32 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @_logLuvNop, void (%struct.logLuvState*, i8*, i32)** %37, align 8
  %38 = load %struct.tiff*, %struct.tiff** %4, align 8
  %39 = getelementptr inbounds %struct.tiff, %struct.tiff* %38, i32 0, i32 21
  store i32 (%struct.tiff*)* @LogLuvSetupDecode, i32 (%struct.tiff*)** %39, align 8
  %40 = load %struct.tiff*, %struct.tiff** %4, align 8
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %40, i32 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvDecodeStrip, i32 (%struct.tiff*, i8*, i32, i16)** %41, align 8
  %42 = load %struct.tiff*, %struct.tiff** %4, align 8
  %43 = getelementptr inbounds %struct.tiff, %struct.tiff* %42, i32 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvDecodeTile, i32 (%struct.tiff*, i8*, i32, i16)** %43, align 8
  %44 = load %struct.tiff*, %struct.tiff** %4, align 8
  %45 = getelementptr inbounds %struct.tiff, %struct.tiff* %44, i32 0, i32 23
  store i32 (%struct.tiff*)* @LogLuvSetupEncode, i32 (%struct.tiff*)** %45, align 8
  %46 = load %struct.tiff*, %struct.tiff** %4, align 8
  %47 = getelementptr inbounds %struct.tiff, %struct.tiff* %46, i32 0, i32 29
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvEncodeStrip, i32 (%struct.tiff*, i8*, i32, i16)** %47, align 8
  %48 = load %struct.tiff*, %struct.tiff** %4, align 8
  %49 = getelementptr inbounds %struct.tiff, %struct.tiff* %48, i32 0, i32 31
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvEncodeTile, i32 (%struct.tiff*, i8*, i32, i16)** %49, align 8
  %50 = load %struct.tiff*, %struct.tiff** %4, align 8
  %51 = getelementptr inbounds %struct.tiff, %struct.tiff* %50, i32 0, i32 32
  store void (%struct.tiff*)* @LogLuvClose, void (%struct.tiff*)** %51, align 8
  %52 = load %struct.tiff*, %struct.tiff** %4, align 8
  %53 = getelementptr inbounds %struct.tiff, %struct.tiff* %52, i32 0, i32 34
  store void (%struct.tiff*)* @LogLuvCleanup, void (%struct.tiff*)** %53, align 8
  %54 = load %struct.tiff*, %struct.tiff** %4, align 8
  call void @_TIFFMergeFieldInfo(%struct.tiff* %54, %struct.TIFFFieldInfo* getelementptr inbounds ([1 x %struct.TIFFFieldInfo], [1 x %struct.TIFFFieldInfo]* @LogLuvFieldInfo, i32 0, i32 0), i32 1)
  %55 = load %struct.tiff*, %struct.tiff** %4, align 8
  %56 = getelementptr inbounds %struct.tiff, %struct.tiff* %55, i32 0, i32 58
  %57 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %56, align 8
  %58 = load %struct.logLuvState*, %struct.logLuvState** %6, align 8
  %59 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %58, i32 0, i32 5
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* %57, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %59, align 8
  %60 = load %struct.tiff*, %struct.tiff** %4, align 8
  %61 = getelementptr inbounds %struct.tiff, %struct.tiff* %60, i32 0, i32 58
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @LogLuvVGetField, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %61, align 8
  %62 = load %struct.tiff*, %struct.tiff** %4, align 8
  %63 = getelementptr inbounds %struct.tiff, %struct.tiff* %62, i32 0, i32 57
  %64 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %63, align 8
  %65 = load %struct.logLuvState*, %struct.logLuvState** %6, align 8
  %66 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %65, i32 0, i32 6
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* %64, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %66, align 8
  %67 = load %struct.tiff*, %struct.tiff** %4, align 8
  %68 = getelementptr inbounds %struct.tiff, %struct.tiff* %67, i32 0, i32 57
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @LogLuvVSetField, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %68, align 8
  store i32 1, i32* %3, align 4
  br label %74

; <label>:69:                                     ; preds = %25
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFInitSGILog, i64 0, i64 2)
  %70 = add i64 %pgocount3, 1
  store i64 %70, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFInitSGILog, i64 0, i64 2)
  %71 = load %struct.tiff*, %struct.tiff** %4, align 8
  %72 = getelementptr inbounds %struct.tiff, %struct.tiff* %71, i32 0, i32 0
  %73 = load i8*, i8** %72, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @TIFFInitSGILog.module, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i32 0, i32 0), i8* %73)
  store i32 0, i32* %3, align 4
  br label %74

; <label>:74:                                     ; preds = %69, %26
  %75 = load i32, i32* %3, align 4
  ret i32 %75
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #1

declare i8* @_TIFFmalloc(i32) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: noinline nounwind uwtable
define internal void @_logLuvNop(%struct.logLuvState*, i8*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__logLuvNop, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__logLuvNop, i64 0, i64 0)
  %5 = alloca %struct.logLuvState*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  store %struct.logLuvState* %0, %struct.logLuvState** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  %8 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %9 = load i8*, i8** %6, align 8
  %10 = load i32, i32* %7, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvSetupDecode(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.logLuvState*, align 8
  %5 = alloca %struct.TIFFDirectory*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 37
  %8 = load i8*, i8** %7, align 8
  %9 = bitcast i8* %8 to %struct.logLuvState*
  store %struct.logLuvState* %9, %struct.logLuvState** %4, align 8
  %10 = load %struct.tiff*, %struct.tiff** %3, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 6
  store %struct.TIFFDirectory* %11, %struct.TIFFDirectory** %5, align 8
  %12 = load %struct.tiff*, %struct.tiff** %3, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 54
  store void (%struct.tiff*, i8*, i32)* @_TIFFNoPostDecode, void (%struct.tiff*, i8*, i32)** %13, align 8
  %14 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %15 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %14, i32 0, i32 11
  %16 = load i16, i16* %15, align 2
  %17 = zext i16 %16 to i32
  switch i32 %17, label %93 [
    i32 32845, label %18
    i32 32844, label %71
  ]

; <label>:18:                                     ; preds = %1
  %19 = load %struct.tiff*, %struct.tiff** %3, align 8
  %20 = call i32 @LogLuvInitState(%struct.tiff* %19)
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %24, label %22

; <label>:22:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 2)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 2)
  br label %102

; <label>:24:                                     ; preds = %18
  %25 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %26 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %25, i32 0, i32 10
  %27 = load i16, i16* %26, align 8
  %28 = zext i16 %27 to i32
  %29 = icmp eq i32 %28, 34677
  br i1 %29, label %30, label %50

; <label>:30:                                     ; preds = %24
  %31 = load %struct.tiff*, %struct.tiff** %3, align 8
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %31, i32 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvDecode24, i32 (%struct.tiff*, i8*, i32, i16)** %32, align 8
  %33 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %34 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %33, i32 0, i32 0
  %35 = load i32, i32* %34, align 8
  switch i32 %35, label %48 [
    i32 0, label %36
    i32 1, label %40
    i32 3, label %44
  ]

; <label>:36:                                     ; preds = %30
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 8)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 8)
  %38 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %39 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %38, i32 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @Luv24toXYZ, void (%struct.logLuvState*, i8*, i32)** %39, align 8
  br label %48

; <label>:40:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 9)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 9)
  %42 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %43 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %42, i32 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @Luv24toLuv48, void (%struct.logLuvState*, i8*, i32)** %43, align 8
  br label %48

; <label>:44:                                     ; preds = %30
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 10)
  %45 = add i64 %pgocount3, 1
  store i64 %45, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 10)
  %46 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %47 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %46, i32 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @Luv24toRGB, void (%struct.logLuvState*, i8*, i32)** %47, align 8
  br label %48

; <label>:48:                                     ; preds = %44, %40, %36, %30
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 4)
  %49 = add i64 %pgocount4, 1
  store i64 %49, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 4)
  br label %70

; <label>:50:                                     ; preds = %24
  %51 = load %struct.tiff*, %struct.tiff** %3, align 8
  %52 = getelementptr inbounds %struct.tiff, %struct.tiff* %51, i32 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvDecode32, i32 (%struct.tiff*, i8*, i32, i16)** %52, align 8
  %53 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %54 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %53, i32 0, i32 0
  %55 = load i32, i32* %54, align 8
  switch i32 %55, label %68 [
    i32 0, label %56
    i32 1, label %60
    i32 3, label %64
  ]

; <label>:56:                                     ; preds = %50
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 11)
  %57 = add i64 %pgocount5, 1
  store i64 %57, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 11)
  %58 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %59 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %58, i32 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @Luv32toXYZ, void (%struct.logLuvState*, i8*, i32)** %59, align 8
  br label %68

; <label>:60:                                     ; preds = %50
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 12)
  %61 = add i64 %pgocount6, 1
  store i64 %61, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 12)
  %62 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %63 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %62, i32 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @Luv32toLuv48, void (%struct.logLuvState*, i8*, i32)** %63, align 8
  br label %68

; <label>:64:                                     ; preds = %50
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 13)
  %65 = add i64 %pgocount7, 1
  store i64 %65, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 13)
  %66 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %67 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %66, i32 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @Luv32toRGB, void (%struct.logLuvState*, i8*, i32)** %67, align 8
  br label %68

; <label>:68:                                     ; preds = %64, %60, %56, %50
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 5)
  %69 = add i64 %pgocount8, 1
  store i64 %69, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 5)
  br label %70

; <label>:70:                                     ; preds = %68, %48
  store i32 1, i32* %2, align 4
  br label %103

; <label>:71:                                     ; preds = %1
  %72 = load %struct.tiff*, %struct.tiff** %3, align 8
  %73 = call i32 @LogL16InitState(%struct.tiff* %72)
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %77, label %75

; <label>:75:                                     ; preds = %71
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 3)
  %76 = add i64 %pgocount9, 1
  store i64 %76, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 3)
  br label %102

; <label>:77:                                     ; preds = %71
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 1)
  %78 = add i64 %pgocount10, 1
  store i64 %78, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 1)
  %79 = load %struct.tiff*, %struct.tiff** %3, align 8
  %80 = getelementptr inbounds %struct.tiff, %struct.tiff* %79, i32 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogL16Decode, i32 (%struct.tiff*, i8*, i32, i16)** %80, align 8
  %81 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %82 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %81, i32 0, i32 0
  %83 = load i32, i32* %82, align 8
  switch i32 %83, label %92 [
    i32 0, label %84
    i32 3, label %88
  ]

; <label>:84:                                     ; preds = %77
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 6)
  %85 = add i64 %pgocount11, 1
  store i64 %85, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 6)
  %86 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %87 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %86, i32 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @L16toY, void (%struct.logLuvState*, i8*, i32)** %87, align 8
  br label %92

; <label>:88:                                     ; preds = %77
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 7)
  %89 = add i64 %pgocount12, 1
  store i64 %89, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 7)
  %90 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %91 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %90, i32 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @L16toGry, void (%struct.logLuvState*, i8*, i32)** %91, align 8
  br label %92

; <label>:92:                                     ; preds = %88, %84, %77
  store i32 1, i32* %2, align 4
  br label %103

; <label>:93:                                     ; preds = %1
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 0)
  %94 = add i64 %pgocount13, 1
  store i64 %94, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvSetupDecode, i64 0, i64 0)
  %95 = load %struct.tiff*, %struct.tiff** %3, align 8
  %96 = getelementptr inbounds %struct.tiff, %struct.tiff* %95, i32 0, i32 0
  %97 = load i8*, i8** %96, align 8
  %98 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %99 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %98, i32 0, i32 11
  %100 = load i16, i16* %99, align 2
  %101 = zext i16 %100 to i32
  call void (i8*, i8*, ...) @TIFFError(i8* %97, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.3, i32 0, i32 0), i32 %101, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.4, i32 0, i32 0))
  br label %102

; <label>:102:                                    ; preds = %93, %75, %22
  store i32 0, i32* %2, align 4
  br label %103

; <label>:103:                                    ; preds = %102, %92, %70
  %104 = load i32, i32* %2, align 4
  ret i32 %104
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvDecodeStrip(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i16, align 2
  %9 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i16 %3, i16* %8, align 2
  %10 = load %struct.tiff*, %struct.tiff** %5, align 8
  %11 = call i32 @TIFFScanlineSize(%struct.tiff* %10)
  store i32 %11, i32* %9, align 4
  %12 = load i32, i32* %7, align 4
  %13 = load i32, i32* %9, align 4
  %14 = srem i32 %12, %13
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16:                                     ; preds = %4
  br label %20

; <label>:17:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvDecodeStrip, i64 0, i64 3)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvDecodeStrip, i64 0, i64 3)
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 324, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @__PRETTY_FUNCTION__.LogLuvDecodeStrip, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %20

; <label>:20:                                     ; preds = %19, %16
  br label %21

; <label>:21:                                     ; preds = %38, %20
  %22 = load i32, i32* %7, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %36

; <label>:24:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvDecodeStrip, i64 0, i64 1)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvDecodeStrip, i64 0, i64 1)
  %26 = load %struct.tiff*, %struct.tiff** %5, align 8
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %26, i32 0, i32 26
  %28 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %27, align 8
  %29 = load %struct.tiff*, %struct.tiff** %5, align 8
  %30 = load i8*, i8** %6, align 8
  %31 = load i32, i32* %9, align 4
  %32 = load i16, i16* %8, align 2
  %33 = ptrtoint i32 (%struct.tiff*, i8*, i32, i16)* %28 to i64
  call void @__llvm_profile_instrument_target(i64 %33, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvDecodeStrip to i8*), i32 0)
  %34 = call i32 %28(%struct.tiff* %29, i8* %30, i32 %31, i16 zeroext %32)
  %35 = icmp ne i32 %34, 0
  br label %36

; <label>:36:                                     ; preds = %24, %21
  %37 = phi i1 [ false, %21 ], [ %35, %24 ]
  br i1 %37, label %38, label %47

; <label>:38:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvDecodeStrip, i64 0, i64 0)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvDecodeStrip, i64 0, i64 0)
  %40 = load i32, i32* %9, align 4
  %41 = load i8*, i8** %6, align 8
  %42 = sext i32 %40 to i64
  %43 = getelementptr inbounds i8, i8* %41, i64 %42
  store i8* %43, i8** %6, align 8
  %44 = load i32, i32* %9, align 4
  %45 = load i32, i32* %7, align 4
  %46 = sub nsw i32 %45, %44
  store i32 %46, i32* %7, align 4
  br label %21

; <label>:47:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvDecodeStrip, i64 0, i64 2)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvDecodeStrip, i64 0, i64 2)
  %49 = load i32, i32* %7, align 4
  %50 = icmp eq i32 %49, 0
  %51 = zext i1 %50 to i32
  ret i32 %51
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvDecodeTile(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i16, align 2
  %9 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i16 %3, i16* %8, align 2
  %10 = load %struct.tiff*, %struct.tiff** %5, align 8
  %11 = call i32 @TIFFTileRowSize(%struct.tiff* %10)
  store i32 %11, i32* %9, align 4
  %12 = load i32, i32* %7, align 4
  %13 = load i32, i32* %9, align 4
  %14 = srem i32 %12, %13
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16:                                     ; preds = %4
  br label %20

; <label>:17:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvDecodeTile, i64 0, i64 3)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvDecodeTile, i64 0, i64 3)
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 340, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__PRETTY_FUNCTION__.LogLuvDecodeTile, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %20

; <label>:20:                                     ; preds = %19, %16
  br label %21

; <label>:21:                                     ; preds = %38, %20
  %22 = load i32, i32* %7, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %36

; <label>:24:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvDecodeTile, i64 0, i64 1)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvDecodeTile, i64 0, i64 1)
  %26 = load %struct.tiff*, %struct.tiff** %5, align 8
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %26, i32 0, i32 26
  %28 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %27, align 8
  %29 = load %struct.tiff*, %struct.tiff** %5, align 8
  %30 = load i8*, i8** %6, align 8
  %31 = load i32, i32* %9, align 4
  %32 = load i16, i16* %8, align 2
  %33 = ptrtoint i32 (%struct.tiff*, i8*, i32, i16)* %28 to i64
  call void @__llvm_profile_instrument_target(i64 %33, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvDecodeTile to i8*), i32 0)
  %34 = call i32 %28(%struct.tiff* %29, i8* %30, i32 %31, i16 zeroext %32)
  %35 = icmp ne i32 %34, 0
  br label %36

; <label>:36:                                     ; preds = %24, %21
  %37 = phi i1 [ false, %21 ], [ %35, %24 ]
  br i1 %37, label %38, label %47

; <label>:38:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvDecodeTile, i64 0, i64 0)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvDecodeTile, i64 0, i64 0)
  %40 = load i32, i32* %9, align 4
  %41 = load i8*, i8** %6, align 8
  %42 = sext i32 %40 to i64
  %43 = getelementptr inbounds i8, i8* %41, i64 %42
  store i8* %43, i8** %6, align 8
  %44 = load i32, i32* %9, align 4
  %45 = load i32, i32* %7, align 4
  %46 = sub nsw i32 %45, %44
  store i32 %46, i32* %7, align 4
  br label %21

; <label>:47:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvDecodeTile, i64 0, i64 2)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvDecodeTile, i64 0, i64 2)
  %49 = load i32, i32* %7, align 4
  %50 = icmp eq i32 %49, 0
  %51 = zext i1 %50 to i32
  ret i32 %51
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvSetupEncode(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.logLuvState*, align 8
  %5 = alloca %struct.TIFFDirectory*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 37
  %8 = load i8*, i8** %7, align 8
  %9 = bitcast i8* %8 to %struct.logLuvState*
  store %struct.logLuvState* %9, %struct.logLuvState** %4, align 8
  %10 = load %struct.tiff*, %struct.tiff** %3, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 6
  store %struct.TIFFDirectory* %11, %struct.TIFFDirectory** %5, align 8
  %12 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %13 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %12, i32 0, i32 11
  %14 = load i16, i16* %13, align 2
  %15 = zext i16 %14 to i32
  switch i32 %15, label %88 [
    i32 32845, label %16
    i32 32844, label %67
  ]

; <label>:16:                                     ; preds = %1
  %17 = load %struct.tiff*, %struct.tiff** %3, align 8
  %18 = call i32 @LogLuvInitState(%struct.tiff* %17)
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %16
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 1)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 1)
  br label %97

; <label>:22:                                     ; preds = %16
  %23 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %24 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %23, i32 0, i32 10
  %25 = load i16, i16* %24, align 8
  %26 = zext i16 %25 to i32
  %27 = icmp eq i32 %26, 34677
  br i1 %27, label %28, label %47

; <label>:28:                                     ; preds = %22
  %29 = load %struct.tiff*, %struct.tiff** %3, align 8
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %29, i32 0, i32 27
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvEncode24, i32 (%struct.tiff*, i8*, i32, i16)** %30, align 8
  %31 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %32 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %31, i32 0, i32 0
  %33 = load i32, i32* %32, align 8
  switch i32 %33, label %44 [
    i32 0, label %34
    i32 1, label %38
    i32 2, label %42
  ]

; <label>:34:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 6)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 6)
  %36 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %37 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %36, i32 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @Luv24fromXYZ, void (%struct.logLuvState*, i8*, i32)** %37, align 8
  br label %46

; <label>:38:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 7)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 7)
  %40 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %41 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %40, i32 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @Luv24fromLuv48, void (%struct.logLuvState*, i8*, i32)** %41, align 8
  br label %46

; <label>:42:                                     ; preds = %28
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 8)
  %43 = add i64 %pgocount3, 1
  store i64 %43, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 8)
  br label %46

; <label>:44:                                     ; preds = %28
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 9)
  %45 = add i64 %pgocount4, 1
  store i64 %45, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 9)
  br label %98

; <label>:46:                                     ; preds = %42, %38, %34
  br label %66

; <label>:47:                                     ; preds = %22
  %48 = load %struct.tiff*, %struct.tiff** %3, align 8
  %49 = getelementptr inbounds %struct.tiff, %struct.tiff* %48, i32 0, i32 27
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogLuvEncode32, i32 (%struct.tiff*, i8*, i32, i16)** %49, align 8
  %50 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %51 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %50, i32 0, i32 0
  %52 = load i32, i32* %51, align 8
  switch i32 %52, label %63 [
    i32 0, label %53
    i32 1, label %57
    i32 2, label %61
  ]

; <label>:53:                                     ; preds = %47
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 10)
  %54 = add i64 %pgocount5, 1
  store i64 %54, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 10)
  %55 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %56 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %55, i32 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @Luv32fromXYZ, void (%struct.logLuvState*, i8*, i32)** %56, align 8
  br label %65

; <label>:57:                                     ; preds = %47
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 11)
  %58 = add i64 %pgocount6, 1
  store i64 %58, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 11)
  %59 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %60 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %59, i32 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @Luv32fromLuv48, void (%struct.logLuvState*, i8*, i32)** %60, align 8
  br label %65

; <label>:61:                                     ; preds = %47
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 12)
  %62 = add i64 %pgocount7, 1
  store i64 %62, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 12)
  br label %65

; <label>:63:                                     ; preds = %47
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 13)
  %64 = add i64 %pgocount8, 1
  store i64 %64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 13)
  br label %98

; <label>:65:                                     ; preds = %61, %57, %53
  br label %66

; <label>:66:                                     ; preds = %65, %46
  br label %97

; <label>:67:                                     ; preds = %1
  %68 = load %struct.tiff*, %struct.tiff** %3, align 8
  %69 = call i32 @LogL16InitState(%struct.tiff* %68)
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %73, label %71

; <label>:71:                                     ; preds = %67
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 2)
  %72 = add i64 %pgocount9, 1
  store i64 %72, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 2)
  br label %97

; <label>:73:                                     ; preds = %67
  %74 = load %struct.tiff*, %struct.tiff** %3, align 8
  %75 = getelementptr inbounds %struct.tiff, %struct.tiff* %74, i32 0, i32 27
  store i32 (%struct.tiff*, i8*, i32, i16)* @LogL16Encode, i32 (%struct.tiff*, i8*, i32, i16)** %75, align 8
  %76 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %77 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %76, i32 0, i32 0
  %78 = load i32, i32* %77, align 8
  switch i32 %78, label %85 [
    i32 0, label %79
    i32 1, label %83
  ]

; <label>:79:                                     ; preds = %73
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 3)
  %80 = add i64 %pgocount10, 1
  store i64 %80, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 3)
  %81 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %82 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %81, i32 0, i32 4
  store void (%struct.logLuvState*, i8*, i32)* @L16fromY, void (%struct.logLuvState*, i8*, i32)** %82, align 8
  br label %87

; <label>:83:                                     ; preds = %73
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 4)
  %84 = add i64 %pgocount11, 1
  store i64 %84, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 4)
  br label %87

; <label>:85:                                     ; preds = %73
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 5)
  %86 = add i64 %pgocount12, 1
  store i64 %86, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 5)
  br label %98

; <label>:87:                                     ; preds = %83, %79
  br label %97

; <label>:88:                                     ; preds = %1
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 0)
  %89 = add i64 %pgocount13, 1
  store i64 %89, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 0)
  %90 = load %struct.tiff*, %struct.tiff** %3, align 8
  %91 = getelementptr inbounds %struct.tiff, %struct.tiff* %90, i32 0, i32 0
  %92 = load i8*, i8** %91, align 8
  %93 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %94 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %93, i32 0, i32 11
  %95 = load i16, i16* %94, align 2
  %96 = zext i16 %95 to i32
  call void (i8*, i8*, ...) @TIFFError(i8* %92, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.3, i32 0, i32 0), i32 %96, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.4, i32 0, i32 0))
  br label %97

; <label>:97:                                     ; preds = %88, %87, %71, %66, %20
  store i32 1, i32* %2, align 4
  br label %110

; <label>:98:                                     ; preds = %85, %63, %44
  %99 = load %struct.tiff*, %struct.tiff** %3, align 8
  %100 = getelementptr inbounds %struct.tiff, %struct.tiff* %99, i32 0, i32 0
  %101 = load i8*, i8** %100, align 8
  %102 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %103 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %102, i32 0, i32 11
  %104 = load i16, i16* %103, align 2
  %105 = zext i16 %104 to i32
  %106 = icmp eq i32 %105, 32844
  %107 = zext i1 %106 to i64
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 14)
  %108 = add i64 %pgocount14, %107
  store i64 %108, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_LogLuvSetupEncode, i64 0, i64 14)
  %109 = select i1 %106, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.20, i32 0, i32 0)
  call void (i8*, i8*, ...) @TIFFError(i8* %101, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.18, i32 0, i32 0), i8* %109)
  store i32 0, i32* %2, align 4
  br label %110

; <label>:110:                                    ; preds = %98, %97
  %111 = load i32, i32* %2, align 4
  ret i32 %111
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvEncodeStrip(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i16, align 2
  %9 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i16 %3, i16* %8, align 2
  %10 = load %struct.tiff*, %struct.tiff** %5, align 8
  %11 = call i32 @TIFFScanlineSize(%struct.tiff* %10)
  store i32 %11, i32* %9, align 4
  %12 = load i32, i32* %7, align 4
  %13 = load i32, i32* %9, align 4
  %14 = srem i32 %12, %13
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16:                                     ; preds = %4
  br label %20

; <label>:17:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvEncodeStrip, i64 0, i64 3)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvEncodeStrip, i64 0, i64 3)
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 577, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @__PRETTY_FUNCTION__.LogLuvEncodeStrip, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %20

; <label>:20:                                     ; preds = %19, %16
  br label %21

; <label>:21:                                     ; preds = %38, %20
  %22 = load i32, i32* %7, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %36

; <label>:24:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvEncodeStrip, i64 0, i64 1)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvEncodeStrip, i64 0, i64 1)
  %26 = load %struct.tiff*, %struct.tiff** %5, align 8
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %26, i32 0, i32 27
  %28 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %27, align 8
  %29 = load %struct.tiff*, %struct.tiff** %5, align 8
  %30 = load i8*, i8** %6, align 8
  %31 = load i32, i32* %9, align 4
  %32 = load i16, i16* %8, align 2
  %33 = ptrtoint i32 (%struct.tiff*, i8*, i32, i16)* %28 to i64
  call void @__llvm_profile_instrument_target(i64 %33, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvEncodeStrip to i8*), i32 0)
  %34 = call i32 %28(%struct.tiff* %29, i8* %30, i32 %31, i16 zeroext %32)
  %35 = icmp eq i32 %34, 0
  br label %36

; <label>:36:                                     ; preds = %24, %21
  %37 = phi i1 [ false, %21 ], [ %35, %24 ]
  br i1 %37, label %38, label %47

; <label>:38:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvEncodeStrip, i64 0, i64 0)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvEncodeStrip, i64 0, i64 0)
  %40 = load i32, i32* %9, align 4
  %41 = load i8*, i8** %6, align 8
  %42 = sext i32 %40 to i64
  %43 = getelementptr inbounds i8, i8* %41, i64 %42
  store i8* %43, i8** %6, align 8
  %44 = load i32, i32* %9, align 4
  %45 = load i32, i32* %7, align 4
  %46 = sub nsw i32 %45, %44
  store i32 %46, i32* %7, align 4
  br label %21

; <label>:47:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvEncodeStrip, i64 0, i64 2)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvEncodeStrip, i64 0, i64 2)
  %49 = load i32, i32* %7, align 4
  %50 = icmp eq i32 %49, 0
  %51 = zext i1 %50 to i32
  ret i32 %51
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvEncodeTile(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i16, align 2
  %9 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i16 %3, i16* %8, align 2
  %10 = load %struct.tiff*, %struct.tiff** %5, align 8
  %11 = call i32 @TIFFTileRowSize(%struct.tiff* %10)
  store i32 %11, i32* %9, align 4
  %12 = load i32, i32* %7, align 4
  %13 = load i32, i32* %9, align 4
  %14 = srem i32 %12, %13
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16:                                     ; preds = %4
  br label %20

; <label>:17:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvEncodeTile, i64 0, i64 3)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvEncodeTile, i64 0, i64 3)
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 592, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__PRETTY_FUNCTION__.LogLuvEncodeTile, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %20

; <label>:20:                                     ; preds = %19, %16
  br label %21

; <label>:21:                                     ; preds = %38, %20
  %22 = load i32, i32* %7, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %36

; <label>:24:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvEncodeTile, i64 0, i64 1)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvEncodeTile, i64 0, i64 1)
  %26 = load %struct.tiff*, %struct.tiff** %5, align 8
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %26, i32 0, i32 27
  %28 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %27, align 8
  %29 = load %struct.tiff*, %struct.tiff** %5, align 8
  %30 = load i8*, i8** %6, align 8
  %31 = load i32, i32* %9, align 4
  %32 = load i16, i16* %8, align 2
  %33 = ptrtoint i32 (%struct.tiff*, i8*, i32, i16)* %28 to i64
  call void @__llvm_profile_instrument_target(i64 %33, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvEncodeTile to i8*), i32 0)
  %34 = call i32 %28(%struct.tiff* %29, i8* %30, i32 %31, i16 zeroext %32)
  %35 = icmp eq i32 %34, 0
  br label %36

; <label>:36:                                     ; preds = %24, %21
  %37 = phi i1 [ false, %21 ], [ %35, %24 ]
  br i1 %37, label %38, label %47

; <label>:38:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvEncodeTile, i64 0, i64 0)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvEncodeTile, i64 0, i64 0)
  %40 = load i32, i32* %9, align 4
  %41 = load i8*, i8** %6, align 8
  %42 = sext i32 %40 to i64
  %43 = getelementptr inbounds i8, i8* %41, i64 %42
  store i8* %43, i8** %6, align 8
  %44 = load i32, i32* %9, align 4
  %45 = load i32, i32* %7, align 4
  %46 = sub nsw i32 %45, %44
  store i32 %46, i32* %7, align 4
  br label %21

; <label>:47:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvEncodeTile, i64 0, i64 2)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LogLuvEncodeTile, i64 0, i64 2)
  %49 = load i32, i32* %7, align 4
  %50 = icmp eq i32 %49, 0
  %51 = zext i1 %50 to i32
  ret i32 %51
}

; Function Attrs: noinline nounwind uwtable
define internal void @LogLuvClose(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_LogLuvClose, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_LogLuvClose, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.TIFFDirectory*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %5 = load %struct.tiff*, %struct.tiff** %3, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %5, i32 0, i32 6
  store %struct.TIFFDirectory* %6, %struct.TIFFDirectory** %4, align 8
  %7 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %8 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %7, i32 0, i32 11
  %9 = load i16, i16* %8, align 2
  %10 = zext i16 %9 to i32
  %11 = icmp eq i32 %10, 32844
  %12 = zext i1 %11 to i64
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_LogLuvClose, i64 0, i64 1)
  %13 = add i64 %pgocount1, %12
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_LogLuvClose, i64 0, i64 1)
  %14 = select i1 %11, i32 1, i32 3
  %15 = trunc i32 %14 to i16
  %16 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %17 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %16, i32 0, i32 15
  store i16 %15, i16* %17, align 2
  %18 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %19 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %18, i32 0, i32 8
  store i16 16, i16* %19, align 4
  %20 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %21 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %20, i32 0, i32 9
  store i16 2, i16* %21, align 2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @LogLuvCleanup(%struct.tiff*) #0 {
  %2 = alloca %struct.tiff*, align 8
  %3 = alloca %struct.logLuvState*, align 8
  store %struct.tiff* %0, %struct.tiff** %2, align 8
  %4 = load %struct.tiff*, %struct.tiff** %2, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 37
  %6 = load i8*, i8** %5, align 8
  %7 = bitcast i8* %6 to %struct.logLuvState*
  store %struct.logLuvState* %7, %struct.logLuvState** %3, align 8
  %8 = load %struct.logLuvState*, %struct.logLuvState** %3, align 8
  %9 = icmp ne %struct.logLuvState* %8, null
  br i1 %9, label %10, label %27

; <label>:10:                                     ; preds = %1
  %11 = load %struct.logLuvState*, %struct.logLuvState** %3, align 8
  %12 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %11, i32 0, i32 2
  %13 = load i8**, i8*** %12, align 8
  %14 = icmp ne i8** %13, null
  br i1 %14, label %15, label %21

; <label>:15:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_LogLuvCleanup, i64 0, i64 2)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_LogLuvCleanup, i64 0, i64 2)
  %17 = load %struct.logLuvState*, %struct.logLuvState** %3, align 8
  %18 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %17, i32 0, i32 2
  %19 = load i8**, i8*** %18, align 8
  %20 = bitcast i8** %19 to i8*
  call void @_TIFFfree(i8* %20)
  br label %21

; <label>:21:                                     ; preds = %15, %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_LogLuvCleanup, i64 0, i64 1)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_LogLuvCleanup, i64 0, i64 1)
  %23 = load %struct.logLuvState*, %struct.logLuvState** %3, align 8
  %24 = bitcast %struct.logLuvState* %23 to i8*
  call void @_TIFFfree(i8* %24)
  %25 = load %struct.tiff*, %struct.tiff** %2, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %25, i32 0, i32 37
  store i8* null, i8** %26, align 8
  br label %27

; <label>:27:                                     ; preds = %21, %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_LogLuvCleanup, i64 0, i64 0)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_LogLuvCleanup, i64 0, i64 0)
  ret void
}

declare void @_TIFFMergeFieldInfo(%struct.tiff*, %struct.TIFFFieldInfo*, i32) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvVGetField(%struct.tiff*, i32, %struct.__va_list_tag*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.__va_list_tag*, align 8
  %8 = alloca %struct.logLuvState*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32 %1, i32* %6, align 4
  store %struct.__va_list_tag* %2, %struct.__va_list_tag** %7, align 8
  %9 = load %struct.tiff*, %struct.tiff** %5, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 37
  %11 = load i8*, i8** %10, align 8
  %12 = bitcast i8* %11 to %struct.logLuvState*
  store %struct.logLuvState* %12, %struct.logLuvState** %8, align 8
  %13 = load i32, i32* %6, align 4
  switch i32 %13, label %38 [
    i32 65560, label %14
  ]

; <label>:14:                                     ; preds = %3
  %15 = load %struct.logLuvState*, %struct.logLuvState** %8, align 8
  %16 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %15, i32 0, i32 0
  %17 = load i32, i32* %16, align 8
  %18 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %19 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %18, i32 0, i32 0
  %20 = load i32, i32* %19, align 8
  %21 = icmp ule i32 %20, 40
  br i1 %21, label %22, label %29

; <label>:22:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_LogLuvVGetField, i64 0, i64 1)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_LogLuvVGetField, i64 0, i64 1)
  %24 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %18, i32 0, i32 3
  %25 = load i8*, i8** %24, align 8
  %26 = getelementptr i8, i8* %25, i32 %20
  %27 = bitcast i8* %26 to i32**
  %28 = add i32 %20, 8
  store i32 %28, i32* %19, align 8
  br label %35

; <label>:29:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_LogLuvVGetField, i64 0, i64 2)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_LogLuvVGetField, i64 0, i64 2)
  %31 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %18, i32 0, i32 2
  %32 = load i8*, i8** %31, align 8
  %33 = bitcast i8* %32 to i32**
  %34 = getelementptr i8, i8* %32, i32 8
  store i8* %34, i8** %31, align 8
  br label %35

; <label>:35:                                     ; preds = %29, %22
  %36 = phi i32** [ %27, %22 ], [ %33, %29 ]
  %37 = load i32*, i32** %36, align 8
  store i32 %17, i32* %37, align 4
  store i32 1, i32* %4, align 4
  br label %48

; <label>:38:                                     ; preds = %3
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_LogLuvVGetField, i64 0, i64 0)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_LogLuvVGetField, i64 0, i64 0)
  %40 = load %struct.logLuvState*, %struct.logLuvState** %8, align 8
  %41 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %40, i32 0, i32 5
  %42 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %41, align 8
  %43 = load %struct.tiff*, %struct.tiff** %5, align 8
  %44 = load i32, i32* %6, align 4
  %45 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %46 = ptrtoint i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* %42 to i64
  call void @__llvm_profile_instrument_target(i64 %46, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvVGetField to i8*), i32 0)
  %47 = call i32 %42(%struct.tiff* %43, i32 %44, %struct.__va_list_tag* %45)
  store i32 %47, i32* %4, align 4
  br label %48

; <label>:48:                                     ; preds = %38, %35
  %49 = load i32, i32* %4, align 4
  ret i32 %49
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvVSetField(%struct.tiff*, i32, %struct.__va_list_tag*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.__va_list_tag*, align 8
  %8 = alloca %struct.logLuvState*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32 %1, i32* %6, align 4
  store %struct.__va_list_tag* %2, %struct.__va_list_tag** %7, align 8
  %11 = load %struct.tiff*, %struct.tiff** %5, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %11, i32 0, i32 37
  %13 = load i8*, i8** %12, align 8
  %14 = bitcast i8* %13 to %struct.logLuvState*
  store %struct.logLuvState* %14, %struct.logLuvState** %8, align 8
  %15 = load i32, i32* %6, align 4
  switch i32 %15, label %72 [
    i32 65560, label %16
  ]

; <label>:16:                                     ; preds = %3
  %17 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %18 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %17, i32 0, i32 0
  %19 = load i32, i32* %18, align 8
  %20 = icmp ule i32 %19, 40
  br i1 %20, label %21, label %27

; <label>:21:                                     ; preds = %16
  %22 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %17, i32 0, i32 3
  %23 = load i8*, i8** %22, align 8
  %24 = getelementptr i8, i8* %23, i32 %19
  %25 = bitcast i8* %24 to i32*
  %26 = add i32 %19, 8
  store i32 %26, i32* %18, align 8
  br label %33

; <label>:27:                                     ; preds = %16
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogLuvVSetField, i64 0, i64 1)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogLuvVSetField, i64 0, i64 1)
  %29 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %17, i32 0, i32 2
  %30 = load i8*, i8** %29, align 8
  %31 = bitcast i8* %30 to i32*
  %32 = getelementptr i8, i8* %30, i32 8
  store i8* %32, i8** %29, align 8
  br label %33

; <label>:33:                                     ; preds = %27, %21
  %34 = phi i32* [ %25, %21 ], [ %31, %27 ]
  %35 = load i32, i32* %34, align 4
  %36 = load %struct.logLuvState*, %struct.logLuvState** %8, align 8
  %37 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %36, i32 0, i32 0
  store i32 %35, i32* %37, align 8
  %38 = load %struct.logLuvState*, %struct.logLuvState** %8, align 8
  %39 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %38, i32 0, i32 0
  %40 = load i32, i32* %39, align 8
  switch i32 %40, label %49 [
    i32 0, label %41
    i32 1, label %43
    i32 2, label %45
    i32 3, label %47
  ]

; <label>:41:                                     ; preds = %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogLuvVSetField, i64 0, i64 2)
  %42 = add i64 %pgocount1, 1
  store i64 %42, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogLuvVSetField, i64 0, i64 2)
  store i32 32, i32* %9, align 4
  store i32 3, i32* %10, align 4
  br label %57

; <label>:43:                                     ; preds = %33
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogLuvVSetField, i64 0, i64 3)
  %44 = add i64 %pgocount2, 1
  store i64 %44, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogLuvVSetField, i64 0, i64 3)
  store i32 16, i32* %9, align 4
  store i32 2, i32* %10, align 4
  br label %57

; <label>:45:                                     ; preds = %33
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogLuvVSetField, i64 0, i64 4)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogLuvVSetField, i64 0, i64 4)
  store i32 32, i32* %9, align 4
  store i32 1, i32* %10, align 4
  br label %57

; <label>:47:                                     ; preds = %33
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogLuvVSetField, i64 0, i64 5)
  %48 = add i64 %pgocount4, 1
  store i64 %48, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogLuvVSetField, i64 0, i64 5)
  store i32 8, i32* %9, align 4
  store i32 1, i32* %10, align 4
  br label %57

; <label>:49:                                     ; preds = %33
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogLuvVSetField, i64 0, i64 6)
  %50 = add i64 %pgocount5, 1
  store i64 %50, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogLuvVSetField, i64 0, i64 6)
  %51 = load %struct.tiff*, %struct.tiff** %5, align 8
  %52 = getelementptr inbounds %struct.tiff, %struct.tiff* %51, i32 0, i32 0
  %53 = load i8*, i8** %52, align 8
  %54 = load %struct.logLuvState*, %struct.logLuvState** %8, align 8
  %55 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %54, i32 0, i32 0
  %56 = load i32, i32* %55, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %53, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.22, i32 0, i32 0), i32 %56)
  store i32 0, i32* %4, align 4
  br label %82

; <label>:57:                                     ; preds = %47, %45, %43, %41
  %58 = load %struct.tiff*, %struct.tiff** %5, align 8
  %59 = load i32, i32* %9, align 4
  %60 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %58, i32 258, i32 %59)
  %61 = load %struct.tiff*, %struct.tiff** %5, align 8
  %62 = load i32, i32* %10, align 4
  %63 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %61, i32 339, i32 %62)
  %64 = load %struct.tiff*, %struct.tiff** %5, align 8
  %65 = call i32 @TIFFTileSize(%struct.tiff* %64)
  %66 = load %struct.tiff*, %struct.tiff** %5, align 8
  %67 = getelementptr inbounds %struct.tiff, %struct.tiff* %66, i32 0, i32 20
  store i32 %65, i32* %67, align 4
  %68 = load %struct.tiff*, %struct.tiff** %5, align 8
  %69 = call i32 @TIFFScanlineSize(%struct.tiff* %68)
  %70 = load %struct.tiff*, %struct.tiff** %5, align 8
  %71 = getelementptr inbounds %struct.tiff, %struct.tiff* %70, i32 0, i32 38
  store i32 %69, i32* %71, align 8
  store i32 1, i32* %4, align 4
  br label %82

; <label>:72:                                     ; preds = %3
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogLuvVSetField, i64 0, i64 0)
  %73 = add i64 %pgocount6, 1
  store i64 %73, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogLuvVSetField, i64 0, i64 0)
  %74 = load %struct.logLuvState*, %struct.logLuvState** %8, align 8
  %75 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %74, i32 0, i32 6
  %76 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %75, align 8
  %77 = load %struct.tiff*, %struct.tiff** %5, align 8
  %78 = load i32, i32* %6, align 4
  %79 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %80 = ptrtoint i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* %76 to i64
  call void @__llvm_profile_instrument_target(i64 %80, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvVSetField to i8*), i32 0)
  %81 = call i32 %76(%struct.tiff* %77, i32 %78, %struct.__va_list_tag* %79)
  store i32 %81, i32* %4, align 4
  br label %82

; <label>:82:                                     ; preds = %72, %57, %49
  %83 = load i32, i32* %4, align 4
  ret i32 %83
}

declare void @TIFFError(i8*, i8*, ...) #2

declare void @_TIFFNoPostDecode(%struct.tiff*, i8*, i32) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvInitState(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.TIFFDirectory*, align 8
  %5 = alloca %struct.logLuvState*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 6
  store %struct.TIFFDirectory* %7, %struct.TIFFDirectory** %4, align 8
  %8 = load %struct.tiff*, %struct.tiff** %3, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %8, i32 0, i32 37
  %10 = load i8*, i8** %9, align 8
  %11 = bitcast i8* %10 to %struct.logLuvState*
  store %struct.logLuvState* %11, %struct.logLuvState** %5, align 8
  %12 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %13 = icmp ne %struct.logLuvState* %12, null
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %1
  br label %18

; <label>:15:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 8)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 8)
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 1115, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__PRETTY_FUNCTION__.LogLuvInitState, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %18

; <label>:18:                                     ; preds = %17, %14
  %19 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %20 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %19, i32 0, i32 11
  %21 = load i16, i16* %20, align 2
  %22 = zext i16 %21 to i32
  %23 = icmp eq i32 %22, 32845
  br i1 %23, label %24, label %25

; <label>:24:                                     ; preds = %18
  br label %28

; <label>:25:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 9)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 9)
  call void @__assert_fail(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 1116, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__PRETTY_FUNCTION__.LogLuvInitState, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %28

; <label>:28:                                     ; preds = %27, %24
  %29 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %30 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %29, i32 0, i32 24
  %31 = load i16, i16* %30, align 2
  %32 = zext i16 %31 to i32
  %33 = icmp ne i32 %32, 1
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 0)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 0)
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @LogLuvInitState.module, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.7, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %103

; <label>:36:                                     ; preds = %28
  %37 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %38 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %37, i32 0, i32 0
  %39 = load i32, i32* %38, align 8
  %40 = icmp eq i32 %39, -1
  br i1 %40, label %41, label %47

; <label>:41:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 1)
  %42 = add i64 %pgocount3, 1
  store i64 %42, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 1)
  %43 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %44 = call i32 @LogLuvGuessDataFmt(%struct.TIFFDirectory* %43)
  %45 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %46 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %45, i32 0, i32 0
  store i32 %44, i32* %46, align 8
  br label %47

; <label>:47:                                     ; preds = %41, %36
  %48 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %49 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %48, i32 0, i32 0
  %50 = load i32, i32* %49, align 8
  switch i32 %50, label %67 [
    i32 0, label %51
    i32 1, label %55
    i32 2, label %59
    i32 3, label %63
  ]

; <label>:51:                                     ; preds = %47
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 5)
  %52 = add i64 %pgocount4, 1
  store i64 %52, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 5)
  %53 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %54 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %53, i32 0, i32 1
  store i32 12, i32* %54, align 4
  br label %72

; <label>:55:                                     ; preds = %47
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 3)
  %56 = add i64 %pgocount5, 1
  store i64 %56, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 3)
  %57 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %58 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %57, i32 0, i32 1
  store i32 6, i32* %58, align 4
  br label %72

; <label>:59:                                     ; preds = %47
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 6)
  %60 = add i64 %pgocount6, 1
  store i64 %60, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 6)
  %61 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %62 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %61, i32 0, i32 1
  store i32 4, i32* %62, align 4
  br label %72

; <label>:63:                                     ; preds = %47
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 4)
  %64 = add i64 %pgocount7, 1
  store i64 %64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 4)
  %65 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %66 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %65, i32 0, i32 1
  store i32 3, i32* %66, align 4
  br label %72

; <label>:67:                                     ; preds = %47
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 7)
  %68 = add i64 %pgocount8, 1
  store i64 %68, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 7)
  %69 = load %struct.tiff*, %struct.tiff** %3, align 8
  %70 = getelementptr inbounds %struct.tiff, %struct.tiff* %69, i32 0, i32 0
  %71 = load i8*, i8** %70, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %71, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.8, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %103

; <label>:72:                                     ; preds = %63, %59, %55, %51
  %73 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %74 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %73, i32 0, i32 1
  %75 = load i32, i32* %74, align 8
  %76 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %77 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %76, i32 0, i32 16
  %78 = load i32, i32* %77, align 4
  %79 = mul i32 %75, %78
  %80 = trunc i32 %79 to i16
  %81 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %82 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %81, i32 0, i32 3
  store i16 %80, i16* %82, align 8
  %83 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %84 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %83, i32 0, i32 3
  %85 = load i16, i16* %84, align 8
  %86 = sext i16 %85 to i64
  %87 = mul i64 %86, 4
  %88 = trunc i64 %87 to i32
  %89 = call i8* @_TIFFmalloc(i32 %88)
  %90 = bitcast i8* %89 to i8**
  %91 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %92 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %91, i32 0, i32 2
  store i8** %90, i8*** %92, align 8
  %93 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %94 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %93, i32 0, i32 2
  %95 = load i8**, i8*** %94, align 8
  %96 = icmp eq i8** %95, null
  br i1 %96, label %97, label %102

; <label>:97:                                     ; preds = %72
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 2)
  %98 = add i64 %pgocount9, 1
  store i64 %98, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_LogLuvInitState, i64 0, i64 2)
  %99 = load %struct.tiff*, %struct.tiff** %3, align 8
  %100 = getelementptr inbounds %struct.tiff, %struct.tiff* %99, i32 0, i32 0
  %101 = load i8*, i8** %100, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @LogLuvInitState.module, i32 0, i32 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.9, i32 0, i32 0), i8* %101)
  store i32 0, i32* %2, align 4
  br label %103

; <label>:102:                                    ; preds = %72
  store i32 1, i32* %2, align 4
  br label %103

; <label>:103:                                    ; preds = %102, %97, %67, %34
  %104 = load i32, i32* %2, align 4
  ret i32 %104
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvDecode24(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca %struct.logLuvState*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  %15 = alloca i32*, align 8
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %16 = load %struct.tiff*, %struct.tiff** %6, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %16, i32 0, i32 37
  %18 = load i8*, i8** %17, align 8
  %19 = bitcast i8* %18 to %struct.logLuvState*
  store %struct.logLuvState* %19, %struct.logLuvState** %10, align 8
  %20 = load i16, i16* %9, align 2
  %21 = zext i16 %20 to i32
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %24

; <label>:23:                                     ; preds = %4
  br label %27

; <label>:24:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvDecode24, i64 0, i64 5)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvDecode24, i64 0, i64 5)
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 224, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvDecode24, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %27

; <label>:27:                                     ; preds = %26, %23
  %28 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %29 = icmp ne %struct.logLuvState* %28, null
  br i1 %29, label %30, label %31

; <label>:30:                                     ; preds = %27
  br label %34

; <label>:31:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvDecode24, i64 0, i64 6)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvDecode24, i64 0, i64 6)
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 225, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvDecode24, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %34

; <label>:34:                                     ; preds = %33, %30
  %35 = load i32, i32* %8, align 4
  %36 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %37 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %36, i32 0, i32 1
  %38 = load i32, i32* %37, align 4
  %39 = sdiv i32 %35, %38
  store i32 %39, i32* %13, align 4
  %40 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %41 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %40, i32 0, i32 0
  %42 = load i32, i32* %41, align 8
  %43 = icmp eq i32 %42, 2
  br i1 %43, label %44, label %47

; <label>:44:                                     ; preds = %34
  %45 = load i8*, i8** %7, align 8
  %46 = bitcast i8* %45 to i32*
  store i32* %46, i32** %15, align 8
  br label %64

; <label>:47:                                     ; preds = %34
  %48 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %49 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %48, i32 0, i32 3
  %50 = load i16, i16* %49, align 8
  %51 = sext i16 %50 to i32
  %52 = load i32, i32* %13, align 4
  %53 = icmp sge i32 %51, %52
  br i1 %53, label %54, label %55

; <label>:54:                                     ; preds = %47
  br label %58

; <label>:55:                                     ; preds = %47
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvDecode24, i64 0, i64 7)
  %56 = add i64 %pgocount2, 1
  store i64 %56, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvDecode24, i64 0, i64 7)
  call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 232, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvDecode24, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %58

; <label>:58:                                     ; preds = %57, %54
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvDecode24, i64 0, i64 4)
  %59 = add i64 %pgocount3, 1
  store i64 %59, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvDecode24, i64 0, i64 4)
  %60 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %61 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %60, i32 0, i32 2
  %62 = load i8**, i8*** %61, align 8
  %63 = bitcast i8** %62 to i32*
  store i32* %63, i32** %15, align 8
  br label %64

; <label>:64:                                     ; preds = %58, %44
  %65 = load i32*, i32** %15, align 8
  %66 = bitcast i32* %65 to i8*
  %67 = load i32, i32* %13, align 4
  %68 = sext i32 %67 to i64
  %69 = mul i64 %68, 4
  %70 = trunc i64 %69 to i32
  call void @_TIFFmemset(i8* %66, i32 0, i32 %70)
  %71 = load %struct.tiff*, %struct.tiff** %6, align 8
  %72 = getelementptr inbounds %struct.tiff, %struct.tiff* %71, i32 0, i32 42
  %73 = load i8*, i8** %72, align 8
  store i8* %73, i8** %14, align 8
  %74 = load %struct.tiff*, %struct.tiff** %6, align 8
  %75 = getelementptr inbounds %struct.tiff, %struct.tiff* %74, i32 0, i32 43
  %76 = load i32, i32* %75, align 8
  store i32 %76, i32* %11, align 4
  store i32 0, i32* %12, align 4
  br label %77

; <label>:77:                                     ; preds = %112, %64
  %78 = load i32, i32* %12, align 4
  %79 = load i32, i32* %13, align 4
  %80 = icmp slt i32 %78, %79
  br i1 %80, label %81, label %85

; <label>:81:                                     ; preds = %77
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvDecode24, i64 0, i64 1)
  %82 = add i64 %pgocount4, 1
  store i64 %82, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvDecode24, i64 0, i64 1)
  %83 = load i32, i32* %11, align 4
  %84 = icmp sgt i32 %83, 0
  br label %85

; <label>:85:                                     ; preds = %81, %77
  %86 = phi i1 [ false, %77 ], [ %84, %81 ]
  br i1 %86, label %87, label %116

; <label>:87:                                     ; preds = %85
  %88 = load i8*, i8** %14, align 8
  %89 = getelementptr inbounds i8, i8* %88, i64 0
  %90 = load i8, i8* %89, align 1
  %91 = zext i8 %90 to i32
  %92 = shl i32 %91, 16
  %93 = load i8*, i8** %14, align 8
  %94 = getelementptr inbounds i8, i8* %93, i64 1
  %95 = load i8, i8* %94, align 1
  %96 = zext i8 %95 to i32
  %97 = shl i32 %96, 8
  %98 = or i32 %92, %97
  %99 = load i8*, i8** %14, align 8
  %100 = getelementptr inbounds i8, i8* %99, i64 2
  %101 = load i8, i8* %100, align 1
  %102 = zext i8 %101 to i32
  %103 = or i32 %98, %102
  %104 = load i32*, i32** %15, align 8
  %105 = load i32, i32* %12, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32* %104, i64 %106
  store i32 %103, i32* %107, align 4
  %108 = load i8*, i8** %14, align 8
  %109 = getelementptr inbounds i8, i8* %108, i64 3
  store i8* %109, i8** %14, align 8
  %110 = load i32, i32* %11, align 4
  %111 = sub nsw i32 %110, 3
  store i32 %111, i32* %11, align 4
  br label %112

; <label>:112:                                    ; preds = %87
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvDecode24, i64 0, i64 0)
  %113 = add i64 %pgocount5, 1
  store i64 %113, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvDecode24, i64 0, i64 0)
  %114 = load i32, i32* %12, align 4
  %115 = add nsw i32 %114, 1
  store i32 %115, i32* %12, align 4
  br label %77

; <label>:116:                                    ; preds = %85
  %117 = load i8*, i8** %14, align 8
  %118 = load %struct.tiff*, %struct.tiff** %6, align 8
  %119 = getelementptr inbounds %struct.tiff, %struct.tiff* %118, i32 0, i32 42
  store i8* %117, i8** %119, align 8
  %120 = load i32, i32* %11, align 4
  %121 = load %struct.tiff*, %struct.tiff** %6, align 8
  %122 = getelementptr inbounds %struct.tiff, %struct.tiff* %121, i32 0, i32 43
  store i32 %120, i32* %122, align 8
  %123 = load i32, i32* %12, align 4
  %124 = load i32, i32* %13, align 4
  %125 = icmp ne i32 %123, %124
  br i1 %125, label %126, label %137

; <label>:126:                                    ; preds = %116
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvDecode24, i64 0, i64 2)
  %127 = add i64 %pgocount6, 1
  store i64 %127, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvDecode24, i64 0, i64 2)
  %128 = load %struct.tiff*, %struct.tiff** %6, align 8
  %129 = getelementptr inbounds %struct.tiff, %struct.tiff* %128, i32 0, i32 0
  %130 = load i8*, i8** %129, align 8
  %131 = load %struct.tiff*, %struct.tiff** %6, align 8
  %132 = getelementptr inbounds %struct.tiff, %struct.tiff* %131, i32 0, i32 11
  %133 = load i32, i32* %132, align 8
  %134 = load i32, i32* %13, align 4
  %135 = load i32, i32* %12, align 4
  %136 = sub nsw i32 %134, %135
  call void (i8*, i8*, ...) @TIFFError(i8* %130, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.12, i32 0, i32 0), i32 %133, i32 %136)
  store i32 0, i32* %5, align 4
  br label %146

; <label>:137:                                    ; preds = %116
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvDecode24, i64 0, i64 3)
  %138 = add i64 %pgocount7, 1
  store i64 %138, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvDecode24, i64 0, i64 3)
  %139 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %140 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %139, i32 0, i32 4
  %141 = load void (%struct.logLuvState*, i8*, i32)*, void (%struct.logLuvState*, i8*, i32)** %140, align 8
  %142 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %143 = load i8*, i8** %7, align 8
  %144 = load i32, i32* %13, align 4
  %145 = ptrtoint void (%struct.logLuvState*, i8*, i32)* %141 to i64
  call void @__llvm_profile_instrument_target(i64 %145, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvDecode24 to i8*), i32 0)
  call void %141(%struct.logLuvState* %142, i8* %143, i32 %144)
  store i32 1, i32* %5, align 4
  br label %146

; <label>:146:                                    ; preds = %137, %126
  %147 = load i32, i32* %5, align 4
  ret i32 %147
}

; Function Attrs: noinline nounwind uwtable
define internal void @Luv24toXYZ(%struct.logLuvState*, i8*, i32) #0 {
  %4 = alloca %struct.logLuvState*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %8 = alloca float*, align 8
  store %struct.logLuvState* %0, %struct.logLuvState** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %9 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %10 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %9, i32 0, i32 2
  %11 = load i8**, i8*** %10, align 8
  %12 = bitcast i8** %11 to i32*
  store i32* %12, i32** %7, align 8
  %13 = load i8*, i8** %5, align 8
  %14 = bitcast i8* %13 to float*
  store float* %14, float** %8, align 8
  br label %15

; <label>:15:                                     ; preds = %19, %3
  %16 = load i32, i32* %6, align 4
  %17 = add nsw i32 %16, -1
  store i32 %17, i32* %6, align 4
  %18 = icmp sgt i32 %16, 0
  br i1 %18, label %19, label %28

; <label>:19:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv24toXYZ, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv24toXYZ, i64 0, i64 0)
  %21 = load i32*, i32** %7, align 8
  %22 = load i32, i32* %21, align 4
  %23 = load float*, float** %8, align 8
  call void @pix24toXYZ(i32 %22, float* %23)
  %24 = load float*, float** %8, align 8
  %25 = getelementptr inbounds float, float* %24, i64 3
  store float* %25, float** %8, align 8
  %26 = load i32*, i32** %7, align 8
  %27 = getelementptr inbounds i32, i32* %26, i32 1
  store i32* %27, i32** %7, align 8
  br label %15

; <label>:28:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv24toXYZ, i64 0, i64 1)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv24toXYZ, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Luv24toLuv48(%struct.logLuvState*, i8*, i32) #0 {
  %4 = alloca %struct.logLuvState*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  store %struct.logLuvState* %0, %struct.logLuvState** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %11 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %12 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %11, i32 0, i32 2
  %13 = load i8**, i8*** %12, align 8
  %14 = bitcast i8** %13 to i32*
  store i32* %14, i32** %7, align 8
  %15 = load i8*, i8** %5, align 8
  %16 = bitcast i8* %15 to i16*
  store i16* %16, i16** %8, align 8
  br label %17

; <label>:17:                                     ; preds = %37, %3
  %18 = load i32, i32* %6, align 4
  %19 = add nsw i32 %18, -1
  store i32 %19, i32* %6, align 4
  %20 = icmp sgt i32 %18, 0
  br i1 %20, label %21, label %51

; <label>:21:                                     ; preds = %17
  %22 = load i32*, i32** %7, align 8
  %23 = load i32, i32* %22, align 4
  %24 = lshr i32 %23, 12
  %25 = and i32 %24, 4093
  %26 = add i32 %25, 13314
  %27 = trunc i32 %26 to i16
  %28 = load i16*, i16** %8, align 8
  %29 = getelementptr inbounds i16, i16* %28, i32 1
  store i16* %29, i16** %8, align 8
  store i16 %27, i16* %28, align 2
  %30 = load i32*, i32** %7, align 8
  %31 = load i32, i32* %30, align 4
  %32 = and i32 %31, 16383
  %33 = call i32 @uv_decode(double* %9, double* %10, i32 %32)
  %34 = icmp slt i32 %33, 0
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Luv24toLuv48, i64 0, i64 1)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Luv24toLuv48, i64 0, i64 1)
  store double 0x3FCAF286BD156C1A, double* %9, align 8
  store double 0x3FDE50D794B8199E, double* %10, align 8
  br label %37

; <label>:37:                                     ; preds = %35, %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Luv24toLuv48, i64 0, i64 0)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Luv24toLuv48, i64 0, i64 0)
  %39 = load double, double* %9, align 8
  %40 = fmul double %39, 3.276800e+04
  %41 = fptosi double %40 to i16
  %42 = load i16*, i16** %8, align 8
  %43 = getelementptr inbounds i16, i16* %42, i32 1
  store i16* %43, i16** %8, align 8
  store i16 %41, i16* %42, align 2
  %44 = load double, double* %10, align 8
  %45 = fmul double %44, 3.276800e+04
  %46 = fptosi double %45 to i16
  %47 = load i16*, i16** %8, align 8
  %48 = getelementptr inbounds i16, i16* %47, i32 1
  store i16* %48, i16** %8, align 8
  store i16 %46, i16* %47, align 2
  %49 = load i32*, i32** %7, align 8
  %50 = getelementptr inbounds i32, i32* %49, i32 1
  store i32* %50, i32** %7, align 8
  br label %17

; <label>:51:                                     ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Luv24toLuv48, i64 0, i64 2)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Luv24toLuv48, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Luv24toRGB(%struct.logLuvState*, i8*, i32) #0 {
  %4 = alloca %struct.logLuvState*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca [3 x float], align 4
  store %struct.logLuvState* %0, %struct.logLuvState** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %10 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %11 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %10, i32 0, i32 2
  %12 = load i8**, i8*** %11, align 8
  %13 = bitcast i8** %12 to i32*
  store i32* %13, i32** %7, align 8
  %14 = load i8*, i8** %5, align 8
  store i8* %14, i8** %8, align 8
  br label %15

; <label>:15:                                     ; preds = %19, %3
  %16 = load i32, i32* %6, align 4
  %17 = add nsw i32 %16, -1
  store i32 %17, i32* %6, align 4
  %18 = icmp sgt i32 %16, 0
  br i1 %18, label %19, label %29

; <label>:19:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv24toRGB, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv24toRGB, i64 0, i64 0)
  %21 = load i32*, i32** %7, align 8
  %22 = getelementptr inbounds i32, i32* %21, i32 1
  store i32* %22, i32** %7, align 8
  %23 = load i32, i32* %21, align 4
  %24 = getelementptr inbounds [3 x float], [3 x float]* %9, i32 0, i32 0
  call void @pix24toXYZ(i32 %23, float* %24)
  %25 = getelementptr inbounds [3 x float], [3 x float]* %9, i32 0, i32 0
  %26 = load i8*, i8** %8, align 8
  call void @XYZtoRGB24(float* %25, i8* %26)
  %27 = load i8*, i8** %8, align 8
  %28 = getelementptr inbounds i8, i8* %27, i64 3
  store i8* %28, i8** %8, align 8
  br label %15

; <label>:29:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv24toRGB, i64 0, i64 1)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv24toRGB, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvDecode32(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca %struct.logLuvState*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  %15 = alloca i32*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %19 = load i16, i16* %9, align 2
  %20 = zext i16 %19 to i32
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %23

; <label>:22:                                     ; preds = %4
  br label %26

; <label>:23:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 10)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 10)
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 269, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvDecode32, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %26

; <label>:26:                                     ; preds = %25, %22
  %27 = load %struct.tiff*, %struct.tiff** %6, align 8
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %27, i32 0, i32 37
  %29 = load i8*, i8** %28, align 8
  %30 = bitcast i8* %29 to %struct.logLuvState*
  store %struct.logLuvState* %30, %struct.logLuvState** %10, align 8
  %31 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %32 = icmp ne %struct.logLuvState* %31, null
  br i1 %32, label %33, label %34

; <label>:33:                                     ; preds = %26
  br label %37

; <label>:34:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 11)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 11)
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 271, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvDecode32, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %37

; <label>:37:                                     ; preds = %36, %33
  %38 = load i32, i32* %8, align 4
  %39 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %40 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %39, i32 0, i32 1
  %41 = load i32, i32* %40, align 4
  %42 = sdiv i32 %38, %41
  store i32 %42, i32* %13, align 4
  %43 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %44 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %43, i32 0, i32 0
  %45 = load i32, i32* %44, align 8
  %46 = icmp eq i32 %45, 2
  br i1 %46, label %47, label %51

; <label>:47:                                     ; preds = %37
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 7)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 7)
  %49 = load i8*, i8** %7, align 8
  %50 = bitcast i8* %49 to i32*
  store i32* %50, i32** %15, align 8
  br label %68

; <label>:51:                                     ; preds = %37
  %52 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %53 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %52, i32 0, i32 3
  %54 = load i16, i16* %53, align 8
  %55 = sext i16 %54 to i32
  %56 = load i32, i32* %13, align 4
  %57 = icmp sge i32 %55, %56
  br i1 %57, label %58, label %59

; <label>:58:                                     ; preds = %51
  br label %62

; <label>:59:                                     ; preds = %51
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 12)
  %60 = add i64 %pgocount4, 1
  store i64 %60, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 12)
  call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 278, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvDecode32, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %62

; <label>:62:                                     ; preds = %61, %58
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 8)
  %63 = add i64 %pgocount5, 1
  store i64 %63, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 8)
  %64 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %65 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %64, i32 0, i32 2
  %66 = load i8**, i8*** %65, align 8
  %67 = bitcast i8** %66 to i32*
  store i32* %67, i32** %15, align 8
  br label %68

; <label>:68:                                     ; preds = %62, %47
  %69 = load i32*, i32** %15, align 8
  %70 = bitcast i32* %69 to i8*
  %71 = load i32, i32* %13, align 4
  %72 = sext i32 %71 to i64
  %73 = mul i64 %72, 4
  %74 = trunc i64 %73 to i32
  call void @_TIFFmemset(i8* %70, i32 0, i32 %74)
  %75 = load %struct.tiff*, %struct.tiff** %6, align 8
  %76 = getelementptr inbounds %struct.tiff, %struct.tiff* %75, i32 0, i32 42
  %77 = load i8*, i8** %76, align 8
  store i8* %77, i8** %14, align 8
  %78 = load %struct.tiff*, %struct.tiff** %6, align 8
  %79 = getelementptr inbounds %struct.tiff, %struct.tiff* %78, i32 0, i32 43
  %80 = load i32, i32* %79, align 8
  store i32 %80, i32* %17, align 4
  store i32 32, i32* %11, align 4
  br label %81

; <label>:81:                                     ; preds = %186, %68
  %82 = load i32, i32* %11, align 4
  %83 = sub nsw i32 %82, 8
  store i32 %83, i32* %11, align 4
  %84 = icmp sge i32 %83, 0
  br i1 %84, label %85, label %188

; <label>:85:                                     ; preds = %81
  store i32 0, i32* %12, align 4
  br label %86

; <label>:86:                                     ; preds = %164, %85
  %87 = load i32, i32* %12, align 4
  %88 = load i32, i32* %13, align 4
  %89 = icmp slt i32 %87, %88
  br i1 %89, label %91, label %._crit_edge1

._crit_edge1:                                     ; preds = %86
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 4)
  %90 = add i64 %pgocount6, 1
  store i64 %90, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 4)
  br label %94

; <label>:91:                                     ; preds = %86
  %92 = load i32, i32* %17, align 4
  %93 = icmp sgt i32 %92, 0
  br label %94

; <label>:94:                                     ; preds = %._crit_edge1, %91
  %95 = phi i1 [ false, %._crit_edge1 ], [ %93, %91 ]
  br i1 %95, label %96, label %165

; <label>:96:                                     ; preds = %94
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 0)
  %97 = add i64 %pgocount7, 1
  store i64 %97, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 0)
  %98 = load i8*, i8** %14, align 8
  %99 = load i8, i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = icmp sge i32 %100, 128
  br i1 %101, label %102, label %131

; <label>:102:                                    ; preds = %96
  %103 = load i8*, i8** %14, align 8
  %104 = getelementptr inbounds i8, i8* %103, i32 1
  store i8* %104, i8** %14, align 8
  %105 = load i8, i8* %103, align 1
  %106 = zext i8 %105 to i32
  %107 = add nsw i32 %106, -126
  store i32 %107, i32* %18, align 4
  %108 = load i8*, i8** %14, align 8
  %109 = getelementptr inbounds i8, i8* %108, i32 1
  store i8* %109, i8** %14, align 8
  %110 = load i8, i8* %108, align 1
  %111 = zext i8 %110 to i32
  %112 = load i32, i32* %11, align 4
  %113 = shl i32 %111, %112
  store i32 %113, i32* %16, align 4
  %114 = load i32, i32* %17, align 4
  %115 = sub nsw i32 %114, 2
  store i32 %115, i32* %17, align 4
  br label %116

; <label>:116:                                    ; preds = %120, %102
  %117 = load i32, i32* %18, align 4
  %118 = add nsw i32 %117, -1
  store i32 %118, i32* %18, align 4
  %119 = icmp ne i32 %117, 0
  br i1 %119, label %120, label %130

; <label>:120:                                    ; preds = %116
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 1)
  %121 = add i64 %pgocount8, 1
  store i64 %121, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 1)
  %122 = load i32, i32* %16, align 4
  %123 = load i32*, i32** %15, align 8
  %124 = load i32, i32* %12, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* %12, align 4
  %126 = sext i32 %124 to i64
  %127 = getelementptr inbounds i32, i32* %123, i64 %126
  %128 = load i32, i32* %127, align 4
  %129 = or i32 %128, %122
  store i32 %129, i32* %127, align 4
  br label %116

; <label>:130:                                    ; preds = %116
  br label %164

; <label>:131:                                    ; preds = %96
  %132 = load i8*, i8** %14, align 8
  %133 = getelementptr inbounds i8, i8* %132, i32 1
  store i8* %133, i8** %14, align 8
  %134 = load i8, i8* %132, align 1
  %135 = zext i8 %134 to i32
  store i32 %135, i32* %18, align 4
  br label %136

; <label>:136:                                    ; preds = %148, %131
  %137 = load i32, i32* %17, align 4
  %138 = add nsw i32 %137, -1
  store i32 %138, i32* %17, align 4
  %139 = icmp ne i32 %138, 0
  br i1 %139, label %141, label %._crit_edge

._crit_edge:                                      ; preds = %136
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 3)
  %140 = add i64 %pgocount9, 1
  store i64 %140, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 3)
  br label %146

; <label>:141:                                    ; preds = %136
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 5)
  %142 = add i64 %pgocount10, 1
  store i64 %142, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 5)
  %143 = load i32, i32* %18, align 4
  %144 = add nsw i32 %143, -1
  store i32 %144, i32* %18, align 4
  %145 = icmp ne i32 %143, 0
  br label %146

; <label>:146:                                    ; preds = %._crit_edge, %141
  %147 = phi i1 [ false, %._crit_edge ], [ %145, %141 ]
  br i1 %147, label %148, label %163

; <label>:148:                                    ; preds = %146
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 2)
  %149 = add i64 %pgocount11, 1
  store i64 %149, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 2)
  %150 = load i8*, i8** %14, align 8
  %151 = getelementptr inbounds i8, i8* %150, i32 1
  store i8* %151, i8** %14, align 8
  %152 = load i8, i8* %150, align 1
  %153 = zext i8 %152 to i32
  %154 = load i32, i32* %11, align 4
  %155 = shl i32 %153, %154
  %156 = load i32*, i32** %15, align 8
  %157 = load i32, i32* %12, align 4
  %158 = add nsw i32 %157, 1
  store i32 %158, i32* %12, align 4
  %159 = sext i32 %157 to i64
  %160 = getelementptr inbounds i32, i32* %156, i64 %159
  %161 = load i32, i32* %160, align 4
  %162 = or i32 %161, %155
  store i32 %162, i32* %160, align 4
  br label %136

; <label>:163:                                    ; preds = %146
  br label %164

; <label>:164:                                    ; preds = %163, %130
  br label %86

; <label>:165:                                    ; preds = %94
  %166 = load i32, i32* %12, align 4
  %167 = load i32, i32* %13, align 4
  %168 = icmp ne i32 %166, %167
  br i1 %168, label %169, label %186

; <label>:169:                                    ; preds = %165
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 9)
  %170 = add i64 %pgocount12, 1
  store i64 %170, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 9)
  %171 = load %struct.tiff*, %struct.tiff** %6, align 8
  %172 = getelementptr inbounds %struct.tiff, %struct.tiff* %171, i32 0, i32 0
  %173 = load i8*, i8** %172, align 8
  %174 = load %struct.tiff*, %struct.tiff** %6, align 8
  %175 = getelementptr inbounds %struct.tiff, %struct.tiff* %174, i32 0, i32 11
  %176 = load i32, i32* %175, align 8
  %177 = load i32, i32* %13, align 4
  %178 = load i32, i32* %12, align 4
  %179 = sub nsw i32 %177, %178
  call void (i8*, i8*, ...) @TIFFError(i8* %173, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.13, i32 0, i32 0), i32 %176, i32 %179)
  %180 = load i8*, i8** %14, align 8
  %181 = load %struct.tiff*, %struct.tiff** %6, align 8
  %182 = getelementptr inbounds %struct.tiff, %struct.tiff* %181, i32 0, i32 42
  store i8* %180, i8** %182, align 8
  %183 = load i32, i32* %17, align 4
  %184 = load %struct.tiff*, %struct.tiff** %6, align 8
  %185 = getelementptr inbounds %struct.tiff, %struct.tiff* %184, i32 0, i32 43
  store i32 %183, i32* %185, align 8
  store i32 0, i32* %5, align 4
  br label %202

; <label>:186:                                    ; preds = %165
  %pgocount13 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 6)
  %187 = add i64 %pgocount13, 1
  store i64 %187, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogLuvDecode32, i64 0, i64 6)
  br label %81

; <label>:188:                                    ; preds = %81
  %189 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %190 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %189, i32 0, i32 4
  %191 = load void (%struct.logLuvState*, i8*, i32)*, void (%struct.logLuvState*, i8*, i32)** %190, align 8
  %192 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %193 = load i8*, i8** %7, align 8
  %194 = load i32, i32* %13, align 4
  %195 = ptrtoint void (%struct.logLuvState*, i8*, i32)* %191 to i64
  call void @__llvm_profile_instrument_target(i64 %195, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvDecode32 to i8*), i32 0)
  call void %191(%struct.logLuvState* %192, i8* %193, i32 %194)
  %196 = load i8*, i8** %14, align 8
  %197 = load %struct.tiff*, %struct.tiff** %6, align 8
  %198 = getelementptr inbounds %struct.tiff, %struct.tiff* %197, i32 0, i32 42
  store i8* %196, i8** %198, align 8
  %199 = load i32, i32* %17, align 4
  %200 = load %struct.tiff*, %struct.tiff** %6, align 8
  %201 = getelementptr inbounds %struct.tiff, %struct.tiff* %200, i32 0, i32 43
  store i32 %199, i32* %201, align 8
  store i32 1, i32* %5, align 4
  br label %202

; <label>:202:                                    ; preds = %188, %169
  %203 = load i32, i32* %5, align 4
  ret i32 %203
}

; Function Attrs: noinline nounwind uwtable
define internal void @Luv32toXYZ(%struct.logLuvState*, i8*, i32) #0 {
  %4 = alloca %struct.logLuvState*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %8 = alloca float*, align 8
  store %struct.logLuvState* %0, %struct.logLuvState** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %9 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %10 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %9, i32 0, i32 2
  %11 = load i8**, i8*** %10, align 8
  %12 = bitcast i8** %11 to i32*
  store i32* %12, i32** %7, align 8
  %13 = load i8*, i8** %5, align 8
  %14 = bitcast i8* %13 to float*
  store float* %14, float** %8, align 8
  br label %15

; <label>:15:                                     ; preds = %19, %3
  %16 = load i32, i32* %6, align 4
  %17 = add nsw i32 %16, -1
  store i32 %17, i32* %6, align 4
  %18 = icmp sgt i32 %16, 0
  br i1 %18, label %19, label %27

; <label>:19:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32toXYZ, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32toXYZ, i64 0, i64 0)
  %21 = load i32*, i32** %7, align 8
  %22 = getelementptr inbounds i32, i32* %21, i32 1
  store i32* %22, i32** %7, align 8
  %23 = load i32, i32* %21, align 4
  %24 = load float*, float** %8, align 8
  call void @pix32toXYZ(i32 %23, float* %24)
  %25 = load float*, float** %8, align 8
  %26 = getelementptr inbounds float, float* %25, i64 3
  store float* %26, float** %8, align 8
  br label %15

; <label>:27:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32toXYZ, i64 0, i64 1)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32toXYZ, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Luv32toLuv48(%struct.logLuvState*, i8*, i32) #0 {
  %4 = alloca %struct.logLuvState*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  store %struct.logLuvState* %0, %struct.logLuvState** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %11 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %12 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %11, i32 0, i32 2
  %13 = load i8**, i8*** %12, align 8
  %14 = bitcast i8** %13 to i32*
  store i32* %14, i32** %7, align 8
  %15 = load i8*, i8** %5, align 8
  %16 = bitcast i8* %15 to i16*
  store i16* %16, i16** %8, align 8
  br label %17

; <label>:17:                                     ; preds = %21, %3
  %18 = load i32, i32* %6, align 4
  %19 = add nsw i32 %18, -1
  store i32 %19, i32* %6, align 4
  %20 = icmp sgt i32 %18, 0
  br i1 %20, label %21, label %54

; <label>:21:                                     ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32toLuv48, i64 0, i64 0)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32toLuv48, i64 0, i64 0)
  %23 = load i32*, i32** %7, align 8
  %24 = load i32, i32* %23, align 4
  %25 = lshr i32 %24, 16
  %26 = trunc i32 %25 to i16
  %27 = load i16*, i16** %8, align 8
  %28 = getelementptr inbounds i16, i16* %27, i32 1
  store i16* %28, i16** %8, align 8
  store i16 %26, i16* %27, align 2
  %29 = load i32*, i32** %7, align 8
  %30 = load i32, i32* %29, align 4
  %31 = lshr i32 %30, 8
  %32 = and i32 %31, 255
  %33 = uitofp i32 %32 to double
  %34 = fadd double %33, 5.000000e-01
  %35 = fmul double 0x3F63FB013FB013FB, %34
  store double %35, double* %9, align 8
  %36 = load i32*, i32** %7, align 8
  %37 = load i32, i32* %36, align 4
  %38 = and i32 %37, 255
  %39 = uitofp i32 %38 to double
  %40 = fadd double %39, 5.000000e-01
  %41 = fmul double 0x3F63FB013FB013FB, %40
  store double %41, double* %10, align 8
  %42 = load double, double* %9, align 8
  %43 = fmul double %42, 3.276800e+04
  %44 = fptosi double %43 to i16
  %45 = load i16*, i16** %8, align 8
  %46 = getelementptr inbounds i16, i16* %45, i32 1
  store i16* %46, i16** %8, align 8
  store i16 %44, i16* %45, align 2
  %47 = load double, double* %10, align 8
  %48 = fmul double %47, 3.276800e+04
  %49 = fptosi double %48 to i16
  %50 = load i16*, i16** %8, align 8
  %51 = getelementptr inbounds i16, i16* %50, i32 1
  store i16* %51, i16** %8, align 8
  store i16 %49, i16* %50, align 2
  %52 = load i32*, i32** %7, align 8
  %53 = getelementptr inbounds i32, i32* %52, i32 1
  store i32* %53, i32** %7, align 8
  br label %17

; <label>:54:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32toLuv48, i64 0, i64 1)
  %55 = add i64 %pgocount1, 1
  store i64 %55, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32toLuv48, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Luv32toRGB(%struct.logLuvState*, i8*, i32) #0 {
  %4 = alloca %struct.logLuvState*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca [3 x float], align 4
  store %struct.logLuvState* %0, %struct.logLuvState** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %10 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %11 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %10, i32 0, i32 2
  %12 = load i8**, i8*** %11, align 8
  %13 = bitcast i8** %12 to i32*
  store i32* %13, i32** %7, align 8
  %14 = load i8*, i8** %5, align 8
  store i8* %14, i8** %8, align 8
  br label %15

; <label>:15:                                     ; preds = %19, %3
  %16 = load i32, i32* %6, align 4
  %17 = add nsw i32 %16, -1
  store i32 %17, i32* %6, align 4
  %18 = icmp sgt i32 %16, 0
  br i1 %18, label %19, label %29

; <label>:19:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32toRGB, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32toRGB, i64 0, i64 0)
  %21 = load i32*, i32** %7, align 8
  %22 = getelementptr inbounds i32, i32* %21, i32 1
  store i32* %22, i32** %7, align 8
  %23 = load i32, i32* %21, align 4
  %24 = getelementptr inbounds [3 x float], [3 x float]* %9, i32 0, i32 0
  call void @pix32toXYZ(i32 %23, float* %24)
  %25 = getelementptr inbounds [3 x float], [3 x float]* %9, i32 0, i32 0
  %26 = load i8*, i8** %8, align 8
  call void @XYZtoRGB24(float* %25, i8* %26)
  %27 = load i8*, i8** %8, align 8
  %28 = getelementptr inbounds i8, i8* %27, i64 3
  store i8* %28, i8** %8, align 8
  br label %15

; <label>:29:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32toRGB, i64 0, i64 1)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32toRGB, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogL16InitState(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.TIFFDirectory*, align 8
  %5 = alloca %struct.logLuvState*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 6
  store %struct.TIFFDirectory* %7, %struct.TIFFDirectory** %4, align 8
  %8 = load %struct.tiff*, %struct.tiff** %3, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %8, i32 0, i32 37
  %10 = load i8*, i8** %9, align 8
  %11 = bitcast i8* %10 to %struct.logLuvState*
  store %struct.logLuvState* %11, %struct.logLuvState** %5, align 8
  %12 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %13 = icmp ne %struct.logLuvState* %12, null
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %1
  br label %18

; <label>:15:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogL16InitState, i64 0, i64 6)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogL16InitState, i64 0, i64 6)
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 1025, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__PRETTY_FUNCTION__.LogL16InitState, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %18

; <label>:18:                                     ; preds = %17, %14
  %19 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %20 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %19, i32 0, i32 11
  %21 = load i16, i16* %20, align 2
  %22 = zext i16 %21 to i32
  %23 = icmp eq i32 %22, 32844
  br i1 %23, label %24, label %25

; <label>:24:                                     ; preds = %18
  br label %28

; <label>:25:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogL16InitState, i64 0, i64 7)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogL16InitState, i64 0, i64 7)
  call void @__assert_fail(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 1026, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__PRETTY_FUNCTION__.LogL16InitState, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %28

; <label>:28:                                     ; preds = %27, %24
  %29 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %30 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %29, i32 0, i32 0
  %31 = load i32, i32* %30, align 8
  %32 = icmp eq i32 %31, -1
  br i1 %32, label %33, label %39

; <label>:33:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogL16InitState, i64 0, i64 0)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogL16InitState, i64 0, i64 0)
  %35 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %36 = call i32 @LogL16GuessDataFmt(%struct.TIFFDirectory* %35)
  %37 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %38 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %37, i32 0, i32 0
  store i32 %36, i32* %38, align 8
  br label %39

; <label>:39:                                     ; preds = %33, %28
  %40 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %41 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %40, i32 0, i32 0
  %42 = load i32, i32* %41, align 8
  switch i32 %42, label %55 [
    i32 0, label %43
    i32 1, label %47
    i32 3, label %51
  ]

; <label>:43:                                     ; preds = %39
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogL16InitState, i64 0, i64 3)
  %44 = add i64 %pgocount3, 1
  store i64 %44, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogL16InitState, i64 0, i64 3)
  %45 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %46 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %45, i32 0, i32 1
  store i32 4, i32* %46, align 4
  br label %60

; <label>:47:                                     ; preds = %39
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogL16InitState, i64 0, i64 2)
  %48 = add i64 %pgocount4, 1
  store i64 %48, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogL16InitState, i64 0, i64 2)
  %49 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %50 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %49, i32 0, i32 1
  store i32 2, i32* %50, align 4
  br label %60

; <label>:51:                                     ; preds = %39
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogL16InitState, i64 0, i64 4)
  %52 = add i64 %pgocount5, 1
  store i64 %52, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogL16InitState, i64 0, i64 4)
  %53 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %54 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %53, i32 0, i32 1
  store i32 1, i32* %54, align 4
  br label %60

; <label>:55:                                     ; preds = %39
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogL16InitState, i64 0, i64 5)
  %56 = add i64 %pgocount6, 1
  store i64 %56, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogL16InitState, i64 0, i64 5)
  %57 = load %struct.tiff*, %struct.tiff** %3, align 8
  %58 = getelementptr inbounds %struct.tiff, %struct.tiff* %57, i32 0, i32 0
  %59 = load i8*, i8** %58, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %59, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.15, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %91

; <label>:60:                                     ; preds = %51, %47, %43
  %61 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %62 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %61, i32 0, i32 1
  %63 = load i32, i32* %62, align 8
  %64 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %65 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %64, i32 0, i32 16
  %66 = load i32, i32* %65, align 4
  %67 = mul i32 %63, %66
  %68 = trunc i32 %67 to i16
  %69 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %70 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %69, i32 0, i32 3
  store i16 %68, i16* %70, align 8
  %71 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %72 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %71, i32 0, i32 3
  %73 = load i16, i16* %72, align 8
  %74 = sext i16 %73 to i64
  %75 = mul i64 %74, 2
  %76 = trunc i64 %75 to i32
  %77 = call i8* @_TIFFmalloc(i32 %76)
  %78 = bitcast i8* %77 to i8**
  %79 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %80 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %79, i32 0, i32 2
  store i8** %78, i8*** %80, align 8
  %81 = load %struct.logLuvState*, %struct.logLuvState** %5, align 8
  %82 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %81, i32 0, i32 2
  %83 = load i8**, i8*** %82, align 8
  %84 = icmp eq i8** %83, null
  br i1 %84, label %85, label %90

; <label>:85:                                     ; preds = %60
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogL16InitState, i64 0, i64 1)
  %86 = add i64 %pgocount7, 1
  store i64 %86, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogL16InitState, i64 0, i64 1)
  %87 = load %struct.tiff*, %struct.tiff** %3, align 8
  %88 = getelementptr inbounds %struct.tiff, %struct.tiff* %87, i32 0, i32 0
  %89 = load i8*, i8** %88, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @LogL16InitState.module, i32 0, i32 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.9, i32 0, i32 0), i8* %89)
  store i32 0, i32* %2, align 4
  br label %91

; <label>:90:                                     ; preds = %60
  store i32 1, i32* %2, align 4
  br label %91

; <label>:91:                                     ; preds = %90, %85, %55
  %92 = load i32, i32* %2, align 4
  ret i32 %92
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogL16Decode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca %struct.logLuvState*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  %15 = alloca i16*, align 8
  %16 = alloca i16, align 2
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %19 = load %struct.tiff*, %struct.tiff** %6, align 8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %19, i32 0, i32 37
  %21 = load i8*, i8** %20, align 8
  %22 = bitcast i8* %21 to %struct.logLuvState*
  store %struct.logLuvState* %22, %struct.logLuvState** %10, align 8
  %23 = load i16, i16* %9, align 2
  %24 = zext i16 %23 to i32
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %27

; <label>:26:                                     ; preds = %4
  br label %30

; <label>:27:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 10)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 10)
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 169, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__PRETTY_FUNCTION__.LogL16Decode, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %30

; <label>:30:                                     ; preds = %29, %26
  %31 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %32 = icmp ne %struct.logLuvState* %31, null
  br i1 %32, label %33, label %34

; <label>:33:                                     ; preds = %30
  br label %37

; <label>:34:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 11)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 11)
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 170, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__PRETTY_FUNCTION__.LogL16Decode, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %37

; <label>:37:                                     ; preds = %36, %33
  %38 = load i32, i32* %8, align 4
  %39 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %40 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %39, i32 0, i32 1
  %41 = load i32, i32* %40, align 4
  %42 = sdiv i32 %38, %41
  store i32 %42, i32* %13, align 4
  %43 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %44 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %43, i32 0, i32 0
  %45 = load i32, i32* %44, align 8
  %46 = icmp eq i32 %45, 1
  br i1 %46, label %47, label %51

; <label>:47:                                     ; preds = %37
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 7)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 7)
  %49 = load i8*, i8** %7, align 8
  %50 = bitcast i8* %49 to i16*
  store i16* %50, i16** %15, align 8
  br label %68

; <label>:51:                                     ; preds = %37
  %52 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %53 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %52, i32 0, i32 3
  %54 = load i16, i16* %53, align 8
  %55 = sext i16 %54 to i32
  %56 = load i32, i32* %13, align 4
  %57 = icmp sge i32 %55, %56
  br i1 %57, label %58, label %59

; <label>:58:                                     ; preds = %51
  br label %62

; <label>:59:                                     ; preds = %51
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 12)
  %60 = add i64 %pgocount4, 1
  store i64 %60, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 12)
  call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 177, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__PRETTY_FUNCTION__.LogL16Decode, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %62

; <label>:62:                                     ; preds = %61, %58
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 8)
  %63 = add i64 %pgocount5, 1
  store i64 %63, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 8)
  %64 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %65 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %64, i32 0, i32 2
  %66 = load i8**, i8*** %65, align 8
  %67 = bitcast i8** %66 to i16*
  store i16* %67, i16** %15, align 8
  br label %68

; <label>:68:                                     ; preds = %62, %47
  %69 = load i16*, i16** %15, align 8
  %70 = bitcast i16* %69 to i8*
  %71 = load i32, i32* %13, align 4
  %72 = sext i32 %71 to i64
  %73 = mul i64 %72, 2
  %74 = trunc i64 %73 to i32
  call void @_TIFFmemset(i8* %70, i32 0, i32 %74)
  %75 = load %struct.tiff*, %struct.tiff** %6, align 8
  %76 = getelementptr inbounds %struct.tiff, %struct.tiff* %75, i32 0, i32 42
  %77 = load i8*, i8** %76, align 8
  store i8* %77, i8** %14, align 8
  %78 = load %struct.tiff*, %struct.tiff** %6, align 8
  %79 = getelementptr inbounds %struct.tiff, %struct.tiff* %78, i32 0, i32 43
  %80 = load i32, i32* %79, align 8
  store i32 %80, i32* %17, align 4
  store i32 16, i32* %11, align 4
  br label %81

; <label>:81:                                     ; preds = %194, %68
  %82 = load i32, i32* %11, align 4
  %83 = sub nsw i32 %82, 8
  store i32 %83, i32* %11, align 4
  %84 = icmp sge i32 %83, 0
  br i1 %84, label %85, label %196

; <label>:85:                                     ; preds = %81
  store i32 0, i32* %12, align 4
  br label %86

; <label>:86:                                     ; preds = %172, %85
  %87 = load i32, i32* %12, align 4
  %88 = load i32, i32* %13, align 4
  %89 = icmp slt i32 %87, %88
  br i1 %89, label %91, label %._crit_edge1

._crit_edge1:                                     ; preds = %86
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 4)
  %90 = add i64 %pgocount6, 1
  store i64 %90, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 4)
  br label %94

; <label>:91:                                     ; preds = %86
  %92 = load i32, i32* %17, align 4
  %93 = icmp sgt i32 %92, 0
  br label %94

; <label>:94:                                     ; preds = %._crit_edge1, %91
  %95 = phi i1 [ false, %._crit_edge1 ], [ %93, %91 ]
  br i1 %95, label %96, label %173

; <label>:96:                                     ; preds = %94
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 0)
  %97 = add i64 %pgocount7, 1
  store i64 %97, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 0)
  %98 = load i8*, i8** %14, align 8
  %99 = load i8, i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = icmp sge i32 %100, 128
  br i1 %101, label %102, label %136

; <label>:102:                                    ; preds = %96
  %103 = load i8*, i8** %14, align 8
  %104 = getelementptr inbounds i8, i8* %103, i32 1
  store i8* %104, i8** %14, align 8
  %105 = load i8, i8* %103, align 1
  %106 = zext i8 %105 to i32
  %107 = add nsw i32 %106, -126
  store i32 %107, i32* %18, align 4
  %108 = load i8*, i8** %14, align 8
  %109 = getelementptr inbounds i8, i8* %108, i32 1
  store i8* %109, i8** %14, align 8
  %110 = load i8, i8* %108, align 1
  %111 = zext i8 %110 to i16
  %112 = sext i16 %111 to i32
  %113 = load i32, i32* %11, align 4
  %114 = shl i32 %112, %113
  %115 = trunc i32 %114 to i16
  store i16 %115, i16* %16, align 2
  %116 = load i32, i32* %17, align 4
  %117 = sub nsw i32 %116, 2
  store i32 %117, i32* %17, align 4
  br label %118

; <label>:118:                                    ; preds = %122, %102
  %119 = load i32, i32* %18, align 4
  %120 = add nsw i32 %119, -1
  store i32 %120, i32* %18, align 4
  %121 = icmp ne i32 %119, 0
  br i1 %121, label %122, label %135

; <label>:122:                                    ; preds = %118
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 1)
  %123 = add i64 %pgocount8, 1
  store i64 %123, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 1)
  %124 = load i16, i16* %16, align 2
  %125 = sext i16 %124 to i32
  %126 = load i16*, i16** %15, align 8
  %127 = load i32, i32* %12, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, i32* %12, align 4
  %129 = sext i32 %127 to i64
  %130 = getelementptr inbounds i16, i16* %126, i64 %129
  %131 = load i16, i16* %130, align 2
  %132 = sext i16 %131 to i32
  %133 = or i32 %132, %125
  %134 = trunc i32 %133 to i16
  store i16 %134, i16* %130, align 2
  br label %118

; <label>:135:                                    ; preds = %118
  br label %172

; <label>:136:                                    ; preds = %96
  %137 = load i8*, i8** %14, align 8
  %138 = getelementptr inbounds i8, i8* %137, i32 1
  store i8* %138, i8** %14, align 8
  %139 = load i8, i8* %137, align 1
  %140 = zext i8 %139 to i32
  store i32 %140, i32* %18, align 4
  br label %141

; <label>:141:                                    ; preds = %153, %136
  %142 = load i32, i32* %17, align 4
  %143 = add nsw i32 %142, -1
  store i32 %143, i32* %17, align 4
  %144 = icmp ne i32 %143, 0
  br i1 %144, label %146, label %._crit_edge

._crit_edge:                                      ; preds = %141
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 3)
  %145 = add i64 %pgocount9, 1
  store i64 %145, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 3)
  br label %151

; <label>:146:                                    ; preds = %141
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 5)
  %147 = add i64 %pgocount10, 1
  store i64 %147, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 5)
  %148 = load i32, i32* %18, align 4
  %149 = add nsw i32 %148, -1
  store i32 %149, i32* %18, align 4
  %150 = icmp ne i32 %148, 0
  br label %151

; <label>:151:                                    ; preds = %._crit_edge, %146
  %152 = phi i1 [ false, %._crit_edge ], [ %150, %146 ]
  br i1 %152, label %153, label %171

; <label>:153:                                    ; preds = %151
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 2)
  %154 = add i64 %pgocount11, 1
  store i64 %154, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 2)
  %155 = load i8*, i8** %14, align 8
  %156 = getelementptr inbounds i8, i8* %155, i32 1
  store i8* %156, i8** %14, align 8
  %157 = load i8, i8* %155, align 1
  %158 = zext i8 %157 to i16
  %159 = sext i16 %158 to i32
  %160 = load i32, i32* %11, align 4
  %161 = shl i32 %159, %160
  %162 = load i16*, i16** %15, align 8
  %163 = load i32, i32* %12, align 4
  %164 = add nsw i32 %163, 1
  store i32 %164, i32* %12, align 4
  %165 = sext i32 %163 to i64
  %166 = getelementptr inbounds i16, i16* %162, i64 %165
  %167 = load i16, i16* %166, align 2
  %168 = sext i16 %167 to i32
  %169 = or i32 %168, %161
  %170 = trunc i32 %169 to i16
  store i16 %170, i16* %166, align 2
  br label %141

; <label>:171:                                    ; preds = %151
  br label %172

; <label>:172:                                    ; preds = %171, %135
  br label %86

; <label>:173:                                    ; preds = %94
  %174 = load i32, i32* %12, align 4
  %175 = load i32, i32* %13, align 4
  %176 = icmp ne i32 %174, %175
  br i1 %176, label %177, label %194

; <label>:177:                                    ; preds = %173
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 9)
  %178 = add i64 %pgocount12, 1
  store i64 %178, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 9)
  %179 = load %struct.tiff*, %struct.tiff** %6, align 8
  %180 = getelementptr inbounds %struct.tiff, %struct.tiff* %179, i32 0, i32 0
  %181 = load i8*, i8** %180, align 8
  %182 = load %struct.tiff*, %struct.tiff** %6, align 8
  %183 = getelementptr inbounds %struct.tiff, %struct.tiff* %182, i32 0, i32 11
  %184 = load i32, i32* %183, align 8
  %185 = load i32, i32* %13, align 4
  %186 = load i32, i32* %12, align 4
  %187 = sub nsw i32 %185, %186
  call void (i8*, i8*, ...) @TIFFError(i8* %181, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.16, i32 0, i32 0), i32 %184, i32 %187)
  %188 = load i8*, i8** %14, align 8
  %189 = load %struct.tiff*, %struct.tiff** %6, align 8
  %190 = getelementptr inbounds %struct.tiff, %struct.tiff* %189, i32 0, i32 42
  store i8* %188, i8** %190, align 8
  %191 = load i32, i32* %17, align 4
  %192 = load %struct.tiff*, %struct.tiff** %6, align 8
  %193 = getelementptr inbounds %struct.tiff, %struct.tiff* %192, i32 0, i32 43
  store i32 %191, i32* %193, align 8
  store i32 0, i32* %5, align 4
  br label %210

; <label>:194:                                    ; preds = %173
  %pgocount13 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 6)
  %195 = add i64 %pgocount13, 1
  store i64 %195, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_LogL16Decode, i64 0, i64 6)
  br label %81

; <label>:196:                                    ; preds = %81
  %197 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %198 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %197, i32 0, i32 4
  %199 = load void (%struct.logLuvState*, i8*, i32)*, void (%struct.logLuvState*, i8*, i32)** %198, align 8
  %200 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %201 = load i8*, i8** %7, align 8
  %202 = load i32, i32* %13, align 4
  %203 = ptrtoint void (%struct.logLuvState*, i8*, i32)* %199 to i64
  call void @__llvm_profile_instrument_target(i64 %203, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogL16Decode to i8*), i32 0)
  call void %199(%struct.logLuvState* %200, i8* %201, i32 %202)
  %204 = load i8*, i8** %14, align 8
  %205 = load %struct.tiff*, %struct.tiff** %6, align 8
  %206 = getelementptr inbounds %struct.tiff, %struct.tiff* %205, i32 0, i32 42
  store i8* %204, i8** %206, align 8
  %207 = load i32, i32* %17, align 4
  %208 = load %struct.tiff*, %struct.tiff** %6, align 8
  %209 = getelementptr inbounds %struct.tiff, %struct.tiff* %208, i32 0, i32 43
  store i32 %207, i32* %209, align 8
  store i32 1, i32* %5, align 4
  br label %210

; <label>:210:                                    ; preds = %196, %177
  %211 = load i32, i32* %5, align 4
  ret i32 %211
}

; Function Attrs: noinline nounwind uwtable
define internal void @L16toY(%struct.logLuvState*, i8*, i32) #0 {
  %4 = alloca %struct.logLuvState*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i16*, align 8
  %8 = alloca float*, align 8
  store %struct.logLuvState* %0, %struct.logLuvState** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %9 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %10 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %9, i32 0, i32 2
  %11 = load i8**, i8*** %10, align 8
  %12 = bitcast i8** %11 to i16*
  store i16* %12, i16** %7, align 8
  %13 = load i8*, i8** %5, align 8
  %14 = bitcast i8* %13 to float*
  store float* %14, float** %8, align 8
  br label %15

; <label>:15:                                     ; preds = %19, %3
  %16 = load i32, i32* %6, align 4
  %17 = add nsw i32 %16, -1
  store i32 %17, i32* %6, align 4
  %18 = icmp sgt i32 %16, 0
  br i1 %18, label %19, label %29

; <label>:19:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_L16toY, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_L16toY, i64 0, i64 0)
  %21 = load i16*, i16** %7, align 8
  %22 = getelementptr inbounds i16, i16* %21, i32 1
  store i16* %22, i16** %7, align 8
  %23 = load i16, i16* %21, align 2
  %24 = sext i16 %23 to i32
  %25 = call double @pix16toY(i32 %24)
  %26 = fptrunc double %25 to float
  %27 = load float*, float** %8, align 8
  %28 = getelementptr inbounds float, float* %27, i32 1
  store float* %28, float** %8, align 8
  store float %26, float* %27, align 4
  br label %15

; <label>:29:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_L16toY, i64 0, i64 1)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_L16toY, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @L16toGry(%struct.logLuvState*, i8*, i32) #0 {
  %4 = alloca %struct.logLuvState*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i16*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca double, align 8
  store %struct.logLuvState* %0, %struct.logLuvState** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %10 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %11 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %10, i32 0, i32 2
  %12 = load i8**, i8*** %11, align 8
  %13 = bitcast i8** %12 to i16*
  store i16* %13, i16** %7, align 8
  %14 = load i8*, i8** %5, align 8
  store i8* %14, i8** %8, align 8
  br label %15

; <label>:15:                                     ; preds = %42, %3
  %16 = load i32, i32* %6, align 4
  %17 = add nsw i32 %16, -1
  store i32 %17, i32* %6, align 4
  %18 = icmp sgt i32 %16, 0
  br i1 %18, label %19, label %47

; <label>:19:                                     ; preds = %15
  %20 = load i16*, i16** %7, align 8
  %21 = getelementptr inbounds i16, i16* %20, i32 1
  store i16* %21, i16** %7, align 8
  %22 = load i16, i16* %20, align 2
  %23 = sext i16 %22 to i32
  %24 = call double @pix16toY(i32 %23)
  store double %24, double* %9, align 8
  %25 = load double, double* %9, align 8
  %26 = fcmp ole double %25, 0.000000e+00
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %19
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_L16toGry, i64 0, i64 0)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_L16toGry, i64 0, i64 0)
  br label %42

; <label>:29:                                     ; preds = %19
  %30 = load double, double* %9, align 8
  %31 = fcmp oge double %30, 1.000000e+00
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %29
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_L16toGry, i64 0, i64 1)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_L16toGry, i64 0, i64 1)
  br label %40

; <label>:34:                                     ; preds = %29
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_L16toGry, i64 0, i64 2)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_L16toGry, i64 0, i64 2)
  %36 = load double, double* %9, align 8
  %37 = call double @sqrt(double %36) #5
  %38 = fmul double 2.560000e+02, %37
  %39 = fptosi double %38 to i32
  br label %40

; <label>:40:                                     ; preds = %34, %32
  %41 = phi i32 [ 255, %32 ], [ %39, %34 ]
  br label %42

; <label>:42:                                     ; preds = %40, %27
  %43 = phi i32 [ 0, %27 ], [ %41, %40 ]
  %44 = trunc i32 %43 to i8
  %45 = load i8*, i8** %8, align 8
  %46 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %46, i8** %8, align 8
  store i8 %44, i8* %45, align 1
  br label %15

; <label>:47:                                     ; preds = %15
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_L16toGry, i64 0, i64 3)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_L16toGry, i64 0, i64 3)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvGuessDataFmt(%struct.TIFFDirectory*) #0 {
  %2 = alloca %struct.TIFFDirectory*, align 8
  %3 = alloca i32, align 4
  store %struct.TIFFDirectory* %0, %struct.TIFFDirectory** %2, align 8
  %4 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %2, align 8
  %5 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %4, i32 0, i32 8
  %6 = load i16, i16* %5, align 4
  %7 = zext i16 %6 to i32
  %8 = shl i32 %7, 3
  %9 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %2, align 8
  %10 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %9, i32 0, i32 9
  %11 = load i16, i16* %10, align 2
  %12 = zext i16 %11 to i32
  %13 = or i32 %8, %12
  switch i32 %13, label %27 [
    i32 259, label %19
    i32 260, label %._crit_edge
    i32 257, label %._crit_edge1
    i32 258, label %21
    i32 132, label %._crit_edge2
    i32 130, label %._crit_edge3
    i32 129, label %23
    i32 68, label %._crit_edge4
    i32 65, label %25
  ]

._crit_edge4:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 4)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 4)
  br label %25

._crit_edge3:                                     ; preds = %1
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 3)
  %15 = add i64 %pgocount5, 1
  store i64 %15, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 3)
  br label %23

._crit_edge2:                                     ; preds = %1
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 2)
  %16 = add i64 %pgocount6, 1
  store i64 %16, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 2)
  br label %23

._crit_edge1:                                     ; preds = %1
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 1)
  %17 = add i64 %pgocount7, 1
  store i64 %17, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 1)
  br label %21

._crit_edge:                                      ; preds = %1
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 0)
  %18 = add i64 %pgocount8, 1
  store i64 %18, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 0)
  br label %21

; <label>:19:                                     ; preds = %1
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 12)
  %20 = add i64 %pgocount9, 1
  store i64 %20, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 12)
  store i32 0, i32* %3, align 4
  br label %29

; <label>:21:                                     ; preds = %._crit_edge1, %._crit_edge, %1
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 7)
  %22 = add i64 %pgocount10, 1
  store i64 %22, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 7)
  store i32 2, i32* %3, align 4
  br label %29

; <label>:23:                                     ; preds = %._crit_edge3, %._crit_edge2, %1
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 8)
  %24 = add i64 %pgocount11, 1
  store i64 %24, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 8)
  store i32 1, i32* %3, align 4
  br label %29

; <label>:25:                                     ; preds = %._crit_edge4, %1
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 9)
  %26 = add i64 %pgocount12, 1
  store i64 %26, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 9)
  store i32 3, i32* %3, align 4
  br label %29

; <label>:27:                                     ; preds = %1
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 13)
  %28 = add i64 %pgocount13, 1
  store i64 %28, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 13)
  store i32 -1, i32* %3, align 4
  br label %29

; <label>:29:                                     ; preds = %27, %25, %23, %21, %19
  %30 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %2, align 8
  %31 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %30, i32 0, i32 15
  %32 = load i16, i16* %31, align 2
  %33 = zext i16 %32 to i32
  switch i32 %33, label %47 [
    i32 1, label %34
    i32 3, label %40
  ]

; <label>:34:                                     ; preds = %29
  %35 = load i32, i32* %3, align 4
  %36 = icmp ne i32 %35, 2
  br i1 %36, label %37, label %39

; <label>:37:                                     ; preds = %34
  %pgocount14 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 10)
  %38 = add i64 %pgocount14, 1
  store i64 %38, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 10)
  store i32 -1, i32* %3, align 4
  br label %39

; <label>:39:                                     ; preds = %37, %34
  br label %49

; <label>:40:                                     ; preds = %29
  %41 = load i32, i32* %3, align 4
  %42 = icmp eq i32 %41, 2
  br i1 %42, label %43, label %45

; <label>:43:                                     ; preds = %40
  %pgocount15 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 11)
  %44 = add i64 %pgocount15, 1
  store i64 %44, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 11)
  store i32 -1, i32* %3, align 4
  br label %45

; <label>:45:                                     ; preds = %43, %40
  %pgocount16 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 5)
  %46 = add i64 %pgocount16, 1
  store i64 %46, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 5)
  br label %49

; <label>:47:                                     ; preds = %29
  %pgocount17 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 6)
  %48 = add i64 %pgocount17, 1
  store i64 %48, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LogLuvGuessDataFmt, i64 0, i64 6)
  store i32 -1, i32* %3, align 4
  br label %49

; <label>:49:                                     ; preds = %47, %45, %39
  %50 = load i32, i32* %3, align 4
  ret i32 %50
}

declare void @_TIFFmemset(i8*, i32, i32) #2

; Function Attrs: noinline nounwind uwtable
define internal void @pix24toXYZ(i32, float*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca float*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  store i32 %0, i32* %3, align 4
  store float* %1, float** %4, align 8
  %13 = load i32, i32* %3, align 4
  %14 = lshr i32 %13, 14
  %15 = and i32 %14, 1023
  store i32 %15, i32* %5, align 4
  %16 = load i32, i32* %5, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %26

; <label>:18:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pix24toXYZ, i64 0, i64 1)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pix24toXYZ, i64 0, i64 1)
  %20 = load float*, float** %4, align 8
  %21 = getelementptr inbounds float, float* %20, i64 2
  store float 0.000000e+00, float* %21, align 4
  %22 = load float*, float** %4, align 8
  %23 = getelementptr inbounds float, float* %22, i64 1
  store float 0.000000e+00, float* %23, align 4
  %24 = load float*, float** %4, align 8
  %25 = getelementptr inbounds float, float* %24, i64 0
  store float 0.000000e+00, float* %25, align 4
  br label %80

; <label>:26:                                     ; preds = %2
  %27 = load i32, i32* %5, align 4
  %28 = sitofp i32 %27 to double
  %29 = fadd double %28, 5.000000e-01
  %30 = fmul double 0x3F862E42FEFA39EF, %29
  %31 = fsub double %30, 0x4020A2B23F3BAB73
  %32 = call double @exp(double %31) #5
  store double %32, double* %7, align 8
  %33 = load i32, i32* %3, align 4
  %34 = and i32 %33, 16383
  store i32 %34, i32* %6, align 4
  %35 = load i32, i32* %6, align 4
  %36 = call i32 @uv_decode(double* %8, double* %9, i32 %35)
  %37 = icmp slt i32 %36, 0
  br i1 %37, label %38, label %40

; <label>:38:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pix24toXYZ, i64 0, i64 2)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pix24toXYZ, i64 0, i64 2)
  store double 0x3FCAF286BD156C1A, double* %8, align 8
  store double 0x3FDE50D794B8199E, double* %9, align 8
  br label %40

; <label>:40:                                     ; preds = %38, %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pix24toXYZ, i64 0, i64 0)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pix24toXYZ, i64 0, i64 0)
  %42 = load double, double* %8, align 8
  %43 = fmul double 6.000000e+00, %42
  %44 = load double, double* %9, align 8
  %45 = fmul double 1.600000e+01, %44
  %46 = fsub double %43, %45
  %47 = fadd double %46, 1.200000e+01
  %48 = fdiv double 1.000000e+00, %47
  store double %48, double* %10, align 8
  %49 = load double, double* %8, align 8
  %50 = fmul double 9.000000e+00, %49
  %51 = load double, double* %10, align 8
  %52 = fmul double %50, %51
  store double %52, double* %11, align 8
  %53 = load double, double* %9, align 8
  %54 = fmul double 4.000000e+00, %53
  %55 = load double, double* %10, align 8
  %56 = fmul double %54, %55
  store double %56, double* %12, align 8
  %57 = load double, double* %11, align 8
  %58 = load double, double* %12, align 8
  %59 = fdiv double %57, %58
  %60 = load double, double* %7, align 8
  %61 = fmul double %59, %60
  %62 = fptrunc double %61 to float
  %63 = load float*, float** %4, align 8
  %64 = getelementptr inbounds float, float* %63, i64 0
  store float %62, float* %64, align 4
  %65 = load double, double* %7, align 8
  %66 = fptrunc double %65 to float
  %67 = load float*, float** %4, align 8
  %68 = getelementptr inbounds float, float* %67, i64 1
  store float %66, float* %68, align 4
  %69 = load double, double* %11, align 8
  %70 = fsub double 1.000000e+00, %69
  %71 = load double, double* %12, align 8
  %72 = fsub double %70, %71
  %73 = load double, double* %12, align 8
  %74 = fdiv double %72, %73
  %75 = load double, double* %7, align 8
  %76 = fmul double %74, %75
  %77 = fptrunc double %76 to float
  %78 = load float*, float** %4, align 8
  %79 = getelementptr inbounds float, float* %78, i64 2
  store float %77, float* %79, align 4
  br label %80

; <label>:80:                                     ; preds = %40, %18
  ret void
}

; Function Attrs: nounwind
declare double @exp(double) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @uv_decode(double*, double*, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca double*, align 8
  %6 = alloca double*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store double* %0, double** %5, align 8
  store double* %1, double** %6, align 8
  store i32 %2, i32* %7, align 4
  %12 = load i32, i32* %7, align 4
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %18, label %14

; <label>:14:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_uv_decode, i64 0, i64 3)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_uv_decode, i64 0, i64 3)
  %16 = load i32, i32* %7, align 4
  %17 = icmp sge i32 %16, 16289
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %14, %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_uv_decode, i64 0, i64 2)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_uv_decode, i64 0, i64 2)
  store i32 -1, i32* %4, align 4
  br label %83

; <label>:20:                                     ; preds = %14
  store i32 0, i32* %9, align 4
  store i32 163, i32* %8, align 4
  br label %21

; <label>:21:                                     ; preds = %49, %20
  %22 = load i32, i32* %9, align 4
  %23 = load i32, i32* %8, align 4
  %24 = add nsw i32 %22, %23
  %25 = ashr i32 %24, 1
  store i32 %25, i32* %11, align 4
  %26 = load i32, i32* %7, align 4
  %27 = load i32, i32* %11, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [163 x %struct.anon], [163 x %struct.anon]* @uv_row, i64 0, i64 %28
  %30 = getelementptr inbounds %struct.anon, %struct.anon* %29, i32 0, i32 2
  %31 = load i16, i16* %30, align 2
  %32 = sext i16 %31 to i32
  %33 = sub nsw i32 %26, %32
  store i32 %33, i32* %10, align 4
  %34 = load i32, i32* %10, align 4
  %35 = icmp sgt i32 %34, 0
  br i1 %35, label %36, label %39

; <label>:36:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_uv_decode, i64 0, i64 0)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_uv_decode, i64 0, i64 0)
  %38 = load i32, i32* %11, align 4
  store i32 %38, i32* %9, align 4
  br label %48

; <label>:39:                                     ; preds = %21
  %40 = load i32, i32* %10, align 4
  %41 = icmp slt i32 %40, 0
  br i1 %41, label %42, label %44

; <label>:42:                                     ; preds = %39
  %43 = load i32, i32* %11, align 4
  store i32 %43, i32* %8, align 4
  br label %46

; <label>:44:                                     ; preds = %39
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_uv_decode, i64 0, i64 5)
  %45 = add i64 %pgocount3, 1
  store i64 %45, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_uv_decode, i64 0, i64 5)
  br label %54

; <label>:46:                                     ; preds = %42
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_uv_decode, i64 0, i64 1)
  %47 = add i64 %pgocount4, 1
  store i64 %47, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_uv_decode, i64 0, i64 1)
  br label %48

; <label>:48:                                     ; preds = %46, %36
  br label %49

; <label>:49:                                     ; preds = %48
  %50 = load i32, i32* %8, align 4
  %51 = load i32, i32* %9, align 4
  %52 = sub nsw i32 %50, %51
  %53 = icmp sgt i32 %52, 1
  br i1 %53, label %21, label %54

; <label>:54:                                     ; preds = %49, %44
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_uv_decode, i64 0, i64 4)
  %55 = add i64 %pgocount5, 1
  store i64 %55, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_uv_decode, i64 0, i64 4)
  %56 = load i32, i32* %9, align 4
  store i32 %56, i32* %11, align 4
  %57 = load i32, i32* %7, align 4
  %58 = load i32, i32* %11, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [163 x %struct.anon], [163 x %struct.anon]* @uv_row, i64 0, i64 %59
  %61 = getelementptr inbounds %struct.anon, %struct.anon* %60, i32 0, i32 2
  %62 = load i16, i16* %61, align 2
  %63 = sext i16 %62 to i32
  %64 = sub nsw i32 %57, %63
  store i32 %64, i32* %10, align 4
  %65 = load i32, i32* %11, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [163 x %struct.anon], [163 x %struct.anon]* @uv_row, i64 0, i64 %66
  %68 = getelementptr inbounds %struct.anon, %struct.anon* %67, i32 0, i32 0
  %69 = load float, float* %68, align 8
  %70 = fpext float %69 to double
  %71 = load i32, i32* %10, align 4
  %72 = sitofp i32 %71 to double
  %73 = fadd double %72, 5.000000e-01
  %74 = fmul double %73, 0x3F6CAC0840000000
  %75 = fadd double %70, %74
  %76 = load double*, double** %5, align 8
  store double %75, double* %76, align 8
  %77 = load i32, i32* %11, align 4
  %78 = sitofp i32 %77 to double
  %79 = fadd double %78, 5.000000e-01
  %80 = fmul double %79, 0x3F6CAC0840000000
  %81 = fadd double 0x3F9158B820000000, %80
  %82 = load double*, double** %6, align 8
  store double %81, double* %82, align 8
  store i32 0, i32* %4, align 4
  br label %83

; <label>:83:                                     ; preds = %54, %18
  %84 = load i32, i32* %4, align 4
  ret i32 %84
}

; Function Attrs: noinline nounwind uwtable
define internal void @XYZtoRGB24(float*, i8*) #0 {
  %3 = alloca float*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  store float* %0, float** %3, align 8
  store i8* %1, i8** %4, align 8
  %8 = load float*, float** %3, align 8
  %9 = getelementptr inbounds float, float* %8, i64 0
  %10 = load float, float* %9, align 4
  %11 = fpext float %10 to double
  %12 = fmul double 2.690000e+00, %11
  %13 = load float*, float** %3, align 8
  %14 = getelementptr inbounds float, float* %13, i64 1
  %15 = load float, float* %14, align 4
  %16 = fpext float %15 to double
  %17 = fmul double -1.276000e+00, %16
  %18 = fadd double %12, %17
  %19 = load float*, float** %3, align 8
  %20 = getelementptr inbounds float, float* %19, i64 2
  %21 = load float, float* %20, align 4
  %22 = fpext float %21 to double
  %23 = fmul double -4.140000e-01, %22
  %24 = fadd double %18, %23
  store double %24, double* %5, align 8
  %25 = load float*, float** %3, align 8
  %26 = getelementptr inbounds float, float* %25, i64 0
  %27 = load float, float* %26, align 4
  %28 = fpext float %27 to double
  %29 = fmul double -1.022000e+00, %28
  %30 = load float*, float** %3, align 8
  %31 = getelementptr inbounds float, float* %30, i64 1
  %32 = load float, float* %31, align 4
  %33 = fpext float %32 to double
  %34 = fmul double 1.978000e+00, %33
  %35 = fadd double %29, %34
  %36 = load float*, float** %3, align 8
  %37 = getelementptr inbounds float, float* %36, i64 2
  %38 = load float, float* %37, align 4
  %39 = fpext float %38 to double
  %40 = fmul double 4.400000e-02, %39
  %41 = fadd double %35, %40
  store double %41, double* %6, align 8
  %42 = load float*, float** %3, align 8
  %43 = getelementptr inbounds float, float* %42, i64 0
  %44 = load float, float* %43, align 4
  %45 = fpext float %44 to double
  %46 = fmul double 6.100000e-02, %45
  %47 = load float*, float** %3, align 8
  %48 = getelementptr inbounds float, float* %47, i64 1
  %49 = load float, float* %48, align 4
  %50 = fpext float %49 to double
  %51 = fmul double -2.240000e-01, %50
  %52 = fadd double %46, %51
  %53 = load float*, float** %3, align 8
  %54 = getelementptr inbounds float, float* %53, i64 2
  %55 = load float, float* %54, align 4
  %56 = fpext float %55 to double
  %57 = fmul double 1.163000e+00, %56
  %58 = fadd double %52, %57
  store double %58, double* %7, align 8
  %59 = load double, double* %5, align 8
  %60 = fcmp ole double %59, 0.000000e+00
  br i1 %60, label %61, label %62

; <label>:61:                                     ; preds = %2
  br label %75

; <label>:62:                                     ; preds = %2
  %63 = load double, double* %5, align 8
  %64 = fcmp oge double %63, 1.000000e+00
  br i1 %64, label %65, label %67

; <label>:65:                                     ; preds = %62
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_XYZtoRGB24, i64 0, i64 1)
  %66 = add i64 %pgocount, 1
  store i64 %66, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_XYZtoRGB24, i64 0, i64 1)
  br label %73

; <label>:67:                                     ; preds = %62
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_XYZtoRGB24, i64 0, i64 2)
  %68 = add i64 %pgocount1, 1
  store i64 %68, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_XYZtoRGB24, i64 0, i64 2)
  %69 = load double, double* %5, align 8
  %70 = call double @sqrt(double %69) #5
  %71 = fmul double 2.560000e+02, %70
  %72 = fptosi double %71 to i32
  br label %73

; <label>:73:                                     ; preds = %67, %65
  %74 = phi i32 [ 255, %65 ], [ %72, %67 ]
  br label %75

; <label>:75:                                     ; preds = %73, %61
  %76 = phi i32 [ 0, %61 ], [ %74, %73 ]
  %77 = trunc i32 %76 to i8
  %78 = load i8*, i8** %4, align 8
  %79 = getelementptr inbounds i8, i8* %78, i64 0
  store i8 %77, i8* %79, align 1
  %80 = load double, double* %6, align 8
  %81 = fcmp ole double %80, 0.000000e+00
  br i1 %81, label %82, label %83

; <label>:82:                                     ; preds = %75
  br label %96

; <label>:83:                                     ; preds = %75
  %84 = load double, double* %6, align 8
  %85 = fcmp oge double %84, 1.000000e+00
  br i1 %85, label %86, label %88

; <label>:86:                                     ; preds = %83
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_XYZtoRGB24, i64 0, i64 3)
  %87 = add i64 %pgocount2, 1
  store i64 %87, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_XYZtoRGB24, i64 0, i64 3)
  br label %94

; <label>:88:                                     ; preds = %83
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_XYZtoRGB24, i64 0, i64 4)
  %89 = add i64 %pgocount3, 1
  store i64 %89, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_XYZtoRGB24, i64 0, i64 4)
  %90 = load double, double* %6, align 8
  %91 = call double @sqrt(double %90) #5
  %92 = fmul double 2.560000e+02, %91
  %93 = fptosi double %92 to i32
  br label %94

; <label>:94:                                     ; preds = %88, %86
  %95 = phi i32 [ 255, %86 ], [ %93, %88 ]
  br label %96

; <label>:96:                                     ; preds = %94, %82
  %97 = phi i32 [ 0, %82 ], [ %95, %94 ]
  %98 = trunc i32 %97 to i8
  %99 = load i8*, i8** %4, align 8
  %100 = getelementptr inbounds i8, i8* %99, i64 1
  store i8 %98, i8* %100, align 1
  %101 = load double, double* %7, align 8
  %102 = fcmp ole double %101, 0.000000e+00
  br i1 %102, label %103, label %105

; <label>:103:                                    ; preds = %96
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_XYZtoRGB24, i64 0, i64 0)
  %104 = add i64 %pgocount4, 1
  store i64 %104, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_XYZtoRGB24, i64 0, i64 0)
  br label %118

; <label>:105:                                    ; preds = %96
  %106 = load double, double* %7, align 8
  %107 = fcmp oge double %106, 1.000000e+00
  br i1 %107, label %108, label %110

; <label>:108:                                    ; preds = %105
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_XYZtoRGB24, i64 0, i64 5)
  %109 = add i64 %pgocount5, 1
  store i64 %109, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_XYZtoRGB24, i64 0, i64 5)
  br label %116

; <label>:110:                                    ; preds = %105
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_XYZtoRGB24, i64 0, i64 6)
  %111 = add i64 %pgocount6, 1
  store i64 %111, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_XYZtoRGB24, i64 0, i64 6)
  %112 = load double, double* %7, align 8
  %113 = call double @sqrt(double %112) #5
  %114 = fmul double 2.560000e+02, %113
  %115 = fptosi double %114 to i32
  br label %116

; <label>:116:                                    ; preds = %110, %108
  %117 = phi i32 [ 255, %108 ], [ %115, %110 ]
  br label %118

; <label>:118:                                    ; preds = %116, %103
  %119 = phi i32 [ 0, %103 ], [ %117, %116 ]
  %120 = trunc i32 %119 to i8
  %121 = load i8*, i8** %4, align 8
  %122 = getelementptr inbounds i8, i8* %121, i64 2
  store i8 %120, i8* %122, align 1
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double) #4

; Function Attrs: noinline nounwind uwtable
define internal void @pix32toXYZ(i32, float*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca float*, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  store i32 %0, i32* %3, align 4
  store float* %1, float** %4, align 8
  %11 = load i32, i32* %3, align 4
  %12 = ashr i32 %11, 16
  %13 = call double @pix16toY(i32 %12)
  store double %13, double* %5, align 8
  %14 = load double, double* %5, align 8
  %15 = fcmp oeq double %14, 0.000000e+00
  br i1 %15, label %16, label %24

; <label>:16:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_pix32toXYZ, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_pix32toXYZ, i64 0, i64 0)
  %18 = load float*, float** %4, align 8
  %19 = getelementptr inbounds float, float* %18, i64 2
  store float 0.000000e+00, float* %19, align 4
  %20 = load float*, float** %4, align 8
  %21 = getelementptr inbounds float, float* %20, i64 1
  store float 0.000000e+00, float* %21, align 4
  %22 = load float*, float** %4, align 8
  %23 = getelementptr inbounds float, float* %22, i64 0
  store float 0.000000e+00, float* %23, align 4
  br label %75

; <label>:24:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_pix32toXYZ, i64 0, i64 1)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_pix32toXYZ, i64 0, i64 1)
  %26 = load i32, i32* %3, align 4
  %27 = lshr i32 %26, 8
  %28 = and i32 %27, 255
  %29 = uitofp i32 %28 to double
  %30 = fadd double %29, 5.000000e-01
  %31 = fmul double 0x3F63FB013FB013FB, %30
  store double %31, double* %6, align 8
  %32 = load i32, i32* %3, align 4
  %33 = and i32 %32, 255
  %34 = uitofp i32 %33 to double
  %35 = fadd double %34, 5.000000e-01
  %36 = fmul double 0x3F63FB013FB013FB, %35
  store double %36, double* %7, align 8
  %37 = load double, double* %6, align 8
  %38 = fmul double 6.000000e+00, %37
  %39 = load double, double* %7, align 8
  %40 = fmul double 1.600000e+01, %39
  %41 = fsub double %38, %40
  %42 = fadd double %41, 1.200000e+01
  %43 = fdiv double 1.000000e+00, %42
  store double %43, double* %8, align 8
  %44 = load double, double* %6, align 8
  %45 = fmul double 9.000000e+00, %44
  %46 = load double, double* %8, align 8
  %47 = fmul double %45, %46
  store double %47, double* %9, align 8
  %48 = load double, double* %7, align 8
  %49 = fmul double 4.000000e+00, %48
  %50 = load double, double* %8, align 8
  %51 = fmul double %49, %50
  store double %51, double* %10, align 8
  %52 = load double, double* %9, align 8
  %53 = load double, double* %10, align 8
  %54 = fdiv double %52, %53
  %55 = load double, double* %5, align 8
  %56 = fmul double %54, %55
  %57 = fptrunc double %56 to float
  %58 = load float*, float** %4, align 8
  %59 = getelementptr inbounds float, float* %58, i64 0
  store float %57, float* %59, align 4
  %60 = load double, double* %5, align 8
  %61 = fptrunc double %60 to float
  %62 = load float*, float** %4, align 8
  %63 = getelementptr inbounds float, float* %62, i64 1
  store float %61, float* %63, align 4
  %64 = load double, double* %9, align 8
  %65 = fsub double 1.000000e+00, %64
  %66 = load double, double* %10, align 8
  %67 = fsub double %65, %66
  %68 = load double, double* %10, align 8
  %69 = fdiv double %67, %68
  %70 = load double, double* %5, align 8
  %71 = fmul double %69, %70
  %72 = fptrunc double %71 to float
  %73 = load float*, float** %4, align 8
  %74 = getelementptr inbounds float, float* %73, i64 2
  store float %72, float* %74, align 4
  br label %75

; <label>:75:                                     ; preds = %24, %16
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal double @pix16toY(i32) #0 {
  %2 = alloca double, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca double, align 8
  store i32 %0, i32* %3, align 4
  %6 = load i32, i32* %3, align 4
  %7 = and i32 %6, 32767
  store i32 %7, i32* %4, align 4
  %8 = load i32, i32* %4, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %12, label %10

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pix16toY, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pix16toY, i64 0, i64 0)
  store double 0.000000e+00, double* %2, align 8
  br label %29

; <label>:12:                                     ; preds = %1
  %13 = load i32, i32* %4, align 4
  %14 = sitofp i32 %13 to double
  %15 = fadd double %14, 5.000000e-01
  %16 = fmul double 0x3F662E42FEFA39EF, %15
  %17 = fsub double %16, 0x40462E42FEFA39EF
  %18 = call double @exp(double %17) #5
  store double %18, double* %5, align 8
  %19 = load i32, i32* %3, align 4
  %20 = and i32 %19, 32768
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %26

; <label>:22:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pix16toY, i64 0, i64 1)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pix16toY, i64 0, i64 1)
  %24 = load double, double* %5, align 8
  %25 = fsub double -0.000000e+00, %24
  store double %25, double* %2, align 8
  br label %29

; <label>:26:                                     ; preds = %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pix16toY, i64 0, i64 2)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_pix16toY, i64 0, i64 2)
  %28 = load double, double* %5, align 8
  store double %28, double* %2, align 8
  br label %29

; <label>:29:                                     ; preds = %26, %22, %10
  %30 = load double, double* %2, align 8
  ret double %30
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogL16GuessDataFmt(%struct.TIFFDirectory*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.TIFFDirectory*, align 8
  store %struct.TIFFDirectory* %0, %struct.TIFFDirectory** %3, align 8
  %4 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %5 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %4, i32 0, i32 8
  %6 = load i16, i16* %5, align 4
  %7 = zext i16 %6 to i32
  %8 = shl i32 %7, 6
  %9 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %10 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %9, i32 0, i32 15
  %11 = load i16, i16* %10, align 2
  %12 = zext i16 %11 to i32
  %13 = shl i32 %12, 3
  %14 = or i32 %8, %13
  %15 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %16 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %15, i32 0, i32 9
  %17 = load i16, i16* %16, align 2
  %18 = zext i16 %17 to i32
  %19 = or i32 %14, %18
  switch i32 %19, label %29 [
    i32 2059, label %23
    i32 1036, label %._crit_edge
    i32 1034, label %._crit_edge1
    i32 1033, label %25
    i32 524, label %._crit_edge2
    i32 521, label %27
  ]

._crit_edge2:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogL16GuessDataFmt, i64 0, i64 2)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogL16GuessDataFmt, i64 0, i64 2)
  br label %27

._crit_edge1:                                     ; preds = %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogL16GuessDataFmt, i64 0, i64 1)
  %21 = add i64 %pgocount3, 1
  store i64 %21, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogL16GuessDataFmt, i64 0, i64 1)
  br label %25

._crit_edge:                                      ; preds = %1
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogL16GuessDataFmt, i64 0, i64 0)
  %22 = add i64 %pgocount4, 1
  store i64 %22, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogL16GuessDataFmt, i64 0, i64 0)
  br label %25

; <label>:23:                                     ; preds = %1
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogL16GuessDataFmt, i64 0, i64 6)
  %24 = add i64 %pgocount5, 1
  store i64 %24, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogL16GuessDataFmt, i64 0, i64 6)
  store i32 0, i32* %2, align 4
  br label %31

; <label>:25:                                     ; preds = %._crit_edge1, %._crit_edge, %1
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogL16GuessDataFmt, i64 0, i64 3)
  %26 = add i64 %pgocount6, 1
  store i64 %26, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogL16GuessDataFmt, i64 0, i64 3)
  store i32 1, i32* %2, align 4
  br label %31

; <label>:27:                                     ; preds = %._crit_edge2, %1
  %pgocount7 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogL16GuessDataFmt, i64 0, i64 4)
  %28 = add i64 %pgocount7, 1
  store i64 %28, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogL16GuessDataFmt, i64 0, i64 4)
  store i32 3, i32* %2, align 4
  br label %31

; <label>:29:                                     ; preds = %1
  %pgocount8 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogL16GuessDataFmt, i64 0, i64 5)
  %30 = add i64 %pgocount8, 1
  store i64 %30, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_LogL16GuessDataFmt, i64 0, i64 5)
  store i32 -1, i32* %2, align 4
  br label %31

; <label>:31:                                     ; preds = %29, %27, %25, %23
  %32 = load i32, i32* %2, align 4
  ret i32 %32
}

declare i32 @TIFFScanlineSize(%struct.tiff*) #2

declare i32 @TIFFTileRowSize(%struct.tiff*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvEncode24(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca %struct.logLuvState*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  %15 = alloca i32*, align 8
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %16 = load %struct.tiff*, %struct.tiff** %6, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %16, i32 0, i32 37
  %18 = load i8*, i8** %17, align 8
  %19 = bitcast i8* %18 to %struct.logLuvState*
  store %struct.logLuvState* %19, %struct.logLuvState** %10, align 8
  %20 = load i16, i16* %9, align 2
  %21 = zext i16 %20 to i32
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %24

; <label>:23:                                     ; preds = %4
  br label %27

; <label>:24:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvEncode24, i64 0, i64 5)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvEncode24, i64 0, i64 5)
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 445, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvEncode24, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %27

; <label>:27:                                     ; preds = %26, %23
  %28 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %29 = icmp ne %struct.logLuvState* %28, null
  br i1 %29, label %30, label %31

; <label>:30:                                     ; preds = %27
  br label %34

; <label>:31:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvEncode24, i64 0, i64 6)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvEncode24, i64 0, i64 6)
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 446, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvEncode24, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %34

; <label>:34:                                     ; preds = %33, %30
  %35 = load i32, i32* %8, align 4
  %36 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %37 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %36, i32 0, i32 1
  %38 = load i32, i32* %37, align 4
  %39 = sdiv i32 %35, %38
  store i32 %39, i32* %12, align 4
  %40 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %41 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %40, i32 0, i32 0
  %42 = load i32, i32* %41, align 8
  %43 = icmp eq i32 %42, 2
  br i1 %43, label %44, label %48

; <label>:44:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvEncode24, i64 0, i64 2)
  %45 = add i64 %pgocount2, 1
  store i64 %45, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvEncode24, i64 0, i64 2)
  %46 = load i8*, i8** %7, align 8
  %47 = bitcast i8* %46 to i32*
  store i32* %47, i32** %15, align 8
  br label %72

; <label>:48:                                     ; preds = %34
  %49 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %50 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %49, i32 0, i32 2
  %51 = load i8**, i8*** %50, align 8
  %52 = bitcast i8** %51 to i32*
  store i32* %52, i32** %15, align 8
  %53 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %54 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %53, i32 0, i32 3
  %55 = load i16, i16* %54, align 8
  %56 = sext i16 %55 to i32
  %57 = load i32, i32* %12, align 4
  %58 = icmp sge i32 %56, %57
  br i1 %58, label %59, label %60

; <label>:59:                                     ; preds = %48
  br label %63

; <label>:60:                                     ; preds = %48
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvEncode24, i64 0, i64 7)
  %61 = add i64 %pgocount3, 1
  store i64 %61, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvEncode24, i64 0, i64 7)
  call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 453, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvEncode24, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %63

; <label>:63:                                     ; preds = %62, %59
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvEncode24, i64 0, i64 3)
  %64 = add i64 %pgocount4, 1
  store i64 %64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvEncode24, i64 0, i64 3)
  %65 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %66 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %65, i32 0, i32 4
  %67 = load void (%struct.logLuvState*, i8*, i32)*, void (%struct.logLuvState*, i8*, i32)** %66, align 8
  %68 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %69 = load i8*, i8** %7, align 8
  %70 = load i32, i32* %12, align 4
  %71 = ptrtoint void (%struct.logLuvState*, i8*, i32)* %67 to i64
  call void @__llvm_profile_instrument_target(i64 %71, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvEncode24 to i8*), i32 0)
  call void %67(%struct.logLuvState* %68, i8* %69, i32 %70)
  br label %72

; <label>:72:                                     ; preds = %63, %44
  %73 = load %struct.tiff*, %struct.tiff** %6, align 8
  %74 = getelementptr inbounds %struct.tiff, %struct.tiff* %73, i32 0, i32 42
  %75 = load i8*, i8** %74, align 8
  store i8* %75, i8** %14, align 8
  %76 = load %struct.tiff*, %struct.tiff** %6, align 8
  %77 = getelementptr inbounds %struct.tiff, %struct.tiff* %76, i32 0, i32 41
  %78 = load i32, i32* %77, align 8
  %79 = load %struct.tiff*, %struct.tiff** %6, align 8
  %80 = getelementptr inbounds %struct.tiff, %struct.tiff* %79, i32 0, i32 43
  %81 = load i32, i32* %80, align 8
  %82 = sub nsw i32 %78, %81
  store i32 %82, i32* %13, align 4
  %83 = load i32, i32* %12, align 4
  store i32 %83, i32* %11, align 4
  br label %84

; <label>:84:                                     ; preds = %119, %72
  %85 = load i32, i32* %11, align 4
  %86 = add nsw i32 %85, -1
  store i32 %86, i32* %11, align 4
  %87 = icmp ne i32 %85, 0
  br i1 %87, label %88, label %143

; <label>:88:                                     ; preds = %84
  %89 = load i32, i32* %13, align 4
  %90 = icmp slt i32 %89, 3
  br i1 %90, label %91, label %119

; <label>:91:                                     ; preds = %88
  %92 = load i8*, i8** %14, align 8
  %93 = load %struct.tiff*, %struct.tiff** %6, align 8
  %94 = getelementptr inbounds %struct.tiff, %struct.tiff* %93, i32 0, i32 42
  store i8* %92, i8** %94, align 8
  %95 = load %struct.tiff*, %struct.tiff** %6, align 8
  %96 = getelementptr inbounds %struct.tiff, %struct.tiff* %95, i32 0, i32 41
  %97 = load i32, i32* %96, align 8
  %98 = load i32, i32* %13, align 4
  %99 = sub nsw i32 %97, %98
  %100 = load %struct.tiff*, %struct.tiff** %6, align 8
  %101 = getelementptr inbounds %struct.tiff, %struct.tiff* %100, i32 0, i32 43
  store i32 %99, i32* %101, align 8
  %102 = load %struct.tiff*, %struct.tiff** %6, align 8
  %103 = call i32 @TIFFFlushData1(%struct.tiff* %102)
  %104 = icmp ne i32 %103, 0
  br i1 %104, label %107, label %105

; <label>:105:                                    ; preds = %91
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvEncode24, i64 0, i64 4)
  %106 = add i64 %pgocount5, 1
  store i64 %106, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvEncode24, i64 0, i64 4)
  store i32 -1, i32* %5, align 4
  br label %154

; <label>:107:                                    ; preds = %91
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvEncode24, i64 0, i64 1)
  %108 = add i64 %pgocount6, 1
  store i64 %108, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvEncode24, i64 0, i64 1)
  %109 = load %struct.tiff*, %struct.tiff** %6, align 8
  %110 = getelementptr inbounds %struct.tiff, %struct.tiff* %109, i32 0, i32 42
  %111 = load i8*, i8** %110, align 8
  store i8* %111, i8** %14, align 8
  %112 = load %struct.tiff*, %struct.tiff** %6, align 8
  %113 = getelementptr inbounds %struct.tiff, %struct.tiff* %112, i32 0, i32 41
  %114 = load i32, i32* %113, align 8
  %115 = load %struct.tiff*, %struct.tiff** %6, align 8
  %116 = getelementptr inbounds %struct.tiff, %struct.tiff* %115, i32 0, i32 43
  %117 = load i32, i32* %116, align 8
  %118 = sub nsw i32 %114, %117
  store i32 %118, i32* %13, align 4
  br label %119

; <label>:119:                                    ; preds = %107, %88
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvEncode24, i64 0, i64 0)
  %120 = add i64 %pgocount7, 1
  store i64 %120, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_LogLuvEncode24, i64 0, i64 0)
  %121 = load i32*, i32** %15, align 8
  %122 = load i32, i32* %121, align 4
  %123 = lshr i32 %122, 16
  %124 = trunc i32 %123 to i8
  %125 = load i8*, i8** %14, align 8
  %126 = getelementptr inbounds i8, i8* %125, i32 1
  store i8* %126, i8** %14, align 8
  store i8 %124, i8* %125, align 1
  %127 = load i32*, i32** %15, align 8
  %128 = load i32, i32* %127, align 4
  %129 = lshr i32 %128, 8
  %130 = and i32 %129, 255
  %131 = trunc i32 %130 to i8
  %132 = load i8*, i8** %14, align 8
  %133 = getelementptr inbounds i8, i8* %132, i32 1
  store i8* %133, i8** %14, align 8
  store i8 %131, i8* %132, align 1
  %134 = load i32*, i32** %15, align 8
  %135 = getelementptr inbounds i32, i32* %134, i32 1
  store i32* %135, i32** %15, align 8
  %136 = load i32, i32* %134, align 4
  %137 = and i32 %136, 255
  %138 = trunc i32 %137 to i8
  %139 = load i8*, i8** %14, align 8
  %140 = getelementptr inbounds i8, i8* %139, i32 1
  store i8* %140, i8** %14, align 8
  store i8 %138, i8* %139, align 1
  %141 = load i32, i32* %13, align 4
  %142 = sub nsw i32 %141, 3
  store i32 %142, i32* %13, align 4
  br label %84

; <label>:143:                                    ; preds = %84
  %144 = load i8*, i8** %14, align 8
  %145 = load %struct.tiff*, %struct.tiff** %6, align 8
  %146 = getelementptr inbounds %struct.tiff, %struct.tiff* %145, i32 0, i32 42
  store i8* %144, i8** %146, align 8
  %147 = load %struct.tiff*, %struct.tiff** %6, align 8
  %148 = getelementptr inbounds %struct.tiff, %struct.tiff* %147, i32 0, i32 41
  %149 = load i32, i32* %148, align 8
  %150 = load i32, i32* %13, align 4
  %151 = sub nsw i32 %149, %150
  %152 = load %struct.tiff*, %struct.tiff** %6, align 8
  %153 = getelementptr inbounds %struct.tiff, %struct.tiff* %152, i32 0, i32 43
  store i32 %151, i32* %153, align 8
  store i32 0, i32* %5, align 4
  br label %154

; <label>:154:                                    ; preds = %143, %105
  %155 = load i32, i32* %5, align 4
  ret i32 %155
}

; Function Attrs: noinline nounwind uwtable
define internal void @Luv24fromXYZ(%struct.logLuvState*, i8*, i32) #0 {
  %4 = alloca %struct.logLuvState*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %8 = alloca float*, align 8
  store %struct.logLuvState* %0, %struct.logLuvState** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %9 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %10 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %9, i32 0, i32 2
  %11 = load i8**, i8*** %10, align 8
  %12 = bitcast i8** %11 to i32*
  store i32* %12, i32** %7, align 8
  %13 = load i8*, i8** %5, align 8
  %14 = bitcast i8* %13 to float*
  store float* %14, float** %8, align 8
  br label %15

; <label>:15:                                     ; preds = %19, %3
  %16 = load i32, i32* %6, align 4
  %17 = add nsw i32 %16, -1
  store i32 %17, i32* %6, align 4
  %18 = icmp sgt i32 %16, 0
  br i1 %18, label %19, label %27

; <label>:19:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv24fromXYZ, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv24fromXYZ, i64 0, i64 0)
  %21 = load float*, float** %8, align 8
  %22 = call i32 @pix24fromXYZ(float* %21)
  %23 = load i32*, i32** %7, align 8
  %24 = getelementptr inbounds i32, i32* %23, i32 1
  store i32* %24, i32** %7, align 8
  store i32 %22, i32* %23, align 4
  %25 = load float*, float** %8, align 8
  %26 = getelementptr inbounds float, float* %25, i64 3
  store float* %26, float** %8, align 8
  br label %15

; <label>:27:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv24fromXYZ, i64 0, i64 1)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv24fromXYZ, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Luv24fromLuv48(%struct.logLuvState*, i8*, i32) #0 {
  %4 = alloca %struct.logLuvState*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.logLuvState* %0, %struct.logLuvState** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %11 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %12 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %11, i32 0, i32 2
  %13 = load i8**, i8*** %12, align 8
  %14 = bitcast i8** %13 to i32*
  store i32* %14, i32** %7, align 8
  %15 = load i8*, i8** %5, align 8
  %16 = bitcast i8* %15 to i16*
  store i16* %16, i16** %8, align 8
  br label %17

; <label>:17:                                     ; preds = %65, %3
  %18 = load i32, i32* %6, align 4
  %19 = add nsw i32 %18, -1
  store i32 %19, i32* %6, align 4
  %20 = icmp sgt i32 %18, 0
  br i1 %20, label %21, label %74

; <label>:21:                                     ; preds = %17
  %22 = load i16*, i16** %8, align 8
  %23 = getelementptr inbounds i16, i16* %22, i64 0
  %24 = load i16, i16* %23, align 2
  %25 = sext i16 %24 to i32
  %26 = icmp sle i32 %25, 0
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Luv24fromLuv48, i64 0, i64 0)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Luv24fromLuv48, i64 0, i64 0)
  store i32 0, i32* %9, align 4
  br label %46

; <label>:29:                                     ; preds = %21
  %30 = load i16*, i16** %8, align 8
  %31 = getelementptr inbounds i16, i16* %30, i64 0
  %32 = load i16, i16* %31, align 2
  %33 = sext i16 %32 to i32
  %34 = icmp sge i32 %33, 7410
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %29
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Luv24fromLuv48, i64 0, i64 2)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Luv24fromLuv48, i64 0, i64 2)
  store i32 1023, i32* %9, align 4
  br label %45

; <label>:37:                                     ; preds = %29
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Luv24fromLuv48, i64 0, i64 3)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Luv24fromLuv48, i64 0, i64 3)
  %39 = load i16*, i16** %8, align 8
  %40 = getelementptr inbounds i16, i16* %39, i64 0
  %41 = load i16, i16* %40, align 2
  %42 = sext i16 %41 to i32
  %43 = sub nsw i32 %42, 3314
  %44 = ashr i32 %43, 2
  store i32 %44, i32* %9, align 4
  br label %45

; <label>:45:                                     ; preds = %37, %35
  br label %46

; <label>:46:                                     ; preds = %45, %27
  %47 = load i32*, i32** %7, align 8
  %48 = getelementptr inbounds i32, i32* %47, i64 1
  %49 = load i32, i32* %48, align 4
  %50 = uitofp i32 %49 to double
  %51 = fadd double %50, 5.000000e-01
  %52 = fdiv double %51, 3.276800e+04
  %53 = load i32*, i32** %7, align 8
  %54 = getelementptr inbounds i32, i32* %53, i64 2
  %55 = load i32, i32* %54, align 4
  %56 = uitofp i32 %55 to double
  %57 = fadd double %56, 5.000000e-01
  %58 = fdiv double %57, 3.276800e+04
  %59 = call i32 @uv_encode(double %52, double %58)
  store i32 %59, i32* %10, align 4
  %60 = load i32, i32* %10, align 4
  %61 = icmp slt i32 %60, 0
  br i1 %61, label %62, label %65

; <label>:62:                                     ; preds = %46
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Luv24fromLuv48, i64 0, i64 1)
  %63 = add i64 %pgocount3, 1
  store i64 %63, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Luv24fromLuv48, i64 0, i64 1)
  %64 = call i32 @uv_encode(double 0x3FCAF286BD156C1A, double 0x3FDE50D794B8199E)
  store i32 %64, i32* %10, align 4
  br label %65

; <label>:65:                                     ; preds = %62, %46
  %66 = load i32, i32* %9, align 4
  %67 = shl i32 %66, 14
  %68 = load i32, i32* %10, align 4
  %69 = or i32 %67, %68
  %70 = load i32*, i32** %7, align 8
  %71 = getelementptr inbounds i32, i32* %70, i32 1
  store i32* %71, i32** %7, align 8
  store i32 %69, i32* %70, align 4
  %72 = load i16*, i16** %8, align 8
  %73 = getelementptr inbounds i16, i16* %72, i64 3
  store i16* %73, i16** %8, align 8
  br label %17

; <label>:74:                                     ; preds = %17
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Luv24fromLuv48, i64 0, i64 4)
  %75 = add i64 %pgocount4, 1
  store i64 %75, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Luv24fromLuv48, i64 0, i64 4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogLuvEncode32(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca %struct.logLuvState*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %16 = alloca i32*, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %22 = load %struct.tiff*, %struct.tiff** %6, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %22, i32 0, i32 37
  %24 = load i8*, i8** %23, align 8
  %25 = bitcast i8* %24 to %struct.logLuvState*
  store %struct.logLuvState* %25, %struct.logLuvState** %10, align 8
  store i32 0, i32* %19, align 4
  %26 = load i16, i16* %9, align 2
  %27 = zext i16 %26 to i32
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %30

; <label>:29:                                     ; preds = %4
  br label %33

; <label>:30:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 21)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 21)
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 492, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvEncode32, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %33

; <label>:33:                                     ; preds = %32, %29
  %34 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %35 = icmp ne %struct.logLuvState* %34, null
  br i1 %35, label %36, label %37

; <label>:36:                                     ; preds = %33
  br label %40

; <label>:37:                                     ; preds = %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 22)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 22)
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 493, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvEncode32, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %40

; <label>:40:                                     ; preds = %39, %36
  %41 = load i32, i32* %8, align 4
  %42 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %43 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %42, i32 0, i32 1
  %44 = load i32, i32* %43, align 4
  %45 = sdiv i32 %41, %44
  store i32 %45, i32* %14, align 4
  %46 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %47 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %46, i32 0, i32 0
  %48 = load i32, i32* %47, align 8
  %49 = icmp eq i32 %48, 2
  br i1 %49, label %50, label %54

; <label>:50:                                     ; preds = %40
  %pgocount2 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 15)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 15)
  %52 = load i8*, i8** %7, align 8
  %53 = bitcast i8* %52 to i32*
  store i32* %53, i32** %16, align 8
  br label %78

; <label>:54:                                     ; preds = %40
  %55 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %56 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %55, i32 0, i32 2
  %57 = load i8**, i8*** %56, align 8
  %58 = bitcast i8** %57 to i32*
  store i32* %58, i32** %16, align 8
  %59 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %60 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %59, i32 0, i32 3
  %61 = load i16, i16* %60, align 8
  %62 = sext i16 %61 to i32
  %63 = load i32, i32* %14, align 4
  %64 = icmp sge i32 %62, %63
  br i1 %64, label %65, label %66

; <label>:65:                                     ; preds = %54
  br label %69

; <label>:66:                                     ; preds = %54
  %pgocount3 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 23)
  %67 = add i64 %pgocount3, 1
  store i64 %67, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 23)
  call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 501, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.LogLuvEncode32, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %69

; <label>:69:                                     ; preds = %68, %65
  %pgocount4 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 16)
  %70 = add i64 %pgocount4, 1
  store i64 %70, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 16)
  %71 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %72 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %71, i32 0, i32 4
  %73 = load void (%struct.logLuvState*, i8*, i32)*, void (%struct.logLuvState*, i8*, i32)** %72, align 8
  %74 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %75 = load i8*, i8** %7, align 8
  %76 = load i32, i32* %14, align 4
  %77 = ptrtoint void (%struct.logLuvState*, i8*, i32)* %73 to i64
  call void @__llvm_profile_instrument_target(i64 %77, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogLuvEncode32 to i8*), i32 0)
  call void %73(%struct.logLuvState* %74, i8* %75, i32 %76)
  br label %78

; <label>:78:                                     ; preds = %69, %50
  %79 = load %struct.tiff*, %struct.tiff** %6, align 8
  %80 = getelementptr inbounds %struct.tiff, %struct.tiff* %79, i32 0, i32 42
  %81 = load i8*, i8** %80, align 8
  store i8* %81, i8** %15, align 8
  %82 = load %struct.tiff*, %struct.tiff** %6, align 8
  %83 = getelementptr inbounds %struct.tiff, %struct.tiff* %82, i32 0, i32 41
  %84 = load i32, i32* %83, align 8
  %85 = load %struct.tiff*, %struct.tiff** %6, align 8
  %86 = getelementptr inbounds %struct.tiff, %struct.tiff* %85, i32 0, i32 43
  %87 = load i32, i32* %86, align 8
  %88 = sub nsw i32 %84, %87
  store i32 %88, i32* %18, align 4
  store i32 32, i32* %11, align 4
  br label %89

; <label>:89:                                     ; preds = %346, %78
  %90 = load i32, i32* %11, align 4
  %91 = sub nsw i32 %90, 8
  store i32 %91, i32* %11, align 4
  %92 = icmp sge i32 %91, 0
  br i1 %92, label %93, label %348

; <label>:93:                                     ; preds = %89
  store i32 0, i32* %12, align 4
  br label %94

; <label>:94:                                     ; preds = %342, %93
  %95 = load i32, i32* %12, align 4
  %96 = load i32, i32* %14, align 4
  %97 = icmp slt i32 %95, %96
  br i1 %97, label %98, label %346

; <label>:98:                                     ; preds = %94
  %99 = load i32, i32* %18, align 4
  %100 = icmp slt i32 %99, 4
  br i1 %100, label %101, label %129

; <label>:101:                                    ; preds = %98
  %102 = load i8*, i8** %15, align 8
  %103 = load %struct.tiff*, %struct.tiff** %6, align 8
  %104 = getelementptr inbounds %struct.tiff, %struct.tiff* %103, i32 0, i32 42
  store i8* %102, i8** %104, align 8
  %105 = load %struct.tiff*, %struct.tiff** %6, align 8
  %106 = getelementptr inbounds %struct.tiff, %struct.tiff* %105, i32 0, i32 41
  %107 = load i32, i32* %106, align 8
  %108 = load i32, i32* %18, align 4
  %109 = sub nsw i32 %107, %108
  %110 = load %struct.tiff*, %struct.tiff** %6, align 8
  %111 = getelementptr inbounds %struct.tiff, %struct.tiff* %110, i32 0, i32 43
  store i32 %109, i32* %111, align 8
  %112 = load %struct.tiff*, %struct.tiff** %6, align 8
  %113 = call i32 @TIFFFlushData1(%struct.tiff* %112)
  %114 = icmp ne i32 %113, 0
  br i1 %114, label %117, label %115

; <label>:115:                                    ; preds = %101
  %pgocount5 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 19)
  %116 = add i64 %pgocount5, 1
  store i64 %116, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 19)
  store i32 -1, i32* %5, align 4
  br label %360

; <label>:117:                                    ; preds = %101
  %pgocount6 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 11)
  %118 = add i64 %pgocount6, 1
  store i64 %118, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 11)
  %119 = load %struct.tiff*, %struct.tiff** %6, align 8
  %120 = getelementptr inbounds %struct.tiff, %struct.tiff* %119, i32 0, i32 42
  %121 = load i8*, i8** %120, align 8
  store i8* %121, i8** %15, align 8
  %122 = load %struct.tiff*, %struct.tiff** %6, align 8
  %123 = getelementptr inbounds %struct.tiff, %struct.tiff* %122, i32 0, i32 41
  %124 = load i32, i32* %123, align 8
  %125 = load %struct.tiff*, %struct.tiff** %6, align 8
  %126 = getelementptr inbounds %struct.tiff, %struct.tiff* %125, i32 0, i32 43
  %127 = load i32, i32* %126, align 8
  %128 = sub nsw i32 %124, %127
  store i32 %128, i32* %18, align 4
  br label %129

; <label>:129:                                    ; preds = %117, %98
  %130 = load i32, i32* %11, align 4
  %131 = shl i32 255, %130
  store i32 %131, i32* %20, align 4
  %132 = load i32, i32* %12, align 4
  store i32 %132, i32* %21, align 4
  br label %133

; <label>:133:                                    ; preds = %181, %129
  %134 = load i32, i32* %21, align 4
  %135 = load i32, i32* %14, align 4
  %136 = icmp slt i32 %134, %135
  br i1 %136, label %137, label %185

; <label>:137:                                    ; preds = %133
  %138 = load i32*, i32** %16, align 8
  %139 = load i32, i32* %21, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, i32* %138, i64 %140
  %142 = load i32, i32* %141, align 4
  %143 = load i32, i32* %20, align 4
  %144 = and i32 %142, %143
  store i32 %144, i32* %17, align 4
  store i32 1, i32* %19, align 4
  br label %145

; <label>:145:                                    ; preds = %170, %137
  %146 = load i32, i32* %19, align 4
  %147 = icmp slt i32 %146, 129
  br i1 %147, label %148, label %168

; <label>:148:                                    ; preds = %145
  %pgocount7 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 0)
  %149 = add i64 %pgocount7, 1
  store i64 %149, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 0)
  %150 = load i32, i32* %21, align 4
  %151 = load i32, i32* %19, align 4
  %152 = add nsw i32 %150, %151
  %153 = load i32, i32* %14, align 4
  %154 = icmp slt i32 %152, %153
  br i1 %154, label %155, label %168

; <label>:155:                                    ; preds = %148
  %pgocount8 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 1)
  %156 = add i64 %pgocount8, 1
  store i64 %156, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 1)
  %157 = load i32*, i32** %16, align 8
  %158 = load i32, i32* %21, align 4
  %159 = load i32, i32* %19, align 4
  %160 = add nsw i32 %158, %159
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds i32, i32* %157, i64 %161
  %163 = load i32, i32* %162, align 4
  %164 = load i32, i32* %20, align 4
  %165 = and i32 %163, %164
  %166 = load i32, i32* %17, align 4
  %167 = icmp eq i32 %165, %166
  br label %168

; <label>:168:                                    ; preds = %155, %148, %145
  %169 = phi i1 [ false, %148 ], [ false, %145 ], [ %167, %155 ]
  br i1 %169, label %170, label %174

; <label>:170:                                    ; preds = %168
  %pgocount9 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 2)
  %171 = add i64 %pgocount9, 1
  store i64 %171, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 2)
  %172 = load i32, i32* %19, align 4
  %173 = add nsw i32 %172, 1
  store i32 %173, i32* %19, align 4
  br label %145

; <label>:174:                                    ; preds = %168
  %175 = load i32, i32* %19, align 4
  %176 = icmp sge i32 %175, 4
  br i1 %176, label %177, label %179

; <label>:177:                                    ; preds = %174
  %pgocount10 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 10)
  %178 = add i64 %pgocount10, 1
  store i64 %178, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 10)
  br label %185

; <label>:179:                                    ; preds = %174
  %pgocount11 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 3)
  %180 = add i64 %pgocount11, 1
  store i64 %180, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 3)
  br label %181

; <label>:181:                                    ; preds = %179
  %182 = load i32, i32* %19, align 4
  %183 = load i32, i32* %21, align 4
  %184 = add nsw i32 %183, %182
  store i32 %184, i32* %21, align 4
  br label %133

; <label>:185:                                    ; preds = %177, %133
  %186 = load i32, i32* %21, align 4
  %187 = load i32, i32* %12, align 4
  %188 = sub nsw i32 %186, %187
  %189 = icmp sgt i32 %188, 1
  br i1 %189, label %190, label %243

; <label>:190:                                    ; preds = %185
  %pgocount12 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 9)
  %191 = add i64 %pgocount12, 1
  store i64 %191, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 9)
  %192 = load i32, i32* %21, align 4
  %193 = load i32, i32* %12, align 4
  %194 = sub nsw i32 %192, %193
  %195 = icmp slt i32 %194, 4
  br i1 %195, label %196, label %243

; <label>:196:                                    ; preds = %190
  %197 = load i32*, i32** %16, align 8
  %198 = load i32, i32* %12, align 4
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds i32, i32* %197, i64 %199
  %201 = load i32, i32* %200, align 4
  %202 = load i32, i32* %20, align 4
  %203 = and i32 %201, %202
  store i32 %203, i32* %17, align 4
  %204 = load i32, i32* %12, align 4
  %205 = add nsw i32 %204, 1
  store i32 %205, i32* %13, align 4
  br label %206

; <label>:206:                                    ; preds = %239, %196
  %207 = load i32*, i32** %16, align 8
  %208 = load i32, i32* %13, align 4
  %209 = add nsw i32 %208, 1
  store i32 %209, i32* %13, align 4
  %210 = sext i32 %208 to i64
  %211 = getelementptr inbounds i32, i32* %207, i64 %210
  %212 = load i32, i32* %211, align 4
  %213 = load i32, i32* %20, align 4
  %214 = and i32 %212, %213
  %215 = load i32, i32* %17, align 4
  %216 = icmp eq i32 %214, %215
  br i1 %216, label %217, label %241

; <label>:217:                                    ; preds = %206
  %218 = load i32, i32* %13, align 4
  %219 = load i32, i32* %21, align 4
  %220 = icmp eq i32 %218, %219
  br i1 %220, label %221, label %239

; <label>:221:                                    ; preds = %217
  %pgocount13 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 17)
  %222 = add i64 %pgocount13, 1
  store i64 %222, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 17)
  %223 = load i32, i32* %13, align 4
  %224 = add nsw i32 126, %223
  %225 = load i32, i32* %12, align 4
  %226 = sub nsw i32 %224, %225
  %227 = trunc i32 %226 to i8
  %228 = load i8*, i8** %15, align 8
  %229 = getelementptr inbounds i8, i8* %228, i32 1
  store i8* %229, i8** %15, align 8
  store i8 %227, i8* %228, align 1
  %230 = load i32, i32* %17, align 4
  %231 = load i32, i32* %11, align 4
  %232 = lshr i32 %230, %231
  %233 = trunc i32 %232 to i8
  %234 = load i8*, i8** %15, align 8
  %235 = getelementptr inbounds i8, i8* %234, i32 1
  store i8* %235, i8** %15, align 8
  store i8 %233, i8* %234, align 1
  %236 = load i32, i32* %18, align 4
  %237 = sub nsw i32 %236, 2
  store i32 %237, i32* %18, align 4
  %238 = load i32, i32* %21, align 4
  store i32 %238, i32* %12, align 4
  br label %241

; <label>:239:                                    ; preds = %217
  %pgocount14 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 7)
  %240 = add i64 %pgocount14, 1
  store i64 %240, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 7)
  br label %206

; <label>:241:                                    ; preds = %221, %206
  %pgocount15 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 14)
  %242 = add i64 %pgocount15, 1
  store i64 %242, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 14)
  br label %243

; <label>:243:                                    ; preds = %241, %190, %185
  br label %244

; <label>:244:                                    ; preds = %315, %243
  %245 = load i32, i32* %12, align 4
  %246 = load i32, i32* %21, align 4
  %247 = icmp slt i32 %245, %246
  br i1 %247, label %248, label %316

; <label>:248:                                    ; preds = %244
  %249 = load i32, i32* %21, align 4
  %250 = load i32, i32* %12, align 4
  %251 = sub nsw i32 %249, %250
  store i32 %251, i32* %13, align 4
  %252 = icmp sgt i32 %251, 127
  br i1 %252, label %253, label %255

; <label>:253:                                    ; preds = %248
  %pgocount16 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 5)
  %254 = add i64 %pgocount16, 1
  store i64 %254, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 5)
  store i32 127, i32* %13, align 4
  br label %255

; <label>:255:                                    ; preds = %253, %248
  %256 = load i32, i32* %18, align 4
  %257 = load i32, i32* %13, align 4
  %258 = add nsw i32 %257, 3
  %259 = icmp slt i32 %256, %258
  br i1 %259, label %261, label %._crit_edge

._crit_edge:                                      ; preds = %255
  %pgocount17 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 4)
  %260 = add i64 %pgocount17, 1
  store i64 %260, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 4)
  br label %288

; <label>:261:                                    ; preds = %255
  %262 = load i8*, i8** %15, align 8
  %263 = load %struct.tiff*, %struct.tiff** %6, align 8
  %264 = getelementptr inbounds %struct.tiff, %struct.tiff* %263, i32 0, i32 42
  store i8* %262, i8** %264, align 8
  %265 = load %struct.tiff*, %struct.tiff** %6, align 8
  %266 = getelementptr inbounds %struct.tiff, %struct.tiff* %265, i32 0, i32 41
  %267 = load i32, i32* %266, align 8
  %268 = load i32, i32* %18, align 4
  %269 = sub nsw i32 %267, %268
  %270 = load %struct.tiff*, %struct.tiff** %6, align 8
  %271 = getelementptr inbounds %struct.tiff, %struct.tiff* %270, i32 0, i32 43
  store i32 %269, i32* %271, align 8
  %272 = load %struct.tiff*, %struct.tiff** %6, align 8
  %273 = call i32 @TIFFFlushData1(%struct.tiff* %272)
  %274 = icmp ne i32 %273, 0
  br i1 %274, label %276, label %275

; <label>:275:                                    ; preds = %261
  store i32 -1, i32* %5, align 4
  br label %360

; <label>:276:                                    ; preds = %261
  %pgocount18 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 6)
  %277 = add i64 %pgocount18, 1
  store i64 %277, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 6)
  %278 = load %struct.tiff*, %struct.tiff** %6, align 8
  %279 = getelementptr inbounds %struct.tiff, %struct.tiff* %278, i32 0, i32 42
  %280 = load i8*, i8** %279, align 8
  store i8* %280, i8** %15, align 8
  %281 = load %struct.tiff*, %struct.tiff** %6, align 8
  %282 = getelementptr inbounds %struct.tiff, %struct.tiff* %281, i32 0, i32 41
  %283 = load i32, i32* %282, align 8
  %284 = load %struct.tiff*, %struct.tiff** %6, align 8
  %285 = getelementptr inbounds %struct.tiff, %struct.tiff* %284, i32 0, i32 43
  %286 = load i32, i32* %285, align 8
  %287 = sub nsw i32 %283, %286
  store i32 %287, i32* %18, align 4
  br label %288

; <label>:288:                                    ; preds = %._crit_edge, %276
  %289 = load i32, i32* %13, align 4
  %290 = trunc i32 %289 to i8
  %291 = load i8*, i8** %15, align 8
  %292 = getelementptr inbounds i8, i8* %291, i32 1
  store i8* %292, i8** %15, align 8
  store i8 %290, i8* %291, align 1
  %293 = load i32, i32* %18, align 4
  %294 = add nsw i32 %293, -1
  store i32 %294, i32* %18, align 4
  br label %295

; <label>:295:                                    ; preds = %299, %288
  %296 = load i32, i32* %13, align 4
  %297 = add nsw i32 %296, -1
  store i32 %297, i32* %13, align 4
  %298 = icmp ne i32 %296, 0
  br i1 %298, label %299, label %315

; <label>:299:                                    ; preds = %295
  %pgocount19 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 8)
  %300 = add i64 %pgocount19, 1
  store i64 %300, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 8)
  %301 = load i32*, i32** %16, align 8
  %302 = load i32, i32* %12, align 4
  %303 = add nsw i32 %302, 1
  store i32 %303, i32* %12, align 4
  %304 = sext i32 %302 to i64
  %305 = getelementptr inbounds i32, i32* %301, i64 %304
  %306 = load i32, i32* %305, align 4
  %307 = load i32, i32* %11, align 4
  %308 = lshr i32 %306, %307
  %309 = and i32 %308, 255
  %310 = trunc i32 %309 to i8
  %311 = load i8*, i8** %15, align 8
  %312 = getelementptr inbounds i8, i8* %311, i32 1
  store i8* %312, i8** %15, align 8
  store i8 %310, i8* %311, align 1
  %313 = load i32, i32* %18, align 4
  %314 = add nsw i32 %313, -1
  store i32 %314, i32* %18, align 4
  br label %295

; <label>:315:                                    ; preds = %295
  br label %244

; <label>:316:                                    ; preds = %244
  %317 = load i32, i32* %19, align 4
  %318 = icmp sge i32 %317, 4
  br i1 %318, label %319, label %339

; <label>:319:                                    ; preds = %316
  %pgocount20 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 12)
  %320 = add i64 %pgocount20, 1
  store i64 %320, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 12)
  %321 = load i32, i32* %19, align 4
  %322 = add nsw i32 126, %321
  %323 = trunc i32 %322 to i8
  %324 = load i8*, i8** %15, align 8
  %325 = getelementptr inbounds i8, i8* %324, i32 1
  store i8* %325, i8** %15, align 8
  store i8 %323, i8* %324, align 1
  %326 = load i32*, i32** %16, align 8
  %327 = load i32, i32* %21, align 4
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds i32, i32* %326, i64 %328
  %330 = load i32, i32* %329, align 4
  %331 = load i32, i32* %11, align 4
  %332 = lshr i32 %330, %331
  %333 = and i32 %332, 255
  %334 = trunc i32 %333 to i8
  %335 = load i8*, i8** %15, align 8
  %336 = getelementptr inbounds i8, i8* %335, i32 1
  store i8* %336, i8** %15, align 8
  store i8 %334, i8* %335, align 1
  %337 = load i32, i32* %18, align 4
  %338 = sub nsw i32 %337, 2
  store i32 %338, i32* %18, align 4
  br label %341

; <label>:339:                                    ; preds = %316
  %pgocount21 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 13)
  %340 = add i64 %pgocount21, 1
  store i64 %340, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 13)
  store i32 0, i32* %19, align 4
  br label %341

; <label>:341:                                    ; preds = %339, %319
  br label %342

; <label>:342:                                    ; preds = %341
  %343 = load i32, i32* %19, align 4
  %344 = load i32, i32* %12, align 4
  %345 = add nsw i32 %344, %343
  store i32 %345, i32* %12, align 4
  br label %94

; <label>:346:                                    ; preds = %94
  %pgocount22 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 18)
  %347 = add i64 %pgocount22, 1
  store i64 %347, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 18)
  br label %89

; <label>:348:                                    ; preds = %89
  %pgocount23 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 20)
  %349 = add i64 %pgocount23, 1
  store i64 %349, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogLuvEncode32, i64 0, i64 20)
  %350 = load i8*, i8** %15, align 8
  %351 = load %struct.tiff*, %struct.tiff** %6, align 8
  %352 = getelementptr inbounds %struct.tiff, %struct.tiff* %351, i32 0, i32 42
  store i8* %350, i8** %352, align 8
  %353 = load %struct.tiff*, %struct.tiff** %6, align 8
  %354 = getelementptr inbounds %struct.tiff, %struct.tiff* %353, i32 0, i32 41
  %355 = load i32, i32* %354, align 8
  %356 = load i32, i32* %18, align 4
  %357 = sub nsw i32 %355, %356
  %358 = load %struct.tiff*, %struct.tiff** %6, align 8
  %359 = getelementptr inbounds %struct.tiff, %struct.tiff* %358, i32 0, i32 43
  store i32 %357, i32* %359, align 8
  store i32 0, i32* %5, align 4
  br label %360

; <label>:360:                                    ; preds = %348, %275, %115
  %361 = load i32, i32* %5, align 4
  ret i32 %361
}

; Function Attrs: noinline nounwind uwtable
define internal void @Luv32fromXYZ(%struct.logLuvState*, i8*, i32) #0 {
  %4 = alloca %struct.logLuvState*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %8 = alloca float*, align 8
  store %struct.logLuvState* %0, %struct.logLuvState** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %9 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %10 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %9, i32 0, i32 2
  %11 = load i8**, i8*** %10, align 8
  %12 = bitcast i8** %11 to i32*
  store i32* %12, i32** %7, align 8
  %13 = load i8*, i8** %5, align 8
  %14 = bitcast i8* %13 to float*
  store float* %14, float** %8, align 8
  br label %15

; <label>:15:                                     ; preds = %19, %3
  %16 = load i32, i32* %6, align 4
  %17 = add nsw i32 %16, -1
  store i32 %17, i32* %6, align 4
  %18 = icmp sgt i32 %16, 0
  br i1 %18, label %19, label %27

; <label>:19:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32fromXYZ, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32fromXYZ, i64 0, i64 0)
  %21 = load float*, float** %8, align 8
  %22 = call i32 @pix32fromXYZ(float* %21)
  %23 = load i32*, i32** %7, align 8
  %24 = getelementptr inbounds i32, i32* %23, i32 1
  store i32* %24, i32** %7, align 8
  store i32 %22, i32* %23, align 4
  %25 = load float*, float** %8, align 8
  %26 = getelementptr inbounds float, float* %25, i64 3
  store float* %26, float** %8, align 8
  br label %15

; <label>:27:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32fromXYZ, i64 0, i64 1)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32fromXYZ, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Luv32fromLuv48(%struct.logLuvState*, i8*, i32) #0 {
  %4 = alloca %struct.logLuvState*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %8 = alloca i16*, align 8
  store %struct.logLuvState* %0, %struct.logLuvState** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %9 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %10 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %9, i32 0, i32 2
  %11 = load i8**, i8*** %10, align 8
  %12 = bitcast i8** %11 to i32*
  store i32* %12, i32** %7, align 8
  %13 = load i8*, i8** %5, align 8
  %14 = bitcast i8* %13 to i16*
  store i16* %14, i16** %8, align 8
  br label %15

; <label>:15:                                     ; preds = %19, %3
  %16 = load i32, i32* %6, align 4
  %17 = add nsw i32 %16, -1
  store i32 %17, i32* %6, align 4
  %18 = icmp sgt i32 %16, 0
  br i1 %18, label %19, label %46

; <label>:19:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32fromLuv48, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32fromLuv48, i64 0, i64 0)
  %21 = load i16*, i16** %8, align 8
  %22 = getelementptr inbounds i16, i16* %21, i64 0
  %23 = load i16, i16* %22, align 2
  %24 = sext i16 %23 to i32
  %25 = shl i32 %24, 16
  %26 = load i16*, i16** %8, align 8
  %27 = getelementptr inbounds i16, i16* %26, i64 1
  %28 = load i16, i16* %27, align 2
  %29 = sext i16 %28 to i32
  %30 = mul i32 %29, 410
  %31 = lshr i32 %30, 7
  %32 = and i32 %31, 65280
  %33 = or i32 %25, %32
  %34 = load i16*, i16** %8, align 8
  %35 = getelementptr inbounds i16, i16* %34, i64 2
  %36 = load i16, i16* %35, align 2
  %37 = sext i16 %36 to i32
  %38 = mul i32 %37, 410
  %39 = lshr i32 %38, 15
  %40 = and i32 %39, 255
  %41 = or i32 %33, %40
  %42 = load i32*, i32** %7, align 8
  %43 = getelementptr inbounds i32, i32* %42, i32 1
  store i32* %43, i32** %7, align 8
  store i32 %41, i32* %42, align 4
  %44 = load i16*, i16** %8, align 8
  %45 = getelementptr inbounds i16, i16* %44, i64 3
  store i16* %45, i16** %8, align 8
  br label %15

; <label>:46:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32fromLuv48, i64 0, i64 1)
  %47 = add i64 %pgocount1, 1
  store i64 %47, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Luv32fromLuv48, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LogL16Encode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca %struct.logLuvState*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %16 = alloca i16*, align 8
  %17 = alloca i16, align 2
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %22 = load %struct.tiff*, %struct.tiff** %6, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %22, i32 0, i32 37
  %24 = load i8*, i8** %23, align 8
  %25 = bitcast i8* %24 to %struct.logLuvState*
  store %struct.logLuvState* %25, %struct.logLuvState** %10, align 8
  store i32 0, i32* %19, align 4
  %26 = load i16, i16* %9, align 2
  %27 = zext i16 %26 to i32
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %30

; <label>:29:                                     ; preds = %4
  br label %33

; <label>:30:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 21)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 21)
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 359, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__PRETTY_FUNCTION__.LogL16Encode, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %33

; <label>:33:                                     ; preds = %32, %29
  %34 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %35 = icmp ne %struct.logLuvState* %34, null
  br i1 %35, label %36, label %37

; <label>:36:                                     ; preds = %33
  br label %40

; <label>:37:                                     ; preds = %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 22)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 22)
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 360, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__PRETTY_FUNCTION__.LogL16Encode, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %40

; <label>:40:                                     ; preds = %39, %36
  %41 = load i32, i32* %8, align 4
  %42 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %43 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %42, i32 0, i32 1
  %44 = load i32, i32* %43, align 4
  %45 = sdiv i32 %41, %44
  store i32 %45, i32* %14, align 4
  %46 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %47 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %46, i32 0, i32 0
  %48 = load i32, i32* %47, align 8
  %49 = icmp eq i32 %48, 1
  br i1 %49, label %50, label %54

; <label>:50:                                     ; preds = %40
  %pgocount2 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 15)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 15)
  %52 = load i8*, i8** %7, align 8
  %53 = bitcast i8* %52 to i16*
  store i16* %53, i16** %16, align 8
  br label %78

; <label>:54:                                     ; preds = %40
  %55 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %56 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %55, i32 0, i32 2
  %57 = load i8**, i8*** %56, align 8
  %58 = bitcast i8** %57 to i16*
  store i16* %58, i16** %16, align 8
  %59 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %60 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %59, i32 0, i32 3
  %61 = load i16, i16* %60, align 8
  %62 = sext i16 %61 to i32
  %63 = load i32, i32* %14, align 4
  %64 = icmp sge i32 %62, %63
  br i1 %64, label %65, label %66

; <label>:65:                                     ; preds = %54
  br label %69

; <label>:66:                                     ; preds = %54
  %pgocount3 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 23)
  %67 = add i64 %pgocount3, 1
  store i64 %67, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 23)
  call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 367, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__PRETTY_FUNCTION__.LogL16Encode, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %69

; <label>:69:                                     ; preds = %68, %65
  %pgocount4 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 16)
  %70 = add i64 %pgocount4, 1
  store i64 %70, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 16)
  %71 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %72 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %71, i32 0, i32 4
  %73 = load void (%struct.logLuvState*, i8*, i32)*, void (%struct.logLuvState*, i8*, i32)** %72, align 8
  %74 = load %struct.logLuvState*, %struct.logLuvState** %10, align 8
  %75 = load i8*, i8** %7, align 8
  %76 = load i32, i32* %14, align 4
  %77 = ptrtoint void (%struct.logLuvState*, i8*, i32)* %73 to i64
  call void @__llvm_profile_instrument_target(i64 %77, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LogL16Encode to i8*), i32 0)
  call void %73(%struct.logLuvState* %74, i8* %75, i32 %76)
  br label %78

; <label>:78:                                     ; preds = %69, %50
  %79 = load %struct.tiff*, %struct.tiff** %6, align 8
  %80 = getelementptr inbounds %struct.tiff, %struct.tiff* %79, i32 0, i32 42
  %81 = load i8*, i8** %80, align 8
  store i8* %81, i8** %15, align 8
  %82 = load %struct.tiff*, %struct.tiff** %6, align 8
  %83 = getelementptr inbounds %struct.tiff, %struct.tiff* %82, i32 0, i32 41
  %84 = load i32, i32* %83, align 8
  %85 = load %struct.tiff*, %struct.tiff** %6, align 8
  %86 = getelementptr inbounds %struct.tiff, %struct.tiff* %85, i32 0, i32 43
  %87 = load i32, i32* %86, align 8
  %88 = sub nsw i32 %84, %87
  store i32 %88, i32* %18, align 4
  store i32 16, i32* %11, align 4
  br label %89

; <label>:89:                                     ; preds = %357, %78
  %90 = load i32, i32* %11, align 4
  %91 = sub nsw i32 %90, 8
  store i32 %91, i32* %11, align 4
  %92 = icmp sge i32 %91, 0
  br i1 %92, label %93, label %359

; <label>:93:                                     ; preds = %89
  store i32 0, i32* %12, align 4
  br label %94

; <label>:94:                                     ; preds = %353, %93
  %95 = load i32, i32* %12, align 4
  %96 = load i32, i32* %14, align 4
  %97 = icmp slt i32 %95, %96
  br i1 %97, label %98, label %357

; <label>:98:                                     ; preds = %94
  %99 = load i32, i32* %18, align 4
  %100 = icmp slt i32 %99, 4
  br i1 %100, label %101, label %129

; <label>:101:                                    ; preds = %98
  %102 = load i8*, i8** %15, align 8
  %103 = load %struct.tiff*, %struct.tiff** %6, align 8
  %104 = getelementptr inbounds %struct.tiff, %struct.tiff* %103, i32 0, i32 42
  store i8* %102, i8** %104, align 8
  %105 = load %struct.tiff*, %struct.tiff** %6, align 8
  %106 = getelementptr inbounds %struct.tiff, %struct.tiff* %105, i32 0, i32 41
  %107 = load i32, i32* %106, align 8
  %108 = load i32, i32* %18, align 4
  %109 = sub nsw i32 %107, %108
  %110 = load %struct.tiff*, %struct.tiff** %6, align 8
  %111 = getelementptr inbounds %struct.tiff, %struct.tiff* %110, i32 0, i32 43
  store i32 %109, i32* %111, align 8
  %112 = load %struct.tiff*, %struct.tiff** %6, align 8
  %113 = call i32 @TIFFFlushData1(%struct.tiff* %112)
  %114 = icmp ne i32 %113, 0
  br i1 %114, label %117, label %115

; <label>:115:                                    ; preds = %101
  %pgocount5 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 19)
  %116 = add i64 %pgocount5, 1
  store i64 %116, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 19)
  store i32 -1, i32* %5, align 4
  br label %371

; <label>:117:                                    ; preds = %101
  %pgocount6 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 11)
  %118 = add i64 %pgocount6, 1
  store i64 %118, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 11)
  %119 = load %struct.tiff*, %struct.tiff** %6, align 8
  %120 = getelementptr inbounds %struct.tiff, %struct.tiff* %119, i32 0, i32 42
  %121 = load i8*, i8** %120, align 8
  store i8* %121, i8** %15, align 8
  %122 = load %struct.tiff*, %struct.tiff** %6, align 8
  %123 = getelementptr inbounds %struct.tiff, %struct.tiff* %122, i32 0, i32 41
  %124 = load i32, i32* %123, align 8
  %125 = load %struct.tiff*, %struct.tiff** %6, align 8
  %126 = getelementptr inbounds %struct.tiff, %struct.tiff* %125, i32 0, i32 43
  %127 = load i32, i32* %126, align 8
  %128 = sub nsw i32 %124, %127
  store i32 %128, i32* %18, align 4
  br label %129

; <label>:129:                                    ; preds = %117, %98
  %130 = load i32, i32* %11, align 4
  %131 = shl i32 255, %130
  store i32 %131, i32* %20, align 4
  %132 = load i32, i32* %12, align 4
  store i32 %132, i32* %21, align 4
  br label %133

; <label>:133:                                    ; preds = %185, %129
  %134 = load i32, i32* %21, align 4
  %135 = load i32, i32* %14, align 4
  %136 = icmp slt i32 %134, %135
  br i1 %136, label %137, label %189

; <label>:137:                                    ; preds = %133
  %138 = load i16*, i16** %16, align 8
  %139 = load i32, i32* %21, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i16, i16* %138, i64 %140
  %142 = load i16, i16* %141, align 2
  %143 = sext i16 %142 to i32
  %144 = load i32, i32* %20, align 4
  %145 = and i32 %143, %144
  %146 = trunc i32 %145 to i16
  store i16 %146, i16* %17, align 2
  store i32 1, i32* %19, align 4
  br label %147

; <label>:147:                                    ; preds = %174, %137
  %148 = load i32, i32* %19, align 4
  %149 = icmp slt i32 %148, 129
  br i1 %149, label %150, label %172

; <label>:150:                                    ; preds = %147
  %pgocount7 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 0)
  %151 = add i64 %pgocount7, 1
  store i64 %151, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 0)
  %152 = load i32, i32* %21, align 4
  %153 = load i32, i32* %19, align 4
  %154 = add nsw i32 %152, %153
  %155 = load i32, i32* %14, align 4
  %156 = icmp slt i32 %154, %155
  br i1 %156, label %157, label %172

; <label>:157:                                    ; preds = %150
  %pgocount8 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 1)
  %158 = add i64 %pgocount8, 1
  store i64 %158, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 1)
  %159 = load i16*, i16** %16, align 8
  %160 = load i32, i32* %21, align 4
  %161 = load i32, i32* %19, align 4
  %162 = add nsw i32 %160, %161
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i16, i16* %159, i64 %163
  %165 = load i16, i16* %164, align 2
  %166 = sext i16 %165 to i32
  %167 = load i32, i32* %20, align 4
  %168 = and i32 %166, %167
  %169 = load i16, i16* %17, align 2
  %170 = sext i16 %169 to i32
  %171 = icmp eq i32 %168, %170
  br label %172

; <label>:172:                                    ; preds = %157, %150, %147
  %173 = phi i1 [ false, %150 ], [ false, %147 ], [ %171, %157 ]
  br i1 %173, label %174, label %178

; <label>:174:                                    ; preds = %172
  %pgocount9 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 2)
  %175 = add i64 %pgocount9, 1
  store i64 %175, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 2)
  %176 = load i32, i32* %19, align 4
  %177 = add nsw i32 %176, 1
  store i32 %177, i32* %19, align 4
  br label %147

; <label>:178:                                    ; preds = %172
  %179 = load i32, i32* %19, align 4
  %180 = icmp sge i32 %179, 4
  br i1 %180, label %181, label %183

; <label>:181:                                    ; preds = %178
  %pgocount10 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 10)
  %182 = add i64 %pgocount10, 1
  store i64 %182, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 10)
  br label %189

; <label>:183:                                    ; preds = %178
  %pgocount11 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 3)
  %184 = add i64 %pgocount11, 1
  store i64 %184, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 3)
  br label %185

; <label>:185:                                    ; preds = %183
  %186 = load i32, i32* %19, align 4
  %187 = load i32, i32* %21, align 4
  %188 = add nsw i32 %187, %186
  store i32 %188, i32* %21, align 4
  br label %133

; <label>:189:                                    ; preds = %181, %133
  %190 = load i32, i32* %21, align 4
  %191 = load i32, i32* %12, align 4
  %192 = sub nsw i32 %190, %191
  %193 = icmp sgt i32 %192, 1
  br i1 %193, label %194, label %252

; <label>:194:                                    ; preds = %189
  %pgocount12 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 9)
  %195 = add i64 %pgocount12, 1
  store i64 %195, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 9)
  %196 = load i32, i32* %21, align 4
  %197 = load i32, i32* %12, align 4
  %198 = sub nsw i32 %196, %197
  %199 = icmp slt i32 %198, 4
  br i1 %199, label %200, label %252

; <label>:200:                                    ; preds = %194
  %201 = load i16*, i16** %16, align 8
  %202 = load i32, i32* %12, align 4
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds i16, i16* %201, i64 %203
  %205 = load i16, i16* %204, align 2
  %206 = sext i16 %205 to i32
  %207 = load i32, i32* %20, align 4
  %208 = and i32 %206, %207
  %209 = trunc i32 %208 to i16
  store i16 %209, i16* %17, align 2
  %210 = load i32, i32* %12, align 4
  %211 = add nsw i32 %210, 1
  store i32 %211, i32* %13, align 4
  br label %212

; <label>:212:                                    ; preds = %248, %200
  %213 = load i16*, i16** %16, align 8
  %214 = load i32, i32* %13, align 4
  %215 = add nsw i32 %214, 1
  store i32 %215, i32* %13, align 4
  %216 = sext i32 %214 to i64
  %217 = getelementptr inbounds i16, i16* %213, i64 %216
  %218 = load i16, i16* %217, align 2
  %219 = sext i16 %218 to i32
  %220 = load i32, i32* %20, align 4
  %221 = and i32 %219, %220
  %222 = load i16, i16* %17, align 2
  %223 = sext i16 %222 to i32
  %224 = icmp eq i32 %221, %223
  br i1 %224, label %225, label %250

; <label>:225:                                    ; preds = %212
  %226 = load i32, i32* %13, align 4
  %227 = load i32, i32* %21, align 4
  %228 = icmp eq i32 %226, %227
  br i1 %228, label %229, label %248

; <label>:229:                                    ; preds = %225
  %pgocount13 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 17)
  %230 = add i64 %pgocount13, 1
  store i64 %230, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 17)
  %231 = load i32, i32* %13, align 4
  %232 = add nsw i32 126, %231
  %233 = load i32, i32* %12, align 4
  %234 = sub nsw i32 %232, %233
  %235 = trunc i32 %234 to i8
  %236 = load i8*, i8** %15, align 8
  %237 = getelementptr inbounds i8, i8* %236, i32 1
  store i8* %237, i8** %15, align 8
  store i8 %235, i8* %236, align 1
  %238 = load i16, i16* %17, align 2
  %239 = sext i16 %238 to i32
  %240 = load i32, i32* %11, align 4
  %241 = ashr i32 %239, %240
  %242 = trunc i32 %241 to i8
  %243 = load i8*, i8** %15, align 8
  %244 = getelementptr inbounds i8, i8* %243, i32 1
  store i8* %244, i8** %15, align 8
  store i8 %242, i8* %243, align 1
  %245 = load i32, i32* %18, align 4
  %246 = sub nsw i32 %245, 2
  store i32 %246, i32* %18, align 4
  %247 = load i32, i32* %21, align 4
  store i32 %247, i32* %12, align 4
  br label %250

; <label>:248:                                    ; preds = %225
  %pgocount14 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 7)
  %249 = add i64 %pgocount14, 1
  store i64 %249, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 7)
  br label %212

; <label>:250:                                    ; preds = %229, %212
  %pgocount15 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 14)
  %251 = add i64 %pgocount15, 1
  store i64 %251, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 14)
  br label %252

; <label>:252:                                    ; preds = %250, %194, %189
  br label %253

; <label>:253:                                    ; preds = %325, %252
  %254 = load i32, i32* %12, align 4
  %255 = load i32, i32* %21, align 4
  %256 = icmp slt i32 %254, %255
  br i1 %256, label %257, label %326

; <label>:257:                                    ; preds = %253
  %258 = load i32, i32* %21, align 4
  %259 = load i32, i32* %12, align 4
  %260 = sub nsw i32 %258, %259
  store i32 %260, i32* %13, align 4
  %261 = icmp sgt i32 %260, 127
  br i1 %261, label %262, label %264

; <label>:262:                                    ; preds = %257
  %pgocount16 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 5)
  %263 = add i64 %pgocount16, 1
  store i64 %263, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 5)
  store i32 127, i32* %13, align 4
  br label %264

; <label>:264:                                    ; preds = %262, %257
  %265 = load i32, i32* %18, align 4
  %266 = load i32, i32* %13, align 4
  %267 = add nsw i32 %266, 3
  %268 = icmp slt i32 %265, %267
  br i1 %268, label %270, label %._crit_edge

._crit_edge:                                      ; preds = %264
  %pgocount17 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 4)
  %269 = add i64 %pgocount17, 1
  store i64 %269, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 4)
  br label %297

; <label>:270:                                    ; preds = %264
  %271 = load i8*, i8** %15, align 8
  %272 = load %struct.tiff*, %struct.tiff** %6, align 8
  %273 = getelementptr inbounds %struct.tiff, %struct.tiff* %272, i32 0, i32 42
  store i8* %271, i8** %273, align 8
  %274 = load %struct.tiff*, %struct.tiff** %6, align 8
  %275 = getelementptr inbounds %struct.tiff, %struct.tiff* %274, i32 0, i32 41
  %276 = load i32, i32* %275, align 8
  %277 = load i32, i32* %18, align 4
  %278 = sub nsw i32 %276, %277
  %279 = load %struct.tiff*, %struct.tiff** %6, align 8
  %280 = getelementptr inbounds %struct.tiff, %struct.tiff* %279, i32 0, i32 43
  store i32 %278, i32* %280, align 8
  %281 = load %struct.tiff*, %struct.tiff** %6, align 8
  %282 = call i32 @TIFFFlushData1(%struct.tiff* %281)
  %283 = icmp ne i32 %282, 0
  br i1 %283, label %285, label %284

; <label>:284:                                    ; preds = %270
  store i32 -1, i32* %5, align 4
  br label %371

; <label>:285:                                    ; preds = %270
  %pgocount18 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 6)
  %286 = add i64 %pgocount18, 1
  store i64 %286, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 6)
  %287 = load %struct.tiff*, %struct.tiff** %6, align 8
  %288 = getelementptr inbounds %struct.tiff, %struct.tiff* %287, i32 0, i32 42
  %289 = load i8*, i8** %288, align 8
  store i8* %289, i8** %15, align 8
  %290 = load %struct.tiff*, %struct.tiff** %6, align 8
  %291 = getelementptr inbounds %struct.tiff, %struct.tiff* %290, i32 0, i32 41
  %292 = load i32, i32* %291, align 8
  %293 = load %struct.tiff*, %struct.tiff** %6, align 8
  %294 = getelementptr inbounds %struct.tiff, %struct.tiff* %293, i32 0, i32 43
  %295 = load i32, i32* %294, align 8
  %296 = sub nsw i32 %292, %295
  store i32 %296, i32* %18, align 4
  br label %297

; <label>:297:                                    ; preds = %._crit_edge, %285
  %298 = load i32, i32* %13, align 4
  %299 = trunc i32 %298 to i8
  %300 = load i8*, i8** %15, align 8
  %301 = getelementptr inbounds i8, i8* %300, i32 1
  store i8* %301, i8** %15, align 8
  store i8 %299, i8* %300, align 1
  %302 = load i32, i32* %18, align 4
  %303 = add nsw i32 %302, -1
  store i32 %303, i32* %18, align 4
  br label %304

; <label>:304:                                    ; preds = %308, %297
  %305 = load i32, i32* %13, align 4
  %306 = add nsw i32 %305, -1
  store i32 %306, i32* %13, align 4
  %307 = icmp ne i32 %305, 0
  br i1 %307, label %308, label %325

; <label>:308:                                    ; preds = %304
  %pgocount19 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 8)
  %309 = add i64 %pgocount19, 1
  store i64 %309, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 8)
  %310 = load i16*, i16** %16, align 8
  %311 = load i32, i32* %12, align 4
  %312 = add nsw i32 %311, 1
  store i32 %312, i32* %12, align 4
  %313 = sext i32 %311 to i64
  %314 = getelementptr inbounds i16, i16* %310, i64 %313
  %315 = load i16, i16* %314, align 2
  %316 = sext i16 %315 to i32
  %317 = load i32, i32* %11, align 4
  %318 = ashr i32 %316, %317
  %319 = and i32 %318, 255
  %320 = trunc i32 %319 to i8
  %321 = load i8*, i8** %15, align 8
  %322 = getelementptr inbounds i8, i8* %321, i32 1
  store i8* %322, i8** %15, align 8
  store i8 %320, i8* %321, align 1
  %323 = load i32, i32* %18, align 4
  %324 = add nsw i32 %323, -1
  store i32 %324, i32* %18, align 4
  br label %304

; <label>:325:                                    ; preds = %304
  br label %253

; <label>:326:                                    ; preds = %253
  %327 = load i32, i32* %19, align 4
  %328 = icmp sge i32 %327, 4
  br i1 %328, label %329, label %350

; <label>:329:                                    ; preds = %326
  %pgocount20 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 12)
  %330 = add i64 %pgocount20, 1
  store i64 %330, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 12)
  %331 = load i32, i32* %19, align 4
  %332 = add nsw i32 126, %331
  %333 = trunc i32 %332 to i8
  %334 = load i8*, i8** %15, align 8
  %335 = getelementptr inbounds i8, i8* %334, i32 1
  store i8* %335, i8** %15, align 8
  store i8 %333, i8* %334, align 1
  %336 = load i16*, i16** %16, align 8
  %337 = load i32, i32* %21, align 4
  %338 = sext i32 %337 to i64
  %339 = getelementptr inbounds i16, i16* %336, i64 %338
  %340 = load i16, i16* %339, align 2
  %341 = sext i16 %340 to i32
  %342 = load i32, i32* %11, align 4
  %343 = ashr i32 %341, %342
  %344 = and i32 %343, 255
  %345 = trunc i32 %344 to i8
  %346 = load i8*, i8** %15, align 8
  %347 = getelementptr inbounds i8, i8* %346, i32 1
  store i8* %347, i8** %15, align 8
  store i8 %345, i8* %346, align 1
  %348 = load i32, i32* %18, align 4
  %349 = sub nsw i32 %348, 2
  store i32 %349, i32* %18, align 4
  br label %352

; <label>:350:                                    ; preds = %326
  %pgocount21 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 13)
  %351 = add i64 %pgocount21, 1
  store i64 %351, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 13)
  store i32 0, i32* %19, align 4
  br label %352

; <label>:352:                                    ; preds = %350, %329
  br label %353

; <label>:353:                                    ; preds = %352
  %354 = load i32, i32* %19, align 4
  %355 = load i32, i32* %12, align 4
  %356 = add nsw i32 %355, %354
  store i32 %356, i32* %12, align 4
  br label %94

; <label>:357:                                    ; preds = %94
  %pgocount22 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 18)
  %358 = add i64 %pgocount22, 1
  store i64 %358, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 18)
  br label %89

; <label>:359:                                    ; preds = %89
  %pgocount23 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 20)
  %360 = add i64 %pgocount23, 1
  store i64 %360, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_LogL16Encode, i64 0, i64 20)
  %361 = load i8*, i8** %15, align 8
  %362 = load %struct.tiff*, %struct.tiff** %6, align 8
  %363 = getelementptr inbounds %struct.tiff, %struct.tiff* %362, i32 0, i32 42
  store i8* %361, i8** %363, align 8
  %364 = load %struct.tiff*, %struct.tiff** %6, align 8
  %365 = getelementptr inbounds %struct.tiff, %struct.tiff* %364, i32 0, i32 41
  %366 = load i32, i32* %365, align 8
  %367 = load i32, i32* %18, align 4
  %368 = sub nsw i32 %366, %367
  %369 = load %struct.tiff*, %struct.tiff** %6, align 8
  %370 = getelementptr inbounds %struct.tiff, %struct.tiff* %369, i32 0, i32 43
  store i32 %368, i32* %370, align 8
  store i32 0, i32* %5, align 4
  br label %371

; <label>:371:                                    ; preds = %359, %284, %115
  %372 = load i32, i32* %5, align 4
  ret i32 %372
}

; Function Attrs: noinline nounwind uwtable
define internal void @L16fromY(%struct.logLuvState*, i8*, i32) #0 {
  %4 = alloca %struct.logLuvState*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i16*, align 8
  %8 = alloca float*, align 8
  store %struct.logLuvState* %0, %struct.logLuvState** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %9 = load %struct.logLuvState*, %struct.logLuvState** %4, align 8
  %10 = getelementptr inbounds %struct.logLuvState, %struct.logLuvState* %9, i32 0, i32 2
  %11 = load i8**, i8*** %10, align 8
  %12 = bitcast i8** %11 to i16*
  store i16* %12, i16** %7, align 8
  %13 = load i8*, i8** %5, align 8
  %14 = bitcast i8* %13 to float*
  store float* %14, float** %8, align 8
  br label %15

; <label>:15:                                     ; preds = %19, %3
  %16 = load i32, i32* %6, align 4
  %17 = add nsw i32 %16, -1
  store i32 %17, i32* %6, align 4
  %18 = icmp sgt i32 %16, 0
  br i1 %18, label %19, label %29

; <label>:19:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_L16fromY, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_L16fromY, i64 0, i64 0)
  %21 = load float*, float** %8, align 8
  %22 = getelementptr inbounds float, float* %21, i32 1
  store float* %22, float** %8, align 8
  %23 = load float, float* %21, align 4
  %24 = fpext float %23 to double
  %25 = call i32 @pix16fromY(double %24)
  %26 = trunc i32 %25 to i16
  %27 = load i16*, i16** %7, align 8
  %28 = getelementptr inbounds i16, i16* %27, i32 1
  store i16* %28, i16** %7, align 8
  store i16 %26, i16* %27, align 2
  br label %15

; <label>:29:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_L16fromY, i64 0, i64 1)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_L16fromY, i64 0, i64 1)
  ret void
}

declare i32 @TIFFFlushData1(%struct.tiff*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @pix24fromXYZ(float*) #0 {
  %2 = alloca float*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  store float* %0, float** %2, align 8
  %9 = load float*, float** %2, align 8
  %10 = getelementptr inbounds float, float* %9, i64 1
  %11 = load float, float* %10, align 4
  %12 = fpext float %11 to double
  store double %12, double* %5, align 8
  %13 = load double, double* %5, align 8
  %14 = fcmp oge double %13, 1.600000e+01
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix24fromXYZ, i64 0, i64 0)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix24fromXYZ, i64 0, i64 0)
  store i32 1023, i32* %3, align 4
  br label %31

; <label>:17:                                     ; preds = %1
  %18 = load double, double* %5, align 8
  %19 = fcmp ole double %18, 0x3F30000000000000
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix24fromXYZ, i64 0, i64 3)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix24fromXYZ, i64 0, i64 3)
  store i32 0, i32* %3, align 4
  br label %30

; <label>:22:                                     ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix24fromXYZ, i64 0, i64 4)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix24fromXYZ, i64 0, i64 4)
  %24 = load double, double* %5, align 8
  %25 = call double @log(double %24) #5
  %26 = fmul double 0x3FF71547652B82FE, %25
  %27 = fadd double %26, 1.200000e+01
  %28 = fmul double 6.400000e+01, %27
  %29 = fptosi double %28 to i32
  store i32 %29, i32* %3, align 4
  br label %30

; <label>:30:                                     ; preds = %22, %20
  br label %31

; <label>:31:                                     ; preds = %30, %15
  %32 = load float*, float** %2, align 8
  %33 = getelementptr inbounds float, float* %32, i64 0
  %34 = load float, float* %33, align 4
  %35 = fpext float %34 to double
  %36 = load float*, float** %2, align 8
  %37 = getelementptr inbounds float, float* %36, i64 1
  %38 = load float, float* %37, align 4
  %39 = fpext float %38 to double
  %40 = fmul double 1.500000e+01, %39
  %41 = fadd double %35, %40
  %42 = load float*, float** %2, align 8
  %43 = getelementptr inbounds float, float* %42, i64 2
  %44 = load float, float* %43, align 4
  %45 = fpext float %44 to double
  %46 = fmul double 3.000000e+00, %45
  %47 = fadd double %41, %46
  store double %47, double* %8, align 8
  %48 = load double, double* %8, align 8
  %49 = fcmp oeq double %48, 0.000000e+00
  br i1 %49, label %50, label %51

; <label>:50:                                     ; preds = %31
  store double 0x3FCAF286BD156C1A, double* %6, align 8
  store double 0x3FDE50D794B8199E, double* %7, align 8
  br label %67

; <label>:51:                                     ; preds = %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix24fromXYZ, i64 0, i64 1)
  %52 = add i64 %pgocount3, 1
  store i64 %52, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix24fromXYZ, i64 0, i64 1)
  %53 = load float*, float** %2, align 8
  %54 = getelementptr inbounds float, float* %53, i64 0
  %55 = load float, float* %54, align 4
  %56 = fpext float %55 to double
  %57 = fmul double 4.000000e+00, %56
  %58 = load double, double* %8, align 8
  %59 = fdiv double %57, %58
  store double %59, double* %6, align 8
  %60 = load float*, float** %2, align 8
  %61 = getelementptr inbounds float, float* %60, i64 1
  %62 = load float, float* %61, align 4
  %63 = fpext float %62 to double
  %64 = fmul double 9.000000e+00, %63
  %65 = load double, double* %8, align 8
  %66 = fdiv double %64, %65
  store double %66, double* %7, align 8
  br label %67

; <label>:67:                                     ; preds = %51, %50
  %68 = load double, double* %6, align 8
  %69 = load double, double* %7, align 8
  %70 = call i32 @uv_encode(double %68, double %69)
  store i32 %70, i32* %4, align 4
  %71 = load i32, i32* %4, align 4
  %72 = icmp slt i32 %71, 0
  br i1 %72, label %73, label %76

; <label>:73:                                     ; preds = %67
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix24fromXYZ, i64 0, i64 2)
  %74 = add i64 %pgocount4, 1
  store i64 %74, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix24fromXYZ, i64 0, i64 2)
  %75 = call i32 @uv_encode(double 0x3FCAF286BD156C1A, double 0x3FDE50D794B8199E)
  store i32 %75, i32* %4, align 4
  br label %76

; <label>:76:                                     ; preds = %73, %67
  %77 = load i32, i32* %3, align 4
  %78 = shl i32 %77, 14
  %79 = load i32, i32* %4, align 4
  %80 = or i32 %78, %79
  ret i32 %80
}

; Function Attrs: nounwind
declare double @log(double) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @uv_encode(double, double) #0 {
  %3 = alloca i32, align 4
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store double %0, double* %4, align 8
  store double %1, double* %5, align 8
  %8 = load double, double* %5, align 8
  %9 = fcmp olt double %8, 0x3F9158B820000000
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_uv_encode, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_uv_encode, i64 0, i64 0)
  store i32 -1, i32* %3, align 4
  br label %63

; <label>:12:                                     ; preds = %2
  %13 = load double, double* %5, align 8
  %14 = fsub double %13, 0x3F9158B820000000
  %15 = fmul double %14, 0x4071DB6DAD9C14EB
  %16 = fptosi double %15 to i32
  store i32 %16, i32* %6, align 4
  %17 = load i32, i32* %6, align 4
  %18 = icmp sge i32 %17, 163
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_uv_encode, i64 0, i64 1)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_uv_encode, i64 0, i64 1)
  store i32 -1, i32* %3, align 4
  br label %63

; <label>:21:                                     ; preds = %12
  %22 = load double, double* %4, align 8
  %23 = load i32, i32* %6, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [163 x %struct.anon], [163 x %struct.anon]* @uv_row, i64 0, i64 %24
  %26 = getelementptr inbounds %struct.anon, %struct.anon* %25, i32 0, i32 0
  %27 = load float, float* %26, align 8
  %28 = fpext float %27 to double
  %29 = fcmp olt double %22, %28
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_uv_encode, i64 0, i64 2)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_uv_encode, i64 0, i64 2)
  store i32 -1, i32* %3, align 4
  br label %63

; <label>:32:                                     ; preds = %21
  %33 = load double, double* %4, align 8
  %34 = load i32, i32* %6, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [163 x %struct.anon], [163 x %struct.anon]* @uv_row, i64 0, i64 %35
  %37 = getelementptr inbounds %struct.anon, %struct.anon* %36, i32 0, i32 0
  %38 = load float, float* %37, align 8
  %39 = fpext float %38 to double
  %40 = fsub double %33, %39
  %41 = fmul double %40, 0x4071DB6DAD9C14EB
  %42 = fptosi double %41 to i32
  store i32 %42, i32* %7, align 4
  %43 = load i32, i32* %7, align 4
  %44 = load i32, i32* %6, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [163 x %struct.anon], [163 x %struct.anon]* @uv_row, i64 0, i64 %45
  %47 = getelementptr inbounds %struct.anon, %struct.anon* %46, i32 0, i32 1
  %48 = load i16, i16* %47, align 4
  %49 = sext i16 %48 to i32
  %50 = icmp sge i32 %43, %49
  br i1 %50, label %51, label %53

; <label>:51:                                     ; preds = %32
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_uv_encode, i64 0, i64 3)
  %52 = add i64 %pgocount3, 1
  store i64 %52, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_uv_encode, i64 0, i64 3)
  store i32 -1, i32* %3, align 4
  br label %63

; <label>:53:                                     ; preds = %32
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_uv_encode, i64 0, i64 4)
  %54 = add i64 %pgocount4, 1
  store i64 %54, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_uv_encode, i64 0, i64 4)
  %55 = load i32, i32* %6, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [163 x %struct.anon], [163 x %struct.anon]* @uv_row, i64 0, i64 %56
  %58 = getelementptr inbounds %struct.anon, %struct.anon* %57, i32 0, i32 2
  %59 = load i16, i16* %58, align 2
  %60 = sext i16 %59 to i32
  %61 = load i32, i32* %7, align 4
  %62 = add nsw i32 %60, %61
  store i32 %62, i32* %3, align 4
  br label %63

; <label>:63:                                     ; preds = %53, %51, %30, %19, %10
  %64 = load i32, i32* %3, align 4
  ret i32 %64
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @pix32fromXYZ(float*) #0 {
  %2 = alloca float*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  store float* %0, float** %2, align 8
  %9 = load float*, float** %2, align 8
  %10 = getelementptr inbounds float, float* %9, i64 1
  %11 = load float, float* %10, align 4
  %12 = fpext float %11 to double
  %13 = call i32 @pix16fromY(double %12)
  store i32 %13, i32* %3, align 4
  %14 = load float*, float** %2, align 8
  %15 = getelementptr inbounds float, float* %14, i64 0
  %16 = load float, float* %15, align 4
  %17 = fpext float %16 to double
  %18 = load float*, float** %2, align 8
  %19 = getelementptr inbounds float, float* %18, i64 1
  %20 = load float, float* %19, align 4
  %21 = fpext float %20 to double
  %22 = fmul double 1.500000e+01, %21
  %23 = fadd double %17, %22
  %24 = load float*, float** %2, align 8
  %25 = getelementptr inbounds float, float* %24, i64 2
  %26 = load float, float* %25, align 4
  %27 = fpext float %26 to double
  %28 = fmul double 3.000000e+00, %27
  %29 = fadd double %23, %28
  store double %29, double* %8, align 8
  %30 = load double, double* %8, align 8
  %31 = fcmp oeq double %30, 0.000000e+00
  br i1 %31, label %32, label %33

; <label>:32:                                     ; preds = %1
  store double 0x3FCAF286BD156C1A, double* %6, align 8
  store double 0x3FDE50D794B8199E, double* %7, align 8
  br label %49

; <label>:33:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_pix32fromXYZ, i64 0, i64 5)
  %34 = add i64 %pgocount, 1
  store i64 %34, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_pix32fromXYZ, i64 0, i64 5)
  %35 = load float*, float** %2, align 8
  %36 = getelementptr inbounds float, float* %35, i64 0
  %37 = load float, float* %36, align 4
  %38 = fpext float %37 to double
  %39 = fmul double 4.000000e+00, %38
  %40 = load double, double* %8, align 8
  %41 = fdiv double %39, %40
  store double %41, double* %6, align 8
  %42 = load float*, float** %2, align 8
  %43 = getelementptr inbounds float, float* %42, i64 1
  %44 = load float, float* %43, align 4
  %45 = fpext float %44 to double
  %46 = fmul double 9.000000e+00, %45
  %47 = load double, double* %8, align 8
  %48 = fdiv double %46, %47
  store double %48, double* %7, align 8
  br label %49

; <label>:49:                                     ; preds = %33, %32
  %50 = load double, double* %6, align 8
  %51 = fcmp ole double %50, 0.000000e+00
  br i1 %51, label %52, label %53

; <label>:52:                                     ; preds = %49
  store i32 0, i32* %4, align 4
  br label %58

; <label>:53:                                     ; preds = %49
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_pix32fromXYZ, i64 0, i64 0)
  %54 = add i64 %pgocount1, 1
  store i64 %54, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_pix32fromXYZ, i64 0, i64 0)
  %55 = load double, double* %6, align 8
  %56 = fmul double 4.100000e+02, %55
  %57 = fptoui double %56 to i32
  store i32 %57, i32* %4, align 4
  br label %58

; <label>:58:                                     ; preds = %53, %52
  %59 = load i32, i32* %4, align 4
  %60 = icmp ugt i32 %59, 255
  br i1 %60, label %61, label %63

; <label>:61:                                     ; preds = %58
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_pix32fromXYZ, i64 0, i64 1)
  %62 = add i64 %pgocount2, 1
  store i64 %62, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_pix32fromXYZ, i64 0, i64 1)
  store i32 255, i32* %4, align 4
  br label %63

; <label>:63:                                     ; preds = %61, %58
  %64 = load double, double* %7, align 8
  %65 = fcmp ole double %64, 0.000000e+00
  br i1 %65, label %66, label %68

; <label>:66:                                     ; preds = %63
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_pix32fromXYZ, i64 0, i64 2)
  %67 = add i64 %pgocount3, 1
  store i64 %67, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_pix32fromXYZ, i64 0, i64 2)
  store i32 0, i32* %5, align 4
  br label %73

; <label>:68:                                     ; preds = %63
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_pix32fromXYZ, i64 0, i64 3)
  %69 = add i64 %pgocount4, 1
  store i64 %69, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_pix32fromXYZ, i64 0, i64 3)
  %70 = load double, double* %7, align 8
  %71 = fmul double 4.100000e+02, %70
  %72 = fptoui double %71 to i32
  store i32 %72, i32* %5, align 4
  br label %73

; <label>:73:                                     ; preds = %68, %66
  %74 = load i32, i32* %5, align 4
  %75 = icmp ugt i32 %74, 255
  br i1 %75, label %76, label %78

; <label>:76:                                     ; preds = %73
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_pix32fromXYZ, i64 0, i64 4)
  %77 = add i64 %pgocount5, 1
  store i64 %77, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_pix32fromXYZ, i64 0, i64 4)
  store i32 255, i32* %5, align 4
  br label %78

; <label>:78:                                     ; preds = %76, %73
  %79 = load i32, i32* %3, align 4
  %80 = shl i32 %79, 16
  %81 = load i32, i32* %4, align 4
  %82 = shl i32 %81, 8
  %83 = or i32 %80, %82
  %84 = load i32, i32* %5, align 4
  %85 = or i32 %83, %84
  ret i32 %85
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @pix16fromY(double) #0 {
  %2 = alloca i32, align 4
  %3 = alloca double, align 8
  store double %0, double* %3, align 8
  %4 = load double, double* %3, align 8
  %5 = fcmp oge double %4, 1.844670e+19
  br i1 %5, label %6, label %8

; <label>:6:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix16fromY, i64 0, i64 0)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix16fromY, i64 0, i64 0)
  store i32 32767, i32* %2, align 4
  br label %39

; <label>:8:                                      ; preds = %1
  %9 = load double, double* %3, align 8
  %10 = fcmp ole double %9, -1.844670e+19
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix16fromY, i64 0, i64 1)
  %12 = add i64 %pgocount1, 1
  store i64 %12, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix16fromY, i64 0, i64 1)
  store i32 65535, i32* %2, align 4
  br label %39

; <label>:13:                                     ; preds = %8
  %14 = load double, double* %3, align 8
  %15 = fcmp ogt double %14, 5.435710e-20
  br i1 %15, label %16, label %24

; <label>:16:                                     ; preds = %13
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix16fromY, i64 0, i64 2)
  %17 = add i64 %pgocount2, 1
  store i64 %17, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix16fromY, i64 0, i64 2)
  %18 = load double, double* %3, align 8
  %19 = call double @log(double %18) #5
  %20 = fmul double 0x3FF71547652B82FE, %19
  %21 = fadd double %20, 6.400000e+01
  %22 = fmul double 2.560000e+02, %21
  %23 = fptosi double %22 to i32
  store i32 %23, i32* %2, align 4
  br label %39

; <label>:24:                                     ; preds = %13
  %25 = load double, double* %3, align 8
  %26 = fcmp olt double %25, -5.435710e-20
  br i1 %26, label %27, label %37

; <label>:27:                                     ; preds = %24
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix16fromY, i64 0, i64 3)
  %28 = add i64 %pgocount3, 1
  store i64 %28, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix16fromY, i64 0, i64 3)
  %29 = load double, double* %3, align 8
  %30 = fsub double -0.000000e+00, %29
  %31 = call double @log(double %30) #5
  %32 = fmul double 0x3FF71547652B82FE, %31
  %33 = fadd double %32, 6.400000e+01
  %34 = fmul double 2.560000e+02, %33
  %35 = fptosi double %34 to i32
  %36 = or i32 -32768, %35
  store i32 %36, i32* %2, align 4
  br label %39

; <label>:37:                                     ; preds = %24
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix16fromY, i64 0, i64 4)
  %38 = add i64 %pgocount4, 1
  store i64 %38, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pix16fromY, i64 0, i64 4)
  store i32 0, i32* %2, align 4
  br label %39

; <label>:39:                                     ; preds = %37, %27, %16, %11, %6
  %40 = load i32, i32* %2, align 4
  ret i32 %40
}

declare void @_TIFFfree(i8*) #2

declare i32 @TIFFSetField(%struct.tiff*, i32, ...) #2

declare i32 @TIFFTileSize(%struct.tiff*) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #5

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #5

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
