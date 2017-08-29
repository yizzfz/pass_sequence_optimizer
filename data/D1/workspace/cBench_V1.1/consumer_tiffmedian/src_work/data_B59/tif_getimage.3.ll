; ModuleID = 'tif_getimage.2.ll'
source_filename = "tif_getimage.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct._TIFFRGBAImage = type { %struct.tiff*, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16*, i16*, i16*, i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)*, %union.anon, i8*, i32**, i32**, %struct.TIFFYCbCrToRGB*, i32, i32 }
%union.anon = type { {}* }
%struct.TIFFYCbCrToRGB = type { i8*, i32*, i32*, i32*, i32*, [3 x float] }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [49 x i8] c"Sorry, can not handle images with %d-bit samples\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"Missing needed %s tag\00", align 1
@photoTag = internal constant [26 x i8] c"PhotometricInterpretation\00", align 16
@.str.2 = private unnamed_addr constant [60 x i8] c"Sorry, can not handle contiguous data with %s=%d, and %s=%d\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"Samples/pixel\00", align 1
@.str.4 = private unnamed_addr constant [46 x i8] c"Sorry, can not handle YCbCr images with %s=%d\00", align 1
@.str.5 = private unnamed_addr constant [20 x i8] c"Planarconfiguration\00", align 1
@.str.6 = private unnamed_addr constant [43 x i8] c"Sorry, can not handle RGB image with %s=%d\00", align 1
@.str.7 = private unnamed_addr constant [15 x i8] c"Color channels\00", align 1
@.str.8 = private unnamed_addr constant [49 x i8] c"Sorry, can not handle separated image with %s=%d\00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"InkSet\00", align 1
@.str.10 = private unnamed_addr constant [33 x i8] c"Sorry, LogL data must have %s=%d\00", align 1
@.str.11 = private unnamed_addr constant [12 x i8] c"Compression\00", align 1
@.str.12 = private unnamed_addr constant [41 x i8] c"Sorry, LogLuv data must have %s=%d or %d\00", align 1
@.str.13 = private unnamed_addr constant [47 x i8] c"Sorry, can not handle LogLuv images with %s=%d\00", align 1
@.str.14 = private unnamed_addr constant [39 x i8] c"Sorry, can not handle image with %s=%d\00", align 1
@.str.15 = private unnamed_addr constant [41 x i8] c"Sorry, can not image with %d-bit samples\00", align 1
@.str.16 = private unnamed_addr constant [32 x i8] c"Missing required \22Colormap\22 tag\00", align 1
@.str.17 = private unnamed_addr constant [32 x i8] c"Out of memory for colormap copy\00", align 1
@.str.18 = private unnamed_addr constant [23 x i8] c"No \22get\22 routine setup\00", align 1
@.str.19 = private unnamed_addr constant [62 x i8] c"No \22put\22 routine setupl; probably can not handle image format\00", align 1
@.str.20 = private unnamed_addr constant [47 x i8] c"Can't use TIFFReadRGBAStrip() with tiled file.\00", align 1
@.str.21 = private unnamed_addr constant [60 x i8] c"Row passed to TIFFReadRGBAStrip() must be first in a strip.\00", align 1
@.str.22 = private unnamed_addr constant [49 x i8] c"Can't use TIFFReadRGBATile() with stripped file.\00", align 1
@.str.23 = private unnamed_addr constant [71 x i8] c"Row/col passed to TIFFReadRGBATile() must be topleft corner of a tile.\00", align 1
@.str.24 = private unnamed_addr constant [25 x i8] c"No space for tile buffer\00", align 1
@.str.25 = private unnamed_addr constant [30 x i8] c"using bottom-left orientation\00", align 1
@.str.26 = private unnamed_addr constant [27 x i8] c"using top-left orientation\00", align 1
@.str.27 = private unnamed_addr constant [26 x i8] c"No space for strip buffer\00", align 1
@.str.28 = private unnamed_addr constant [24 x i8] c"Assuming 8-bit colormap\00", align 1
@.str.29 = private unnamed_addr constant [42 x i8] c"No space for photometric conversion table\00", align 1
@.str.30 = private unnamed_addr constant [31 x i8] c"No space for B&W mapping table\00", align 1
@.str.31 = private unnamed_addr constant [35 x i8] c"No space for Palette mapping table\00", align 1
@.str.32 = private unnamed_addr constant [41 x i8] c"No space for YCbCr->RGB conversion state\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFRGBAImageOK = private constant [15 x i8] c"TIFFRGBAImageOK"
@__profn_TIFFRGBAImageEnd = private constant [16 x i8] c"TIFFRGBAImageEnd"
@__profn_TIFFRGBAImageBegin = private constant [18 x i8] c"TIFFRGBAImageBegin"
@__profn_tmp1.ll_isCCITTCompression = private constant [26 x i8] c"tmp1.ll:isCCITTCompression"
@__profn_tmp1.ll_gtTileContig = private constant [20 x i8] c"tmp1.ll:gtTileContig"
@__profn_tmp1.ll_gtStripContig = private constant [21 x i8] c"tmp1.ll:gtStripContig"
@__profn_tmp1.ll_pickTileContigCase = private constant [26 x i8] c"tmp1.ll:pickTileContigCase"
@__profn_tmp1.ll_gtTileSeparate = private constant [22 x i8] c"tmp1.ll:gtTileSeparate"
@__profn_tmp1.ll_gtStripSeparate = private constant [23 x i8] c"tmp1.ll:gtStripSeparate"
@__profn_tmp1.ll_pickTileSeparateCase = private constant [28 x i8] c"tmp1.ll:pickTileSeparateCase"
@__profn_TIFFRGBAImageGet = private constant [16 x i8] c"TIFFRGBAImageGet"
@__profn_TIFFReadRGBAImage = private constant [17 x i8] c"TIFFReadRGBAImage"
@__profn_TIFFReadRGBAStrip = private constant [17 x i8] c"TIFFReadRGBAStrip"
@__profn_TIFFReadRGBATile = private constant [16 x i8] c"TIFFReadRGBATile"
@__profn_tmp1.ll_setorientation = private constant [22 x i8] c"tmp1.ll:setorientation"
@__profn_tmp1.ll_buildMap = private constant [16 x i8] c"tmp1.ll:buildMap"
@__profn_tmp1.ll_putRGBAAcontig8bittile = private constant [30 x i8] c"tmp1.ll:putRGBAAcontig8bittile"
@__profn_tmp1.ll_putRGBUAcontig8bittile = private constant [30 x i8] c"tmp1.ll:putRGBUAcontig8bittile"
@__profn_tmp1.ll_putRGBcontig8bittile = private constant [28 x i8] c"tmp1.ll:putRGBcontig8bittile"
@__profn_tmp1.ll_putRGBcontig8bitMaptile = private constant [31 x i8] c"tmp1.ll:putRGBcontig8bitMaptile"
@__profn_tmp1.ll_putRGBcontig16bittile = private constant [29 x i8] c"tmp1.ll:putRGBcontig16bittile"
@__profn_tmp1.ll_putRGBAAcontig16bittile = private constant [31 x i8] c"tmp1.ll:putRGBAAcontig16bittile"
@__profn_tmp1.ll_putRGBUAcontig16bittile = private constant [31 x i8] c"tmp1.ll:putRGBUAcontig16bittile"
@__profn_tmp1.ll_putRGBcontig8bitCMYKtile = private constant [32 x i8] c"tmp1.ll:putRGBcontig8bitCMYKtile"
@__profn_tmp1.ll_putRGBcontig8bitCMYKMaptile = private constant [35 x i8] c"tmp1.ll:putRGBcontig8bitCMYKMaptile"
@__profn_tmp1.ll_put8bitcmaptile = private constant [23 x i8] c"tmp1.ll:put8bitcmaptile"
@__profn_tmp1.ll_put4bitcmaptile = private constant [23 x i8] c"tmp1.ll:put4bitcmaptile"
@__profn_tmp1.ll_put2bitcmaptile = private constant [23 x i8] c"tmp1.ll:put2bitcmaptile"
@__profn_tmp1.ll_put1bitcmaptile = private constant [23 x i8] c"tmp1.ll:put1bitcmaptile"
@__profn_tmp1.ll_putgreytile = private constant [19 x i8] c"tmp1.ll:putgreytile"
@__profn_tmp1.ll_put4bitbwtile = private constant [21 x i8] c"tmp1.ll:put4bitbwtile"
@__profn_tmp1.ll_put2bitbwtile = private constant [21 x i8] c"tmp1.ll:put2bitbwtile"
@__profn_tmp1.ll_put1bitbwtile = private constant [21 x i8] c"tmp1.ll:put1bitbwtile"
@__profn_tmp1.ll_initYCbCrConversion = private constant [27 x i8] c"tmp1.ll:initYCbCrConversion"
@__profn_tmp1.ll_setupMap = private constant [16 x i8] c"tmp1.ll:setupMap"
@__profn_tmp1.ll_checkcmap = private constant [17 x i8] c"tmp1.ll:checkcmap"
@__profn_tmp1.ll_cvtcmap = private constant [15 x i8] c"tmp1.ll:cvtcmap"
@__profn_tmp1.ll_makecmap = private constant [16 x i8] c"tmp1.ll:makecmap"
@__profn_tmp1.ll_makebwmap = private constant [17 x i8] c"tmp1.ll:makebwmap"
@__profn_tmp1.ll_TIFFYCbCrToRGBInit = private constant [26 x i8] c"tmp1.ll:TIFFYCbCrToRGBInit"
@__profn_tmp1.ll_putcontig8bitYCbCr44tile = private constant [32 x i8] c"tmp1.ll:putcontig8bitYCbCr44tile"
@__profn_tmp1.ll_putcontig8bitYCbCr42tile = private constant [32 x i8] c"tmp1.ll:putcontig8bitYCbCr42tile"
@__profn_tmp1.ll_putcontig8bitYCbCr41tile = private constant [32 x i8] c"tmp1.ll:putcontig8bitYCbCr41tile"
@__profn_tmp1.ll_putcontig8bitYCbCr22tile = private constant [32 x i8] c"tmp1.ll:putcontig8bitYCbCr22tile"
@__profn_tmp1.ll_putcontig8bitYCbCr21tile = private constant [32 x i8] c"tmp1.ll:putcontig8bitYCbCr21tile"
@__profn_tmp1.ll_putcontig8bitYCbCr11tile = private constant [32 x i8] c"tmp1.ll:putcontig8bitYCbCr11tile"
@__profn_tmp1.ll_putRGBAAseparate8bittile = private constant [32 x i8] c"tmp1.ll:putRGBAAseparate8bittile"
@__profn_tmp1.ll_putRGBUAseparate8bittile = private constant [32 x i8] c"tmp1.ll:putRGBUAseparate8bittile"
@__profn_tmp1.ll_putRGBseparate8bittile = private constant [30 x i8] c"tmp1.ll:putRGBseparate8bittile"
@__profn_tmp1.ll_putRGBseparate8bitMaptile = private constant [33 x i8] c"tmp1.ll:putRGBseparate8bitMaptile"
@__profn_tmp1.ll_putRGBseparate16bittile = private constant [31 x i8] c"tmp1.ll:putRGBseparate16bittile"
@__profn_tmp1.ll_putRGBAAseparate16bittile = private constant [33 x i8] c"tmp1.ll:putRGBAAseparate16bittile"
@__profn_tmp1.ll_putRGBUAseparate16bittile = private constant [33 x i8] c"tmp1.ll:putRGBUAseparate16bittile"
@__profc_TIFFRGBAImageOK = private global [27 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFRGBAImageOK = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9210925049952439279, i64 276617496461, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*)* @TIFFRGBAImageOK to i8*), i8* null, i32 27, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFRGBAImageEnd = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFRGBAImageEnd = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3031789326452033399, i64 76245195868, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFRGBAImageEnd, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*)* @TIFFRGBAImageEnd to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFRGBAImageBegin = private global [41 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFRGBAImageBegin = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 984177802635035504, i64 144115610606774743, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i32 0, i32 0), i8* bitcast (i32 (%struct._TIFFRGBAImage*, %struct.tiff*, i32, i8*)* @TIFFRGBAImageBegin to i8*), i8* null, i32 41, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_isCCITTCompression = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_isCCITTCompression = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4716956336021370449, i64 39541258623, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_isCCITTCompression, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_gtTileContig = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_gtTileContig = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_gtTileContig = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5804256881586535075, i64 563112267813472, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i32 0, i32 0), i8* bitcast (i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* @gtTileContig to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_gtTileContig to i8*), i32 10, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_gtStripContig = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_gtStripContig = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_gtStripContig = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5965843976084344121, i64 281612678589857, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_gtStripContig, i32 0, i32 0), i8* bitcast (i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* @gtStripContig to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_gtStripContig to i8*), i32 9, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pickTileContigCase = private global [27 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_pickTileContigCase = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7667407864315735946, i64 312533143130, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i32 0, i32 0), i8* null, i8* null, i32 27, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_gtTileSeparate = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_gtTileSeparate = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_gtTileSeparate = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3520341198609872973, i64 563198758339488, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i32 0, i32 0), i8* bitcast (i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* @gtTileSeparate to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_gtTileSeparate to i8*), i32 18, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_gtStripSeparate = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_gtStripSeparate = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_gtStripSeparate = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -78034681757490632, i64 281701208286441, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i32 0, i32 0), i8* bitcast (i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* @gtStripSeparate to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_gtStripSeparate to i8*), i32 17, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pickTileSeparateCase = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_pickTileSeparateCase = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3124356008787634247, i64 153367754310, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i32 0, i32 0), i8* null, i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFRGBAImageGet = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFRGBAImageGet = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFRGBAImageGet = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2396712662936505219, i64 281517731074310, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFRGBAImageGet, i32 0, i32 0), i8* bitcast (i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* @TIFFRGBAImageGet to i8*), i8* bitcast ([1 x i64]* @__profvp_TIFFRGBAImageGet to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_TIFFReadRGBAImage = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFReadRGBAImage = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4603685784858284586, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFReadRGBAImage, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, i32, i32*, i32)* @TIFFReadRGBAImage to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFReadRGBAStrip = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFReadRGBAStrip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7730806898624147303, i64 73100931006, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRGBAStrip, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, i32*)* @TIFFReadRGBAStrip to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFReadRGBATile = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFReadRGBATile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8345062958694805486, i64 162263638117, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, i32, i32*)* @TIFFReadRGBATile to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_setorientation = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_setorientation = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7892691280990179605, i64 72408052516, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setorientation, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_buildMap = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_buildMap = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 147224788732770050, i64 122898143174, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i32 0, i32 0), i8* null, i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putRGBAAcontig8bittile = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putRGBAAcontig8bittile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3678546806657904083, i64 124724830976, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBAAcontig8bittile to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putRGBUAcontig8bittile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putRGBUAcontig8bittile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3299661218749279781, i64 44484962468, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAcontig8bittile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBUAcontig8bittile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putRGBcontig8bittile = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putRGBcontig8bittile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7995681591570614899, i64 124724830976, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBcontig8bittile to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putRGBcontig8bitMaptile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putRGBcontig8bitMaptile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6865456767871340042, i64 44484962468, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig8bitMaptile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBcontig8bitMaptile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putRGBcontig16bittile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putRGBcontig16bittile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9204939432809030649, i64 44484962468, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig16bittile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBcontig16bittile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putRGBAAcontig16bittile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putRGBAAcontig16bittile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4121384825616488048, i64 44484962468, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBAAcontig16bittile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBAAcontig16bittile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putRGBUAcontig16bittile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putRGBUAcontig16bittile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6954922171462955203, i64 44484962468, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAcontig16bittile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBUAcontig16bittile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putRGBcontig8bitCMYKtile = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putRGBcontig8bitCMYKtile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4369825041927471789, i64 124724830976, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBcontig8bitCMYKtile to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putRGBcontig8bitCMYKMaptile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putRGBcontig8bitCMYKMaptile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8206150234512444543, i64 44484962468, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKMaptile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBcontig8bitCMYKMaptile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_put8bitcmaptile = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_put8bitcmaptile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8579650647393144774, i64 124724830976, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put8bitcmaptile to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_put4bitcmaptile = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_put4bitcmaptile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3253974962213415825, i64 63577860248, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_put4bitcmaptile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put4bitcmaptile to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_put2bitcmaptile = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_put2bitcmaptile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8159852740982974902, i64 93380964198, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitcmaptile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put2bitcmaptile to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_put1bitcmaptile = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_put1bitcmaptile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 51398692753973600, i64 124724830976, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put1bitcmaptile to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putgreytile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putgreytile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2011205697360013216, i64 44484962468, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putgreytile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putgreytile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_put4bitbwtile = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_put4bitbwtile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5706498775511651634, i64 63577860248, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_put4bitbwtile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put4bitbwtile to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_put2bitbwtile = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_put2bitbwtile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2735319563934685823, i64 93380964198, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitbwtile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put2bitbwtile to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_put1bitbwtile = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_put1bitbwtile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2060331735190825629, i64 124724830976, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put1bitbwtile to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_initYCbCrConversion = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_initYCbCrConversion = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8746603966114177930, i64 114807037504, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i32 0, i32 0), i8* null, i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_setupMap = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_setupMap = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8846897579987526201, i64 130011825632, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setupMap, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_checkcmap = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_checkcmap = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6124412785797532413, i64 64171083454, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_cvtcmap = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_cvtcmap = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7528567425049088504, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_cvtcmap, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_makecmap = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_makecmap = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3908277120900555416, i64 89434688750, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makecmap, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_makebwmap = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_makebwmap = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -239572058682517845, i64 89434688750, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makebwmap, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFYCbCrToRGBInit = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFYCbCrToRGBInit = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6085086312929171456, i64 52028904346, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFYCbCrToRGBInit, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putcontig8bitYCbCr44tile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putcontig8bitYCbCr44tile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7329815908559544014, i64 50201403264, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr44tile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putcontig8bitYCbCr44tile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putcontig8bitYCbCr42tile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putcontig8bitYCbCr42tile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5864409006708527154, i64 50201403264, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr42tile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putcontig8bitYCbCr42tile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putcontig8bitYCbCr41tile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putcontig8bitYCbCr41tile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1003702770119273156, i64 44305953991, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr41tile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putcontig8bitYCbCr41tile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putcontig8bitYCbCr22tile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putcontig8bitYCbCr22tile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3978375146293551431, i64 50201403264, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr22tile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putcontig8bitYCbCr22tile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putcontig8bitYCbCr21tile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putcontig8bitYCbCr21tile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -855052023011170789, i64 44305953991, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr21tile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putcontig8bitYCbCr21tile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putcontig8bitYCbCr11tile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putcontig8bitYCbCr11tile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7537511581859314608, i64 44305953991, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr11tile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putcontig8bitYCbCr11tile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putRGBAAseparate8bittile = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putRGBAAseparate8bittile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2539513167419647260, i64 124724830976, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBAAseparate8bittile to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putRGBUAseparate8bittile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putRGBUAseparate8bittile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3904590757507679321, i64 44484962468, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAseparate8bittile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBUAseparate8bittile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putRGBseparate8bittile = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putRGBseparate8bittile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9013126934838543725, i64 124724830976, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBseparate8bittile to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putRGBseparate8bitMaptile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putRGBseparate8bitMaptile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1398772712264156033, i64 50970046531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBseparate8bitMaptile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBseparate8bitMaptile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putRGBseparate16bittile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putRGBseparate16bittile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -129185659402406437, i64 50970046531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBseparate16bittile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBseparate16bittile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putRGBAAseparate16bittile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putRGBAAseparate16bittile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1134462655389237572, i64 50970046531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBAAseparate16bittile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBAAseparate16bittile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putRGBUAseparate16bittile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putRGBUAseparate16bittile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2479340280977422529, i64 44484962468, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAseparate16bittile, i32 0, i32 0), i8* bitcast (void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBUAseparate16bittile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [14 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [1375 x i8] c"\DC\0A\00TIFFRGBAImageOK\01TIFFRGBAImageEnd\01TIFFRGBAImageBegin\01tmp1.ll:isCCITTCompression\01tmp1.ll:gtTileContig\01tmp1.ll:gtStripContig\01tmp1.ll:pickTileContigCase\01tmp1.ll:gtTileSeparate\01tmp1.ll:gtStripSeparate\01tmp1.ll:pickTileSeparateCase\01TIFFRGBAImageGet\01TIFFReadRGBAImage\01TIFFReadRGBAStrip\01TIFFReadRGBATile\01tmp1.ll:setorientation\01tmp1.ll:buildMap\01tmp1.ll:putRGBAAcontig8bittile\01tmp1.ll:putRGBUAcontig8bittile\01tmp1.ll:putRGBcontig8bittile\01tmp1.ll:putRGBcontig8bitMaptile\01tmp1.ll:putRGBcontig16bittile\01tmp1.ll:putRGBAAcontig16bittile\01tmp1.ll:putRGBUAcontig16bittile\01tmp1.ll:putRGBcontig8bitCMYKtile\01tmp1.ll:putRGBcontig8bitCMYKMaptile\01tmp1.ll:put8bitcmaptile\01tmp1.ll:put4bitcmaptile\01tmp1.ll:put2bitcmaptile\01tmp1.ll:put1bitcmaptile\01tmp1.ll:putgreytile\01tmp1.ll:put4bitbwtile\01tmp1.ll:put2bitbwtile\01tmp1.ll:put1bitbwtile\01tmp1.ll:initYCbCrConversion\01tmp1.ll:setupMap\01tmp1.ll:checkcmap\01tmp1.ll:cvtcmap\01tmp1.ll:makecmap\01tmp1.ll:makebwmap\01tmp1.ll:TIFFYCbCrToRGBInit\01tmp1.ll:putcontig8bitYCbCr44tile\01tmp1.ll:putcontig8bitYCbCr42tile\01tmp1.ll:putcontig8bitYCbCr41tile\01tmp1.ll:putcontig8bitYCbCr22tile\01tmp1.ll:putcontig8bitYCbCr21tile\01tmp1.ll:putcontig8bitYCbCr11tile\01tmp1.ll:putRGBAAseparate8bittile\01tmp1.ll:putRGBUAseparate8bittile\01tmp1.ll:putRGBseparate8bittile\01tmp1.ll:putRGBseparate8bitMaptile\01tmp1.ll:putRGBseparate16bittile\01tmp1.ll:putRGBAAseparate16bittile\01tmp1.ll:putRGBUAseparate16bittile", section "__llvm_prf_names"
@llvm.used = appending global [55 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFRGBAImageOK to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFRGBAImageEnd to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFRGBAImageBegin to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_isCCITTCompression to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_gtTileContig to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_gtStripContig to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pickTileContigCase to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_gtTileSeparate to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_gtStripSeparate to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pickTileSeparateCase to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFRGBAImageGet to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadRGBAImage to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadRGBAStrip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadRGBATile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_setorientation to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_buildMap to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putRGBAAcontig8bittile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putRGBUAcontig8bittile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putRGBcontig8bittile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putRGBcontig8bitMaptile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putRGBcontig16bittile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putRGBAAcontig16bittile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putRGBUAcontig16bittile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putRGBcontig8bitCMYKtile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putRGBcontig8bitCMYKMaptile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put8bitcmaptile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put4bitcmaptile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put2bitcmaptile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put1bitcmaptile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putgreytile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put4bitbwtile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put2bitbwtile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put1bitbwtile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_initYCbCrConversion to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_setupMap to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_checkcmap to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_cvtcmap to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_makecmap to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_makebwmap to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFYCbCrToRGBInit to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putcontig8bitYCbCr44tile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putcontig8bitYCbCr42tile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putcontig8bitYCbCr41tile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putcontig8bitYCbCr22tile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putcontig8bitYCbCr21tile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putcontig8bitYCbCr11tile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putRGBAAseparate8bittile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putRGBUAseparate8bittile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putRGBseparate8bittile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putRGBseparate8bitMaptile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putRGBseparate16bittile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putRGBAAseparate16bittile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putRGBUAseparate16bittile to i8*), i8* bitcast ([14 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([1375 x i8], [1375 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFRGBAImageOK(%struct.tiff*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct.TIFFDirectory*, align 8
  %7 = alloca i16, align 2
  %8 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i8* %1, i8** %5, align 8
  %9 = load %struct.tiff*, %struct.tiff** %4, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 6
  store %struct.TIFFDirectory* %10, %struct.TIFFDirectory** %6, align 8
  %11 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %12 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %11, i32 0, i32 8
  %13 = load i16, i16* %12, align 4
  %14 = zext i16 %13 to i32
  switch i32 %14, label %20 [
    i32 1, label %._crit_edge
    i32 2, label %._crit_edge1
    i32 4, label %._crit_edge2
    i32 8, label %._crit_edge3
    i32 16, label %19
  ]

._crit_edge3:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 3)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 3)
  br label %19

._crit_edge2:                                     ; preds = %2
  %pgocount6 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 2)
  %16 = add i64 %pgocount6, 1
  store i64 %16, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 2)
  br label %19

._crit_edge1:                                     ; preds = %2
  %pgocount7 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 1)
  %17 = add i64 %pgocount7, 1
  store i64 %17, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 1)
  br label %19

._crit_edge:                                      ; preds = %2
  %pgocount8 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 0)
  %18 = add i64 %pgocount8, 1
  store i64 %18, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 0)
  br label %19

; <label>:19:                                     ; preds = %._crit_edge, %._crit_edge1, %._crit_edge2, %._crit_edge3, %2
  br label %28

; <label>:20:                                     ; preds = %2
  %pgocount9 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 7)
  %21 = add i64 %pgocount9, 1
  store i64 %21, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 7)
  %22 = load i8*, i8** %5, align 8
  %23 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %24 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %23, i32 0, i32 8
  %25 = load i16, i16* %24, align 4
  %26 = zext i16 %25 to i32
  %27 = call i32 (i8*, i8*, ...) @sprintf(i8* %22, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str, i32 0, i32 0), i32 %26) #4
  store i32 0, i32* %3, align 4
  br label %190

; <label>:28:                                     ; preds = %19
  %29 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %30 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %29, i32 0, i32 15
  %31 = load i16, i16* %30, align 2
  %32 = zext i16 %31 to i32
  %33 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %34 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %33, i32 0, i32 30
  %35 = load i16, i16* %34, align 4
  %36 = zext i16 %35 to i32
  %37 = sub nsw i32 %32, %36
  store i32 %37, i32* %8, align 4
  %38 = load %struct.tiff*, %struct.tiff** %4, align 8
  %39 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %38, i32 262, i16* %7)
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %52, label %41

; <label>:41:                                     ; preds = %28
  %42 = load i32, i32* %8, align 4
  switch i32 %42, label %47 [
    i32 1, label %43
    i32 3, label %45
  ]

; <label>:43:                                     ; preds = %41
  %pgocount10 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 9)
  %44 = add i64 %pgocount10, 1
  store i64 %44, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 9)
  store i16 1, i16* %7, align 2
  br label %51

; <label>:45:                                     ; preds = %41
  %pgocount11 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 10)
  %46 = add i64 %pgocount11, 1
  store i64 %46, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 10)
  store i16 2, i16* %7, align 2
  br label %51

; <label>:47:                                     ; preds = %41
  %pgocount12 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 11)
  %48 = add i64 %pgocount12, 1
  store i64 %48, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 11)
  %49 = load i8*, i8** %5, align 8
  %50 = call i32 (i8*, i8*, ...) @sprintf(i8* %49, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @photoTag, i32 0, i32 0)) #4
  store i32 0, i32* %3, align 4
  br label %190

; <label>:51:                                     ; preds = %45, %43
  br label %52

; <label>:52:                                     ; preds = %51, %28
  %53 = load i16, i16* %7, align 2
  %54 = zext i16 %53 to i32
  switch i32 %54, label %183 [
    i32 0, label %._crit_edge4
    i32 1, label %._crit_edge5
    i32 3, label %57
    i32 6, label %82
    i32 2, label %98
    i32 5, label %108
    i32 32844, label %138
    i32 32845, label %150
  ]

._crit_edge5:                                     ; preds = %52
  %pgocount13 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 5)
  %55 = add i64 %pgocount13, 1
  store i64 %55, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 5)
  br label %57

._crit_edge4:                                     ; preds = %52
  %pgocount14 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 4)
  %56 = add i64 %pgocount14, 1
  store i64 %56, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 4)
  br label %57

; <label>:57:                                     ; preds = %._crit_edge4, %._crit_edge5, %52
  %58 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %59 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %58, i32 0, i32 24
  %60 = load i16, i16* %59, align 2
  %61 = zext i16 %60 to i32
  %62 = icmp eq i32 %61, 1
  br i1 %62, label %63, label %80

; <label>:63:                                     ; preds = %57
  %pgocount15 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 8)
  %64 = add i64 %pgocount15, 1
  store i64 %64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 8)
  %65 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %66 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %65, i32 0, i32 15
  %67 = load i16, i16* %66, align 2
  %68 = zext i16 %67 to i32
  %69 = icmp ne i32 %68, 1
  br i1 %69, label %70, label %80

; <label>:70:                                     ; preds = %63
  %pgocount16 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 13)
  %71 = add i64 %pgocount16, 1
  store i64 %71, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 13)
  %72 = load i8*, i8** %5, align 8
  %73 = load i16, i16* %7, align 2
  %74 = zext i16 %73 to i32
  %75 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %76 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %75, i32 0, i32 15
  %77 = load i16, i16* %76, align 2
  %78 = zext i16 %77 to i32
  %79 = call i32 (i8*, i8*, ...) @sprintf(i8* %72, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @photoTag, i32 0, i32 0), i32 %74, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0), i32 %78) #4
  store i32 0, i32* %3, align 4
  br label %190

; <label>:80:                                     ; preds = %63, %57
  %pgocount17 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 6)
  %81 = add i64 %pgocount17, 1
  store i64 %81, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 6)
  br label %189

; <label>:82:                                     ; preds = %52
  %83 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %84 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %83, i32 0, i32 24
  %85 = load i16, i16* %84, align 2
  %86 = zext i16 %85 to i32
  %87 = icmp ne i32 %86, 1
  br i1 %87, label %88, label %96

; <label>:88:                                     ; preds = %82
  %pgocount18 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 14)
  %89 = add i64 %pgocount18, 1
  store i64 %89, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 14)
  %90 = load i8*, i8** %5, align 8
  %91 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %92 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %91, i32 0, i32 24
  %93 = load i16, i16* %92, align 2
  %94 = zext i16 %93 to i32
  %95 = call i32 (i8*, i8*, ...) @sprintf(i8* %90, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i32 0, i32 0), i32 %94) #4
  store i32 0, i32* %3, align 4
  br label %190

; <label>:96:                                     ; preds = %82
  %pgocount19 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 15)
  %97 = add i64 %pgocount19, 1
  store i64 %97, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 15)
  br label %189

; <label>:98:                                     ; preds = %52
  %99 = load i32, i32* %8, align 4
  %100 = icmp slt i32 %99, 3
  br i1 %100, label %101, label %106

; <label>:101:                                    ; preds = %98
  %pgocount20 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 16)
  %102 = add i64 %pgocount20, 1
  store i64 %102, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 16)
  %103 = load i8*, i8** %5, align 8
  %104 = load i32, i32* %8, align 4
  %105 = call i32 (i8*, i8*, ...) @sprintf(i8* %103, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.7, i32 0, i32 0), i32 %104) #4
  store i32 0, i32* %3, align 4
  br label %190

; <label>:106:                                    ; preds = %98
  %pgocount21 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 17)
  %107 = add i64 %pgocount21, 1
  store i64 %107, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 17)
  br label %189

; <label>:108:                                    ; preds = %52
  %109 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %110 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %109, i32 0, i32 55
  %111 = load i16, i16* %110, align 8
  %112 = zext i16 %111 to i32
  %113 = icmp ne i32 %112, 1
  br i1 %113, label %114, label %122

; <label>:114:                                    ; preds = %108
  %pgocount22 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 18)
  %115 = add i64 %pgocount22, 1
  store i64 %115, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 18)
  %116 = load i8*, i8** %5, align 8
  %117 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %118 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %117, i32 0, i32 55
  %119 = load i16, i16* %118, align 8
  %120 = zext i16 %119 to i32
  %121 = call i32 (i8*, i8*, ...) @sprintf(i8* %116, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i32 0, i32 0), i32 %120) #4
  store i32 0, i32* %3, align 4
  br label %190

; <label>:122:                                    ; preds = %108
  %123 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %124 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %123, i32 0, i32 15
  %125 = load i16, i16* %124, align 2
  %126 = zext i16 %125 to i32
  %127 = icmp ne i32 %126, 4
  br i1 %127, label %128, label %136

; <label>:128:                                    ; preds = %122
  %pgocount23 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 24)
  %129 = add i64 %pgocount23, 1
  store i64 %129, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 24)
  %130 = load i8*, i8** %5, align 8
  %131 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %132 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %131, i32 0, i32 15
  %133 = load i16, i16* %132, align 2
  %134 = zext i16 %133 to i32
  %135 = call i32 (i8*, i8*, ...) @sprintf(i8* %130, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0), i32 %134) #4
  store i32 0, i32* %3, align 4
  br label %190

; <label>:136:                                    ; preds = %122
  %pgocount24 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 25)
  %137 = add i64 %pgocount24, 1
  store i64 %137, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 25)
  br label %189

; <label>:138:                                    ; preds = %52
  %139 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %140 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %139, i32 0, i32 10
  %141 = load i16, i16* %140, align 8
  %142 = zext i16 %141 to i32
  %143 = icmp ne i32 %142, 34676
  br i1 %143, label %144, label %148

; <label>:144:                                    ; preds = %138
  %pgocount25 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 19)
  %145 = add i64 %pgocount25, 1
  store i64 %145, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 19)
  %146 = load i8*, i8** %5, align 8
  %147 = call i32 (i8*, i8*, ...) @sprintf(i8* %146, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0), i32 34676) #4
  store i32 0, i32* %3, align 4
  br label %190

; <label>:148:                                    ; preds = %138
  %pgocount26 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 20)
  %149 = add i64 %pgocount26, 1
  store i64 %149, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 20)
  br label %189

; <label>:150:                                    ; preds = %52
  %151 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %152 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %151, i32 0, i32 10
  %153 = load i16, i16* %152, align 8
  %154 = zext i16 %153 to i32
  %155 = icmp ne i32 %154, 34676
  br i1 %155, label %156, label %167

; <label>:156:                                    ; preds = %150
  %pgocount27 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 21)
  %157 = add i64 %pgocount27, 1
  store i64 %157, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 21)
  %158 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %159 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %158, i32 0, i32 10
  %160 = load i16, i16* %159, align 8
  %161 = zext i16 %160 to i32
  %162 = icmp ne i32 %161, 34677
  br i1 %162, label %163, label %167

; <label>:163:                                    ; preds = %156
  %pgocount28 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 26)
  %164 = add i64 %pgocount28, 1
  store i64 %164, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 26)
  %165 = load i8*, i8** %5, align 8
  %166 = call i32 (i8*, i8*, ...) @sprintf(i8* %165, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0), i32 34676, i32 34677) #4
  store i32 0, i32* %3, align 4
  br label %190

; <label>:167:                                    ; preds = %156, %150
  %168 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %169 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %168, i32 0, i32 24
  %170 = load i16, i16* %169, align 2
  %171 = zext i16 %170 to i32
  %172 = icmp ne i32 %171, 1
  br i1 %172, label %173, label %181

; <label>:173:                                    ; preds = %167
  %pgocount29 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 22)
  %174 = add i64 %pgocount29, 1
  store i64 %174, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 22)
  %175 = load i8*, i8** %5, align 8
  %176 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %177 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %176, i32 0, i32 24
  %178 = load i16, i16* %177, align 2
  %179 = zext i16 %178 to i32
  %180 = call i32 (i8*, i8*, ...) @sprintf(i8* %175, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i32 0, i32 0), i32 %179) #4
  store i32 0, i32* %3, align 4
  br label %190

; <label>:181:                                    ; preds = %167
  %pgocount30 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 23)
  %182 = add i64 %pgocount30, 1
  store i64 %182, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 23)
  br label %189

; <label>:183:                                    ; preds = %52
  %pgocount31 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 12)
  %184 = add i64 %pgocount31, 1
  store i64 %184, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_TIFFRGBAImageOK, i64 0, i64 12)
  %185 = load i8*, i8** %5, align 8
  %186 = load i16, i16* %7, align 2
  %187 = zext i16 %186 to i32
  %188 = call i32 (i8*, i8*, ...) @sprintf(i8* %185, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @photoTag, i32 0, i32 0), i32 %187) #4
  store i32 0, i32* %3, align 4
  br label %190

; <label>:189:                                    ; preds = %181, %148, %136, %106, %96, %80
  store i32 1, i32* %3, align 4
  br label %190

; <label>:190:                                    ; preds = %189, %183, %173, %163, %144, %128, %114, %101, %88, %70, %47, %20
  %191 = load i32, i32* %3, align 4
  ret i32 %191
}

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #1

declare i32 @TIFFGetField(%struct.tiff*, i32, ...) #2

; Function Attrs: noinline nounwind uwtable
define void @TIFFRGBAImageEnd(%struct._TIFFRGBAImage*) #0 {
  %2 = alloca %struct._TIFFRGBAImage*, align 8
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %2, align 8
  %3 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %4 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %3, i32 0, i32 15
  %5 = load i8*, i8** %4, align 8
  %6 = icmp ne i8* %5, null
  br i1 %6, label %7, label %14

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFRGBAImageEnd, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFRGBAImageEnd, i64 0, i64 1)
  %9 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %9, i32 0, i32 15
  %11 = load i8*, i8** %10, align 8
  call void @_TIFFfree(i8* %11)
  %12 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %13 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %12, i32 0, i32 15
  store i8* null, i8** %13, align 8
  br label %14

; <label>:14:                                     ; preds = %7, %1
  %15 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %16 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %15, i32 0, i32 16
  %17 = load i32**, i32*** %16, align 8
  %18 = icmp ne i32** %17, null
  br i1 %18, label %19, label %27

; <label>:19:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFRGBAImageEnd, i64 0, i64 2)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFRGBAImageEnd, i64 0, i64 2)
  %21 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %22 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %21, i32 0, i32 16
  %23 = load i32**, i32*** %22, align 8
  %24 = bitcast i32** %23 to i8*
  call void @_TIFFfree(i8* %24)
  %25 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %26 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %25, i32 0, i32 16
  store i32** null, i32*** %26, align 8
  br label %27

; <label>:27:                                     ; preds = %19, %14
  %28 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %29 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %28, i32 0, i32 17
  %30 = load i32**, i32*** %29, align 8
  %31 = icmp ne i32** %30, null
  br i1 %31, label %32, label %40

; <label>:32:                                     ; preds = %27
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFRGBAImageEnd, i64 0, i64 3)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFRGBAImageEnd, i64 0, i64 3)
  %34 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %35 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %34, i32 0, i32 17
  %36 = load i32**, i32*** %35, align 8
  %37 = bitcast i32** %36 to i8*
  call void @_TIFFfree(i8* %37)
  %38 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %39 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %38, i32 0, i32 17
  store i32** null, i32*** %39, align 8
  br label %40

; <label>:40:                                     ; preds = %32, %27
  %41 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %42 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %41, i32 0, i32 18
  %43 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %42, align 8
  %44 = icmp ne %struct.TIFFYCbCrToRGB* %43, null
  br i1 %44, label %45, label %53

; <label>:45:                                     ; preds = %40
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFRGBAImageEnd, i64 0, i64 4)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFRGBAImageEnd, i64 0, i64 4)
  %47 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %48 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %47, i32 0, i32 18
  %49 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %48, align 8
  %50 = bitcast %struct.TIFFYCbCrToRGB* %49 to i8*
  call void @_TIFFfree(i8* %50)
  %51 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %52 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %51, i32 0, i32 18
  store %struct.TIFFYCbCrToRGB* null, %struct.TIFFYCbCrToRGB** %52, align 8
  br label %53

; <label>:53:                                     ; preds = %45, %40
  %54 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %55 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %54, i32 0, i32 10
  %56 = load i16*, i16** %55, align 8
  %57 = icmp ne i16* %56, null
  br i1 %57, label %58, label %72

; <label>:58:                                     ; preds = %53
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFRGBAImageEnd, i64 0, i64 5)
  %59 = add i64 %pgocount4, 1
  store i64 %59, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFRGBAImageEnd, i64 0, i64 5)
  %60 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %61 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %60, i32 0, i32 10
  %62 = load i16*, i16** %61, align 8
  %63 = bitcast i16* %62 to i8*
  call void @_TIFFfree(i8* %63)
  %64 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %65 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %64, i32 0, i32 11
  %66 = load i16*, i16** %65, align 8
  %67 = bitcast i16* %66 to i8*
  call void @_TIFFfree(i8* %67)
  %68 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %69 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %68, i32 0, i32 12
  %70 = load i16*, i16** %69, align 8
  %71 = bitcast i16* %70 to i8*
  call void @_TIFFfree(i8* %71)
  br label %72

; <label>:72:                                     ; preds = %58, %53
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFRGBAImageEnd, i64 0, i64 0)
  %73 = add i64 %pgocount5, 1
  store i64 %73, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFRGBAImageEnd, i64 0, i64 0)
  ret void
}

declare void @_TIFFfree(i8*) #2

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFRGBAImageBegin(%struct._TIFFRGBAImage*, %struct.tiff*, i32, i8*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct._TIFFRGBAImage*, align 8
  %7 = alloca %struct.tiff*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i16, align 2
  %12 = alloca i16, align 2
  %13 = alloca i16, align 2
  %14 = alloca i32, align 4
  %15 = alloca i16*, align 8
  %16 = alloca i16*, align 8
  %17 = alloca i16*, align 8
  %18 = alloca i32, align 4
  %19 = alloca i16, align 2
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %6, align 8
  store %struct.tiff* %1, %struct.tiff** %7, align 8
  store i32 %2, i32* %8, align 4
  store i8* %3, i8** %9, align 8
  %20 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %21 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %20, i32 0, i32 19
  store i32 0, i32* %21, align 8
  %22 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %23 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %22, i32 0, i32 20
  store i32 0, i32* %23, align 4
  %24 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %25 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %24, i32 0, i32 10
  store i16* null, i16** %25, align 8
  %26 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %27 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %26, i32 0, i32 11
  store i16* null, i16** %27, align 8
  %28 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %29 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %28, i32 0, i32 12
  store i16* null, i16** %29, align 8
  %30 = load %struct.tiff*, %struct.tiff** %7, align 8
  %31 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %32 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %31, i32 0, i32 0
  store %struct.tiff* %30, %struct.tiff** %32, align 8
  %33 = load i32, i32* %8, align 4
  %34 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %35 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %34, i32 0, i32 1
  store i32 %33, i32* %35, align 8
  %36 = load %struct.tiff*, %struct.tiff** %7, align 8
  %37 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %38 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %37, i32 0, i32 6
  %39 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %36, i32 258, i16* %38)
  %40 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %41 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %40, i32 0, i32 6
  %42 = load i16, i16* %41, align 4
  %43 = zext i16 %42 to i32
  switch i32 %43, label %49 [
    i32 1, label %._crit_edge
    i32 2, label %._crit_edge1
    i32 4, label %._crit_edge2
    i32 8, label %._crit_edge3
    i32 16, label %48
  ]

._crit_edge3:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 3)
  %44 = add i64 %pgocount, 1
  store i64 %44, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 3)
  br label %48

._crit_edge2:                                     ; preds = %4
  %pgocount6 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 2)
  %45 = add i64 %pgocount6, 1
  store i64 %45, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 2)
  br label %48

._crit_edge1:                                     ; preds = %4
  %pgocount7 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 1)
  %46 = add i64 %pgocount7, 1
  store i64 %46, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 1)
  br label %48

._crit_edge:                                      ; preds = %4
  %pgocount8 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 0)
  %47 = add i64 %pgocount8, 1
  store i64 %47, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 0)
  br label %48

; <label>:48:                                     ; preds = %._crit_edge, %._crit_edge1, %._crit_edge2, %._crit_edge3, %4
  br label %57

; <label>:49:                                     ; preds = %4
  %pgocount9 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 8)
  %50 = add i64 %pgocount9, 1
  store i64 %50, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 8)
  %51 = load i8*, i8** %9, align 8
  %52 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %53 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %52, i32 0, i32 6
  %54 = load i16, i16* %53, align 4
  %55 = zext i16 %54 to i32
  %56 = call i32 (i8*, i8*, ...) @sprintf(i8* %51, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.15, i32 0, i32 0), i32 %55) #4
  store i32 0, i32* %5, align 4
  br label %428

; <label>:57:                                     ; preds = %48
  %58 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %59 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %58, i32 0, i32 3
  store i32 0, i32* %59, align 8
  %60 = load %struct.tiff*, %struct.tiff** %7, align 8
  %61 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %62 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %61, i32 0, i32 7
  %63 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %60, i32 277, i16* %62)
  %64 = load %struct.tiff*, %struct.tiff** %7, align 8
  %65 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %64, i32 338, i16* %11, i16** %10)
  %66 = load i16, i16* %11, align 2
  %67 = zext i16 %66 to i32
  %68 = icmp eq i32 %67, 1
  br i1 %68, label %69, label %85

; <label>:69:                                     ; preds = %57
  %70 = load i16*, i16** %10, align 8
  %71 = getelementptr inbounds i16, i16* %70, i64 0
  %72 = load i16, i16* %71, align 2
  %73 = zext i16 %72 to i32
  switch i32 %73, label %83 [
    i32 1, label %._crit_edge4
    i32 2, label %75
  ]

._crit_edge4:                                     ; preds = %69
  %pgocount10 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 4)
  %74 = add i64 %pgocount10, 1
  store i64 %74, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 4)
  br label %75

; <label>:75:                                     ; preds = %._crit_edge4, %69
  %pgocount11 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 7)
  %76 = add i64 %pgocount11, 1
  store i64 %76, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 7)
  %77 = load i16*, i16** %10, align 8
  %78 = getelementptr inbounds i16, i16* %77, i64 0
  %79 = load i16, i16* %78, align 2
  %80 = zext i16 %79 to i32
  %81 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %82 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %81, i32 0, i32 3
  store i32 %80, i32* %82, align 8
  br label %83

; <label>:83:                                     ; preds = %75, %69
  %pgocount12 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 6)
  %84 = add i64 %pgocount12, 1
  store i64 %84, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 6)
  br label %85

; <label>:85:                                     ; preds = %83, %57
  %86 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %87 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %86, i32 0, i32 7
  %88 = load i16, i16* %87, align 2
  %89 = zext i16 %88 to i32
  %90 = load i16, i16* %11, align 2
  %91 = zext i16 %90 to i32
  %92 = sub nsw i32 %89, %91
  store i32 %92, i32* %14, align 4
  %93 = load %struct.tiff*, %struct.tiff** %7, align 8
  %94 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %93, i32 259, i16* %13)
  %95 = load %struct.tiff*, %struct.tiff** %7, align 8
  %96 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %95, i32 284, i16* %12)
  %97 = load %struct.tiff*, %struct.tiff** %7, align 8
  %98 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %99 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %98, i32 0, i32 9
  %100 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %97, i32 262, i16* %99)
  %101 = icmp ne i32 %100, 0
  br i1 %101, label %126, label %102

; <label>:102:                                    ; preds = %85
  %103 = load i32, i32* %14, align 4
  switch i32 %103, label %121 [
    i32 1, label %104
    i32 3, label %117
  ]

; <label>:104:                                    ; preds = %102
  %105 = load %struct.tiff*, %struct.tiff** %7, align 8
  %106 = call i32 @isCCITTCompression(%struct.tiff* %105)
  %107 = icmp ne i32 %106, 0
  br i1 %107, label %108, label %112

; <label>:108:                                    ; preds = %104
  %pgocount13 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 16)
  %109 = add i64 %pgocount13, 1
  store i64 %109, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 16)
  %110 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %111 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %110, i32 0, i32 9
  store i16 0, i16* %111, align 2
  br label %116

; <label>:112:                                    ; preds = %104
  %pgocount14 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 26)
  %113 = add i64 %pgocount14, 1
  store i64 %113, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 26)
  %114 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %115 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %114, i32 0, i32 9
  store i16 1, i16* %115, align 2
  br label %116

; <label>:116:                                    ; preds = %112, %108
  br label %125

; <label>:117:                                    ; preds = %102
  %pgocount15 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 12)
  %118 = add i64 %pgocount15, 1
  store i64 %118, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 12)
  %119 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %120 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %119, i32 0, i32 9
  store i16 2, i16* %120, align 2
  br label %125

; <label>:121:                                    ; preds = %102
  %pgocount16 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 13)
  %122 = add i64 %pgocount16, 1
  store i64 %122, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 13)
  %123 = load i8*, i8** %9, align 8
  %124 = call i32 (i8*, i8*, ...) @sprintf(i8* %123, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @photoTag, i32 0, i32 0)) #4
  store i32 0, i32* %5, align 4
  br label %428

; <label>:125:                                    ; preds = %117, %116
  br label %126

; <label>:126:                                    ; preds = %125, %85
  %127 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %128 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %127, i32 0, i32 9
  %129 = load i16, i16* %128, align 2
  %130 = zext i16 %129 to i32
  switch i32 %130, label %358 [
    i32 3, label %132
    i32 0, label %._crit_edge5
    i32 1, label %221
    i32 6, label %246
    i32 2, label %273
    i32 5, label %283
    i32 32844, label %311
    i32 32845, label %327
  ]

._crit_edge5:                                     ; preds = %126
  %pgocount17 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 5)
  %131 = add i64 %pgocount17, 1
  store i64 %131, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 5)
  br label %221

; <label>:132:                                    ; preds = %126
  %133 = load %struct.tiff*, %struct.tiff** %7, align 8
  %134 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %133, i32 320, i16** %15, i16** %16, i16** %17)
  %135 = icmp ne i32 %134, 0
  br i1 %135, label %140, label %136

; <label>:136:                                    ; preds = %132
  %pgocount18 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 29)
  %137 = add i64 %pgocount18, 1
  store i64 %137, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 29)
  %138 = load %struct.tiff*, %struct.tiff** %7, align 8
  %139 = call i8* @TIFFFileName(%struct.tiff* %138)
  call void (i8*, i8*, ...) @TIFFError(i8* %139, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.16, i32 0, i32 0))
  store i32 0, i32* %5, align 4
  br label %428

; <label>:140:                                    ; preds = %132
  %141 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %142 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %141, i32 0, i32 6
  %143 = load i16, i16* %142, align 4
  %144 = zext i16 %143 to i32
  %145 = zext i32 %144 to i64
  %146 = shl i64 1, %145
  %147 = trunc i64 %146 to i32
  store i32 %147, i32* %18, align 4
  %148 = load i32, i32* %18, align 4
  %149 = sext i32 %148 to i64
  %150 = mul i64 2, %149
  %151 = trunc i64 %150 to i32
  %152 = call i8* @_TIFFmalloc(i32 %151)
  %153 = bitcast i8* %152 to i16*
  %154 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %155 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %154, i32 0, i32 10
  store i16* %153, i16** %155, align 8
  %156 = load i32, i32* %18, align 4
  %157 = sext i32 %156 to i64
  %158 = mul i64 2, %157
  %159 = trunc i64 %158 to i32
  %160 = call i8* @_TIFFmalloc(i32 %159)
  %161 = bitcast i8* %160 to i16*
  %162 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %163 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %162, i32 0, i32 11
  store i16* %161, i16** %163, align 8
  %164 = load i32, i32* %18, align 4
  %165 = sext i32 %164 to i64
  %166 = mul i64 2, %165
  %167 = trunc i64 %166 to i32
  %168 = call i8* @_TIFFmalloc(i32 %167)
  %169 = bitcast i8* %168 to i16*
  %170 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %171 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %170, i32 0, i32 12
  store i16* %169, i16** %171, align 8
  %172 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %173 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %172, i32 0, i32 10
  %174 = load i16*, i16** %173, align 8
  %175 = icmp ne i16* %174, null
  br i1 %175, label %176, label %188

; <label>:176:                                    ; preds = %140
  %pgocount19 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 28)
  %177 = add i64 %pgocount19, 1
  store i64 %177, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 28)
  %178 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %179 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %178, i32 0, i32 11
  %180 = load i16*, i16** %179, align 8
  %181 = icmp ne i16* %180, null
  br i1 %181, label %182, label %188

; <label>:182:                                    ; preds = %176
  %pgocount20 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 32)
  %183 = add i64 %pgocount20, 1
  store i64 %183, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 32)
  %184 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %185 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %184, i32 0, i32 12
  %186 = load i16*, i16** %185, align 8
  %187 = icmp ne i16* %186, null
  br i1 %187, label %192, label %188

; <label>:188:                                    ; preds = %182, %176, %140
  %pgocount21 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 27)
  %189 = add i64 %pgocount21, 1
  store i64 %189, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 27)
  %190 = load %struct.tiff*, %struct.tiff** %7, align 8
  %191 = call i8* @TIFFFileName(%struct.tiff* %190)
  call void (i8*, i8*, ...) @TIFFError(i8* %191, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.17, i32 0, i32 0))
  store i32 0, i32* %5, align 4
  br label %428

; <label>:192:                                    ; preds = %182
  %pgocount22 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 37)
  %193 = add i64 %pgocount22, 1
  store i64 %193, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 37)
  %194 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %195 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %194, i32 0, i32 10
  %196 = load i16*, i16** %195, align 8
  %197 = bitcast i16* %196 to i8*
  %198 = load i16*, i16** %15, align 8
  %199 = bitcast i16* %198 to i8*
  %200 = load i32, i32* %18, align 4
  %201 = mul nsw i32 %200, 2
  %202 = sext i32 %201 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %197, i8* %199, i64 %202, i32 2, i1 false)
  %203 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %204 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %203, i32 0, i32 11
  %205 = load i16*, i16** %204, align 8
  %206 = bitcast i16* %205 to i8*
  %207 = load i16*, i16** %16, align 8
  %208 = bitcast i16* %207 to i8*
  %209 = load i32, i32* %18, align 4
  %210 = mul nsw i32 %209, 2
  %211 = sext i32 %210 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %206, i8* %208, i64 %211, i32 2, i1 false)
  %212 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %213 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %212, i32 0, i32 12
  %214 = load i16*, i16** %213, align 8
  %215 = bitcast i16* %214 to i8*
  %216 = load i16*, i16** %17, align 8
  %217 = bitcast i16* %216 to i8*
  %218 = load i32, i32* %18, align 4
  %219 = mul nsw i32 %218, 2
  %220 = sext i32 %219 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %215, i8* %217, i64 %220, i32 2, i1 false)
  br label %221

; <label>:221:                                    ; preds = %192, %._crit_edge5, %126
  %222 = load i16, i16* %12, align 2
  %223 = zext i16 %222 to i32
  %224 = icmp eq i32 %223, 1
  br i1 %224, label %225, label %244

; <label>:225:                                    ; preds = %221
  %pgocount23 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 14)
  %226 = add i64 %pgocount23, 1
  store i64 %226, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 14)
  %227 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %228 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %227, i32 0, i32 7
  %229 = load i16, i16* %228, align 2
  %230 = zext i16 %229 to i32
  %231 = icmp ne i32 %230, 1
  br i1 %231, label %232, label %244

; <label>:232:                                    ; preds = %225
  %pgocount24 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 17)
  %233 = add i64 %pgocount24, 1
  store i64 %233, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 17)
  %234 = load i8*, i8** %9, align 8
  %235 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %236 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %235, i32 0, i32 9
  %237 = load i16, i16* %236, align 2
  %238 = zext i16 %237 to i32
  %239 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %240 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %239, i32 0, i32 7
  %241 = load i16, i16* %240, align 2
  %242 = zext i16 %241 to i32
  %243 = call i32 (i8*, i8*, ...) @sprintf(i8* %234, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @photoTag, i32 0, i32 0), i32 %238, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0), i32 %242) #4
  store i32 0, i32* %5, align 4
  br label %428

; <label>:244:                                    ; preds = %225, %221
  %pgocount25 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 10)
  %245 = add i64 %pgocount25, 1
  store i64 %245, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 10)
  br label %366

; <label>:246:                                    ; preds = %126
  %247 = load i16, i16* %12, align 2
  %248 = zext i16 %247 to i32
  %249 = icmp ne i32 %248, 1
  br i1 %249, label %250, label %256

; <label>:250:                                    ; preds = %246
  %pgocount26 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 18)
  %251 = add i64 %pgocount26, 1
  store i64 %251, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 18)
  %252 = load i8*, i8** %9, align 8
  %253 = load i16, i16* %12, align 2
  %254 = zext i16 %253 to i32
  %255 = call i32 (i8*, i8*, ...) @sprintf(i8* %252, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i32 0, i32 0), i32 %254) #4
  store i32 0, i32* %5, align 4
  br label %428

; <label>:256:                                    ; preds = %246
  %257 = load i16, i16* %13, align 2
  %258 = zext i16 %257 to i32
  %259 = icmp eq i32 %258, 7
  br i1 %259, label %260, label %271

; <label>:260:                                    ; preds = %256
  %pgocount27 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 33)
  %261 = add i64 %pgocount27, 1
  store i64 %261, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 33)
  %262 = load i16, i16* %12, align 2
  %263 = zext i16 %262 to i32
  %264 = icmp eq i32 %263, 1
  br i1 %264, label %265, label %271

; <label>:265:                                    ; preds = %260
  %pgocount28 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 38)
  %266 = add i64 %pgocount28, 1
  store i64 %266, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 38)
  %267 = load %struct.tiff*, %struct.tiff** %7, align 8
  %268 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %267, i32 65538, i32 1)
  %269 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %270 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %269, i32 0, i32 9
  store i16 2, i16* %270, align 2
  br label %271

; <label>:271:                                    ; preds = %265, %260, %256
  %pgocount29 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 19)
  %272 = add i64 %pgocount29, 1
  store i64 %272, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 19)
  br label %366

; <label>:273:                                    ; preds = %126
  %274 = load i32, i32* %14, align 4
  %275 = icmp slt i32 %274, 3
  br i1 %275, label %276, label %281

; <label>:276:                                    ; preds = %273
  %pgocount30 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 20)
  %277 = add i64 %pgocount30, 1
  store i64 %277, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 20)
  %278 = load i8*, i8** %9, align 8
  %279 = load i32, i32* %14, align 4
  %280 = call i32 (i8*, i8*, ...) @sprintf(i8* %278, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.7, i32 0, i32 0), i32 %279) #4
  store i32 0, i32* %5, align 4
  br label %428

; <label>:281:                                    ; preds = %273
  %pgocount31 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 21)
  %282 = add i64 %pgocount31, 1
  store i64 %282, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 21)
  br label %366

; <label>:283:                                    ; preds = %126
  %284 = load %struct.tiff*, %struct.tiff** %7, align 8
  %285 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %284, i32 332, i16* %19)
  %286 = load i16, i16* %19, align 2
  %287 = zext i16 %286 to i32
  %288 = icmp ne i32 %287, 1
  br i1 %288, label %289, label %295

; <label>:289:                                    ; preds = %283
  %pgocount32 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 22)
  %290 = add i64 %pgocount32, 1
  store i64 %290, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 22)
  %291 = load i8*, i8** %9, align 8
  %292 = load i16, i16* %19, align 2
  %293 = zext i16 %292 to i32
  %294 = call i32 (i8*, i8*, ...) @sprintf(i8* %291, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i32 0, i32 0), i32 %293) #4
  store i32 0, i32* %5, align 4
  br label %428

; <label>:295:                                    ; preds = %283
  %296 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %297 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %296, i32 0, i32 7
  %298 = load i16, i16* %297, align 2
  %299 = zext i16 %298 to i32
  %300 = icmp ne i32 %299, 4
  br i1 %300, label %301, label %309

; <label>:301:                                    ; preds = %295
  %pgocount33 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 34)
  %302 = add i64 %pgocount33, 1
  store i64 %302, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 34)
  %303 = load i8*, i8** %9, align 8
  %304 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %305 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %304, i32 0, i32 7
  %306 = load i16, i16* %305, align 2
  %307 = zext i16 %306 to i32
  %308 = call i32 (i8*, i8*, ...) @sprintf(i8* %303, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0), i32 %307) #4
  store i32 0, i32* %5, align 4
  br label %428

; <label>:309:                                    ; preds = %295
  %pgocount34 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 35)
  %310 = add i64 %pgocount34, 1
  store i64 %310, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 35)
  br label %366

; <label>:311:                                    ; preds = %126
  %312 = load i16, i16* %13, align 2
  %313 = zext i16 %312 to i32
  %314 = icmp ne i32 %313, 34676
  br i1 %314, label %315, label %319

; <label>:315:                                    ; preds = %311
  %pgocount35 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 23)
  %316 = add i64 %pgocount35, 1
  store i64 %316, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 23)
  %317 = load i8*, i8** %9, align 8
  %318 = call i32 (i8*, i8*, ...) @sprintf(i8* %317, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0), i32 34676) #4
  store i32 0, i32* %5, align 4
  br label %428

; <label>:319:                                    ; preds = %311
  %pgocount36 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 24)
  %320 = add i64 %pgocount36, 1
  store i64 %320, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 24)
  %321 = load %struct.tiff*, %struct.tiff** %7, align 8
  %322 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %321, i32 65560, i32 3)
  %323 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %324 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %323, i32 0, i32 9
  store i16 1, i16* %324, align 2
  %325 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %326 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %325, i32 0, i32 6
  store i16 8, i16* %326, align 4
  br label %366

; <label>:327:                                    ; preds = %126
  %328 = load i16, i16* %13, align 2
  %329 = zext i16 %328 to i32
  %330 = icmp ne i32 %329, 34676
  br i1 %330, label %331, label %340

; <label>:331:                                    ; preds = %327
  %pgocount37 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 25)
  %332 = add i64 %pgocount37, 1
  store i64 %332, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 25)
  %333 = load i16, i16* %13, align 2
  %334 = zext i16 %333 to i32
  %335 = icmp ne i32 %334, 34677
  br i1 %335, label %336, label %340

; <label>:336:                                    ; preds = %331
  %pgocount38 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 36)
  %337 = add i64 %pgocount38, 1
  store i64 %337, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 36)
  %338 = load i8*, i8** %9, align 8
  %339 = call i32 (i8*, i8*, ...) @sprintf(i8* %338, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0), i32 34676, i32 34677) #4
  store i32 0, i32* %5, align 4
  br label %428

; <label>:340:                                    ; preds = %331, %327
  %341 = load i16, i16* %12, align 2
  %342 = zext i16 %341 to i32
  %343 = icmp ne i32 %342, 1
  br i1 %343, label %344, label %350

; <label>:344:                                    ; preds = %340
  %pgocount39 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 30)
  %345 = add i64 %pgocount39, 1
  store i64 %345, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 30)
  %346 = load i8*, i8** %9, align 8
  %347 = load i16, i16* %12, align 2
  %348 = zext i16 %347 to i32
  %349 = call i32 (i8*, i8*, ...) @sprintf(i8* %346, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i32 0, i32 0), i32 %348) #4
  store i32 0, i32* %5, align 4
  br label %428

; <label>:350:                                    ; preds = %340
  %pgocount40 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 31)
  %351 = add i64 %pgocount40, 1
  store i64 %351, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 31)
  %352 = load %struct.tiff*, %struct.tiff** %7, align 8
  %353 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %352, i32 65560, i32 3)
  %354 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %355 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %354, i32 0, i32 9
  store i16 2, i16* %355, align 2
  %356 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %357 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %356, i32 0, i32 6
  store i16 8, i16* %357, align 4
  br label %366

; <label>:358:                                    ; preds = %126
  %pgocount41 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 15)
  %359 = add i64 %pgocount41, 1
  store i64 %359, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 15)
  %360 = load i8*, i8** %9, align 8
  %361 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %362 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %361, i32 0, i32 9
  %363 = load i16, i16* %362, align 2
  %364 = zext i16 %363 to i32
  %365 = call i32 (i8*, i8*, ...) @sprintf(i8* %360, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @photoTag, i32 0, i32 0), i32 %364) #4
  store i32 0, i32* %5, align 4
  br label %428

; <label>:366:                                    ; preds = %350, %319, %309, %281, %271, %244
  %367 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %368 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %367, i32 0, i32 15
  store i8* null, i8** %368, align 8
  %369 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %370 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %369, i32 0, i32 16
  store i32** null, i32*** %370, align 8
  %371 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %372 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %371, i32 0, i32 17
  store i32** null, i32*** %372, align 8
  %373 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %374 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %373, i32 0, i32 18
  store %struct.TIFFYCbCrToRGB* null, %struct.TIFFYCbCrToRGB** %374, align 8
  %375 = load %struct.tiff*, %struct.tiff** %7, align 8
  %376 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %377 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %376, i32 0, i32 4
  %378 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %375, i32 256, i32* %377)
  %379 = load %struct.tiff*, %struct.tiff** %7, align 8
  %380 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %381 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %380, i32 0, i32 5
  %382 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %379, i32 257, i32* %381)
  %383 = load %struct.tiff*, %struct.tiff** %7, align 8
  %384 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %385 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %384, i32 0, i32 8
  %386 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %383, i32 274, i16* %385)
  %387 = load i16, i16* %12, align 2
  %388 = zext i16 %387 to i32
  %389 = icmp eq i32 %388, 2
  br i1 %389, label %390, label %394

; <label>:390:                                    ; preds = %366
  %pgocount42 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 9)
  %391 = add i64 %pgocount42, 1
  store i64 %391, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 9)
  %392 = load i32, i32* %14, align 4
  %393 = icmp sgt i32 %392, 1
  br label %394

; <label>:394:                                    ; preds = %390, %366
  %395 = phi i1 [ false, %366 ], [ %393, %390 ]
  %396 = xor i1 %395, true
  %397 = zext i1 %396 to i32
  %398 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %399 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %398, i32 0, i32 2
  store i32 %397, i32* %399, align 4
  %400 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %401 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %400, i32 0, i32 2
  %402 = load i32, i32* %401, align 4
  %403 = icmp ne i32 %402, 0
  br i1 %403, label %404, label %415

; <label>:404:                                    ; preds = %394
  %405 = load %struct.tiff*, %struct.tiff** %7, align 8
  %406 = call i32 @TIFFIsTiled(%struct.tiff* %405)
  %407 = icmp ne i32 %406, 0
  %408 = zext i1 %407 to i64
  %pgocount43 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 39)
  %409 = add i64 %pgocount43, %408
  store i64 %409, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 39)
  %410 = select i1 %407, i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* @gtTileContig, i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* @gtStripContig
  %411 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %412 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %411, i32 0, i32 13
  store i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* %410, i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)** %412, align 8
  %413 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %414 = call i32 @pickTileContigCase(%struct._TIFFRGBAImage* %413)
  br label %427

; <label>:415:                                    ; preds = %394
  %pgocount44 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 11)
  %416 = add i64 %pgocount44, 1
  store i64 %416, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 11)
  %417 = load %struct.tiff*, %struct.tiff** %7, align 8
  %418 = call i32 @TIFFIsTiled(%struct.tiff* %417)
  %419 = icmp ne i32 %418, 0
  %420 = zext i1 %419 to i64
  %pgocount45 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 40)
  %421 = add i64 %pgocount45, %420
  store i64 %421, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_TIFFRGBAImageBegin, i64 0, i64 40)
  %422 = select i1 %419, i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* @gtTileSeparate, i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* @gtStripSeparate
  %423 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %424 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %423, i32 0, i32 13
  store i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* %422, i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)** %424, align 8
  %425 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %426 = call i32 @pickTileSeparateCase(%struct._TIFFRGBAImage* %425)
  br label %427

; <label>:427:                                    ; preds = %415, %404
  store i32 1, i32* %5, align 4
  br label %428

; <label>:428:                                    ; preds = %427, %358, %344, %336, %315, %301, %289, %276, %250, %232, %188, %136, %121, %49
  %429 = load i32, i32* %5, align 4
  ret i32 %429
}

declare i32 @TIFFGetFieldDefaulted(%struct.tiff*, i32, ...) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @isCCITTCompression(%struct.tiff*) #0 {
  %2 = alloca %struct.tiff*, align 8
  %3 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %2, align 8
  %4 = load %struct.tiff*, %struct.tiff** %2, align 8
  %5 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %4, i32 259, i16* %3)
  %6 = load i16, i16* %3, align 2
  %7 = zext i16 %6 to i32
  %8 = icmp eq i32 %7, 3
  br i1 %8, label %24, label %9

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_isCCITTCompression, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_isCCITTCompression, i64 0, i64 1)
  %11 = load i16, i16* %3, align 2
  %12 = zext i16 %11 to i32
  %13 = icmp eq i32 %12, 4
  br i1 %13, label %24, label %14

; <label>:14:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_isCCITTCompression, i64 0, i64 2)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_isCCITTCompression, i64 0, i64 2)
  %16 = load i16, i16* %3, align 2
  %17 = zext i16 %16 to i32
  %18 = icmp eq i32 %17, 2
  br i1 %18, label %24, label %19

; <label>:19:                                     ; preds = %14
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_isCCITTCompression, i64 0, i64 3)
  %20 = add i64 %pgocount2, 1
  store i64 %20, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_isCCITTCompression, i64 0, i64 3)
  %21 = load i16, i16* %3, align 2
  %22 = zext i16 %21 to i32
  %23 = icmp eq i32 %22, 32771
  br label %24

; <label>:24:                                     ; preds = %19, %14, %9, %1
  %25 = phi i1 [ true, %14 ], [ true, %9 ], [ true, %1 ], [ %23, %19 ]
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_isCCITTCompression, i64 0, i64 0)
  %26 = add i64 %pgocount3, 1
  store i64 %26, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_isCCITTCompression, i64 0, i64 0)
  %27 = zext i1 %25 to i32
  ret i32 %27
}

declare void @TIFFError(i8*, i8*, ...) #2

declare i8* @TIFFFileName(%struct.tiff*) #2

declare i8* @_TIFFmalloc(i32) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

declare i32 @TIFFSetField(%struct.tiff*, i32, ...) #2

declare i32 @TIFFIsTiled(%struct.tiff*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @gtTileContig(%struct._TIFFRGBAImage*, i32*, i32, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct._TIFFRGBAImage*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.tiff*, align 8
  %11 = alloca void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*, align 8
  %12 = alloca i16, align 2
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %6, align 8
  store i32* %1, i32** %7, align 8
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  %23 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %24 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %23, i32 0, i32 0
  %25 = load %struct.tiff*, %struct.tiff** %24, align 8
  store %struct.tiff* %25, %struct.tiff** %10, align 8
  %26 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %27 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %26, i32 0, i32 14
  %28 = bitcast %union.anon* %27 to void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)**
  %29 = load void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %28, align 8
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* %29, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %11, align 8
  %30 = load %struct.tiff*, %struct.tiff** %10, align 8
  %31 = call i32 @TIFFTileSize(%struct.tiff* %30)
  %32 = call i8* @_TIFFmalloc(i32 %31)
  store i8* %32, i8** %18, align 8
  %33 = load i8*, i8** %18, align 8
  %34 = icmp eq i8* %33, null
  br i1 %34, label %35, label %39

; <label>:35:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 7)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 7)
  %37 = load %struct.tiff*, %struct.tiff** %10, align 8
  %38 = call i8* @TIFFFileName(%struct.tiff* %37)
  call void (i8*, i8*, ...) @TIFFError(i8* %38, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.24, i32 0, i32 0))
  store i32 0, i32* %5, align 4
  br label %193

; <label>:39:                                     ; preds = %4
  %40 = load %struct.tiff*, %struct.tiff** %10, align 8
  %41 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %40, i32 322, i32* %16)
  %42 = load %struct.tiff*, %struct.tiff** %10, align 8
  %43 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %42, i32 323, i32* %17)
  %44 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %45 = load i32, i32* %9, align 4
  %46 = call i32 @setorientation(%struct._TIFFRGBAImage* %44, i32 %45)
  store i32 %46, i32* %15, align 4
  %47 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %48 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %47, i32 0, i32 8
  %49 = load i16, i16* %48, align 8
  store i16 %49, i16* %12, align 2
  %50 = load i16, i16* %12, align 2
  %51 = zext i16 %50 to i32
  %52 = icmp eq i32 %51, 1
  br i1 %52, label %53, label %58

; <label>:53:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 8)
  %54 = add i64 %pgocount1, 1
  store i64 %54, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 8)
  %55 = load i32, i32* %16, align 4
  %56 = load i32, i32* %8, align 4
  %57 = add i32 %55, %56
  br label %63

; <label>:58:                                     ; preds = %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 9)
  %59 = add i64 %pgocount2, 1
  store i64 %59, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 9)
  %60 = load i32, i32* %16, align 4
  %61 = load i32, i32* %8, align 4
  %62 = sub i32 %60, %61
  br label %63

; <label>:63:                                     ; preds = %58, %53
  %64 = phi i32 [ %57, %53 ], [ %62, %58 ]
  %65 = sub nsw i32 0, %64
  store i32 %65, i32* %20, align 4
  store i32 0, i32* %14, align 4
  br label %66

; <label>:66:                                     ; preds = %187, %63
  %67 = load i32, i32* %14, align 4
  %68 = load i32, i32* %9, align 4
  %69 = icmp ult i32 %67, %68
  br i1 %69, label %70, label %191

; <label>:70:                                     ; preds = %66
  %71 = load i32, i32* %14, align 4
  %72 = load i32, i32* %17, align 4
  %73 = add i32 %71, %72
  %74 = load i32, i32* %9, align 4
  %75 = icmp ugt i32 %73, %74
  br i1 %75, label %76, label %80

; <label>:76:                                     ; preds = %70
  %77 = load i32, i32* %9, align 4
  %78 = load i32, i32* %14, align 4
  %79 = sub i32 %77, %78
  br label %83

; <label>:80:                                     ; preds = %70
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 3)
  %81 = add i64 %pgocount3, 1
  store i64 %81, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 3)
  %82 = load i32, i32* %17, align 4
  br label %83

; <label>:83:                                     ; preds = %80, %76
  %84 = phi i32 [ %79, %76 ], [ %82, %80 ]
  store i32 %84, i32* %21, align 4
  store i32 0, i32* %13, align 4
  br label %85

; <label>:85:                                     ; preds = %168, %83
  %86 = load i32, i32* %13, align 4
  %87 = load i32, i32* %8, align 4
  %88 = icmp ult i32 %86, %87
  br i1 %88, label %89, label %172

; <label>:89:                                     ; preds = %85
  %90 = load %struct.tiff*, %struct.tiff** %10, align 8
  %91 = load i8*, i8** %18, align 8
  %92 = load i32, i32* %13, align 4
  %93 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %94 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %93, i32 0, i32 20
  %95 = load i32, i32* %94, align 4
  %96 = add i32 %92, %95
  %97 = load i32, i32* %14, align 4
  %98 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %99 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %98, i32 0, i32 19
  %100 = load i32, i32* %99, align 8
  %101 = add i32 %97, %100
  %102 = call i32 @TIFFReadTile(%struct.tiff* %90, i8* %91, i32 %96, i32 %101, i32 0, i16 zeroext 0)
  %103 = icmp slt i32 %102, 0
  br i1 %103, label %104, label %112

; <label>:104:                                    ; preds = %89
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 2)
  %105 = add i64 %pgocount4, 1
  store i64 %105, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 2)
  %106 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %107 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %106, i32 0, i32 1
  %108 = load i32, i32* %107, align 8
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %110, label %112

; <label>:110:                                    ; preds = %104
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 6)
  %111 = add i64 %pgocount5, 1
  store i64 %111, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 6)
  br label %172

; <label>:112:                                    ; preds = %104, %89
  %113 = load i32, i32* %13, align 4
  %114 = load i32, i32* %16, align 4
  %115 = add i32 %113, %114
  %116 = load i32, i32* %8, align 4
  %117 = icmp ugt i32 %115, %116
  br i1 %117, label %118, label %147

; <label>:118:                                    ; preds = %112
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 0)
  %119 = add i64 %pgocount6, 1
  store i64 %119, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 0)
  %120 = load i32, i32* %8, align 4
  %121 = load i32, i32* %13, align 4
  %122 = sub i32 %120, %121
  store i32 %122, i32* %22, align 4
  %123 = load i32, i32* %16, align 4
  %124 = load i32, i32* %22, align 4
  %125 = sub i32 %123, %124
  store i32 %125, i32* %19, align 4
  %126 = load void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %11, align 8
  %127 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %128 = load i32*, i32** %7, align 8
  %129 = load i32, i32* %15, align 4
  %130 = load i32, i32* %8, align 4
  %131 = mul i32 %129, %130
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds i32, i32* %128, i64 %132
  %134 = load i32, i32* %13, align 4
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds i32, i32* %133, i64 %135
  %137 = load i32, i32* %13, align 4
  %138 = load i32, i32* %15, align 4
  %139 = load i32, i32* %22, align 4
  %140 = load i32, i32* %21, align 4
  %141 = load i32, i32* %19, align 4
  %142 = load i32, i32* %20, align 4
  %143 = load i32, i32* %19, align 4
  %144 = add nsw i32 %142, %143
  %145 = load i8*, i8** %18, align 8
  %146 = ptrtoint void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* %126 to i64
  call void @__llvm_profile_instrument_target(i64 %146, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_gtTileContig to i8*), i32 0)
  call void %126(%struct._TIFFRGBAImage* %127, i32* %136, i32 %137, i32 %138, i32 %139, i32 %140, i32 %141, i32 %144, i8* %145)
  br label %167

; <label>:147:                                    ; preds = %112
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 1)
  %148 = add i64 %pgocount7, 1
  store i64 %148, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 1)
  %149 = load void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %11, align 8
  %150 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %151 = load i32*, i32** %7, align 8
  %152 = load i32, i32* %15, align 4
  %153 = load i32, i32* %8, align 4
  %154 = mul i32 %152, %153
  %155 = zext i32 %154 to i64
  %156 = getelementptr inbounds i32, i32* %151, i64 %155
  %157 = load i32, i32* %13, align 4
  %158 = zext i32 %157 to i64
  %159 = getelementptr inbounds i32, i32* %156, i64 %158
  %160 = load i32, i32* %13, align 4
  %161 = load i32, i32* %15, align 4
  %162 = load i32, i32* %16, align 4
  %163 = load i32, i32* %21, align 4
  %164 = load i32, i32* %20, align 4
  %165 = load i8*, i8** %18, align 8
  %166 = ptrtoint void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* %149 to i64
  call void @__llvm_profile_instrument_target(i64 %166, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_gtTileContig to i8*), i32 1)
  call void %149(%struct._TIFFRGBAImage* %150, i32* %159, i32 %160, i32 %161, i32 %162, i32 %163, i32 0, i32 %164, i8* %165)
  br label %167

; <label>:167:                                    ; preds = %147, %118
  br label %168

; <label>:168:                                    ; preds = %167
  %169 = load i32, i32* %16, align 4
  %170 = load i32, i32* %13, align 4
  %171 = add i32 %170, %169
  store i32 %171, i32* %13, align 4
  br label %85

; <label>:172:                                    ; preds = %110, %85
  %173 = load i16, i16* %12, align 2
  %174 = zext i16 %173 to i32
  %175 = icmp eq i32 %174, 1
  br i1 %175, label %176, label %180

; <label>:176:                                    ; preds = %172
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 4)
  %177 = add i64 %pgocount8, 1
  store i64 %177, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 4)
  %178 = load i32, i32* %21, align 4
  %179 = sub nsw i32 0, %178
  br label %183

; <label>:180:                                    ; preds = %172
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 5)
  %181 = add i64 %pgocount9, 1
  store i64 %181, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_gtTileContig, i64 0, i64 5)
  %182 = load i32, i32* %21, align 4
  br label %183

; <label>:183:                                    ; preds = %180, %176
  %184 = phi i32 [ %179, %176 ], [ %182, %180 ]
  %185 = load i32, i32* %15, align 4
  %186 = add i32 %185, %184
  store i32 %186, i32* %15, align 4
  br label %187

; <label>:187:                                    ; preds = %183
  %188 = load i32, i32* %17, align 4
  %189 = load i32, i32* %14, align 4
  %190 = add i32 %189, %188
  store i32 %190, i32* %14, align 4
  br label %66

; <label>:191:                                    ; preds = %66
  %192 = load i8*, i8** %18, align 8
  call void @_TIFFfree(i8* %192)
  store i32 1, i32* %5, align 4
  br label %193

; <label>:193:                                    ; preds = %191, %35
  %194 = load i32, i32* %5, align 4
  ret i32 %194
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @gtStripContig(%struct._TIFFRGBAImage*, i32*, i32, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct._TIFFRGBAImage*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.tiff*, align 8
  %11 = alloca void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*, align 8
  %12 = alloca i16, align 2
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i8*, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %6, align 8
  store i32* %1, i32** %7, align 8
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  %22 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %23 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %22, i32 0, i32 0
  %24 = load %struct.tiff*, %struct.tiff** %23, align 8
  store %struct.tiff* %24, %struct.tiff** %10, align 8
  %25 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %26 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %25, i32 0, i32 14
  %27 = bitcast %union.anon* %26 to void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)**
  %28 = load void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %27, align 8
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* %28, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %11, align 8
  %29 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %30 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %29, i32 0, i32 4
  %31 = load i32, i32* %30, align 4
  store i32 %31, i32* %18, align 4
  %32 = load %struct.tiff*, %struct.tiff** %10, align 8
  %33 = call i32 @TIFFStripSize(%struct.tiff* %32)
  %34 = call i8* @_TIFFmalloc(i32 %33)
  store i8* %34, i8** %16, align 8
  %35 = load i8*, i8** %16, align 8
  %36 = icmp eq i8* %35, null
  br i1 %36, label %37, label %41

; <label>:37:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_gtStripContig, i64 0, i64 4)
  %38 = add i64 %pgocount, 1
  store i64 %38, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_gtStripContig, i64 0, i64 4)
  %39 = load %struct.tiff*, %struct.tiff** %10, align 8
  %40 = call i8* @TIFFFileName(%struct.tiff* %39)
  call void (i8*, i8*, ...) @TIFFError(i8* %40, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.27, i32 0, i32 0))
  store i32 0, i32* %5, align 4
  br label %156

; <label>:41:                                     ; preds = %4
  %42 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %43 = load i32, i32* %9, align 4
  %44 = call i32 @setorientation(%struct._TIFFRGBAImage* %42, i32 %43)
  store i32 %44, i32* %14, align 4
  %45 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %46 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %45, i32 0, i32 8
  %47 = load i16, i16* %46, align 8
  store i16 %47, i16* %12, align 2
  %48 = load i16, i16* %12, align 2
  %49 = zext i16 %48 to i32
  %50 = icmp eq i32 %49, 1
  br i1 %50, label %51, label %55

; <label>:51:                                     ; preds = %41
  %52 = load i32, i32* %8, align 4
  %53 = load i32, i32* %8, align 4
  %54 = add i32 %52, %53
  br label %60

; <label>:55:                                     ; preds = %41
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_gtStripContig, i64 0, i64 5)
  %56 = add i64 %pgocount1, 1
  store i64 %56, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_gtStripContig, i64 0, i64 5)
  %57 = load i32, i32* %8, align 4
  %58 = load i32, i32* %8, align 4
  %59 = sub i32 %57, %58
  br label %60

; <label>:60:                                     ; preds = %55, %51
  %61 = phi i32 [ %54, %51 ], [ %59, %55 ]
  %62 = sub nsw i32 0, %61
  store i32 %62, i32* %21, align 4
  %63 = load %struct.tiff*, %struct.tiff** %10, align 8
  %64 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %63, i32 278, i32* %17)
  %65 = load %struct.tiff*, %struct.tiff** %10, align 8
  %66 = call i32 @TIFFScanlineSize(%struct.tiff* %65)
  store i32 %66, i32* %19, align 4
  %67 = load i32, i32* %8, align 4
  %68 = load i32, i32* %18, align 4
  %69 = icmp ult i32 %67, %68
  br i1 %69, label %70, label %75

; <label>:70:                                     ; preds = %60
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_gtStripContig, i64 0, i64 6)
  %71 = add i64 %pgocount2, 1
  store i64 %71, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_gtStripContig, i64 0, i64 6)
  %72 = load i32, i32* %18, align 4
  %73 = load i32, i32* %8, align 4
  %74 = sub i32 %72, %73
  br label %77

; <label>:75:                                     ; preds = %60
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_gtStripContig, i64 0, i64 7)
  %76 = add i64 %pgocount3, 1
  store i64 %76, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_gtStripContig, i64 0, i64 7)
  br label %77

; <label>:77:                                     ; preds = %75, %70
  %78 = phi i32 [ %74, %70 ], [ 0, %75 ]
  store i32 %78, i32* %20, align 4
  store i32 0, i32* %13, align 4
  br label %79

; <label>:79:                                     ; preds = %150, %77
  %80 = load i32, i32* %13, align 4
  %81 = load i32, i32* %9, align 4
  %82 = icmp ult i32 %80, %81
  br i1 %82, label %83, label %154

; <label>:83:                                     ; preds = %79
  %84 = load i32, i32* %13, align 4
  %85 = load i32, i32* %17, align 4
  %86 = add i32 %84, %85
  %87 = load i32, i32* %9, align 4
  %88 = icmp ugt i32 %86, %87
  br i1 %88, label %89, label %93

; <label>:89:                                     ; preds = %83
  %90 = load i32, i32* %9, align 4
  %91 = load i32, i32* %13, align 4
  %92 = sub i32 %90, %91
  br label %96

; <label>:93:                                     ; preds = %83
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_gtStripContig, i64 0, i64 0)
  %94 = add i64 %pgocount4, 1
  store i64 %94, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_gtStripContig, i64 0, i64 0)
  %95 = load i32, i32* %17, align 4
  br label %96

; <label>:96:                                     ; preds = %93, %89
  %97 = phi i32 [ %92, %89 ], [ %95, %93 ]
  store i32 %97, i32* %15, align 4
  %98 = load %struct.tiff*, %struct.tiff** %10, align 8
  %99 = load %struct.tiff*, %struct.tiff** %10, align 8
  %100 = load i32, i32* %13, align 4
  %101 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %102 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %101, i32 0, i32 19
  %103 = load i32, i32* %102, align 8
  %104 = add i32 %100, %103
  %105 = call i32 @TIFFComputeStrip(%struct.tiff* %99, i32 %104, i16 zeroext 0)
  %106 = load i8*, i8** %16, align 8
  %107 = load i32, i32* %15, align 4
  %108 = load i32, i32* %19, align 4
  %109 = mul i32 %107, %108
  %110 = call i32 @TIFFReadEncodedStrip(%struct.tiff* %98, i32 %105, i8* %106, i32 %109)
  %111 = icmp slt i32 %110, 0
  br i1 %111, label %112, label %120

; <label>:112:                                    ; preds = %96
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_gtStripContig, i64 0, i64 3)
  %113 = add i64 %pgocount5, 1
  store i64 %113, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_gtStripContig, i64 0, i64 3)
  %114 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %115 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %114, i32 0, i32 1
  %116 = load i32, i32* %115, align 8
  %117 = icmp ne i32 %116, 0
  br i1 %117, label %118, label %120

; <label>:118:                                    ; preds = %112
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_gtStripContig, i64 0, i64 8)
  %119 = add i64 %pgocount6, 1
  store i64 %119, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_gtStripContig, i64 0, i64 8)
  br label %154

; <label>:120:                                    ; preds = %112, %96
  %121 = load void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %11, align 8
  %122 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %123 = load i32*, i32** %7, align 8
  %124 = load i32, i32* %14, align 4
  %125 = load i32, i32* %8, align 4
  %126 = mul i32 %124, %125
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds i32, i32* %123, i64 %127
  %129 = load i32, i32* %14, align 4
  %130 = load i32, i32* %8, align 4
  %131 = load i32, i32* %15, align 4
  %132 = load i32, i32* %20, align 4
  %133 = load i32, i32* %21, align 4
  %134 = load i8*, i8** %16, align 8
  %135 = ptrtoint void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* %121 to i64
  call void @__llvm_profile_instrument_target(i64 %135, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_gtStripContig to i8*), i32 0)
  call void %121(%struct._TIFFRGBAImage* %122, i32* %128, i32 0, i32 %129, i32 %130, i32 %131, i32 %132, i32 %133, i8* %134)
  %136 = load i16, i16* %12, align 2
  %137 = zext i16 %136 to i32
  %138 = icmp eq i32 %137, 1
  br i1 %138, label %139, label %143

; <label>:139:                                    ; preds = %120
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_gtStripContig, i64 0, i64 1)
  %140 = add i64 %pgocount7, 1
  store i64 %140, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_gtStripContig, i64 0, i64 1)
  %141 = load i32, i32* %15, align 4
  %142 = sub nsw i32 0, %141
  br label %146

; <label>:143:                                    ; preds = %120
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_gtStripContig, i64 0, i64 2)
  %144 = add i64 %pgocount8, 1
  store i64 %144, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_gtStripContig, i64 0, i64 2)
  %145 = load i32, i32* %15, align 4
  br label %146

; <label>:146:                                    ; preds = %143, %139
  %147 = phi i32 [ %142, %139 ], [ %145, %143 ]
  %148 = load i32, i32* %14, align 4
  %149 = add i32 %148, %147
  store i32 %149, i32* %14, align 4
  br label %150

; <label>:150:                                    ; preds = %146
  %151 = load i32, i32* %17, align 4
  %152 = load i32, i32* %13, align 4
  %153 = add i32 %152, %151
  store i32 %153, i32* %13, align 4
  br label %79

; <label>:154:                                    ; preds = %118, %79
  %155 = load i8*, i8** %16, align 8
  call void @_TIFFfree(i8* %155)
  store i32 1, i32* %5, align 4
  br label %156

; <label>:156:                                    ; preds = %154, %37
  %157 = load i32, i32* %5, align 4
  ret i32 %157
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @pickTileContigCase(%struct._TIFFRGBAImage*) #0 {
  %2 = alloca %struct._TIFFRGBAImage*, align 8
  %3 = alloca void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*, align 8
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %2, align 8
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* null, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  %4 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %5 = call i32 @buildMap(%struct._TIFFRGBAImage* %4)
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %132

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 2)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 2)
  %9 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %9, i32 0, i32 9
  %11 = load i16, i16* %10, align 2
  %12 = zext i16 %11 to i32
  switch i32 %12, label %131 [
    i32 2, label %14
    i32 5, label %71
    i32 3, label %89
    i32 0, label %._crit_edge
    i32 1, label %104
    i32 6, label %119
  ]

._crit_edge:                                      ; preds = %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 0)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 0)
  br label %104

; <label>:14:                                     ; preds = %7
  %pgocount2 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 4)
  %15 = add i64 %pgocount2, 1
  store i64 %15, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 4)
  %16 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %17 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %16, i32 0, i32 6
  %18 = load i16, i16* %17, align 4
  %19 = zext i16 %18 to i32
  switch i32 %19, label %70 [
    i32 8, label %20
    i32 16, label %46
  ]

; <label>:20:                                     ; preds = %14
  %21 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %22 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %21, i32 0, i32 15
  %23 = load i8*, i8** %22, align 8
  %24 = icmp ne i8* %23, null
  br i1 %24, label %43, label %25

; <label>:25:                                     ; preds = %20
  %26 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %27 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %26, i32 0, i32 3
  %28 = load i32, i32* %27, align 8
  %29 = icmp eq i32 %28, 1
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %25
  %pgocount3 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 23)
  %31 = add i64 %pgocount3, 1
  store i64 %31, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 23)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBAAcontig8bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  br label %42

; <label>:32:                                     ; preds = %25
  %33 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %34 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %33, i32 0, i32 3
  %35 = load i32, i32* %34, align 8
  %36 = icmp eq i32 %35, 2
  br i1 %36, label %37, label %39

; <label>:37:                                     ; preds = %32
  %pgocount4 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 25)
  %38 = add i64 %pgocount4, 1
  store i64 %38, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 25)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBUAcontig8bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  br label %41

; <label>:39:                                     ; preds = %32
  %pgocount5 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 26)
  %40 = add i64 %pgocount5, 1
  store i64 %40, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 26)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBcontig8bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  br label %41

; <label>:41:                                     ; preds = %39, %37
  br label %42

; <label>:42:                                     ; preds = %41, %30
  br label %45

; <label>:43:                                     ; preds = %20
  %pgocount6 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 15)
  %44 = add i64 %pgocount6, 1
  store i64 %44, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 15)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBcontig8bitMaptile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  br label %45

; <label>:45:                                     ; preds = %43, %42
  br label %70

; <label>:46:                                     ; preds = %14
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBcontig16bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  %47 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %48 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %47, i32 0, i32 15
  %49 = load i8*, i8** %48, align 8
  %50 = icmp ne i8* %49, null
  br i1 %50, label %68, label %51

; <label>:51:                                     ; preds = %46
  %52 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %53 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %52, i32 0, i32 3
  %54 = load i32, i32* %53, align 8
  %55 = icmp eq i32 %54, 1
  br i1 %55, label %56, label %58

; <label>:56:                                     ; preds = %51
  %pgocount7 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 21)
  %57 = add i64 %pgocount7, 1
  store i64 %57, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 21)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBAAcontig16bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  br label %67

; <label>:58:                                     ; preds = %51
  %59 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %60 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %59, i32 0, i32 3
  %61 = load i32, i32* %60, align 8
  %62 = icmp eq i32 %61, 2
  br i1 %62, label %63, label %65

; <label>:63:                                     ; preds = %58
  %pgocount8 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 24)
  %64 = add i64 %pgocount8, 1
  store i64 %64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 24)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBUAcontig16bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  br label %65

; <label>:65:                                     ; preds = %63, %58
  %pgocount9 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 22)
  %66 = add i64 %pgocount9, 1
  store i64 %66, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 22)
  br label %67

; <label>:67:                                     ; preds = %65, %56
  br label %68

; <label>:68:                                     ; preds = %67, %46
  %pgocount10 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 13)
  %69 = add i64 %pgocount10, 1
  store i64 %69, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 13)
  br label %70

; <label>:70:                                     ; preds = %68, %45, %14
  br label %131

; <label>:71:                                     ; preds = %7
  %pgocount11 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 5)
  %72 = add i64 %pgocount11, 1
  store i64 %72, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 5)
  %73 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %74 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %73, i32 0, i32 6
  %75 = load i16, i16* %74, align 4
  %76 = zext i16 %75 to i32
  %77 = icmp eq i32 %76, 8
  br i1 %77, label %78, label %88

; <label>:78:                                     ; preds = %71
  %79 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %80 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %79, i32 0, i32 15
  %81 = load i8*, i8** %80, align 8
  %82 = icmp ne i8* %81, null
  br i1 %82, label %85, label %83

; <label>:83:                                     ; preds = %78
  %pgocount12 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 20)
  %84 = add i64 %pgocount12, 1
  store i64 %84, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 20)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBcontig8bitCMYKtile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  br label %87

; <label>:85:                                     ; preds = %78
  %pgocount13 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 14)
  %86 = add i64 %pgocount13, 1
  store i64 %86, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 14)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBcontig8bitCMYKMaptile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  br label %87

; <label>:87:                                     ; preds = %85, %83
  br label %88

; <label>:88:                                     ; preds = %87, %71
  br label %131

; <label>:89:                                     ; preds = %7
  %pgocount14 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 6)
  %90 = add i64 %pgocount14, 1
  store i64 %90, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 6)
  %91 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %92 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %91, i32 0, i32 6
  %93 = load i16, i16* %92, align 4
  %94 = zext i16 %93 to i32
  switch i32 %94, label %103 [
    i32 8, label %95
    i32 4, label %97
    i32 2, label %99
    i32 1, label %101
  ]

; <label>:95:                                     ; preds = %89
  %pgocount15 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 16)
  %96 = add i64 %pgocount15, 1
  store i64 %96, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 16)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put8bitcmaptile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  br label %103

; <label>:97:                                     ; preds = %89
  %pgocount16 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 17)
  %98 = add i64 %pgocount16, 1
  store i64 %98, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 17)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put4bitcmaptile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  br label %103

; <label>:99:                                     ; preds = %89
  %pgocount17 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 18)
  %100 = add i64 %pgocount17, 1
  store i64 %100, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 18)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put2bitcmaptile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  br label %103

; <label>:101:                                    ; preds = %89
  %pgocount18 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 19)
  %102 = add i64 %pgocount18, 1
  store i64 %102, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 19)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put1bitcmaptile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  br label %103

; <label>:103:                                    ; preds = %101, %99, %97, %95, %89
  br label %131

; <label>:104:                                    ; preds = %._crit_edge, %7
  %105 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %106 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %105, i32 0, i32 6
  %107 = load i16, i16* %106, align 4
  %108 = zext i16 %107 to i32
  switch i32 %108, label %117 [
    i32 8, label %109
    i32 4, label %111
    i32 2, label %113
    i32 1, label %115
  ]

; <label>:109:                                    ; preds = %104
  %pgocount19 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 9)
  %110 = add i64 %pgocount19, 1
  store i64 %110, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 9)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putgreytile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  br label %117

; <label>:111:                                    ; preds = %104
  %pgocount20 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 10)
  %112 = add i64 %pgocount20, 1
  store i64 %112, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 10)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put4bitbwtile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  br label %117

; <label>:113:                                    ; preds = %104
  %pgocount21 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 11)
  %114 = add i64 %pgocount21, 1
  store i64 %114, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 11)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put2bitbwtile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  br label %117

; <label>:115:                                    ; preds = %104
  %pgocount22 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 12)
  %116 = add i64 %pgocount22, 1
  store i64 %116, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 12)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put1bitbwtile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  br label %117

; <label>:117:                                    ; preds = %115, %113, %111, %109, %104
  %pgocount23 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 3)
  %118 = add i64 %pgocount23, 1
  store i64 %118, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 3)
  br label %131

; <label>:119:                                    ; preds = %7
  %120 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %121 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %120, i32 0, i32 6
  %122 = load i16, i16* %121, align 4
  %123 = zext i16 %122 to i32
  %124 = icmp eq i32 %123, 8
  br i1 %124, label %125, label %129

; <label>:125:                                    ; preds = %119
  %pgocount24 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 8)
  %126 = add i64 %pgocount24, 1
  store i64 %126, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 8)
  %127 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %128 = call void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @initYCbCrConversion(%struct._TIFFRGBAImage* %127)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* %128, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  br label %129

; <label>:129:                                    ; preds = %125, %119
  %pgocount25 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 7)
  %130 = add i64 %pgocount25, 1
  store i64 %130, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 7)
  br label %131

; <label>:131:                                    ; preds = %129, %117, %103, %88, %70, %7
  br label %132

; <label>:132:                                    ; preds = %131, %1
  %pgocount26 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 1)
  %133 = add i64 %pgocount26, 1
  store i64 %133, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_pickTileContigCase, i64 0, i64 1)
  %134 = load void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %3, align 8
  %135 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %136 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %135, i32 0, i32 14
  %137 = bitcast %union.anon* %136 to void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)**
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* %134, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %137, align 8
  %138 = icmp ne void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* %134, null
  %139 = zext i1 %138 to i32
  ret i32 %139
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @gtTileSeparate(%struct._TIFFRGBAImage*, i32*, i32, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct._TIFFRGBAImage*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.tiff*, align 8
  %11 = alloca void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)*, align 8
  %12 = alloca i16, align 2
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i8*, align 8
  %20 = alloca i8*, align 8
  %21 = alloca i8*, align 8
  %22 = alloca i8*, align 8
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %6, align 8
  store i32* %1, i32** %7, align 8
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  %29 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %30 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %29, i32 0, i32 0
  %31 = load %struct.tiff*, %struct.tiff** %30, align 8
  store %struct.tiff* %31, %struct.tiff** %10, align 8
  %32 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %33 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %32, i32 0, i32 14
  %34 = bitcast %union.anon* %33 to void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)**
  %35 = load void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)*, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %34, align 8
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* %35, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %11, align 8
  %36 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %37 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %36, i32 0, i32 3
  %38 = load i32, i32* %37, align 8
  store i32 %38, i32* %26, align 4
  %39 = load %struct.tiff*, %struct.tiff** %10, align 8
  %40 = call i32 @TIFFTileSize(%struct.tiff* %39)
  store i32 %40, i32* %23, align 4
  %41 = load i32, i32* %23, align 4
  %42 = mul nsw i32 4, %41
  %43 = call i8* @_TIFFmalloc(i32 %42)
  store i8* %43, i8** %18, align 8
  %44 = load i8*, i8** %18, align 8
  %45 = icmp eq i8* %44, null
  br i1 %45, label %46, label %50

; <label>:46:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 14)
  %47 = add i64 %pgocount, 1
  store i64 %47, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 14)
  %48 = load %struct.tiff*, %struct.tiff** %10, align 8
  %49 = call i8* @TIFFFileName(%struct.tiff* %48)
  call void (i8*, i8*, ...) @TIFFError(i8* %49, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.24, i32 0, i32 0))
  store i32 0, i32* %5, align 4
  br label %304

; <label>:50:                                     ; preds = %4
  %51 = load i8*, i8** %18, align 8
  store i8* %51, i8** %19, align 8
  %52 = load i8*, i8** %19, align 8
  %53 = load i32, i32* %23, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8, i8* %52, i64 %54
  store i8* %55, i8** %20, align 8
  %56 = load i8*, i8** %20, align 8
  %57 = load i32, i32* %23, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8, i8* %56, i64 %58
  store i8* %59, i8** %21, align 8
  %60 = load i8*, i8** %21, align 8
  %61 = load i32, i32* %23, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8* %60, i64 %62
  store i8* %63, i8** %22, align 8
  %64 = load i32, i32* %26, align 4
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %71, label %66

; <label>:66:                                     ; preds = %50
  %pgocount1 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 17)
  %67 = add i64 %pgocount1, 1
  store i64 %67, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 17)
  %68 = load i8*, i8** %22, align 8
  %69 = load i32, i32* %23, align 4
  %70 = sext i32 %69 to i64
  call void @llvm.memset.p0i8.i64(i8* %68, i8 -1, i64 %70, i32 1, i1 false)
  br label %71

; <label>:71:                                     ; preds = %66, %50
  %72 = load %struct.tiff*, %struct.tiff** %10, align 8
  %73 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %72, i32 322, i32* %16)
  %74 = load %struct.tiff*, %struct.tiff** %10, align 8
  %75 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %74, i32 323, i32* %17)
  %76 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %77 = load i32, i32* %9, align 4
  %78 = call i32 @setorientation(%struct._TIFFRGBAImage* %76, i32 %77)
  store i32 %78, i32* %15, align 4
  %79 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %80 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %79, i32 0, i32 8
  %81 = load i16, i16* %80, align 8
  store i16 %81, i16* %12, align 2
  %82 = load i16, i16* %12, align 2
  %83 = zext i16 %82 to i32
  %84 = icmp eq i32 %83, 1
  br i1 %84, label %85, label %90

; <label>:85:                                     ; preds = %71
  %pgocount2 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 15)
  %86 = add i64 %pgocount2, 1
  store i64 %86, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 15)
  %87 = load i32, i32* %16, align 4
  %88 = load i32, i32* %8, align 4
  %89 = add i32 %87, %88
  br label %95

; <label>:90:                                     ; preds = %71
  %pgocount3 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 16)
  %91 = add i64 %pgocount3, 1
  store i64 %91, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 16)
  %92 = load i32, i32* %16, align 4
  %93 = load i32, i32* %8, align 4
  %94 = sub i32 %92, %93
  br label %95

; <label>:95:                                     ; preds = %90, %85
  %96 = phi i32 [ %89, %85 ], [ %94, %90 ]
  %97 = sub nsw i32 0, %96
  store i32 %97, i32* %25, align 4
  store i32 0, i32* %14, align 4
  br label %98

; <label>:98:                                     ; preds = %298, %95
  %99 = load i32, i32* %14, align 4
  %100 = load i32, i32* %9, align 4
  %101 = icmp ult i32 %99, %100
  br i1 %101, label %102, label %302

; <label>:102:                                    ; preds = %98
  %103 = load i32, i32* %14, align 4
  %104 = load i32, i32* %17, align 4
  %105 = add i32 %103, %104
  %106 = load i32, i32* %9, align 4
  %107 = icmp ugt i32 %105, %106
  br i1 %107, label %108, label %112

; <label>:108:                                    ; preds = %102
  %109 = load i32, i32* %9, align 4
  %110 = load i32, i32* %14, align 4
  %111 = sub i32 %109, %110
  br label %115

; <label>:112:                                    ; preds = %102
  %pgocount4 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 7)
  %113 = add i64 %pgocount4, 1
  store i64 %113, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 7)
  %114 = load i32, i32* %17, align 4
  br label %115

; <label>:115:                                    ; preds = %112, %108
  %116 = phi i32 [ %111, %108 ], [ %114, %112 ]
  store i32 %116, i32* %27, align 4
  store i32 0, i32* %13, align 4
  br label %117

; <label>:117:                                    ; preds = %279, %115
  %118 = load i32, i32* %13, align 4
  %119 = load i32, i32* %8, align 4
  %120 = icmp ult i32 %118, %119
  br i1 %120, label %121, label %283

; <label>:121:                                    ; preds = %117
  %122 = load %struct.tiff*, %struct.tiff** %10, align 8
  %123 = load i8*, i8** %19, align 8
  %124 = load i32, i32* %13, align 4
  %125 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %126 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %125, i32 0, i32 20
  %127 = load i32, i32* %126, align 4
  %128 = add i32 %124, %127
  %129 = load i32, i32* %14, align 4
  %130 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %131 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %130, i32 0, i32 19
  %132 = load i32, i32* %131, align 8
  %133 = add i32 %129, %132
  %134 = call i32 @TIFFReadTile(%struct.tiff* %122, i8* %123, i32 %128, i32 %133, i32 0, i16 zeroext 0)
  %135 = icmp slt i32 %134, 0
  br i1 %135, label %136, label %144

; <label>:136:                                    ; preds = %121
  %pgocount5 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 3)
  %137 = add i64 %pgocount5, 1
  store i64 %137, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 3)
  %138 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %139 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %138, i32 0, i32 1
  %140 = load i32, i32* %139, align 8
  %141 = icmp ne i32 %140, 0
  br i1 %141, label %142, label %144

; <label>:142:                                    ; preds = %136
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 10)
  %143 = add i64 %pgocount6, 1
  store i64 %143, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 10)
  br label %283

; <label>:144:                                    ; preds = %136, %121
  %145 = load %struct.tiff*, %struct.tiff** %10, align 8
  %146 = load i8*, i8** %20, align 8
  %147 = load i32, i32* %13, align 4
  %148 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %149 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %148, i32 0, i32 20
  %150 = load i32, i32* %149, align 4
  %151 = add i32 %147, %150
  %152 = load i32, i32* %14, align 4
  %153 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %154 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %153, i32 0, i32 19
  %155 = load i32, i32* %154, align 8
  %156 = add i32 %152, %155
  %157 = call i32 @TIFFReadTile(%struct.tiff* %145, i8* %146, i32 %151, i32 %156, i32 0, i16 zeroext 1)
  %158 = icmp slt i32 %157, 0
  br i1 %158, label %159, label %167

; <label>:159:                                    ; preds = %144
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 4)
  %160 = add i64 %pgocount7, 1
  store i64 %160, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 4)
  %161 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %162 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %161, i32 0, i32 1
  %163 = load i32, i32* %162, align 8
  %164 = icmp ne i32 %163, 0
  br i1 %164, label %165, label %167

; <label>:165:                                    ; preds = %159
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 11)
  %166 = add i64 %pgocount8, 1
  store i64 %166, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 11)
  br label %283

; <label>:167:                                    ; preds = %159, %144
  %168 = load %struct.tiff*, %struct.tiff** %10, align 8
  %169 = load i8*, i8** %21, align 8
  %170 = load i32, i32* %13, align 4
  %171 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %172 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %171, i32 0, i32 20
  %173 = load i32, i32* %172, align 4
  %174 = add i32 %170, %173
  %175 = load i32, i32* %14, align 4
  %176 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %177 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %176, i32 0, i32 19
  %178 = load i32, i32* %177, align 8
  %179 = add i32 %175, %178
  %180 = call i32 @TIFFReadTile(%struct.tiff* %168, i8* %169, i32 %174, i32 %179, i32 0, i16 zeroext 2)
  %181 = icmp slt i32 %180, 0
  br i1 %181, label %182, label %190

; <label>:182:                                    ; preds = %167
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 5)
  %183 = add i64 %pgocount9, 1
  store i64 %183, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 5)
  %184 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %185 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %184, i32 0, i32 1
  %186 = load i32, i32* %185, align 8
  %187 = icmp ne i32 %186, 0
  br i1 %187, label %188, label %190

; <label>:188:                                    ; preds = %182
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 12)
  %189 = add i64 %pgocount10, 1
  store i64 %189, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 12)
  br label %283

; <label>:190:                                    ; preds = %182, %167
  %191 = load i32, i32* %26, align 4
  %192 = icmp ne i32 %191, 0
  br i1 %192, label %193, label %217

; <label>:193:                                    ; preds = %190
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 0)
  %194 = add i64 %pgocount11, 1
  store i64 %194, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 0)
  %195 = load %struct.tiff*, %struct.tiff** %10, align 8
  %196 = load i8*, i8** %22, align 8
  %197 = load i32, i32* %13, align 4
  %198 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %199 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %198, i32 0, i32 20
  %200 = load i32, i32* %199, align 4
  %201 = add i32 %197, %200
  %202 = load i32, i32* %14, align 4
  %203 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %204 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %203, i32 0, i32 19
  %205 = load i32, i32* %204, align 8
  %206 = add i32 %202, %205
  %207 = call i32 @TIFFReadTile(%struct.tiff* %195, i8* %196, i32 %201, i32 %206, i32 0, i16 zeroext 3)
  %208 = icmp slt i32 %207, 0
  br i1 %208, label %209, label %217

; <label>:209:                                    ; preds = %193
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 6)
  %210 = add i64 %pgocount12, 1
  store i64 %210, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 6)
  %211 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %212 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %211, i32 0, i32 1
  %213 = load i32, i32* %212, align 8
  %214 = icmp ne i32 %213, 0
  br i1 %214, label %215, label %217

; <label>:215:                                    ; preds = %209
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 13)
  %216 = add i64 %pgocount13, 1
  store i64 %216, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 13)
  br label %283

; <label>:217:                                    ; preds = %209, %193, %190
  %218 = load i32, i32* %13, align 4
  %219 = load i32, i32* %16, align 4
  %220 = add i32 %218, %219
  %221 = load i32, i32* %8, align 4
  %222 = icmp ugt i32 %220, %221
  br i1 %222, label %223, label %255

; <label>:223:                                    ; preds = %217
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 1)
  %224 = add i64 %pgocount14, 1
  store i64 %224, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 1)
  %225 = load i32, i32* %8, align 4
  %226 = load i32, i32* %13, align 4
  %227 = sub i32 %225, %226
  store i32 %227, i32* %28, align 4
  %228 = load i32, i32* %16, align 4
  %229 = load i32, i32* %28, align 4
  %230 = sub i32 %228, %229
  store i32 %230, i32* %24, align 4
  %231 = load void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)*, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %11, align 8
  %232 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %233 = load i32*, i32** %7, align 8
  %234 = load i32, i32* %15, align 4
  %235 = load i32, i32* %8, align 4
  %236 = mul i32 %234, %235
  %237 = zext i32 %236 to i64
  %238 = getelementptr inbounds i32, i32* %233, i64 %237
  %239 = load i32, i32* %13, align 4
  %240 = zext i32 %239 to i64
  %241 = getelementptr inbounds i32, i32* %238, i64 %240
  %242 = load i32, i32* %13, align 4
  %243 = load i32, i32* %15, align 4
  %244 = load i32, i32* %28, align 4
  %245 = load i32, i32* %27, align 4
  %246 = load i32, i32* %24, align 4
  %247 = load i32, i32* %25, align 4
  %248 = load i32, i32* %24, align 4
  %249 = add nsw i32 %247, %248
  %250 = load i8*, i8** %19, align 8
  %251 = load i8*, i8** %20, align 8
  %252 = load i8*, i8** %21, align 8
  %253 = load i8*, i8** %22, align 8
  %254 = ptrtoint void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* %231 to i64
  call void @__llvm_profile_instrument_target(i64 %254, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_gtTileSeparate to i8*), i32 0)
  call void %231(%struct._TIFFRGBAImage* %232, i32* %241, i32 %242, i32 %243, i32 %244, i32 %245, i32 %246, i32 %249, i8* %250, i8* %251, i8* %252, i8* %253)
  br label %278

; <label>:255:                                    ; preds = %217
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 2)
  %256 = add i64 %pgocount15, 1
  store i64 %256, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 2)
  %257 = load void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)*, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %11, align 8
  %258 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %259 = load i32*, i32** %7, align 8
  %260 = load i32, i32* %15, align 4
  %261 = load i32, i32* %8, align 4
  %262 = mul i32 %260, %261
  %263 = zext i32 %262 to i64
  %264 = getelementptr inbounds i32, i32* %259, i64 %263
  %265 = load i32, i32* %13, align 4
  %266 = zext i32 %265 to i64
  %267 = getelementptr inbounds i32, i32* %264, i64 %266
  %268 = load i32, i32* %13, align 4
  %269 = load i32, i32* %15, align 4
  %270 = load i32, i32* %16, align 4
  %271 = load i32, i32* %27, align 4
  %272 = load i32, i32* %25, align 4
  %273 = load i8*, i8** %19, align 8
  %274 = load i8*, i8** %20, align 8
  %275 = load i8*, i8** %21, align 8
  %276 = load i8*, i8** %22, align 8
  %277 = ptrtoint void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* %257 to i64
  call void @__llvm_profile_instrument_target(i64 %277, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_gtTileSeparate to i8*), i32 1)
  call void %257(%struct._TIFFRGBAImage* %258, i32* %267, i32 %268, i32 %269, i32 %270, i32 %271, i32 0, i32 %272, i8* %273, i8* %274, i8* %275, i8* %276)
  br label %278

; <label>:278:                                    ; preds = %255, %223
  br label %279

; <label>:279:                                    ; preds = %278
  %280 = load i32, i32* %16, align 4
  %281 = load i32, i32* %13, align 4
  %282 = add i32 %281, %280
  store i32 %282, i32* %13, align 4
  br label %117

; <label>:283:                                    ; preds = %215, %188, %165, %142, %117
  %284 = load i16, i16* %12, align 2
  %285 = zext i16 %284 to i32
  %286 = icmp eq i32 %285, 1
  br i1 %286, label %287, label %291

; <label>:287:                                    ; preds = %283
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 8)
  %288 = add i64 %pgocount16, 1
  store i64 %288, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 8)
  %289 = load i32, i32* %27, align 4
  %290 = sub nsw i32 0, %289
  br label %294

; <label>:291:                                    ; preds = %283
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 9)
  %292 = add i64 %pgocount17, 1
  store i64 %292, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_gtTileSeparate, i64 0, i64 9)
  %293 = load i32, i32* %27, align 4
  br label %294

; <label>:294:                                    ; preds = %291, %287
  %295 = phi i32 [ %290, %287 ], [ %293, %291 ]
  %296 = load i32, i32* %15, align 4
  %297 = add i32 %296, %295
  store i32 %297, i32* %15, align 4
  br label %298

; <label>:298:                                    ; preds = %294
  %299 = load i32, i32* %17, align 4
  %300 = load i32, i32* %14, align 4
  %301 = add i32 %300, %299
  store i32 %301, i32* %14, align 4
  br label %98

; <label>:302:                                    ; preds = %98
  %303 = load i8*, i8** %18, align 8
  call void @_TIFFfree(i8* %303)
  store i32 1, i32* %5, align 4
  br label %304

; <label>:304:                                    ; preds = %302, %46
  %305 = load i32, i32* %5, align 4
  ret i32 %305
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @gtStripSeparate(%struct._TIFFRGBAImage*, i32*, i32, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct._TIFFRGBAImage*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.tiff*, align 8
  %11 = alloca void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)*, align 8
  %12 = alloca i16, align 2
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i8*, align 8
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %6, align 8
  store i32* %1, i32** %7, align 8
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  %29 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %30 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %29, i32 0, i32 0
  %31 = load %struct.tiff*, %struct.tiff** %30, align 8
  store %struct.tiff* %31, %struct.tiff** %10, align 8
  %32 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %33 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %32, i32 0, i32 14
  %34 = bitcast %union.anon* %33 to void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)**
  %35 = load void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)*, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %34, align 8
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* %35, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %11, align 8
  %36 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %37 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %36, i32 0, i32 4
  %38 = load i32, i32* %37, align 4
  store i32 %38, i32* %24, align 4
  %39 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %40 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %39, i32 0, i32 3
  %41 = load i32, i32* %40, align 8
  store i32 %41, i32* %28, align 4
  %42 = load %struct.tiff*, %struct.tiff** %10, align 8
  %43 = call i32 @TIFFStripSize(%struct.tiff* %42)
  store i32 %43, i32* %25, align 4
  %44 = load i32, i32* %25, align 4
  %45 = mul nsw i32 4, %44
  %46 = call i8* @_TIFFmalloc(i32 %45)
  store i8* %46, i8** %13, align 8
  store i8* %46, i8** %14, align 8
  %47 = load i8*, i8** %13, align 8
  %48 = icmp eq i8* %47, null
  br i1 %48, label %49, label %53

; <label>:49:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 8)
  %50 = add i64 %pgocount, 1
  store i64 %50, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 8)
  %51 = load %struct.tiff*, %struct.tiff** %10, align 8
  %52 = call i8* @TIFFFileName(%struct.tiff* %51)
  call void (i8*, i8*, ...) @TIFFError(i8* %52, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.24, i32 0, i32 0))
  store i32 0, i32* %5, align 4
  br label %253

; <label>:53:                                     ; preds = %4
  %54 = load i8*, i8** %14, align 8
  %55 = load i32, i32* %25, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8* %54, i64 %56
  store i8* %57, i8** %15, align 8
  %58 = load i8*, i8** %15, align 8
  %59 = load i32, i32* %25, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8* %58, i64 %60
  store i8* %61, i8** %16, align 8
  %62 = load i8*, i8** %16, align 8
  %63 = load i32, i32* %25, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i8, i8* %62, i64 %64
  store i8* %65, i8** %17, align 8
  %66 = load i32, i32* %28, align 4
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %73, label %68

; <label>:68:                                     ; preds = %53
  %pgocount1 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 12)
  %69 = add i64 %pgocount1, 1
  store i64 %69, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 12)
  %70 = load i8*, i8** %17, align 8
  %71 = load i32, i32* %25, align 4
  %72 = sext i32 %71 to i64
  call void @llvm.memset.p0i8.i64(i8* %70, i8 -1, i64 %72, i32 1, i1 false)
  br label %73

; <label>:73:                                     ; preds = %68, %53
  %74 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %75 = load i32, i32* %9, align 4
  %76 = call i32 @setorientation(%struct._TIFFRGBAImage* %74, i32 %75)
  store i32 %76, i32* %19, align 4
  %77 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %78 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %77, i32 0, i32 8
  %79 = load i16, i16* %78, align 8
  store i16 %79, i16* %12, align 2
  %80 = load i16, i16* %12, align 2
  %81 = zext i16 %80 to i32
  %82 = icmp eq i32 %81, 1
  br i1 %82, label %83, label %87

; <label>:83:                                     ; preds = %73
  %84 = load i32, i32* %8, align 4
  %85 = load i32, i32* %8, align 4
  %86 = add i32 %84, %85
  br label %92

; <label>:87:                                     ; preds = %73
  %pgocount2 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 9)
  %88 = add i64 %pgocount2, 1
  store i64 %88, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 9)
  %89 = load i32, i32* %8, align 4
  %90 = load i32, i32* %8, align 4
  %91 = sub i32 %89, %90
  br label %92

; <label>:92:                                     ; preds = %87, %83
  %93 = phi i32 [ %86, %83 ], [ %91, %87 ]
  %94 = sub nsw i32 0, %93
  store i32 %94, i32* %27, align 4
  %95 = load %struct.tiff*, %struct.tiff** %10, align 8
  %96 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %95, i32 278, i32* %22)
  %97 = load %struct.tiff*, %struct.tiff** %10, align 8
  %98 = call i32 @TIFFScanlineSize(%struct.tiff* %97)
  store i32 %98, i32* %21, align 4
  %99 = load i32, i32* %8, align 4
  %100 = load i32, i32* %24, align 4
  %101 = icmp ult i32 %99, %100
  br i1 %101, label %102, label %107

; <label>:102:                                    ; preds = %92
  %pgocount3 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 10)
  %103 = add i64 %pgocount3, 1
  store i64 %103, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 10)
  %104 = load i32, i32* %24, align 4
  %105 = load i32, i32* %8, align 4
  %106 = sub i32 %104, %105
  br label %109

; <label>:107:                                    ; preds = %92
  %pgocount4 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 11)
  %108 = add i64 %pgocount4, 1
  store i64 %108, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 11)
  br label %109

; <label>:109:                                    ; preds = %107, %102
  %110 = phi i32 [ %106, %102 ], [ 0, %107 ]
  store i32 %110, i32* %26, align 4
  store i32 0, i32* %18, align 4
  br label %111

; <label>:111:                                    ; preds = %247, %109
  %112 = load i32, i32* %18, align 4
  %113 = load i32, i32* %9, align 4
  %114 = icmp ult i32 %112, %113
  br i1 %114, label %115, label %251

; <label>:115:                                    ; preds = %111
  %116 = load i32, i32* %18, align 4
  %117 = load i32, i32* %22, align 4
  %118 = add i32 %116, %117
  %119 = load i32, i32* %9, align 4
  %120 = icmp ugt i32 %118, %119
  br i1 %120, label %121, label %125

; <label>:121:                                    ; preds = %115
  %122 = load i32, i32* %9, align 4
  %123 = load i32, i32* %18, align 4
  %124 = sub i32 %122, %123
  br label %128

; <label>:125:                                    ; preds = %115
  %pgocount5 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 1)
  %126 = add i64 %pgocount5, 1
  store i64 %126, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 1)
  %127 = load i32, i32* %22, align 4
  br label %128

; <label>:128:                                    ; preds = %125, %121
  %129 = phi i32 [ %124, %121 ], [ %127, %125 ]
  store i32 %129, i32* %20, align 4
  %130 = load i32, i32* %18, align 4
  %131 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %132 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %131, i32 0, i32 19
  %133 = load i32, i32* %132, align 8
  %134 = add i32 %130, %133
  store i32 %134, i32* %23, align 4
  %135 = load %struct.tiff*, %struct.tiff** %10, align 8
  %136 = load %struct.tiff*, %struct.tiff** %10, align 8
  %137 = load i32, i32* %23, align 4
  %138 = call i32 @TIFFComputeStrip(%struct.tiff* %136, i32 %137, i16 zeroext 0)
  %139 = load i8*, i8** %14, align 8
  %140 = load i32, i32* %20, align 4
  %141 = load i32, i32* %21, align 4
  %142 = mul i32 %140, %141
  %143 = call i32 @TIFFReadEncodedStrip(%struct.tiff* %135, i32 %138, i8* %139, i32 %142)
  %144 = icmp slt i32 %143, 0
  br i1 %144, label %145, label %153

; <label>:145:                                    ; preds = %128
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 4)
  %146 = add i64 %pgocount6, 1
  store i64 %146, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 4)
  %147 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %148 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %147, i32 0, i32 1
  %149 = load i32, i32* %148, align 8
  %150 = icmp ne i32 %149, 0
  br i1 %150, label %151, label %153

; <label>:151:                                    ; preds = %145
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 13)
  %152 = add i64 %pgocount7, 1
  store i64 %152, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 13)
  br label %251

; <label>:153:                                    ; preds = %145, %128
  %154 = load %struct.tiff*, %struct.tiff** %10, align 8
  %155 = load %struct.tiff*, %struct.tiff** %10, align 8
  %156 = load i32, i32* %23, align 4
  %157 = call i32 @TIFFComputeStrip(%struct.tiff* %155, i32 %156, i16 zeroext 1)
  %158 = load i8*, i8** %15, align 8
  %159 = load i32, i32* %20, align 4
  %160 = load i32, i32* %21, align 4
  %161 = mul i32 %159, %160
  %162 = call i32 @TIFFReadEncodedStrip(%struct.tiff* %154, i32 %157, i8* %158, i32 %161)
  %163 = icmp slt i32 %162, 0
  br i1 %163, label %164, label %172

; <label>:164:                                    ; preds = %153
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 5)
  %165 = add i64 %pgocount8, 1
  store i64 %165, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 5)
  %166 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %167 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %166, i32 0, i32 1
  %168 = load i32, i32* %167, align 8
  %169 = icmp ne i32 %168, 0
  br i1 %169, label %170, label %172

; <label>:170:                                    ; preds = %164
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 14)
  %171 = add i64 %pgocount9, 1
  store i64 %171, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 14)
  br label %251

; <label>:172:                                    ; preds = %164, %153
  %173 = load %struct.tiff*, %struct.tiff** %10, align 8
  %174 = load %struct.tiff*, %struct.tiff** %10, align 8
  %175 = load i32, i32* %23, align 4
  %176 = call i32 @TIFFComputeStrip(%struct.tiff* %174, i32 %175, i16 zeroext 2)
  %177 = load i8*, i8** %16, align 8
  %178 = load i32, i32* %20, align 4
  %179 = load i32, i32* %21, align 4
  %180 = mul i32 %178, %179
  %181 = call i32 @TIFFReadEncodedStrip(%struct.tiff* %173, i32 %176, i8* %177, i32 %180)
  %182 = icmp slt i32 %181, 0
  br i1 %182, label %183, label %191

; <label>:183:                                    ; preds = %172
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 6)
  %184 = add i64 %pgocount10, 1
  store i64 %184, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 6)
  %185 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %186 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %185, i32 0, i32 1
  %187 = load i32, i32* %186, align 8
  %188 = icmp ne i32 %187, 0
  br i1 %188, label %189, label %191

; <label>:189:                                    ; preds = %183
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 15)
  %190 = add i64 %pgocount11, 1
  store i64 %190, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 15)
  br label %251

; <label>:191:                                    ; preds = %183, %172
  %192 = load i32, i32* %28, align 4
  %193 = icmp ne i32 %192, 0
  br i1 %193, label %194, label %214

; <label>:194:                                    ; preds = %191
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 0)
  %195 = add i64 %pgocount12, 1
  store i64 %195, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 0)
  %196 = load %struct.tiff*, %struct.tiff** %10, align 8
  %197 = load %struct.tiff*, %struct.tiff** %10, align 8
  %198 = load i32, i32* %23, align 4
  %199 = call i32 @TIFFComputeStrip(%struct.tiff* %197, i32 %198, i16 zeroext 3)
  %200 = load i8*, i8** %17, align 8
  %201 = load i32, i32* %20, align 4
  %202 = load i32, i32* %21, align 4
  %203 = mul i32 %201, %202
  %204 = call i32 @TIFFReadEncodedStrip(%struct.tiff* %196, i32 %199, i8* %200, i32 %203)
  %205 = icmp slt i32 %204, 0
  br i1 %205, label %206, label %214

; <label>:206:                                    ; preds = %194
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 7)
  %207 = add i64 %pgocount13, 1
  store i64 %207, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 7)
  %208 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %209 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %208, i32 0, i32 1
  %210 = load i32, i32* %209, align 8
  %211 = icmp ne i32 %210, 0
  br i1 %211, label %212, label %214

; <label>:212:                                    ; preds = %206
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 16)
  %213 = add i64 %pgocount14, 1
  store i64 %213, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 16)
  br label %251

; <label>:214:                                    ; preds = %206, %194, %191
  %215 = load void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)*, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %11, align 8
  %216 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %217 = load i32*, i32** %7, align 8
  %218 = load i32, i32* %19, align 4
  %219 = load i32, i32* %8, align 4
  %220 = mul i32 %218, %219
  %221 = zext i32 %220 to i64
  %222 = getelementptr inbounds i32, i32* %217, i64 %221
  %223 = load i32, i32* %19, align 4
  %224 = load i32, i32* %8, align 4
  %225 = load i32, i32* %20, align 4
  %226 = load i32, i32* %26, align 4
  %227 = load i32, i32* %27, align 4
  %228 = load i8*, i8** %14, align 8
  %229 = load i8*, i8** %15, align 8
  %230 = load i8*, i8** %16, align 8
  %231 = load i8*, i8** %17, align 8
  %232 = ptrtoint void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* %215 to i64
  call void @__llvm_profile_instrument_target(i64 %232, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_gtStripSeparate to i8*), i32 0)
  call void %215(%struct._TIFFRGBAImage* %216, i32* %222, i32 0, i32 %223, i32 %224, i32 %225, i32 %226, i32 %227, i8* %228, i8* %229, i8* %230, i8* %231)
  %233 = load i16, i16* %12, align 2
  %234 = zext i16 %233 to i32
  %235 = icmp eq i32 %234, 1
  br i1 %235, label %236, label %240

; <label>:236:                                    ; preds = %214
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 2)
  %237 = add i64 %pgocount15, 1
  store i64 %237, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 2)
  %238 = load i32, i32* %20, align 4
  %239 = sub nsw i32 0, %238
  br label %243

; <label>:240:                                    ; preds = %214
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 3)
  %241 = add i64 %pgocount16, 1
  store i64 %241, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_gtStripSeparate, i64 0, i64 3)
  %242 = load i32, i32* %20, align 4
  br label %243

; <label>:243:                                    ; preds = %240, %236
  %244 = phi i32 [ %239, %236 ], [ %242, %240 ]
  %245 = load i32, i32* %19, align 4
  %246 = add i32 %245, %244
  store i32 %246, i32* %19, align 4
  br label %247

; <label>:247:                                    ; preds = %243
  %248 = load i32, i32* %22, align 4
  %249 = load i32, i32* %18, align 4
  %250 = add i32 %249, %248
  store i32 %250, i32* %18, align 4
  br label %111

; <label>:251:                                    ; preds = %212, %189, %170, %151, %111
  %252 = load i8*, i8** %13, align 8
  call void @_TIFFfree(i8* %252)
  store i32 1, i32* %5, align 4
  br label %253

; <label>:253:                                    ; preds = %251, %49
  %254 = load i32, i32* %5, align 4
  ret i32 %254
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @pickTileSeparateCase(%struct._TIFFRGBAImage*) #0 {
  %2 = alloca %struct._TIFFRGBAImage*, align 8
  %3 = alloca void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)*, align 8
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %2, align 8
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* null, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %3, align 8
  %4 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %5 = call i32 @buildMap(%struct._TIFFRGBAImage* %4)
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %71

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 1)
  %9 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %9, i32 0, i32 9
  %11 = load i16, i16* %10, align 2
  %12 = zext i16 %11 to i32
  switch i32 %12, label %70 [
    i32 2, label %13
  ]

; <label>:13:                                     ; preds = %7
  %14 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %15 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %14, i32 0, i32 6
  %16 = load i16, i16* %15, align 4
  %17 = zext i16 %16 to i32
  switch i32 %17, label %68 [
    i32 8, label %18
    i32 16, label %44
  ]

; <label>:18:                                     ; preds = %13
  %19 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %20 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %19, i32 0, i32 15
  %21 = load i8*, i8** %20, align 8
  %22 = icmp ne i8* %21, null
  br i1 %22, label %41, label %23

; <label>:23:                                     ; preds = %18
  %24 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %25 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %24, i32 0, i32 3
  %26 = load i32, i32* %25, align 8
  %27 = icmp eq i32 %26, 1
  br i1 %27, label %28, label %30

; <label>:28:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 7)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 7)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBAAseparate8bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %3, align 8
  br label %40

; <label>:30:                                     ; preds = %23
  %31 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %32 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %31, i32 0, i32 3
  %33 = load i32, i32* %32, align 8
  %34 = icmp eq i32 %33, 2
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 9)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 9)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBUAseparate8bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %3, align 8
  br label %39

; <label>:37:                                     ; preds = %30
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 10)
  %38 = add i64 %pgocount3, 1
  store i64 %38, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 10)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBseparate8bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %3, align 8
  br label %39

; <label>:39:                                     ; preds = %37, %35
  br label %40

; <label>:40:                                     ; preds = %39, %28
  br label %43

; <label>:41:                                     ; preds = %18
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 4)
  %42 = add i64 %pgocount4, 1
  store i64 %42, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 4)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBseparate8bitMaptile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %3, align 8
  br label %43

; <label>:43:                                     ; preds = %41, %40
  br label %68

; <label>:44:                                     ; preds = %13
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBseparate16bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %3, align 8
  %45 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %46 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %45, i32 0, i32 15
  %47 = load i8*, i8** %46, align 8
  %48 = icmp ne i8* %47, null
  br i1 %48, label %66, label %49

; <label>:49:                                     ; preds = %44
  %50 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %51 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %50, i32 0, i32 3
  %52 = load i32, i32* %51, align 8
  %53 = icmp eq i32 %52, 1
  br i1 %53, label %54, label %56

; <label>:54:                                     ; preds = %49
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 5)
  %55 = add i64 %pgocount5, 1
  store i64 %55, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 5)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBAAseparate16bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %3, align 8
  br label %65

; <label>:56:                                     ; preds = %49
  %57 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %58 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %57, i32 0, i32 3
  %59 = load i32, i32* %58, align 8
  %60 = icmp eq i32 %59, 2
  br i1 %60, label %61, label %63

; <label>:61:                                     ; preds = %56
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 8)
  %62 = add i64 %pgocount6, 1
  store i64 %62, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 8)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBUAseparate16bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %3, align 8
  br label %63

; <label>:63:                                     ; preds = %61, %56
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 6)
  %64 = add i64 %pgocount7, 1
  store i64 %64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 6)
  br label %65

; <label>:65:                                     ; preds = %63, %54
  br label %66

; <label>:66:                                     ; preds = %65, %44
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 3)
  %67 = add i64 %pgocount8, 1
  store i64 %67, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 3)
  br label %68

; <label>:68:                                     ; preds = %66, %43, %13
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 2)
  %69 = add i64 %pgocount9, 1
  store i64 %69, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 2)
  br label %70

; <label>:70:                                     ; preds = %68, %7
  br label %71

; <label>:71:                                     ; preds = %70, %1
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 0)
  %72 = add i64 %pgocount10, 1
  store i64 %72, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pickTileSeparateCase, i64 0, i64 0)
  %73 = load void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)*, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %3, align 8
  %74 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %75 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %74, i32 0, i32 14
  %76 = bitcast %union.anon* %75 to void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)**
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* %73, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %76, align 8
  %77 = icmp ne void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* %73, null
  %78 = zext i1 %77 to i32
  ret i32 %78
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFRGBAImageGet(%struct._TIFFRGBAImage*, i32*, i32, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct._TIFFRGBAImage*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %6, align 8
  store i32* %1, i32** %7, align 8
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  %10 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %11 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %10, i32 0, i32 13
  %12 = load i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)*, i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)** %11, align 8
  %13 = icmp eq i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* %12, null
  br i1 %13, label %14, label %20

; <label>:14:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFRGBAImageGet, i64 0, i64 1)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFRGBAImageGet, i64 0, i64 1)
  %16 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %17 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %16, i32 0, i32 0
  %18 = load %struct.tiff*, %struct.tiff** %17, align 8
  %19 = call i8* @TIFFFileName(%struct.tiff* %18)
  call void (i8*, i8*, ...) @TIFFError(i8* %19, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.18, i32 0, i32 0))
  store i32 0, i32* %5, align 4
  br label %43

; <label>:20:                                     ; preds = %4
  %21 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %22 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %21, i32 0, i32 14
  %23 = bitcast %union.anon* %22 to void (%struct._TIFFRGBAImage*)**
  %24 = load void (%struct._TIFFRGBAImage*)*, void (%struct._TIFFRGBAImage*)** %23, align 8
  %25 = icmp eq void (%struct._TIFFRGBAImage*)* %24, null
  br i1 %25, label %26, label %32

; <label>:26:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFRGBAImageGet, i64 0, i64 2)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFRGBAImageGet, i64 0, i64 2)
  %28 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %29 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %28, i32 0, i32 0
  %30 = load %struct.tiff*, %struct.tiff** %29, align 8
  %31 = call i8* @TIFFFileName(%struct.tiff* %30)
  call void (i8*, i8*, ...) @TIFFError(i8* %31, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.19, i32 0, i32 0))
  store i32 0, i32* %5, align 4
  br label %43

; <label>:32:                                     ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFRGBAImageGet, i64 0, i64 0)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFRGBAImageGet, i64 0, i64 0)
  %34 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %35 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %34, i32 0, i32 13
  %36 = load i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)*, i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)** %35, align 8
  %37 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %6, align 8
  %38 = load i32*, i32** %7, align 8
  %39 = load i32, i32* %8, align 4
  %40 = load i32, i32* %9, align 4
  %41 = ptrtoint i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* %36 to i64
  call void @__llvm_profile_instrument_target(i64 %41, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFRGBAImageGet to i8*), i32 0)
  %42 = call i32 %36(%struct._TIFFRGBAImage* %37, i32* %38, i32 %39, i32 %40)
  store i32 %42, i32* %5, align 4
  br label %43

; <label>:43:                                     ; preds = %32, %26, %14
  %44 = load i32, i32* %5, align 4
  ret i32 %44
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadRGBAImage(%struct.tiff*, i32, i32, i32*, i32) #0 {
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32*, align 8
  %10 = alloca i32, align 4
  %11 = alloca [1024 x i8], align 16
  %12 = alloca %struct._TIFFRGBAImage, align 8
  %13 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i32 %1, i32* %7, align 4
  store i32 %2, i32* %8, align 4
  store i32* %3, i32** %9, align 8
  store i32 %4, i32* %10, align 4
  %14 = load %struct.tiff*, %struct.tiff** %6, align 8
  %15 = load i32, i32* %10, align 4
  %16 = getelementptr inbounds [1024 x i8], [1024 x i8]* %11, i32 0, i32 0
  %17 = call i32 @TIFFRGBAImageBegin(%struct._TIFFRGBAImage* %12, %struct.tiff* %14, i32 %15, i8* %16)
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %34

; <label>:19:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFReadRGBAImage, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFReadRGBAImage, i64 0, i64 0)
  %21 = load i32*, i32** %9, align 8
  %22 = load i32, i32* %8, align 4
  %23 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %12, i32 0, i32 5
  %24 = load i32, i32* %23, align 8
  %25 = sub i32 %22, %24
  %26 = load i32, i32* %7, align 4
  %27 = mul i32 %25, %26
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32* %21, i64 %28
  %30 = load i32, i32* %7, align 4
  %31 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %12, i32 0, i32 5
  %32 = load i32, i32* %31, align 8
  %33 = call i32 @TIFFRGBAImageGet(%struct._TIFFRGBAImage* %12, i32* %29, i32 %30, i32 %32)
  store i32 %33, i32* %13, align 4
  call void @TIFFRGBAImageEnd(%struct._TIFFRGBAImage* %12)
  br label %39

; <label>:34:                                     ; preds = %5
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFReadRGBAImage, i64 0, i64 1)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFReadRGBAImage, i64 0, i64 1)
  %36 = load %struct.tiff*, %struct.tiff** %6, align 8
  %37 = call i8* @TIFFFileName(%struct.tiff* %36)
  %38 = getelementptr inbounds [1024 x i8], [1024 x i8]* %11, i32 0, i32 0
  call void (i8*, i8*, ...) @TIFFError(i8* %37, i8* %38)
  store i32 0, i32* %13, align 4
  br label %39

; <label>:39:                                     ; preds = %34, %19
  %40 = load i32, i32* %13, align 4
  ret i32 %40
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadRGBAStrip(%struct.tiff*, i32, i32*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %8 = alloca [1024 x i8], align 16
  %9 = alloca %struct._TIFFRGBAImage, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32* %2, i32** %7, align 8
  %13 = load %struct.tiff*, %struct.tiff** %5, align 8
  %14 = call i32 @TIFFIsTiled(%struct.tiff* %13)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %20

; <label>:16:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRGBAStrip, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRGBAStrip, i64 0, i64 0)
  %18 = load %struct.tiff*, %struct.tiff** %5, align 8
  %19 = call i8* @TIFFFileName(%struct.tiff* %18)
  call void (i8*, i8*, ...) @TIFFError(i8* %19, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.20, i32 0, i32 0))
  store i32 0, i32* %4, align 4
  br label %68

; <label>:20:                                     ; preds = %3
  %21 = load %struct.tiff*, %struct.tiff** %5, align 8
  %22 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %21, i32 278, i32* %11)
  %23 = load i32, i32* %6, align 4
  %24 = load i32, i32* %11, align 4
  %25 = urem i32 %23, %24
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %31

; <label>:27:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRGBAStrip, i64 0, i64 1)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRGBAStrip, i64 0, i64 1)
  %29 = load %struct.tiff*, %struct.tiff** %5, align 8
  %30 = call i8* @TIFFFileName(%struct.tiff* %29)
  call void (i8*, i8*, ...) @TIFFError(i8* %30, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.21, i32 0, i32 0))
  store i32 0, i32* %4, align 4
  br label %68

; <label>:31:                                     ; preds = %20
  %32 = load %struct.tiff*, %struct.tiff** %5, align 8
  %33 = getelementptr inbounds [1024 x i8], [1024 x i8]* %8, i32 0, i32 0
  %34 = call i32 @TIFFRGBAImageBegin(%struct._TIFFRGBAImage* %9, %struct.tiff* %32, i32 0, i8* %33)
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %61

; <label>:36:                                     ; preds = %31
  %37 = load i32, i32* %6, align 4
  %38 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %9, i32 0, i32 19
  store i32 %37, i32* %38, align 8
  %39 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %9, i32 0, i32 20
  store i32 0, i32* %39, align 4
  %40 = load i32, i32* %6, align 4
  %41 = load i32, i32* %11, align 4
  %42 = add i32 %40, %41
  %43 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %9, i32 0, i32 5
  %44 = load i32, i32* %43, align 8
  %45 = icmp ugt i32 %42, %44
  br i1 %45, label %46, label %52

; <label>:46:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRGBAStrip, i64 0, i64 3)
  %47 = add i64 %pgocount2, 1
  store i64 %47, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRGBAStrip, i64 0, i64 3)
  %48 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %9, i32 0, i32 5
  %49 = load i32, i32* %48, align 8
  %50 = load i32, i32* %6, align 4
  %51 = sub i32 %49, %50
  store i32 %51, i32* %12, align 4
  br label %55

; <label>:52:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRGBAStrip, i64 0, i64 4)
  %53 = add i64 %pgocount3, 1
  store i64 %53, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRGBAStrip, i64 0, i64 4)
  %54 = load i32, i32* %11, align 4
  store i32 %54, i32* %12, align 4
  br label %55

; <label>:55:                                     ; preds = %52, %46
  %56 = load i32*, i32** %7, align 8
  %57 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %9, i32 0, i32 4
  %58 = load i32, i32* %57, align 4
  %59 = load i32, i32* %12, align 4
  %60 = call i32 @TIFFRGBAImageGet(%struct._TIFFRGBAImage* %9, i32* %56, i32 %58, i32 %59)
  store i32 %60, i32* %10, align 4
  call void @TIFFRGBAImageEnd(%struct._TIFFRGBAImage* %9)
  br label %66

; <label>:61:                                     ; preds = %31
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRGBAStrip, i64 0, i64 2)
  %62 = add i64 %pgocount4, 1
  store i64 %62, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRGBAStrip, i64 0, i64 2)
  %63 = load %struct.tiff*, %struct.tiff** %5, align 8
  %64 = call i8* @TIFFFileName(%struct.tiff* %63)
  %65 = getelementptr inbounds [1024 x i8], [1024 x i8]* %8, i32 0, i32 0
  call void (i8*, i8*, ...) @TIFFError(i8* %64, i8* %65)
  store i32 0, i32* %10, align 4
  br label %66

; <label>:66:                                     ; preds = %61, %55
  %67 = load i32, i32* %10, align 4
  store i32 %67, i32* %4, align 4
  br label %68

; <label>:68:                                     ; preds = %66, %27, %16
  %69 = load i32, i32* %4, align 4
  ret i32 %69
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadRGBATile(%struct.tiff*, i32, i32, i32*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32*, align 8
  %10 = alloca [1024 x i8], align 16
  %11 = alloca %struct._TIFFRGBAImage, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i32 %1, i32* %7, align 4
  store i32 %2, i32* %8, align 4
  store i32* %3, i32** %9, align 8
  %18 = load %struct.tiff*, %struct.tiff** %6, align 8
  %19 = call i32 @TIFFIsTiled(%struct.tiff* %18)
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %25, label %21

; <label>:21:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 3)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 3)
  %23 = load %struct.tiff*, %struct.tiff** %6, align 8
  %24 = call i8* @TIFFFileName(%struct.tiff* %23)
  call void (i8*, i8*, ...) @TIFFError(i8* %24, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.22, i32 0, i32 0))
  store i32 0, i32* %5, align 4
  br label %185

; <label>:25:                                     ; preds = %4
  %26 = load %struct.tiff*, %struct.tiff** %6, align 8
  %27 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %26, i32 322, i32* %13)
  %28 = load %struct.tiff*, %struct.tiff** %6, align 8
  %29 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %28, i32 323, i32* %14)
  %30 = load i32, i32* %7, align 4
  %31 = load i32, i32* %13, align 4
  %32 = urem i32 %30, %31
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %40, label %34

; <label>:34:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 4)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 4)
  %36 = load i32, i32* %8, align 4
  %37 = load i32, i32* %14, align 4
  %38 = urem i32 %36, %37
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %44

; <label>:40:                                     ; preds = %34, %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 2)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 2)
  %42 = load %struct.tiff*, %struct.tiff** %6, align 8
  %43 = call i8* @TIFFFileName(%struct.tiff* %42)
  call void (i8*, i8*, ...) @TIFFError(i8* %43, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.23, i32 0, i32 0))
  store i32 0, i32* %5, align 4
  br label %185

; <label>:44:                                     ; preds = %34
  %45 = load %struct.tiff*, %struct.tiff** %6, align 8
  %46 = getelementptr inbounds [1024 x i8], [1024 x i8]* %10, i32 0, i32 0
  %47 = call i32 @TIFFRGBAImageBegin(%struct._TIFFRGBAImage* %11, %struct.tiff* %45, i32 0, i8* %46)
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %54, label %49

; <label>:49:                                     ; preds = %44
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 5)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 5)
  %51 = load %struct.tiff*, %struct.tiff** %6, align 8
  %52 = call i8* @TIFFFileName(%struct.tiff* %51)
  %53 = getelementptr inbounds [1024 x i8], [1024 x i8]* %10, i32 0, i32 0
  call void (i8*, i8*, ...) @TIFFError(i8* %52, i8* %53)
  store i32 0, i32* %5, align 4
  br label %185

; <label>:54:                                     ; preds = %44
  %55 = load i32, i32* %8, align 4
  %56 = load i32, i32* %14, align 4
  %57 = add i32 %55, %56
  %58 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %11, i32 0, i32 5
  %59 = load i32, i32* %58, align 8
  %60 = icmp ugt i32 %57, %59
  br i1 %60, label %61, label %66

; <label>:61:                                     ; preds = %54
  %62 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %11, i32 0, i32 5
  %63 = load i32, i32* %62, align 8
  %64 = load i32, i32* %8, align 4
  %65 = sub i32 %63, %64
  store i32 %65, i32* %16, align 4
  br label %69

; <label>:66:                                     ; preds = %54
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 6)
  %67 = add i64 %pgocount4, 1
  store i64 %67, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 6)
  %68 = load i32, i32* %14, align 4
  store i32 %68, i32* %16, align 4
  br label %69

; <label>:69:                                     ; preds = %66, %61
  %70 = load i32, i32* %7, align 4
  %71 = load i32, i32* %13, align 4
  %72 = add i32 %70, %71
  %73 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %11, i32 0, i32 4
  %74 = load i32, i32* %73, align 4
  %75 = icmp ugt i32 %72, %74
  br i1 %75, label %76, label %82

; <label>:76:                                     ; preds = %69
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 7)
  %77 = add i64 %pgocount5, 1
  store i64 %77, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 7)
  %78 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %11, i32 0, i32 4
  %79 = load i32, i32* %78, align 4
  %80 = load i32, i32* %7, align 4
  %81 = sub i32 %79, %80
  store i32 %81, i32* %15, align 4
  br label %85

; <label>:82:                                     ; preds = %69
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 8)
  %83 = add i64 %pgocount6, 1
  store i64 %83, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 8)
  %84 = load i32, i32* %13, align 4
  store i32 %84, i32* %15, align 4
  br label %85

; <label>:85:                                     ; preds = %82, %76
  %86 = load i32, i32* %8, align 4
  %87 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %11, i32 0, i32 19
  store i32 %86, i32* %87, align 8
  %88 = load i32, i32* %7, align 4
  %89 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %11, i32 0, i32 20
  store i32 %88, i32* %89, align 4
  %90 = load i32*, i32** %9, align 8
  %91 = load i32, i32* %15, align 4
  %92 = load i32, i32* %16, align 4
  %93 = call i32 @TIFFRGBAImageGet(%struct._TIFFRGBAImage* %11, i32* %90, i32 %91, i32 %92)
  store i32 %93, i32* %12, align 4
  call void @TIFFRGBAImageEnd(%struct._TIFFRGBAImage* %11)
  %94 = load i32, i32* %15, align 4
  %95 = load i32, i32* %13, align 4
  %96 = icmp eq i32 %94, %95
  br i1 %96, label %97, label %105

; <label>:97:                                     ; preds = %85
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 9)
  %98 = add i64 %pgocount7, 1
  store i64 %98, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 9)
  %99 = load i32, i32* %16, align 4
  %100 = load i32, i32* %14, align 4
  %101 = icmp eq i32 %99, %100
  br i1 %101, label %102, label %105

; <label>:102:                                    ; preds = %97
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 10)
  %103 = add i64 %pgocount8, 1
  store i64 %103, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 10)
  %104 = load i32, i32* %12, align 4
  store i32 %104, i32* %5, align 4
  br label %185

; <label>:105:                                    ; preds = %97, %85
  store i32 0, i32* %17, align 4
  br label %106

; <label>:106:                                    ; preds = %154, %105
  %107 = load i32, i32* %17, align 4
  %108 = load i32, i32* %16, align 4
  %109 = icmp ult i32 %107, %108
  br i1 %109, label %110, label %158

; <label>:110:                                    ; preds = %106
  %111 = load i32*, i32** %9, align 8
  %112 = load i32, i32* %14, align 4
  %113 = load i32, i32* %17, align 4
  %114 = sub i32 %112, %113
  %115 = sub i32 %114, 1
  %116 = load i32, i32* %13, align 4
  %117 = mul i32 %115, %116
  %118 = zext i32 %117 to i64
  %119 = getelementptr inbounds i32, i32* %111, i64 %118
  %120 = bitcast i32* %119 to i8*
  %121 = load i32*, i32** %9, align 8
  %122 = load i32, i32* %16, align 4
  %123 = load i32, i32* %17, align 4
  %124 = sub i32 %122, %123
  %125 = sub i32 %124, 1
  %126 = load i32, i32* %15, align 4
  %127 = mul i32 %125, %126
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32* %121, i64 %128
  %130 = bitcast i32* %129 to i8*
  %131 = load i32, i32* %15, align 4
  %132 = zext i32 %131 to i64
  %133 = mul i64 %132, 4
  %134 = trunc i64 %133 to i32
  call void @_TIFFmemcpy(i8* %120, i8* %130, i32 %134)
  %135 = load i32*, i32** %9, align 8
  %136 = load i32, i32* %14, align 4
  %137 = load i32, i32* %17, align 4
  %138 = sub i32 %136, %137
  %139 = sub i32 %138, 1
  %140 = load i32, i32* %13, align 4
  %141 = mul i32 %139, %140
  %142 = zext i32 %141 to i64
  %143 = getelementptr inbounds i32, i32* %135, i64 %142
  %144 = load i32, i32* %15, align 4
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds i32, i32* %143, i64 %145
  %147 = bitcast i32* %146 to i8*
  %148 = load i32, i32* %13, align 4
  %149 = load i32, i32* %15, align 4
  %150 = sub i32 %148, %149
  %151 = zext i32 %150 to i64
  %152 = mul i64 4, %151
  %153 = trunc i64 %152 to i32
  call void @_TIFFmemset(i8* %147, i32 0, i32 %153)
  br label %154

; <label>:154:                                    ; preds = %110
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 0)
  %155 = add i64 %pgocount9, 1
  store i64 %155, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 0)
  %156 = load i32, i32* %17, align 4
  %157 = add i32 %156, 1
  store i32 %157, i32* %17, align 4
  br label %106

; <label>:158:                                    ; preds = %106
  %159 = load i32, i32* %16, align 4
  store i32 %159, i32* %17, align 4
  br label %160

; <label>:160:                                    ; preds = %179, %158
  %161 = load i32, i32* %17, align 4
  %162 = load i32, i32* %14, align 4
  %163 = icmp ult i32 %161, %162
  br i1 %163, label %164, label %183

; <label>:164:                                    ; preds = %160
  %165 = load i32*, i32** %9, align 8
  %166 = load i32, i32* %14, align 4
  %167 = load i32, i32* %17, align 4
  %168 = sub i32 %166, %167
  %169 = sub i32 %168, 1
  %170 = load i32, i32* %13, align 4
  %171 = mul i32 %169, %170
  %172 = zext i32 %171 to i64
  %173 = getelementptr inbounds i32, i32* %165, i64 %172
  %174 = bitcast i32* %173 to i8*
  %175 = load i32, i32* %13, align 4
  %176 = zext i32 %175 to i64
  %177 = mul i64 4, %176
  %178 = trunc i64 %177 to i32
  call void @_TIFFmemset(i8* %174, i32 0, i32 %178)
  br label %179

; <label>:179:                                    ; preds = %164
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 1)
  %180 = add i64 %pgocount10, 1
  store i64 %180, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_TIFFReadRGBATile, i64 0, i64 1)
  %181 = load i32, i32* %17, align 4
  %182 = add i32 %181, 1
  store i32 %182, i32* %17, align 4
  br label %160

; <label>:183:                                    ; preds = %160
  %184 = load i32, i32* %12, align 4
  store i32 %184, i32* %5, align 4
  br label %185

; <label>:185:                                    ; preds = %183, %102, %49, %40, %21
  %186 = load i32, i32* %5, align 4
  ret i32 %186
}

declare void @_TIFFmemcpy(i8*, i8*, i32) #2

declare void @_TIFFmemset(i8*, i32, i32) #2

declare i32 @TIFFTileSize(%struct.tiff*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @setorientation(%struct._TIFFRGBAImage*, i32) #0 {
  %3 = alloca %struct._TIFFRGBAImage*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %3, align 8
  store i32 %1, i32* %4, align 4
  %7 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %8 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %7, i32 0, i32 0
  %9 = load %struct.tiff*, %struct.tiff** %8, align 8
  store %struct.tiff* %9, %struct.tiff** %5, align 8
  %10 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %11 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %10, i32 0, i32 8
  %12 = load i16, i16* %11, align 8
  %13 = zext i16 %12 to i32
  switch i32 %13, label %28 [
    i32 3, label %._crit_edge
    i32 7, label %._crit_edge1
    i32 8, label %18
    i32 4, label %24
    i32 2, label %._crit_edge2
    i32 6, label %._crit_edge3
    i32 5, label %26
    i32 1, label %34
  ]

._crit_edge3:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setorientation, i64 0, i64 3)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setorientation, i64 0, i64 3)
  br label %26

._crit_edge2:                                     ; preds = %2
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setorientation, i64 0, i64 2)
  %15 = add i64 %pgocount4, 1
  store i64 %15, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setorientation, i64 0, i64 2)
  br label %26

._crit_edge1:                                     ; preds = %2
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setorientation, i64 0, i64 1)
  %16 = add i64 %pgocount5, 1
  store i64 %16, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setorientation, i64 0, i64 1)
  br label %18

._crit_edge:                                      ; preds = %2
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setorientation, i64 0, i64 0)
  %17 = add i64 %pgocount6, 1
  store i64 %17, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setorientation, i64 0, i64 0)
  br label %18

; <label>:18:                                     ; preds = %._crit_edge, %._crit_edge1, %2
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setorientation, i64 0, i64 8)
  %19 = add i64 %pgocount7, 1
  store i64 %19, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setorientation, i64 0, i64 8)
  %20 = load %struct.tiff*, %struct.tiff** %5, align 8
  %21 = call i8* @TIFFFileName(%struct.tiff* %20)
  call void (i8*, i8*, ...) @TIFFWarning(i8* %21, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.25, i32 0, i32 0))
  %22 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %23 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %22, i32 0, i32 8
  store i16 4, i16* %23, align 8
  br label %24

; <label>:24:                                     ; preds = %18, %2
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setorientation, i64 0, i64 5)
  %25 = add i64 %pgocount8, 1
  store i64 %25, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setorientation, i64 0, i64 5)
  store i32 0, i32* %6, align 4
  br label %38

; <label>:26:                                     ; preds = %._crit_edge2, %._crit_edge3, %2
  %pgocount9 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setorientation, i64 0, i64 7)
  %27 = add i64 %pgocount9, 1
  store i64 %27, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setorientation, i64 0, i64 7)
  br label %28

; <label>:28:                                     ; preds = %26, %2
  %pgocount10 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setorientation, i64 0, i64 6)
  %29 = add i64 %pgocount10, 1
  store i64 %29, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setorientation, i64 0, i64 6)
  %30 = load %struct.tiff*, %struct.tiff** %5, align 8
  %31 = call i8* @TIFFFileName(%struct.tiff* %30)
  call void (i8*, i8*, ...) @TIFFWarning(i8* %31, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.26, i32 0, i32 0))
  %32 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %33 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %32, i32 0, i32 8
  store i16 1, i16* %33, align 8
  br label %34

; <label>:34:                                     ; preds = %28, %2
  %pgocount11 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setorientation, i64 0, i64 4)
  %35 = add i64 %pgocount11, 1
  store i64 %35, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setorientation, i64 0, i64 4)
  %36 = load i32, i32* %4, align 4
  %37 = sub i32 %36, 1
  store i32 %37, i32* %6, align 4
  br label %38

; <label>:38:                                     ; preds = %34, %24
  %39 = load i32, i32* %6, align 4
  ret i32 %39
}

declare i32 @TIFFReadTile(%struct.tiff*, i8*, i32, i32, i32, i16 zeroext) #2

declare void @TIFFWarning(i8*, i8*, ...) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

declare i32 @TIFFStripSize(%struct.tiff*) #2

declare i32 @TIFFScanlineSize(%struct.tiff*) #2

declare i32 @TIFFReadEncodedStrip(%struct.tiff*, i32, i8*, i32) #2

declare i32 @TIFFComputeStrip(%struct.tiff*, i32, i16 zeroext) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @buildMap(%struct._TIFFRGBAImage*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct._TIFFRGBAImage*, align 8
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %3, align 8
  %4 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %5 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %4, i32 0, i32 9
  %6 = load i16, i16* %5, align 2
  %7 = zext i16 %6 to i32
  switch i32 %7, label %56 [
    i32 2, label %._crit_edge
    i32 6, label %._crit_edge1
    i32 5, label %11
    i32 1, label %._crit_edge2
    i32 0, label %21
    i32 3, label %29
  ]

._crit_edge2:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 2)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 2)
  br label %21

._crit_edge1:                                     ; preds = %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 1)
  %9 = add i64 %pgocount3, 1
  store i64 %9, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 1)
  br label %11

._crit_edge:                                      ; preds = %1
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 0)
  %10 = add i64 %pgocount4, 1
  store i64 %10, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 0)
  br label %11

; <label>:11:                                     ; preds = %._crit_edge, %._crit_edge1, %1
  %12 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %13 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %12, i32 0, i32 6
  %14 = load i16, i16* %13, align 4
  %15 = zext i16 %14 to i32
  %16 = icmp eq i32 %15, 8
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %11
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 5)
  %18 = add i64 %pgocount5, 1
  store i64 %18, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 5)
  br label %56

; <label>:19:                                     ; preds = %11
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 6)
  %20 = add i64 %pgocount6, 1
  store i64 %20, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 6)
  br label %21

; <label>:21:                                     ; preds = %19, %._crit_edge2, %1
  %22 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %23 = call i32 @setupMap(%struct._TIFFRGBAImage* %22)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %27, label %25

; <label>:25:                                     ; preds = %21
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 7)
  %26 = add i64 %pgocount7, 1
  store i64 %26, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 7)
  store i32 0, i32* %2, align 4
  br label %58

; <label>:27:                                     ; preds = %21
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 4)
  %28 = add i64 %pgocount8, 1
  store i64 %28, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 4)
  br label %56

; <label>:29:                                     ; preds = %1
  %30 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %31 = call i32 @checkcmap(%struct._TIFFRGBAImage* %30)
  %32 = icmp eq i32 %31, 16
  br i1 %32, label %33, label %36

; <label>:33:                                     ; preds = %29
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 8)
  %34 = add i64 %pgocount9, 1
  store i64 %34, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 8)
  %35 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  call void @cvtcmap(%struct._TIFFRGBAImage* %35)
  br label %42

; <label>:36:                                     ; preds = %29
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 9)
  %37 = add i64 %pgocount10, 1
  store i64 %37, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 9)
  %38 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %39 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %38, i32 0, i32 0
  %40 = load %struct.tiff*, %struct.tiff** %39, align 8
  %41 = call i8* @TIFFFileName(%struct.tiff* %40)
  call void (i8*, i8*, ...) @TIFFWarning(i8* %41, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.28, i32 0, i32 0))
  br label %42

; <label>:42:                                     ; preds = %36, %33
  %43 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %44 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %43, i32 0, i32 6
  %45 = load i16, i16* %44, align 4
  %46 = zext i16 %45 to i32
  %47 = icmp sle i32 %46, 8
  br i1 %47, label %48, label %55

; <label>:48:                                     ; preds = %42
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 10)
  %49 = add i64 %pgocount11, 1
  store i64 %49, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 10)
  %50 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %51 = call i32 @makecmap(%struct._TIFFRGBAImage* %50)
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %55, label %53

; <label>:53:                                     ; preds = %48
  %pgocount12 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 11)
  %54 = add i64 %pgocount12, 1
  store i64 %54, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 11)
  store i32 0, i32* %2, align 4
  br label %58

; <label>:55:                                     ; preds = %48, %42
  br label %56

; <label>:56:                                     ; preds = %55, %27, %17, %1
  %pgocount13 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 3)
  %57 = add i64 %pgocount13, 1
  store i64 %57, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_buildMap, i64 0, i64 3)
  store i32 1, i32* %2, align 4
  br label %58

; <label>:58:                                     ; preds = %56, %53, %25
  %59 = load i32, i32* %2, align 4
  ret i32 %59
}

; Function Attrs: noinline nounwind uwtable
define internal void @putRGBAAcontig8bittile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %21 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %22 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %21, i32 0, i32 7
  %23 = load i16, i16* %22, align 2
  %24 = zext i16 %23 to i32
  store i32 %24, i32* %19, align 4
  %25 = load i32, i32* %12, align 4
  %26 = load i32, i32* %13, align 4
  %27 = load i32, i32* %19, align 4
  %28 = load i32, i32* %16, align 4
  %29 = mul nsw i32 %28, %27
  store i32 %29, i32* %16, align 4
  br label %30

; <label>:30:                                     ; preds = %485, %9
  %31 = load i32, i32* %15, align 4
  %32 = add i32 %31, -1
  store i32 %32, i32* %15, align 4
  %33 = icmp ugt i32 %31, 0
  br i1 %33, label %34, label %495

; <label>:34:                                     ; preds = %30
  %35 = load i32, i32* %14, align 4
  store i32 %35, i32* %20, align 4
  br label %36

; <label>:36:                                     ; preds = %264, %34
  %37 = load i32, i32* %20, align 4
  %38 = icmp uge i32 %37, 8
  br i1 %38, label %39, label %268

; <label>:39:                                     ; preds = %36
  %40 = load i8*, i8** %18, align 8
  %41 = getelementptr inbounds i8, i8* %40, i64 0
  %42 = load i8, i8* %41, align 1
  %43 = zext i8 %42 to i32
  %44 = load i8*, i8** %18, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 1
  %46 = load i8, i8* %45, align 1
  %47 = zext i8 %46 to i32
  %48 = shl i32 %47, 8
  %49 = or i32 %43, %48
  %50 = load i8*, i8** %18, align 8
  %51 = getelementptr inbounds i8, i8* %50, i64 2
  %52 = load i8, i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = shl i32 %53, 16
  %55 = or i32 %49, %54
  %56 = load i8*, i8** %18, align 8
  %57 = getelementptr inbounds i8, i8* %56, i64 3
  %58 = load i8, i8* %57, align 1
  %59 = zext i8 %58 to i32
  %60 = shl i32 %59, 24
  %61 = or i32 %55, %60
  %62 = load i32*, i32** %11, align 8
  %63 = getelementptr inbounds i32, i32* %62, i32 1
  store i32* %63, i32** %11, align 8
  store i32 %61, i32* %62, align 4
  %64 = load i32, i32* %19, align 4
  %65 = load i8*, i8** %18, align 8
  %66 = sext i32 %64 to i64
  %67 = getelementptr inbounds i8, i8* %65, i64 %66
  store i8* %67, i8** %18, align 8
  %68 = load i8*, i8** %18, align 8
  %69 = getelementptr inbounds i8, i8* %68, i64 0
  %70 = load i8, i8* %69, align 1
  %71 = zext i8 %70 to i32
  %72 = load i8*, i8** %18, align 8
  %73 = getelementptr inbounds i8, i8* %72, i64 1
  %74 = load i8, i8* %73, align 1
  %75 = zext i8 %74 to i32
  %76 = shl i32 %75, 8
  %77 = or i32 %71, %76
  %78 = load i8*, i8** %18, align 8
  %79 = getelementptr inbounds i8, i8* %78, i64 2
  %80 = load i8, i8* %79, align 1
  %81 = zext i8 %80 to i32
  %82 = shl i32 %81, 16
  %83 = or i32 %77, %82
  %84 = load i8*, i8** %18, align 8
  %85 = getelementptr inbounds i8, i8* %84, i64 3
  %86 = load i8, i8* %85, align 1
  %87 = zext i8 %86 to i32
  %88 = shl i32 %87, 24
  %89 = or i32 %83, %88
  %90 = load i32*, i32** %11, align 8
  %91 = getelementptr inbounds i32, i32* %90, i32 1
  store i32* %91, i32** %11, align 8
  store i32 %89, i32* %90, align 4
  %92 = load i32, i32* %19, align 4
  %93 = load i8*, i8** %18, align 8
  %94 = sext i32 %92 to i64
  %95 = getelementptr inbounds i8, i8* %93, i64 %94
  store i8* %95, i8** %18, align 8
  %96 = load i8*, i8** %18, align 8
  %97 = getelementptr inbounds i8, i8* %96, i64 0
  %98 = load i8, i8* %97, align 1
  %99 = zext i8 %98 to i32
  %100 = load i8*, i8** %18, align 8
  %101 = getelementptr inbounds i8, i8* %100, i64 1
  %102 = load i8, i8* %101, align 1
  %103 = zext i8 %102 to i32
  %104 = shl i32 %103, 8
  %105 = or i32 %99, %104
  %106 = load i8*, i8** %18, align 8
  %107 = getelementptr inbounds i8, i8* %106, i64 2
  %108 = load i8, i8* %107, align 1
  %109 = zext i8 %108 to i32
  %110 = shl i32 %109, 16
  %111 = or i32 %105, %110
  %112 = load i8*, i8** %18, align 8
  %113 = getelementptr inbounds i8, i8* %112, i64 3
  %114 = load i8, i8* %113, align 1
  %115 = zext i8 %114 to i32
  %116 = shl i32 %115, 24
  %117 = or i32 %111, %116
  %118 = load i32*, i32** %11, align 8
  %119 = getelementptr inbounds i32, i32* %118, i32 1
  store i32* %119, i32** %11, align 8
  store i32 %117, i32* %118, align 4
  %120 = load i32, i32* %19, align 4
  %121 = load i8*, i8** %18, align 8
  %122 = sext i32 %120 to i64
  %123 = getelementptr inbounds i8, i8* %121, i64 %122
  store i8* %123, i8** %18, align 8
  %124 = load i8*, i8** %18, align 8
  %125 = getelementptr inbounds i8, i8* %124, i64 0
  %126 = load i8, i8* %125, align 1
  %127 = zext i8 %126 to i32
  %128 = load i8*, i8** %18, align 8
  %129 = getelementptr inbounds i8, i8* %128, i64 1
  %130 = load i8, i8* %129, align 1
  %131 = zext i8 %130 to i32
  %132 = shl i32 %131, 8
  %133 = or i32 %127, %132
  %134 = load i8*, i8** %18, align 8
  %135 = getelementptr inbounds i8, i8* %134, i64 2
  %136 = load i8, i8* %135, align 1
  %137 = zext i8 %136 to i32
  %138 = shl i32 %137, 16
  %139 = or i32 %133, %138
  %140 = load i8*, i8** %18, align 8
  %141 = getelementptr inbounds i8, i8* %140, i64 3
  %142 = load i8, i8* %141, align 1
  %143 = zext i8 %142 to i32
  %144 = shl i32 %143, 24
  %145 = or i32 %139, %144
  %146 = load i32*, i32** %11, align 8
  %147 = getelementptr inbounds i32, i32* %146, i32 1
  store i32* %147, i32** %11, align 8
  store i32 %145, i32* %146, align 4
  %148 = load i32, i32* %19, align 4
  %149 = load i8*, i8** %18, align 8
  %150 = sext i32 %148 to i64
  %151 = getelementptr inbounds i8, i8* %149, i64 %150
  store i8* %151, i8** %18, align 8
  %152 = load i8*, i8** %18, align 8
  %153 = getelementptr inbounds i8, i8* %152, i64 0
  %154 = load i8, i8* %153, align 1
  %155 = zext i8 %154 to i32
  %156 = load i8*, i8** %18, align 8
  %157 = getelementptr inbounds i8, i8* %156, i64 1
  %158 = load i8, i8* %157, align 1
  %159 = zext i8 %158 to i32
  %160 = shl i32 %159, 8
  %161 = or i32 %155, %160
  %162 = load i8*, i8** %18, align 8
  %163 = getelementptr inbounds i8, i8* %162, i64 2
  %164 = load i8, i8* %163, align 1
  %165 = zext i8 %164 to i32
  %166 = shl i32 %165, 16
  %167 = or i32 %161, %166
  %168 = load i8*, i8** %18, align 8
  %169 = getelementptr inbounds i8, i8* %168, i64 3
  %170 = load i8, i8* %169, align 1
  %171 = zext i8 %170 to i32
  %172 = shl i32 %171, 24
  %173 = or i32 %167, %172
  %174 = load i32*, i32** %11, align 8
  %175 = getelementptr inbounds i32, i32* %174, i32 1
  store i32* %175, i32** %11, align 8
  store i32 %173, i32* %174, align 4
  %176 = load i32, i32* %19, align 4
  %177 = load i8*, i8** %18, align 8
  %178 = sext i32 %176 to i64
  %179 = getelementptr inbounds i8, i8* %177, i64 %178
  store i8* %179, i8** %18, align 8
  %180 = load i8*, i8** %18, align 8
  %181 = getelementptr inbounds i8, i8* %180, i64 0
  %182 = load i8, i8* %181, align 1
  %183 = zext i8 %182 to i32
  %184 = load i8*, i8** %18, align 8
  %185 = getelementptr inbounds i8, i8* %184, i64 1
  %186 = load i8, i8* %185, align 1
  %187 = zext i8 %186 to i32
  %188 = shl i32 %187, 8
  %189 = or i32 %183, %188
  %190 = load i8*, i8** %18, align 8
  %191 = getelementptr inbounds i8, i8* %190, i64 2
  %192 = load i8, i8* %191, align 1
  %193 = zext i8 %192 to i32
  %194 = shl i32 %193, 16
  %195 = or i32 %189, %194
  %196 = load i8*, i8** %18, align 8
  %197 = getelementptr inbounds i8, i8* %196, i64 3
  %198 = load i8, i8* %197, align 1
  %199 = zext i8 %198 to i32
  %200 = shl i32 %199, 24
  %201 = or i32 %195, %200
  %202 = load i32*, i32** %11, align 8
  %203 = getelementptr inbounds i32, i32* %202, i32 1
  store i32* %203, i32** %11, align 8
  store i32 %201, i32* %202, align 4
  %204 = load i32, i32* %19, align 4
  %205 = load i8*, i8** %18, align 8
  %206 = sext i32 %204 to i64
  %207 = getelementptr inbounds i8, i8* %205, i64 %206
  store i8* %207, i8** %18, align 8
  %208 = load i8*, i8** %18, align 8
  %209 = getelementptr inbounds i8, i8* %208, i64 0
  %210 = load i8, i8* %209, align 1
  %211 = zext i8 %210 to i32
  %212 = load i8*, i8** %18, align 8
  %213 = getelementptr inbounds i8, i8* %212, i64 1
  %214 = load i8, i8* %213, align 1
  %215 = zext i8 %214 to i32
  %216 = shl i32 %215, 8
  %217 = or i32 %211, %216
  %218 = load i8*, i8** %18, align 8
  %219 = getelementptr inbounds i8, i8* %218, i64 2
  %220 = load i8, i8* %219, align 1
  %221 = zext i8 %220 to i32
  %222 = shl i32 %221, 16
  %223 = or i32 %217, %222
  %224 = load i8*, i8** %18, align 8
  %225 = getelementptr inbounds i8, i8* %224, i64 3
  %226 = load i8, i8* %225, align 1
  %227 = zext i8 %226 to i32
  %228 = shl i32 %227, 24
  %229 = or i32 %223, %228
  %230 = load i32*, i32** %11, align 8
  %231 = getelementptr inbounds i32, i32* %230, i32 1
  store i32* %231, i32** %11, align 8
  store i32 %229, i32* %230, align 4
  %232 = load i32, i32* %19, align 4
  %233 = load i8*, i8** %18, align 8
  %234 = sext i32 %232 to i64
  %235 = getelementptr inbounds i8, i8* %233, i64 %234
  store i8* %235, i8** %18, align 8
  %236 = load i8*, i8** %18, align 8
  %237 = getelementptr inbounds i8, i8* %236, i64 0
  %238 = load i8, i8* %237, align 1
  %239 = zext i8 %238 to i32
  %240 = load i8*, i8** %18, align 8
  %241 = getelementptr inbounds i8, i8* %240, i64 1
  %242 = load i8, i8* %241, align 1
  %243 = zext i8 %242 to i32
  %244 = shl i32 %243, 8
  %245 = or i32 %239, %244
  %246 = load i8*, i8** %18, align 8
  %247 = getelementptr inbounds i8, i8* %246, i64 2
  %248 = load i8, i8* %247, align 1
  %249 = zext i8 %248 to i32
  %250 = shl i32 %249, 16
  %251 = or i32 %245, %250
  %252 = load i8*, i8** %18, align 8
  %253 = getelementptr inbounds i8, i8* %252, i64 3
  %254 = load i8, i8* %253, align 1
  %255 = zext i8 %254 to i32
  %256 = shl i32 %255, 24
  %257 = or i32 %251, %256
  %258 = load i32*, i32** %11, align 8
  %259 = getelementptr inbounds i32, i32* %258, i32 1
  store i32* %259, i32** %11, align 8
  store i32 %257, i32* %258, align 4
  %260 = load i32, i32* %19, align 4
  %261 = load i8*, i8** %18, align 8
  %262 = sext i32 %260 to i64
  %263 = getelementptr inbounds i8, i8* %261, i64 %262
  store i8* %263, i8** %18, align 8
  br label %264

; <label>:264:                                    ; preds = %39
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 0)
  %265 = add i64 %pgocount, 1
  store i64 %265, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 0)
  %266 = load i32, i32* %20, align 4
  %267 = sub i32 %266, 8
  store i32 %267, i32* %20, align 4
  br label %36

; <label>:268:                                    ; preds = %36
  %269 = load i32, i32* %20, align 4
  %270 = icmp ugt i32 %269, 0
  br i1 %270, label %271, label %485

; <label>:271:                                    ; preds = %268
  %272 = load i32, i32* %20, align 4
  switch i32 %272, label %483 [
    i32 7, label %273
    i32 6, label %303
    i32 5, label %333
    i32 4, label %363
    i32 3, label %393
    i32 2, label %423
    i32 1, label %453
  ]

; <label>:273:                                    ; preds = %271
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 9)
  %274 = add i64 %pgocount1, 1
  store i64 %274, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 9)
  %275 = load i8*, i8** %18, align 8
  %276 = getelementptr inbounds i8, i8* %275, i64 0
  %277 = load i8, i8* %276, align 1
  %278 = zext i8 %277 to i32
  %279 = load i8*, i8** %18, align 8
  %280 = getelementptr inbounds i8, i8* %279, i64 1
  %281 = load i8, i8* %280, align 1
  %282 = zext i8 %281 to i32
  %283 = shl i32 %282, 8
  %284 = or i32 %278, %283
  %285 = load i8*, i8** %18, align 8
  %286 = getelementptr inbounds i8, i8* %285, i64 2
  %287 = load i8, i8* %286, align 1
  %288 = zext i8 %287 to i32
  %289 = shl i32 %288, 16
  %290 = or i32 %284, %289
  %291 = load i8*, i8** %18, align 8
  %292 = getelementptr inbounds i8, i8* %291, i64 3
  %293 = load i8, i8* %292, align 1
  %294 = zext i8 %293 to i32
  %295 = shl i32 %294, 24
  %296 = or i32 %290, %295
  %297 = load i32*, i32** %11, align 8
  %298 = getelementptr inbounds i32, i32* %297, i32 1
  store i32* %298, i32** %11, align 8
  store i32 %296, i32* %297, align 4
  %299 = load i32, i32* %19, align 4
  %300 = load i8*, i8** %18, align 8
  %301 = sext i32 %299 to i64
  %302 = getelementptr inbounds i8, i8* %300, i64 %301
  store i8* %302, i8** %18, align 8
  br label %303

; <label>:303:                                    ; preds = %273, %271
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 8)
  %304 = add i64 %pgocount2, 1
  store i64 %304, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 8)
  %305 = load i8*, i8** %18, align 8
  %306 = getelementptr inbounds i8, i8* %305, i64 0
  %307 = load i8, i8* %306, align 1
  %308 = zext i8 %307 to i32
  %309 = load i8*, i8** %18, align 8
  %310 = getelementptr inbounds i8, i8* %309, i64 1
  %311 = load i8, i8* %310, align 1
  %312 = zext i8 %311 to i32
  %313 = shl i32 %312, 8
  %314 = or i32 %308, %313
  %315 = load i8*, i8** %18, align 8
  %316 = getelementptr inbounds i8, i8* %315, i64 2
  %317 = load i8, i8* %316, align 1
  %318 = zext i8 %317 to i32
  %319 = shl i32 %318, 16
  %320 = or i32 %314, %319
  %321 = load i8*, i8** %18, align 8
  %322 = getelementptr inbounds i8, i8* %321, i64 3
  %323 = load i8, i8* %322, align 1
  %324 = zext i8 %323 to i32
  %325 = shl i32 %324, 24
  %326 = or i32 %320, %325
  %327 = load i32*, i32** %11, align 8
  %328 = getelementptr inbounds i32, i32* %327, i32 1
  store i32* %328, i32** %11, align 8
  store i32 %326, i32* %327, align 4
  %329 = load i32, i32* %19, align 4
  %330 = load i8*, i8** %18, align 8
  %331 = sext i32 %329 to i64
  %332 = getelementptr inbounds i8, i8* %330, i64 %331
  store i8* %332, i8** %18, align 8
  br label %333

; <label>:333:                                    ; preds = %303, %271
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 7)
  %334 = add i64 %pgocount3, 1
  store i64 %334, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 7)
  %335 = load i8*, i8** %18, align 8
  %336 = getelementptr inbounds i8, i8* %335, i64 0
  %337 = load i8, i8* %336, align 1
  %338 = zext i8 %337 to i32
  %339 = load i8*, i8** %18, align 8
  %340 = getelementptr inbounds i8, i8* %339, i64 1
  %341 = load i8, i8* %340, align 1
  %342 = zext i8 %341 to i32
  %343 = shl i32 %342, 8
  %344 = or i32 %338, %343
  %345 = load i8*, i8** %18, align 8
  %346 = getelementptr inbounds i8, i8* %345, i64 2
  %347 = load i8, i8* %346, align 1
  %348 = zext i8 %347 to i32
  %349 = shl i32 %348, 16
  %350 = or i32 %344, %349
  %351 = load i8*, i8** %18, align 8
  %352 = getelementptr inbounds i8, i8* %351, i64 3
  %353 = load i8, i8* %352, align 1
  %354 = zext i8 %353 to i32
  %355 = shl i32 %354, 24
  %356 = or i32 %350, %355
  %357 = load i32*, i32** %11, align 8
  %358 = getelementptr inbounds i32, i32* %357, i32 1
  store i32* %358, i32** %11, align 8
  store i32 %356, i32* %357, align 4
  %359 = load i32, i32* %19, align 4
  %360 = load i8*, i8** %18, align 8
  %361 = sext i32 %359 to i64
  %362 = getelementptr inbounds i8, i8* %360, i64 %361
  store i8* %362, i8** %18, align 8
  br label %363

; <label>:363:                                    ; preds = %333, %271
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 6)
  %364 = add i64 %pgocount4, 1
  store i64 %364, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 6)
  %365 = load i8*, i8** %18, align 8
  %366 = getelementptr inbounds i8, i8* %365, i64 0
  %367 = load i8, i8* %366, align 1
  %368 = zext i8 %367 to i32
  %369 = load i8*, i8** %18, align 8
  %370 = getelementptr inbounds i8, i8* %369, i64 1
  %371 = load i8, i8* %370, align 1
  %372 = zext i8 %371 to i32
  %373 = shl i32 %372, 8
  %374 = or i32 %368, %373
  %375 = load i8*, i8** %18, align 8
  %376 = getelementptr inbounds i8, i8* %375, i64 2
  %377 = load i8, i8* %376, align 1
  %378 = zext i8 %377 to i32
  %379 = shl i32 %378, 16
  %380 = or i32 %374, %379
  %381 = load i8*, i8** %18, align 8
  %382 = getelementptr inbounds i8, i8* %381, i64 3
  %383 = load i8, i8* %382, align 1
  %384 = zext i8 %383 to i32
  %385 = shl i32 %384, 24
  %386 = or i32 %380, %385
  %387 = load i32*, i32** %11, align 8
  %388 = getelementptr inbounds i32, i32* %387, i32 1
  store i32* %388, i32** %11, align 8
  store i32 %386, i32* %387, align 4
  %389 = load i32, i32* %19, align 4
  %390 = load i8*, i8** %18, align 8
  %391 = sext i32 %389 to i64
  %392 = getelementptr inbounds i8, i8* %390, i64 %391
  store i8* %392, i8** %18, align 8
  br label %393

; <label>:393:                                    ; preds = %363, %271
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 5)
  %394 = add i64 %pgocount5, 1
  store i64 %394, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 5)
  %395 = load i8*, i8** %18, align 8
  %396 = getelementptr inbounds i8, i8* %395, i64 0
  %397 = load i8, i8* %396, align 1
  %398 = zext i8 %397 to i32
  %399 = load i8*, i8** %18, align 8
  %400 = getelementptr inbounds i8, i8* %399, i64 1
  %401 = load i8, i8* %400, align 1
  %402 = zext i8 %401 to i32
  %403 = shl i32 %402, 8
  %404 = or i32 %398, %403
  %405 = load i8*, i8** %18, align 8
  %406 = getelementptr inbounds i8, i8* %405, i64 2
  %407 = load i8, i8* %406, align 1
  %408 = zext i8 %407 to i32
  %409 = shl i32 %408, 16
  %410 = or i32 %404, %409
  %411 = load i8*, i8** %18, align 8
  %412 = getelementptr inbounds i8, i8* %411, i64 3
  %413 = load i8, i8* %412, align 1
  %414 = zext i8 %413 to i32
  %415 = shl i32 %414, 24
  %416 = or i32 %410, %415
  %417 = load i32*, i32** %11, align 8
  %418 = getelementptr inbounds i32, i32* %417, i32 1
  store i32* %418, i32** %11, align 8
  store i32 %416, i32* %417, align 4
  %419 = load i32, i32* %19, align 4
  %420 = load i8*, i8** %18, align 8
  %421 = sext i32 %419 to i64
  %422 = getelementptr inbounds i8, i8* %420, i64 %421
  store i8* %422, i8** %18, align 8
  br label %423

; <label>:423:                                    ; preds = %393, %271
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 4)
  %424 = add i64 %pgocount6, 1
  store i64 %424, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 4)
  %425 = load i8*, i8** %18, align 8
  %426 = getelementptr inbounds i8, i8* %425, i64 0
  %427 = load i8, i8* %426, align 1
  %428 = zext i8 %427 to i32
  %429 = load i8*, i8** %18, align 8
  %430 = getelementptr inbounds i8, i8* %429, i64 1
  %431 = load i8, i8* %430, align 1
  %432 = zext i8 %431 to i32
  %433 = shl i32 %432, 8
  %434 = or i32 %428, %433
  %435 = load i8*, i8** %18, align 8
  %436 = getelementptr inbounds i8, i8* %435, i64 2
  %437 = load i8, i8* %436, align 1
  %438 = zext i8 %437 to i32
  %439 = shl i32 %438, 16
  %440 = or i32 %434, %439
  %441 = load i8*, i8** %18, align 8
  %442 = getelementptr inbounds i8, i8* %441, i64 3
  %443 = load i8, i8* %442, align 1
  %444 = zext i8 %443 to i32
  %445 = shl i32 %444, 24
  %446 = or i32 %440, %445
  %447 = load i32*, i32** %11, align 8
  %448 = getelementptr inbounds i32, i32* %447, i32 1
  store i32* %448, i32** %11, align 8
  store i32 %446, i32* %447, align 4
  %449 = load i32, i32* %19, align 4
  %450 = load i8*, i8** %18, align 8
  %451 = sext i32 %449 to i64
  %452 = getelementptr inbounds i8, i8* %450, i64 %451
  store i8* %452, i8** %18, align 8
  br label %453

; <label>:453:                                    ; preds = %423, %271
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 3)
  %454 = add i64 %pgocount7, 1
  store i64 %454, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 3)
  %455 = load i8*, i8** %18, align 8
  %456 = getelementptr inbounds i8, i8* %455, i64 0
  %457 = load i8, i8* %456, align 1
  %458 = zext i8 %457 to i32
  %459 = load i8*, i8** %18, align 8
  %460 = getelementptr inbounds i8, i8* %459, i64 1
  %461 = load i8, i8* %460, align 1
  %462 = zext i8 %461 to i32
  %463 = shl i32 %462, 8
  %464 = or i32 %458, %463
  %465 = load i8*, i8** %18, align 8
  %466 = getelementptr inbounds i8, i8* %465, i64 2
  %467 = load i8, i8* %466, align 1
  %468 = zext i8 %467 to i32
  %469 = shl i32 %468, 16
  %470 = or i32 %464, %469
  %471 = load i8*, i8** %18, align 8
  %472 = getelementptr inbounds i8, i8* %471, i64 3
  %473 = load i8, i8* %472, align 1
  %474 = zext i8 %473 to i32
  %475 = shl i32 %474, 24
  %476 = or i32 %470, %475
  %477 = load i32*, i32** %11, align 8
  %478 = getelementptr inbounds i32, i32* %477, i32 1
  store i32* %478, i32** %11, align 8
  store i32 %476, i32* %477, align 4
  %479 = load i32, i32* %19, align 4
  %480 = load i8*, i8** %18, align 8
  %481 = sext i32 %479 to i64
  %482 = getelementptr inbounds i8, i8* %480, i64 %481
  store i8* %482, i8** %18, align 8
  br label %483

; <label>:483:                                    ; preds = %453, %271
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 2)
  %484 = add i64 %pgocount8, 1
  store i64 %484, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 2)
  br label %485

; <label>:485:                                    ; preds = %483, %268
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 1)
  %486 = add i64 %pgocount9, 1
  store i64 %486, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 1)
  %487 = load i32, i32* %17, align 4
  %488 = load i32*, i32** %11, align 8
  %489 = sext i32 %487 to i64
  %490 = getelementptr inbounds i32, i32* %488, i64 %489
  store i32* %490, i32** %11, align 8
  %491 = load i32, i32* %16, align 4
  %492 = load i8*, i8** %18, align 8
  %493 = sext i32 %491 to i64
  %494 = getelementptr inbounds i8, i8* %492, i64 %493
  store i8* %494, i8** %18, align 8
  br label %30

; <label>:495:                                    ; preds = %30
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 10)
  %496 = add i64 %pgocount10, 1
  store i64 %496, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAcontig8bittile, i64 0, i64 10)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putRGBUAcontig8bittile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %24 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %25 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %24, i32 0, i32 7
  %26 = load i16, i16* %25, align 2
  %27 = zext i16 %26 to i32
  store i32 %27, i32* %19, align 4
  %28 = load i32, i32* %13, align 4
  %29 = load i32, i32* %19, align 4
  %30 = load i32, i32* %16, align 4
  %31 = mul nsw i32 %30, %29
  store i32 %31, i32* %16, align 4
  br label %32

; <label>:32:                                     ; preds = %85, %9
  %33 = load i32, i32* %15, align 4
  %34 = add i32 %33, -1
  store i32 %34, i32* %15, align 4
  %35 = icmp ugt i32 %33, 0
  br i1 %35, label %36, label %95

; <label>:36:                                     ; preds = %32
  %37 = load i32, i32* %14, align 4
  store i32 %37, i32* %12, align 4
  br label %38

; <label>:38:                                     ; preds = %42, %36
  %39 = load i32, i32* %12, align 4
  %40 = add i32 %39, -1
  store i32 %40, i32* %12, align 4
  %41 = icmp ugt i32 %39, 0
  br i1 %41, label %42, label %85

; <label>:42:                                     ; preds = %38
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAcontig8bittile, i64 0, i64 0)
  %43 = add i64 %pgocount, 1
  store i64 %43, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAcontig8bittile, i64 0, i64 0)
  %44 = load i8*, i8** %18, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 3
  %46 = load i8, i8* %45, align 1
  %47 = zext i8 %46 to i32
  store i32 %47, i32* %23, align 4
  %48 = load i8*, i8** %18, align 8
  %49 = getelementptr inbounds i8, i8* %48, i64 0
  %50 = load i8, i8* %49, align 1
  %51 = zext i8 %50 to i32
  %52 = load i32, i32* %23, align 4
  %53 = mul i32 %51, %52
  %54 = udiv i32 %53, 255
  store i32 %54, i32* %20, align 4
  %55 = load i8*, i8** %18, align 8
  %56 = getelementptr inbounds i8, i8* %55, i64 1
  %57 = load i8, i8* %56, align 1
  %58 = zext i8 %57 to i32
  %59 = load i32, i32* %23, align 4
  %60 = mul i32 %58, %59
  %61 = udiv i32 %60, 255
  store i32 %61, i32* %21, align 4
  %62 = load i8*, i8** %18, align 8
  %63 = getelementptr inbounds i8, i8* %62, i64 2
  %64 = load i8, i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = load i32, i32* %23, align 4
  %67 = mul i32 %65, %66
  %68 = udiv i32 %67, 255
  store i32 %68, i32* %22, align 4
  %69 = load i32, i32* %20, align 4
  %70 = load i32, i32* %21, align 4
  %71 = shl i32 %70, 8
  %72 = or i32 %69, %71
  %73 = load i32, i32* %22, align 4
  %74 = shl i32 %73, 16
  %75 = or i32 %72, %74
  %76 = load i32, i32* %23, align 4
  %77 = shl i32 %76, 24
  %78 = or i32 %75, %77
  %79 = load i32*, i32** %11, align 8
  %80 = getelementptr inbounds i32, i32* %79, i32 1
  store i32* %80, i32** %11, align 8
  store i32 %78, i32* %79, align 4
  %81 = load i32, i32* %19, align 4
  %82 = load i8*, i8** %18, align 8
  %83 = sext i32 %81 to i64
  %84 = getelementptr inbounds i8, i8* %82, i64 %83
  store i8* %84, i8** %18, align 8
  br label %38

; <label>:85:                                     ; preds = %38
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAcontig8bittile, i64 0, i64 1)
  %86 = add i64 %pgocount1, 1
  store i64 %86, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAcontig8bittile, i64 0, i64 1)
  %87 = load i32, i32* %17, align 4
  %88 = load i32*, i32** %11, align 8
  %89 = sext i32 %87 to i64
  %90 = getelementptr inbounds i32, i32* %88, i64 %89
  store i32* %90, i32** %11, align 8
  %91 = load i32, i32* %16, align 4
  %92 = load i8*, i8** %18, align 8
  %93 = sext i32 %91 to i64
  %94 = getelementptr inbounds i8, i8* %92, i64 %93
  store i8* %94, i8** %18, align 8
  br label %32

; <label>:95:                                     ; preds = %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAcontig8bittile, i64 0, i64 2)
  %96 = add i64 %pgocount2, 1
  store i64 %96, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAcontig8bittile, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putRGBcontig8bittile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %21 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %22 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %21, i32 0, i32 7
  %23 = load i16, i16* %22, align 2
  %24 = zext i16 %23 to i32
  store i32 %24, i32* %19, align 4
  %25 = load i32, i32* %12, align 4
  %26 = load i32, i32* %13, align 4
  %27 = load i32, i32* %19, align 4
  %28 = load i32, i32* %16, align 4
  %29 = mul nsw i32 %28, %27
  store i32 %29, i32* %16, align 4
  br label %30

; <label>:30:                                     ; preds = %410, %9
  %31 = load i32, i32* %15, align 4
  %32 = add i32 %31, -1
  store i32 %32, i32* %15, align 4
  %33 = icmp ugt i32 %31, 0
  br i1 %33, label %34, label %420

; <label>:34:                                     ; preds = %30
  %35 = load i32, i32* %14, align 4
  store i32 %35, i32* %20, align 4
  br label %36

; <label>:36:                                     ; preds = %224, %34
  %37 = load i32, i32* %20, align 4
  %38 = icmp uge i32 %37, 8
  br i1 %38, label %39, label %228

; <label>:39:                                     ; preds = %36
  %40 = load i8*, i8** %18, align 8
  %41 = getelementptr inbounds i8, i8* %40, i64 0
  %42 = load i8, i8* %41, align 1
  %43 = zext i8 %42 to i32
  %44 = load i8*, i8** %18, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 1
  %46 = load i8, i8* %45, align 1
  %47 = zext i8 %46 to i32
  %48 = shl i32 %47, 8
  %49 = or i32 %43, %48
  %50 = load i8*, i8** %18, align 8
  %51 = getelementptr inbounds i8, i8* %50, i64 2
  %52 = load i8, i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = shl i32 %53, 16
  %55 = or i32 %49, %54
  %56 = or i32 %55, -16777216
  %57 = load i32*, i32** %11, align 8
  %58 = getelementptr inbounds i32, i32* %57, i32 1
  store i32* %58, i32** %11, align 8
  store i32 %56, i32* %57, align 4
  %59 = load i32, i32* %19, align 4
  %60 = load i8*, i8** %18, align 8
  %61 = sext i32 %59 to i64
  %62 = getelementptr inbounds i8, i8* %60, i64 %61
  store i8* %62, i8** %18, align 8
  %63 = load i8*, i8** %18, align 8
  %64 = getelementptr inbounds i8, i8* %63, i64 0
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = load i8*, i8** %18, align 8
  %68 = getelementptr inbounds i8, i8* %67, i64 1
  %69 = load i8, i8* %68, align 1
  %70 = zext i8 %69 to i32
  %71 = shl i32 %70, 8
  %72 = or i32 %66, %71
  %73 = load i8*, i8** %18, align 8
  %74 = getelementptr inbounds i8, i8* %73, i64 2
  %75 = load i8, i8* %74, align 1
  %76 = zext i8 %75 to i32
  %77 = shl i32 %76, 16
  %78 = or i32 %72, %77
  %79 = or i32 %78, -16777216
  %80 = load i32*, i32** %11, align 8
  %81 = getelementptr inbounds i32, i32* %80, i32 1
  store i32* %81, i32** %11, align 8
  store i32 %79, i32* %80, align 4
  %82 = load i32, i32* %19, align 4
  %83 = load i8*, i8** %18, align 8
  %84 = sext i32 %82 to i64
  %85 = getelementptr inbounds i8, i8* %83, i64 %84
  store i8* %85, i8** %18, align 8
  %86 = load i8*, i8** %18, align 8
  %87 = getelementptr inbounds i8, i8* %86, i64 0
  %88 = load i8, i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = load i8*, i8** %18, align 8
  %91 = getelementptr inbounds i8, i8* %90, i64 1
  %92 = load i8, i8* %91, align 1
  %93 = zext i8 %92 to i32
  %94 = shl i32 %93, 8
  %95 = or i32 %89, %94
  %96 = load i8*, i8** %18, align 8
  %97 = getelementptr inbounds i8, i8* %96, i64 2
  %98 = load i8, i8* %97, align 1
  %99 = zext i8 %98 to i32
  %100 = shl i32 %99, 16
  %101 = or i32 %95, %100
  %102 = or i32 %101, -16777216
  %103 = load i32*, i32** %11, align 8
  %104 = getelementptr inbounds i32, i32* %103, i32 1
  store i32* %104, i32** %11, align 8
  store i32 %102, i32* %103, align 4
  %105 = load i32, i32* %19, align 4
  %106 = load i8*, i8** %18, align 8
  %107 = sext i32 %105 to i64
  %108 = getelementptr inbounds i8, i8* %106, i64 %107
  store i8* %108, i8** %18, align 8
  %109 = load i8*, i8** %18, align 8
  %110 = getelementptr inbounds i8, i8* %109, i64 0
  %111 = load i8, i8* %110, align 1
  %112 = zext i8 %111 to i32
  %113 = load i8*, i8** %18, align 8
  %114 = getelementptr inbounds i8, i8* %113, i64 1
  %115 = load i8, i8* %114, align 1
  %116 = zext i8 %115 to i32
  %117 = shl i32 %116, 8
  %118 = or i32 %112, %117
  %119 = load i8*, i8** %18, align 8
  %120 = getelementptr inbounds i8, i8* %119, i64 2
  %121 = load i8, i8* %120, align 1
  %122 = zext i8 %121 to i32
  %123 = shl i32 %122, 16
  %124 = or i32 %118, %123
  %125 = or i32 %124, -16777216
  %126 = load i32*, i32** %11, align 8
  %127 = getelementptr inbounds i32, i32* %126, i32 1
  store i32* %127, i32** %11, align 8
  store i32 %125, i32* %126, align 4
  %128 = load i32, i32* %19, align 4
  %129 = load i8*, i8** %18, align 8
  %130 = sext i32 %128 to i64
  %131 = getelementptr inbounds i8, i8* %129, i64 %130
  store i8* %131, i8** %18, align 8
  %132 = load i8*, i8** %18, align 8
  %133 = getelementptr inbounds i8, i8* %132, i64 0
  %134 = load i8, i8* %133, align 1
  %135 = zext i8 %134 to i32
  %136 = load i8*, i8** %18, align 8
  %137 = getelementptr inbounds i8, i8* %136, i64 1
  %138 = load i8, i8* %137, align 1
  %139 = zext i8 %138 to i32
  %140 = shl i32 %139, 8
  %141 = or i32 %135, %140
  %142 = load i8*, i8** %18, align 8
  %143 = getelementptr inbounds i8, i8* %142, i64 2
  %144 = load i8, i8* %143, align 1
  %145 = zext i8 %144 to i32
  %146 = shl i32 %145, 16
  %147 = or i32 %141, %146
  %148 = or i32 %147, -16777216
  %149 = load i32*, i32** %11, align 8
  %150 = getelementptr inbounds i32, i32* %149, i32 1
  store i32* %150, i32** %11, align 8
  store i32 %148, i32* %149, align 4
  %151 = load i32, i32* %19, align 4
  %152 = load i8*, i8** %18, align 8
  %153 = sext i32 %151 to i64
  %154 = getelementptr inbounds i8, i8* %152, i64 %153
  store i8* %154, i8** %18, align 8
  %155 = load i8*, i8** %18, align 8
  %156 = getelementptr inbounds i8, i8* %155, i64 0
  %157 = load i8, i8* %156, align 1
  %158 = zext i8 %157 to i32
  %159 = load i8*, i8** %18, align 8
  %160 = getelementptr inbounds i8, i8* %159, i64 1
  %161 = load i8, i8* %160, align 1
  %162 = zext i8 %161 to i32
  %163 = shl i32 %162, 8
  %164 = or i32 %158, %163
  %165 = load i8*, i8** %18, align 8
  %166 = getelementptr inbounds i8, i8* %165, i64 2
  %167 = load i8, i8* %166, align 1
  %168 = zext i8 %167 to i32
  %169 = shl i32 %168, 16
  %170 = or i32 %164, %169
  %171 = or i32 %170, -16777216
  %172 = load i32*, i32** %11, align 8
  %173 = getelementptr inbounds i32, i32* %172, i32 1
  store i32* %173, i32** %11, align 8
  store i32 %171, i32* %172, align 4
  %174 = load i32, i32* %19, align 4
  %175 = load i8*, i8** %18, align 8
  %176 = sext i32 %174 to i64
  %177 = getelementptr inbounds i8, i8* %175, i64 %176
  store i8* %177, i8** %18, align 8
  %178 = load i8*, i8** %18, align 8
  %179 = getelementptr inbounds i8, i8* %178, i64 0
  %180 = load i8, i8* %179, align 1
  %181 = zext i8 %180 to i32
  %182 = load i8*, i8** %18, align 8
  %183 = getelementptr inbounds i8, i8* %182, i64 1
  %184 = load i8, i8* %183, align 1
  %185 = zext i8 %184 to i32
  %186 = shl i32 %185, 8
  %187 = or i32 %181, %186
  %188 = load i8*, i8** %18, align 8
  %189 = getelementptr inbounds i8, i8* %188, i64 2
  %190 = load i8, i8* %189, align 1
  %191 = zext i8 %190 to i32
  %192 = shl i32 %191, 16
  %193 = or i32 %187, %192
  %194 = or i32 %193, -16777216
  %195 = load i32*, i32** %11, align 8
  %196 = getelementptr inbounds i32, i32* %195, i32 1
  store i32* %196, i32** %11, align 8
  store i32 %194, i32* %195, align 4
  %197 = load i32, i32* %19, align 4
  %198 = load i8*, i8** %18, align 8
  %199 = sext i32 %197 to i64
  %200 = getelementptr inbounds i8, i8* %198, i64 %199
  store i8* %200, i8** %18, align 8
  %201 = load i8*, i8** %18, align 8
  %202 = getelementptr inbounds i8, i8* %201, i64 0
  %203 = load i8, i8* %202, align 1
  %204 = zext i8 %203 to i32
  %205 = load i8*, i8** %18, align 8
  %206 = getelementptr inbounds i8, i8* %205, i64 1
  %207 = load i8, i8* %206, align 1
  %208 = zext i8 %207 to i32
  %209 = shl i32 %208, 8
  %210 = or i32 %204, %209
  %211 = load i8*, i8** %18, align 8
  %212 = getelementptr inbounds i8, i8* %211, i64 2
  %213 = load i8, i8* %212, align 1
  %214 = zext i8 %213 to i32
  %215 = shl i32 %214, 16
  %216 = or i32 %210, %215
  %217 = or i32 %216, -16777216
  %218 = load i32*, i32** %11, align 8
  %219 = getelementptr inbounds i32, i32* %218, i32 1
  store i32* %219, i32** %11, align 8
  store i32 %217, i32* %218, align 4
  %220 = load i32, i32* %19, align 4
  %221 = load i8*, i8** %18, align 8
  %222 = sext i32 %220 to i64
  %223 = getelementptr inbounds i8, i8* %221, i64 %222
  store i8* %223, i8** %18, align 8
  br label %224

; <label>:224:                                    ; preds = %39
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 0)
  %225 = add i64 %pgocount, 1
  store i64 %225, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 0)
  %226 = load i32, i32* %20, align 4
  %227 = sub i32 %226, 8
  store i32 %227, i32* %20, align 4
  br label %36

; <label>:228:                                    ; preds = %36
  %229 = load i32, i32* %20, align 4
  %230 = icmp ugt i32 %229, 0
  br i1 %230, label %231, label %410

; <label>:231:                                    ; preds = %228
  %232 = load i32, i32* %20, align 4
  switch i32 %232, label %408 [
    i32 7, label %233
    i32 6, label %258
    i32 5, label %283
    i32 4, label %308
    i32 3, label %333
    i32 2, label %358
    i32 1, label %383
  ]

; <label>:233:                                    ; preds = %231
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 9)
  %234 = add i64 %pgocount1, 1
  store i64 %234, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 9)
  %235 = load i8*, i8** %18, align 8
  %236 = getelementptr inbounds i8, i8* %235, i64 0
  %237 = load i8, i8* %236, align 1
  %238 = zext i8 %237 to i32
  %239 = load i8*, i8** %18, align 8
  %240 = getelementptr inbounds i8, i8* %239, i64 1
  %241 = load i8, i8* %240, align 1
  %242 = zext i8 %241 to i32
  %243 = shl i32 %242, 8
  %244 = or i32 %238, %243
  %245 = load i8*, i8** %18, align 8
  %246 = getelementptr inbounds i8, i8* %245, i64 2
  %247 = load i8, i8* %246, align 1
  %248 = zext i8 %247 to i32
  %249 = shl i32 %248, 16
  %250 = or i32 %244, %249
  %251 = or i32 %250, -16777216
  %252 = load i32*, i32** %11, align 8
  %253 = getelementptr inbounds i32, i32* %252, i32 1
  store i32* %253, i32** %11, align 8
  store i32 %251, i32* %252, align 4
  %254 = load i32, i32* %19, align 4
  %255 = load i8*, i8** %18, align 8
  %256 = sext i32 %254 to i64
  %257 = getelementptr inbounds i8, i8* %255, i64 %256
  store i8* %257, i8** %18, align 8
  br label %258

; <label>:258:                                    ; preds = %233, %231
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 8)
  %259 = add i64 %pgocount2, 1
  store i64 %259, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 8)
  %260 = load i8*, i8** %18, align 8
  %261 = getelementptr inbounds i8, i8* %260, i64 0
  %262 = load i8, i8* %261, align 1
  %263 = zext i8 %262 to i32
  %264 = load i8*, i8** %18, align 8
  %265 = getelementptr inbounds i8, i8* %264, i64 1
  %266 = load i8, i8* %265, align 1
  %267 = zext i8 %266 to i32
  %268 = shl i32 %267, 8
  %269 = or i32 %263, %268
  %270 = load i8*, i8** %18, align 8
  %271 = getelementptr inbounds i8, i8* %270, i64 2
  %272 = load i8, i8* %271, align 1
  %273 = zext i8 %272 to i32
  %274 = shl i32 %273, 16
  %275 = or i32 %269, %274
  %276 = or i32 %275, -16777216
  %277 = load i32*, i32** %11, align 8
  %278 = getelementptr inbounds i32, i32* %277, i32 1
  store i32* %278, i32** %11, align 8
  store i32 %276, i32* %277, align 4
  %279 = load i32, i32* %19, align 4
  %280 = load i8*, i8** %18, align 8
  %281 = sext i32 %279 to i64
  %282 = getelementptr inbounds i8, i8* %280, i64 %281
  store i8* %282, i8** %18, align 8
  br label %283

; <label>:283:                                    ; preds = %258, %231
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 7)
  %284 = add i64 %pgocount3, 1
  store i64 %284, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 7)
  %285 = load i8*, i8** %18, align 8
  %286 = getelementptr inbounds i8, i8* %285, i64 0
  %287 = load i8, i8* %286, align 1
  %288 = zext i8 %287 to i32
  %289 = load i8*, i8** %18, align 8
  %290 = getelementptr inbounds i8, i8* %289, i64 1
  %291 = load i8, i8* %290, align 1
  %292 = zext i8 %291 to i32
  %293 = shl i32 %292, 8
  %294 = or i32 %288, %293
  %295 = load i8*, i8** %18, align 8
  %296 = getelementptr inbounds i8, i8* %295, i64 2
  %297 = load i8, i8* %296, align 1
  %298 = zext i8 %297 to i32
  %299 = shl i32 %298, 16
  %300 = or i32 %294, %299
  %301 = or i32 %300, -16777216
  %302 = load i32*, i32** %11, align 8
  %303 = getelementptr inbounds i32, i32* %302, i32 1
  store i32* %303, i32** %11, align 8
  store i32 %301, i32* %302, align 4
  %304 = load i32, i32* %19, align 4
  %305 = load i8*, i8** %18, align 8
  %306 = sext i32 %304 to i64
  %307 = getelementptr inbounds i8, i8* %305, i64 %306
  store i8* %307, i8** %18, align 8
  br label %308

; <label>:308:                                    ; preds = %283, %231
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 6)
  %309 = add i64 %pgocount4, 1
  store i64 %309, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 6)
  %310 = load i8*, i8** %18, align 8
  %311 = getelementptr inbounds i8, i8* %310, i64 0
  %312 = load i8, i8* %311, align 1
  %313 = zext i8 %312 to i32
  %314 = load i8*, i8** %18, align 8
  %315 = getelementptr inbounds i8, i8* %314, i64 1
  %316 = load i8, i8* %315, align 1
  %317 = zext i8 %316 to i32
  %318 = shl i32 %317, 8
  %319 = or i32 %313, %318
  %320 = load i8*, i8** %18, align 8
  %321 = getelementptr inbounds i8, i8* %320, i64 2
  %322 = load i8, i8* %321, align 1
  %323 = zext i8 %322 to i32
  %324 = shl i32 %323, 16
  %325 = or i32 %319, %324
  %326 = or i32 %325, -16777216
  %327 = load i32*, i32** %11, align 8
  %328 = getelementptr inbounds i32, i32* %327, i32 1
  store i32* %328, i32** %11, align 8
  store i32 %326, i32* %327, align 4
  %329 = load i32, i32* %19, align 4
  %330 = load i8*, i8** %18, align 8
  %331 = sext i32 %329 to i64
  %332 = getelementptr inbounds i8, i8* %330, i64 %331
  store i8* %332, i8** %18, align 8
  br label %333

; <label>:333:                                    ; preds = %308, %231
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 5)
  %334 = add i64 %pgocount5, 1
  store i64 %334, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 5)
  %335 = load i8*, i8** %18, align 8
  %336 = getelementptr inbounds i8, i8* %335, i64 0
  %337 = load i8, i8* %336, align 1
  %338 = zext i8 %337 to i32
  %339 = load i8*, i8** %18, align 8
  %340 = getelementptr inbounds i8, i8* %339, i64 1
  %341 = load i8, i8* %340, align 1
  %342 = zext i8 %341 to i32
  %343 = shl i32 %342, 8
  %344 = or i32 %338, %343
  %345 = load i8*, i8** %18, align 8
  %346 = getelementptr inbounds i8, i8* %345, i64 2
  %347 = load i8, i8* %346, align 1
  %348 = zext i8 %347 to i32
  %349 = shl i32 %348, 16
  %350 = or i32 %344, %349
  %351 = or i32 %350, -16777216
  %352 = load i32*, i32** %11, align 8
  %353 = getelementptr inbounds i32, i32* %352, i32 1
  store i32* %353, i32** %11, align 8
  store i32 %351, i32* %352, align 4
  %354 = load i32, i32* %19, align 4
  %355 = load i8*, i8** %18, align 8
  %356 = sext i32 %354 to i64
  %357 = getelementptr inbounds i8, i8* %355, i64 %356
  store i8* %357, i8** %18, align 8
  br label %358

; <label>:358:                                    ; preds = %333, %231
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 4)
  %359 = add i64 %pgocount6, 1
  store i64 %359, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 4)
  %360 = load i8*, i8** %18, align 8
  %361 = getelementptr inbounds i8, i8* %360, i64 0
  %362 = load i8, i8* %361, align 1
  %363 = zext i8 %362 to i32
  %364 = load i8*, i8** %18, align 8
  %365 = getelementptr inbounds i8, i8* %364, i64 1
  %366 = load i8, i8* %365, align 1
  %367 = zext i8 %366 to i32
  %368 = shl i32 %367, 8
  %369 = or i32 %363, %368
  %370 = load i8*, i8** %18, align 8
  %371 = getelementptr inbounds i8, i8* %370, i64 2
  %372 = load i8, i8* %371, align 1
  %373 = zext i8 %372 to i32
  %374 = shl i32 %373, 16
  %375 = or i32 %369, %374
  %376 = or i32 %375, -16777216
  %377 = load i32*, i32** %11, align 8
  %378 = getelementptr inbounds i32, i32* %377, i32 1
  store i32* %378, i32** %11, align 8
  store i32 %376, i32* %377, align 4
  %379 = load i32, i32* %19, align 4
  %380 = load i8*, i8** %18, align 8
  %381 = sext i32 %379 to i64
  %382 = getelementptr inbounds i8, i8* %380, i64 %381
  store i8* %382, i8** %18, align 8
  br label %383

; <label>:383:                                    ; preds = %358, %231
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 3)
  %384 = add i64 %pgocount7, 1
  store i64 %384, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 3)
  %385 = load i8*, i8** %18, align 8
  %386 = getelementptr inbounds i8, i8* %385, i64 0
  %387 = load i8, i8* %386, align 1
  %388 = zext i8 %387 to i32
  %389 = load i8*, i8** %18, align 8
  %390 = getelementptr inbounds i8, i8* %389, i64 1
  %391 = load i8, i8* %390, align 1
  %392 = zext i8 %391 to i32
  %393 = shl i32 %392, 8
  %394 = or i32 %388, %393
  %395 = load i8*, i8** %18, align 8
  %396 = getelementptr inbounds i8, i8* %395, i64 2
  %397 = load i8, i8* %396, align 1
  %398 = zext i8 %397 to i32
  %399 = shl i32 %398, 16
  %400 = or i32 %394, %399
  %401 = or i32 %400, -16777216
  %402 = load i32*, i32** %11, align 8
  %403 = getelementptr inbounds i32, i32* %402, i32 1
  store i32* %403, i32** %11, align 8
  store i32 %401, i32* %402, align 4
  %404 = load i32, i32* %19, align 4
  %405 = load i8*, i8** %18, align 8
  %406 = sext i32 %404 to i64
  %407 = getelementptr inbounds i8, i8* %405, i64 %406
  store i8* %407, i8** %18, align 8
  br label %408

; <label>:408:                                    ; preds = %383, %231
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 2)
  %409 = add i64 %pgocount8, 1
  store i64 %409, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 2)
  br label %410

; <label>:410:                                    ; preds = %408, %228
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 1)
  %411 = add i64 %pgocount9, 1
  store i64 %411, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 1)
  %412 = load i32, i32* %17, align 4
  %413 = load i32*, i32** %11, align 8
  %414 = sext i32 %412 to i64
  %415 = getelementptr inbounds i32, i32* %413, i64 %414
  store i32* %415, i32** %11, align 8
  %416 = load i32, i32* %16, align 4
  %417 = load i8*, i8** %18, align 8
  %418 = sext i32 %416 to i64
  %419 = getelementptr inbounds i8, i8* %417, i64 %418
  store i8* %419, i8** %18, align 8
  br label %30

; <label>:420:                                    ; preds = %30
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 10)
  %421 = add i64 %pgocount10, 1
  store i64 %421, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bittile, i64 0, i64 10)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putRGBcontig8bitMaptile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i8*, align 8
  %20 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %21 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %22 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %21, i32 0, i32 15
  %23 = load i8*, i8** %22, align 8
  store i8* %23, i8** %19, align 8
  %24 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %25 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %24, i32 0, i32 7
  %26 = load i16, i16* %25, align 2
  %27 = zext i16 %26 to i32
  store i32 %27, i32* %20, align 4
  %28 = load i32, i32* %13, align 4
  %29 = load i32, i32* %20, align 4
  %30 = load i32, i32* %16, align 4
  %31 = mul nsw i32 %30, %29
  store i32 %31, i32* %16, align 4
  br label %32

; <label>:32:                                     ; preds = %79, %9
  %33 = load i32, i32* %15, align 4
  %34 = add i32 %33, -1
  store i32 %34, i32* %15, align 4
  %35 = icmp ugt i32 %33, 0
  br i1 %35, label %36, label %89

; <label>:36:                                     ; preds = %32
  %37 = load i32, i32* %14, align 4
  store i32 %37, i32* %12, align 4
  br label %38

; <label>:38:                                     ; preds = %42, %36
  %39 = load i32, i32* %12, align 4
  %40 = add i32 %39, -1
  store i32 %40, i32* %12, align 4
  %41 = icmp ugt i32 %39, 0
  br i1 %41, label %42, label %79

; <label>:42:                                     ; preds = %38
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig8bitMaptile, i64 0, i64 0)
  %43 = add i64 %pgocount, 1
  store i64 %43, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig8bitMaptile, i64 0, i64 0)
  %44 = load i8*, i8** %19, align 8
  %45 = load i8*, i8** %18, align 8
  %46 = getelementptr inbounds i8, i8* %45, i64 0
  %47 = load i8, i8* %46, align 1
  %48 = zext i8 %47 to i64
  %49 = getelementptr inbounds i8, i8* %44, i64 %48
  %50 = load i8, i8* %49, align 1
  %51 = zext i8 %50 to i32
  %52 = load i8*, i8** %19, align 8
  %53 = load i8*, i8** %18, align 8
  %54 = getelementptr inbounds i8, i8* %53, i64 1
  %55 = load i8, i8* %54, align 1
  %56 = zext i8 %55 to i64
  %57 = getelementptr inbounds i8, i8* %52, i64 %56
  %58 = load i8, i8* %57, align 1
  %59 = zext i8 %58 to i32
  %60 = shl i32 %59, 8
  %61 = or i32 %51, %60
  %62 = load i8*, i8** %19, align 8
  %63 = load i8*, i8** %18, align 8
  %64 = getelementptr inbounds i8, i8* %63, i64 2
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i64
  %67 = getelementptr inbounds i8, i8* %62, i64 %66
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i32
  %70 = shl i32 %69, 16
  %71 = or i32 %61, %70
  %72 = or i32 %71, -16777216
  %73 = load i32*, i32** %11, align 8
  %74 = getelementptr inbounds i32, i32* %73, i32 1
  store i32* %74, i32** %11, align 8
  store i32 %72, i32* %73, align 4
  %75 = load i32, i32* %20, align 4
  %76 = load i8*, i8** %18, align 8
  %77 = sext i32 %75 to i64
  %78 = getelementptr inbounds i8, i8* %76, i64 %77
  store i8* %78, i8** %18, align 8
  br label %38

; <label>:79:                                     ; preds = %38
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig8bitMaptile, i64 0, i64 1)
  %80 = add i64 %pgocount1, 1
  store i64 %80, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig8bitMaptile, i64 0, i64 1)
  %81 = load i32, i32* %16, align 4
  %82 = load i8*, i8** %18, align 8
  %83 = sext i32 %81 to i64
  %84 = getelementptr inbounds i8, i8* %82, i64 %83
  store i8* %84, i8** %18, align 8
  %85 = load i32, i32* %17, align 4
  %86 = load i32*, i32** %11, align 8
  %87 = sext i32 %85 to i64
  %88 = getelementptr inbounds i32, i32* %86, i64 %87
  store i32* %88, i32** %11, align 8
  br label %32

; <label>:89:                                     ; preds = %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig8bitMaptile, i64 0, i64 2)
  %90 = add i64 %pgocount2, 1
  store i64 %90, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig8bitMaptile, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putRGBcontig16bittile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i32, align 4
  %20 = alloca i16*, align 8
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %21 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %22 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %21, i32 0, i32 7
  %23 = load i16, i16* %22, align 2
  %24 = zext i16 %23 to i32
  store i32 %24, i32* %19, align 4
  %25 = load i8*, i8** %18, align 8
  %26 = bitcast i8* %25 to i16*
  store i16* %26, i16** %20, align 8
  %27 = load i32, i32* %13, align 4
  %28 = load i32, i32* %19, align 4
  %29 = load i32, i32* %16, align 4
  %30 = mul nsw i32 %29, %28
  store i32 %30, i32* %16, align 4
  br label %31

; <label>:31:                                     ; preds = %72, %9
  %32 = load i32, i32* %15, align 4
  %33 = add i32 %32, -1
  store i32 %33, i32* %15, align 4
  %34 = icmp ugt i32 %32, 0
  br i1 %34, label %35, label %82

; <label>:35:                                     ; preds = %31
  %36 = load i32, i32* %14, align 4
  store i32 %36, i32* %12, align 4
  br label %37

; <label>:37:                                     ; preds = %41, %35
  %38 = load i32, i32* %12, align 4
  %39 = add i32 %38, -1
  store i32 %39, i32* %12, align 4
  %40 = icmp ugt i32 %38, 0
  br i1 %40, label %41, label %72

; <label>:41:                                     ; preds = %37
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig16bittile, i64 0, i64 0)
  %42 = add i64 %pgocount, 1
  store i64 %42, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig16bittile, i64 0, i64 0)
  %43 = load i16*, i16** %20, align 8
  %44 = getelementptr inbounds i16, i16* %43, i64 0
  %45 = load i16, i16* %44, align 2
  %46 = zext i16 %45 to i32
  %47 = ashr i32 %46, 8
  %48 = and i32 %47, 255
  %49 = load i16*, i16** %20, align 8
  %50 = getelementptr inbounds i16, i16* %49, i64 1
  %51 = load i16, i16* %50, align 2
  %52 = zext i16 %51 to i32
  %53 = ashr i32 %52, 8
  %54 = and i32 %53, 255
  %55 = shl i32 %54, 8
  %56 = or i32 %48, %55
  %57 = load i16*, i16** %20, align 8
  %58 = getelementptr inbounds i16, i16* %57, i64 2
  %59 = load i16, i16* %58, align 2
  %60 = zext i16 %59 to i32
  %61 = ashr i32 %60, 8
  %62 = and i32 %61, 255
  %63 = shl i32 %62, 16
  %64 = or i32 %56, %63
  %65 = or i32 %64, -16777216
  %66 = load i32*, i32** %11, align 8
  %67 = getelementptr inbounds i32, i32* %66, i32 1
  store i32* %67, i32** %11, align 8
  store i32 %65, i32* %66, align 4
  %68 = load i32, i32* %19, align 4
  %69 = load i16*, i16** %20, align 8
  %70 = sext i32 %68 to i64
  %71 = getelementptr inbounds i16, i16* %69, i64 %70
  store i16* %71, i16** %20, align 8
  br label %37

; <label>:72:                                     ; preds = %37
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig16bittile, i64 0, i64 1)
  %73 = add i64 %pgocount1, 1
  store i64 %73, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig16bittile, i64 0, i64 1)
  %74 = load i32, i32* %17, align 4
  %75 = load i32*, i32** %11, align 8
  %76 = sext i32 %74 to i64
  %77 = getelementptr inbounds i32, i32* %75, i64 %76
  store i32* %77, i32** %11, align 8
  %78 = load i32, i32* %16, align 4
  %79 = load i16*, i16** %20, align 8
  %80 = sext i32 %78 to i64
  %81 = getelementptr inbounds i16, i16* %79, i64 %80
  store i16* %81, i16** %20, align 8
  br label %31

; <label>:82:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig16bittile, i64 0, i64 2)
  %83 = add i64 %pgocount2, 1
  store i64 %83, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig16bittile, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putRGBAAcontig16bittile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i32, align 4
  %20 = alloca i16*, align 8
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %21 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %22 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %21, i32 0, i32 7
  %23 = load i16, i16* %22, align 2
  %24 = zext i16 %23 to i32
  store i32 %24, i32* %19, align 4
  %25 = load i8*, i8** %18, align 8
  %26 = bitcast i8* %25 to i16*
  store i16* %26, i16** %20, align 8
  %27 = load i32, i32* %13, align 4
  %28 = load i32, i32* %19, align 4
  %29 = load i32, i32* %16, align 4
  %30 = mul nsw i32 %29, %28
  store i32 %30, i32* %16, align 4
  br label %31

; <label>:31:                                     ; preds = %79, %9
  %32 = load i32, i32* %15, align 4
  %33 = add i32 %32, -1
  store i32 %33, i32* %15, align 4
  %34 = icmp ugt i32 %32, 0
  br i1 %34, label %35, label %89

; <label>:35:                                     ; preds = %31
  %36 = load i32, i32* %14, align 4
  store i32 %36, i32* %12, align 4
  br label %37

; <label>:37:                                     ; preds = %41, %35
  %38 = load i32, i32* %12, align 4
  %39 = add i32 %38, -1
  store i32 %39, i32* %12, align 4
  %40 = icmp ugt i32 %38, 0
  br i1 %40, label %41, label %79

; <label>:41:                                     ; preds = %37
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBAAcontig16bittile, i64 0, i64 0)
  %42 = add i64 %pgocount, 1
  store i64 %42, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBAAcontig16bittile, i64 0, i64 0)
  %43 = load i16*, i16** %20, align 8
  %44 = getelementptr inbounds i16, i16* %43, i64 0
  %45 = load i16, i16* %44, align 2
  %46 = zext i16 %45 to i32
  %47 = ashr i32 %46, 8
  %48 = and i32 %47, 255
  %49 = load i16*, i16** %20, align 8
  %50 = getelementptr inbounds i16, i16* %49, i64 1
  %51 = load i16, i16* %50, align 2
  %52 = zext i16 %51 to i32
  %53 = ashr i32 %52, 8
  %54 = and i32 %53, 255
  %55 = shl i32 %54, 8
  %56 = or i32 %48, %55
  %57 = load i16*, i16** %20, align 8
  %58 = getelementptr inbounds i16, i16* %57, i64 2
  %59 = load i16, i16* %58, align 2
  %60 = zext i16 %59 to i32
  %61 = ashr i32 %60, 8
  %62 = and i32 %61, 255
  %63 = shl i32 %62, 16
  %64 = or i32 %56, %63
  %65 = load i16*, i16** %20, align 8
  %66 = getelementptr inbounds i16, i16* %65, i64 3
  %67 = load i16, i16* %66, align 2
  %68 = zext i16 %67 to i32
  %69 = ashr i32 %68, 8
  %70 = and i32 %69, 255
  %71 = shl i32 %70, 24
  %72 = or i32 %64, %71
  %73 = load i32*, i32** %11, align 8
  %74 = getelementptr inbounds i32, i32* %73, i32 1
  store i32* %74, i32** %11, align 8
  store i32 %72, i32* %73, align 4
  %75 = load i32, i32* %19, align 4
  %76 = load i16*, i16** %20, align 8
  %77 = sext i32 %75 to i64
  %78 = getelementptr inbounds i16, i16* %76, i64 %77
  store i16* %78, i16** %20, align 8
  br label %37

; <label>:79:                                     ; preds = %37
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBAAcontig16bittile, i64 0, i64 1)
  %80 = add i64 %pgocount1, 1
  store i64 %80, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBAAcontig16bittile, i64 0, i64 1)
  %81 = load i32, i32* %17, align 4
  %82 = load i32*, i32** %11, align 8
  %83 = sext i32 %81 to i64
  %84 = getelementptr inbounds i32, i32* %82, i64 %83
  store i32* %84, i32** %11, align 8
  %85 = load i32, i32* %16, align 4
  %86 = load i16*, i16** %20, align 8
  %87 = sext i32 %85 to i64
  %88 = getelementptr inbounds i16, i16* %86, i64 %87
  store i16* %88, i16** %20, align 8
  br label %31

; <label>:89:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBAAcontig16bittile, i64 0, i64 2)
  %90 = add i64 %pgocount2, 1
  store i64 %90, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBAAcontig16bittile, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putRGBUAcontig16bittile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i32, align 4
  %20 = alloca i16*, align 8
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %25 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %26 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %25, i32 0, i32 7
  %27 = load i16, i16* %26, align 2
  %28 = zext i16 %27 to i32
  store i32 %28, i32* %19, align 4
  %29 = load i8*, i8** %18, align 8
  %30 = bitcast i8* %29 to i16*
  store i16* %30, i16** %20, align 8
  %31 = load i32, i32* %13, align 4
  %32 = load i32, i32* %19, align 4
  %33 = load i32, i32* %16, align 4
  %34 = mul nsw i32 %33, %32
  store i32 %34, i32* %16, align 4
  br label %35

; <label>:35:                                     ; preds = %89, %9
  %36 = load i32, i32* %15, align 4
  %37 = add i32 %36, -1
  store i32 %37, i32* %15, align 4
  %38 = icmp ugt i32 %36, 0
  br i1 %38, label %39, label %99

; <label>:39:                                     ; preds = %35
  %40 = load i32, i32* %14, align 4
  store i32 %40, i32* %12, align 4
  br label %41

; <label>:41:                                     ; preds = %45, %39
  %42 = load i32, i32* %12, align 4
  %43 = add i32 %42, -1
  store i32 %43, i32* %12, align 4
  %44 = icmp ugt i32 %42, 0
  br i1 %44, label %45, label %89

; <label>:45:                                     ; preds = %41
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAcontig16bittile, i64 0, i64 0)
  %46 = add i64 %pgocount, 1
  store i64 %46, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAcontig16bittile, i64 0, i64 0)
  %47 = load i16*, i16** %20, align 8
  %48 = getelementptr inbounds i16, i16* %47, i64 3
  %49 = load i16, i16* %48, align 2
  %50 = zext i16 %49 to i32
  %51 = ashr i32 %50, 4
  store i32 %51, i32* %24, align 4
  %52 = load i16*, i16** %20, align 8
  %53 = getelementptr inbounds i16, i16* %52, i64 0
  %54 = load i16, i16* %53, align 2
  %55 = zext i16 %54 to i32
  %56 = load i32, i32* %24, align 4
  %57 = mul i32 %55, %56
  %58 = udiv i32 %57, 69375
  store i32 %58, i32* %21, align 4
  %59 = load i16*, i16** %20, align 8
  %60 = getelementptr inbounds i16, i16* %59, i64 1
  %61 = load i16, i16* %60, align 2
  %62 = zext i16 %61 to i32
  %63 = load i32, i32* %24, align 4
  %64 = mul i32 %62, %63
  %65 = udiv i32 %64, 69375
  store i32 %65, i32* %22, align 4
  %66 = load i16*, i16** %20, align 8
  %67 = getelementptr inbounds i16, i16* %66, i64 2
  %68 = load i16, i16* %67, align 2
  %69 = zext i16 %68 to i32
  %70 = load i32, i32* %24, align 4
  %71 = mul i32 %69, %70
  %72 = udiv i32 %71, 69375
  store i32 %72, i32* %23, align 4
  %73 = load i32, i32* %21, align 4
  %74 = load i32, i32* %22, align 4
  %75 = shl i32 %74, 8
  %76 = or i32 %73, %75
  %77 = load i32, i32* %23, align 4
  %78 = shl i32 %77, 16
  %79 = or i32 %76, %78
  %80 = load i32, i32* %24, align 4
  %81 = shl i32 %80, 24
  %82 = or i32 %79, %81
  %83 = load i32*, i32** %11, align 8
  %84 = getelementptr inbounds i32, i32* %83, i32 1
  store i32* %84, i32** %11, align 8
  store i32 %82, i32* %83, align 4
  %85 = load i32, i32* %19, align 4
  %86 = load i16*, i16** %20, align 8
  %87 = sext i32 %85 to i64
  %88 = getelementptr inbounds i16, i16* %86, i64 %87
  store i16* %88, i16** %20, align 8
  br label %41

; <label>:89:                                     ; preds = %41
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAcontig16bittile, i64 0, i64 1)
  %90 = add i64 %pgocount1, 1
  store i64 %90, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAcontig16bittile, i64 0, i64 1)
  %91 = load i32, i32* %17, align 4
  %92 = load i32*, i32** %11, align 8
  %93 = sext i32 %91 to i64
  %94 = getelementptr inbounds i32, i32* %92, i64 %93
  store i32* %94, i32** %11, align 8
  %95 = load i32, i32* %16, align 4
  %96 = load i16*, i16** %20, align 8
  %97 = sext i32 %95 to i64
  %98 = getelementptr inbounds i16, i16* %96, i64 %97
  store i16* %98, i16** %20, align 8
  br label %35

; <label>:99:                                     ; preds = %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAcontig16bittile, i64 0, i64 2)
  %100 = add i64 %pgocount2, 1
  store i64 %100, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAcontig16bittile, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putRGBcontig8bitCMYKtile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i32, align 4
  %20 = alloca i16, align 2
  %21 = alloca i16, align 2
  %22 = alloca i16, align 2
  %23 = alloca i16, align 2
  %24 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %25 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %26 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %25, i32 0, i32 7
  %27 = load i16, i16* %26, align 2
  %28 = zext i16 %27 to i32
  store i32 %28, i32* %19, align 4
  %29 = load i32, i32* %12, align 4
  %30 = load i32, i32* %13, align 4
  %31 = load i32, i32* %19, align 4
  %32 = load i32, i32* %16, align 4
  %33 = mul nsw i32 %32, %31
  store i32 %33, i32* %16, align 4
  br label %34

; <label>:34:                                     ; preds = %864, %9
  %35 = load i32, i32* %15, align 4
  %36 = add i32 %35, -1
  store i32 %36, i32* %15, align 4
  %37 = icmp ugt i32 %35, 0
  br i1 %37, label %38, label %874

; <label>:38:                                     ; preds = %34
  %39 = load i32, i32* %14, align 4
  store i32 %39, i32* %24, align 4
  br label %40

; <label>:40:                                     ; preds = %468, %38
  %41 = load i32, i32* %24, align 4
  %42 = icmp uge i32 %41, 8
  br i1 %42, label %43, label %472

; <label>:43:                                     ; preds = %40
  %44 = load i8*, i8** %18, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 3
  %46 = load i8, i8* %45, align 1
  %47 = zext i8 %46 to i32
  %48 = sub nsw i32 255, %47
  %49 = trunc i32 %48 to i16
  store i16 %49, i16* %23, align 2
  %50 = load i16, i16* %23, align 2
  %51 = zext i16 %50 to i32
  %52 = load i8*, i8** %18, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 0
  %54 = load i8, i8* %53, align 1
  %55 = zext i8 %54 to i32
  %56 = sub nsw i32 255, %55
  %57 = mul nsw i32 %51, %56
  %58 = sdiv i32 %57, 255
  %59 = trunc i32 %58 to i16
  store i16 %59, i16* %20, align 2
  %60 = load i16, i16* %23, align 2
  %61 = zext i16 %60 to i32
  %62 = load i8*, i8** %18, align 8
  %63 = getelementptr inbounds i8, i8* %62, i64 1
  %64 = load i8, i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = sub nsw i32 255, %65
  %67 = mul nsw i32 %61, %66
  %68 = sdiv i32 %67, 255
  %69 = trunc i32 %68 to i16
  store i16 %69, i16* %21, align 2
  %70 = load i16, i16* %23, align 2
  %71 = zext i16 %70 to i32
  %72 = load i8*, i8** %18, align 8
  %73 = getelementptr inbounds i8, i8* %72, i64 2
  %74 = load i8, i8* %73, align 1
  %75 = zext i8 %74 to i32
  %76 = sub nsw i32 255, %75
  %77 = mul nsw i32 %71, %76
  %78 = sdiv i32 %77, 255
  %79 = trunc i32 %78 to i16
  store i16 %79, i16* %22, align 2
  %80 = load i16, i16* %20, align 2
  %81 = zext i16 %80 to i32
  %82 = load i16, i16* %21, align 2
  %83 = zext i16 %82 to i32
  %84 = shl i32 %83, 8
  %85 = or i32 %81, %84
  %86 = load i16, i16* %22, align 2
  %87 = zext i16 %86 to i32
  %88 = shl i32 %87, 16
  %89 = or i32 %85, %88
  %90 = or i32 %89, -16777216
  %91 = load i32*, i32** %11, align 8
  %92 = getelementptr inbounds i32, i32* %91, i32 1
  store i32* %92, i32** %11, align 8
  store i32 %90, i32* %91, align 4
  %93 = load i32, i32* %19, align 4
  %94 = load i8*, i8** %18, align 8
  %95 = sext i32 %93 to i64
  %96 = getelementptr inbounds i8, i8* %94, i64 %95
  store i8* %96, i8** %18, align 8
  %97 = load i8*, i8** %18, align 8
  %98 = getelementptr inbounds i8, i8* %97, i64 3
  %99 = load i8, i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = sub nsw i32 255, %100
  %102 = trunc i32 %101 to i16
  store i16 %102, i16* %23, align 2
  %103 = load i16, i16* %23, align 2
  %104 = zext i16 %103 to i32
  %105 = load i8*, i8** %18, align 8
  %106 = getelementptr inbounds i8, i8* %105, i64 0
  %107 = load i8, i8* %106, align 1
  %108 = zext i8 %107 to i32
  %109 = sub nsw i32 255, %108
  %110 = mul nsw i32 %104, %109
  %111 = sdiv i32 %110, 255
  %112 = trunc i32 %111 to i16
  store i16 %112, i16* %20, align 2
  %113 = load i16, i16* %23, align 2
  %114 = zext i16 %113 to i32
  %115 = load i8*, i8** %18, align 8
  %116 = getelementptr inbounds i8, i8* %115, i64 1
  %117 = load i8, i8* %116, align 1
  %118 = zext i8 %117 to i32
  %119 = sub nsw i32 255, %118
  %120 = mul nsw i32 %114, %119
  %121 = sdiv i32 %120, 255
  %122 = trunc i32 %121 to i16
  store i16 %122, i16* %21, align 2
  %123 = load i16, i16* %23, align 2
  %124 = zext i16 %123 to i32
  %125 = load i8*, i8** %18, align 8
  %126 = getelementptr inbounds i8, i8* %125, i64 2
  %127 = load i8, i8* %126, align 1
  %128 = zext i8 %127 to i32
  %129 = sub nsw i32 255, %128
  %130 = mul nsw i32 %124, %129
  %131 = sdiv i32 %130, 255
  %132 = trunc i32 %131 to i16
  store i16 %132, i16* %22, align 2
  %133 = load i16, i16* %20, align 2
  %134 = zext i16 %133 to i32
  %135 = load i16, i16* %21, align 2
  %136 = zext i16 %135 to i32
  %137 = shl i32 %136, 8
  %138 = or i32 %134, %137
  %139 = load i16, i16* %22, align 2
  %140 = zext i16 %139 to i32
  %141 = shl i32 %140, 16
  %142 = or i32 %138, %141
  %143 = or i32 %142, -16777216
  %144 = load i32*, i32** %11, align 8
  %145 = getelementptr inbounds i32, i32* %144, i32 1
  store i32* %145, i32** %11, align 8
  store i32 %143, i32* %144, align 4
  %146 = load i32, i32* %19, align 4
  %147 = load i8*, i8** %18, align 8
  %148 = sext i32 %146 to i64
  %149 = getelementptr inbounds i8, i8* %147, i64 %148
  store i8* %149, i8** %18, align 8
  %150 = load i8*, i8** %18, align 8
  %151 = getelementptr inbounds i8, i8* %150, i64 3
  %152 = load i8, i8* %151, align 1
  %153 = zext i8 %152 to i32
  %154 = sub nsw i32 255, %153
  %155 = trunc i32 %154 to i16
  store i16 %155, i16* %23, align 2
  %156 = load i16, i16* %23, align 2
  %157 = zext i16 %156 to i32
  %158 = load i8*, i8** %18, align 8
  %159 = getelementptr inbounds i8, i8* %158, i64 0
  %160 = load i8, i8* %159, align 1
  %161 = zext i8 %160 to i32
  %162 = sub nsw i32 255, %161
  %163 = mul nsw i32 %157, %162
  %164 = sdiv i32 %163, 255
  %165 = trunc i32 %164 to i16
  store i16 %165, i16* %20, align 2
  %166 = load i16, i16* %23, align 2
  %167 = zext i16 %166 to i32
  %168 = load i8*, i8** %18, align 8
  %169 = getelementptr inbounds i8, i8* %168, i64 1
  %170 = load i8, i8* %169, align 1
  %171 = zext i8 %170 to i32
  %172 = sub nsw i32 255, %171
  %173 = mul nsw i32 %167, %172
  %174 = sdiv i32 %173, 255
  %175 = trunc i32 %174 to i16
  store i16 %175, i16* %21, align 2
  %176 = load i16, i16* %23, align 2
  %177 = zext i16 %176 to i32
  %178 = load i8*, i8** %18, align 8
  %179 = getelementptr inbounds i8, i8* %178, i64 2
  %180 = load i8, i8* %179, align 1
  %181 = zext i8 %180 to i32
  %182 = sub nsw i32 255, %181
  %183 = mul nsw i32 %177, %182
  %184 = sdiv i32 %183, 255
  %185 = trunc i32 %184 to i16
  store i16 %185, i16* %22, align 2
  %186 = load i16, i16* %20, align 2
  %187 = zext i16 %186 to i32
  %188 = load i16, i16* %21, align 2
  %189 = zext i16 %188 to i32
  %190 = shl i32 %189, 8
  %191 = or i32 %187, %190
  %192 = load i16, i16* %22, align 2
  %193 = zext i16 %192 to i32
  %194 = shl i32 %193, 16
  %195 = or i32 %191, %194
  %196 = or i32 %195, -16777216
  %197 = load i32*, i32** %11, align 8
  %198 = getelementptr inbounds i32, i32* %197, i32 1
  store i32* %198, i32** %11, align 8
  store i32 %196, i32* %197, align 4
  %199 = load i32, i32* %19, align 4
  %200 = load i8*, i8** %18, align 8
  %201 = sext i32 %199 to i64
  %202 = getelementptr inbounds i8, i8* %200, i64 %201
  store i8* %202, i8** %18, align 8
  %203 = load i8*, i8** %18, align 8
  %204 = getelementptr inbounds i8, i8* %203, i64 3
  %205 = load i8, i8* %204, align 1
  %206 = zext i8 %205 to i32
  %207 = sub nsw i32 255, %206
  %208 = trunc i32 %207 to i16
  store i16 %208, i16* %23, align 2
  %209 = load i16, i16* %23, align 2
  %210 = zext i16 %209 to i32
  %211 = load i8*, i8** %18, align 8
  %212 = getelementptr inbounds i8, i8* %211, i64 0
  %213 = load i8, i8* %212, align 1
  %214 = zext i8 %213 to i32
  %215 = sub nsw i32 255, %214
  %216 = mul nsw i32 %210, %215
  %217 = sdiv i32 %216, 255
  %218 = trunc i32 %217 to i16
  store i16 %218, i16* %20, align 2
  %219 = load i16, i16* %23, align 2
  %220 = zext i16 %219 to i32
  %221 = load i8*, i8** %18, align 8
  %222 = getelementptr inbounds i8, i8* %221, i64 1
  %223 = load i8, i8* %222, align 1
  %224 = zext i8 %223 to i32
  %225 = sub nsw i32 255, %224
  %226 = mul nsw i32 %220, %225
  %227 = sdiv i32 %226, 255
  %228 = trunc i32 %227 to i16
  store i16 %228, i16* %21, align 2
  %229 = load i16, i16* %23, align 2
  %230 = zext i16 %229 to i32
  %231 = load i8*, i8** %18, align 8
  %232 = getelementptr inbounds i8, i8* %231, i64 2
  %233 = load i8, i8* %232, align 1
  %234 = zext i8 %233 to i32
  %235 = sub nsw i32 255, %234
  %236 = mul nsw i32 %230, %235
  %237 = sdiv i32 %236, 255
  %238 = trunc i32 %237 to i16
  store i16 %238, i16* %22, align 2
  %239 = load i16, i16* %20, align 2
  %240 = zext i16 %239 to i32
  %241 = load i16, i16* %21, align 2
  %242 = zext i16 %241 to i32
  %243 = shl i32 %242, 8
  %244 = or i32 %240, %243
  %245 = load i16, i16* %22, align 2
  %246 = zext i16 %245 to i32
  %247 = shl i32 %246, 16
  %248 = or i32 %244, %247
  %249 = or i32 %248, -16777216
  %250 = load i32*, i32** %11, align 8
  %251 = getelementptr inbounds i32, i32* %250, i32 1
  store i32* %251, i32** %11, align 8
  store i32 %249, i32* %250, align 4
  %252 = load i32, i32* %19, align 4
  %253 = load i8*, i8** %18, align 8
  %254 = sext i32 %252 to i64
  %255 = getelementptr inbounds i8, i8* %253, i64 %254
  store i8* %255, i8** %18, align 8
  %256 = load i8*, i8** %18, align 8
  %257 = getelementptr inbounds i8, i8* %256, i64 3
  %258 = load i8, i8* %257, align 1
  %259 = zext i8 %258 to i32
  %260 = sub nsw i32 255, %259
  %261 = trunc i32 %260 to i16
  store i16 %261, i16* %23, align 2
  %262 = load i16, i16* %23, align 2
  %263 = zext i16 %262 to i32
  %264 = load i8*, i8** %18, align 8
  %265 = getelementptr inbounds i8, i8* %264, i64 0
  %266 = load i8, i8* %265, align 1
  %267 = zext i8 %266 to i32
  %268 = sub nsw i32 255, %267
  %269 = mul nsw i32 %263, %268
  %270 = sdiv i32 %269, 255
  %271 = trunc i32 %270 to i16
  store i16 %271, i16* %20, align 2
  %272 = load i16, i16* %23, align 2
  %273 = zext i16 %272 to i32
  %274 = load i8*, i8** %18, align 8
  %275 = getelementptr inbounds i8, i8* %274, i64 1
  %276 = load i8, i8* %275, align 1
  %277 = zext i8 %276 to i32
  %278 = sub nsw i32 255, %277
  %279 = mul nsw i32 %273, %278
  %280 = sdiv i32 %279, 255
  %281 = trunc i32 %280 to i16
  store i16 %281, i16* %21, align 2
  %282 = load i16, i16* %23, align 2
  %283 = zext i16 %282 to i32
  %284 = load i8*, i8** %18, align 8
  %285 = getelementptr inbounds i8, i8* %284, i64 2
  %286 = load i8, i8* %285, align 1
  %287 = zext i8 %286 to i32
  %288 = sub nsw i32 255, %287
  %289 = mul nsw i32 %283, %288
  %290 = sdiv i32 %289, 255
  %291 = trunc i32 %290 to i16
  store i16 %291, i16* %22, align 2
  %292 = load i16, i16* %20, align 2
  %293 = zext i16 %292 to i32
  %294 = load i16, i16* %21, align 2
  %295 = zext i16 %294 to i32
  %296 = shl i32 %295, 8
  %297 = or i32 %293, %296
  %298 = load i16, i16* %22, align 2
  %299 = zext i16 %298 to i32
  %300 = shl i32 %299, 16
  %301 = or i32 %297, %300
  %302 = or i32 %301, -16777216
  %303 = load i32*, i32** %11, align 8
  %304 = getelementptr inbounds i32, i32* %303, i32 1
  store i32* %304, i32** %11, align 8
  store i32 %302, i32* %303, align 4
  %305 = load i32, i32* %19, align 4
  %306 = load i8*, i8** %18, align 8
  %307 = sext i32 %305 to i64
  %308 = getelementptr inbounds i8, i8* %306, i64 %307
  store i8* %308, i8** %18, align 8
  %309 = load i8*, i8** %18, align 8
  %310 = getelementptr inbounds i8, i8* %309, i64 3
  %311 = load i8, i8* %310, align 1
  %312 = zext i8 %311 to i32
  %313 = sub nsw i32 255, %312
  %314 = trunc i32 %313 to i16
  store i16 %314, i16* %23, align 2
  %315 = load i16, i16* %23, align 2
  %316 = zext i16 %315 to i32
  %317 = load i8*, i8** %18, align 8
  %318 = getelementptr inbounds i8, i8* %317, i64 0
  %319 = load i8, i8* %318, align 1
  %320 = zext i8 %319 to i32
  %321 = sub nsw i32 255, %320
  %322 = mul nsw i32 %316, %321
  %323 = sdiv i32 %322, 255
  %324 = trunc i32 %323 to i16
  store i16 %324, i16* %20, align 2
  %325 = load i16, i16* %23, align 2
  %326 = zext i16 %325 to i32
  %327 = load i8*, i8** %18, align 8
  %328 = getelementptr inbounds i8, i8* %327, i64 1
  %329 = load i8, i8* %328, align 1
  %330 = zext i8 %329 to i32
  %331 = sub nsw i32 255, %330
  %332 = mul nsw i32 %326, %331
  %333 = sdiv i32 %332, 255
  %334 = trunc i32 %333 to i16
  store i16 %334, i16* %21, align 2
  %335 = load i16, i16* %23, align 2
  %336 = zext i16 %335 to i32
  %337 = load i8*, i8** %18, align 8
  %338 = getelementptr inbounds i8, i8* %337, i64 2
  %339 = load i8, i8* %338, align 1
  %340 = zext i8 %339 to i32
  %341 = sub nsw i32 255, %340
  %342 = mul nsw i32 %336, %341
  %343 = sdiv i32 %342, 255
  %344 = trunc i32 %343 to i16
  store i16 %344, i16* %22, align 2
  %345 = load i16, i16* %20, align 2
  %346 = zext i16 %345 to i32
  %347 = load i16, i16* %21, align 2
  %348 = zext i16 %347 to i32
  %349 = shl i32 %348, 8
  %350 = or i32 %346, %349
  %351 = load i16, i16* %22, align 2
  %352 = zext i16 %351 to i32
  %353 = shl i32 %352, 16
  %354 = or i32 %350, %353
  %355 = or i32 %354, -16777216
  %356 = load i32*, i32** %11, align 8
  %357 = getelementptr inbounds i32, i32* %356, i32 1
  store i32* %357, i32** %11, align 8
  store i32 %355, i32* %356, align 4
  %358 = load i32, i32* %19, align 4
  %359 = load i8*, i8** %18, align 8
  %360 = sext i32 %358 to i64
  %361 = getelementptr inbounds i8, i8* %359, i64 %360
  store i8* %361, i8** %18, align 8
  %362 = load i8*, i8** %18, align 8
  %363 = getelementptr inbounds i8, i8* %362, i64 3
  %364 = load i8, i8* %363, align 1
  %365 = zext i8 %364 to i32
  %366 = sub nsw i32 255, %365
  %367 = trunc i32 %366 to i16
  store i16 %367, i16* %23, align 2
  %368 = load i16, i16* %23, align 2
  %369 = zext i16 %368 to i32
  %370 = load i8*, i8** %18, align 8
  %371 = getelementptr inbounds i8, i8* %370, i64 0
  %372 = load i8, i8* %371, align 1
  %373 = zext i8 %372 to i32
  %374 = sub nsw i32 255, %373
  %375 = mul nsw i32 %369, %374
  %376 = sdiv i32 %375, 255
  %377 = trunc i32 %376 to i16
  store i16 %377, i16* %20, align 2
  %378 = load i16, i16* %23, align 2
  %379 = zext i16 %378 to i32
  %380 = load i8*, i8** %18, align 8
  %381 = getelementptr inbounds i8, i8* %380, i64 1
  %382 = load i8, i8* %381, align 1
  %383 = zext i8 %382 to i32
  %384 = sub nsw i32 255, %383
  %385 = mul nsw i32 %379, %384
  %386 = sdiv i32 %385, 255
  %387 = trunc i32 %386 to i16
  store i16 %387, i16* %21, align 2
  %388 = load i16, i16* %23, align 2
  %389 = zext i16 %388 to i32
  %390 = load i8*, i8** %18, align 8
  %391 = getelementptr inbounds i8, i8* %390, i64 2
  %392 = load i8, i8* %391, align 1
  %393 = zext i8 %392 to i32
  %394 = sub nsw i32 255, %393
  %395 = mul nsw i32 %389, %394
  %396 = sdiv i32 %395, 255
  %397 = trunc i32 %396 to i16
  store i16 %397, i16* %22, align 2
  %398 = load i16, i16* %20, align 2
  %399 = zext i16 %398 to i32
  %400 = load i16, i16* %21, align 2
  %401 = zext i16 %400 to i32
  %402 = shl i32 %401, 8
  %403 = or i32 %399, %402
  %404 = load i16, i16* %22, align 2
  %405 = zext i16 %404 to i32
  %406 = shl i32 %405, 16
  %407 = or i32 %403, %406
  %408 = or i32 %407, -16777216
  %409 = load i32*, i32** %11, align 8
  %410 = getelementptr inbounds i32, i32* %409, i32 1
  store i32* %410, i32** %11, align 8
  store i32 %408, i32* %409, align 4
  %411 = load i32, i32* %19, align 4
  %412 = load i8*, i8** %18, align 8
  %413 = sext i32 %411 to i64
  %414 = getelementptr inbounds i8, i8* %412, i64 %413
  store i8* %414, i8** %18, align 8
  %415 = load i8*, i8** %18, align 8
  %416 = getelementptr inbounds i8, i8* %415, i64 3
  %417 = load i8, i8* %416, align 1
  %418 = zext i8 %417 to i32
  %419 = sub nsw i32 255, %418
  %420 = trunc i32 %419 to i16
  store i16 %420, i16* %23, align 2
  %421 = load i16, i16* %23, align 2
  %422 = zext i16 %421 to i32
  %423 = load i8*, i8** %18, align 8
  %424 = getelementptr inbounds i8, i8* %423, i64 0
  %425 = load i8, i8* %424, align 1
  %426 = zext i8 %425 to i32
  %427 = sub nsw i32 255, %426
  %428 = mul nsw i32 %422, %427
  %429 = sdiv i32 %428, 255
  %430 = trunc i32 %429 to i16
  store i16 %430, i16* %20, align 2
  %431 = load i16, i16* %23, align 2
  %432 = zext i16 %431 to i32
  %433 = load i8*, i8** %18, align 8
  %434 = getelementptr inbounds i8, i8* %433, i64 1
  %435 = load i8, i8* %434, align 1
  %436 = zext i8 %435 to i32
  %437 = sub nsw i32 255, %436
  %438 = mul nsw i32 %432, %437
  %439 = sdiv i32 %438, 255
  %440 = trunc i32 %439 to i16
  store i16 %440, i16* %21, align 2
  %441 = load i16, i16* %23, align 2
  %442 = zext i16 %441 to i32
  %443 = load i8*, i8** %18, align 8
  %444 = getelementptr inbounds i8, i8* %443, i64 2
  %445 = load i8, i8* %444, align 1
  %446 = zext i8 %445 to i32
  %447 = sub nsw i32 255, %446
  %448 = mul nsw i32 %442, %447
  %449 = sdiv i32 %448, 255
  %450 = trunc i32 %449 to i16
  store i16 %450, i16* %22, align 2
  %451 = load i16, i16* %20, align 2
  %452 = zext i16 %451 to i32
  %453 = load i16, i16* %21, align 2
  %454 = zext i16 %453 to i32
  %455 = shl i32 %454, 8
  %456 = or i32 %452, %455
  %457 = load i16, i16* %22, align 2
  %458 = zext i16 %457 to i32
  %459 = shl i32 %458, 16
  %460 = or i32 %456, %459
  %461 = or i32 %460, -16777216
  %462 = load i32*, i32** %11, align 8
  %463 = getelementptr inbounds i32, i32* %462, i32 1
  store i32* %463, i32** %11, align 8
  store i32 %461, i32* %462, align 4
  %464 = load i32, i32* %19, align 4
  %465 = load i8*, i8** %18, align 8
  %466 = sext i32 %464 to i64
  %467 = getelementptr inbounds i8, i8* %465, i64 %466
  store i8* %467, i8** %18, align 8
  br label %468

; <label>:468:                                    ; preds = %43
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 0)
  %469 = add i64 %pgocount, 1
  store i64 %469, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 0)
  %470 = load i32, i32* %24, align 4
  %471 = sub i32 %470, 8
  store i32 %471, i32* %24, align 4
  br label %40

; <label>:472:                                    ; preds = %40
  %473 = load i32, i32* %24, align 4
  %474 = icmp ugt i32 %473, 0
  br i1 %474, label %475, label %864

; <label>:475:                                    ; preds = %472
  %476 = load i32, i32* %24, align 4
  switch i32 %476, label %862 [
    i32 7, label %477
    i32 6, label %532
    i32 5, label %587
    i32 4, label %642
    i32 3, label %697
    i32 2, label %752
    i32 1, label %807
  ]

; <label>:477:                                    ; preds = %475
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 9)
  %478 = add i64 %pgocount1, 1
  store i64 %478, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 9)
  %479 = load i8*, i8** %18, align 8
  %480 = getelementptr inbounds i8, i8* %479, i64 3
  %481 = load i8, i8* %480, align 1
  %482 = zext i8 %481 to i32
  %483 = sub nsw i32 255, %482
  %484 = trunc i32 %483 to i16
  store i16 %484, i16* %23, align 2
  %485 = load i16, i16* %23, align 2
  %486 = zext i16 %485 to i32
  %487 = load i8*, i8** %18, align 8
  %488 = getelementptr inbounds i8, i8* %487, i64 0
  %489 = load i8, i8* %488, align 1
  %490 = zext i8 %489 to i32
  %491 = sub nsw i32 255, %490
  %492 = mul nsw i32 %486, %491
  %493 = sdiv i32 %492, 255
  %494 = trunc i32 %493 to i16
  store i16 %494, i16* %20, align 2
  %495 = load i16, i16* %23, align 2
  %496 = zext i16 %495 to i32
  %497 = load i8*, i8** %18, align 8
  %498 = getelementptr inbounds i8, i8* %497, i64 1
  %499 = load i8, i8* %498, align 1
  %500 = zext i8 %499 to i32
  %501 = sub nsw i32 255, %500
  %502 = mul nsw i32 %496, %501
  %503 = sdiv i32 %502, 255
  %504 = trunc i32 %503 to i16
  store i16 %504, i16* %21, align 2
  %505 = load i16, i16* %23, align 2
  %506 = zext i16 %505 to i32
  %507 = load i8*, i8** %18, align 8
  %508 = getelementptr inbounds i8, i8* %507, i64 2
  %509 = load i8, i8* %508, align 1
  %510 = zext i8 %509 to i32
  %511 = sub nsw i32 255, %510
  %512 = mul nsw i32 %506, %511
  %513 = sdiv i32 %512, 255
  %514 = trunc i32 %513 to i16
  store i16 %514, i16* %22, align 2
  %515 = load i16, i16* %20, align 2
  %516 = zext i16 %515 to i32
  %517 = load i16, i16* %21, align 2
  %518 = zext i16 %517 to i32
  %519 = shl i32 %518, 8
  %520 = or i32 %516, %519
  %521 = load i16, i16* %22, align 2
  %522 = zext i16 %521 to i32
  %523 = shl i32 %522, 16
  %524 = or i32 %520, %523
  %525 = or i32 %524, -16777216
  %526 = load i32*, i32** %11, align 8
  %527 = getelementptr inbounds i32, i32* %526, i32 1
  store i32* %527, i32** %11, align 8
  store i32 %525, i32* %526, align 4
  %528 = load i32, i32* %19, align 4
  %529 = load i8*, i8** %18, align 8
  %530 = sext i32 %528 to i64
  %531 = getelementptr inbounds i8, i8* %529, i64 %530
  store i8* %531, i8** %18, align 8
  br label %532

; <label>:532:                                    ; preds = %477, %475
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 8)
  %533 = add i64 %pgocount2, 1
  store i64 %533, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 8)
  %534 = load i8*, i8** %18, align 8
  %535 = getelementptr inbounds i8, i8* %534, i64 3
  %536 = load i8, i8* %535, align 1
  %537 = zext i8 %536 to i32
  %538 = sub nsw i32 255, %537
  %539 = trunc i32 %538 to i16
  store i16 %539, i16* %23, align 2
  %540 = load i16, i16* %23, align 2
  %541 = zext i16 %540 to i32
  %542 = load i8*, i8** %18, align 8
  %543 = getelementptr inbounds i8, i8* %542, i64 0
  %544 = load i8, i8* %543, align 1
  %545 = zext i8 %544 to i32
  %546 = sub nsw i32 255, %545
  %547 = mul nsw i32 %541, %546
  %548 = sdiv i32 %547, 255
  %549 = trunc i32 %548 to i16
  store i16 %549, i16* %20, align 2
  %550 = load i16, i16* %23, align 2
  %551 = zext i16 %550 to i32
  %552 = load i8*, i8** %18, align 8
  %553 = getelementptr inbounds i8, i8* %552, i64 1
  %554 = load i8, i8* %553, align 1
  %555 = zext i8 %554 to i32
  %556 = sub nsw i32 255, %555
  %557 = mul nsw i32 %551, %556
  %558 = sdiv i32 %557, 255
  %559 = trunc i32 %558 to i16
  store i16 %559, i16* %21, align 2
  %560 = load i16, i16* %23, align 2
  %561 = zext i16 %560 to i32
  %562 = load i8*, i8** %18, align 8
  %563 = getelementptr inbounds i8, i8* %562, i64 2
  %564 = load i8, i8* %563, align 1
  %565 = zext i8 %564 to i32
  %566 = sub nsw i32 255, %565
  %567 = mul nsw i32 %561, %566
  %568 = sdiv i32 %567, 255
  %569 = trunc i32 %568 to i16
  store i16 %569, i16* %22, align 2
  %570 = load i16, i16* %20, align 2
  %571 = zext i16 %570 to i32
  %572 = load i16, i16* %21, align 2
  %573 = zext i16 %572 to i32
  %574 = shl i32 %573, 8
  %575 = or i32 %571, %574
  %576 = load i16, i16* %22, align 2
  %577 = zext i16 %576 to i32
  %578 = shl i32 %577, 16
  %579 = or i32 %575, %578
  %580 = or i32 %579, -16777216
  %581 = load i32*, i32** %11, align 8
  %582 = getelementptr inbounds i32, i32* %581, i32 1
  store i32* %582, i32** %11, align 8
  store i32 %580, i32* %581, align 4
  %583 = load i32, i32* %19, align 4
  %584 = load i8*, i8** %18, align 8
  %585 = sext i32 %583 to i64
  %586 = getelementptr inbounds i8, i8* %584, i64 %585
  store i8* %586, i8** %18, align 8
  br label %587

; <label>:587:                                    ; preds = %532, %475
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 7)
  %588 = add i64 %pgocount3, 1
  store i64 %588, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 7)
  %589 = load i8*, i8** %18, align 8
  %590 = getelementptr inbounds i8, i8* %589, i64 3
  %591 = load i8, i8* %590, align 1
  %592 = zext i8 %591 to i32
  %593 = sub nsw i32 255, %592
  %594 = trunc i32 %593 to i16
  store i16 %594, i16* %23, align 2
  %595 = load i16, i16* %23, align 2
  %596 = zext i16 %595 to i32
  %597 = load i8*, i8** %18, align 8
  %598 = getelementptr inbounds i8, i8* %597, i64 0
  %599 = load i8, i8* %598, align 1
  %600 = zext i8 %599 to i32
  %601 = sub nsw i32 255, %600
  %602 = mul nsw i32 %596, %601
  %603 = sdiv i32 %602, 255
  %604 = trunc i32 %603 to i16
  store i16 %604, i16* %20, align 2
  %605 = load i16, i16* %23, align 2
  %606 = zext i16 %605 to i32
  %607 = load i8*, i8** %18, align 8
  %608 = getelementptr inbounds i8, i8* %607, i64 1
  %609 = load i8, i8* %608, align 1
  %610 = zext i8 %609 to i32
  %611 = sub nsw i32 255, %610
  %612 = mul nsw i32 %606, %611
  %613 = sdiv i32 %612, 255
  %614 = trunc i32 %613 to i16
  store i16 %614, i16* %21, align 2
  %615 = load i16, i16* %23, align 2
  %616 = zext i16 %615 to i32
  %617 = load i8*, i8** %18, align 8
  %618 = getelementptr inbounds i8, i8* %617, i64 2
  %619 = load i8, i8* %618, align 1
  %620 = zext i8 %619 to i32
  %621 = sub nsw i32 255, %620
  %622 = mul nsw i32 %616, %621
  %623 = sdiv i32 %622, 255
  %624 = trunc i32 %623 to i16
  store i16 %624, i16* %22, align 2
  %625 = load i16, i16* %20, align 2
  %626 = zext i16 %625 to i32
  %627 = load i16, i16* %21, align 2
  %628 = zext i16 %627 to i32
  %629 = shl i32 %628, 8
  %630 = or i32 %626, %629
  %631 = load i16, i16* %22, align 2
  %632 = zext i16 %631 to i32
  %633 = shl i32 %632, 16
  %634 = or i32 %630, %633
  %635 = or i32 %634, -16777216
  %636 = load i32*, i32** %11, align 8
  %637 = getelementptr inbounds i32, i32* %636, i32 1
  store i32* %637, i32** %11, align 8
  store i32 %635, i32* %636, align 4
  %638 = load i32, i32* %19, align 4
  %639 = load i8*, i8** %18, align 8
  %640 = sext i32 %638 to i64
  %641 = getelementptr inbounds i8, i8* %639, i64 %640
  store i8* %641, i8** %18, align 8
  br label %642

; <label>:642:                                    ; preds = %587, %475
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 6)
  %643 = add i64 %pgocount4, 1
  store i64 %643, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 6)
  %644 = load i8*, i8** %18, align 8
  %645 = getelementptr inbounds i8, i8* %644, i64 3
  %646 = load i8, i8* %645, align 1
  %647 = zext i8 %646 to i32
  %648 = sub nsw i32 255, %647
  %649 = trunc i32 %648 to i16
  store i16 %649, i16* %23, align 2
  %650 = load i16, i16* %23, align 2
  %651 = zext i16 %650 to i32
  %652 = load i8*, i8** %18, align 8
  %653 = getelementptr inbounds i8, i8* %652, i64 0
  %654 = load i8, i8* %653, align 1
  %655 = zext i8 %654 to i32
  %656 = sub nsw i32 255, %655
  %657 = mul nsw i32 %651, %656
  %658 = sdiv i32 %657, 255
  %659 = trunc i32 %658 to i16
  store i16 %659, i16* %20, align 2
  %660 = load i16, i16* %23, align 2
  %661 = zext i16 %660 to i32
  %662 = load i8*, i8** %18, align 8
  %663 = getelementptr inbounds i8, i8* %662, i64 1
  %664 = load i8, i8* %663, align 1
  %665 = zext i8 %664 to i32
  %666 = sub nsw i32 255, %665
  %667 = mul nsw i32 %661, %666
  %668 = sdiv i32 %667, 255
  %669 = trunc i32 %668 to i16
  store i16 %669, i16* %21, align 2
  %670 = load i16, i16* %23, align 2
  %671 = zext i16 %670 to i32
  %672 = load i8*, i8** %18, align 8
  %673 = getelementptr inbounds i8, i8* %672, i64 2
  %674 = load i8, i8* %673, align 1
  %675 = zext i8 %674 to i32
  %676 = sub nsw i32 255, %675
  %677 = mul nsw i32 %671, %676
  %678 = sdiv i32 %677, 255
  %679 = trunc i32 %678 to i16
  store i16 %679, i16* %22, align 2
  %680 = load i16, i16* %20, align 2
  %681 = zext i16 %680 to i32
  %682 = load i16, i16* %21, align 2
  %683 = zext i16 %682 to i32
  %684 = shl i32 %683, 8
  %685 = or i32 %681, %684
  %686 = load i16, i16* %22, align 2
  %687 = zext i16 %686 to i32
  %688 = shl i32 %687, 16
  %689 = or i32 %685, %688
  %690 = or i32 %689, -16777216
  %691 = load i32*, i32** %11, align 8
  %692 = getelementptr inbounds i32, i32* %691, i32 1
  store i32* %692, i32** %11, align 8
  store i32 %690, i32* %691, align 4
  %693 = load i32, i32* %19, align 4
  %694 = load i8*, i8** %18, align 8
  %695 = sext i32 %693 to i64
  %696 = getelementptr inbounds i8, i8* %694, i64 %695
  store i8* %696, i8** %18, align 8
  br label %697

; <label>:697:                                    ; preds = %642, %475
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 5)
  %698 = add i64 %pgocount5, 1
  store i64 %698, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 5)
  %699 = load i8*, i8** %18, align 8
  %700 = getelementptr inbounds i8, i8* %699, i64 3
  %701 = load i8, i8* %700, align 1
  %702 = zext i8 %701 to i32
  %703 = sub nsw i32 255, %702
  %704 = trunc i32 %703 to i16
  store i16 %704, i16* %23, align 2
  %705 = load i16, i16* %23, align 2
  %706 = zext i16 %705 to i32
  %707 = load i8*, i8** %18, align 8
  %708 = getelementptr inbounds i8, i8* %707, i64 0
  %709 = load i8, i8* %708, align 1
  %710 = zext i8 %709 to i32
  %711 = sub nsw i32 255, %710
  %712 = mul nsw i32 %706, %711
  %713 = sdiv i32 %712, 255
  %714 = trunc i32 %713 to i16
  store i16 %714, i16* %20, align 2
  %715 = load i16, i16* %23, align 2
  %716 = zext i16 %715 to i32
  %717 = load i8*, i8** %18, align 8
  %718 = getelementptr inbounds i8, i8* %717, i64 1
  %719 = load i8, i8* %718, align 1
  %720 = zext i8 %719 to i32
  %721 = sub nsw i32 255, %720
  %722 = mul nsw i32 %716, %721
  %723 = sdiv i32 %722, 255
  %724 = trunc i32 %723 to i16
  store i16 %724, i16* %21, align 2
  %725 = load i16, i16* %23, align 2
  %726 = zext i16 %725 to i32
  %727 = load i8*, i8** %18, align 8
  %728 = getelementptr inbounds i8, i8* %727, i64 2
  %729 = load i8, i8* %728, align 1
  %730 = zext i8 %729 to i32
  %731 = sub nsw i32 255, %730
  %732 = mul nsw i32 %726, %731
  %733 = sdiv i32 %732, 255
  %734 = trunc i32 %733 to i16
  store i16 %734, i16* %22, align 2
  %735 = load i16, i16* %20, align 2
  %736 = zext i16 %735 to i32
  %737 = load i16, i16* %21, align 2
  %738 = zext i16 %737 to i32
  %739 = shl i32 %738, 8
  %740 = or i32 %736, %739
  %741 = load i16, i16* %22, align 2
  %742 = zext i16 %741 to i32
  %743 = shl i32 %742, 16
  %744 = or i32 %740, %743
  %745 = or i32 %744, -16777216
  %746 = load i32*, i32** %11, align 8
  %747 = getelementptr inbounds i32, i32* %746, i32 1
  store i32* %747, i32** %11, align 8
  store i32 %745, i32* %746, align 4
  %748 = load i32, i32* %19, align 4
  %749 = load i8*, i8** %18, align 8
  %750 = sext i32 %748 to i64
  %751 = getelementptr inbounds i8, i8* %749, i64 %750
  store i8* %751, i8** %18, align 8
  br label %752

; <label>:752:                                    ; preds = %697, %475
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 4)
  %753 = add i64 %pgocount6, 1
  store i64 %753, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 4)
  %754 = load i8*, i8** %18, align 8
  %755 = getelementptr inbounds i8, i8* %754, i64 3
  %756 = load i8, i8* %755, align 1
  %757 = zext i8 %756 to i32
  %758 = sub nsw i32 255, %757
  %759 = trunc i32 %758 to i16
  store i16 %759, i16* %23, align 2
  %760 = load i16, i16* %23, align 2
  %761 = zext i16 %760 to i32
  %762 = load i8*, i8** %18, align 8
  %763 = getelementptr inbounds i8, i8* %762, i64 0
  %764 = load i8, i8* %763, align 1
  %765 = zext i8 %764 to i32
  %766 = sub nsw i32 255, %765
  %767 = mul nsw i32 %761, %766
  %768 = sdiv i32 %767, 255
  %769 = trunc i32 %768 to i16
  store i16 %769, i16* %20, align 2
  %770 = load i16, i16* %23, align 2
  %771 = zext i16 %770 to i32
  %772 = load i8*, i8** %18, align 8
  %773 = getelementptr inbounds i8, i8* %772, i64 1
  %774 = load i8, i8* %773, align 1
  %775 = zext i8 %774 to i32
  %776 = sub nsw i32 255, %775
  %777 = mul nsw i32 %771, %776
  %778 = sdiv i32 %777, 255
  %779 = trunc i32 %778 to i16
  store i16 %779, i16* %21, align 2
  %780 = load i16, i16* %23, align 2
  %781 = zext i16 %780 to i32
  %782 = load i8*, i8** %18, align 8
  %783 = getelementptr inbounds i8, i8* %782, i64 2
  %784 = load i8, i8* %783, align 1
  %785 = zext i8 %784 to i32
  %786 = sub nsw i32 255, %785
  %787 = mul nsw i32 %781, %786
  %788 = sdiv i32 %787, 255
  %789 = trunc i32 %788 to i16
  store i16 %789, i16* %22, align 2
  %790 = load i16, i16* %20, align 2
  %791 = zext i16 %790 to i32
  %792 = load i16, i16* %21, align 2
  %793 = zext i16 %792 to i32
  %794 = shl i32 %793, 8
  %795 = or i32 %791, %794
  %796 = load i16, i16* %22, align 2
  %797 = zext i16 %796 to i32
  %798 = shl i32 %797, 16
  %799 = or i32 %795, %798
  %800 = or i32 %799, -16777216
  %801 = load i32*, i32** %11, align 8
  %802 = getelementptr inbounds i32, i32* %801, i32 1
  store i32* %802, i32** %11, align 8
  store i32 %800, i32* %801, align 4
  %803 = load i32, i32* %19, align 4
  %804 = load i8*, i8** %18, align 8
  %805 = sext i32 %803 to i64
  %806 = getelementptr inbounds i8, i8* %804, i64 %805
  store i8* %806, i8** %18, align 8
  br label %807

; <label>:807:                                    ; preds = %752, %475
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 3)
  %808 = add i64 %pgocount7, 1
  store i64 %808, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 3)
  %809 = load i8*, i8** %18, align 8
  %810 = getelementptr inbounds i8, i8* %809, i64 3
  %811 = load i8, i8* %810, align 1
  %812 = zext i8 %811 to i32
  %813 = sub nsw i32 255, %812
  %814 = trunc i32 %813 to i16
  store i16 %814, i16* %23, align 2
  %815 = load i16, i16* %23, align 2
  %816 = zext i16 %815 to i32
  %817 = load i8*, i8** %18, align 8
  %818 = getelementptr inbounds i8, i8* %817, i64 0
  %819 = load i8, i8* %818, align 1
  %820 = zext i8 %819 to i32
  %821 = sub nsw i32 255, %820
  %822 = mul nsw i32 %816, %821
  %823 = sdiv i32 %822, 255
  %824 = trunc i32 %823 to i16
  store i16 %824, i16* %20, align 2
  %825 = load i16, i16* %23, align 2
  %826 = zext i16 %825 to i32
  %827 = load i8*, i8** %18, align 8
  %828 = getelementptr inbounds i8, i8* %827, i64 1
  %829 = load i8, i8* %828, align 1
  %830 = zext i8 %829 to i32
  %831 = sub nsw i32 255, %830
  %832 = mul nsw i32 %826, %831
  %833 = sdiv i32 %832, 255
  %834 = trunc i32 %833 to i16
  store i16 %834, i16* %21, align 2
  %835 = load i16, i16* %23, align 2
  %836 = zext i16 %835 to i32
  %837 = load i8*, i8** %18, align 8
  %838 = getelementptr inbounds i8, i8* %837, i64 2
  %839 = load i8, i8* %838, align 1
  %840 = zext i8 %839 to i32
  %841 = sub nsw i32 255, %840
  %842 = mul nsw i32 %836, %841
  %843 = sdiv i32 %842, 255
  %844 = trunc i32 %843 to i16
  store i16 %844, i16* %22, align 2
  %845 = load i16, i16* %20, align 2
  %846 = zext i16 %845 to i32
  %847 = load i16, i16* %21, align 2
  %848 = zext i16 %847 to i32
  %849 = shl i32 %848, 8
  %850 = or i32 %846, %849
  %851 = load i16, i16* %22, align 2
  %852 = zext i16 %851 to i32
  %853 = shl i32 %852, 16
  %854 = or i32 %850, %853
  %855 = or i32 %854, -16777216
  %856 = load i32*, i32** %11, align 8
  %857 = getelementptr inbounds i32, i32* %856, i32 1
  store i32* %857, i32** %11, align 8
  store i32 %855, i32* %856, align 4
  %858 = load i32, i32* %19, align 4
  %859 = load i8*, i8** %18, align 8
  %860 = sext i32 %858 to i64
  %861 = getelementptr inbounds i8, i8* %859, i64 %860
  store i8* %861, i8** %18, align 8
  br label %862

; <label>:862:                                    ; preds = %807, %475
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 2)
  %863 = add i64 %pgocount8, 1
  store i64 %863, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 2)
  br label %864

; <label>:864:                                    ; preds = %862, %472
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 1)
  %865 = add i64 %pgocount9, 1
  store i64 %865, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 1)
  %866 = load i32, i32* %17, align 4
  %867 = load i32*, i32** %11, align 8
  %868 = sext i32 %866 to i64
  %869 = getelementptr inbounds i32, i32* %867, i64 %868
  store i32* %869, i32** %11, align 8
  %870 = load i32, i32* %16, align 4
  %871 = load i8*, i8** %18, align 8
  %872 = sext i32 %870 to i64
  %873 = getelementptr inbounds i8, i8* %871, i64 %872
  store i8* %873, i8** %18, align 8
  br label %34

; <label>:874:                                    ; preds = %34
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 10)
  %875 = add i64 %pgocount10, 1
  store i64 %875, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKtile, i64 0, i64 10)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putRGBcontig8bitCMYKMaptile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i32, align 4
  %20 = alloca i8*, align 8
  %21 = alloca i16, align 2
  %22 = alloca i16, align 2
  %23 = alloca i16, align 2
  %24 = alloca i16, align 2
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %25 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %26 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %25, i32 0, i32 7
  %27 = load i16, i16* %26, align 2
  %28 = zext i16 %27 to i32
  store i32 %28, i32* %19, align 4
  %29 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %30 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %29, i32 0, i32 15
  %31 = load i8*, i8** %30, align 8
  store i8* %31, i8** %20, align 8
  %32 = load i32, i32* %13, align 4
  %33 = load i32, i32* %19, align 4
  %34 = load i32, i32* %16, align 4
  %35 = mul nsw i32 %34, %33
  store i32 %35, i32* %16, align 4
  br label %36

; <label>:36:                                     ; preds = %113, %9
  %37 = load i32, i32* %15, align 4
  %38 = add i32 %37, -1
  store i32 %38, i32* %15, align 4
  %39 = icmp ugt i32 %37, 0
  br i1 %39, label %40, label %123

; <label>:40:                                     ; preds = %36
  %41 = load i32, i32* %14, align 4
  store i32 %41, i32* %12, align 4
  br label %42

; <label>:42:                                     ; preds = %46, %40
  %43 = load i32, i32* %12, align 4
  %44 = add i32 %43, -1
  store i32 %44, i32* %12, align 4
  %45 = icmp ugt i32 %43, 0
  br i1 %45, label %46, label %113

; <label>:46:                                     ; preds = %42
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKMaptile, i64 0, i64 0)
  %47 = add i64 %pgocount, 1
  store i64 %47, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKMaptile, i64 0, i64 0)
  %48 = load i8*, i8** %18, align 8
  %49 = getelementptr inbounds i8, i8* %48, i64 3
  %50 = load i8, i8* %49, align 1
  %51 = zext i8 %50 to i32
  %52 = sub nsw i32 255, %51
  %53 = trunc i32 %52 to i16
  store i16 %53, i16* %24, align 2
  %54 = load i16, i16* %24, align 2
  %55 = zext i16 %54 to i32
  %56 = load i8*, i8** %18, align 8
  %57 = getelementptr inbounds i8, i8* %56, i64 0
  %58 = load i8, i8* %57, align 1
  %59 = zext i8 %58 to i32
  %60 = sub nsw i32 255, %59
  %61 = mul nsw i32 %55, %60
  %62 = sdiv i32 %61, 255
  %63 = trunc i32 %62 to i16
  store i16 %63, i16* %21, align 2
  %64 = load i16, i16* %24, align 2
  %65 = zext i16 %64 to i32
  %66 = load i8*, i8** %18, align 8
  %67 = getelementptr inbounds i8, i8* %66, i64 1
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i32
  %70 = sub nsw i32 255, %69
  %71 = mul nsw i32 %65, %70
  %72 = sdiv i32 %71, 255
  %73 = trunc i32 %72 to i16
  store i16 %73, i16* %22, align 2
  %74 = load i16, i16* %24, align 2
  %75 = zext i16 %74 to i32
  %76 = load i8*, i8** %18, align 8
  %77 = getelementptr inbounds i8, i8* %76, i64 2
  %78 = load i8, i8* %77, align 1
  %79 = zext i8 %78 to i32
  %80 = sub nsw i32 255, %79
  %81 = mul nsw i32 %75, %80
  %82 = sdiv i32 %81, 255
  %83 = trunc i32 %82 to i16
  store i16 %83, i16* %23, align 2
  %84 = load i8*, i8** %20, align 8
  %85 = load i16, i16* %21, align 2
  %86 = zext i16 %85 to i64
  %87 = getelementptr inbounds i8, i8* %84, i64 %86
  %88 = load i8, i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = load i8*, i8** %20, align 8
  %91 = load i16, i16* %22, align 2
  %92 = zext i16 %91 to i64
  %93 = getelementptr inbounds i8, i8* %90, i64 %92
  %94 = load i8, i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = shl i32 %95, 8
  %97 = or i32 %89, %96
  %98 = load i8*, i8** %20, align 8
  %99 = load i16, i16* %23, align 2
  %100 = zext i16 %99 to i64
  %101 = getelementptr inbounds i8, i8* %98, i64 %100
  %102 = load i8, i8* %101, align 1
  %103 = zext i8 %102 to i32
  %104 = shl i32 %103, 16
  %105 = or i32 %97, %104
  %106 = or i32 %105, -16777216
  %107 = load i32*, i32** %11, align 8
  %108 = getelementptr inbounds i32, i32* %107, i32 1
  store i32* %108, i32** %11, align 8
  store i32 %106, i32* %107, align 4
  %109 = load i32, i32* %19, align 4
  %110 = load i8*, i8** %18, align 8
  %111 = sext i32 %109 to i64
  %112 = getelementptr inbounds i8, i8* %110, i64 %111
  store i8* %112, i8** %18, align 8
  br label %42

; <label>:113:                                    ; preds = %42
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKMaptile, i64 0, i64 1)
  %114 = add i64 %pgocount1, 1
  store i64 %114, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKMaptile, i64 0, i64 1)
  %115 = load i32, i32* %16, align 4
  %116 = load i8*, i8** %18, align 8
  %117 = sext i32 %115 to i64
  %118 = getelementptr inbounds i8, i8* %116, i64 %117
  store i8* %118, i8** %18, align 8
  %119 = load i32, i32* %17, align 4
  %120 = load i32*, i32** %11, align 8
  %121 = sext i32 %119 to i64
  %122 = getelementptr inbounds i32, i32* %120, i64 %121
  store i32* %122, i32** %11, align 8
  br label %36

; <label>:123:                                    ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKMaptile, i64 0, i64 2)
  %124 = add i64 %pgocount2, 1
  store i64 %124, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBcontig8bitCMYKMaptile, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put8bitcmaptile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i32**, align 8
  %20 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %21 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %22 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %21, i32 0, i32 17
  %23 = load i32**, i32*** %22, align 8
  store i32** %23, i32*** %19, align 8
  %24 = load i32, i32* %12, align 4
  %25 = load i32, i32* %13, align 4
  br label %26

; <label>:26:                                     ; preds = %226, %9
  %27 = load i32, i32* %15, align 4
  %28 = add i32 %27, -1
  store i32 %28, i32* %15, align 4
  %29 = icmp ugt i32 %27, 0
  br i1 %29, label %30, label %236

; <label>:30:                                     ; preds = %26
  %31 = load i32, i32* %14, align 4
  store i32 %31, i32* %20, align 4
  br label %32

; <label>:32:                                     ; preds = %124, %30
  %33 = load i32, i32* %20, align 4
  %34 = icmp uge i32 %33, 8
  br i1 %34, label %35, label %128

; <label>:35:                                     ; preds = %32
  %36 = load i32**, i32*** %19, align 8
  %37 = load i8*, i8** %18, align 8
  %38 = getelementptr inbounds i8, i8* %37, i32 1
  store i8* %38, i8** %18, align 8
  %39 = load i8, i8* %37, align 1
  %40 = zext i8 %39 to i64
  %41 = getelementptr inbounds i32*, i32** %36, i64 %40
  %42 = load i32*, i32** %41, align 8
  %43 = getelementptr inbounds i32, i32* %42, i64 0
  %44 = load i32, i32* %43, align 4
  %45 = load i32*, i32** %11, align 8
  %46 = getelementptr inbounds i32, i32* %45, i32 1
  store i32* %46, i32** %11, align 8
  store i32 %44, i32* %45, align 4
  %47 = load i32**, i32*** %19, align 8
  %48 = load i8*, i8** %18, align 8
  %49 = getelementptr inbounds i8, i8* %48, i32 1
  store i8* %49, i8** %18, align 8
  %50 = load i8, i8* %48, align 1
  %51 = zext i8 %50 to i64
  %52 = getelementptr inbounds i32*, i32** %47, i64 %51
  %53 = load i32*, i32** %52, align 8
  %54 = getelementptr inbounds i32, i32* %53, i64 0
  %55 = load i32, i32* %54, align 4
  %56 = load i32*, i32** %11, align 8
  %57 = getelementptr inbounds i32, i32* %56, i32 1
  store i32* %57, i32** %11, align 8
  store i32 %55, i32* %56, align 4
  %58 = load i32**, i32*** %19, align 8
  %59 = load i8*, i8** %18, align 8
  %60 = getelementptr inbounds i8, i8* %59, i32 1
  store i8* %60, i8** %18, align 8
  %61 = load i8, i8* %59, align 1
  %62 = zext i8 %61 to i64
  %63 = getelementptr inbounds i32*, i32** %58, i64 %62
  %64 = load i32*, i32** %63, align 8
  %65 = getelementptr inbounds i32, i32* %64, i64 0
  %66 = load i32, i32* %65, align 4
  %67 = load i32*, i32** %11, align 8
  %68 = getelementptr inbounds i32, i32* %67, i32 1
  store i32* %68, i32** %11, align 8
  store i32 %66, i32* %67, align 4
  %69 = load i32**, i32*** %19, align 8
  %70 = load i8*, i8** %18, align 8
  %71 = getelementptr inbounds i8, i8* %70, i32 1
  store i8* %71, i8** %18, align 8
  %72 = load i8, i8* %70, align 1
  %73 = zext i8 %72 to i64
  %74 = getelementptr inbounds i32*, i32** %69, i64 %73
  %75 = load i32*, i32** %74, align 8
  %76 = getelementptr inbounds i32, i32* %75, i64 0
  %77 = load i32, i32* %76, align 4
  %78 = load i32*, i32** %11, align 8
  %79 = getelementptr inbounds i32, i32* %78, i32 1
  store i32* %79, i32** %11, align 8
  store i32 %77, i32* %78, align 4
  %80 = load i32**, i32*** %19, align 8
  %81 = load i8*, i8** %18, align 8
  %82 = getelementptr inbounds i8, i8* %81, i32 1
  store i8* %82, i8** %18, align 8
  %83 = load i8, i8* %81, align 1
  %84 = zext i8 %83 to i64
  %85 = getelementptr inbounds i32*, i32** %80, i64 %84
  %86 = load i32*, i32** %85, align 8
  %87 = getelementptr inbounds i32, i32* %86, i64 0
  %88 = load i32, i32* %87, align 4
  %89 = load i32*, i32** %11, align 8
  %90 = getelementptr inbounds i32, i32* %89, i32 1
  store i32* %90, i32** %11, align 8
  store i32 %88, i32* %89, align 4
  %91 = load i32**, i32*** %19, align 8
  %92 = load i8*, i8** %18, align 8
  %93 = getelementptr inbounds i8, i8* %92, i32 1
  store i8* %93, i8** %18, align 8
  %94 = load i8, i8* %92, align 1
  %95 = zext i8 %94 to i64
  %96 = getelementptr inbounds i32*, i32** %91, i64 %95
  %97 = load i32*, i32** %96, align 8
  %98 = getelementptr inbounds i32, i32* %97, i64 0
  %99 = load i32, i32* %98, align 4
  %100 = load i32*, i32** %11, align 8
  %101 = getelementptr inbounds i32, i32* %100, i32 1
  store i32* %101, i32** %11, align 8
  store i32 %99, i32* %100, align 4
  %102 = load i32**, i32*** %19, align 8
  %103 = load i8*, i8** %18, align 8
  %104 = getelementptr inbounds i8, i8* %103, i32 1
  store i8* %104, i8** %18, align 8
  %105 = load i8, i8* %103, align 1
  %106 = zext i8 %105 to i64
  %107 = getelementptr inbounds i32*, i32** %102, i64 %106
  %108 = load i32*, i32** %107, align 8
  %109 = getelementptr inbounds i32, i32* %108, i64 0
  %110 = load i32, i32* %109, align 4
  %111 = load i32*, i32** %11, align 8
  %112 = getelementptr inbounds i32, i32* %111, i32 1
  store i32* %112, i32** %11, align 8
  store i32 %110, i32* %111, align 4
  %113 = load i32**, i32*** %19, align 8
  %114 = load i8*, i8** %18, align 8
  %115 = getelementptr inbounds i8, i8* %114, i32 1
  store i8* %115, i8** %18, align 8
  %116 = load i8, i8* %114, align 1
  %117 = zext i8 %116 to i64
  %118 = getelementptr inbounds i32*, i32** %113, i64 %117
  %119 = load i32*, i32** %118, align 8
  %120 = getelementptr inbounds i32, i32* %119, i64 0
  %121 = load i32, i32* %120, align 4
  %122 = load i32*, i32** %11, align 8
  %123 = getelementptr inbounds i32, i32* %122, i32 1
  store i32* %123, i32** %11, align 8
  store i32 %121, i32* %122, align 4
  br label %124

; <label>:124:                                    ; preds = %35
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 0)
  %125 = add i64 %pgocount, 1
  store i64 %125, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 0)
  %126 = load i32, i32* %20, align 4
  %127 = sub i32 %126, 8
  store i32 %127, i32* %20, align 4
  br label %32

; <label>:128:                                    ; preds = %32
  %129 = load i32, i32* %20, align 4
  %130 = icmp ugt i32 %129, 0
  br i1 %130, label %131, label %226

; <label>:131:                                    ; preds = %128
  %132 = load i32, i32* %20, align 4
  switch i32 %132, label %224 [
    i32 7, label %133
    i32 6, label %146
    i32 5, label %159
    i32 4, label %172
    i32 3, label %185
    i32 2, label %198
    i32 1, label %211
  ]

; <label>:133:                                    ; preds = %131
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 9)
  %134 = add i64 %pgocount1, 1
  store i64 %134, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 9)
  %135 = load i32**, i32*** %19, align 8
  %136 = load i8*, i8** %18, align 8
  %137 = getelementptr inbounds i8, i8* %136, i32 1
  store i8* %137, i8** %18, align 8
  %138 = load i8, i8* %136, align 1
  %139 = zext i8 %138 to i64
  %140 = getelementptr inbounds i32*, i32** %135, i64 %139
  %141 = load i32*, i32** %140, align 8
  %142 = getelementptr inbounds i32, i32* %141, i64 0
  %143 = load i32, i32* %142, align 4
  %144 = load i32*, i32** %11, align 8
  %145 = getelementptr inbounds i32, i32* %144, i32 1
  store i32* %145, i32** %11, align 8
  store i32 %143, i32* %144, align 4
  br label %146

; <label>:146:                                    ; preds = %133, %131
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 8)
  %147 = add i64 %pgocount2, 1
  store i64 %147, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 8)
  %148 = load i32**, i32*** %19, align 8
  %149 = load i8*, i8** %18, align 8
  %150 = getelementptr inbounds i8, i8* %149, i32 1
  store i8* %150, i8** %18, align 8
  %151 = load i8, i8* %149, align 1
  %152 = zext i8 %151 to i64
  %153 = getelementptr inbounds i32*, i32** %148, i64 %152
  %154 = load i32*, i32** %153, align 8
  %155 = getelementptr inbounds i32, i32* %154, i64 0
  %156 = load i32, i32* %155, align 4
  %157 = load i32*, i32** %11, align 8
  %158 = getelementptr inbounds i32, i32* %157, i32 1
  store i32* %158, i32** %11, align 8
  store i32 %156, i32* %157, align 4
  br label %159

; <label>:159:                                    ; preds = %146, %131
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 7)
  %160 = add i64 %pgocount3, 1
  store i64 %160, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 7)
  %161 = load i32**, i32*** %19, align 8
  %162 = load i8*, i8** %18, align 8
  %163 = getelementptr inbounds i8, i8* %162, i32 1
  store i8* %163, i8** %18, align 8
  %164 = load i8, i8* %162, align 1
  %165 = zext i8 %164 to i64
  %166 = getelementptr inbounds i32*, i32** %161, i64 %165
  %167 = load i32*, i32** %166, align 8
  %168 = getelementptr inbounds i32, i32* %167, i64 0
  %169 = load i32, i32* %168, align 4
  %170 = load i32*, i32** %11, align 8
  %171 = getelementptr inbounds i32, i32* %170, i32 1
  store i32* %171, i32** %11, align 8
  store i32 %169, i32* %170, align 4
  br label %172

; <label>:172:                                    ; preds = %159, %131
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 6)
  %173 = add i64 %pgocount4, 1
  store i64 %173, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 6)
  %174 = load i32**, i32*** %19, align 8
  %175 = load i8*, i8** %18, align 8
  %176 = getelementptr inbounds i8, i8* %175, i32 1
  store i8* %176, i8** %18, align 8
  %177 = load i8, i8* %175, align 1
  %178 = zext i8 %177 to i64
  %179 = getelementptr inbounds i32*, i32** %174, i64 %178
  %180 = load i32*, i32** %179, align 8
  %181 = getelementptr inbounds i32, i32* %180, i64 0
  %182 = load i32, i32* %181, align 4
  %183 = load i32*, i32** %11, align 8
  %184 = getelementptr inbounds i32, i32* %183, i32 1
  store i32* %184, i32** %11, align 8
  store i32 %182, i32* %183, align 4
  br label %185

; <label>:185:                                    ; preds = %172, %131
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 5)
  %186 = add i64 %pgocount5, 1
  store i64 %186, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 5)
  %187 = load i32**, i32*** %19, align 8
  %188 = load i8*, i8** %18, align 8
  %189 = getelementptr inbounds i8, i8* %188, i32 1
  store i8* %189, i8** %18, align 8
  %190 = load i8, i8* %188, align 1
  %191 = zext i8 %190 to i64
  %192 = getelementptr inbounds i32*, i32** %187, i64 %191
  %193 = load i32*, i32** %192, align 8
  %194 = getelementptr inbounds i32, i32* %193, i64 0
  %195 = load i32, i32* %194, align 4
  %196 = load i32*, i32** %11, align 8
  %197 = getelementptr inbounds i32, i32* %196, i32 1
  store i32* %197, i32** %11, align 8
  store i32 %195, i32* %196, align 4
  br label %198

; <label>:198:                                    ; preds = %185, %131
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 4)
  %199 = add i64 %pgocount6, 1
  store i64 %199, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 4)
  %200 = load i32**, i32*** %19, align 8
  %201 = load i8*, i8** %18, align 8
  %202 = getelementptr inbounds i8, i8* %201, i32 1
  store i8* %202, i8** %18, align 8
  %203 = load i8, i8* %201, align 1
  %204 = zext i8 %203 to i64
  %205 = getelementptr inbounds i32*, i32** %200, i64 %204
  %206 = load i32*, i32** %205, align 8
  %207 = getelementptr inbounds i32, i32* %206, i64 0
  %208 = load i32, i32* %207, align 4
  %209 = load i32*, i32** %11, align 8
  %210 = getelementptr inbounds i32, i32* %209, i32 1
  store i32* %210, i32** %11, align 8
  store i32 %208, i32* %209, align 4
  br label %211

; <label>:211:                                    ; preds = %198, %131
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 3)
  %212 = add i64 %pgocount7, 1
  store i64 %212, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 3)
  %213 = load i32**, i32*** %19, align 8
  %214 = load i8*, i8** %18, align 8
  %215 = getelementptr inbounds i8, i8* %214, i32 1
  store i8* %215, i8** %18, align 8
  %216 = load i8, i8* %214, align 1
  %217 = zext i8 %216 to i64
  %218 = getelementptr inbounds i32*, i32** %213, i64 %217
  %219 = load i32*, i32** %218, align 8
  %220 = getelementptr inbounds i32, i32* %219, i64 0
  %221 = load i32, i32* %220, align 4
  %222 = load i32*, i32** %11, align 8
  %223 = getelementptr inbounds i32, i32* %222, i32 1
  store i32* %223, i32** %11, align 8
  store i32 %221, i32* %222, align 4
  br label %224

; <label>:224:                                    ; preds = %211, %131
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 2)
  %225 = add i64 %pgocount8, 1
  store i64 %225, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 2)
  br label %226

; <label>:226:                                    ; preds = %224, %128
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 1)
  %227 = add i64 %pgocount9, 1
  store i64 %227, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 1)
  %228 = load i32, i32* %17, align 4
  %229 = load i32*, i32** %11, align 8
  %230 = sext i32 %228 to i64
  %231 = getelementptr inbounds i32, i32* %229, i64 %230
  store i32* %231, i32** %11, align 8
  %232 = load i32, i32* %16, align 4
  %233 = load i8*, i8** %18, align 8
  %234 = sext i32 %232 to i64
  %235 = getelementptr inbounds i8, i8* %233, i64 %234
  store i8* %235, i8** %18, align 8
  br label %26

; <label>:236:                                    ; preds = %26
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 10)
  %237 = add i64 %pgocount10, 1
  store i64 %237, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put8bitcmaptile, i64 0, i64 10)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put4bitcmaptile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i32**, align 8
  %20 = alloca i32*, align 8
  %21 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %22 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %23 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %22, i32 0, i32 17
  %24 = load i32**, i32*** %23, align 8
  store i32** %24, i32*** %19, align 8
  %25 = load i32, i32* %12, align 4
  %26 = load i32, i32* %13, align 4
  %27 = load i32, i32* %16, align 4
  %28 = sdiv i32 %27, 2
  store i32 %28, i32* %16, align 4
  br label %29

; <label>:29:                                     ; preds = %77, %9
  %30 = load i32, i32* %15, align 4
  %31 = add i32 %30, -1
  store i32 %31, i32* %15, align 4
  %32 = icmp ugt i32 %30, 0
  br i1 %32, label %33, label %87

; <label>:33:                                     ; preds = %29
  %34 = load i32, i32* %14, align 4
  store i32 %34, i32* %21, align 4
  br label %35

; <label>:35:                                     ; preds = %56, %33
  %36 = load i32, i32* %21, align 4
  %37 = icmp uge i32 %36, 2
  br i1 %37, label %38, label %60

; <label>:38:                                     ; preds = %35
  %39 = load i32**, i32*** %19, align 8
  %40 = load i8*, i8** %18, align 8
  %41 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %41, i8** %18, align 8
  %42 = load i8, i8* %40, align 1
  %43 = zext i8 %42 to i64
  %44 = getelementptr inbounds i32*, i32** %39, i64 %43
  %45 = load i32*, i32** %44, align 8
  store i32* %45, i32** %20, align 8
  %46 = load i32*, i32** %20, align 8
  %47 = getelementptr inbounds i32, i32* %46, i32 1
  store i32* %47, i32** %20, align 8
  %48 = load i32, i32* %46, align 4
  %49 = load i32*, i32** %11, align 8
  %50 = getelementptr inbounds i32, i32* %49, i32 1
  store i32* %50, i32** %11, align 8
  store i32 %48, i32* %49, align 4
  %51 = load i32*, i32** %20, align 8
  %52 = getelementptr inbounds i32, i32* %51, i32 1
  store i32* %52, i32** %20, align 8
  %53 = load i32, i32* %51, align 4
  %54 = load i32*, i32** %11, align 8
  %55 = getelementptr inbounds i32, i32* %54, i32 1
  store i32* %55, i32** %11, align 8
  store i32 %53, i32* %54, align 4
  br label %56

; <label>:56:                                     ; preds = %38
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_put4bitcmaptile, i64 0, i64 0)
  %57 = add i64 %pgocount, 1
  store i64 %57, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_put4bitcmaptile, i64 0, i64 0)
  %58 = load i32, i32* %21, align 4
  %59 = sub i32 %58, 2
  store i32 %59, i32* %21, align 4
  br label %35

; <label>:60:                                     ; preds = %35
  %61 = load i32, i32* %21, align 4
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %63, label %77

; <label>:63:                                     ; preds = %60
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_put4bitcmaptile, i64 0, i64 2)
  %64 = add i64 %pgocount1, 1
  store i64 %64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_put4bitcmaptile, i64 0, i64 2)
  %65 = load i32**, i32*** %19, align 8
  %66 = load i8*, i8** %18, align 8
  %67 = getelementptr inbounds i8, i8* %66, i32 1
  store i8* %67, i8** %18, align 8
  %68 = load i8, i8* %66, align 1
  %69 = zext i8 %68 to i64
  %70 = getelementptr inbounds i32*, i32** %65, i64 %69
  %71 = load i32*, i32** %70, align 8
  store i32* %71, i32** %20, align 8
  %72 = load i32*, i32** %20, align 8
  %73 = getelementptr inbounds i32, i32* %72, i32 1
  store i32* %73, i32** %20, align 8
  %74 = load i32, i32* %72, align 4
  %75 = load i32*, i32** %11, align 8
  %76 = getelementptr inbounds i32, i32* %75, i32 1
  store i32* %76, i32** %11, align 8
  store i32 %74, i32* %75, align 4
  br label %77

; <label>:77:                                     ; preds = %63, %60
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_put4bitcmaptile, i64 0, i64 1)
  %78 = add i64 %pgocount2, 1
  store i64 %78, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_put4bitcmaptile, i64 0, i64 1)
  %79 = load i32, i32* %17, align 4
  %80 = load i32*, i32** %11, align 8
  %81 = sext i32 %79 to i64
  %82 = getelementptr inbounds i32, i32* %80, i64 %81
  store i32* %82, i32** %11, align 8
  %83 = load i32, i32* %16, align 4
  %84 = load i8*, i8** %18, align 8
  %85 = sext i32 %83 to i64
  %86 = getelementptr inbounds i8, i8* %84, i64 %85
  store i8* %86, i8** %18, align 8
  br label %29

; <label>:87:                                     ; preds = %29
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_put4bitcmaptile, i64 0, i64 3)
  %88 = add i64 %pgocount3, 1
  store i64 %88, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_put4bitcmaptile, i64 0, i64 3)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put2bitcmaptile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i32**, align 8
  %20 = alloca i32*, align 8
  %21 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %22 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %23 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %22, i32 0, i32 17
  %24 = load i32**, i32*** %23, align 8
  store i32** %24, i32*** %19, align 8
  %25 = load i32, i32* %12, align 4
  %26 = load i32, i32* %13, align 4
  %27 = load i32, i32* %16, align 4
  %28 = sdiv i32 %27, 4
  store i32 %28, i32* %16, align 4
  br label %29

; <label>:29:                                     ; preds = %105, %9
  %30 = load i32, i32* %15, align 4
  %31 = add i32 %30, -1
  store i32 %31, i32* %15, align 4
  %32 = icmp ugt i32 %30, 0
  br i1 %32, label %33, label %115

; <label>:33:                                     ; preds = %29
  %34 = load i32, i32* %14, align 4
  store i32 %34, i32* %21, align 4
  br label %35

; <label>:35:                                     ; preds = %66, %33
  %36 = load i32, i32* %21, align 4
  %37 = icmp uge i32 %36, 4
  br i1 %37, label %38, label %70

; <label>:38:                                     ; preds = %35
  %39 = load i32**, i32*** %19, align 8
  %40 = load i8*, i8** %18, align 8
  %41 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %41, i8** %18, align 8
  %42 = load i8, i8* %40, align 1
  %43 = zext i8 %42 to i64
  %44 = getelementptr inbounds i32*, i32** %39, i64 %43
  %45 = load i32*, i32** %44, align 8
  store i32* %45, i32** %20, align 8
  %46 = load i32*, i32** %20, align 8
  %47 = getelementptr inbounds i32, i32* %46, i32 1
  store i32* %47, i32** %20, align 8
  %48 = load i32, i32* %46, align 4
  %49 = load i32*, i32** %11, align 8
  %50 = getelementptr inbounds i32, i32* %49, i32 1
  store i32* %50, i32** %11, align 8
  store i32 %48, i32* %49, align 4
  %51 = load i32*, i32** %20, align 8
  %52 = getelementptr inbounds i32, i32* %51, i32 1
  store i32* %52, i32** %20, align 8
  %53 = load i32, i32* %51, align 4
  %54 = load i32*, i32** %11, align 8
  %55 = getelementptr inbounds i32, i32* %54, i32 1
  store i32* %55, i32** %11, align 8
  store i32 %53, i32* %54, align 4
  %56 = load i32*, i32** %20, align 8
  %57 = getelementptr inbounds i32, i32* %56, i32 1
  store i32* %57, i32** %20, align 8
  %58 = load i32, i32* %56, align 4
  %59 = load i32*, i32** %11, align 8
  %60 = getelementptr inbounds i32, i32* %59, i32 1
  store i32* %60, i32** %11, align 8
  store i32 %58, i32* %59, align 4
  %61 = load i32*, i32** %20, align 8
  %62 = getelementptr inbounds i32, i32* %61, i32 1
  store i32* %62, i32** %20, align 8
  %63 = load i32, i32* %61, align 4
  %64 = load i32*, i32** %11, align 8
  %65 = getelementptr inbounds i32, i32* %64, i32 1
  store i32* %65, i32** %11, align 8
  store i32 %63, i32* %64, align 4
  br label %66

; <label>:66:                                     ; preds = %38
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitcmaptile, i64 0, i64 0)
  %67 = add i64 %pgocount, 1
  store i64 %67, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitcmaptile, i64 0, i64 0)
  %68 = load i32, i32* %21, align 4
  %69 = sub i32 %68, 4
  store i32 %69, i32* %21, align 4
  br label %35

; <label>:70:                                     ; preds = %35
  %71 = load i32, i32* %21, align 4
  %72 = icmp ugt i32 %71, 0
  br i1 %72, label %73, label %105

; <label>:73:                                     ; preds = %70
  %74 = load i32**, i32*** %19, align 8
  %75 = load i8*, i8** %18, align 8
  %76 = getelementptr inbounds i8, i8* %75, i32 1
  store i8* %76, i8** %18, align 8
  %77 = load i8, i8* %75, align 1
  %78 = zext i8 %77 to i64
  %79 = getelementptr inbounds i32*, i32** %74, i64 %78
  %80 = load i32*, i32** %79, align 8
  store i32* %80, i32** %20, align 8
  %81 = load i32, i32* %21, align 4
  switch i32 %81, label %103 [
    i32 3, label %82
    i32 2, label %89
    i32 1, label %96
  ]

; <label>:82:                                     ; preds = %73
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitcmaptile, i64 0, i64 5)
  %83 = add i64 %pgocount1, 1
  store i64 %83, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitcmaptile, i64 0, i64 5)
  %84 = load i32*, i32** %20, align 8
  %85 = getelementptr inbounds i32, i32* %84, i32 1
  store i32* %85, i32** %20, align 8
  %86 = load i32, i32* %84, align 4
  %87 = load i32*, i32** %11, align 8
  %88 = getelementptr inbounds i32, i32* %87, i32 1
  store i32* %88, i32** %11, align 8
  store i32 %86, i32* %87, align 4
  br label %89

; <label>:89:                                     ; preds = %82, %73
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitcmaptile, i64 0, i64 4)
  %90 = add i64 %pgocount2, 1
  store i64 %90, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitcmaptile, i64 0, i64 4)
  %91 = load i32*, i32** %20, align 8
  %92 = getelementptr inbounds i32, i32* %91, i32 1
  store i32* %92, i32** %20, align 8
  %93 = load i32, i32* %91, align 4
  %94 = load i32*, i32** %11, align 8
  %95 = getelementptr inbounds i32, i32* %94, i32 1
  store i32* %95, i32** %11, align 8
  store i32 %93, i32* %94, align 4
  br label %96

; <label>:96:                                     ; preds = %89, %73
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitcmaptile, i64 0, i64 3)
  %97 = add i64 %pgocount3, 1
  store i64 %97, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitcmaptile, i64 0, i64 3)
  %98 = load i32*, i32** %20, align 8
  %99 = getelementptr inbounds i32, i32* %98, i32 1
  store i32* %99, i32** %20, align 8
  %100 = load i32, i32* %98, align 4
  %101 = load i32*, i32** %11, align 8
  %102 = getelementptr inbounds i32, i32* %101, i32 1
  store i32* %102, i32** %11, align 8
  store i32 %100, i32* %101, align 4
  br label %103

; <label>:103:                                    ; preds = %96, %73
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitcmaptile, i64 0, i64 2)
  %104 = add i64 %pgocount4, 1
  store i64 %104, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitcmaptile, i64 0, i64 2)
  br label %105

; <label>:105:                                    ; preds = %103, %70
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitcmaptile, i64 0, i64 1)
  %106 = add i64 %pgocount5, 1
  store i64 %106, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitcmaptile, i64 0, i64 1)
  %107 = load i32, i32* %17, align 4
  %108 = load i32*, i32** %11, align 8
  %109 = sext i32 %107 to i64
  %110 = getelementptr inbounds i32, i32* %108, i64 %109
  store i32* %110, i32** %11, align 8
  %111 = load i32, i32* %16, align 4
  %112 = load i8*, i8** %18, align 8
  %113 = sext i32 %111 to i64
  %114 = getelementptr inbounds i8, i8* %112, i64 %113
  store i8* %114, i8** %18, align 8
  br label %29

; <label>:115:                                    ; preds = %29
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitcmaptile, i64 0, i64 6)
  %116 = add i64 %pgocount6, 1
  store i64 %116, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitcmaptile, i64 0, i64 6)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put1bitcmaptile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i32**, align 8
  %20 = alloca i32*, align 8
  %21 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %22 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %23 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %22, i32 0, i32 17
  %24 = load i32**, i32*** %23, align 8
  store i32** %24, i32*** %19, align 8
  %25 = load i32, i32* %12, align 4
  %26 = load i32, i32* %13, align 4
  %27 = load i32, i32* %16, align 4
  %28 = sdiv i32 %27, 8
  store i32 %28, i32* %16, align 4
  br label %29

; <label>:29:                                     ; preds = %153, %9
  %30 = load i32, i32* %15, align 4
  %31 = add i32 %30, -1
  store i32 %31, i32* %15, align 4
  %32 = icmp ugt i32 %30, 0
  br i1 %32, label %33, label %163

; <label>:33:                                     ; preds = %29
  %34 = load i32, i32* %14, align 4
  store i32 %34, i32* %21, align 4
  br label %35

; <label>:35:                                     ; preds = %86, %33
  %36 = load i32, i32* %21, align 4
  %37 = icmp uge i32 %36, 8
  br i1 %37, label %38, label %90

; <label>:38:                                     ; preds = %35
  %39 = load i32**, i32*** %19, align 8
  %40 = load i8*, i8** %18, align 8
  %41 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %41, i8** %18, align 8
  %42 = load i8, i8* %40, align 1
  %43 = zext i8 %42 to i64
  %44 = getelementptr inbounds i32*, i32** %39, i64 %43
  %45 = load i32*, i32** %44, align 8
  store i32* %45, i32** %20, align 8
  %46 = load i32*, i32** %20, align 8
  %47 = getelementptr inbounds i32, i32* %46, i32 1
  store i32* %47, i32** %20, align 8
  %48 = load i32, i32* %46, align 4
  %49 = load i32*, i32** %11, align 8
  %50 = getelementptr inbounds i32, i32* %49, i32 1
  store i32* %50, i32** %11, align 8
  store i32 %48, i32* %49, align 4
  %51 = load i32*, i32** %20, align 8
  %52 = getelementptr inbounds i32, i32* %51, i32 1
  store i32* %52, i32** %20, align 8
  %53 = load i32, i32* %51, align 4
  %54 = load i32*, i32** %11, align 8
  %55 = getelementptr inbounds i32, i32* %54, i32 1
  store i32* %55, i32** %11, align 8
  store i32 %53, i32* %54, align 4
  %56 = load i32*, i32** %20, align 8
  %57 = getelementptr inbounds i32, i32* %56, i32 1
  store i32* %57, i32** %20, align 8
  %58 = load i32, i32* %56, align 4
  %59 = load i32*, i32** %11, align 8
  %60 = getelementptr inbounds i32, i32* %59, i32 1
  store i32* %60, i32** %11, align 8
  store i32 %58, i32* %59, align 4
  %61 = load i32*, i32** %20, align 8
  %62 = getelementptr inbounds i32, i32* %61, i32 1
  store i32* %62, i32** %20, align 8
  %63 = load i32, i32* %61, align 4
  %64 = load i32*, i32** %11, align 8
  %65 = getelementptr inbounds i32, i32* %64, i32 1
  store i32* %65, i32** %11, align 8
  store i32 %63, i32* %64, align 4
  %66 = load i32*, i32** %20, align 8
  %67 = getelementptr inbounds i32, i32* %66, i32 1
  store i32* %67, i32** %20, align 8
  %68 = load i32, i32* %66, align 4
  %69 = load i32*, i32** %11, align 8
  %70 = getelementptr inbounds i32, i32* %69, i32 1
  store i32* %70, i32** %11, align 8
  store i32 %68, i32* %69, align 4
  %71 = load i32*, i32** %20, align 8
  %72 = getelementptr inbounds i32, i32* %71, i32 1
  store i32* %72, i32** %20, align 8
  %73 = load i32, i32* %71, align 4
  %74 = load i32*, i32** %11, align 8
  %75 = getelementptr inbounds i32, i32* %74, i32 1
  store i32* %75, i32** %11, align 8
  store i32 %73, i32* %74, align 4
  %76 = load i32*, i32** %20, align 8
  %77 = getelementptr inbounds i32, i32* %76, i32 1
  store i32* %77, i32** %20, align 8
  %78 = load i32, i32* %76, align 4
  %79 = load i32*, i32** %11, align 8
  %80 = getelementptr inbounds i32, i32* %79, i32 1
  store i32* %80, i32** %11, align 8
  store i32 %78, i32* %79, align 4
  %81 = load i32*, i32** %20, align 8
  %82 = getelementptr inbounds i32, i32* %81, i32 1
  store i32* %82, i32** %20, align 8
  %83 = load i32, i32* %81, align 4
  %84 = load i32*, i32** %11, align 8
  %85 = getelementptr inbounds i32, i32* %84, i32 1
  store i32* %85, i32** %11, align 8
  store i32 %83, i32* %84, align 4
  br label %86

; <label>:86:                                     ; preds = %38
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 0)
  %87 = add i64 %pgocount, 1
  store i64 %87, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 0)
  %88 = load i32, i32* %21, align 4
  %89 = sub i32 %88, 8
  store i32 %89, i32* %21, align 4
  br label %35

; <label>:90:                                     ; preds = %35
  %91 = load i32, i32* %21, align 4
  %92 = icmp ugt i32 %91, 0
  br i1 %92, label %93, label %153

; <label>:93:                                     ; preds = %90
  %94 = load i32**, i32*** %19, align 8
  %95 = load i8*, i8** %18, align 8
  %96 = getelementptr inbounds i8, i8* %95, i32 1
  store i8* %96, i8** %18, align 8
  %97 = load i8, i8* %95, align 1
  %98 = zext i8 %97 to i64
  %99 = getelementptr inbounds i32*, i32** %94, i64 %98
  %100 = load i32*, i32** %99, align 8
  store i32* %100, i32** %20, align 8
  %101 = load i32, i32* %21, align 4
  switch i32 %101, label %151 [
    i32 7, label %102
    i32 6, label %109
    i32 5, label %116
    i32 4, label %123
    i32 3, label %130
    i32 2, label %137
    i32 1, label %144
  ]

; <label>:102:                                    ; preds = %93
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 9)
  %103 = add i64 %pgocount1, 1
  store i64 %103, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 9)
  %104 = load i32*, i32** %20, align 8
  %105 = getelementptr inbounds i32, i32* %104, i32 1
  store i32* %105, i32** %20, align 8
  %106 = load i32, i32* %104, align 4
  %107 = load i32*, i32** %11, align 8
  %108 = getelementptr inbounds i32, i32* %107, i32 1
  store i32* %108, i32** %11, align 8
  store i32 %106, i32* %107, align 4
  br label %109

; <label>:109:                                    ; preds = %102, %93
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 8)
  %110 = add i64 %pgocount2, 1
  store i64 %110, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 8)
  %111 = load i32*, i32** %20, align 8
  %112 = getelementptr inbounds i32, i32* %111, i32 1
  store i32* %112, i32** %20, align 8
  %113 = load i32, i32* %111, align 4
  %114 = load i32*, i32** %11, align 8
  %115 = getelementptr inbounds i32, i32* %114, i32 1
  store i32* %115, i32** %11, align 8
  store i32 %113, i32* %114, align 4
  br label %116

; <label>:116:                                    ; preds = %109, %93
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 7)
  %117 = add i64 %pgocount3, 1
  store i64 %117, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 7)
  %118 = load i32*, i32** %20, align 8
  %119 = getelementptr inbounds i32, i32* %118, i32 1
  store i32* %119, i32** %20, align 8
  %120 = load i32, i32* %118, align 4
  %121 = load i32*, i32** %11, align 8
  %122 = getelementptr inbounds i32, i32* %121, i32 1
  store i32* %122, i32** %11, align 8
  store i32 %120, i32* %121, align 4
  br label %123

; <label>:123:                                    ; preds = %116, %93
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 6)
  %124 = add i64 %pgocount4, 1
  store i64 %124, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 6)
  %125 = load i32*, i32** %20, align 8
  %126 = getelementptr inbounds i32, i32* %125, i32 1
  store i32* %126, i32** %20, align 8
  %127 = load i32, i32* %125, align 4
  %128 = load i32*, i32** %11, align 8
  %129 = getelementptr inbounds i32, i32* %128, i32 1
  store i32* %129, i32** %11, align 8
  store i32 %127, i32* %128, align 4
  br label %130

; <label>:130:                                    ; preds = %123, %93
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 5)
  %131 = add i64 %pgocount5, 1
  store i64 %131, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 5)
  %132 = load i32*, i32** %20, align 8
  %133 = getelementptr inbounds i32, i32* %132, i32 1
  store i32* %133, i32** %20, align 8
  %134 = load i32, i32* %132, align 4
  %135 = load i32*, i32** %11, align 8
  %136 = getelementptr inbounds i32, i32* %135, i32 1
  store i32* %136, i32** %11, align 8
  store i32 %134, i32* %135, align 4
  br label %137

; <label>:137:                                    ; preds = %130, %93
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 4)
  %138 = add i64 %pgocount6, 1
  store i64 %138, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 4)
  %139 = load i32*, i32** %20, align 8
  %140 = getelementptr inbounds i32, i32* %139, i32 1
  store i32* %140, i32** %20, align 8
  %141 = load i32, i32* %139, align 4
  %142 = load i32*, i32** %11, align 8
  %143 = getelementptr inbounds i32, i32* %142, i32 1
  store i32* %143, i32** %11, align 8
  store i32 %141, i32* %142, align 4
  br label %144

; <label>:144:                                    ; preds = %137, %93
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 3)
  %145 = add i64 %pgocount7, 1
  store i64 %145, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 3)
  %146 = load i32*, i32** %20, align 8
  %147 = getelementptr inbounds i32, i32* %146, i32 1
  store i32* %147, i32** %20, align 8
  %148 = load i32, i32* %146, align 4
  %149 = load i32*, i32** %11, align 8
  %150 = getelementptr inbounds i32, i32* %149, i32 1
  store i32* %150, i32** %11, align 8
  store i32 %148, i32* %149, align 4
  br label %151

; <label>:151:                                    ; preds = %144, %93
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 2)
  %152 = add i64 %pgocount8, 1
  store i64 %152, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 2)
  br label %153

; <label>:153:                                    ; preds = %151, %90
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 1)
  %154 = add i64 %pgocount9, 1
  store i64 %154, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 1)
  %155 = load i32, i32* %17, align 4
  %156 = load i32*, i32** %11, align 8
  %157 = sext i32 %155 to i64
  %158 = getelementptr inbounds i32, i32* %156, i64 %157
  store i32* %158, i32** %11, align 8
  %159 = load i32, i32* %16, align 4
  %160 = load i8*, i8** %18, align 8
  %161 = sext i32 %159 to i64
  %162 = getelementptr inbounds i8, i8* %160, i64 %161
  store i8* %162, i8** %18, align 8
  br label %29

; <label>:163:                                    ; preds = %29
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 10)
  %164 = add i64 %pgocount10, 1
  store i64 %164, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitcmaptile, i64 0, i64 10)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putgreytile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i32**, align 8
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %20 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %21 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %20, i32 0, i32 16
  %22 = load i32**, i32*** %21, align 8
  store i32** %22, i32*** %19, align 8
  %23 = load i32, i32* %13, align 4
  br label %24

; <label>:24:                                     ; preds = %47, %9
  %25 = load i32, i32* %15, align 4
  %26 = add i32 %25, -1
  store i32 %26, i32* %15, align 4
  %27 = icmp ugt i32 %25, 0
  br i1 %27, label %28, label %57

; <label>:28:                                     ; preds = %24
  %29 = load i32, i32* %14, align 4
  store i32 %29, i32* %12, align 4
  br label %30

; <label>:30:                                     ; preds = %34, %28
  %31 = load i32, i32* %12, align 4
  %32 = add i32 %31, -1
  store i32 %32, i32* %12, align 4
  %33 = icmp ugt i32 %31, 0
  br i1 %33, label %34, label %47

; <label>:34:                                     ; preds = %30
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putgreytile, i64 0, i64 0)
  %35 = add i64 %pgocount, 1
  store i64 %35, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putgreytile, i64 0, i64 0)
  %36 = load i32**, i32*** %19, align 8
  %37 = load i8*, i8** %18, align 8
  %38 = getelementptr inbounds i8, i8* %37, i32 1
  store i8* %38, i8** %18, align 8
  %39 = load i8, i8* %37, align 1
  %40 = zext i8 %39 to i64
  %41 = getelementptr inbounds i32*, i32** %36, i64 %40
  %42 = load i32*, i32** %41, align 8
  %43 = getelementptr inbounds i32, i32* %42, i64 0
  %44 = load i32, i32* %43, align 4
  %45 = load i32*, i32** %11, align 8
  %46 = getelementptr inbounds i32, i32* %45, i32 1
  store i32* %46, i32** %11, align 8
  store i32 %44, i32* %45, align 4
  br label %30

; <label>:47:                                     ; preds = %30
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putgreytile, i64 0, i64 1)
  %48 = add i64 %pgocount1, 1
  store i64 %48, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putgreytile, i64 0, i64 1)
  %49 = load i32, i32* %17, align 4
  %50 = load i32*, i32** %11, align 8
  %51 = sext i32 %49 to i64
  %52 = getelementptr inbounds i32, i32* %50, i64 %51
  store i32* %52, i32** %11, align 8
  %53 = load i32, i32* %16, align 4
  %54 = load i8*, i8** %18, align 8
  %55 = sext i32 %53 to i64
  %56 = getelementptr inbounds i8, i8* %54, i64 %55
  store i8* %56, i8** %18, align 8
  br label %24

; <label>:57:                                     ; preds = %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putgreytile, i64 0, i64 2)
  %58 = add i64 %pgocount2, 1
  store i64 %58, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putgreytile, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put4bitbwtile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i32**, align 8
  %20 = alloca i32*, align 8
  %21 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %22 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %23 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %22, i32 0, i32 16
  %24 = load i32**, i32*** %23, align 8
  store i32** %24, i32*** %19, align 8
  %25 = load i32, i32* %12, align 4
  %26 = load i32, i32* %13, align 4
  %27 = load i32, i32* %16, align 4
  %28 = sdiv i32 %27, 2
  store i32 %28, i32* %16, align 4
  br label %29

; <label>:29:                                     ; preds = %77, %9
  %30 = load i32, i32* %15, align 4
  %31 = add i32 %30, -1
  store i32 %31, i32* %15, align 4
  %32 = icmp ugt i32 %30, 0
  br i1 %32, label %33, label %87

; <label>:33:                                     ; preds = %29
  %34 = load i32, i32* %14, align 4
  store i32 %34, i32* %21, align 4
  br label %35

; <label>:35:                                     ; preds = %56, %33
  %36 = load i32, i32* %21, align 4
  %37 = icmp uge i32 %36, 2
  br i1 %37, label %38, label %60

; <label>:38:                                     ; preds = %35
  %39 = load i32**, i32*** %19, align 8
  %40 = load i8*, i8** %18, align 8
  %41 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %41, i8** %18, align 8
  %42 = load i8, i8* %40, align 1
  %43 = zext i8 %42 to i64
  %44 = getelementptr inbounds i32*, i32** %39, i64 %43
  %45 = load i32*, i32** %44, align 8
  store i32* %45, i32** %20, align 8
  %46 = load i32*, i32** %20, align 8
  %47 = getelementptr inbounds i32, i32* %46, i32 1
  store i32* %47, i32** %20, align 8
  %48 = load i32, i32* %46, align 4
  %49 = load i32*, i32** %11, align 8
  %50 = getelementptr inbounds i32, i32* %49, i32 1
  store i32* %50, i32** %11, align 8
  store i32 %48, i32* %49, align 4
  %51 = load i32*, i32** %20, align 8
  %52 = getelementptr inbounds i32, i32* %51, i32 1
  store i32* %52, i32** %20, align 8
  %53 = load i32, i32* %51, align 4
  %54 = load i32*, i32** %11, align 8
  %55 = getelementptr inbounds i32, i32* %54, i32 1
  store i32* %55, i32** %11, align 8
  store i32 %53, i32* %54, align 4
  br label %56

; <label>:56:                                     ; preds = %38
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_put4bitbwtile, i64 0, i64 0)
  %57 = add i64 %pgocount, 1
  store i64 %57, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_put4bitbwtile, i64 0, i64 0)
  %58 = load i32, i32* %21, align 4
  %59 = sub i32 %58, 2
  store i32 %59, i32* %21, align 4
  br label %35

; <label>:60:                                     ; preds = %35
  %61 = load i32, i32* %21, align 4
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %63, label %77

; <label>:63:                                     ; preds = %60
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_put4bitbwtile, i64 0, i64 2)
  %64 = add i64 %pgocount1, 1
  store i64 %64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_put4bitbwtile, i64 0, i64 2)
  %65 = load i32**, i32*** %19, align 8
  %66 = load i8*, i8** %18, align 8
  %67 = getelementptr inbounds i8, i8* %66, i32 1
  store i8* %67, i8** %18, align 8
  %68 = load i8, i8* %66, align 1
  %69 = zext i8 %68 to i64
  %70 = getelementptr inbounds i32*, i32** %65, i64 %69
  %71 = load i32*, i32** %70, align 8
  store i32* %71, i32** %20, align 8
  %72 = load i32*, i32** %20, align 8
  %73 = getelementptr inbounds i32, i32* %72, i32 1
  store i32* %73, i32** %20, align 8
  %74 = load i32, i32* %72, align 4
  %75 = load i32*, i32** %11, align 8
  %76 = getelementptr inbounds i32, i32* %75, i32 1
  store i32* %76, i32** %11, align 8
  store i32 %74, i32* %75, align 4
  br label %77

; <label>:77:                                     ; preds = %63, %60
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_put4bitbwtile, i64 0, i64 1)
  %78 = add i64 %pgocount2, 1
  store i64 %78, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_put4bitbwtile, i64 0, i64 1)
  %79 = load i32, i32* %17, align 4
  %80 = load i32*, i32** %11, align 8
  %81 = sext i32 %79 to i64
  %82 = getelementptr inbounds i32, i32* %80, i64 %81
  store i32* %82, i32** %11, align 8
  %83 = load i32, i32* %16, align 4
  %84 = load i8*, i8** %18, align 8
  %85 = sext i32 %83 to i64
  %86 = getelementptr inbounds i8, i8* %84, i64 %85
  store i8* %86, i8** %18, align 8
  br label %29

; <label>:87:                                     ; preds = %29
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_put4bitbwtile, i64 0, i64 3)
  %88 = add i64 %pgocount3, 1
  store i64 %88, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_put4bitbwtile, i64 0, i64 3)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put2bitbwtile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i32**, align 8
  %20 = alloca i32*, align 8
  %21 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %22 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %23 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %22, i32 0, i32 16
  %24 = load i32**, i32*** %23, align 8
  store i32** %24, i32*** %19, align 8
  %25 = load i32, i32* %12, align 4
  %26 = load i32, i32* %13, align 4
  %27 = load i32, i32* %16, align 4
  %28 = sdiv i32 %27, 4
  store i32 %28, i32* %16, align 4
  br label %29

; <label>:29:                                     ; preds = %105, %9
  %30 = load i32, i32* %15, align 4
  %31 = add i32 %30, -1
  store i32 %31, i32* %15, align 4
  %32 = icmp ugt i32 %30, 0
  br i1 %32, label %33, label %115

; <label>:33:                                     ; preds = %29
  %34 = load i32, i32* %14, align 4
  store i32 %34, i32* %21, align 4
  br label %35

; <label>:35:                                     ; preds = %66, %33
  %36 = load i32, i32* %21, align 4
  %37 = icmp uge i32 %36, 4
  br i1 %37, label %38, label %70

; <label>:38:                                     ; preds = %35
  %39 = load i32**, i32*** %19, align 8
  %40 = load i8*, i8** %18, align 8
  %41 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %41, i8** %18, align 8
  %42 = load i8, i8* %40, align 1
  %43 = zext i8 %42 to i64
  %44 = getelementptr inbounds i32*, i32** %39, i64 %43
  %45 = load i32*, i32** %44, align 8
  store i32* %45, i32** %20, align 8
  %46 = load i32*, i32** %20, align 8
  %47 = getelementptr inbounds i32, i32* %46, i32 1
  store i32* %47, i32** %20, align 8
  %48 = load i32, i32* %46, align 4
  %49 = load i32*, i32** %11, align 8
  %50 = getelementptr inbounds i32, i32* %49, i32 1
  store i32* %50, i32** %11, align 8
  store i32 %48, i32* %49, align 4
  %51 = load i32*, i32** %20, align 8
  %52 = getelementptr inbounds i32, i32* %51, i32 1
  store i32* %52, i32** %20, align 8
  %53 = load i32, i32* %51, align 4
  %54 = load i32*, i32** %11, align 8
  %55 = getelementptr inbounds i32, i32* %54, i32 1
  store i32* %55, i32** %11, align 8
  store i32 %53, i32* %54, align 4
  %56 = load i32*, i32** %20, align 8
  %57 = getelementptr inbounds i32, i32* %56, i32 1
  store i32* %57, i32** %20, align 8
  %58 = load i32, i32* %56, align 4
  %59 = load i32*, i32** %11, align 8
  %60 = getelementptr inbounds i32, i32* %59, i32 1
  store i32* %60, i32** %11, align 8
  store i32 %58, i32* %59, align 4
  %61 = load i32*, i32** %20, align 8
  %62 = getelementptr inbounds i32, i32* %61, i32 1
  store i32* %62, i32** %20, align 8
  %63 = load i32, i32* %61, align 4
  %64 = load i32*, i32** %11, align 8
  %65 = getelementptr inbounds i32, i32* %64, i32 1
  store i32* %65, i32** %11, align 8
  store i32 %63, i32* %64, align 4
  br label %66

; <label>:66:                                     ; preds = %38
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitbwtile, i64 0, i64 0)
  %67 = add i64 %pgocount, 1
  store i64 %67, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitbwtile, i64 0, i64 0)
  %68 = load i32, i32* %21, align 4
  %69 = sub i32 %68, 4
  store i32 %69, i32* %21, align 4
  br label %35

; <label>:70:                                     ; preds = %35
  %71 = load i32, i32* %21, align 4
  %72 = icmp ugt i32 %71, 0
  br i1 %72, label %73, label %105

; <label>:73:                                     ; preds = %70
  %74 = load i32**, i32*** %19, align 8
  %75 = load i8*, i8** %18, align 8
  %76 = getelementptr inbounds i8, i8* %75, i32 1
  store i8* %76, i8** %18, align 8
  %77 = load i8, i8* %75, align 1
  %78 = zext i8 %77 to i64
  %79 = getelementptr inbounds i32*, i32** %74, i64 %78
  %80 = load i32*, i32** %79, align 8
  store i32* %80, i32** %20, align 8
  %81 = load i32, i32* %21, align 4
  switch i32 %81, label %103 [
    i32 3, label %82
    i32 2, label %89
    i32 1, label %96
  ]

; <label>:82:                                     ; preds = %73
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitbwtile, i64 0, i64 5)
  %83 = add i64 %pgocount1, 1
  store i64 %83, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitbwtile, i64 0, i64 5)
  %84 = load i32*, i32** %20, align 8
  %85 = getelementptr inbounds i32, i32* %84, i32 1
  store i32* %85, i32** %20, align 8
  %86 = load i32, i32* %84, align 4
  %87 = load i32*, i32** %11, align 8
  %88 = getelementptr inbounds i32, i32* %87, i32 1
  store i32* %88, i32** %11, align 8
  store i32 %86, i32* %87, align 4
  br label %89

; <label>:89:                                     ; preds = %82, %73
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitbwtile, i64 0, i64 4)
  %90 = add i64 %pgocount2, 1
  store i64 %90, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitbwtile, i64 0, i64 4)
  %91 = load i32*, i32** %20, align 8
  %92 = getelementptr inbounds i32, i32* %91, i32 1
  store i32* %92, i32** %20, align 8
  %93 = load i32, i32* %91, align 4
  %94 = load i32*, i32** %11, align 8
  %95 = getelementptr inbounds i32, i32* %94, i32 1
  store i32* %95, i32** %11, align 8
  store i32 %93, i32* %94, align 4
  br label %96

; <label>:96:                                     ; preds = %89, %73
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitbwtile, i64 0, i64 3)
  %97 = add i64 %pgocount3, 1
  store i64 %97, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitbwtile, i64 0, i64 3)
  %98 = load i32*, i32** %20, align 8
  %99 = getelementptr inbounds i32, i32* %98, i32 1
  store i32* %99, i32** %20, align 8
  %100 = load i32, i32* %98, align 4
  %101 = load i32*, i32** %11, align 8
  %102 = getelementptr inbounds i32, i32* %101, i32 1
  store i32* %102, i32** %11, align 8
  store i32 %100, i32* %101, align 4
  br label %103

; <label>:103:                                    ; preds = %96, %73
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitbwtile, i64 0, i64 2)
  %104 = add i64 %pgocount4, 1
  store i64 %104, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitbwtile, i64 0, i64 2)
  br label %105

; <label>:105:                                    ; preds = %103, %70
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitbwtile, i64 0, i64 1)
  %106 = add i64 %pgocount5, 1
  store i64 %106, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitbwtile, i64 0, i64 1)
  %107 = load i32, i32* %17, align 4
  %108 = load i32*, i32** %11, align 8
  %109 = sext i32 %107 to i64
  %110 = getelementptr inbounds i32, i32* %108, i64 %109
  store i32* %110, i32** %11, align 8
  %111 = load i32, i32* %16, align 4
  %112 = load i8*, i8** %18, align 8
  %113 = sext i32 %111 to i64
  %114 = getelementptr inbounds i8, i8* %112, i64 %113
  store i8* %114, i8** %18, align 8
  br label %29

; <label>:115:                                    ; preds = %29
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitbwtile, i64 0, i64 6)
  %116 = add i64 %pgocount6, 1
  store i64 %116, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_put2bitbwtile, i64 0, i64 6)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put1bitbwtile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i32**, align 8
  %20 = alloca i32*, align 8
  %21 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %22 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %23 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %22, i32 0, i32 16
  %24 = load i32**, i32*** %23, align 8
  store i32** %24, i32*** %19, align 8
  %25 = load i32, i32* %12, align 4
  %26 = load i32, i32* %13, align 4
  %27 = load i32, i32* %16, align 4
  %28 = sdiv i32 %27, 8
  store i32 %28, i32* %16, align 4
  br label %29

; <label>:29:                                     ; preds = %153, %9
  %30 = load i32, i32* %15, align 4
  %31 = add i32 %30, -1
  store i32 %31, i32* %15, align 4
  %32 = icmp ugt i32 %30, 0
  br i1 %32, label %33, label %163

; <label>:33:                                     ; preds = %29
  %34 = load i32, i32* %14, align 4
  store i32 %34, i32* %21, align 4
  br label %35

; <label>:35:                                     ; preds = %86, %33
  %36 = load i32, i32* %21, align 4
  %37 = icmp uge i32 %36, 8
  br i1 %37, label %38, label %90

; <label>:38:                                     ; preds = %35
  %39 = load i32**, i32*** %19, align 8
  %40 = load i8*, i8** %18, align 8
  %41 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %41, i8** %18, align 8
  %42 = load i8, i8* %40, align 1
  %43 = zext i8 %42 to i64
  %44 = getelementptr inbounds i32*, i32** %39, i64 %43
  %45 = load i32*, i32** %44, align 8
  store i32* %45, i32** %20, align 8
  %46 = load i32*, i32** %20, align 8
  %47 = getelementptr inbounds i32, i32* %46, i32 1
  store i32* %47, i32** %20, align 8
  %48 = load i32, i32* %46, align 4
  %49 = load i32*, i32** %11, align 8
  %50 = getelementptr inbounds i32, i32* %49, i32 1
  store i32* %50, i32** %11, align 8
  store i32 %48, i32* %49, align 4
  %51 = load i32*, i32** %20, align 8
  %52 = getelementptr inbounds i32, i32* %51, i32 1
  store i32* %52, i32** %20, align 8
  %53 = load i32, i32* %51, align 4
  %54 = load i32*, i32** %11, align 8
  %55 = getelementptr inbounds i32, i32* %54, i32 1
  store i32* %55, i32** %11, align 8
  store i32 %53, i32* %54, align 4
  %56 = load i32*, i32** %20, align 8
  %57 = getelementptr inbounds i32, i32* %56, i32 1
  store i32* %57, i32** %20, align 8
  %58 = load i32, i32* %56, align 4
  %59 = load i32*, i32** %11, align 8
  %60 = getelementptr inbounds i32, i32* %59, i32 1
  store i32* %60, i32** %11, align 8
  store i32 %58, i32* %59, align 4
  %61 = load i32*, i32** %20, align 8
  %62 = getelementptr inbounds i32, i32* %61, i32 1
  store i32* %62, i32** %20, align 8
  %63 = load i32, i32* %61, align 4
  %64 = load i32*, i32** %11, align 8
  %65 = getelementptr inbounds i32, i32* %64, i32 1
  store i32* %65, i32** %11, align 8
  store i32 %63, i32* %64, align 4
  %66 = load i32*, i32** %20, align 8
  %67 = getelementptr inbounds i32, i32* %66, i32 1
  store i32* %67, i32** %20, align 8
  %68 = load i32, i32* %66, align 4
  %69 = load i32*, i32** %11, align 8
  %70 = getelementptr inbounds i32, i32* %69, i32 1
  store i32* %70, i32** %11, align 8
  store i32 %68, i32* %69, align 4
  %71 = load i32*, i32** %20, align 8
  %72 = getelementptr inbounds i32, i32* %71, i32 1
  store i32* %72, i32** %20, align 8
  %73 = load i32, i32* %71, align 4
  %74 = load i32*, i32** %11, align 8
  %75 = getelementptr inbounds i32, i32* %74, i32 1
  store i32* %75, i32** %11, align 8
  store i32 %73, i32* %74, align 4
  %76 = load i32*, i32** %20, align 8
  %77 = getelementptr inbounds i32, i32* %76, i32 1
  store i32* %77, i32** %20, align 8
  %78 = load i32, i32* %76, align 4
  %79 = load i32*, i32** %11, align 8
  %80 = getelementptr inbounds i32, i32* %79, i32 1
  store i32* %80, i32** %11, align 8
  store i32 %78, i32* %79, align 4
  %81 = load i32*, i32** %20, align 8
  %82 = getelementptr inbounds i32, i32* %81, i32 1
  store i32* %82, i32** %20, align 8
  %83 = load i32, i32* %81, align 4
  %84 = load i32*, i32** %11, align 8
  %85 = getelementptr inbounds i32, i32* %84, i32 1
  store i32* %85, i32** %11, align 8
  store i32 %83, i32* %84, align 4
  br label %86

; <label>:86:                                     ; preds = %38
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 0)
  %87 = add i64 %pgocount, 1
  store i64 %87, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 0)
  %88 = load i32, i32* %21, align 4
  %89 = sub i32 %88, 8
  store i32 %89, i32* %21, align 4
  br label %35

; <label>:90:                                     ; preds = %35
  %91 = load i32, i32* %21, align 4
  %92 = icmp ugt i32 %91, 0
  br i1 %92, label %93, label %153

; <label>:93:                                     ; preds = %90
  %94 = load i32**, i32*** %19, align 8
  %95 = load i8*, i8** %18, align 8
  %96 = getelementptr inbounds i8, i8* %95, i32 1
  store i8* %96, i8** %18, align 8
  %97 = load i8, i8* %95, align 1
  %98 = zext i8 %97 to i64
  %99 = getelementptr inbounds i32*, i32** %94, i64 %98
  %100 = load i32*, i32** %99, align 8
  store i32* %100, i32** %20, align 8
  %101 = load i32, i32* %21, align 4
  switch i32 %101, label %151 [
    i32 7, label %102
    i32 6, label %109
    i32 5, label %116
    i32 4, label %123
    i32 3, label %130
    i32 2, label %137
    i32 1, label %144
  ]

; <label>:102:                                    ; preds = %93
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 9)
  %103 = add i64 %pgocount1, 1
  store i64 %103, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 9)
  %104 = load i32*, i32** %20, align 8
  %105 = getelementptr inbounds i32, i32* %104, i32 1
  store i32* %105, i32** %20, align 8
  %106 = load i32, i32* %104, align 4
  %107 = load i32*, i32** %11, align 8
  %108 = getelementptr inbounds i32, i32* %107, i32 1
  store i32* %108, i32** %11, align 8
  store i32 %106, i32* %107, align 4
  br label %109

; <label>:109:                                    ; preds = %102, %93
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 8)
  %110 = add i64 %pgocount2, 1
  store i64 %110, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 8)
  %111 = load i32*, i32** %20, align 8
  %112 = getelementptr inbounds i32, i32* %111, i32 1
  store i32* %112, i32** %20, align 8
  %113 = load i32, i32* %111, align 4
  %114 = load i32*, i32** %11, align 8
  %115 = getelementptr inbounds i32, i32* %114, i32 1
  store i32* %115, i32** %11, align 8
  store i32 %113, i32* %114, align 4
  br label %116

; <label>:116:                                    ; preds = %109, %93
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 7)
  %117 = add i64 %pgocount3, 1
  store i64 %117, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 7)
  %118 = load i32*, i32** %20, align 8
  %119 = getelementptr inbounds i32, i32* %118, i32 1
  store i32* %119, i32** %20, align 8
  %120 = load i32, i32* %118, align 4
  %121 = load i32*, i32** %11, align 8
  %122 = getelementptr inbounds i32, i32* %121, i32 1
  store i32* %122, i32** %11, align 8
  store i32 %120, i32* %121, align 4
  br label %123

; <label>:123:                                    ; preds = %116, %93
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 6)
  %124 = add i64 %pgocount4, 1
  store i64 %124, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 6)
  %125 = load i32*, i32** %20, align 8
  %126 = getelementptr inbounds i32, i32* %125, i32 1
  store i32* %126, i32** %20, align 8
  %127 = load i32, i32* %125, align 4
  %128 = load i32*, i32** %11, align 8
  %129 = getelementptr inbounds i32, i32* %128, i32 1
  store i32* %129, i32** %11, align 8
  store i32 %127, i32* %128, align 4
  br label %130

; <label>:130:                                    ; preds = %123, %93
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 5)
  %131 = add i64 %pgocount5, 1
  store i64 %131, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 5)
  %132 = load i32*, i32** %20, align 8
  %133 = getelementptr inbounds i32, i32* %132, i32 1
  store i32* %133, i32** %20, align 8
  %134 = load i32, i32* %132, align 4
  %135 = load i32*, i32** %11, align 8
  %136 = getelementptr inbounds i32, i32* %135, i32 1
  store i32* %136, i32** %11, align 8
  store i32 %134, i32* %135, align 4
  br label %137

; <label>:137:                                    ; preds = %130, %93
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 4)
  %138 = add i64 %pgocount6, 1
  store i64 %138, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 4)
  %139 = load i32*, i32** %20, align 8
  %140 = getelementptr inbounds i32, i32* %139, i32 1
  store i32* %140, i32** %20, align 8
  %141 = load i32, i32* %139, align 4
  %142 = load i32*, i32** %11, align 8
  %143 = getelementptr inbounds i32, i32* %142, i32 1
  store i32* %143, i32** %11, align 8
  store i32 %141, i32* %142, align 4
  br label %144

; <label>:144:                                    ; preds = %137, %93
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 3)
  %145 = add i64 %pgocount7, 1
  store i64 %145, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 3)
  %146 = load i32*, i32** %20, align 8
  %147 = getelementptr inbounds i32, i32* %146, i32 1
  store i32* %147, i32** %20, align 8
  %148 = load i32, i32* %146, align 4
  %149 = load i32*, i32** %11, align 8
  %150 = getelementptr inbounds i32, i32* %149, i32 1
  store i32* %150, i32** %11, align 8
  store i32 %148, i32* %149, align 4
  br label %151

; <label>:151:                                    ; preds = %144, %93
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 2)
  %152 = add i64 %pgocount8, 1
  store i64 %152, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 2)
  br label %153

; <label>:153:                                    ; preds = %151, %90
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 1)
  %154 = add i64 %pgocount9, 1
  store i64 %154, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 1)
  %155 = load i32, i32* %17, align 4
  %156 = load i32*, i32** %11, align 8
  %157 = sext i32 %155 to i64
  %158 = getelementptr inbounds i32, i32* %156, i64 %157
  store i32* %158, i32** %11, align 8
  %159 = load i32, i32* %16, align 4
  %160 = load i8*, i8** %18, align 8
  %161 = sext i32 %159 to i64
  %162 = getelementptr inbounds i8, i8* %160, i64 %161
  store i8* %162, i8** %18, align 8
  br label %29

; <label>:163:                                    ; preds = %29
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 10)
  %164 = add i64 %pgocount10, 1
  store i64 %164, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_put1bitbwtile, i64 0, i64 10)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @initYCbCrConversion(%struct._TIFFRGBAImage*) #0 {
  %2 = alloca void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*, align 8
  %3 = alloca %struct._TIFFRGBAImage*, align 8
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  %6 = alloca float*, align 8
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %3, align 8
  %7 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %8 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %7, i32 0, i32 18
  %9 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %8, align 8
  %10 = icmp eq %struct.TIFFYCbCrToRGB* %9, null
  br i1 %10, label %11, label %34

; <label>:11:                                     ; preds = %1
  %12 = call i8* @_TIFFmalloc(i32 5176)
  %13 = bitcast i8* %12 to %struct.TIFFYCbCrToRGB*
  %14 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %15 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %14, i32 0, i32 18
  store %struct.TIFFYCbCrToRGB* %13, %struct.TIFFYCbCrToRGB** %15, align 8
  %16 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %17 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %16, i32 0, i32 18
  %18 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %17, align 8
  %19 = icmp eq %struct.TIFFYCbCrToRGB* %18, null
  br i1 %19, label %20, label %26

; <label>:20:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 2)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 2)
  %22 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %23 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %22, i32 0, i32 0
  %24 = load %struct.tiff*, %struct.tiff** %23, align 8
  %25 = call i8* @TIFFFileName(%struct.tiff* %24)
  call void (i8*, i8*, ...) @TIFFError(i8* %25, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.32, i32 0, i32 0))
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* null, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %2, align 8
  br label %83

; <label>:26:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 1)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 1)
  %28 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %29 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %28, i32 0, i32 18
  %30 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %29, align 8
  %31 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %32 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %31, i32 0, i32 0
  %33 = load %struct.tiff*, %struct.tiff** %32, align 8
  call void @TIFFYCbCrToRGBInit(%struct.TIFFYCbCrToRGB* %30, %struct.tiff* %33)
  br label %58

; <label>:34:                                     ; preds = %1
  %35 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %36 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %35, i32 0, i32 0
  %37 = load %struct.tiff*, %struct.tiff** %36, align 8
  %38 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %37, i32 529, float** %6)
  %39 = load float*, float** %6, align 8
  %40 = bitcast float* %39 to i8*
  %41 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %42 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %41, i32 0, i32 18
  %43 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %42, align 8
  %44 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %43, i32 0, i32 5
  %45 = getelementptr inbounds [3 x float], [3 x float]* %44, i32 0, i32 0
  %46 = bitcast float* %45 to i8*
  %47 = call i32 @_TIFFmemcmp(i8* %40, i8* %46, i32 12)
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %57

; <label>:49:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 0)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 0)
  %51 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %52 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %51, i32 0, i32 18
  %53 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %52, align 8
  %54 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %55 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %54, i32 0, i32 0
  %56 = load %struct.tiff*, %struct.tiff** %55, align 8
  call void @TIFFYCbCrToRGBInit(%struct.TIFFYCbCrToRGB* %53, %struct.tiff* %56)
  br label %57

; <label>:57:                                     ; preds = %49, %34
  br label %58

; <label>:58:                                     ; preds = %57, %26
  %59 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %60 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %59, i32 0, i32 0
  %61 = load %struct.tiff*, %struct.tiff** %60, align 8
  %62 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %61, i32 530, i16* %4, i16* %5)
  %63 = load i16, i16* %4, align 2
  %64 = zext i16 %63 to i32
  %65 = shl i32 %64, 4
  %66 = load i16, i16* %5, align 2
  %67 = zext i16 %66 to i32
  %68 = or i32 %65, %67
  switch i32 %68, label %81 [
    i32 68, label %69
    i32 66, label %71
    i32 65, label %73
    i32 34, label %75
    i32 33, label %77
    i32 17, label %79
  ]

; <label>:69:                                     ; preds = %58
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 4)
  %70 = add i64 %pgocount3, 1
  store i64 %70, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 4)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putcontig8bitYCbCr44tile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %2, align 8
  br label %83

; <label>:71:                                     ; preds = %58
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 5)
  %72 = add i64 %pgocount4, 1
  store i64 %72, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 5)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putcontig8bitYCbCr42tile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %2, align 8
  br label %83

; <label>:73:                                     ; preds = %58
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 6)
  %74 = add i64 %pgocount5, 1
  store i64 %74, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 6)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putcontig8bitYCbCr41tile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %2, align 8
  br label %83

; <label>:75:                                     ; preds = %58
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 7)
  %76 = add i64 %pgocount6, 1
  store i64 %76, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 7)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putcontig8bitYCbCr22tile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %2, align 8
  br label %83

; <label>:77:                                     ; preds = %58
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 8)
  %78 = add i64 %pgocount7, 1
  store i64 %78, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 8)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putcontig8bitYCbCr21tile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %2, align 8
  br label %83

; <label>:79:                                     ; preds = %58
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 9)
  %80 = add i64 %pgocount8, 1
  store i64 %80, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 9)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putcontig8bitYCbCr11tile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %2, align 8
  br label %83

; <label>:81:                                     ; preds = %58
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 3)
  %82 = add i64 %pgocount9, 1
  store i64 %82, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_initYCbCrConversion, i64 0, i64 3)
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* null, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %2, align 8
  br label %83

; <label>:83:                                     ; preds = %81, %79, %77, %75, %73, %71, %69, %20
  %84 = load void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %2, align 8
  ret void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* %84
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @setupMap(%struct._TIFFRGBAImage*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct._TIFFRGBAImage*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %3, align 8
  %6 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %7 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %6, i32 0, i32 6
  %8 = load i16, i16* %7, align 4
  %9 = zext i16 %8 to i32
  %10 = zext i32 %9 to i64
  %11 = shl i64 1, %10
  %12 = sub nsw i64 %11, 1
  %13 = trunc i64 %12 to i32
  store i32 %13, i32* %5, align 4
  %14 = load i32, i32* %5, align 4
  %15 = add nsw i32 %14, 1
  %16 = sext i32 %15 to i64
  %17 = mul i64 %16, 1
  %18 = trunc i64 %17 to i32
  %19 = call i8* @_TIFFmalloc(i32 %18)
  %20 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %21 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %20, i32 0, i32 15
  store i8* %19, i8** %21, align 8
  %22 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %23 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %22, i32 0, i32 15
  %24 = load i8*, i8** %23, align 8
  %25 = icmp eq i8* %24, null
  br i1 %25, label %26, label %32

; <label>:26:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setupMap, i64 0, i64 3)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setupMap, i64 0, i64 3)
  %28 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %29 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %28, i32 0, i32 0
  %30 = load %struct.tiff*, %struct.tiff** %29, align 8
  %31 = call i8* @TIFFFileName(%struct.tiff* %30)
  call void (i8*, i8*, ...) @TIFFError(i8* %31, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.29, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %120

; <label>:32:                                     ; preds = %1
  %33 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %34 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %33, i32 0, i32 9
  %35 = load i16, i16* %34, align 2
  %36 = zext i16 %35 to i32
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %63

; <label>:38:                                     ; preds = %32
  store i32 0, i32* %4, align 4
  br label %39

; <label>:39:                                     ; preds = %58, %38
  %40 = load i32, i32* %4, align 4
  %41 = load i32, i32* %5, align 4
  %42 = icmp sle i32 %40, %41
  br i1 %42, label %43, label %61

; <label>:43:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setupMap, i64 0, i64 1)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setupMap, i64 0, i64 1)
  %45 = load i32, i32* %5, align 4
  %46 = load i32, i32* %4, align 4
  %47 = sub nsw i32 %45, %46
  %48 = mul nsw i32 %47, 255
  %49 = load i32, i32* %5, align 4
  %50 = sdiv i32 %48, %49
  %51 = trunc i32 %50 to i8
  %52 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %53 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %52, i32 0, i32 15
  %54 = load i8*, i8** %53, align 8
  %55 = load i32, i32* %4, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8* %54, i64 %56
  store i8 %51, i8* %57, align 1
  br label %58

; <label>:58:                                     ; preds = %43
  %59 = load i32, i32* %4, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %4, align 4
  br label %39

; <label>:61:                                     ; preds = %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setupMap, i64 0, i64 5)
  %62 = add i64 %pgocount2, 1
  store i64 %62, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setupMap, i64 0, i64 5)
  br label %86

; <label>:63:                                     ; preds = %32
  store i32 0, i32* %4, align 4
  br label %64

; <label>:64:                                     ; preds = %80, %63
  %65 = load i32, i32* %4, align 4
  %66 = load i32, i32* %5, align 4
  %67 = icmp sle i32 %65, %66
  br i1 %67, label %68, label %84

; <label>:68:                                     ; preds = %64
  %69 = load i32, i32* %4, align 4
  %70 = mul nsw i32 %69, 255
  %71 = load i32, i32* %5, align 4
  %72 = sdiv i32 %70, %71
  %73 = trunc i32 %72 to i8
  %74 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %75 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %74, i32 0, i32 15
  %76 = load i8*, i8** %75, align 8
  %77 = load i32, i32* %4, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8* %76, i64 %78
  store i8 %73, i8* %79, align 1
  br label %80

; <label>:80:                                     ; preds = %68
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setupMap, i64 0, i64 0)
  %81 = add i64 %pgocount3, 1
  store i64 %81, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setupMap, i64 0, i64 0)
  %82 = load i32, i32* %4, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, i32* %4, align 4
  br label %64

; <label>:84:                                     ; preds = %64
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setupMap, i64 0, i64 2)
  %85 = add i64 %pgocount4, 1
  store i64 %85, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setupMap, i64 0, i64 2)
  br label %86

; <label>:86:                                     ; preds = %84, %61
  %87 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %88 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %87, i32 0, i32 6
  %89 = load i16, i16* %88, align 4
  %90 = zext i16 %89 to i32
  %91 = icmp sle i32 %90, 8
  br i1 %91, label %92, label %119

; <label>:92:                                     ; preds = %86
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setupMap, i64 0, i64 4)
  %93 = add i64 %pgocount5, 1
  store i64 %93, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setupMap, i64 0, i64 4)
  %94 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %95 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %94, i32 0, i32 9
  %96 = load i16, i16* %95, align 2
  %97 = zext i16 %96 to i32
  %98 = icmp eq i32 %97, 1
  br i1 %98, label %106, label %99

; <label>:99:                                     ; preds = %92
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setupMap, i64 0, i64 6)
  %100 = add i64 %pgocount6, 1
  store i64 %100, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setupMap, i64 0, i64 6)
  %101 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %102 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %101, i32 0, i32 9
  %103 = load i16, i16* %102, align 2
  %104 = zext i16 %103 to i32
  %105 = icmp eq i32 %104, 0
  br i1 %105, label %106, label %119

; <label>:106:                                    ; preds = %99, %92
  %107 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %108 = call i32 @makebwmap(%struct._TIFFRGBAImage* %107)
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %112, label %110

; <label>:110:                                    ; preds = %106
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setupMap, i64 0, i64 8)
  %111 = add i64 %pgocount7, 1
  store i64 %111, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setupMap, i64 0, i64 8)
  store i32 0, i32* %2, align 4
  br label %120

; <label>:112:                                    ; preds = %106
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setupMap, i64 0, i64 7)
  %113 = add i64 %pgocount8, 1
  store i64 %113, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_setupMap, i64 0, i64 7)
  %114 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %115 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %114, i32 0, i32 15
  %116 = load i8*, i8** %115, align 8
  call void @_TIFFfree(i8* %116)
  %117 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %118 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %117, i32 0, i32 15
  store i8* null, i8** %118, align 8
  br label %119

; <label>:119:                                    ; preds = %112, %99, %86
  store i32 1, i32* %2, align 4
  br label %120

; <label>:120:                                    ; preds = %119, %110, %26
  %121 = load i32, i32* %2, align 4
  ret i32 %121
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @checkcmap(%struct._TIFFRGBAImage*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct._TIFFRGBAImage*, align 8
  %4 = alloca i16*, align 8
  %5 = alloca i16*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i64, align 8
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %3, align 8
  %8 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %9 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %8, i32 0, i32 10
  %10 = load i16*, i16** %9, align 8
  store i16* %10, i16** %4, align 8
  %11 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %12 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %11, i32 0, i32 11
  %13 = load i16*, i16** %12, align 8
  store i16* %13, i16** %5, align 8
  %14 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %15 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %14, i32 0, i32 12
  %16 = load i16*, i16** %15, align 8
  store i16* %16, i16** %6, align 8
  %17 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %18 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %17, i32 0, i32 6
  %19 = load i16, i16* %18, align 4
  %20 = zext i16 %19 to i32
  %21 = zext i32 %20 to i64
  %22 = shl i64 1, %21
  store i64 %22, i64* %7, align 8
  br label %23

; <label>:23:                                     ; preds = %49, %1
  %24 = load i64, i64* %7, align 8
  %25 = add nsw i64 %24, -1
  store i64 %25, i64* %7, align 8
  %26 = icmp sgt i64 %24, 0
  br i1 %26, label %27, label %51

; <label>:27:                                     ; preds = %23
  %28 = load i16*, i16** %4, align 8
  %29 = getelementptr inbounds i16, i16* %28, i32 1
  store i16* %29, i16** %4, align 8
  %30 = load i16, i16* %28, align 2
  %31 = zext i16 %30 to i32
  %32 = icmp sge i32 %31, 256
  br i1 %32, label %47, label %33

; <label>:33:                                     ; preds = %27
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 0)
  %34 = add i64 %pgocount, 1
  store i64 %34, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 0)
  %35 = load i16*, i16** %5, align 8
  %36 = getelementptr inbounds i16, i16* %35, i32 1
  store i16* %36, i16** %5, align 8
  %37 = load i16, i16* %35, align 2
  %38 = zext i16 %37 to i32
  %39 = icmp sge i32 %38, 256
  br i1 %39, label %47, label %40

; <label>:40:                                     ; preds = %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 1)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 1)
  %42 = load i16*, i16** %6, align 8
  %43 = getelementptr inbounds i16, i16* %42, i32 1
  store i16* %43, i16** %6, align 8
  %44 = load i16, i16* %42, align 2
  %45 = zext i16 %44 to i32
  %46 = icmp sge i32 %45, 256
  br i1 %46, label %47, label %49

; <label>:47:                                     ; preds = %40, %33, %27
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 3)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 3)
  store i32 16, i32* %2, align 4
  br label %53

; <label>:49:                                     ; preds = %40
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 2)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 2)
  br label %23

; <label>:51:                                     ; preds = %23
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 4)
  %52 = add i64 %pgocount4, 1
  store i64 %52, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 4)
  store i32 8, i32* %2, align 4
  br label %53

; <label>:53:                                     ; preds = %51, %47
  %54 = load i32, i32* %2, align 4
  ret i32 %54
}

; Function Attrs: noinline nounwind uwtable
define internal void @cvtcmap(%struct._TIFFRGBAImage*) #0 {
  %2 = alloca %struct._TIFFRGBAImage*, align 8
  %3 = alloca i16*, align 8
  %4 = alloca i16*, align 8
  %5 = alloca i16*, align 8
  %6 = alloca i64, align 8
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %2, align 8
  %7 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %8 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %7, i32 0, i32 10
  %9 = load i16*, i16** %8, align 8
  store i16* %9, i16** %3, align 8
  %10 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %11 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %10, i32 0, i32 11
  %12 = load i16*, i16** %11, align 8
  store i16* %12, i16** %4, align 8
  %13 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %14 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %13, i32 0, i32 12
  %15 = load i16*, i16** %14, align 8
  store i16* %15, i16** %5, align 8
  %16 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %2, align 8
  %17 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %16, i32 0, i32 6
  %18 = load i16, i16* %17, align 4
  %19 = zext i16 %18 to i32
  %20 = zext i32 %19 to i64
  %21 = shl i64 1, %20
  %22 = sub nsw i64 %21, 1
  store i64 %22, i64* %6, align 8
  br label %23

; <label>:23:                                     ; preds = %57, %1
  %24 = load i64, i64* %6, align 8
  %25 = icmp sge i64 %24, 0
  br i1 %25, label %26, label %61

; <label>:26:                                     ; preds = %23
  %27 = load i16*, i16** %3, align 8
  %28 = load i64, i64* %6, align 8
  %29 = getelementptr inbounds i16, i16* %27, i64 %28
  %30 = load i16, i16* %29, align 2
  %31 = zext i16 %30 to i32
  %32 = ashr i32 %31, 8
  %33 = trunc i32 %32 to i16
  %34 = load i16*, i16** %3, align 8
  %35 = load i64, i64* %6, align 8
  %36 = getelementptr inbounds i16, i16* %34, i64 %35
  store i16 %33, i16* %36, align 2
  %37 = load i16*, i16** %4, align 8
  %38 = load i64, i64* %6, align 8
  %39 = getelementptr inbounds i16, i16* %37, i64 %38
  %40 = load i16, i16* %39, align 2
  %41 = zext i16 %40 to i32
  %42 = ashr i32 %41, 8
  %43 = trunc i32 %42 to i16
  %44 = load i16*, i16** %4, align 8
  %45 = load i64, i64* %6, align 8
  %46 = getelementptr inbounds i16, i16* %44, i64 %45
  store i16 %43, i16* %46, align 2
  %47 = load i16*, i16** %5, align 8
  %48 = load i64, i64* %6, align 8
  %49 = getelementptr inbounds i16, i16* %47, i64 %48
  %50 = load i16, i16* %49, align 2
  %51 = zext i16 %50 to i32
  %52 = ashr i32 %51, 8
  %53 = trunc i32 %52 to i16
  %54 = load i16*, i16** %5, align 8
  %55 = load i64, i64* %6, align 8
  %56 = getelementptr inbounds i16, i16* %54, i64 %55
  store i16 %53, i16* %56, align 2
  br label %57

; <label>:57:                                     ; preds = %26
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_cvtcmap, i64 0, i64 0)
  %58 = add i64 %pgocount, 1
  store i64 %58, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_cvtcmap, i64 0, i64 0)
  %59 = load i64, i64* %6, align 8
  %60 = add nsw i64 %59, -1
  store i64 %60, i64* %6, align 8
  br label %23

; <label>:61:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_cvtcmap, i64 0, i64 1)
  %62 = add i64 %pgocount1, 1
  store i64 %62, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_cvtcmap, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @makecmap(%struct._TIFFRGBAImage*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct._TIFFRGBAImage*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i16*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i8, align 1
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %3, align 8
  %12 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %13 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %12, i32 0, i32 6
  %14 = load i16, i16* %13, align 4
  %15 = zext i16 %14 to i32
  store i32 %15, i32* %4, align 4
  %16 = load i32, i32* %4, align 4
  %17 = sdiv i32 8, %16
  store i32 %17, i32* %5, align 4
  %18 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %19 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %18, i32 0, i32 10
  %20 = load i16*, i16** %19, align 8
  store i16* %20, i16** %6, align 8
  %21 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %22 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %21, i32 0, i32 11
  %23 = load i16*, i16** %22, align 8
  store i16* %23, i16** %7, align 8
  %24 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %25 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %24, i32 0, i32 12
  %26 = load i16*, i16** %25, align 8
  store i16* %26, i16** %8, align 8
  %27 = load i32, i32* %5, align 4
  %28 = mul nsw i32 256, %27
  %29 = sext i32 %28 to i64
  %30 = mul i64 %29, 4
  %31 = add i64 2048, %30
  %32 = trunc i64 %31 to i32
  %33 = call i8* @_TIFFmalloc(i32 %32)
  %34 = bitcast i8* %33 to i32**
  %35 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %36 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %35, i32 0, i32 17
  store i32** %34, i32*** %36, align 8
  %37 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %38 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %37, i32 0, i32 17
  %39 = load i32**, i32*** %38, align 8
  %40 = icmp eq i32** %39, null
  br i1 %40, label %41, label %47

; <label>:41:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makecmap, i64 0, i64 6)
  %42 = add i64 %pgocount, 1
  store i64 %42, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makecmap, i64 0, i64 6)
  %43 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %44 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %43, i32 0, i32 0
  %45 = load %struct.tiff*, %struct.tiff** %44, align 8
  %46 = call i8* @TIFFFileName(%struct.tiff* %45)
  call void (i8*, i8*, ...) @TIFFError(i8* %46, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.31, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %552

; <label>:47:                                     ; preds = %1
  %48 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %49 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %48, i32 0, i32 17
  %50 = load i32**, i32*** %49, align 8
  %51 = getelementptr inbounds i32*, i32** %50, i64 256
  %52 = bitcast i32** %51 to i32*
  store i32* %52, i32** %9, align 8
  store i32 0, i32* %10, align 4
  br label %53

; <label>:53:                                     ; preds = %547, %47
  %54 = load i32, i32* %10, align 4
  %55 = icmp slt i32 %54, 256
  br i1 %55, label %56, label %550

; <label>:56:                                     ; preds = %53
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makecmap, i64 0, i64 0)
  %57 = add i64 %pgocount1, 1
  store i64 %57, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makecmap, i64 0, i64 0)
  %58 = load i32*, i32** %9, align 8
  %59 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %60 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %59, i32 0, i32 17
  %61 = load i32**, i32*** %60, align 8
  %62 = load i32, i32* %10, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32*, i32** %61, i64 %63
  store i32* %58, i32** %64, align 8
  %65 = load i32, i32* %4, align 4
  switch i32 %65, label %546 [
    i32 1, label %66
    i32 2, label %322
    i32 4, label %450
    i32 8, label %514
  ]

; <label>:66:                                     ; preds = %56
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makecmap, i64 0, i64 1)
  %67 = add i64 %pgocount2, 1
  store i64 %67, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makecmap, i64 0, i64 1)
  %68 = load i32, i32* %10, align 4
  %69 = ashr i32 %68, 7
  %70 = trunc i32 %69 to i8
  store i8 %70, i8* %11, align 1
  %71 = load i16*, i16** %6, align 8
  %72 = load i8, i8* %11, align 1
  %73 = zext i8 %72 to i64
  %74 = getelementptr inbounds i16, i16* %71, i64 %73
  %75 = load i16, i16* %74, align 2
  %76 = zext i16 %75 to i32
  %77 = and i32 %76, 255
  %78 = load i16*, i16** %7, align 8
  %79 = load i8, i8* %11, align 1
  %80 = zext i8 %79 to i64
  %81 = getelementptr inbounds i16, i16* %78, i64 %80
  %82 = load i16, i16* %81, align 2
  %83 = zext i16 %82 to i32
  %84 = and i32 %83, 255
  %85 = shl i32 %84, 8
  %86 = or i32 %77, %85
  %87 = load i16*, i16** %8, align 8
  %88 = load i8, i8* %11, align 1
  %89 = zext i8 %88 to i64
  %90 = getelementptr inbounds i16, i16* %87, i64 %89
  %91 = load i16, i16* %90, align 2
  %92 = zext i16 %91 to i32
  %93 = and i32 %92, 255
  %94 = shl i32 %93, 16
  %95 = or i32 %86, %94
  %96 = or i32 %95, -16777216
  %97 = load i32*, i32** %9, align 8
  %98 = getelementptr inbounds i32, i32* %97, i32 1
  store i32* %98, i32** %9, align 8
  store i32 %96, i32* %97, align 4
  %99 = load i32, i32* %10, align 4
  %100 = ashr i32 %99, 6
  %101 = and i32 %100, 1
  %102 = trunc i32 %101 to i8
  store i8 %102, i8* %11, align 1
  %103 = load i16*, i16** %6, align 8
  %104 = load i8, i8* %11, align 1
  %105 = zext i8 %104 to i64
  %106 = getelementptr inbounds i16, i16* %103, i64 %105
  %107 = load i16, i16* %106, align 2
  %108 = zext i16 %107 to i32
  %109 = and i32 %108, 255
  %110 = load i16*, i16** %7, align 8
  %111 = load i8, i8* %11, align 1
  %112 = zext i8 %111 to i64
  %113 = getelementptr inbounds i16, i16* %110, i64 %112
  %114 = load i16, i16* %113, align 2
  %115 = zext i16 %114 to i32
  %116 = and i32 %115, 255
  %117 = shl i32 %116, 8
  %118 = or i32 %109, %117
  %119 = load i16*, i16** %8, align 8
  %120 = load i8, i8* %11, align 1
  %121 = zext i8 %120 to i64
  %122 = getelementptr inbounds i16, i16* %119, i64 %121
  %123 = load i16, i16* %122, align 2
  %124 = zext i16 %123 to i32
  %125 = and i32 %124, 255
  %126 = shl i32 %125, 16
  %127 = or i32 %118, %126
  %128 = or i32 %127, -16777216
  %129 = load i32*, i32** %9, align 8
  %130 = getelementptr inbounds i32, i32* %129, i32 1
  store i32* %130, i32** %9, align 8
  store i32 %128, i32* %129, align 4
  %131 = load i32, i32* %10, align 4
  %132 = ashr i32 %131, 5
  %133 = and i32 %132, 1
  %134 = trunc i32 %133 to i8
  store i8 %134, i8* %11, align 1
  %135 = load i16*, i16** %6, align 8
  %136 = load i8, i8* %11, align 1
  %137 = zext i8 %136 to i64
  %138 = getelementptr inbounds i16, i16* %135, i64 %137
  %139 = load i16, i16* %138, align 2
  %140 = zext i16 %139 to i32
  %141 = and i32 %140, 255
  %142 = load i16*, i16** %7, align 8
  %143 = load i8, i8* %11, align 1
  %144 = zext i8 %143 to i64
  %145 = getelementptr inbounds i16, i16* %142, i64 %144
  %146 = load i16, i16* %145, align 2
  %147 = zext i16 %146 to i32
  %148 = and i32 %147, 255
  %149 = shl i32 %148, 8
  %150 = or i32 %141, %149
  %151 = load i16*, i16** %8, align 8
  %152 = load i8, i8* %11, align 1
  %153 = zext i8 %152 to i64
  %154 = getelementptr inbounds i16, i16* %151, i64 %153
  %155 = load i16, i16* %154, align 2
  %156 = zext i16 %155 to i32
  %157 = and i32 %156, 255
  %158 = shl i32 %157, 16
  %159 = or i32 %150, %158
  %160 = or i32 %159, -16777216
  %161 = load i32*, i32** %9, align 8
  %162 = getelementptr inbounds i32, i32* %161, i32 1
  store i32* %162, i32** %9, align 8
  store i32 %160, i32* %161, align 4
  %163 = load i32, i32* %10, align 4
  %164 = ashr i32 %163, 4
  %165 = and i32 %164, 1
  %166 = trunc i32 %165 to i8
  store i8 %166, i8* %11, align 1
  %167 = load i16*, i16** %6, align 8
  %168 = load i8, i8* %11, align 1
  %169 = zext i8 %168 to i64
  %170 = getelementptr inbounds i16, i16* %167, i64 %169
  %171 = load i16, i16* %170, align 2
  %172 = zext i16 %171 to i32
  %173 = and i32 %172, 255
  %174 = load i16*, i16** %7, align 8
  %175 = load i8, i8* %11, align 1
  %176 = zext i8 %175 to i64
  %177 = getelementptr inbounds i16, i16* %174, i64 %176
  %178 = load i16, i16* %177, align 2
  %179 = zext i16 %178 to i32
  %180 = and i32 %179, 255
  %181 = shl i32 %180, 8
  %182 = or i32 %173, %181
  %183 = load i16*, i16** %8, align 8
  %184 = load i8, i8* %11, align 1
  %185 = zext i8 %184 to i64
  %186 = getelementptr inbounds i16, i16* %183, i64 %185
  %187 = load i16, i16* %186, align 2
  %188 = zext i16 %187 to i32
  %189 = and i32 %188, 255
  %190 = shl i32 %189, 16
  %191 = or i32 %182, %190
  %192 = or i32 %191, -16777216
  %193 = load i32*, i32** %9, align 8
  %194 = getelementptr inbounds i32, i32* %193, i32 1
  store i32* %194, i32** %9, align 8
  store i32 %192, i32* %193, align 4
  %195 = load i32, i32* %10, align 4
  %196 = ashr i32 %195, 3
  %197 = and i32 %196, 1
  %198 = trunc i32 %197 to i8
  store i8 %198, i8* %11, align 1
  %199 = load i16*, i16** %6, align 8
  %200 = load i8, i8* %11, align 1
  %201 = zext i8 %200 to i64
  %202 = getelementptr inbounds i16, i16* %199, i64 %201
  %203 = load i16, i16* %202, align 2
  %204 = zext i16 %203 to i32
  %205 = and i32 %204, 255
  %206 = load i16*, i16** %7, align 8
  %207 = load i8, i8* %11, align 1
  %208 = zext i8 %207 to i64
  %209 = getelementptr inbounds i16, i16* %206, i64 %208
  %210 = load i16, i16* %209, align 2
  %211 = zext i16 %210 to i32
  %212 = and i32 %211, 255
  %213 = shl i32 %212, 8
  %214 = or i32 %205, %213
  %215 = load i16*, i16** %8, align 8
  %216 = load i8, i8* %11, align 1
  %217 = zext i8 %216 to i64
  %218 = getelementptr inbounds i16, i16* %215, i64 %217
  %219 = load i16, i16* %218, align 2
  %220 = zext i16 %219 to i32
  %221 = and i32 %220, 255
  %222 = shl i32 %221, 16
  %223 = or i32 %214, %222
  %224 = or i32 %223, -16777216
  %225 = load i32*, i32** %9, align 8
  %226 = getelementptr inbounds i32, i32* %225, i32 1
  store i32* %226, i32** %9, align 8
  store i32 %224, i32* %225, align 4
  %227 = load i32, i32* %10, align 4
  %228 = ashr i32 %227, 2
  %229 = and i32 %228, 1
  %230 = trunc i32 %229 to i8
  store i8 %230, i8* %11, align 1
  %231 = load i16*, i16** %6, align 8
  %232 = load i8, i8* %11, align 1
  %233 = zext i8 %232 to i64
  %234 = getelementptr inbounds i16, i16* %231, i64 %233
  %235 = load i16, i16* %234, align 2
  %236 = zext i16 %235 to i32
  %237 = and i32 %236, 255
  %238 = load i16*, i16** %7, align 8
  %239 = load i8, i8* %11, align 1
  %240 = zext i8 %239 to i64
  %241 = getelementptr inbounds i16, i16* %238, i64 %240
  %242 = load i16, i16* %241, align 2
  %243 = zext i16 %242 to i32
  %244 = and i32 %243, 255
  %245 = shl i32 %244, 8
  %246 = or i32 %237, %245
  %247 = load i16*, i16** %8, align 8
  %248 = load i8, i8* %11, align 1
  %249 = zext i8 %248 to i64
  %250 = getelementptr inbounds i16, i16* %247, i64 %249
  %251 = load i16, i16* %250, align 2
  %252 = zext i16 %251 to i32
  %253 = and i32 %252, 255
  %254 = shl i32 %253, 16
  %255 = or i32 %246, %254
  %256 = or i32 %255, -16777216
  %257 = load i32*, i32** %9, align 8
  %258 = getelementptr inbounds i32, i32* %257, i32 1
  store i32* %258, i32** %9, align 8
  store i32 %256, i32* %257, align 4
  %259 = load i32, i32* %10, align 4
  %260 = ashr i32 %259, 1
  %261 = and i32 %260, 1
  %262 = trunc i32 %261 to i8
  store i8 %262, i8* %11, align 1
  %263 = load i16*, i16** %6, align 8
  %264 = load i8, i8* %11, align 1
  %265 = zext i8 %264 to i64
  %266 = getelementptr inbounds i16, i16* %263, i64 %265
  %267 = load i16, i16* %266, align 2
  %268 = zext i16 %267 to i32
  %269 = and i32 %268, 255
  %270 = load i16*, i16** %7, align 8
  %271 = load i8, i8* %11, align 1
  %272 = zext i8 %271 to i64
  %273 = getelementptr inbounds i16, i16* %270, i64 %272
  %274 = load i16, i16* %273, align 2
  %275 = zext i16 %274 to i32
  %276 = and i32 %275, 255
  %277 = shl i32 %276, 8
  %278 = or i32 %269, %277
  %279 = load i16*, i16** %8, align 8
  %280 = load i8, i8* %11, align 1
  %281 = zext i8 %280 to i64
  %282 = getelementptr inbounds i16, i16* %279, i64 %281
  %283 = load i16, i16* %282, align 2
  %284 = zext i16 %283 to i32
  %285 = and i32 %284, 255
  %286 = shl i32 %285, 16
  %287 = or i32 %278, %286
  %288 = or i32 %287, -16777216
  %289 = load i32*, i32** %9, align 8
  %290 = getelementptr inbounds i32, i32* %289, i32 1
  store i32* %290, i32** %9, align 8
  store i32 %288, i32* %289, align 4
  %291 = load i32, i32* %10, align 4
  %292 = and i32 %291, 1
  %293 = trunc i32 %292 to i8
  store i8 %293, i8* %11, align 1
  %294 = load i16*, i16** %6, align 8
  %295 = load i8, i8* %11, align 1
  %296 = zext i8 %295 to i64
  %297 = getelementptr inbounds i16, i16* %294, i64 %296
  %298 = load i16, i16* %297, align 2
  %299 = zext i16 %298 to i32
  %300 = and i32 %299, 255
  %301 = load i16*, i16** %7, align 8
  %302 = load i8, i8* %11, align 1
  %303 = zext i8 %302 to i64
  %304 = getelementptr inbounds i16, i16* %301, i64 %303
  %305 = load i16, i16* %304, align 2
  %306 = zext i16 %305 to i32
  %307 = and i32 %306, 255
  %308 = shl i32 %307, 8
  %309 = or i32 %300, %308
  %310 = load i16*, i16** %8, align 8
  %311 = load i8, i8* %11, align 1
  %312 = zext i8 %311 to i64
  %313 = getelementptr inbounds i16, i16* %310, i64 %312
  %314 = load i16, i16* %313, align 2
  %315 = zext i16 %314 to i32
  %316 = and i32 %315, 255
  %317 = shl i32 %316, 16
  %318 = or i32 %309, %317
  %319 = or i32 %318, -16777216
  %320 = load i32*, i32** %9, align 8
  %321 = getelementptr inbounds i32, i32* %320, i32 1
  store i32* %321, i32** %9, align 8
  store i32 %319, i32* %320, align 4
  br label %546

; <label>:322:                                    ; preds = %56
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makecmap, i64 0, i64 2)
  %323 = add i64 %pgocount3, 1
  store i64 %323, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makecmap, i64 0, i64 2)
  %324 = load i32, i32* %10, align 4
  %325 = ashr i32 %324, 6
  %326 = trunc i32 %325 to i8
  store i8 %326, i8* %11, align 1
  %327 = load i16*, i16** %6, align 8
  %328 = load i8, i8* %11, align 1
  %329 = zext i8 %328 to i64
  %330 = getelementptr inbounds i16, i16* %327, i64 %329
  %331 = load i16, i16* %330, align 2
  %332 = zext i16 %331 to i32
  %333 = and i32 %332, 255
  %334 = load i16*, i16** %7, align 8
  %335 = load i8, i8* %11, align 1
  %336 = zext i8 %335 to i64
  %337 = getelementptr inbounds i16, i16* %334, i64 %336
  %338 = load i16, i16* %337, align 2
  %339 = zext i16 %338 to i32
  %340 = and i32 %339, 255
  %341 = shl i32 %340, 8
  %342 = or i32 %333, %341
  %343 = load i16*, i16** %8, align 8
  %344 = load i8, i8* %11, align 1
  %345 = zext i8 %344 to i64
  %346 = getelementptr inbounds i16, i16* %343, i64 %345
  %347 = load i16, i16* %346, align 2
  %348 = zext i16 %347 to i32
  %349 = and i32 %348, 255
  %350 = shl i32 %349, 16
  %351 = or i32 %342, %350
  %352 = or i32 %351, -16777216
  %353 = load i32*, i32** %9, align 8
  %354 = getelementptr inbounds i32, i32* %353, i32 1
  store i32* %354, i32** %9, align 8
  store i32 %352, i32* %353, align 4
  %355 = load i32, i32* %10, align 4
  %356 = ashr i32 %355, 4
  %357 = and i32 %356, 3
  %358 = trunc i32 %357 to i8
  store i8 %358, i8* %11, align 1
  %359 = load i16*, i16** %6, align 8
  %360 = load i8, i8* %11, align 1
  %361 = zext i8 %360 to i64
  %362 = getelementptr inbounds i16, i16* %359, i64 %361
  %363 = load i16, i16* %362, align 2
  %364 = zext i16 %363 to i32
  %365 = and i32 %364, 255
  %366 = load i16*, i16** %7, align 8
  %367 = load i8, i8* %11, align 1
  %368 = zext i8 %367 to i64
  %369 = getelementptr inbounds i16, i16* %366, i64 %368
  %370 = load i16, i16* %369, align 2
  %371 = zext i16 %370 to i32
  %372 = and i32 %371, 255
  %373 = shl i32 %372, 8
  %374 = or i32 %365, %373
  %375 = load i16*, i16** %8, align 8
  %376 = load i8, i8* %11, align 1
  %377 = zext i8 %376 to i64
  %378 = getelementptr inbounds i16, i16* %375, i64 %377
  %379 = load i16, i16* %378, align 2
  %380 = zext i16 %379 to i32
  %381 = and i32 %380, 255
  %382 = shl i32 %381, 16
  %383 = or i32 %374, %382
  %384 = or i32 %383, -16777216
  %385 = load i32*, i32** %9, align 8
  %386 = getelementptr inbounds i32, i32* %385, i32 1
  store i32* %386, i32** %9, align 8
  store i32 %384, i32* %385, align 4
  %387 = load i32, i32* %10, align 4
  %388 = ashr i32 %387, 2
  %389 = and i32 %388, 3
  %390 = trunc i32 %389 to i8
  store i8 %390, i8* %11, align 1
  %391 = load i16*, i16** %6, align 8
  %392 = load i8, i8* %11, align 1
  %393 = zext i8 %392 to i64
  %394 = getelementptr inbounds i16, i16* %391, i64 %393
  %395 = load i16, i16* %394, align 2
  %396 = zext i16 %395 to i32
  %397 = and i32 %396, 255
  %398 = load i16*, i16** %7, align 8
  %399 = load i8, i8* %11, align 1
  %400 = zext i8 %399 to i64
  %401 = getelementptr inbounds i16, i16* %398, i64 %400
  %402 = load i16, i16* %401, align 2
  %403 = zext i16 %402 to i32
  %404 = and i32 %403, 255
  %405 = shl i32 %404, 8
  %406 = or i32 %397, %405
  %407 = load i16*, i16** %8, align 8
  %408 = load i8, i8* %11, align 1
  %409 = zext i8 %408 to i64
  %410 = getelementptr inbounds i16, i16* %407, i64 %409
  %411 = load i16, i16* %410, align 2
  %412 = zext i16 %411 to i32
  %413 = and i32 %412, 255
  %414 = shl i32 %413, 16
  %415 = or i32 %406, %414
  %416 = or i32 %415, -16777216
  %417 = load i32*, i32** %9, align 8
  %418 = getelementptr inbounds i32, i32* %417, i32 1
  store i32* %418, i32** %9, align 8
  store i32 %416, i32* %417, align 4
  %419 = load i32, i32* %10, align 4
  %420 = and i32 %419, 3
  %421 = trunc i32 %420 to i8
  store i8 %421, i8* %11, align 1
  %422 = load i16*, i16** %6, align 8
  %423 = load i8, i8* %11, align 1
  %424 = zext i8 %423 to i64
  %425 = getelementptr inbounds i16, i16* %422, i64 %424
  %426 = load i16, i16* %425, align 2
  %427 = zext i16 %426 to i32
  %428 = and i32 %427, 255
  %429 = load i16*, i16** %7, align 8
  %430 = load i8, i8* %11, align 1
  %431 = zext i8 %430 to i64
  %432 = getelementptr inbounds i16, i16* %429, i64 %431
  %433 = load i16, i16* %432, align 2
  %434 = zext i16 %433 to i32
  %435 = and i32 %434, 255
  %436 = shl i32 %435, 8
  %437 = or i32 %428, %436
  %438 = load i16*, i16** %8, align 8
  %439 = load i8, i8* %11, align 1
  %440 = zext i8 %439 to i64
  %441 = getelementptr inbounds i16, i16* %438, i64 %440
  %442 = load i16, i16* %441, align 2
  %443 = zext i16 %442 to i32
  %444 = and i32 %443, 255
  %445 = shl i32 %444, 16
  %446 = or i32 %437, %445
  %447 = or i32 %446, -16777216
  %448 = load i32*, i32** %9, align 8
  %449 = getelementptr inbounds i32, i32* %448, i32 1
  store i32* %449, i32** %9, align 8
  store i32 %447, i32* %448, align 4
  br label %546

; <label>:450:                                    ; preds = %56
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makecmap, i64 0, i64 3)
  %451 = add i64 %pgocount4, 1
  store i64 %451, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makecmap, i64 0, i64 3)
  %452 = load i32, i32* %10, align 4
  %453 = ashr i32 %452, 4
  %454 = trunc i32 %453 to i8
  store i8 %454, i8* %11, align 1
  %455 = load i16*, i16** %6, align 8
  %456 = load i8, i8* %11, align 1
  %457 = zext i8 %456 to i64
  %458 = getelementptr inbounds i16, i16* %455, i64 %457
  %459 = load i16, i16* %458, align 2
  %460 = zext i16 %459 to i32
  %461 = and i32 %460, 255
  %462 = load i16*, i16** %7, align 8
  %463 = load i8, i8* %11, align 1
  %464 = zext i8 %463 to i64
  %465 = getelementptr inbounds i16, i16* %462, i64 %464
  %466 = load i16, i16* %465, align 2
  %467 = zext i16 %466 to i32
  %468 = and i32 %467, 255
  %469 = shl i32 %468, 8
  %470 = or i32 %461, %469
  %471 = load i16*, i16** %8, align 8
  %472 = load i8, i8* %11, align 1
  %473 = zext i8 %472 to i64
  %474 = getelementptr inbounds i16, i16* %471, i64 %473
  %475 = load i16, i16* %474, align 2
  %476 = zext i16 %475 to i32
  %477 = and i32 %476, 255
  %478 = shl i32 %477, 16
  %479 = or i32 %470, %478
  %480 = or i32 %479, -16777216
  %481 = load i32*, i32** %9, align 8
  %482 = getelementptr inbounds i32, i32* %481, i32 1
  store i32* %482, i32** %9, align 8
  store i32 %480, i32* %481, align 4
  %483 = load i32, i32* %10, align 4
  %484 = and i32 %483, 15
  %485 = trunc i32 %484 to i8
  store i8 %485, i8* %11, align 1
  %486 = load i16*, i16** %6, align 8
  %487 = load i8, i8* %11, align 1
  %488 = zext i8 %487 to i64
  %489 = getelementptr inbounds i16, i16* %486, i64 %488
  %490 = load i16, i16* %489, align 2
  %491 = zext i16 %490 to i32
  %492 = and i32 %491, 255
  %493 = load i16*, i16** %7, align 8
  %494 = load i8, i8* %11, align 1
  %495 = zext i8 %494 to i64
  %496 = getelementptr inbounds i16, i16* %493, i64 %495
  %497 = load i16, i16* %496, align 2
  %498 = zext i16 %497 to i32
  %499 = and i32 %498, 255
  %500 = shl i32 %499, 8
  %501 = or i32 %492, %500
  %502 = load i16*, i16** %8, align 8
  %503 = load i8, i8* %11, align 1
  %504 = zext i8 %503 to i64
  %505 = getelementptr inbounds i16, i16* %502, i64 %504
  %506 = load i16, i16* %505, align 2
  %507 = zext i16 %506 to i32
  %508 = and i32 %507, 255
  %509 = shl i32 %508, 16
  %510 = or i32 %501, %509
  %511 = or i32 %510, -16777216
  %512 = load i32*, i32** %9, align 8
  %513 = getelementptr inbounds i32, i32* %512, i32 1
  store i32* %513, i32** %9, align 8
  store i32 %511, i32* %512, align 4
  br label %546

; <label>:514:                                    ; preds = %56
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makecmap, i64 0, i64 4)
  %515 = add i64 %pgocount5, 1
  store i64 %515, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makecmap, i64 0, i64 4)
  %516 = load i32, i32* %10, align 4
  %517 = trunc i32 %516 to i8
  store i8 %517, i8* %11, align 1
  %518 = load i16*, i16** %6, align 8
  %519 = load i8, i8* %11, align 1
  %520 = zext i8 %519 to i64
  %521 = getelementptr inbounds i16, i16* %518, i64 %520
  %522 = load i16, i16* %521, align 2
  %523 = zext i16 %522 to i32
  %524 = and i32 %523, 255
  %525 = load i16*, i16** %7, align 8
  %526 = load i8, i8* %11, align 1
  %527 = zext i8 %526 to i64
  %528 = getelementptr inbounds i16, i16* %525, i64 %527
  %529 = load i16, i16* %528, align 2
  %530 = zext i16 %529 to i32
  %531 = and i32 %530, 255
  %532 = shl i32 %531, 8
  %533 = or i32 %524, %532
  %534 = load i16*, i16** %8, align 8
  %535 = load i8, i8* %11, align 1
  %536 = zext i8 %535 to i64
  %537 = getelementptr inbounds i16, i16* %534, i64 %536
  %538 = load i16, i16* %537, align 2
  %539 = zext i16 %538 to i32
  %540 = and i32 %539, 255
  %541 = shl i32 %540, 16
  %542 = or i32 %533, %541
  %543 = or i32 %542, -16777216
  %544 = load i32*, i32** %9, align 8
  %545 = getelementptr inbounds i32, i32* %544, i32 1
  store i32* %545, i32** %9, align 8
  store i32 %543, i32* %544, align 4
  br label %546

; <label>:546:                                    ; preds = %514, %450, %322, %66, %56
  br label %547

; <label>:547:                                    ; preds = %546
  %548 = load i32, i32* %10, align 4
  %549 = add nsw i32 %548, 1
  store i32 %549, i32* %10, align 4
  br label %53

; <label>:550:                                    ; preds = %53
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makecmap, i64 0, i64 5)
  %551 = add i64 %pgocount6, 1
  store i64 %551, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makecmap, i64 0, i64 5)
  store i32 1, i32* %2, align 4
  br label %552

; <label>:552:                                    ; preds = %550, %41
  %553 = load i32, i32* %2, align 4
  ret i32 %553
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @makebwmap(%struct._TIFFRGBAImage*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct._TIFFRGBAImage*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %9 = alloca i8, align 1
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %3, align 8
  %10 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %11 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %10, i32 0, i32 15
  %12 = load i8*, i8** %11, align 8
  store i8* %12, i8** %4, align 8
  %13 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %14 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %13, i32 0, i32 6
  %15 = load i16, i16* %14, align 4
  %16 = zext i16 %15 to i32
  store i32 %16, i32* %5, align 4
  %17 = load i32, i32* %5, align 4
  %18 = sdiv i32 8, %17
  store i32 %18, i32* %6, align 4
  %19 = load i32, i32* %6, align 4
  %20 = mul nsw i32 256, %19
  %21 = sext i32 %20 to i64
  %22 = mul i64 %21, 4
  %23 = add i64 2048, %22
  %24 = trunc i64 %23 to i32
  %25 = call i8* @_TIFFmalloc(i32 %24)
  %26 = bitcast i8* %25 to i32**
  %27 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %28 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %27, i32 0, i32 16
  store i32** %26, i32*** %28, align 8
  %29 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %30 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %29, i32 0, i32 16
  %31 = load i32**, i32*** %30, align 8
  %32 = icmp eq i32** %31, null
  br i1 %32, label %33, label %39

; <label>:33:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makebwmap, i64 0, i64 6)
  %34 = add i64 %pgocount, 1
  store i64 %34, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makebwmap, i64 0, i64 6)
  %35 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %36 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %35, i32 0, i32 0
  %37 = load %struct.tiff*, %struct.tiff** %36, align 8
  %38 = call i8* @TIFFFileName(%struct.tiff* %37)
  call void (i8*, i8*, ...) @TIFFError(i8* %38, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.30, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %364

; <label>:39:                                     ; preds = %1
  %40 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %41 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %40, i32 0, i32 16
  %42 = load i32**, i32*** %41, align 8
  %43 = getelementptr inbounds i32*, i32** %42, i64 256
  %44 = bitcast i32** %43 to i32*
  store i32* %44, i32** %8, align 8
  store i32 0, i32* %7, align 4
  br label %45

; <label>:45:                                     ; preds = %359, %39
  %46 = load i32, i32* %7, align 4
  %47 = icmp slt i32 %46, 256
  br i1 %47, label %48, label %362

; <label>:48:                                     ; preds = %45
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makebwmap, i64 0, i64 0)
  %49 = add i64 %pgocount1, 1
  store i64 %49, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makebwmap, i64 0, i64 0)
  %50 = load i32*, i32** %8, align 8
  %51 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %3, align 8
  %52 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %51, i32 0, i32 16
  %53 = load i32**, i32*** %52, align 8
  %54 = load i32, i32* %7, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32*, i32** %53, i64 %55
  store i32* %50, i32** %56, align 8
  %57 = load i32, i32* %5, align 4
  switch i32 %57, label %358 [
    i32 1, label %58
    i32 2, label %218
    i32 4, label %298
    i32 8, label %338
  ]

; <label>:58:                                     ; preds = %48
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makebwmap, i64 0, i64 1)
  %59 = add i64 %pgocount2, 1
  store i64 %59, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makebwmap, i64 0, i64 1)
  %60 = load i8*, i8** %4, align 8
  %61 = load i32, i32* %7, align 4
  %62 = ashr i32 %61, 7
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8* %60, i64 %63
  %65 = load i8, i8* %64, align 1
  store i8 %65, i8* %9, align 1
  %66 = load i8, i8* %9, align 1
  %67 = zext i8 %66 to i32
  %68 = load i8, i8* %9, align 1
  %69 = zext i8 %68 to i32
  %70 = shl i32 %69, 8
  %71 = or i32 %67, %70
  %72 = load i8, i8* %9, align 1
  %73 = zext i8 %72 to i32
  %74 = shl i32 %73, 16
  %75 = or i32 %71, %74
  %76 = or i32 %75, -16777216
  %77 = load i32*, i32** %8, align 8
  %78 = getelementptr inbounds i32, i32* %77, i32 1
  store i32* %78, i32** %8, align 8
  store i32 %76, i32* %77, align 4
  %79 = load i8*, i8** %4, align 8
  %80 = load i32, i32* %7, align 4
  %81 = ashr i32 %80, 6
  %82 = and i32 %81, 1
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8, i8* %79, i64 %83
  %85 = load i8, i8* %84, align 1
  store i8 %85, i8* %9, align 1
  %86 = load i8, i8* %9, align 1
  %87 = zext i8 %86 to i32
  %88 = load i8, i8* %9, align 1
  %89 = zext i8 %88 to i32
  %90 = shl i32 %89, 8
  %91 = or i32 %87, %90
  %92 = load i8, i8* %9, align 1
  %93 = zext i8 %92 to i32
  %94 = shl i32 %93, 16
  %95 = or i32 %91, %94
  %96 = or i32 %95, -16777216
  %97 = load i32*, i32** %8, align 8
  %98 = getelementptr inbounds i32, i32* %97, i32 1
  store i32* %98, i32** %8, align 8
  store i32 %96, i32* %97, align 4
  %99 = load i8*, i8** %4, align 8
  %100 = load i32, i32* %7, align 4
  %101 = ashr i32 %100, 5
  %102 = and i32 %101, 1
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i8, i8* %99, i64 %103
  %105 = load i8, i8* %104, align 1
  store i8 %105, i8* %9, align 1
  %106 = load i8, i8* %9, align 1
  %107 = zext i8 %106 to i32
  %108 = load i8, i8* %9, align 1
  %109 = zext i8 %108 to i32
  %110 = shl i32 %109, 8
  %111 = or i32 %107, %110
  %112 = load i8, i8* %9, align 1
  %113 = zext i8 %112 to i32
  %114 = shl i32 %113, 16
  %115 = or i32 %111, %114
  %116 = or i32 %115, -16777216
  %117 = load i32*, i32** %8, align 8
  %118 = getelementptr inbounds i32, i32* %117, i32 1
  store i32* %118, i32** %8, align 8
  store i32 %116, i32* %117, align 4
  %119 = load i8*, i8** %4, align 8
  %120 = load i32, i32* %7, align 4
  %121 = ashr i32 %120, 4
  %122 = and i32 %121, 1
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i8, i8* %119, i64 %123
  %125 = load i8, i8* %124, align 1
  store i8 %125, i8* %9, align 1
  %126 = load i8, i8* %9, align 1
  %127 = zext i8 %126 to i32
  %128 = load i8, i8* %9, align 1
  %129 = zext i8 %128 to i32
  %130 = shl i32 %129, 8
  %131 = or i32 %127, %130
  %132 = load i8, i8* %9, align 1
  %133 = zext i8 %132 to i32
  %134 = shl i32 %133, 16
  %135 = or i32 %131, %134
  %136 = or i32 %135, -16777216
  %137 = load i32*, i32** %8, align 8
  %138 = getelementptr inbounds i32, i32* %137, i32 1
  store i32* %138, i32** %8, align 8
  store i32 %136, i32* %137, align 4
  %139 = load i8*, i8** %4, align 8
  %140 = load i32, i32* %7, align 4
  %141 = ashr i32 %140, 3
  %142 = and i32 %141, 1
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i8, i8* %139, i64 %143
  %145 = load i8, i8* %144, align 1
  store i8 %145, i8* %9, align 1
  %146 = load i8, i8* %9, align 1
  %147 = zext i8 %146 to i32
  %148 = load i8, i8* %9, align 1
  %149 = zext i8 %148 to i32
  %150 = shl i32 %149, 8
  %151 = or i32 %147, %150
  %152 = load i8, i8* %9, align 1
  %153 = zext i8 %152 to i32
  %154 = shl i32 %153, 16
  %155 = or i32 %151, %154
  %156 = or i32 %155, -16777216
  %157 = load i32*, i32** %8, align 8
  %158 = getelementptr inbounds i32, i32* %157, i32 1
  store i32* %158, i32** %8, align 8
  store i32 %156, i32* %157, align 4
  %159 = load i8*, i8** %4, align 8
  %160 = load i32, i32* %7, align 4
  %161 = ashr i32 %160, 2
  %162 = and i32 %161, 1
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i8, i8* %159, i64 %163
  %165 = load i8, i8* %164, align 1
  store i8 %165, i8* %9, align 1
  %166 = load i8, i8* %9, align 1
  %167 = zext i8 %166 to i32
  %168 = load i8, i8* %9, align 1
  %169 = zext i8 %168 to i32
  %170 = shl i32 %169, 8
  %171 = or i32 %167, %170
  %172 = load i8, i8* %9, align 1
  %173 = zext i8 %172 to i32
  %174 = shl i32 %173, 16
  %175 = or i32 %171, %174
  %176 = or i32 %175, -16777216
  %177 = load i32*, i32** %8, align 8
  %178 = getelementptr inbounds i32, i32* %177, i32 1
  store i32* %178, i32** %8, align 8
  store i32 %176, i32* %177, align 4
  %179 = load i8*, i8** %4, align 8
  %180 = load i32, i32* %7, align 4
  %181 = ashr i32 %180, 1
  %182 = and i32 %181, 1
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds i8, i8* %179, i64 %183
  %185 = load i8, i8* %184, align 1
  store i8 %185, i8* %9, align 1
  %186 = load i8, i8* %9, align 1
  %187 = zext i8 %186 to i32
  %188 = load i8, i8* %9, align 1
  %189 = zext i8 %188 to i32
  %190 = shl i32 %189, 8
  %191 = or i32 %187, %190
  %192 = load i8, i8* %9, align 1
  %193 = zext i8 %192 to i32
  %194 = shl i32 %193, 16
  %195 = or i32 %191, %194
  %196 = or i32 %195, -16777216
  %197 = load i32*, i32** %8, align 8
  %198 = getelementptr inbounds i32, i32* %197, i32 1
  store i32* %198, i32** %8, align 8
  store i32 %196, i32* %197, align 4
  %199 = load i8*, i8** %4, align 8
  %200 = load i32, i32* %7, align 4
  %201 = and i32 %200, 1
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds i8, i8* %199, i64 %202
  %204 = load i8, i8* %203, align 1
  store i8 %204, i8* %9, align 1
  %205 = load i8, i8* %9, align 1
  %206 = zext i8 %205 to i32
  %207 = load i8, i8* %9, align 1
  %208 = zext i8 %207 to i32
  %209 = shl i32 %208, 8
  %210 = or i32 %206, %209
  %211 = load i8, i8* %9, align 1
  %212 = zext i8 %211 to i32
  %213 = shl i32 %212, 16
  %214 = or i32 %210, %213
  %215 = or i32 %214, -16777216
  %216 = load i32*, i32** %8, align 8
  %217 = getelementptr inbounds i32, i32* %216, i32 1
  store i32* %217, i32** %8, align 8
  store i32 %215, i32* %216, align 4
  br label %358

; <label>:218:                                    ; preds = %48
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makebwmap, i64 0, i64 2)
  %219 = add i64 %pgocount3, 1
  store i64 %219, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makebwmap, i64 0, i64 2)
  %220 = load i8*, i8** %4, align 8
  %221 = load i32, i32* %7, align 4
  %222 = ashr i32 %221, 6
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds i8, i8* %220, i64 %223
  %225 = load i8, i8* %224, align 1
  store i8 %225, i8* %9, align 1
  %226 = load i8, i8* %9, align 1
  %227 = zext i8 %226 to i32
  %228 = load i8, i8* %9, align 1
  %229 = zext i8 %228 to i32
  %230 = shl i32 %229, 8
  %231 = or i32 %227, %230
  %232 = load i8, i8* %9, align 1
  %233 = zext i8 %232 to i32
  %234 = shl i32 %233, 16
  %235 = or i32 %231, %234
  %236 = or i32 %235, -16777216
  %237 = load i32*, i32** %8, align 8
  %238 = getelementptr inbounds i32, i32* %237, i32 1
  store i32* %238, i32** %8, align 8
  store i32 %236, i32* %237, align 4
  %239 = load i8*, i8** %4, align 8
  %240 = load i32, i32* %7, align 4
  %241 = ashr i32 %240, 4
  %242 = and i32 %241, 3
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds i8, i8* %239, i64 %243
  %245 = load i8, i8* %244, align 1
  store i8 %245, i8* %9, align 1
  %246 = load i8, i8* %9, align 1
  %247 = zext i8 %246 to i32
  %248 = load i8, i8* %9, align 1
  %249 = zext i8 %248 to i32
  %250 = shl i32 %249, 8
  %251 = or i32 %247, %250
  %252 = load i8, i8* %9, align 1
  %253 = zext i8 %252 to i32
  %254 = shl i32 %253, 16
  %255 = or i32 %251, %254
  %256 = or i32 %255, -16777216
  %257 = load i32*, i32** %8, align 8
  %258 = getelementptr inbounds i32, i32* %257, i32 1
  store i32* %258, i32** %8, align 8
  store i32 %256, i32* %257, align 4
  %259 = load i8*, i8** %4, align 8
  %260 = load i32, i32* %7, align 4
  %261 = ashr i32 %260, 2
  %262 = and i32 %261, 3
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds i8, i8* %259, i64 %263
  %265 = load i8, i8* %264, align 1
  store i8 %265, i8* %9, align 1
  %266 = load i8, i8* %9, align 1
  %267 = zext i8 %266 to i32
  %268 = load i8, i8* %9, align 1
  %269 = zext i8 %268 to i32
  %270 = shl i32 %269, 8
  %271 = or i32 %267, %270
  %272 = load i8, i8* %9, align 1
  %273 = zext i8 %272 to i32
  %274 = shl i32 %273, 16
  %275 = or i32 %271, %274
  %276 = or i32 %275, -16777216
  %277 = load i32*, i32** %8, align 8
  %278 = getelementptr inbounds i32, i32* %277, i32 1
  store i32* %278, i32** %8, align 8
  store i32 %276, i32* %277, align 4
  %279 = load i8*, i8** %4, align 8
  %280 = load i32, i32* %7, align 4
  %281 = and i32 %280, 3
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds i8, i8* %279, i64 %282
  %284 = load i8, i8* %283, align 1
  store i8 %284, i8* %9, align 1
  %285 = load i8, i8* %9, align 1
  %286 = zext i8 %285 to i32
  %287 = load i8, i8* %9, align 1
  %288 = zext i8 %287 to i32
  %289 = shl i32 %288, 8
  %290 = or i32 %286, %289
  %291 = load i8, i8* %9, align 1
  %292 = zext i8 %291 to i32
  %293 = shl i32 %292, 16
  %294 = or i32 %290, %293
  %295 = or i32 %294, -16777216
  %296 = load i32*, i32** %8, align 8
  %297 = getelementptr inbounds i32, i32* %296, i32 1
  store i32* %297, i32** %8, align 8
  store i32 %295, i32* %296, align 4
  br label %358

; <label>:298:                                    ; preds = %48
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makebwmap, i64 0, i64 3)
  %299 = add i64 %pgocount4, 1
  store i64 %299, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makebwmap, i64 0, i64 3)
  %300 = load i8*, i8** %4, align 8
  %301 = load i32, i32* %7, align 4
  %302 = ashr i32 %301, 4
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds i8, i8* %300, i64 %303
  %305 = load i8, i8* %304, align 1
  store i8 %305, i8* %9, align 1
  %306 = load i8, i8* %9, align 1
  %307 = zext i8 %306 to i32
  %308 = load i8, i8* %9, align 1
  %309 = zext i8 %308 to i32
  %310 = shl i32 %309, 8
  %311 = or i32 %307, %310
  %312 = load i8, i8* %9, align 1
  %313 = zext i8 %312 to i32
  %314 = shl i32 %313, 16
  %315 = or i32 %311, %314
  %316 = or i32 %315, -16777216
  %317 = load i32*, i32** %8, align 8
  %318 = getelementptr inbounds i32, i32* %317, i32 1
  store i32* %318, i32** %8, align 8
  store i32 %316, i32* %317, align 4
  %319 = load i8*, i8** %4, align 8
  %320 = load i32, i32* %7, align 4
  %321 = and i32 %320, 15
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds i8, i8* %319, i64 %322
  %324 = load i8, i8* %323, align 1
  store i8 %324, i8* %9, align 1
  %325 = load i8, i8* %9, align 1
  %326 = zext i8 %325 to i32
  %327 = load i8, i8* %9, align 1
  %328 = zext i8 %327 to i32
  %329 = shl i32 %328, 8
  %330 = or i32 %326, %329
  %331 = load i8, i8* %9, align 1
  %332 = zext i8 %331 to i32
  %333 = shl i32 %332, 16
  %334 = or i32 %330, %333
  %335 = or i32 %334, -16777216
  %336 = load i32*, i32** %8, align 8
  %337 = getelementptr inbounds i32, i32* %336, i32 1
  store i32* %337, i32** %8, align 8
  store i32 %335, i32* %336, align 4
  br label %358

; <label>:338:                                    ; preds = %48
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makebwmap, i64 0, i64 4)
  %339 = add i64 %pgocount5, 1
  store i64 %339, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makebwmap, i64 0, i64 4)
  %340 = load i8*, i8** %4, align 8
  %341 = load i32, i32* %7, align 4
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds i8, i8* %340, i64 %342
  %344 = load i8, i8* %343, align 1
  store i8 %344, i8* %9, align 1
  %345 = load i8, i8* %9, align 1
  %346 = zext i8 %345 to i32
  %347 = load i8, i8* %9, align 1
  %348 = zext i8 %347 to i32
  %349 = shl i32 %348, 8
  %350 = or i32 %346, %349
  %351 = load i8, i8* %9, align 1
  %352 = zext i8 %351 to i32
  %353 = shl i32 %352, 16
  %354 = or i32 %350, %353
  %355 = or i32 %354, -16777216
  %356 = load i32*, i32** %8, align 8
  %357 = getelementptr inbounds i32, i32* %356, i32 1
  store i32* %357, i32** %8, align 8
  store i32 %355, i32* %356, align 4
  br label %358

; <label>:358:                                    ; preds = %338, %298, %218, %58, %48
  br label %359

; <label>:359:                                    ; preds = %358
  %360 = load i32, i32* %7, align 4
  %361 = add nsw i32 %360, 1
  store i32 %361, i32* %7, align 4
  br label %45

; <label>:362:                                    ; preds = %45
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makebwmap, i64 0, i64 5)
  %363 = add i64 %pgocount6, 1
  store i64 %363, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_makebwmap, i64 0, i64 5)
  store i32 1, i32* %2, align 4
  br label %364

; <label>:364:                                    ; preds = %362, %33
  %365 = load i32, i32* %2, align 4
  ret i32 %365
}

; Function Attrs: noinline nounwind uwtable
define internal void @TIFFYCbCrToRGBInit(%struct.TIFFYCbCrToRGB*, %struct.tiff*) #0 {
  %3 = alloca %struct.TIFFYCbCrToRGB*, align 8
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca float*, align 8
  %7 = alloca i32, align 4
  %8 = alloca float, align 4
  %9 = alloca i32, align 4
  %10 = alloca float, align 4
  %11 = alloca i32, align 4
  %12 = alloca float, align 4
  %13 = alloca i32, align 4
  %14 = alloca float, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store %struct.TIFFYCbCrToRGB* %0, %struct.TIFFYCbCrToRGB** %3, align 8
  store %struct.tiff* %1, %struct.tiff** %4, align 8
  %17 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %3, align 8
  %18 = bitcast %struct.TIFFYCbCrToRGB* %17 to i8*
  %19 = getelementptr inbounds i8, i8* %18, i64 56
  store i8* %19, i8** %5, align 8
  %20 = load i8*, i8** %5, align 8
  call void @_TIFFmemset(i8* %20, i32 0, i32 256)
  %21 = load i8*, i8** %5, align 8
  %22 = getelementptr inbounds i8, i8* %21, i64 256
  store i8* %22, i8** %5, align 8
  %23 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %3, align 8
  %24 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %23, i32 0, i32 0
  store i8* %22, i8** %24, align 8
  store i32 0, i32* %7, align 4
  br label %25

; <label>:25:                                     ; preds = %35, %2
  %26 = load i32, i32* %7, align 4
  %27 = icmp slt i32 %26, 256
  br i1 %27, label %28, label %39

; <label>:28:                                     ; preds = %25
  %29 = load i32, i32* %7, align 4
  %30 = trunc i32 %29 to i8
  %31 = load i8*, i8** %5, align 8
  %32 = load i32, i32* %7, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8, i8* %31, i64 %33
  store i8 %30, i8* %34, align 1
  br label %35

; <label>:35:                                     ; preds = %28
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFYCbCrToRGBInit, i64 0, i64 0)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFYCbCrToRGBInit, i64 0, i64 0)
  %37 = load i32, i32* %7, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %7, align 4
  br label %25

; <label>:39:                                     ; preds = %25
  %40 = load i8*, i8** %5, align 8
  %41 = getelementptr inbounds i8, i8* %40, i64 256
  call void @_TIFFmemset(i8* %41, i32 255, i32 512)
  %42 = load %struct.tiff*, %struct.tiff** %4, align 8
  %43 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %42, i32 529, float** %6)
  %44 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %3, align 8
  %45 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %44, i32 0, i32 5
  %46 = getelementptr inbounds [3 x float], [3 x float]* %45, i32 0, i32 0
  %47 = bitcast float* %46 to i8*
  %48 = load float*, float** %6, align 8
  %49 = bitcast float* %48 to i8*
  call void @_TIFFmemcpy(i8* %47, i8* %49, i32 12)
  %50 = load float*, float** %6, align 8
  %51 = getelementptr inbounds float, float* %50, i64 0
  %52 = load float, float* %51, align 4
  %53 = fmul float 2.000000e+00, %52
  %54 = fsub float 2.000000e+00, %53
  store float %54, float* %8, align 4
  %55 = load float, float* %8, align 4
  %56 = fmul float %55, 6.553600e+04
  %57 = fpext float %56 to double
  %58 = fadd double %57, 5.000000e-01
  %59 = fptosi double %58 to i32
  store i32 %59, i32* %9, align 4
  %60 = load float*, float** %6, align 8
  %61 = getelementptr inbounds float, float* %60, i64 0
  %62 = load float, float* %61, align 4
  %63 = load float, float* %8, align 4
  %64 = fmul float %62, %63
  %65 = load float*, float** %6, align 8
  %66 = getelementptr inbounds float, float* %65, i64 1
  %67 = load float, float* %66, align 4
  %68 = fdiv float %64, %67
  store float %68, float* %10, align 4
  %69 = load float, float* %10, align 4
  %70 = fmul float %69, 6.553600e+04
  %71 = fpext float %70 to double
  %72 = fadd double %71, 5.000000e-01
  %73 = fptosi double %72 to i32
  %74 = sub nsw i32 0, %73
  store i32 %74, i32* %11, align 4
  %75 = load float*, float** %6, align 8
  %76 = getelementptr inbounds float, float* %75, i64 2
  %77 = load float, float* %76, align 4
  %78 = fmul float 2.000000e+00, %77
  %79 = fsub float 2.000000e+00, %78
  store float %79, float* %12, align 4
  %80 = load float, float* %12, align 4
  %81 = fmul float %80, 6.553600e+04
  %82 = fpext float %81 to double
  %83 = fadd double %82, 5.000000e-01
  %84 = fptosi double %83 to i32
  store i32 %84, i32* %13, align 4
  %85 = load float*, float** %6, align 8
  %86 = getelementptr inbounds float, float* %85, i64 2
  %87 = load float, float* %86, align 4
  %88 = load float, float* %12, align 4
  %89 = fmul float %87, %88
  %90 = load float*, float** %6, align 8
  %91 = getelementptr inbounds float, float* %90, i64 1
  %92 = load float, float* %91, align 4
  %93 = fdiv float %89, %92
  store float %93, float* %14, align 4
  %94 = load float, float* %14, align 4
  %95 = fmul float %94, 6.553600e+04
  %96 = fpext float %95 to double
  %97 = fadd double %96, 5.000000e-01
  %98 = fptosi double %97 to i32
  %99 = sub nsw i32 0, %98
  store i32 %99, i32* %15, align 4
  %100 = load i8*, i8** %5, align 8
  %101 = getelementptr inbounds i8, i8* %100, i64 768
  %102 = bitcast i8* %101 to i32*
  %103 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %3, align 8
  %104 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %103, i32 0, i32 1
  store i32* %102, i32** %104, align 8
  %105 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %3, align 8
  %106 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %105, i32 0, i32 1
  %107 = load i32*, i32** %106, align 8
  %108 = getelementptr inbounds i32, i32* %107, i64 256
  %109 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %3, align 8
  %110 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %109, i32 0, i32 2
  store i32* %108, i32** %110, align 8
  %111 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %3, align 8
  %112 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %111, i32 0, i32 2
  %113 = load i32*, i32** %112, align 8
  %114 = getelementptr inbounds i32, i32* %113, i64 256
  %115 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %3, align 8
  %116 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %115, i32 0, i32 3
  store i32* %114, i32** %116, align 8
  %117 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %3, align 8
  %118 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %117, i32 0, i32 3
  %119 = load i32*, i32** %118, align 8
  %120 = getelementptr inbounds i32, i32* %119, i64 256
  %121 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %3, align 8
  %122 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %121, i32 0, i32 4
  store i32* %120, i32** %122, align 8
  store i32 0, i32* %7, align 4
  store i32 -128, i32* %16, align 4
  br label %123

; <label>:123:                                    ; preds = %168, %39
  %124 = load i32, i32* %7, align 4
  %125 = icmp slt i32 %124, 256
  br i1 %125, label %126, label %174

; <label>:126:                                    ; preds = %123
  %127 = load i32, i32* %9, align 4
  %128 = load i32, i32* %16, align 4
  %129 = mul nsw i32 %127, %128
  %130 = add nsw i32 %129, 32768
  %131 = ashr i32 %130, 16
  %132 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %3, align 8
  %133 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %132, i32 0, i32 1
  %134 = load i32*, i32** %133, align 8
  %135 = load i32, i32* %7, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i32, i32* %134, i64 %136
  store i32 %131, i32* %137, align 4
  %138 = load i32, i32* %13, align 4
  %139 = load i32, i32* %16, align 4
  %140 = mul nsw i32 %138, %139
  %141 = add nsw i32 %140, 32768
  %142 = ashr i32 %141, 16
  %143 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %3, align 8
  %144 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %143, i32 0, i32 2
  %145 = load i32*, i32** %144, align 8
  %146 = load i32, i32* %7, align 4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds i32, i32* %145, i64 %147
  store i32 %142, i32* %148, align 4
  %149 = load i32, i32* %11, align 4
  %150 = load i32, i32* %16, align 4
  %151 = mul nsw i32 %149, %150
  %152 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %3, align 8
  %153 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %152, i32 0, i32 3
  %154 = load i32*, i32** %153, align 8
  %155 = load i32, i32* %7, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i32, i32* %154, i64 %156
  store i32 %151, i32* %157, align 4
  %158 = load i32, i32* %15, align 4
  %159 = load i32, i32* %16, align 4
  %160 = mul nsw i32 %158, %159
  %161 = add nsw i32 %160, 32768
  %162 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %3, align 8
  %163 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %162, i32 0, i32 4
  %164 = load i32*, i32** %163, align 8
  %165 = load i32, i32* %7, align 4
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds i32, i32* %164, i64 %166
  store i32 %161, i32* %167, align 4
  br label %168

; <label>:168:                                    ; preds = %126
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFYCbCrToRGBInit, i64 0, i64 1)
  %169 = add i64 %pgocount1, 1
  store i64 %169, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFYCbCrToRGBInit, i64 0, i64 1)
  %170 = load i32, i32* %7, align 4
  %171 = add nsw i32 %170, 1
  store i32 %171, i32* %7, align 4
  %172 = load i32, i32* %16, align 4
  %173 = add nsw i32 %172, 1
  store i32 %173, i32* %16, align 4
  br label %123

; <label>:174:                                    ; preds = %123
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFYCbCrToRGBInit, i64 0, i64 2)
  %175 = add i64 %pgocount2, 1
  store i64 %175, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFYCbCrToRGBInit, i64 0, i64 2)
  ret void
}

declare i32 @_TIFFmemcmp(i8*, i8*, i32) #2

; Function Attrs: noinline nounwind uwtable
define internal void @putcontig8bitYCbCr44tile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca %struct.TIFFYCbCrToRGB*, align 8
  %20 = alloca i32*, align 8
  %21 = alloca i32*, align 8
  %22 = alloca i32*, align 8
  %23 = alloca i32*, align 8
  %24 = alloca i8*, align 8
  %25 = alloca i32*, align 8
  %26 = alloca i32*, align 8
  %27 = alloca i32*, align 8
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca i32, align 4
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  %46 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %47 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %48 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %47, i32 0, i32 18
  %49 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %48, align 8
  store %struct.TIFFYCbCrToRGB* %49, %struct.TIFFYCbCrToRGB** %19, align 8
  %50 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %51 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %50, i32 0, i32 1
  %52 = load i32*, i32** %51, align 8
  store i32* %52, i32** %20, align 8
  %53 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %54 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %53, i32 0, i32 2
  %55 = load i32*, i32** %54, align 8
  store i32* %55, i32** %21, align 8
  %56 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %57 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %56, i32 0, i32 3
  %58 = load i32*, i32** %57, align 8
  store i32* %58, i32** %22, align 8
  %59 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %60 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %59, i32 0, i32 4
  %61 = load i32*, i32** %60, align 8
  store i32* %61, i32** %23, align 8
  %62 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %63 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %62, i32 0, i32 0
  %64 = load i8*, i8** %63, align 8
  store i8* %64, i8** %24, align 8
  %65 = load i32*, i32** %11, align 8
  %66 = load i32, i32* %14, align 4
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32* %65, i64 %67
  %69 = load i32, i32* %17, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32* %68, i64 %70
  store i32* %71, i32** %25, align 8
  %72 = load i32*, i32** %25, align 8
  %73 = load i32, i32* %14, align 4
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32* %72, i64 %74
  %76 = load i32, i32* %17, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32* %75, i64 %77
  store i32* %78, i32** %26, align 8
  %79 = load i32*, i32** %26, align 8
  %80 = load i32, i32* %14, align 4
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32* %79, i64 %81
  %83 = load i32, i32* %17, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32* %82, i64 %84
  store i32* %85, i32** %27, align 8
  %86 = load i32, i32* %14, align 4
  %87 = mul i32 3, %86
  %88 = load i32, i32* %17, align 4
  %89 = mul nsw i32 4, %88
  %90 = add i32 %87, %89
  store i32 %90, i32* %28, align 4
  %91 = load i32, i32* %13, align 4
  br label %92

; <label>:92:                                     ; preds = %1008, %9
  %93 = load i32, i32* %15, align 4
  %94 = icmp uge i32 %93, 4
  br i1 %94, label %95, label %1011

; <label>:95:                                     ; preds = %92
  %96 = load i32, i32* %14, align 4
  %97 = lshr i32 %96, 2
  store i32 %97, i32* %12, align 4
  br label %98

; <label>:98:                                     ; preds = %982, %95
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr44tile, i64 0, i64 0)
  %99 = add i64 %pgocount, 1
  store i64 %99, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr44tile, i64 0, i64 0)
  %100 = load i8*, i8** %18, align 8
  %101 = getelementptr inbounds i8, i8* %100, i64 16
  %102 = load i8, i8* %101, align 1
  %103 = zext i8 %102 to i32
  store i32 %103, i32* %29, align 4
  %104 = load i8*, i8** %18, align 8
  %105 = getelementptr inbounds i8, i8* %104, i64 17
  %106 = load i8, i8* %105, align 1
  %107 = zext i8 %106 to i32
  store i32 %107, i32* %30, align 4
  %108 = load i8*, i8** %18, align 8
  %109 = getelementptr inbounds i8, i8* %108, i64 0
  %110 = load i8, i8* %109, align 1
  %111 = zext i8 %110 to i32
  store i32 %111, i32* %31, align 4
  %112 = load i8*, i8** %24, align 8
  %113 = load i32, i32* %31, align 4
  %114 = load i32*, i32** %20, align 8
  %115 = load i32, i32* %30, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32* %114, i64 %116
  %118 = load i32, i32* %117, align 4
  %119 = add nsw i32 %113, %118
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i8, i8* %112, i64 %120
  %122 = load i8, i8* %121, align 1
  %123 = zext i8 %122 to i32
  %124 = load i8*, i8** %24, align 8
  %125 = load i32, i32* %31, align 4
  %126 = load i32*, i32** %23, align 8
  %127 = load i32, i32* %29, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32* %126, i64 %128
  %130 = load i32, i32* %129, align 4
  %131 = load i32*, i32** %22, align 8
  %132 = load i32, i32* %30, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i32, i32* %131, i64 %133
  %135 = load i32, i32* %134, align 4
  %136 = add nsw i32 %130, %135
  %137 = ashr i32 %136, 16
  %138 = add nsw i32 %125, %137
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i8, i8* %124, i64 %139
  %141 = load i8, i8* %140, align 1
  %142 = zext i8 %141 to i32
  %143 = shl i32 %142, 8
  %144 = or i32 %123, %143
  %145 = load i8*, i8** %24, align 8
  %146 = load i32, i32* %31, align 4
  %147 = load i32*, i32** %21, align 8
  %148 = load i32, i32* %29, align 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds i32, i32* %147, i64 %149
  %151 = load i32, i32* %150, align 4
  %152 = add nsw i32 %146, %151
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i8, i8* %145, i64 %153
  %155 = load i8, i8* %154, align 1
  %156 = zext i8 %155 to i32
  %157 = shl i32 %156, 16
  %158 = or i32 %144, %157
  %159 = or i32 %158, -16777216
  %160 = load i32*, i32** %11, align 8
  %161 = getelementptr inbounds i32, i32* %160, i64 0
  store i32 %159, i32* %161, align 4
  %162 = load i8*, i8** %18, align 8
  %163 = getelementptr inbounds i8, i8* %162, i64 1
  %164 = load i8, i8* %163, align 1
  %165 = zext i8 %164 to i32
  store i32 %165, i32* %32, align 4
  %166 = load i8*, i8** %24, align 8
  %167 = load i32, i32* %32, align 4
  %168 = load i32*, i32** %20, align 8
  %169 = load i32, i32* %30, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds i32, i32* %168, i64 %170
  %172 = load i32, i32* %171, align 4
  %173 = add nsw i32 %167, %172
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds i8, i8* %166, i64 %174
  %176 = load i8, i8* %175, align 1
  %177 = zext i8 %176 to i32
  %178 = load i8*, i8** %24, align 8
  %179 = load i32, i32* %32, align 4
  %180 = load i32*, i32** %23, align 8
  %181 = load i32, i32* %29, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i32, i32* %180, i64 %182
  %184 = load i32, i32* %183, align 4
  %185 = load i32*, i32** %22, align 8
  %186 = load i32, i32* %30, align 4
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i32, i32* %185, i64 %187
  %189 = load i32, i32* %188, align 4
  %190 = add nsw i32 %184, %189
  %191 = ashr i32 %190, 16
  %192 = add nsw i32 %179, %191
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds i8, i8* %178, i64 %193
  %195 = load i8, i8* %194, align 1
  %196 = zext i8 %195 to i32
  %197 = shl i32 %196, 8
  %198 = or i32 %177, %197
  %199 = load i8*, i8** %24, align 8
  %200 = load i32, i32* %32, align 4
  %201 = load i32*, i32** %21, align 8
  %202 = load i32, i32* %29, align 4
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds i32, i32* %201, i64 %203
  %205 = load i32, i32* %204, align 4
  %206 = add nsw i32 %200, %205
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds i8, i8* %199, i64 %207
  %209 = load i8, i8* %208, align 1
  %210 = zext i8 %209 to i32
  %211 = shl i32 %210, 16
  %212 = or i32 %198, %211
  %213 = or i32 %212, -16777216
  %214 = load i32*, i32** %11, align 8
  %215 = getelementptr inbounds i32, i32* %214, i64 1
  store i32 %213, i32* %215, align 4
  %216 = load i8*, i8** %18, align 8
  %217 = getelementptr inbounds i8, i8* %216, i64 2
  %218 = load i8, i8* %217, align 1
  %219 = zext i8 %218 to i32
  store i32 %219, i32* %33, align 4
  %220 = load i8*, i8** %24, align 8
  %221 = load i32, i32* %33, align 4
  %222 = load i32*, i32** %20, align 8
  %223 = load i32, i32* %30, align 4
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds i32, i32* %222, i64 %224
  %226 = load i32, i32* %225, align 4
  %227 = add nsw i32 %221, %226
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds i8, i8* %220, i64 %228
  %230 = load i8, i8* %229, align 1
  %231 = zext i8 %230 to i32
  %232 = load i8*, i8** %24, align 8
  %233 = load i32, i32* %33, align 4
  %234 = load i32*, i32** %23, align 8
  %235 = load i32, i32* %29, align 4
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds i32, i32* %234, i64 %236
  %238 = load i32, i32* %237, align 4
  %239 = load i32*, i32** %22, align 8
  %240 = load i32, i32* %30, align 4
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds i32, i32* %239, i64 %241
  %243 = load i32, i32* %242, align 4
  %244 = add nsw i32 %238, %243
  %245 = ashr i32 %244, 16
  %246 = add nsw i32 %233, %245
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds i8, i8* %232, i64 %247
  %249 = load i8, i8* %248, align 1
  %250 = zext i8 %249 to i32
  %251 = shl i32 %250, 8
  %252 = or i32 %231, %251
  %253 = load i8*, i8** %24, align 8
  %254 = load i32, i32* %33, align 4
  %255 = load i32*, i32** %21, align 8
  %256 = load i32, i32* %29, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds i32, i32* %255, i64 %257
  %259 = load i32, i32* %258, align 4
  %260 = add nsw i32 %254, %259
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds i8, i8* %253, i64 %261
  %263 = load i8, i8* %262, align 1
  %264 = zext i8 %263 to i32
  %265 = shl i32 %264, 16
  %266 = or i32 %252, %265
  %267 = or i32 %266, -16777216
  %268 = load i32*, i32** %11, align 8
  %269 = getelementptr inbounds i32, i32* %268, i64 2
  store i32 %267, i32* %269, align 4
  %270 = load i8*, i8** %18, align 8
  %271 = getelementptr inbounds i8, i8* %270, i64 3
  %272 = load i8, i8* %271, align 1
  %273 = zext i8 %272 to i32
  store i32 %273, i32* %34, align 4
  %274 = load i8*, i8** %24, align 8
  %275 = load i32, i32* %34, align 4
  %276 = load i32*, i32** %20, align 8
  %277 = load i32, i32* %30, align 4
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds i32, i32* %276, i64 %278
  %280 = load i32, i32* %279, align 4
  %281 = add nsw i32 %275, %280
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds i8, i8* %274, i64 %282
  %284 = load i8, i8* %283, align 1
  %285 = zext i8 %284 to i32
  %286 = load i8*, i8** %24, align 8
  %287 = load i32, i32* %34, align 4
  %288 = load i32*, i32** %23, align 8
  %289 = load i32, i32* %29, align 4
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds i32, i32* %288, i64 %290
  %292 = load i32, i32* %291, align 4
  %293 = load i32*, i32** %22, align 8
  %294 = load i32, i32* %30, align 4
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds i32, i32* %293, i64 %295
  %297 = load i32, i32* %296, align 4
  %298 = add nsw i32 %292, %297
  %299 = ashr i32 %298, 16
  %300 = add nsw i32 %287, %299
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds i8, i8* %286, i64 %301
  %303 = load i8, i8* %302, align 1
  %304 = zext i8 %303 to i32
  %305 = shl i32 %304, 8
  %306 = or i32 %285, %305
  %307 = load i8*, i8** %24, align 8
  %308 = load i32, i32* %34, align 4
  %309 = load i32*, i32** %21, align 8
  %310 = load i32, i32* %29, align 4
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds i32, i32* %309, i64 %311
  %313 = load i32, i32* %312, align 4
  %314 = add nsw i32 %308, %313
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds i8, i8* %307, i64 %315
  %317 = load i8, i8* %316, align 1
  %318 = zext i8 %317 to i32
  %319 = shl i32 %318, 16
  %320 = or i32 %306, %319
  %321 = or i32 %320, -16777216
  %322 = load i32*, i32** %11, align 8
  %323 = getelementptr inbounds i32, i32* %322, i64 3
  store i32 %321, i32* %323, align 4
  %324 = load i8*, i8** %18, align 8
  %325 = getelementptr inbounds i8, i8* %324, i64 4
  %326 = load i8, i8* %325, align 1
  %327 = zext i8 %326 to i32
  store i32 %327, i32* %35, align 4
  %328 = load i8*, i8** %24, align 8
  %329 = load i32, i32* %35, align 4
  %330 = load i32*, i32** %20, align 8
  %331 = load i32, i32* %30, align 4
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds i32, i32* %330, i64 %332
  %334 = load i32, i32* %333, align 4
  %335 = add nsw i32 %329, %334
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds i8, i8* %328, i64 %336
  %338 = load i8, i8* %337, align 1
  %339 = zext i8 %338 to i32
  %340 = load i8*, i8** %24, align 8
  %341 = load i32, i32* %35, align 4
  %342 = load i32*, i32** %23, align 8
  %343 = load i32, i32* %29, align 4
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds i32, i32* %342, i64 %344
  %346 = load i32, i32* %345, align 4
  %347 = load i32*, i32** %22, align 8
  %348 = load i32, i32* %30, align 4
  %349 = sext i32 %348 to i64
  %350 = getelementptr inbounds i32, i32* %347, i64 %349
  %351 = load i32, i32* %350, align 4
  %352 = add nsw i32 %346, %351
  %353 = ashr i32 %352, 16
  %354 = add nsw i32 %341, %353
  %355 = sext i32 %354 to i64
  %356 = getelementptr inbounds i8, i8* %340, i64 %355
  %357 = load i8, i8* %356, align 1
  %358 = zext i8 %357 to i32
  %359 = shl i32 %358, 8
  %360 = or i32 %339, %359
  %361 = load i8*, i8** %24, align 8
  %362 = load i32, i32* %35, align 4
  %363 = load i32*, i32** %21, align 8
  %364 = load i32, i32* %29, align 4
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds i32, i32* %363, i64 %365
  %367 = load i32, i32* %366, align 4
  %368 = add nsw i32 %362, %367
  %369 = sext i32 %368 to i64
  %370 = getelementptr inbounds i8, i8* %361, i64 %369
  %371 = load i8, i8* %370, align 1
  %372 = zext i8 %371 to i32
  %373 = shl i32 %372, 16
  %374 = or i32 %360, %373
  %375 = or i32 %374, -16777216
  %376 = load i32*, i32** %25, align 8
  %377 = getelementptr inbounds i32, i32* %376, i64 0
  store i32 %375, i32* %377, align 4
  %378 = load i8*, i8** %18, align 8
  %379 = getelementptr inbounds i8, i8* %378, i64 5
  %380 = load i8, i8* %379, align 1
  %381 = zext i8 %380 to i32
  store i32 %381, i32* %36, align 4
  %382 = load i8*, i8** %24, align 8
  %383 = load i32, i32* %36, align 4
  %384 = load i32*, i32** %20, align 8
  %385 = load i32, i32* %30, align 4
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds i32, i32* %384, i64 %386
  %388 = load i32, i32* %387, align 4
  %389 = add nsw i32 %383, %388
  %390 = sext i32 %389 to i64
  %391 = getelementptr inbounds i8, i8* %382, i64 %390
  %392 = load i8, i8* %391, align 1
  %393 = zext i8 %392 to i32
  %394 = load i8*, i8** %24, align 8
  %395 = load i32, i32* %36, align 4
  %396 = load i32*, i32** %23, align 8
  %397 = load i32, i32* %29, align 4
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds i32, i32* %396, i64 %398
  %400 = load i32, i32* %399, align 4
  %401 = load i32*, i32** %22, align 8
  %402 = load i32, i32* %30, align 4
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds i32, i32* %401, i64 %403
  %405 = load i32, i32* %404, align 4
  %406 = add nsw i32 %400, %405
  %407 = ashr i32 %406, 16
  %408 = add nsw i32 %395, %407
  %409 = sext i32 %408 to i64
  %410 = getelementptr inbounds i8, i8* %394, i64 %409
  %411 = load i8, i8* %410, align 1
  %412 = zext i8 %411 to i32
  %413 = shl i32 %412, 8
  %414 = or i32 %393, %413
  %415 = load i8*, i8** %24, align 8
  %416 = load i32, i32* %36, align 4
  %417 = load i32*, i32** %21, align 8
  %418 = load i32, i32* %29, align 4
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds i32, i32* %417, i64 %419
  %421 = load i32, i32* %420, align 4
  %422 = add nsw i32 %416, %421
  %423 = sext i32 %422 to i64
  %424 = getelementptr inbounds i8, i8* %415, i64 %423
  %425 = load i8, i8* %424, align 1
  %426 = zext i8 %425 to i32
  %427 = shl i32 %426, 16
  %428 = or i32 %414, %427
  %429 = or i32 %428, -16777216
  %430 = load i32*, i32** %25, align 8
  %431 = getelementptr inbounds i32, i32* %430, i64 1
  store i32 %429, i32* %431, align 4
  %432 = load i8*, i8** %18, align 8
  %433 = getelementptr inbounds i8, i8* %432, i64 6
  %434 = load i8, i8* %433, align 1
  %435 = zext i8 %434 to i32
  store i32 %435, i32* %37, align 4
  %436 = load i8*, i8** %24, align 8
  %437 = load i32, i32* %37, align 4
  %438 = load i32*, i32** %20, align 8
  %439 = load i32, i32* %30, align 4
  %440 = sext i32 %439 to i64
  %441 = getelementptr inbounds i32, i32* %438, i64 %440
  %442 = load i32, i32* %441, align 4
  %443 = add nsw i32 %437, %442
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds i8, i8* %436, i64 %444
  %446 = load i8, i8* %445, align 1
  %447 = zext i8 %446 to i32
  %448 = load i8*, i8** %24, align 8
  %449 = load i32, i32* %37, align 4
  %450 = load i32*, i32** %23, align 8
  %451 = load i32, i32* %29, align 4
  %452 = sext i32 %451 to i64
  %453 = getelementptr inbounds i32, i32* %450, i64 %452
  %454 = load i32, i32* %453, align 4
  %455 = load i32*, i32** %22, align 8
  %456 = load i32, i32* %30, align 4
  %457 = sext i32 %456 to i64
  %458 = getelementptr inbounds i32, i32* %455, i64 %457
  %459 = load i32, i32* %458, align 4
  %460 = add nsw i32 %454, %459
  %461 = ashr i32 %460, 16
  %462 = add nsw i32 %449, %461
  %463 = sext i32 %462 to i64
  %464 = getelementptr inbounds i8, i8* %448, i64 %463
  %465 = load i8, i8* %464, align 1
  %466 = zext i8 %465 to i32
  %467 = shl i32 %466, 8
  %468 = or i32 %447, %467
  %469 = load i8*, i8** %24, align 8
  %470 = load i32, i32* %37, align 4
  %471 = load i32*, i32** %21, align 8
  %472 = load i32, i32* %29, align 4
  %473 = sext i32 %472 to i64
  %474 = getelementptr inbounds i32, i32* %471, i64 %473
  %475 = load i32, i32* %474, align 4
  %476 = add nsw i32 %470, %475
  %477 = sext i32 %476 to i64
  %478 = getelementptr inbounds i8, i8* %469, i64 %477
  %479 = load i8, i8* %478, align 1
  %480 = zext i8 %479 to i32
  %481 = shl i32 %480, 16
  %482 = or i32 %468, %481
  %483 = or i32 %482, -16777216
  %484 = load i32*, i32** %25, align 8
  %485 = getelementptr inbounds i32, i32* %484, i64 2
  store i32 %483, i32* %485, align 4
  %486 = load i8*, i8** %18, align 8
  %487 = getelementptr inbounds i8, i8* %486, i64 7
  %488 = load i8, i8* %487, align 1
  %489 = zext i8 %488 to i32
  store i32 %489, i32* %38, align 4
  %490 = load i8*, i8** %24, align 8
  %491 = load i32, i32* %38, align 4
  %492 = load i32*, i32** %20, align 8
  %493 = load i32, i32* %30, align 4
  %494 = sext i32 %493 to i64
  %495 = getelementptr inbounds i32, i32* %492, i64 %494
  %496 = load i32, i32* %495, align 4
  %497 = add nsw i32 %491, %496
  %498 = sext i32 %497 to i64
  %499 = getelementptr inbounds i8, i8* %490, i64 %498
  %500 = load i8, i8* %499, align 1
  %501 = zext i8 %500 to i32
  %502 = load i8*, i8** %24, align 8
  %503 = load i32, i32* %38, align 4
  %504 = load i32*, i32** %23, align 8
  %505 = load i32, i32* %29, align 4
  %506 = sext i32 %505 to i64
  %507 = getelementptr inbounds i32, i32* %504, i64 %506
  %508 = load i32, i32* %507, align 4
  %509 = load i32*, i32** %22, align 8
  %510 = load i32, i32* %30, align 4
  %511 = sext i32 %510 to i64
  %512 = getelementptr inbounds i32, i32* %509, i64 %511
  %513 = load i32, i32* %512, align 4
  %514 = add nsw i32 %508, %513
  %515 = ashr i32 %514, 16
  %516 = add nsw i32 %503, %515
  %517 = sext i32 %516 to i64
  %518 = getelementptr inbounds i8, i8* %502, i64 %517
  %519 = load i8, i8* %518, align 1
  %520 = zext i8 %519 to i32
  %521 = shl i32 %520, 8
  %522 = or i32 %501, %521
  %523 = load i8*, i8** %24, align 8
  %524 = load i32, i32* %38, align 4
  %525 = load i32*, i32** %21, align 8
  %526 = load i32, i32* %29, align 4
  %527 = sext i32 %526 to i64
  %528 = getelementptr inbounds i32, i32* %525, i64 %527
  %529 = load i32, i32* %528, align 4
  %530 = add nsw i32 %524, %529
  %531 = sext i32 %530 to i64
  %532 = getelementptr inbounds i8, i8* %523, i64 %531
  %533 = load i8, i8* %532, align 1
  %534 = zext i8 %533 to i32
  %535 = shl i32 %534, 16
  %536 = or i32 %522, %535
  %537 = or i32 %536, -16777216
  %538 = load i32*, i32** %25, align 8
  %539 = getelementptr inbounds i32, i32* %538, i64 3
  store i32 %537, i32* %539, align 4
  %540 = load i8*, i8** %18, align 8
  %541 = getelementptr inbounds i8, i8* %540, i64 8
  %542 = load i8, i8* %541, align 1
  %543 = zext i8 %542 to i32
  store i32 %543, i32* %39, align 4
  %544 = load i8*, i8** %24, align 8
  %545 = load i32, i32* %39, align 4
  %546 = load i32*, i32** %20, align 8
  %547 = load i32, i32* %30, align 4
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds i32, i32* %546, i64 %548
  %550 = load i32, i32* %549, align 4
  %551 = add nsw i32 %545, %550
  %552 = sext i32 %551 to i64
  %553 = getelementptr inbounds i8, i8* %544, i64 %552
  %554 = load i8, i8* %553, align 1
  %555 = zext i8 %554 to i32
  %556 = load i8*, i8** %24, align 8
  %557 = load i32, i32* %39, align 4
  %558 = load i32*, i32** %23, align 8
  %559 = load i32, i32* %29, align 4
  %560 = sext i32 %559 to i64
  %561 = getelementptr inbounds i32, i32* %558, i64 %560
  %562 = load i32, i32* %561, align 4
  %563 = load i32*, i32** %22, align 8
  %564 = load i32, i32* %30, align 4
  %565 = sext i32 %564 to i64
  %566 = getelementptr inbounds i32, i32* %563, i64 %565
  %567 = load i32, i32* %566, align 4
  %568 = add nsw i32 %562, %567
  %569 = ashr i32 %568, 16
  %570 = add nsw i32 %557, %569
  %571 = sext i32 %570 to i64
  %572 = getelementptr inbounds i8, i8* %556, i64 %571
  %573 = load i8, i8* %572, align 1
  %574 = zext i8 %573 to i32
  %575 = shl i32 %574, 8
  %576 = or i32 %555, %575
  %577 = load i8*, i8** %24, align 8
  %578 = load i32, i32* %39, align 4
  %579 = load i32*, i32** %21, align 8
  %580 = load i32, i32* %29, align 4
  %581 = sext i32 %580 to i64
  %582 = getelementptr inbounds i32, i32* %579, i64 %581
  %583 = load i32, i32* %582, align 4
  %584 = add nsw i32 %578, %583
  %585 = sext i32 %584 to i64
  %586 = getelementptr inbounds i8, i8* %577, i64 %585
  %587 = load i8, i8* %586, align 1
  %588 = zext i8 %587 to i32
  %589 = shl i32 %588, 16
  %590 = or i32 %576, %589
  %591 = or i32 %590, -16777216
  %592 = load i32*, i32** %26, align 8
  %593 = getelementptr inbounds i32, i32* %592, i64 0
  store i32 %591, i32* %593, align 4
  %594 = load i8*, i8** %18, align 8
  %595 = getelementptr inbounds i8, i8* %594, i64 9
  %596 = load i8, i8* %595, align 1
  %597 = zext i8 %596 to i32
  store i32 %597, i32* %40, align 4
  %598 = load i8*, i8** %24, align 8
  %599 = load i32, i32* %40, align 4
  %600 = load i32*, i32** %20, align 8
  %601 = load i32, i32* %30, align 4
  %602 = sext i32 %601 to i64
  %603 = getelementptr inbounds i32, i32* %600, i64 %602
  %604 = load i32, i32* %603, align 4
  %605 = add nsw i32 %599, %604
  %606 = sext i32 %605 to i64
  %607 = getelementptr inbounds i8, i8* %598, i64 %606
  %608 = load i8, i8* %607, align 1
  %609 = zext i8 %608 to i32
  %610 = load i8*, i8** %24, align 8
  %611 = load i32, i32* %40, align 4
  %612 = load i32*, i32** %23, align 8
  %613 = load i32, i32* %29, align 4
  %614 = sext i32 %613 to i64
  %615 = getelementptr inbounds i32, i32* %612, i64 %614
  %616 = load i32, i32* %615, align 4
  %617 = load i32*, i32** %22, align 8
  %618 = load i32, i32* %30, align 4
  %619 = sext i32 %618 to i64
  %620 = getelementptr inbounds i32, i32* %617, i64 %619
  %621 = load i32, i32* %620, align 4
  %622 = add nsw i32 %616, %621
  %623 = ashr i32 %622, 16
  %624 = add nsw i32 %611, %623
  %625 = sext i32 %624 to i64
  %626 = getelementptr inbounds i8, i8* %610, i64 %625
  %627 = load i8, i8* %626, align 1
  %628 = zext i8 %627 to i32
  %629 = shl i32 %628, 8
  %630 = or i32 %609, %629
  %631 = load i8*, i8** %24, align 8
  %632 = load i32, i32* %40, align 4
  %633 = load i32*, i32** %21, align 8
  %634 = load i32, i32* %29, align 4
  %635 = sext i32 %634 to i64
  %636 = getelementptr inbounds i32, i32* %633, i64 %635
  %637 = load i32, i32* %636, align 4
  %638 = add nsw i32 %632, %637
  %639 = sext i32 %638 to i64
  %640 = getelementptr inbounds i8, i8* %631, i64 %639
  %641 = load i8, i8* %640, align 1
  %642 = zext i8 %641 to i32
  %643 = shl i32 %642, 16
  %644 = or i32 %630, %643
  %645 = or i32 %644, -16777216
  %646 = load i32*, i32** %26, align 8
  %647 = getelementptr inbounds i32, i32* %646, i64 1
  store i32 %645, i32* %647, align 4
  %648 = load i8*, i8** %18, align 8
  %649 = getelementptr inbounds i8, i8* %648, i64 10
  %650 = load i8, i8* %649, align 1
  %651 = zext i8 %650 to i32
  store i32 %651, i32* %41, align 4
  %652 = load i8*, i8** %24, align 8
  %653 = load i32, i32* %41, align 4
  %654 = load i32*, i32** %20, align 8
  %655 = load i32, i32* %30, align 4
  %656 = sext i32 %655 to i64
  %657 = getelementptr inbounds i32, i32* %654, i64 %656
  %658 = load i32, i32* %657, align 4
  %659 = add nsw i32 %653, %658
  %660 = sext i32 %659 to i64
  %661 = getelementptr inbounds i8, i8* %652, i64 %660
  %662 = load i8, i8* %661, align 1
  %663 = zext i8 %662 to i32
  %664 = load i8*, i8** %24, align 8
  %665 = load i32, i32* %41, align 4
  %666 = load i32*, i32** %23, align 8
  %667 = load i32, i32* %29, align 4
  %668 = sext i32 %667 to i64
  %669 = getelementptr inbounds i32, i32* %666, i64 %668
  %670 = load i32, i32* %669, align 4
  %671 = load i32*, i32** %22, align 8
  %672 = load i32, i32* %30, align 4
  %673 = sext i32 %672 to i64
  %674 = getelementptr inbounds i32, i32* %671, i64 %673
  %675 = load i32, i32* %674, align 4
  %676 = add nsw i32 %670, %675
  %677 = ashr i32 %676, 16
  %678 = add nsw i32 %665, %677
  %679 = sext i32 %678 to i64
  %680 = getelementptr inbounds i8, i8* %664, i64 %679
  %681 = load i8, i8* %680, align 1
  %682 = zext i8 %681 to i32
  %683 = shl i32 %682, 8
  %684 = or i32 %663, %683
  %685 = load i8*, i8** %24, align 8
  %686 = load i32, i32* %41, align 4
  %687 = load i32*, i32** %21, align 8
  %688 = load i32, i32* %29, align 4
  %689 = sext i32 %688 to i64
  %690 = getelementptr inbounds i32, i32* %687, i64 %689
  %691 = load i32, i32* %690, align 4
  %692 = add nsw i32 %686, %691
  %693 = sext i32 %692 to i64
  %694 = getelementptr inbounds i8, i8* %685, i64 %693
  %695 = load i8, i8* %694, align 1
  %696 = zext i8 %695 to i32
  %697 = shl i32 %696, 16
  %698 = or i32 %684, %697
  %699 = or i32 %698, -16777216
  %700 = load i32*, i32** %26, align 8
  %701 = getelementptr inbounds i32, i32* %700, i64 2
  store i32 %699, i32* %701, align 4
  %702 = load i8*, i8** %18, align 8
  %703 = getelementptr inbounds i8, i8* %702, i64 11
  %704 = load i8, i8* %703, align 1
  %705 = zext i8 %704 to i32
  store i32 %705, i32* %42, align 4
  %706 = load i8*, i8** %24, align 8
  %707 = load i32, i32* %42, align 4
  %708 = load i32*, i32** %20, align 8
  %709 = load i32, i32* %30, align 4
  %710 = sext i32 %709 to i64
  %711 = getelementptr inbounds i32, i32* %708, i64 %710
  %712 = load i32, i32* %711, align 4
  %713 = add nsw i32 %707, %712
  %714 = sext i32 %713 to i64
  %715 = getelementptr inbounds i8, i8* %706, i64 %714
  %716 = load i8, i8* %715, align 1
  %717 = zext i8 %716 to i32
  %718 = load i8*, i8** %24, align 8
  %719 = load i32, i32* %42, align 4
  %720 = load i32*, i32** %23, align 8
  %721 = load i32, i32* %29, align 4
  %722 = sext i32 %721 to i64
  %723 = getelementptr inbounds i32, i32* %720, i64 %722
  %724 = load i32, i32* %723, align 4
  %725 = load i32*, i32** %22, align 8
  %726 = load i32, i32* %30, align 4
  %727 = sext i32 %726 to i64
  %728 = getelementptr inbounds i32, i32* %725, i64 %727
  %729 = load i32, i32* %728, align 4
  %730 = add nsw i32 %724, %729
  %731 = ashr i32 %730, 16
  %732 = add nsw i32 %719, %731
  %733 = sext i32 %732 to i64
  %734 = getelementptr inbounds i8, i8* %718, i64 %733
  %735 = load i8, i8* %734, align 1
  %736 = zext i8 %735 to i32
  %737 = shl i32 %736, 8
  %738 = or i32 %717, %737
  %739 = load i8*, i8** %24, align 8
  %740 = load i32, i32* %42, align 4
  %741 = load i32*, i32** %21, align 8
  %742 = load i32, i32* %29, align 4
  %743 = sext i32 %742 to i64
  %744 = getelementptr inbounds i32, i32* %741, i64 %743
  %745 = load i32, i32* %744, align 4
  %746 = add nsw i32 %740, %745
  %747 = sext i32 %746 to i64
  %748 = getelementptr inbounds i8, i8* %739, i64 %747
  %749 = load i8, i8* %748, align 1
  %750 = zext i8 %749 to i32
  %751 = shl i32 %750, 16
  %752 = or i32 %738, %751
  %753 = or i32 %752, -16777216
  %754 = load i32*, i32** %26, align 8
  %755 = getelementptr inbounds i32, i32* %754, i64 3
  store i32 %753, i32* %755, align 4
  %756 = load i8*, i8** %18, align 8
  %757 = getelementptr inbounds i8, i8* %756, i64 12
  %758 = load i8, i8* %757, align 1
  %759 = zext i8 %758 to i32
  store i32 %759, i32* %43, align 4
  %760 = load i8*, i8** %24, align 8
  %761 = load i32, i32* %43, align 4
  %762 = load i32*, i32** %20, align 8
  %763 = load i32, i32* %30, align 4
  %764 = sext i32 %763 to i64
  %765 = getelementptr inbounds i32, i32* %762, i64 %764
  %766 = load i32, i32* %765, align 4
  %767 = add nsw i32 %761, %766
  %768 = sext i32 %767 to i64
  %769 = getelementptr inbounds i8, i8* %760, i64 %768
  %770 = load i8, i8* %769, align 1
  %771 = zext i8 %770 to i32
  %772 = load i8*, i8** %24, align 8
  %773 = load i32, i32* %43, align 4
  %774 = load i32*, i32** %23, align 8
  %775 = load i32, i32* %29, align 4
  %776 = sext i32 %775 to i64
  %777 = getelementptr inbounds i32, i32* %774, i64 %776
  %778 = load i32, i32* %777, align 4
  %779 = load i32*, i32** %22, align 8
  %780 = load i32, i32* %30, align 4
  %781 = sext i32 %780 to i64
  %782 = getelementptr inbounds i32, i32* %779, i64 %781
  %783 = load i32, i32* %782, align 4
  %784 = add nsw i32 %778, %783
  %785 = ashr i32 %784, 16
  %786 = add nsw i32 %773, %785
  %787 = sext i32 %786 to i64
  %788 = getelementptr inbounds i8, i8* %772, i64 %787
  %789 = load i8, i8* %788, align 1
  %790 = zext i8 %789 to i32
  %791 = shl i32 %790, 8
  %792 = or i32 %771, %791
  %793 = load i8*, i8** %24, align 8
  %794 = load i32, i32* %43, align 4
  %795 = load i32*, i32** %21, align 8
  %796 = load i32, i32* %29, align 4
  %797 = sext i32 %796 to i64
  %798 = getelementptr inbounds i32, i32* %795, i64 %797
  %799 = load i32, i32* %798, align 4
  %800 = add nsw i32 %794, %799
  %801 = sext i32 %800 to i64
  %802 = getelementptr inbounds i8, i8* %793, i64 %801
  %803 = load i8, i8* %802, align 1
  %804 = zext i8 %803 to i32
  %805 = shl i32 %804, 16
  %806 = or i32 %792, %805
  %807 = or i32 %806, -16777216
  %808 = load i32*, i32** %27, align 8
  %809 = getelementptr inbounds i32, i32* %808, i64 0
  store i32 %807, i32* %809, align 4
  %810 = load i8*, i8** %18, align 8
  %811 = getelementptr inbounds i8, i8* %810, i64 13
  %812 = load i8, i8* %811, align 1
  %813 = zext i8 %812 to i32
  store i32 %813, i32* %44, align 4
  %814 = load i8*, i8** %24, align 8
  %815 = load i32, i32* %44, align 4
  %816 = load i32*, i32** %20, align 8
  %817 = load i32, i32* %30, align 4
  %818 = sext i32 %817 to i64
  %819 = getelementptr inbounds i32, i32* %816, i64 %818
  %820 = load i32, i32* %819, align 4
  %821 = add nsw i32 %815, %820
  %822 = sext i32 %821 to i64
  %823 = getelementptr inbounds i8, i8* %814, i64 %822
  %824 = load i8, i8* %823, align 1
  %825 = zext i8 %824 to i32
  %826 = load i8*, i8** %24, align 8
  %827 = load i32, i32* %44, align 4
  %828 = load i32*, i32** %23, align 8
  %829 = load i32, i32* %29, align 4
  %830 = sext i32 %829 to i64
  %831 = getelementptr inbounds i32, i32* %828, i64 %830
  %832 = load i32, i32* %831, align 4
  %833 = load i32*, i32** %22, align 8
  %834 = load i32, i32* %30, align 4
  %835 = sext i32 %834 to i64
  %836 = getelementptr inbounds i32, i32* %833, i64 %835
  %837 = load i32, i32* %836, align 4
  %838 = add nsw i32 %832, %837
  %839 = ashr i32 %838, 16
  %840 = add nsw i32 %827, %839
  %841 = sext i32 %840 to i64
  %842 = getelementptr inbounds i8, i8* %826, i64 %841
  %843 = load i8, i8* %842, align 1
  %844 = zext i8 %843 to i32
  %845 = shl i32 %844, 8
  %846 = or i32 %825, %845
  %847 = load i8*, i8** %24, align 8
  %848 = load i32, i32* %44, align 4
  %849 = load i32*, i32** %21, align 8
  %850 = load i32, i32* %29, align 4
  %851 = sext i32 %850 to i64
  %852 = getelementptr inbounds i32, i32* %849, i64 %851
  %853 = load i32, i32* %852, align 4
  %854 = add nsw i32 %848, %853
  %855 = sext i32 %854 to i64
  %856 = getelementptr inbounds i8, i8* %847, i64 %855
  %857 = load i8, i8* %856, align 1
  %858 = zext i8 %857 to i32
  %859 = shl i32 %858, 16
  %860 = or i32 %846, %859
  %861 = or i32 %860, -16777216
  %862 = load i32*, i32** %27, align 8
  %863 = getelementptr inbounds i32, i32* %862, i64 1
  store i32 %861, i32* %863, align 4
  %864 = load i8*, i8** %18, align 8
  %865 = getelementptr inbounds i8, i8* %864, i64 14
  %866 = load i8, i8* %865, align 1
  %867 = zext i8 %866 to i32
  store i32 %867, i32* %45, align 4
  %868 = load i8*, i8** %24, align 8
  %869 = load i32, i32* %45, align 4
  %870 = load i32*, i32** %20, align 8
  %871 = load i32, i32* %30, align 4
  %872 = sext i32 %871 to i64
  %873 = getelementptr inbounds i32, i32* %870, i64 %872
  %874 = load i32, i32* %873, align 4
  %875 = add nsw i32 %869, %874
  %876 = sext i32 %875 to i64
  %877 = getelementptr inbounds i8, i8* %868, i64 %876
  %878 = load i8, i8* %877, align 1
  %879 = zext i8 %878 to i32
  %880 = load i8*, i8** %24, align 8
  %881 = load i32, i32* %45, align 4
  %882 = load i32*, i32** %23, align 8
  %883 = load i32, i32* %29, align 4
  %884 = sext i32 %883 to i64
  %885 = getelementptr inbounds i32, i32* %882, i64 %884
  %886 = load i32, i32* %885, align 4
  %887 = load i32*, i32** %22, align 8
  %888 = load i32, i32* %30, align 4
  %889 = sext i32 %888 to i64
  %890 = getelementptr inbounds i32, i32* %887, i64 %889
  %891 = load i32, i32* %890, align 4
  %892 = add nsw i32 %886, %891
  %893 = ashr i32 %892, 16
  %894 = add nsw i32 %881, %893
  %895 = sext i32 %894 to i64
  %896 = getelementptr inbounds i8, i8* %880, i64 %895
  %897 = load i8, i8* %896, align 1
  %898 = zext i8 %897 to i32
  %899 = shl i32 %898, 8
  %900 = or i32 %879, %899
  %901 = load i8*, i8** %24, align 8
  %902 = load i32, i32* %45, align 4
  %903 = load i32*, i32** %21, align 8
  %904 = load i32, i32* %29, align 4
  %905 = sext i32 %904 to i64
  %906 = getelementptr inbounds i32, i32* %903, i64 %905
  %907 = load i32, i32* %906, align 4
  %908 = add nsw i32 %902, %907
  %909 = sext i32 %908 to i64
  %910 = getelementptr inbounds i8, i8* %901, i64 %909
  %911 = load i8, i8* %910, align 1
  %912 = zext i8 %911 to i32
  %913 = shl i32 %912, 16
  %914 = or i32 %900, %913
  %915 = or i32 %914, -16777216
  %916 = load i32*, i32** %27, align 8
  %917 = getelementptr inbounds i32, i32* %916, i64 2
  store i32 %915, i32* %917, align 4
  %918 = load i8*, i8** %18, align 8
  %919 = getelementptr inbounds i8, i8* %918, i64 15
  %920 = load i8, i8* %919, align 1
  %921 = zext i8 %920 to i32
  store i32 %921, i32* %46, align 4
  %922 = load i8*, i8** %24, align 8
  %923 = load i32, i32* %46, align 4
  %924 = load i32*, i32** %20, align 8
  %925 = load i32, i32* %30, align 4
  %926 = sext i32 %925 to i64
  %927 = getelementptr inbounds i32, i32* %924, i64 %926
  %928 = load i32, i32* %927, align 4
  %929 = add nsw i32 %923, %928
  %930 = sext i32 %929 to i64
  %931 = getelementptr inbounds i8, i8* %922, i64 %930
  %932 = load i8, i8* %931, align 1
  %933 = zext i8 %932 to i32
  %934 = load i8*, i8** %24, align 8
  %935 = load i32, i32* %46, align 4
  %936 = load i32*, i32** %23, align 8
  %937 = load i32, i32* %29, align 4
  %938 = sext i32 %937 to i64
  %939 = getelementptr inbounds i32, i32* %936, i64 %938
  %940 = load i32, i32* %939, align 4
  %941 = load i32*, i32** %22, align 8
  %942 = load i32, i32* %30, align 4
  %943 = sext i32 %942 to i64
  %944 = getelementptr inbounds i32, i32* %941, i64 %943
  %945 = load i32, i32* %944, align 4
  %946 = add nsw i32 %940, %945
  %947 = ashr i32 %946, 16
  %948 = add nsw i32 %935, %947
  %949 = sext i32 %948 to i64
  %950 = getelementptr inbounds i8, i8* %934, i64 %949
  %951 = load i8, i8* %950, align 1
  %952 = zext i8 %951 to i32
  %953 = shl i32 %952, 8
  %954 = or i32 %933, %953
  %955 = load i8*, i8** %24, align 8
  %956 = load i32, i32* %46, align 4
  %957 = load i32*, i32** %21, align 8
  %958 = load i32, i32* %29, align 4
  %959 = sext i32 %958 to i64
  %960 = getelementptr inbounds i32, i32* %957, i64 %959
  %961 = load i32, i32* %960, align 4
  %962 = add nsw i32 %956, %961
  %963 = sext i32 %962 to i64
  %964 = getelementptr inbounds i8, i8* %955, i64 %963
  %965 = load i8, i8* %964, align 1
  %966 = zext i8 %965 to i32
  %967 = shl i32 %966, 16
  %968 = or i32 %954, %967
  %969 = or i32 %968, -16777216
  %970 = load i32*, i32** %27, align 8
  %971 = getelementptr inbounds i32, i32* %970, i64 3
  store i32 %969, i32* %971, align 4
  %972 = load i32*, i32** %11, align 8
  %973 = getelementptr inbounds i32, i32* %972, i64 4
  store i32* %973, i32** %11, align 8
  %974 = load i32*, i32** %25, align 8
  %975 = getelementptr inbounds i32, i32* %974, i64 4
  store i32* %975, i32** %25, align 8
  %976 = load i32*, i32** %26, align 8
  %977 = getelementptr inbounds i32, i32* %976, i64 4
  store i32* %977, i32** %26, align 8
  %978 = load i32*, i32** %27, align 8
  %979 = getelementptr inbounds i32, i32* %978, i64 4
  store i32* %979, i32** %27, align 8
  %980 = load i8*, i8** %18, align 8
  %981 = getelementptr inbounds i8, i8* %980, i64 18
  store i8* %981, i8** %18, align 8
  br label %982

; <label>:982:                                    ; preds = %98
  %983 = load i32, i32* %12, align 4
  %984 = add i32 %983, -1
  store i32 %984, i32* %12, align 4
  %985 = icmp ne i32 %984, 0
  br i1 %985, label %98, label %986

; <label>:986:                                    ; preds = %982
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr44tile, i64 0, i64 1)
  %987 = add i64 %pgocount1, 1
  store i64 %987, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr44tile, i64 0, i64 1)
  %988 = load i32, i32* %28, align 4
  %989 = load i32*, i32** %11, align 8
  %990 = sext i32 %988 to i64
  %991 = getelementptr inbounds i32, i32* %989, i64 %990
  store i32* %991, i32** %11, align 8
  %992 = load i32, i32* %28, align 4
  %993 = load i32*, i32** %25, align 8
  %994 = sext i32 %992 to i64
  %995 = getelementptr inbounds i32, i32* %993, i64 %994
  store i32* %995, i32** %25, align 8
  %996 = load i32, i32* %28, align 4
  %997 = load i32*, i32** %26, align 8
  %998 = sext i32 %996 to i64
  %999 = getelementptr inbounds i32, i32* %997, i64 %998
  store i32* %999, i32** %26, align 8
  %1000 = load i32, i32* %28, align 4
  %1001 = load i32*, i32** %27, align 8
  %1002 = sext i32 %1000 to i64
  %1003 = getelementptr inbounds i32, i32* %1001, i64 %1002
  store i32* %1003, i32** %27, align 8
  %1004 = load i32, i32* %16, align 4
  %1005 = load i8*, i8** %18, align 8
  %1006 = sext i32 %1004 to i64
  %1007 = getelementptr inbounds i8, i8* %1005, i64 %1006
  store i8* %1007, i8** %18, align 8
  br label %1008

; <label>:1008:                                   ; preds = %986
  %1009 = load i32, i32* %15, align 4
  %1010 = sub i32 %1009, 4
  store i32 %1010, i32* %15, align 4
  br label %92

; <label>:1011:                                   ; preds = %92
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr44tile, i64 0, i64 2)
  %1012 = add i64 %pgocount2, 1
  store i64 %1012, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr44tile, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putcontig8bitYCbCr42tile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca %struct.TIFFYCbCrToRGB*, align 8
  %20 = alloca i32*, align 8
  %21 = alloca i32*, align 8
  %22 = alloca i32*, align 8
  %23 = alloca i32*, align 8
  %24 = alloca i8*, align 8
  %25 = alloca i32*, align 8
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %37 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %38 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %37, i32 0, i32 18
  %39 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %38, align 8
  store %struct.TIFFYCbCrToRGB* %39, %struct.TIFFYCbCrToRGB** %19, align 8
  %40 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %41 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %40, i32 0, i32 1
  %42 = load i32*, i32** %41, align 8
  store i32* %42, i32** %20, align 8
  %43 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %44 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %43, i32 0, i32 2
  %45 = load i32*, i32** %44, align 8
  store i32* %45, i32** %21, align 8
  %46 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %47 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %46, i32 0, i32 3
  %48 = load i32*, i32** %47, align 8
  store i32* %48, i32** %22, align 8
  %49 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %50 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %49, i32 0, i32 4
  %51 = load i32*, i32** %50, align 8
  store i32* %51, i32** %23, align 8
  %52 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %53 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %52, i32 0, i32 0
  %54 = load i8*, i8** %53, align 8
  store i8* %54, i8** %24, align 8
  %55 = load i32*, i32** %11, align 8
  %56 = load i32, i32* %14, align 4
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32* %55, i64 %57
  %59 = load i32, i32* %17, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32* %58, i64 %60
  store i32* %61, i32** %25, align 8
  %62 = load i32, i32* %17, align 4
  %63 = mul nsw i32 2, %62
  %64 = load i32, i32* %14, align 4
  %65 = add i32 %63, %64
  store i32 %65, i32* %26, align 4
  %66 = load i32, i32* %13, align 4
  br label %67

; <label>:67:                                     ; preds = %539, %9
  %68 = load i32, i32* %15, align 4
  %69 = icmp uge i32 %68, 2
  br i1 %69, label %70, label %542

; <label>:70:                                     ; preds = %67
  %71 = load i32, i32* %14, align 4
  %72 = lshr i32 %71, 2
  store i32 %72, i32* %12, align 4
  br label %73

; <label>:73:                                     ; preds = %521, %70
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr42tile, i64 0, i64 0)
  %74 = add i64 %pgocount, 1
  store i64 %74, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr42tile, i64 0, i64 0)
  %75 = load i8*, i8** %18, align 8
  %76 = getelementptr inbounds i8, i8* %75, i64 8
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  store i32 %78, i32* %27, align 4
  %79 = load i8*, i8** %18, align 8
  %80 = getelementptr inbounds i8, i8* %79, i64 9
  %81 = load i8, i8* %80, align 1
  %82 = zext i8 %81 to i32
  store i32 %82, i32* %28, align 4
  %83 = load i8*, i8** %18, align 8
  %84 = getelementptr inbounds i8, i8* %83, i64 0
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i32
  store i32 %86, i32* %29, align 4
  %87 = load i8*, i8** %24, align 8
  %88 = load i32, i32* %29, align 4
  %89 = load i32*, i32** %20, align 8
  %90 = load i32, i32* %28, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32* %89, i64 %91
  %93 = load i32, i32* %92, align 4
  %94 = add nsw i32 %88, %93
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i8, i8* %87, i64 %95
  %97 = load i8, i8* %96, align 1
  %98 = zext i8 %97 to i32
  %99 = load i8*, i8** %24, align 8
  %100 = load i32, i32* %29, align 4
  %101 = load i32*, i32** %23, align 8
  %102 = load i32, i32* %27, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32* %101, i64 %103
  %105 = load i32, i32* %104, align 4
  %106 = load i32*, i32** %22, align 8
  %107 = load i32, i32* %28, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i32, i32* %106, i64 %108
  %110 = load i32, i32* %109, align 4
  %111 = add nsw i32 %105, %110
  %112 = ashr i32 %111, 16
  %113 = add nsw i32 %100, %112
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i8, i8* %99, i64 %114
  %116 = load i8, i8* %115, align 1
  %117 = zext i8 %116 to i32
  %118 = shl i32 %117, 8
  %119 = or i32 %98, %118
  %120 = load i8*, i8** %24, align 8
  %121 = load i32, i32* %29, align 4
  %122 = load i32*, i32** %21, align 8
  %123 = load i32, i32* %27, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i32, i32* %122, i64 %124
  %126 = load i32, i32* %125, align 4
  %127 = add nsw i32 %121, %126
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i8, i8* %120, i64 %128
  %130 = load i8, i8* %129, align 1
  %131 = zext i8 %130 to i32
  %132 = shl i32 %131, 16
  %133 = or i32 %119, %132
  %134 = or i32 %133, -16777216
  %135 = load i32*, i32** %11, align 8
  %136 = getelementptr inbounds i32, i32* %135, i64 0
  store i32 %134, i32* %136, align 4
  %137 = load i8*, i8** %18, align 8
  %138 = getelementptr inbounds i8, i8* %137, i64 1
  %139 = load i8, i8* %138, align 1
  %140 = zext i8 %139 to i32
  store i32 %140, i32* %30, align 4
  %141 = load i8*, i8** %24, align 8
  %142 = load i32, i32* %30, align 4
  %143 = load i32*, i32** %20, align 8
  %144 = load i32, i32* %28, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i32, i32* %143, i64 %145
  %147 = load i32, i32* %146, align 4
  %148 = add nsw i32 %142, %147
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds i8, i8* %141, i64 %149
  %151 = load i8, i8* %150, align 1
  %152 = zext i8 %151 to i32
  %153 = load i8*, i8** %24, align 8
  %154 = load i32, i32* %30, align 4
  %155 = load i32*, i32** %23, align 8
  %156 = load i32, i32* %27, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds i32, i32* %155, i64 %157
  %159 = load i32, i32* %158, align 4
  %160 = load i32*, i32** %22, align 8
  %161 = load i32, i32* %28, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds i32, i32* %160, i64 %162
  %164 = load i32, i32* %163, align 4
  %165 = add nsw i32 %159, %164
  %166 = ashr i32 %165, 16
  %167 = add nsw i32 %154, %166
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i8, i8* %153, i64 %168
  %170 = load i8, i8* %169, align 1
  %171 = zext i8 %170 to i32
  %172 = shl i32 %171, 8
  %173 = or i32 %152, %172
  %174 = load i8*, i8** %24, align 8
  %175 = load i32, i32* %30, align 4
  %176 = load i32*, i32** %21, align 8
  %177 = load i32, i32* %27, align 4
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i32, i32* %176, i64 %178
  %180 = load i32, i32* %179, align 4
  %181 = add nsw i32 %175, %180
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i8, i8* %174, i64 %182
  %184 = load i8, i8* %183, align 1
  %185 = zext i8 %184 to i32
  %186 = shl i32 %185, 16
  %187 = or i32 %173, %186
  %188 = or i32 %187, -16777216
  %189 = load i32*, i32** %11, align 8
  %190 = getelementptr inbounds i32, i32* %189, i64 1
  store i32 %188, i32* %190, align 4
  %191 = load i8*, i8** %18, align 8
  %192 = getelementptr inbounds i8, i8* %191, i64 2
  %193 = load i8, i8* %192, align 1
  %194 = zext i8 %193 to i32
  store i32 %194, i32* %31, align 4
  %195 = load i8*, i8** %24, align 8
  %196 = load i32, i32* %31, align 4
  %197 = load i32*, i32** %20, align 8
  %198 = load i32, i32* %28, align 4
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds i32, i32* %197, i64 %199
  %201 = load i32, i32* %200, align 4
  %202 = add nsw i32 %196, %201
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds i8, i8* %195, i64 %203
  %205 = load i8, i8* %204, align 1
  %206 = zext i8 %205 to i32
  %207 = load i8*, i8** %24, align 8
  %208 = load i32, i32* %31, align 4
  %209 = load i32*, i32** %23, align 8
  %210 = load i32, i32* %27, align 4
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds i32, i32* %209, i64 %211
  %213 = load i32, i32* %212, align 4
  %214 = load i32*, i32** %22, align 8
  %215 = load i32, i32* %28, align 4
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds i32, i32* %214, i64 %216
  %218 = load i32, i32* %217, align 4
  %219 = add nsw i32 %213, %218
  %220 = ashr i32 %219, 16
  %221 = add nsw i32 %208, %220
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds i8, i8* %207, i64 %222
  %224 = load i8, i8* %223, align 1
  %225 = zext i8 %224 to i32
  %226 = shl i32 %225, 8
  %227 = or i32 %206, %226
  %228 = load i8*, i8** %24, align 8
  %229 = load i32, i32* %31, align 4
  %230 = load i32*, i32** %21, align 8
  %231 = load i32, i32* %27, align 4
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds i32, i32* %230, i64 %232
  %234 = load i32, i32* %233, align 4
  %235 = add nsw i32 %229, %234
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds i8, i8* %228, i64 %236
  %238 = load i8, i8* %237, align 1
  %239 = zext i8 %238 to i32
  %240 = shl i32 %239, 16
  %241 = or i32 %227, %240
  %242 = or i32 %241, -16777216
  %243 = load i32*, i32** %11, align 8
  %244 = getelementptr inbounds i32, i32* %243, i64 2
  store i32 %242, i32* %244, align 4
  %245 = load i8*, i8** %18, align 8
  %246 = getelementptr inbounds i8, i8* %245, i64 3
  %247 = load i8, i8* %246, align 1
  %248 = zext i8 %247 to i32
  store i32 %248, i32* %32, align 4
  %249 = load i8*, i8** %24, align 8
  %250 = load i32, i32* %32, align 4
  %251 = load i32*, i32** %20, align 8
  %252 = load i32, i32* %28, align 4
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds i32, i32* %251, i64 %253
  %255 = load i32, i32* %254, align 4
  %256 = add nsw i32 %250, %255
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds i8, i8* %249, i64 %257
  %259 = load i8, i8* %258, align 1
  %260 = zext i8 %259 to i32
  %261 = load i8*, i8** %24, align 8
  %262 = load i32, i32* %32, align 4
  %263 = load i32*, i32** %23, align 8
  %264 = load i32, i32* %27, align 4
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds i32, i32* %263, i64 %265
  %267 = load i32, i32* %266, align 4
  %268 = load i32*, i32** %22, align 8
  %269 = load i32, i32* %28, align 4
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds i32, i32* %268, i64 %270
  %272 = load i32, i32* %271, align 4
  %273 = add nsw i32 %267, %272
  %274 = ashr i32 %273, 16
  %275 = add nsw i32 %262, %274
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds i8, i8* %261, i64 %276
  %278 = load i8, i8* %277, align 1
  %279 = zext i8 %278 to i32
  %280 = shl i32 %279, 8
  %281 = or i32 %260, %280
  %282 = load i8*, i8** %24, align 8
  %283 = load i32, i32* %32, align 4
  %284 = load i32*, i32** %21, align 8
  %285 = load i32, i32* %27, align 4
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds i32, i32* %284, i64 %286
  %288 = load i32, i32* %287, align 4
  %289 = add nsw i32 %283, %288
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds i8, i8* %282, i64 %290
  %292 = load i8, i8* %291, align 1
  %293 = zext i8 %292 to i32
  %294 = shl i32 %293, 16
  %295 = or i32 %281, %294
  %296 = or i32 %295, -16777216
  %297 = load i32*, i32** %11, align 8
  %298 = getelementptr inbounds i32, i32* %297, i64 3
  store i32 %296, i32* %298, align 4
  %299 = load i8*, i8** %18, align 8
  %300 = getelementptr inbounds i8, i8* %299, i64 4
  %301 = load i8, i8* %300, align 1
  %302 = zext i8 %301 to i32
  store i32 %302, i32* %33, align 4
  %303 = load i8*, i8** %24, align 8
  %304 = load i32, i32* %33, align 4
  %305 = load i32*, i32** %20, align 8
  %306 = load i32, i32* %28, align 4
  %307 = sext i32 %306 to i64
  %308 = getelementptr inbounds i32, i32* %305, i64 %307
  %309 = load i32, i32* %308, align 4
  %310 = add nsw i32 %304, %309
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds i8, i8* %303, i64 %311
  %313 = load i8, i8* %312, align 1
  %314 = zext i8 %313 to i32
  %315 = load i8*, i8** %24, align 8
  %316 = load i32, i32* %33, align 4
  %317 = load i32*, i32** %23, align 8
  %318 = load i32, i32* %27, align 4
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds i32, i32* %317, i64 %319
  %321 = load i32, i32* %320, align 4
  %322 = load i32*, i32** %22, align 8
  %323 = load i32, i32* %28, align 4
  %324 = sext i32 %323 to i64
  %325 = getelementptr inbounds i32, i32* %322, i64 %324
  %326 = load i32, i32* %325, align 4
  %327 = add nsw i32 %321, %326
  %328 = ashr i32 %327, 16
  %329 = add nsw i32 %316, %328
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds i8, i8* %315, i64 %330
  %332 = load i8, i8* %331, align 1
  %333 = zext i8 %332 to i32
  %334 = shl i32 %333, 8
  %335 = or i32 %314, %334
  %336 = load i8*, i8** %24, align 8
  %337 = load i32, i32* %33, align 4
  %338 = load i32*, i32** %21, align 8
  %339 = load i32, i32* %27, align 4
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds i32, i32* %338, i64 %340
  %342 = load i32, i32* %341, align 4
  %343 = add nsw i32 %337, %342
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds i8, i8* %336, i64 %344
  %346 = load i8, i8* %345, align 1
  %347 = zext i8 %346 to i32
  %348 = shl i32 %347, 16
  %349 = or i32 %335, %348
  %350 = or i32 %349, -16777216
  %351 = load i32*, i32** %25, align 8
  %352 = getelementptr inbounds i32, i32* %351, i64 0
  store i32 %350, i32* %352, align 4
  %353 = load i8*, i8** %18, align 8
  %354 = getelementptr inbounds i8, i8* %353, i64 5
  %355 = load i8, i8* %354, align 1
  %356 = zext i8 %355 to i32
  store i32 %356, i32* %34, align 4
  %357 = load i8*, i8** %24, align 8
  %358 = load i32, i32* %34, align 4
  %359 = load i32*, i32** %20, align 8
  %360 = load i32, i32* %28, align 4
  %361 = sext i32 %360 to i64
  %362 = getelementptr inbounds i32, i32* %359, i64 %361
  %363 = load i32, i32* %362, align 4
  %364 = add nsw i32 %358, %363
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds i8, i8* %357, i64 %365
  %367 = load i8, i8* %366, align 1
  %368 = zext i8 %367 to i32
  %369 = load i8*, i8** %24, align 8
  %370 = load i32, i32* %34, align 4
  %371 = load i32*, i32** %23, align 8
  %372 = load i32, i32* %27, align 4
  %373 = sext i32 %372 to i64
  %374 = getelementptr inbounds i32, i32* %371, i64 %373
  %375 = load i32, i32* %374, align 4
  %376 = load i32*, i32** %22, align 8
  %377 = load i32, i32* %28, align 4
  %378 = sext i32 %377 to i64
  %379 = getelementptr inbounds i32, i32* %376, i64 %378
  %380 = load i32, i32* %379, align 4
  %381 = add nsw i32 %375, %380
  %382 = ashr i32 %381, 16
  %383 = add nsw i32 %370, %382
  %384 = sext i32 %383 to i64
  %385 = getelementptr inbounds i8, i8* %369, i64 %384
  %386 = load i8, i8* %385, align 1
  %387 = zext i8 %386 to i32
  %388 = shl i32 %387, 8
  %389 = or i32 %368, %388
  %390 = load i8*, i8** %24, align 8
  %391 = load i32, i32* %34, align 4
  %392 = load i32*, i32** %21, align 8
  %393 = load i32, i32* %27, align 4
  %394 = sext i32 %393 to i64
  %395 = getelementptr inbounds i32, i32* %392, i64 %394
  %396 = load i32, i32* %395, align 4
  %397 = add nsw i32 %391, %396
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds i8, i8* %390, i64 %398
  %400 = load i8, i8* %399, align 1
  %401 = zext i8 %400 to i32
  %402 = shl i32 %401, 16
  %403 = or i32 %389, %402
  %404 = or i32 %403, -16777216
  %405 = load i32*, i32** %25, align 8
  %406 = getelementptr inbounds i32, i32* %405, i64 1
  store i32 %404, i32* %406, align 4
  %407 = load i8*, i8** %18, align 8
  %408 = getelementptr inbounds i8, i8* %407, i64 6
  %409 = load i8, i8* %408, align 1
  %410 = zext i8 %409 to i32
  store i32 %410, i32* %35, align 4
  %411 = load i8*, i8** %24, align 8
  %412 = load i32, i32* %35, align 4
  %413 = load i32*, i32** %20, align 8
  %414 = load i32, i32* %28, align 4
  %415 = sext i32 %414 to i64
  %416 = getelementptr inbounds i32, i32* %413, i64 %415
  %417 = load i32, i32* %416, align 4
  %418 = add nsw i32 %412, %417
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds i8, i8* %411, i64 %419
  %421 = load i8, i8* %420, align 1
  %422 = zext i8 %421 to i32
  %423 = load i8*, i8** %24, align 8
  %424 = load i32, i32* %35, align 4
  %425 = load i32*, i32** %23, align 8
  %426 = load i32, i32* %27, align 4
  %427 = sext i32 %426 to i64
  %428 = getelementptr inbounds i32, i32* %425, i64 %427
  %429 = load i32, i32* %428, align 4
  %430 = load i32*, i32** %22, align 8
  %431 = load i32, i32* %28, align 4
  %432 = sext i32 %431 to i64
  %433 = getelementptr inbounds i32, i32* %430, i64 %432
  %434 = load i32, i32* %433, align 4
  %435 = add nsw i32 %429, %434
  %436 = ashr i32 %435, 16
  %437 = add nsw i32 %424, %436
  %438 = sext i32 %437 to i64
  %439 = getelementptr inbounds i8, i8* %423, i64 %438
  %440 = load i8, i8* %439, align 1
  %441 = zext i8 %440 to i32
  %442 = shl i32 %441, 8
  %443 = or i32 %422, %442
  %444 = load i8*, i8** %24, align 8
  %445 = load i32, i32* %35, align 4
  %446 = load i32*, i32** %21, align 8
  %447 = load i32, i32* %27, align 4
  %448 = sext i32 %447 to i64
  %449 = getelementptr inbounds i32, i32* %446, i64 %448
  %450 = load i32, i32* %449, align 4
  %451 = add nsw i32 %445, %450
  %452 = sext i32 %451 to i64
  %453 = getelementptr inbounds i8, i8* %444, i64 %452
  %454 = load i8, i8* %453, align 1
  %455 = zext i8 %454 to i32
  %456 = shl i32 %455, 16
  %457 = or i32 %443, %456
  %458 = or i32 %457, -16777216
  %459 = load i32*, i32** %25, align 8
  %460 = getelementptr inbounds i32, i32* %459, i64 2
  store i32 %458, i32* %460, align 4
  %461 = load i8*, i8** %18, align 8
  %462 = getelementptr inbounds i8, i8* %461, i64 7
  %463 = load i8, i8* %462, align 1
  %464 = zext i8 %463 to i32
  store i32 %464, i32* %36, align 4
  %465 = load i8*, i8** %24, align 8
  %466 = load i32, i32* %36, align 4
  %467 = load i32*, i32** %20, align 8
  %468 = load i32, i32* %28, align 4
  %469 = sext i32 %468 to i64
  %470 = getelementptr inbounds i32, i32* %467, i64 %469
  %471 = load i32, i32* %470, align 4
  %472 = add nsw i32 %466, %471
  %473 = sext i32 %472 to i64
  %474 = getelementptr inbounds i8, i8* %465, i64 %473
  %475 = load i8, i8* %474, align 1
  %476 = zext i8 %475 to i32
  %477 = load i8*, i8** %24, align 8
  %478 = load i32, i32* %36, align 4
  %479 = load i32*, i32** %23, align 8
  %480 = load i32, i32* %27, align 4
  %481 = sext i32 %480 to i64
  %482 = getelementptr inbounds i32, i32* %479, i64 %481
  %483 = load i32, i32* %482, align 4
  %484 = load i32*, i32** %22, align 8
  %485 = load i32, i32* %28, align 4
  %486 = sext i32 %485 to i64
  %487 = getelementptr inbounds i32, i32* %484, i64 %486
  %488 = load i32, i32* %487, align 4
  %489 = add nsw i32 %483, %488
  %490 = ashr i32 %489, 16
  %491 = add nsw i32 %478, %490
  %492 = sext i32 %491 to i64
  %493 = getelementptr inbounds i8, i8* %477, i64 %492
  %494 = load i8, i8* %493, align 1
  %495 = zext i8 %494 to i32
  %496 = shl i32 %495, 8
  %497 = or i32 %476, %496
  %498 = load i8*, i8** %24, align 8
  %499 = load i32, i32* %36, align 4
  %500 = load i32*, i32** %21, align 8
  %501 = load i32, i32* %27, align 4
  %502 = sext i32 %501 to i64
  %503 = getelementptr inbounds i32, i32* %500, i64 %502
  %504 = load i32, i32* %503, align 4
  %505 = add nsw i32 %499, %504
  %506 = sext i32 %505 to i64
  %507 = getelementptr inbounds i8, i8* %498, i64 %506
  %508 = load i8, i8* %507, align 1
  %509 = zext i8 %508 to i32
  %510 = shl i32 %509, 16
  %511 = or i32 %497, %510
  %512 = or i32 %511, -16777216
  %513 = load i32*, i32** %25, align 8
  %514 = getelementptr inbounds i32, i32* %513, i64 3
  store i32 %512, i32* %514, align 4
  %515 = load i32*, i32** %11, align 8
  %516 = getelementptr inbounds i32, i32* %515, i64 4
  store i32* %516, i32** %11, align 8
  %517 = load i32*, i32** %25, align 8
  %518 = getelementptr inbounds i32, i32* %517, i64 4
  store i32* %518, i32** %25, align 8
  %519 = load i8*, i8** %18, align 8
  %520 = getelementptr inbounds i8, i8* %519, i64 10
  store i8* %520, i8** %18, align 8
  br label %521

; <label>:521:                                    ; preds = %73
  %522 = load i32, i32* %12, align 4
  %523 = add i32 %522, -1
  store i32 %523, i32* %12, align 4
  %524 = icmp ne i32 %523, 0
  br i1 %524, label %73, label %525

; <label>:525:                                    ; preds = %521
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr42tile, i64 0, i64 1)
  %526 = add i64 %pgocount1, 1
  store i64 %526, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr42tile, i64 0, i64 1)
  %527 = load i32, i32* %26, align 4
  %528 = load i32*, i32** %11, align 8
  %529 = sext i32 %527 to i64
  %530 = getelementptr inbounds i32, i32* %528, i64 %529
  store i32* %530, i32** %11, align 8
  %531 = load i32, i32* %26, align 4
  %532 = load i32*, i32** %25, align 8
  %533 = sext i32 %531 to i64
  %534 = getelementptr inbounds i32, i32* %532, i64 %533
  store i32* %534, i32** %25, align 8
  %535 = load i32, i32* %16, align 4
  %536 = load i8*, i8** %18, align 8
  %537 = sext i32 %535 to i64
  %538 = getelementptr inbounds i8, i8* %536, i64 %537
  store i8* %538, i8** %18, align 8
  br label %539

; <label>:539:                                    ; preds = %525
  %540 = load i32, i32* %15, align 4
  %541 = sub i32 %540, 2
  store i32 %541, i32* %15, align 4
  br label %67

; <label>:542:                                    ; preds = %67
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr42tile, i64 0, i64 2)
  %543 = add i64 %pgocount2, 1
  store i64 %543, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr42tile, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putcontig8bitYCbCr41tile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca %struct.TIFFYCbCrToRGB*, align 8
  %20 = alloca i32*, align 8
  %21 = alloca i32*, align 8
  %22 = alloca i32*, align 8
  %23 = alloca i32*, align 8
  %24 = alloca i8*, align 8
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %31 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %32 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %31, i32 0, i32 18
  %33 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %32, align 8
  store %struct.TIFFYCbCrToRGB* %33, %struct.TIFFYCbCrToRGB** %19, align 8
  %34 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %35 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %34, i32 0, i32 1
  %36 = load i32*, i32** %35, align 8
  store i32* %36, i32** %20, align 8
  %37 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %38 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %37, i32 0, i32 2
  %39 = load i32*, i32** %38, align 8
  store i32* %39, i32** %21, align 8
  %40 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %41 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %40, i32 0, i32 3
  %42 = load i32*, i32** %41, align 8
  store i32* %42, i32** %22, align 8
  %43 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %44 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %43, i32 0, i32 4
  %45 = load i32*, i32** %44, align 8
  store i32* %45, i32** %23, align 8
  %46 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %47 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %46, i32 0, i32 0
  %48 = load i8*, i8** %47, align 8
  store i8* %48, i8** %24, align 8
  %49 = load i32, i32* %13, align 4
  br label %50

; <label>:50:                                     ; preds = %297, %9
  %51 = load i32, i32* %14, align 4
  %52 = lshr i32 %51, 2
  store i32 %52, i32* %12, align 4
  br label %53

; <label>:53:                                     ; preds = %283, %50
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr41tile, i64 0, i64 0)
  %54 = add i64 %pgocount, 1
  store i64 %54, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr41tile, i64 0, i64 0)
  %55 = load i8*, i8** %18, align 8
  %56 = getelementptr inbounds i8, i8* %55, i64 4
  %57 = load i8, i8* %56, align 1
  %58 = zext i8 %57 to i32
  store i32 %58, i32* %25, align 4
  %59 = load i8*, i8** %18, align 8
  %60 = getelementptr inbounds i8, i8* %59, i64 5
  %61 = load i8, i8* %60, align 1
  %62 = zext i8 %61 to i32
  store i32 %62, i32* %26, align 4
  %63 = load i8*, i8** %18, align 8
  %64 = getelementptr inbounds i8, i8* %63, i64 0
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i32
  store i32 %66, i32* %27, align 4
  %67 = load i8*, i8** %24, align 8
  %68 = load i32, i32* %27, align 4
  %69 = load i32*, i32** %20, align 8
  %70 = load i32, i32* %26, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32* %69, i64 %71
  %73 = load i32, i32* %72, align 4
  %74 = add nsw i32 %68, %73
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8* %67, i64 %75
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = load i8*, i8** %24, align 8
  %80 = load i32, i32* %27, align 4
  %81 = load i32*, i32** %23, align 8
  %82 = load i32, i32* %25, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32* %81, i64 %83
  %85 = load i32, i32* %84, align 4
  %86 = load i32*, i32** %22, align 8
  %87 = load i32, i32* %26, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32* %86, i64 %88
  %90 = load i32, i32* %89, align 4
  %91 = add nsw i32 %85, %90
  %92 = ashr i32 %91, 16
  %93 = add nsw i32 %80, %92
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i8, i8* %79, i64 %94
  %96 = load i8, i8* %95, align 1
  %97 = zext i8 %96 to i32
  %98 = shl i32 %97, 8
  %99 = or i32 %78, %98
  %100 = load i8*, i8** %24, align 8
  %101 = load i32, i32* %27, align 4
  %102 = load i32*, i32** %21, align 8
  %103 = load i32, i32* %25, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32* %102, i64 %104
  %106 = load i32, i32* %105, align 4
  %107 = add nsw i32 %101, %106
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i8, i8* %100, i64 %108
  %110 = load i8, i8* %109, align 1
  %111 = zext i8 %110 to i32
  %112 = shl i32 %111, 16
  %113 = or i32 %99, %112
  %114 = or i32 %113, -16777216
  %115 = load i32*, i32** %11, align 8
  %116 = getelementptr inbounds i32, i32* %115, i64 0
  store i32 %114, i32* %116, align 4
  %117 = load i8*, i8** %18, align 8
  %118 = getelementptr inbounds i8, i8* %117, i64 1
  %119 = load i8, i8* %118, align 1
  %120 = zext i8 %119 to i32
  store i32 %120, i32* %28, align 4
  %121 = load i8*, i8** %24, align 8
  %122 = load i32, i32* %28, align 4
  %123 = load i32*, i32** %20, align 8
  %124 = load i32, i32* %26, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i32, i32* %123, i64 %125
  %127 = load i32, i32* %126, align 4
  %128 = add nsw i32 %122, %127
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i8, i8* %121, i64 %129
  %131 = load i8, i8* %130, align 1
  %132 = zext i8 %131 to i32
  %133 = load i8*, i8** %24, align 8
  %134 = load i32, i32* %28, align 4
  %135 = load i32*, i32** %23, align 8
  %136 = load i32, i32* %25, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i32, i32* %135, i64 %137
  %139 = load i32, i32* %138, align 4
  %140 = load i32*, i32** %22, align 8
  %141 = load i32, i32* %26, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i32, i32* %140, i64 %142
  %144 = load i32, i32* %143, align 4
  %145 = add nsw i32 %139, %144
  %146 = ashr i32 %145, 16
  %147 = add nsw i32 %134, %146
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i8, i8* %133, i64 %148
  %150 = load i8, i8* %149, align 1
  %151 = zext i8 %150 to i32
  %152 = shl i32 %151, 8
  %153 = or i32 %132, %152
  %154 = load i8*, i8** %24, align 8
  %155 = load i32, i32* %28, align 4
  %156 = load i32*, i32** %21, align 8
  %157 = load i32, i32* %25, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i32, i32* %156, i64 %158
  %160 = load i32, i32* %159, align 4
  %161 = add nsw i32 %155, %160
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds i8, i8* %154, i64 %162
  %164 = load i8, i8* %163, align 1
  %165 = zext i8 %164 to i32
  %166 = shl i32 %165, 16
  %167 = or i32 %153, %166
  %168 = or i32 %167, -16777216
  %169 = load i32*, i32** %11, align 8
  %170 = getelementptr inbounds i32, i32* %169, i64 1
  store i32 %168, i32* %170, align 4
  %171 = load i8*, i8** %18, align 8
  %172 = getelementptr inbounds i8, i8* %171, i64 2
  %173 = load i8, i8* %172, align 1
  %174 = zext i8 %173 to i32
  store i32 %174, i32* %29, align 4
  %175 = load i8*, i8** %24, align 8
  %176 = load i32, i32* %29, align 4
  %177 = load i32*, i32** %20, align 8
  %178 = load i32, i32* %26, align 4
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds i32, i32* %177, i64 %179
  %181 = load i32, i32* %180, align 4
  %182 = add nsw i32 %176, %181
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds i8, i8* %175, i64 %183
  %185 = load i8, i8* %184, align 1
  %186 = zext i8 %185 to i32
  %187 = load i8*, i8** %24, align 8
  %188 = load i32, i32* %29, align 4
  %189 = load i32*, i32** %23, align 8
  %190 = load i32, i32* %25, align 4
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds i32, i32* %189, i64 %191
  %193 = load i32, i32* %192, align 4
  %194 = load i32*, i32** %22, align 8
  %195 = load i32, i32* %26, align 4
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds i32, i32* %194, i64 %196
  %198 = load i32, i32* %197, align 4
  %199 = add nsw i32 %193, %198
  %200 = ashr i32 %199, 16
  %201 = add nsw i32 %188, %200
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds i8, i8* %187, i64 %202
  %204 = load i8, i8* %203, align 1
  %205 = zext i8 %204 to i32
  %206 = shl i32 %205, 8
  %207 = or i32 %186, %206
  %208 = load i8*, i8** %24, align 8
  %209 = load i32, i32* %29, align 4
  %210 = load i32*, i32** %21, align 8
  %211 = load i32, i32* %25, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds i32, i32* %210, i64 %212
  %214 = load i32, i32* %213, align 4
  %215 = add nsw i32 %209, %214
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds i8, i8* %208, i64 %216
  %218 = load i8, i8* %217, align 1
  %219 = zext i8 %218 to i32
  %220 = shl i32 %219, 16
  %221 = or i32 %207, %220
  %222 = or i32 %221, -16777216
  %223 = load i32*, i32** %11, align 8
  %224 = getelementptr inbounds i32, i32* %223, i64 2
  store i32 %222, i32* %224, align 4
  %225 = load i8*, i8** %18, align 8
  %226 = getelementptr inbounds i8, i8* %225, i64 3
  %227 = load i8, i8* %226, align 1
  %228 = zext i8 %227 to i32
  store i32 %228, i32* %30, align 4
  %229 = load i8*, i8** %24, align 8
  %230 = load i32, i32* %30, align 4
  %231 = load i32*, i32** %20, align 8
  %232 = load i32, i32* %26, align 4
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds i32, i32* %231, i64 %233
  %235 = load i32, i32* %234, align 4
  %236 = add nsw i32 %230, %235
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds i8, i8* %229, i64 %237
  %239 = load i8, i8* %238, align 1
  %240 = zext i8 %239 to i32
  %241 = load i8*, i8** %24, align 8
  %242 = load i32, i32* %30, align 4
  %243 = load i32*, i32** %23, align 8
  %244 = load i32, i32* %25, align 4
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds i32, i32* %243, i64 %245
  %247 = load i32, i32* %246, align 4
  %248 = load i32*, i32** %22, align 8
  %249 = load i32, i32* %26, align 4
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds i32, i32* %248, i64 %250
  %252 = load i32, i32* %251, align 4
  %253 = add nsw i32 %247, %252
  %254 = ashr i32 %253, 16
  %255 = add nsw i32 %242, %254
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds i8, i8* %241, i64 %256
  %258 = load i8, i8* %257, align 1
  %259 = zext i8 %258 to i32
  %260 = shl i32 %259, 8
  %261 = or i32 %240, %260
  %262 = load i8*, i8** %24, align 8
  %263 = load i32, i32* %30, align 4
  %264 = load i32*, i32** %21, align 8
  %265 = load i32, i32* %25, align 4
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds i32, i32* %264, i64 %266
  %268 = load i32, i32* %267, align 4
  %269 = add nsw i32 %263, %268
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds i8, i8* %262, i64 %270
  %272 = load i8, i8* %271, align 1
  %273 = zext i8 %272 to i32
  %274 = shl i32 %273, 16
  %275 = or i32 %261, %274
  %276 = or i32 %275, -16777216
  %277 = load i32*, i32** %11, align 8
  %278 = getelementptr inbounds i32, i32* %277, i64 3
  store i32 %276, i32* %278, align 4
  %279 = load i32*, i32** %11, align 8
  %280 = getelementptr inbounds i32, i32* %279, i64 4
  store i32* %280, i32** %11, align 8
  %281 = load i8*, i8** %18, align 8
  %282 = getelementptr inbounds i8, i8* %281, i64 6
  store i8* %282, i8** %18, align 8
  br label %283

; <label>:283:                                    ; preds = %53
  %284 = load i32, i32* %12, align 4
  %285 = add i32 %284, -1
  store i32 %285, i32* %12, align 4
  %286 = icmp ne i32 %285, 0
  br i1 %286, label %53, label %287

; <label>:287:                                    ; preds = %283
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr41tile, i64 0, i64 1)
  %288 = add i64 %pgocount1, 1
  store i64 %288, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr41tile, i64 0, i64 1)
  %289 = load i32, i32* %17, align 4
  %290 = load i32*, i32** %11, align 8
  %291 = sext i32 %289 to i64
  %292 = getelementptr inbounds i32, i32* %290, i64 %291
  store i32* %292, i32** %11, align 8
  %293 = load i32, i32* %16, align 4
  %294 = load i8*, i8** %18, align 8
  %295 = sext i32 %293 to i64
  %296 = getelementptr inbounds i8, i8* %294, i64 %295
  store i8* %296, i8** %18, align 8
  br label %297

; <label>:297:                                    ; preds = %287
  %298 = load i32, i32* %15, align 4
  %299 = add i32 %298, -1
  store i32 %299, i32* %15, align 4
  %300 = icmp ne i32 %299, 0
  br i1 %300, label %50, label %301

; <label>:301:                                    ; preds = %297
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr41tile, i64 0, i64 2)
  %302 = add i64 %pgocount2, 1
  store i64 %302, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr41tile, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putcontig8bitYCbCr22tile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca %struct.TIFFYCbCrToRGB*, align 8
  %20 = alloca i32*, align 8
  %21 = alloca i32*, align 8
  %22 = alloca i32*, align 8
  %23 = alloca i32*, align 8
  %24 = alloca i8*, align 8
  %25 = alloca i32*, align 8
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %33 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %34 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %33, i32 0, i32 18
  %35 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %34, align 8
  store %struct.TIFFYCbCrToRGB* %35, %struct.TIFFYCbCrToRGB** %19, align 8
  %36 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %37 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %36, i32 0, i32 1
  %38 = load i32*, i32** %37, align 8
  store i32* %38, i32** %20, align 8
  %39 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %40 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %39, i32 0, i32 2
  %41 = load i32*, i32** %40, align 8
  store i32* %41, i32** %21, align 8
  %42 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %43 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %42, i32 0, i32 3
  %44 = load i32*, i32** %43, align 8
  store i32* %44, i32** %22, align 8
  %45 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %46 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %45, i32 0, i32 4
  %47 = load i32*, i32** %46, align 8
  store i32* %47, i32** %23, align 8
  %48 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %49 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %48, i32 0, i32 0
  %50 = load i8*, i8** %49, align 8
  store i8* %50, i8** %24, align 8
  %51 = load i32*, i32** %11, align 8
  %52 = load i32, i32* %14, align 4
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32* %51, i64 %53
  %55 = load i32, i32* %17, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32* %54, i64 %56
  store i32* %57, i32** %25, align 8
  %58 = load i32, i32* %17, align 4
  %59 = mul nsw i32 2, %58
  %60 = load i32, i32* %14, align 4
  %61 = add i32 %59, %60
  store i32 %61, i32* %26, align 4
  %62 = load i32, i32* %13, align 4
  br label %63

; <label>:63:                                     ; preds = %319, %9
  %64 = load i32, i32* %15, align 4
  %65 = icmp uge i32 %64, 2
  br i1 %65, label %66, label %322

; <label>:66:                                     ; preds = %63
  %67 = load i32, i32* %14, align 4
  %68 = lshr i32 %67, 1
  store i32 %68, i32* %12, align 4
  br label %69

; <label>:69:                                     ; preds = %301, %66
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr22tile, i64 0, i64 0)
  %70 = add i64 %pgocount, 1
  store i64 %70, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr22tile, i64 0, i64 0)
  %71 = load i8*, i8** %18, align 8
  %72 = getelementptr inbounds i8, i8* %71, i64 4
  %73 = load i8, i8* %72, align 1
  %74 = zext i8 %73 to i32
  store i32 %74, i32* %27, align 4
  %75 = load i8*, i8** %18, align 8
  %76 = getelementptr inbounds i8, i8* %75, i64 5
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  store i32 %78, i32* %28, align 4
  %79 = load i8*, i8** %18, align 8
  %80 = getelementptr inbounds i8, i8* %79, i64 0
  %81 = load i8, i8* %80, align 1
  %82 = zext i8 %81 to i32
  store i32 %82, i32* %29, align 4
  %83 = load i8*, i8** %24, align 8
  %84 = load i32, i32* %29, align 4
  %85 = load i32*, i32** %20, align 8
  %86 = load i32, i32* %28, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32* %85, i64 %87
  %89 = load i32, i32* %88, align 4
  %90 = add nsw i32 %84, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, i8* %83, i64 %91
  %93 = load i8, i8* %92, align 1
  %94 = zext i8 %93 to i32
  %95 = load i8*, i8** %24, align 8
  %96 = load i32, i32* %29, align 4
  %97 = load i32*, i32** %23, align 8
  %98 = load i32, i32* %27, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32* %97, i64 %99
  %101 = load i32, i32* %100, align 4
  %102 = load i32*, i32** %22, align 8
  %103 = load i32, i32* %28, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32* %102, i64 %104
  %106 = load i32, i32* %105, align 4
  %107 = add nsw i32 %101, %106
  %108 = ashr i32 %107, 16
  %109 = add nsw i32 %96, %108
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8, i8* %95, i64 %110
  %112 = load i8, i8* %111, align 1
  %113 = zext i8 %112 to i32
  %114 = shl i32 %113, 8
  %115 = or i32 %94, %114
  %116 = load i8*, i8** %24, align 8
  %117 = load i32, i32* %29, align 4
  %118 = load i32*, i32** %21, align 8
  %119 = load i32, i32* %27, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i32, i32* %118, i64 %120
  %122 = load i32, i32* %121, align 4
  %123 = add nsw i32 %117, %122
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i8, i8* %116, i64 %124
  %126 = load i8, i8* %125, align 1
  %127 = zext i8 %126 to i32
  %128 = shl i32 %127, 16
  %129 = or i32 %115, %128
  %130 = or i32 %129, -16777216
  %131 = load i32*, i32** %11, align 8
  %132 = getelementptr inbounds i32, i32* %131, i64 0
  store i32 %130, i32* %132, align 4
  %133 = load i8*, i8** %18, align 8
  %134 = getelementptr inbounds i8, i8* %133, i64 1
  %135 = load i8, i8* %134, align 1
  %136 = zext i8 %135 to i32
  store i32 %136, i32* %30, align 4
  %137 = load i8*, i8** %24, align 8
  %138 = load i32, i32* %30, align 4
  %139 = load i32*, i32** %20, align 8
  %140 = load i32, i32* %28, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i32, i32* %139, i64 %141
  %143 = load i32, i32* %142, align 4
  %144 = add nsw i32 %138, %143
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i8, i8* %137, i64 %145
  %147 = load i8, i8* %146, align 1
  %148 = zext i8 %147 to i32
  %149 = load i8*, i8** %24, align 8
  %150 = load i32, i32* %30, align 4
  %151 = load i32*, i32** %23, align 8
  %152 = load i32, i32* %27, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i32, i32* %151, i64 %153
  %155 = load i32, i32* %154, align 4
  %156 = load i32*, i32** %22, align 8
  %157 = load i32, i32* %28, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i32, i32* %156, i64 %158
  %160 = load i32, i32* %159, align 4
  %161 = add nsw i32 %155, %160
  %162 = ashr i32 %161, 16
  %163 = add nsw i32 %150, %162
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i8, i8* %149, i64 %164
  %166 = load i8, i8* %165, align 1
  %167 = zext i8 %166 to i32
  %168 = shl i32 %167, 8
  %169 = or i32 %148, %168
  %170 = load i8*, i8** %24, align 8
  %171 = load i32, i32* %30, align 4
  %172 = load i32*, i32** %21, align 8
  %173 = load i32, i32* %27, align 4
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds i32, i32* %172, i64 %174
  %176 = load i32, i32* %175, align 4
  %177 = add nsw i32 %171, %176
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i8, i8* %170, i64 %178
  %180 = load i8, i8* %179, align 1
  %181 = zext i8 %180 to i32
  %182 = shl i32 %181, 16
  %183 = or i32 %169, %182
  %184 = or i32 %183, -16777216
  %185 = load i32*, i32** %11, align 8
  %186 = getelementptr inbounds i32, i32* %185, i64 1
  store i32 %184, i32* %186, align 4
  %187 = load i8*, i8** %18, align 8
  %188 = getelementptr inbounds i8, i8* %187, i64 2
  %189 = load i8, i8* %188, align 1
  %190 = zext i8 %189 to i32
  store i32 %190, i32* %31, align 4
  %191 = load i8*, i8** %24, align 8
  %192 = load i32, i32* %31, align 4
  %193 = load i32*, i32** %20, align 8
  %194 = load i32, i32* %28, align 4
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds i32, i32* %193, i64 %195
  %197 = load i32, i32* %196, align 4
  %198 = add nsw i32 %192, %197
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds i8, i8* %191, i64 %199
  %201 = load i8, i8* %200, align 1
  %202 = zext i8 %201 to i32
  %203 = load i8*, i8** %24, align 8
  %204 = load i32, i32* %31, align 4
  %205 = load i32*, i32** %23, align 8
  %206 = load i32, i32* %27, align 4
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds i32, i32* %205, i64 %207
  %209 = load i32, i32* %208, align 4
  %210 = load i32*, i32** %22, align 8
  %211 = load i32, i32* %28, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds i32, i32* %210, i64 %212
  %214 = load i32, i32* %213, align 4
  %215 = add nsw i32 %209, %214
  %216 = ashr i32 %215, 16
  %217 = add nsw i32 %204, %216
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds i8, i8* %203, i64 %218
  %220 = load i8, i8* %219, align 1
  %221 = zext i8 %220 to i32
  %222 = shl i32 %221, 8
  %223 = or i32 %202, %222
  %224 = load i8*, i8** %24, align 8
  %225 = load i32, i32* %31, align 4
  %226 = load i32*, i32** %21, align 8
  %227 = load i32, i32* %27, align 4
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds i32, i32* %226, i64 %228
  %230 = load i32, i32* %229, align 4
  %231 = add nsw i32 %225, %230
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds i8, i8* %224, i64 %232
  %234 = load i8, i8* %233, align 1
  %235 = zext i8 %234 to i32
  %236 = shl i32 %235, 16
  %237 = or i32 %223, %236
  %238 = or i32 %237, -16777216
  %239 = load i32*, i32** %25, align 8
  %240 = getelementptr inbounds i32, i32* %239, i64 0
  store i32 %238, i32* %240, align 4
  %241 = load i8*, i8** %18, align 8
  %242 = getelementptr inbounds i8, i8* %241, i64 3
  %243 = load i8, i8* %242, align 1
  %244 = zext i8 %243 to i32
  store i32 %244, i32* %32, align 4
  %245 = load i8*, i8** %24, align 8
  %246 = load i32, i32* %32, align 4
  %247 = load i32*, i32** %20, align 8
  %248 = load i32, i32* %28, align 4
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds i32, i32* %247, i64 %249
  %251 = load i32, i32* %250, align 4
  %252 = add nsw i32 %246, %251
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds i8, i8* %245, i64 %253
  %255 = load i8, i8* %254, align 1
  %256 = zext i8 %255 to i32
  %257 = load i8*, i8** %24, align 8
  %258 = load i32, i32* %32, align 4
  %259 = load i32*, i32** %23, align 8
  %260 = load i32, i32* %27, align 4
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds i32, i32* %259, i64 %261
  %263 = load i32, i32* %262, align 4
  %264 = load i32*, i32** %22, align 8
  %265 = load i32, i32* %28, align 4
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds i32, i32* %264, i64 %266
  %268 = load i32, i32* %267, align 4
  %269 = add nsw i32 %263, %268
  %270 = ashr i32 %269, 16
  %271 = add nsw i32 %258, %270
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds i8, i8* %257, i64 %272
  %274 = load i8, i8* %273, align 1
  %275 = zext i8 %274 to i32
  %276 = shl i32 %275, 8
  %277 = or i32 %256, %276
  %278 = load i8*, i8** %24, align 8
  %279 = load i32, i32* %32, align 4
  %280 = load i32*, i32** %21, align 8
  %281 = load i32, i32* %27, align 4
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds i32, i32* %280, i64 %282
  %284 = load i32, i32* %283, align 4
  %285 = add nsw i32 %279, %284
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds i8, i8* %278, i64 %286
  %288 = load i8, i8* %287, align 1
  %289 = zext i8 %288 to i32
  %290 = shl i32 %289, 16
  %291 = or i32 %277, %290
  %292 = or i32 %291, -16777216
  %293 = load i32*, i32** %25, align 8
  %294 = getelementptr inbounds i32, i32* %293, i64 1
  store i32 %292, i32* %294, align 4
  %295 = load i32*, i32** %11, align 8
  %296 = getelementptr inbounds i32, i32* %295, i64 2
  store i32* %296, i32** %11, align 8
  %297 = load i32*, i32** %25, align 8
  %298 = getelementptr inbounds i32, i32* %297, i64 2
  store i32* %298, i32** %25, align 8
  %299 = load i8*, i8** %18, align 8
  %300 = getelementptr inbounds i8, i8* %299, i64 6
  store i8* %300, i8** %18, align 8
  br label %301

; <label>:301:                                    ; preds = %69
  %302 = load i32, i32* %12, align 4
  %303 = add i32 %302, -1
  store i32 %303, i32* %12, align 4
  %304 = icmp ne i32 %303, 0
  br i1 %304, label %69, label %305

; <label>:305:                                    ; preds = %301
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr22tile, i64 0, i64 1)
  %306 = add i64 %pgocount1, 1
  store i64 %306, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr22tile, i64 0, i64 1)
  %307 = load i32, i32* %26, align 4
  %308 = load i32*, i32** %11, align 8
  %309 = sext i32 %307 to i64
  %310 = getelementptr inbounds i32, i32* %308, i64 %309
  store i32* %310, i32** %11, align 8
  %311 = load i32, i32* %26, align 4
  %312 = load i32*, i32** %25, align 8
  %313 = sext i32 %311 to i64
  %314 = getelementptr inbounds i32, i32* %312, i64 %313
  store i32* %314, i32** %25, align 8
  %315 = load i32, i32* %16, align 4
  %316 = load i8*, i8** %18, align 8
  %317 = sext i32 %315 to i64
  %318 = getelementptr inbounds i8, i8* %316, i64 %317
  store i8* %318, i8** %18, align 8
  br label %319

; <label>:319:                                    ; preds = %305
  %320 = load i32, i32* %15, align 4
  %321 = sub i32 %320, 2
  store i32 %321, i32* %15, align 4
  br label %63

; <label>:322:                                    ; preds = %63
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr22tile, i64 0, i64 2)
  %323 = add i64 %pgocount2, 1
  store i64 %323, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr22tile, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putcontig8bitYCbCr21tile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca %struct.TIFFYCbCrToRGB*, align 8
  %20 = alloca i32*, align 8
  %21 = alloca i32*, align 8
  %22 = alloca i32*, align 8
  %23 = alloca i32*, align 8
  %24 = alloca i8*, align 8
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %29 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %30 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %29, i32 0, i32 18
  %31 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %30, align 8
  store %struct.TIFFYCbCrToRGB* %31, %struct.TIFFYCbCrToRGB** %19, align 8
  %32 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %33 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %32, i32 0, i32 1
  %34 = load i32*, i32** %33, align 8
  store i32* %34, i32** %20, align 8
  %35 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %36 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %35, i32 0, i32 2
  %37 = load i32*, i32** %36, align 8
  store i32* %37, i32** %21, align 8
  %38 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %39 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %38, i32 0, i32 3
  %40 = load i32*, i32** %39, align 8
  store i32* %40, i32** %22, align 8
  %41 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %42 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %41, i32 0, i32 4
  %43 = load i32*, i32** %42, align 8
  store i32* %43, i32** %23, align 8
  %44 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %45 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %44, i32 0, i32 0
  %46 = load i8*, i8** %45, align 8
  store i8* %46, i8** %24, align 8
  %47 = load i32, i32* %13, align 4
  br label %48

; <label>:48:                                     ; preds = %187, %9
  %49 = load i32, i32* %14, align 4
  %50 = lshr i32 %49, 1
  store i32 %50, i32* %12, align 4
  br label %51

; <label>:51:                                     ; preds = %173, %48
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr21tile, i64 0, i64 0)
  %52 = add i64 %pgocount, 1
  store i64 %52, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr21tile, i64 0, i64 0)
  %53 = load i8*, i8** %18, align 8
  %54 = getelementptr inbounds i8, i8* %53, i64 2
  %55 = load i8, i8* %54, align 1
  %56 = zext i8 %55 to i32
  store i32 %56, i32* %25, align 4
  %57 = load i8*, i8** %18, align 8
  %58 = getelementptr inbounds i8, i8* %57, i64 3
  %59 = load i8, i8* %58, align 1
  %60 = zext i8 %59 to i32
  store i32 %60, i32* %26, align 4
  %61 = load i8*, i8** %18, align 8
  %62 = getelementptr inbounds i8, i8* %61, i64 0
  %63 = load i8, i8* %62, align 1
  %64 = zext i8 %63 to i32
  store i32 %64, i32* %27, align 4
  %65 = load i8*, i8** %24, align 8
  %66 = load i32, i32* %27, align 4
  %67 = load i32*, i32** %20, align 8
  %68 = load i32, i32* %26, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32* %67, i64 %69
  %71 = load i32, i32* %70, align 4
  %72 = add nsw i32 %66, %71
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i8, i8* %65, i64 %73
  %75 = load i8, i8* %74, align 1
  %76 = zext i8 %75 to i32
  %77 = load i8*, i8** %24, align 8
  %78 = load i32, i32* %27, align 4
  %79 = load i32*, i32** %23, align 8
  %80 = load i32, i32* %25, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32* %79, i64 %81
  %83 = load i32, i32* %82, align 4
  %84 = load i32*, i32** %22, align 8
  %85 = load i32, i32* %26, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32* %84, i64 %86
  %88 = load i32, i32* %87, align 4
  %89 = add nsw i32 %83, %88
  %90 = ashr i32 %89, 16
  %91 = add nsw i32 %78, %90
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i8, i8* %77, i64 %92
  %94 = load i8, i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = shl i32 %95, 8
  %97 = or i32 %76, %96
  %98 = load i8*, i8** %24, align 8
  %99 = load i32, i32* %27, align 4
  %100 = load i32*, i32** %21, align 8
  %101 = load i32, i32* %25, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i32, i32* %100, i64 %102
  %104 = load i32, i32* %103, align 4
  %105 = add nsw i32 %99, %104
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i8, i8* %98, i64 %106
  %108 = load i8, i8* %107, align 1
  %109 = zext i8 %108 to i32
  %110 = shl i32 %109, 16
  %111 = or i32 %97, %110
  %112 = or i32 %111, -16777216
  %113 = load i32*, i32** %11, align 8
  %114 = getelementptr inbounds i32, i32* %113, i64 0
  store i32 %112, i32* %114, align 4
  %115 = load i8*, i8** %18, align 8
  %116 = getelementptr inbounds i8, i8* %115, i64 1
  %117 = load i8, i8* %116, align 1
  %118 = zext i8 %117 to i32
  store i32 %118, i32* %28, align 4
  %119 = load i8*, i8** %24, align 8
  %120 = load i32, i32* %28, align 4
  %121 = load i32*, i32** %20, align 8
  %122 = load i32, i32* %26, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i32, i32* %121, i64 %123
  %125 = load i32, i32* %124, align 4
  %126 = add nsw i32 %120, %125
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i8, i8* %119, i64 %127
  %129 = load i8, i8* %128, align 1
  %130 = zext i8 %129 to i32
  %131 = load i8*, i8** %24, align 8
  %132 = load i32, i32* %28, align 4
  %133 = load i32*, i32** %23, align 8
  %134 = load i32, i32* %25, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i32, i32* %133, i64 %135
  %137 = load i32, i32* %136, align 4
  %138 = load i32*, i32** %22, align 8
  %139 = load i32, i32* %26, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, i32* %138, i64 %140
  %142 = load i32, i32* %141, align 4
  %143 = add nsw i32 %137, %142
  %144 = ashr i32 %143, 16
  %145 = add nsw i32 %132, %144
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i8, i8* %131, i64 %146
  %148 = load i8, i8* %147, align 1
  %149 = zext i8 %148 to i32
  %150 = shl i32 %149, 8
  %151 = or i32 %130, %150
  %152 = load i8*, i8** %24, align 8
  %153 = load i32, i32* %28, align 4
  %154 = load i32*, i32** %21, align 8
  %155 = load i32, i32* %25, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i32, i32* %154, i64 %156
  %158 = load i32, i32* %157, align 4
  %159 = add nsw i32 %153, %158
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds i8, i8* %152, i64 %160
  %162 = load i8, i8* %161, align 1
  %163 = zext i8 %162 to i32
  %164 = shl i32 %163, 16
  %165 = or i32 %151, %164
  %166 = or i32 %165, -16777216
  %167 = load i32*, i32** %11, align 8
  %168 = getelementptr inbounds i32, i32* %167, i64 1
  store i32 %166, i32* %168, align 4
  %169 = load i32*, i32** %11, align 8
  %170 = getelementptr inbounds i32, i32* %169, i64 2
  store i32* %170, i32** %11, align 8
  %171 = load i8*, i8** %18, align 8
  %172 = getelementptr inbounds i8, i8* %171, i64 4
  store i8* %172, i8** %18, align 8
  br label %173

; <label>:173:                                    ; preds = %51
  %174 = load i32, i32* %12, align 4
  %175 = add i32 %174, -1
  store i32 %175, i32* %12, align 4
  %176 = icmp ne i32 %175, 0
  br i1 %176, label %51, label %177

; <label>:177:                                    ; preds = %173
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr21tile, i64 0, i64 1)
  %178 = add i64 %pgocount1, 1
  store i64 %178, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr21tile, i64 0, i64 1)
  %179 = load i32, i32* %17, align 4
  %180 = load i32*, i32** %11, align 8
  %181 = sext i32 %179 to i64
  %182 = getelementptr inbounds i32, i32* %180, i64 %181
  store i32* %182, i32** %11, align 8
  %183 = load i32, i32* %16, align 4
  %184 = load i8*, i8** %18, align 8
  %185 = sext i32 %183 to i64
  %186 = getelementptr inbounds i8, i8* %184, i64 %185
  store i8* %186, i8** %18, align 8
  br label %187

; <label>:187:                                    ; preds = %177
  %188 = load i32, i32* %15, align 4
  %189 = add i32 %188, -1
  store i32 %189, i32* %15, align 4
  %190 = icmp ne i32 %189, 0
  br i1 %190, label %48, label %191

; <label>:191:                                    ; preds = %187
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr21tile, i64 0, i64 2)
  %192 = add i64 %pgocount2, 1
  store i64 %192, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr21tile, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putcontig8bitYCbCr11tile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*) #0 {
  %10 = alloca %struct._TIFFRGBAImage*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca %struct.TIFFYCbCrToRGB*, align 8
  %20 = alloca i32*, align 8
  %21 = alloca i32*, align 8
  %22 = alloca i32*, align 8
  %23 = alloca i32*, align 8
  %24 = alloca i8*, align 8
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %10, align 8
  store i32* %1, i32** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store i32 %6, i32* %16, align 4
  store i32 %7, i32* %17, align 4
  store i8* %8, i8** %18, align 8
  %28 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %10, align 8
  %29 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %28, i32 0, i32 18
  %30 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %29, align 8
  store %struct.TIFFYCbCrToRGB* %30, %struct.TIFFYCbCrToRGB** %19, align 8
  %31 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %32 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %31, i32 0, i32 1
  %33 = load i32*, i32** %32, align 8
  store i32* %33, i32** %20, align 8
  %34 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %35 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %34, i32 0, i32 2
  %36 = load i32*, i32** %35, align 8
  store i32* %36, i32** %21, align 8
  %37 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %38 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %37, i32 0, i32 3
  %39 = load i32*, i32** %38, align 8
  store i32* %39, i32** %22, align 8
  %40 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %41 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %40, i32 0, i32 4
  %42 = load i32*, i32** %41, align 8
  store i32* %42, i32** %23, align 8
  %43 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %19, align 8
  %44 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %43, i32 0, i32 0
  %45 = load i8*, i8** %44, align 8
  store i8* %45, i8** %24, align 8
  %46 = load i32, i32* %13, align 4
  br label %47

; <label>:47:                                     ; preds = %130, %9
  %48 = load i32, i32* %14, align 4
  %49 = lshr i32 %48, 1
  store i32 %49, i32* %12, align 4
  br label %50

; <label>:50:                                     ; preds = %116, %47
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr11tile, i64 0, i64 0)
  %51 = add i64 %pgocount, 1
  store i64 %51, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr11tile, i64 0, i64 0)
  %52 = load i8*, i8** %18, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 1
  %54 = load i8, i8* %53, align 1
  %55 = zext i8 %54 to i32
  store i32 %55, i32* %25, align 4
  %56 = load i8*, i8** %18, align 8
  %57 = getelementptr inbounds i8, i8* %56, i64 2
  %58 = load i8, i8* %57, align 1
  %59 = zext i8 %58 to i32
  store i32 %59, i32* %26, align 4
  %60 = load i8*, i8** %18, align 8
  %61 = getelementptr inbounds i8, i8* %60, i64 0
  %62 = load i8, i8* %61, align 1
  %63 = zext i8 %62 to i32
  store i32 %63, i32* %27, align 4
  %64 = load i8*, i8** %24, align 8
  %65 = load i32, i32* %27, align 4
  %66 = load i32*, i32** %20, align 8
  %67 = load i32, i32* %26, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32* %66, i64 %68
  %70 = load i32, i32* %69, align 4
  %71 = add nsw i32 %65, %70
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i8, i8* %64, i64 %72
  %74 = load i8, i8* %73, align 1
  %75 = zext i8 %74 to i32
  %76 = load i8*, i8** %24, align 8
  %77 = load i32, i32* %27, align 4
  %78 = load i32*, i32** %23, align 8
  %79 = load i32, i32* %25, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32* %78, i64 %80
  %82 = load i32, i32* %81, align 4
  %83 = load i32*, i32** %22, align 8
  %84 = load i32, i32* %26, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32* %83, i64 %85
  %87 = load i32, i32* %86, align 4
  %88 = add nsw i32 %82, %87
  %89 = ashr i32 %88, 16
  %90 = add nsw i32 %77, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, i8* %76, i64 %91
  %93 = load i8, i8* %92, align 1
  %94 = zext i8 %93 to i32
  %95 = shl i32 %94, 8
  %96 = or i32 %75, %95
  %97 = load i8*, i8** %24, align 8
  %98 = load i32, i32* %27, align 4
  %99 = load i32*, i32** %21, align 8
  %100 = load i32, i32* %25, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32* %99, i64 %101
  %103 = load i32, i32* %102, align 4
  %104 = add nsw i32 %98, %103
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i8, i8* %97, i64 %105
  %107 = load i8, i8* %106, align 1
  %108 = zext i8 %107 to i32
  %109 = shl i32 %108, 16
  %110 = or i32 %96, %109
  %111 = or i32 %110, -16777216
  %112 = load i32*, i32** %11, align 8
  %113 = getelementptr inbounds i32, i32* %112, i32 1
  store i32* %113, i32** %11, align 8
  store i32 %111, i32* %112, align 4
  %114 = load i8*, i8** %18, align 8
  %115 = getelementptr inbounds i8, i8* %114, i64 3
  store i8* %115, i8** %18, align 8
  br label %116

; <label>:116:                                    ; preds = %50
  %117 = load i32, i32* %12, align 4
  %118 = add i32 %117, -1
  store i32 %118, i32* %12, align 4
  %119 = icmp ne i32 %118, 0
  br i1 %119, label %50, label %120

; <label>:120:                                    ; preds = %116
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr11tile, i64 0, i64 1)
  %121 = add i64 %pgocount1, 1
  store i64 %121, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr11tile, i64 0, i64 1)
  %122 = load i32, i32* %17, align 4
  %123 = load i32*, i32** %11, align 8
  %124 = sext i32 %122 to i64
  %125 = getelementptr inbounds i32, i32* %123, i64 %124
  store i32* %125, i32** %11, align 8
  %126 = load i32, i32* %16, align 4
  %127 = load i8*, i8** %18, align 8
  %128 = sext i32 %126 to i64
  %129 = getelementptr inbounds i8, i8* %127, i64 %128
  store i8* %129, i8** %18, align 8
  br label %130

; <label>:130:                                    ; preds = %120
  %131 = load i32, i32* %15, align 4
  %132 = add i32 %131, -1
  store i32 %132, i32* %15, align 4
  %133 = icmp ne i32 %132, 0
  br i1 %133, label %47, label %134

; <label>:134:                                    ; preds = %130
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr11tile, i64 0, i64 2)
  %135 = add i64 %pgocount2, 1
  store i64 %135, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putcontig8bitYCbCr11tile, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putRGBAAseparate8bittile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*) #0 {
  %13 = alloca %struct._TIFFRGBAImage*, align 8
  %14 = alloca i32*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i8*, align 8
  %22 = alloca i8*, align 8
  %23 = alloca i8*, align 8
  %24 = alloca i8*, align 8
  %25 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %13, align 8
  store i32* %1, i32** %14, align 8
  store i32 %2, i32* %15, align 4
  store i32 %3, i32* %16, align 4
  store i32 %4, i32* %17, align 4
  store i32 %5, i32* %18, align 4
  store i32 %6, i32* %19, align 4
  store i32 %7, i32* %20, align 4
  store i8* %8, i8** %21, align 8
  store i8* %9, i8** %22, align 8
  store i8* %10, i8** %23, align 8
  store i8* %11, i8** %24, align 8
  %26 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %13, align 8
  %27 = load i32, i32* %15, align 4
  %28 = load i32, i32* %16, align 4
  br label %29

; <label>:29:                                     ; preds = %424, %12
  %30 = load i32, i32* %18, align 4
  %31 = add i32 %30, -1
  store i32 %31, i32* %18, align 4
  %32 = icmp ugt i32 %30, 0
  br i1 %32, label %33, label %446

; <label>:33:                                     ; preds = %29
  %34 = load i32, i32* %17, align 4
  store i32 %34, i32* %25, align 4
  br label %35

; <label>:35:                                     ; preds = %231, %33
  %36 = load i32, i32* %25, align 4
  %37 = icmp uge i32 %36, 8
  br i1 %37, label %38, label %235

; <label>:38:                                     ; preds = %35
  %39 = load i8*, i8** %21, align 8
  %40 = getelementptr inbounds i8, i8* %39, i32 1
  store i8* %40, i8** %21, align 8
  %41 = load i8, i8* %39, align 1
  %42 = zext i8 %41 to i32
  %43 = load i8*, i8** %22, align 8
  %44 = getelementptr inbounds i8, i8* %43, i32 1
  store i8* %44, i8** %22, align 8
  %45 = load i8, i8* %43, align 1
  %46 = zext i8 %45 to i32
  %47 = shl i32 %46, 8
  %48 = or i32 %42, %47
  %49 = load i8*, i8** %23, align 8
  %50 = getelementptr inbounds i8, i8* %49, i32 1
  store i8* %50, i8** %23, align 8
  %51 = load i8, i8* %49, align 1
  %52 = zext i8 %51 to i32
  %53 = shl i32 %52, 16
  %54 = or i32 %48, %53
  %55 = load i8*, i8** %24, align 8
  %56 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %56, i8** %24, align 8
  %57 = load i8, i8* %55, align 1
  %58 = zext i8 %57 to i32
  %59 = shl i32 %58, 24
  %60 = or i32 %54, %59
  %61 = load i32*, i32** %14, align 8
  %62 = getelementptr inbounds i32, i32* %61, i32 1
  store i32* %62, i32** %14, align 8
  store i32 %60, i32* %61, align 4
  %63 = load i8*, i8** %21, align 8
  %64 = getelementptr inbounds i8, i8* %63, i32 1
  store i8* %64, i8** %21, align 8
  %65 = load i8, i8* %63, align 1
  %66 = zext i8 %65 to i32
  %67 = load i8*, i8** %22, align 8
  %68 = getelementptr inbounds i8, i8* %67, i32 1
  store i8* %68, i8** %22, align 8
  %69 = load i8, i8* %67, align 1
  %70 = zext i8 %69 to i32
  %71 = shl i32 %70, 8
  %72 = or i32 %66, %71
  %73 = load i8*, i8** %23, align 8
  %74 = getelementptr inbounds i8, i8* %73, i32 1
  store i8* %74, i8** %23, align 8
  %75 = load i8, i8* %73, align 1
  %76 = zext i8 %75 to i32
  %77 = shl i32 %76, 16
  %78 = or i32 %72, %77
  %79 = load i8*, i8** %24, align 8
  %80 = getelementptr inbounds i8, i8* %79, i32 1
  store i8* %80, i8** %24, align 8
  %81 = load i8, i8* %79, align 1
  %82 = zext i8 %81 to i32
  %83 = shl i32 %82, 24
  %84 = or i32 %78, %83
  %85 = load i32*, i32** %14, align 8
  %86 = getelementptr inbounds i32, i32* %85, i32 1
  store i32* %86, i32** %14, align 8
  store i32 %84, i32* %85, align 4
  %87 = load i8*, i8** %21, align 8
  %88 = getelementptr inbounds i8, i8* %87, i32 1
  store i8* %88, i8** %21, align 8
  %89 = load i8, i8* %87, align 1
  %90 = zext i8 %89 to i32
  %91 = load i8*, i8** %22, align 8
  %92 = getelementptr inbounds i8, i8* %91, i32 1
  store i8* %92, i8** %22, align 8
  %93 = load i8, i8* %91, align 1
  %94 = zext i8 %93 to i32
  %95 = shl i32 %94, 8
  %96 = or i32 %90, %95
  %97 = load i8*, i8** %23, align 8
  %98 = getelementptr inbounds i8, i8* %97, i32 1
  store i8* %98, i8** %23, align 8
  %99 = load i8, i8* %97, align 1
  %100 = zext i8 %99 to i32
  %101 = shl i32 %100, 16
  %102 = or i32 %96, %101
  %103 = load i8*, i8** %24, align 8
  %104 = getelementptr inbounds i8, i8* %103, i32 1
  store i8* %104, i8** %24, align 8
  %105 = load i8, i8* %103, align 1
  %106 = zext i8 %105 to i32
  %107 = shl i32 %106, 24
  %108 = or i32 %102, %107
  %109 = load i32*, i32** %14, align 8
  %110 = getelementptr inbounds i32, i32* %109, i32 1
  store i32* %110, i32** %14, align 8
  store i32 %108, i32* %109, align 4
  %111 = load i8*, i8** %21, align 8
  %112 = getelementptr inbounds i8, i8* %111, i32 1
  store i8* %112, i8** %21, align 8
  %113 = load i8, i8* %111, align 1
  %114 = zext i8 %113 to i32
  %115 = load i8*, i8** %22, align 8
  %116 = getelementptr inbounds i8, i8* %115, i32 1
  store i8* %116, i8** %22, align 8
  %117 = load i8, i8* %115, align 1
  %118 = zext i8 %117 to i32
  %119 = shl i32 %118, 8
  %120 = or i32 %114, %119
  %121 = load i8*, i8** %23, align 8
  %122 = getelementptr inbounds i8, i8* %121, i32 1
  store i8* %122, i8** %23, align 8
  %123 = load i8, i8* %121, align 1
  %124 = zext i8 %123 to i32
  %125 = shl i32 %124, 16
  %126 = or i32 %120, %125
  %127 = load i8*, i8** %24, align 8
  %128 = getelementptr inbounds i8, i8* %127, i32 1
  store i8* %128, i8** %24, align 8
  %129 = load i8, i8* %127, align 1
  %130 = zext i8 %129 to i32
  %131 = shl i32 %130, 24
  %132 = or i32 %126, %131
  %133 = load i32*, i32** %14, align 8
  %134 = getelementptr inbounds i32, i32* %133, i32 1
  store i32* %134, i32** %14, align 8
  store i32 %132, i32* %133, align 4
  %135 = load i8*, i8** %21, align 8
  %136 = getelementptr inbounds i8, i8* %135, i32 1
  store i8* %136, i8** %21, align 8
  %137 = load i8, i8* %135, align 1
  %138 = zext i8 %137 to i32
  %139 = load i8*, i8** %22, align 8
  %140 = getelementptr inbounds i8, i8* %139, i32 1
  store i8* %140, i8** %22, align 8
  %141 = load i8, i8* %139, align 1
  %142 = zext i8 %141 to i32
  %143 = shl i32 %142, 8
  %144 = or i32 %138, %143
  %145 = load i8*, i8** %23, align 8
  %146 = getelementptr inbounds i8, i8* %145, i32 1
  store i8* %146, i8** %23, align 8
  %147 = load i8, i8* %145, align 1
  %148 = zext i8 %147 to i32
  %149 = shl i32 %148, 16
  %150 = or i32 %144, %149
  %151 = load i8*, i8** %24, align 8
  %152 = getelementptr inbounds i8, i8* %151, i32 1
  store i8* %152, i8** %24, align 8
  %153 = load i8, i8* %151, align 1
  %154 = zext i8 %153 to i32
  %155 = shl i32 %154, 24
  %156 = or i32 %150, %155
  %157 = load i32*, i32** %14, align 8
  %158 = getelementptr inbounds i32, i32* %157, i32 1
  store i32* %158, i32** %14, align 8
  store i32 %156, i32* %157, align 4
  %159 = load i8*, i8** %21, align 8
  %160 = getelementptr inbounds i8, i8* %159, i32 1
  store i8* %160, i8** %21, align 8
  %161 = load i8, i8* %159, align 1
  %162 = zext i8 %161 to i32
  %163 = load i8*, i8** %22, align 8
  %164 = getelementptr inbounds i8, i8* %163, i32 1
  store i8* %164, i8** %22, align 8
  %165 = load i8, i8* %163, align 1
  %166 = zext i8 %165 to i32
  %167 = shl i32 %166, 8
  %168 = or i32 %162, %167
  %169 = load i8*, i8** %23, align 8
  %170 = getelementptr inbounds i8, i8* %169, i32 1
  store i8* %170, i8** %23, align 8
  %171 = load i8, i8* %169, align 1
  %172 = zext i8 %171 to i32
  %173 = shl i32 %172, 16
  %174 = or i32 %168, %173
  %175 = load i8*, i8** %24, align 8
  %176 = getelementptr inbounds i8, i8* %175, i32 1
  store i8* %176, i8** %24, align 8
  %177 = load i8, i8* %175, align 1
  %178 = zext i8 %177 to i32
  %179 = shl i32 %178, 24
  %180 = or i32 %174, %179
  %181 = load i32*, i32** %14, align 8
  %182 = getelementptr inbounds i32, i32* %181, i32 1
  store i32* %182, i32** %14, align 8
  store i32 %180, i32* %181, align 4
  %183 = load i8*, i8** %21, align 8
  %184 = getelementptr inbounds i8, i8* %183, i32 1
  store i8* %184, i8** %21, align 8
  %185 = load i8, i8* %183, align 1
  %186 = zext i8 %185 to i32
  %187 = load i8*, i8** %22, align 8
  %188 = getelementptr inbounds i8, i8* %187, i32 1
  store i8* %188, i8** %22, align 8
  %189 = load i8, i8* %187, align 1
  %190 = zext i8 %189 to i32
  %191 = shl i32 %190, 8
  %192 = or i32 %186, %191
  %193 = load i8*, i8** %23, align 8
  %194 = getelementptr inbounds i8, i8* %193, i32 1
  store i8* %194, i8** %23, align 8
  %195 = load i8, i8* %193, align 1
  %196 = zext i8 %195 to i32
  %197 = shl i32 %196, 16
  %198 = or i32 %192, %197
  %199 = load i8*, i8** %24, align 8
  %200 = getelementptr inbounds i8, i8* %199, i32 1
  store i8* %200, i8** %24, align 8
  %201 = load i8, i8* %199, align 1
  %202 = zext i8 %201 to i32
  %203 = shl i32 %202, 24
  %204 = or i32 %198, %203
  %205 = load i32*, i32** %14, align 8
  %206 = getelementptr inbounds i32, i32* %205, i32 1
  store i32* %206, i32** %14, align 8
  store i32 %204, i32* %205, align 4
  %207 = load i8*, i8** %21, align 8
  %208 = getelementptr inbounds i8, i8* %207, i32 1
  store i8* %208, i8** %21, align 8
  %209 = load i8, i8* %207, align 1
  %210 = zext i8 %209 to i32
  %211 = load i8*, i8** %22, align 8
  %212 = getelementptr inbounds i8, i8* %211, i32 1
  store i8* %212, i8** %22, align 8
  %213 = load i8, i8* %211, align 1
  %214 = zext i8 %213 to i32
  %215 = shl i32 %214, 8
  %216 = or i32 %210, %215
  %217 = load i8*, i8** %23, align 8
  %218 = getelementptr inbounds i8, i8* %217, i32 1
  store i8* %218, i8** %23, align 8
  %219 = load i8, i8* %217, align 1
  %220 = zext i8 %219 to i32
  %221 = shl i32 %220, 16
  %222 = or i32 %216, %221
  %223 = load i8*, i8** %24, align 8
  %224 = getelementptr inbounds i8, i8* %223, i32 1
  store i8* %224, i8** %24, align 8
  %225 = load i8, i8* %223, align 1
  %226 = zext i8 %225 to i32
  %227 = shl i32 %226, 24
  %228 = or i32 %222, %227
  %229 = load i32*, i32** %14, align 8
  %230 = getelementptr inbounds i32, i32* %229, i32 1
  store i32* %230, i32** %14, align 8
  store i32 %228, i32* %229, align 4
  br label %231

; <label>:231:                                    ; preds = %38
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 0)
  %232 = add i64 %pgocount, 1
  store i64 %232, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 0)
  %233 = load i32, i32* %25, align 4
  %234 = sub i32 %233, 8
  store i32 %234, i32* %25, align 4
  br label %35

; <label>:235:                                    ; preds = %35
  %236 = load i32, i32* %25, align 4
  %237 = icmp ugt i32 %236, 0
  br i1 %237, label %238, label %424

; <label>:238:                                    ; preds = %235
  %239 = load i32, i32* %25, align 4
  switch i32 %239, label %422 [
    i32 7, label %240
    i32 6, label %266
    i32 5, label %292
    i32 4, label %318
    i32 3, label %344
    i32 2, label %370
    i32 1, label %396
  ]

; <label>:240:                                    ; preds = %238
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 9)
  %241 = add i64 %pgocount1, 1
  store i64 %241, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 9)
  %242 = load i8*, i8** %21, align 8
  %243 = getelementptr inbounds i8, i8* %242, i32 1
  store i8* %243, i8** %21, align 8
  %244 = load i8, i8* %242, align 1
  %245 = zext i8 %244 to i32
  %246 = load i8*, i8** %22, align 8
  %247 = getelementptr inbounds i8, i8* %246, i32 1
  store i8* %247, i8** %22, align 8
  %248 = load i8, i8* %246, align 1
  %249 = zext i8 %248 to i32
  %250 = shl i32 %249, 8
  %251 = or i32 %245, %250
  %252 = load i8*, i8** %23, align 8
  %253 = getelementptr inbounds i8, i8* %252, i32 1
  store i8* %253, i8** %23, align 8
  %254 = load i8, i8* %252, align 1
  %255 = zext i8 %254 to i32
  %256 = shl i32 %255, 16
  %257 = or i32 %251, %256
  %258 = load i8*, i8** %24, align 8
  %259 = getelementptr inbounds i8, i8* %258, i32 1
  store i8* %259, i8** %24, align 8
  %260 = load i8, i8* %258, align 1
  %261 = zext i8 %260 to i32
  %262 = shl i32 %261, 24
  %263 = or i32 %257, %262
  %264 = load i32*, i32** %14, align 8
  %265 = getelementptr inbounds i32, i32* %264, i32 1
  store i32* %265, i32** %14, align 8
  store i32 %263, i32* %264, align 4
  br label %266

; <label>:266:                                    ; preds = %240, %238
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 8)
  %267 = add i64 %pgocount2, 1
  store i64 %267, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 8)
  %268 = load i8*, i8** %21, align 8
  %269 = getelementptr inbounds i8, i8* %268, i32 1
  store i8* %269, i8** %21, align 8
  %270 = load i8, i8* %268, align 1
  %271 = zext i8 %270 to i32
  %272 = load i8*, i8** %22, align 8
  %273 = getelementptr inbounds i8, i8* %272, i32 1
  store i8* %273, i8** %22, align 8
  %274 = load i8, i8* %272, align 1
  %275 = zext i8 %274 to i32
  %276 = shl i32 %275, 8
  %277 = or i32 %271, %276
  %278 = load i8*, i8** %23, align 8
  %279 = getelementptr inbounds i8, i8* %278, i32 1
  store i8* %279, i8** %23, align 8
  %280 = load i8, i8* %278, align 1
  %281 = zext i8 %280 to i32
  %282 = shl i32 %281, 16
  %283 = or i32 %277, %282
  %284 = load i8*, i8** %24, align 8
  %285 = getelementptr inbounds i8, i8* %284, i32 1
  store i8* %285, i8** %24, align 8
  %286 = load i8, i8* %284, align 1
  %287 = zext i8 %286 to i32
  %288 = shl i32 %287, 24
  %289 = or i32 %283, %288
  %290 = load i32*, i32** %14, align 8
  %291 = getelementptr inbounds i32, i32* %290, i32 1
  store i32* %291, i32** %14, align 8
  store i32 %289, i32* %290, align 4
  br label %292

; <label>:292:                                    ; preds = %266, %238
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 7)
  %293 = add i64 %pgocount3, 1
  store i64 %293, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 7)
  %294 = load i8*, i8** %21, align 8
  %295 = getelementptr inbounds i8, i8* %294, i32 1
  store i8* %295, i8** %21, align 8
  %296 = load i8, i8* %294, align 1
  %297 = zext i8 %296 to i32
  %298 = load i8*, i8** %22, align 8
  %299 = getelementptr inbounds i8, i8* %298, i32 1
  store i8* %299, i8** %22, align 8
  %300 = load i8, i8* %298, align 1
  %301 = zext i8 %300 to i32
  %302 = shl i32 %301, 8
  %303 = or i32 %297, %302
  %304 = load i8*, i8** %23, align 8
  %305 = getelementptr inbounds i8, i8* %304, i32 1
  store i8* %305, i8** %23, align 8
  %306 = load i8, i8* %304, align 1
  %307 = zext i8 %306 to i32
  %308 = shl i32 %307, 16
  %309 = or i32 %303, %308
  %310 = load i8*, i8** %24, align 8
  %311 = getelementptr inbounds i8, i8* %310, i32 1
  store i8* %311, i8** %24, align 8
  %312 = load i8, i8* %310, align 1
  %313 = zext i8 %312 to i32
  %314 = shl i32 %313, 24
  %315 = or i32 %309, %314
  %316 = load i32*, i32** %14, align 8
  %317 = getelementptr inbounds i32, i32* %316, i32 1
  store i32* %317, i32** %14, align 8
  store i32 %315, i32* %316, align 4
  br label %318

; <label>:318:                                    ; preds = %292, %238
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 6)
  %319 = add i64 %pgocount4, 1
  store i64 %319, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 6)
  %320 = load i8*, i8** %21, align 8
  %321 = getelementptr inbounds i8, i8* %320, i32 1
  store i8* %321, i8** %21, align 8
  %322 = load i8, i8* %320, align 1
  %323 = zext i8 %322 to i32
  %324 = load i8*, i8** %22, align 8
  %325 = getelementptr inbounds i8, i8* %324, i32 1
  store i8* %325, i8** %22, align 8
  %326 = load i8, i8* %324, align 1
  %327 = zext i8 %326 to i32
  %328 = shl i32 %327, 8
  %329 = or i32 %323, %328
  %330 = load i8*, i8** %23, align 8
  %331 = getelementptr inbounds i8, i8* %330, i32 1
  store i8* %331, i8** %23, align 8
  %332 = load i8, i8* %330, align 1
  %333 = zext i8 %332 to i32
  %334 = shl i32 %333, 16
  %335 = or i32 %329, %334
  %336 = load i8*, i8** %24, align 8
  %337 = getelementptr inbounds i8, i8* %336, i32 1
  store i8* %337, i8** %24, align 8
  %338 = load i8, i8* %336, align 1
  %339 = zext i8 %338 to i32
  %340 = shl i32 %339, 24
  %341 = or i32 %335, %340
  %342 = load i32*, i32** %14, align 8
  %343 = getelementptr inbounds i32, i32* %342, i32 1
  store i32* %343, i32** %14, align 8
  store i32 %341, i32* %342, align 4
  br label %344

; <label>:344:                                    ; preds = %318, %238
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 5)
  %345 = add i64 %pgocount5, 1
  store i64 %345, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 5)
  %346 = load i8*, i8** %21, align 8
  %347 = getelementptr inbounds i8, i8* %346, i32 1
  store i8* %347, i8** %21, align 8
  %348 = load i8, i8* %346, align 1
  %349 = zext i8 %348 to i32
  %350 = load i8*, i8** %22, align 8
  %351 = getelementptr inbounds i8, i8* %350, i32 1
  store i8* %351, i8** %22, align 8
  %352 = load i8, i8* %350, align 1
  %353 = zext i8 %352 to i32
  %354 = shl i32 %353, 8
  %355 = or i32 %349, %354
  %356 = load i8*, i8** %23, align 8
  %357 = getelementptr inbounds i8, i8* %356, i32 1
  store i8* %357, i8** %23, align 8
  %358 = load i8, i8* %356, align 1
  %359 = zext i8 %358 to i32
  %360 = shl i32 %359, 16
  %361 = or i32 %355, %360
  %362 = load i8*, i8** %24, align 8
  %363 = getelementptr inbounds i8, i8* %362, i32 1
  store i8* %363, i8** %24, align 8
  %364 = load i8, i8* %362, align 1
  %365 = zext i8 %364 to i32
  %366 = shl i32 %365, 24
  %367 = or i32 %361, %366
  %368 = load i32*, i32** %14, align 8
  %369 = getelementptr inbounds i32, i32* %368, i32 1
  store i32* %369, i32** %14, align 8
  store i32 %367, i32* %368, align 4
  br label %370

; <label>:370:                                    ; preds = %344, %238
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 4)
  %371 = add i64 %pgocount6, 1
  store i64 %371, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 4)
  %372 = load i8*, i8** %21, align 8
  %373 = getelementptr inbounds i8, i8* %372, i32 1
  store i8* %373, i8** %21, align 8
  %374 = load i8, i8* %372, align 1
  %375 = zext i8 %374 to i32
  %376 = load i8*, i8** %22, align 8
  %377 = getelementptr inbounds i8, i8* %376, i32 1
  store i8* %377, i8** %22, align 8
  %378 = load i8, i8* %376, align 1
  %379 = zext i8 %378 to i32
  %380 = shl i32 %379, 8
  %381 = or i32 %375, %380
  %382 = load i8*, i8** %23, align 8
  %383 = getelementptr inbounds i8, i8* %382, i32 1
  store i8* %383, i8** %23, align 8
  %384 = load i8, i8* %382, align 1
  %385 = zext i8 %384 to i32
  %386 = shl i32 %385, 16
  %387 = or i32 %381, %386
  %388 = load i8*, i8** %24, align 8
  %389 = getelementptr inbounds i8, i8* %388, i32 1
  store i8* %389, i8** %24, align 8
  %390 = load i8, i8* %388, align 1
  %391 = zext i8 %390 to i32
  %392 = shl i32 %391, 24
  %393 = or i32 %387, %392
  %394 = load i32*, i32** %14, align 8
  %395 = getelementptr inbounds i32, i32* %394, i32 1
  store i32* %395, i32** %14, align 8
  store i32 %393, i32* %394, align 4
  br label %396

; <label>:396:                                    ; preds = %370, %238
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 3)
  %397 = add i64 %pgocount7, 1
  store i64 %397, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 3)
  %398 = load i8*, i8** %21, align 8
  %399 = getelementptr inbounds i8, i8* %398, i32 1
  store i8* %399, i8** %21, align 8
  %400 = load i8, i8* %398, align 1
  %401 = zext i8 %400 to i32
  %402 = load i8*, i8** %22, align 8
  %403 = getelementptr inbounds i8, i8* %402, i32 1
  store i8* %403, i8** %22, align 8
  %404 = load i8, i8* %402, align 1
  %405 = zext i8 %404 to i32
  %406 = shl i32 %405, 8
  %407 = or i32 %401, %406
  %408 = load i8*, i8** %23, align 8
  %409 = getelementptr inbounds i8, i8* %408, i32 1
  store i8* %409, i8** %23, align 8
  %410 = load i8, i8* %408, align 1
  %411 = zext i8 %410 to i32
  %412 = shl i32 %411, 16
  %413 = or i32 %407, %412
  %414 = load i8*, i8** %24, align 8
  %415 = getelementptr inbounds i8, i8* %414, i32 1
  store i8* %415, i8** %24, align 8
  %416 = load i8, i8* %414, align 1
  %417 = zext i8 %416 to i32
  %418 = shl i32 %417, 24
  %419 = or i32 %413, %418
  %420 = load i32*, i32** %14, align 8
  %421 = getelementptr inbounds i32, i32* %420, i32 1
  store i32* %421, i32** %14, align 8
  store i32 %419, i32* %420, align 4
  br label %422

; <label>:422:                                    ; preds = %396, %238
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 2)
  %423 = add i64 %pgocount8, 1
  store i64 %423, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 2)
  br label %424

; <label>:424:                                    ; preds = %422, %235
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 1)
  %425 = add i64 %pgocount9, 1
  store i64 %425, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 1)
  %426 = load i32, i32* %19, align 4
  %427 = load i8*, i8** %21, align 8
  %428 = sext i32 %426 to i64
  %429 = getelementptr inbounds i8, i8* %427, i64 %428
  store i8* %429, i8** %21, align 8
  %430 = load i32, i32* %19, align 4
  %431 = load i8*, i8** %22, align 8
  %432 = sext i32 %430 to i64
  %433 = getelementptr inbounds i8, i8* %431, i64 %432
  store i8* %433, i8** %22, align 8
  %434 = load i32, i32* %19, align 4
  %435 = load i8*, i8** %23, align 8
  %436 = sext i32 %434 to i64
  %437 = getelementptr inbounds i8, i8* %435, i64 %436
  store i8* %437, i8** %23, align 8
  %438 = load i32, i32* %19, align 4
  %439 = load i8*, i8** %24, align 8
  %440 = sext i32 %438 to i64
  %441 = getelementptr inbounds i8, i8* %439, i64 %440
  store i8* %441, i8** %24, align 8
  %442 = load i32, i32* %20, align 4
  %443 = load i32*, i32** %14, align 8
  %444 = sext i32 %442 to i64
  %445 = getelementptr inbounds i32, i32* %443, i64 %444
  store i32* %445, i32** %14, align 8
  br label %29

; <label>:446:                                    ; preds = %29
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 10)
  %447 = add i64 %pgocount10, 1
  store i64 %447, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBAAseparate8bittile, i64 0, i64 10)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putRGBUAseparate8bittile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*) #0 {
  %13 = alloca %struct._TIFFRGBAImage*, align 8
  %14 = alloca i32*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i8*, align 8
  %22 = alloca i8*, align 8
  %23 = alloca i8*, align 8
  %24 = alloca i8*, align 8
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %13, align 8
  store i32* %1, i32** %14, align 8
  store i32 %2, i32* %15, align 4
  store i32 %3, i32* %16, align 4
  store i32 %4, i32* %17, align 4
  store i32 %5, i32* %18, align 4
  store i32 %6, i32* %19, align 4
  store i32 %7, i32* %20, align 4
  store i8* %8, i8** %21, align 8
  store i8* %9, i8** %22, align 8
  store i8* %10, i8** %23, align 8
  store i8* %11, i8** %24, align 8
  %29 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %13, align 8
  %30 = load i32, i32* %16, align 4
  br label %31

; <label>:31:                                     ; preds = %80, %12
  %32 = load i32, i32* %18, align 4
  %33 = add i32 %32, -1
  store i32 %33, i32* %18, align 4
  %34 = icmp ugt i32 %32, 0
  br i1 %34, label %35, label %102

; <label>:35:                                     ; preds = %31
  %36 = load i32, i32* %17, align 4
  store i32 %36, i32* %15, align 4
  br label %37

; <label>:37:                                     ; preds = %41, %35
  %38 = load i32, i32* %15, align 4
  %39 = add i32 %38, -1
  store i32 %39, i32* %15, align 4
  %40 = icmp ugt i32 %38, 0
  br i1 %40, label %41, label %80

; <label>:41:                                     ; preds = %37
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAseparate8bittile, i64 0, i64 0)
  %42 = add i64 %pgocount, 1
  store i64 %42, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAseparate8bittile, i64 0, i64 0)
  %43 = load i8*, i8** %24, align 8
  %44 = getelementptr inbounds i8, i8* %43, i32 1
  store i8* %44, i8** %24, align 8
  %45 = load i8, i8* %43, align 1
  %46 = zext i8 %45 to i32
  store i32 %46, i32* %28, align 4
  %47 = load i8*, i8** %21, align 8
  %48 = getelementptr inbounds i8, i8* %47, i32 1
  store i8* %48, i8** %21, align 8
  %49 = load i8, i8* %47, align 1
  %50 = zext i8 %49 to i32
  %51 = load i32, i32* %28, align 4
  %52 = mul i32 %50, %51
  %53 = udiv i32 %52, 255
  store i32 %53, i32* %25, align 4
  %54 = load i8*, i8** %22, align 8
  %55 = getelementptr inbounds i8, i8* %54, i32 1
  store i8* %55, i8** %22, align 8
  %56 = load i8, i8* %54, align 1
  %57 = zext i8 %56 to i32
  %58 = load i32, i32* %28, align 4
  %59 = mul i32 %57, %58
  %60 = udiv i32 %59, 255
  store i32 %60, i32* %26, align 4
  %61 = load i8*, i8** %23, align 8
  %62 = getelementptr inbounds i8, i8* %61, i32 1
  store i8* %62, i8** %23, align 8
  %63 = load i8, i8* %61, align 1
  %64 = zext i8 %63 to i32
  %65 = load i32, i32* %28, align 4
  %66 = mul i32 %64, %65
  %67 = udiv i32 %66, 255
  store i32 %67, i32* %27, align 4
  %68 = load i32, i32* %25, align 4
  %69 = load i32, i32* %26, align 4
  %70 = shl i32 %69, 8
  %71 = or i32 %68, %70
  %72 = load i32, i32* %27, align 4
  %73 = shl i32 %72, 16
  %74 = or i32 %71, %73
  %75 = load i32, i32* %28, align 4
  %76 = shl i32 %75, 24
  %77 = or i32 %74, %76
  %78 = load i32*, i32** %14, align 8
  %79 = getelementptr inbounds i32, i32* %78, i32 1
  store i32* %79, i32** %14, align 8
  store i32 %77, i32* %78, align 4
  br label %37

; <label>:80:                                     ; preds = %37
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAseparate8bittile, i64 0, i64 1)
  %81 = add i64 %pgocount1, 1
  store i64 %81, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAseparate8bittile, i64 0, i64 1)
  %82 = load i32, i32* %19, align 4
  %83 = load i8*, i8** %21, align 8
  %84 = sext i32 %82 to i64
  %85 = getelementptr inbounds i8, i8* %83, i64 %84
  store i8* %85, i8** %21, align 8
  %86 = load i32, i32* %19, align 4
  %87 = load i8*, i8** %22, align 8
  %88 = sext i32 %86 to i64
  %89 = getelementptr inbounds i8, i8* %87, i64 %88
  store i8* %89, i8** %22, align 8
  %90 = load i32, i32* %19, align 4
  %91 = load i8*, i8** %23, align 8
  %92 = sext i32 %90 to i64
  %93 = getelementptr inbounds i8, i8* %91, i64 %92
  store i8* %93, i8** %23, align 8
  %94 = load i32, i32* %19, align 4
  %95 = load i8*, i8** %24, align 8
  %96 = sext i32 %94 to i64
  %97 = getelementptr inbounds i8, i8* %95, i64 %96
  store i8* %97, i8** %24, align 8
  %98 = load i32, i32* %20, align 4
  %99 = load i32*, i32** %14, align 8
  %100 = sext i32 %98 to i64
  %101 = getelementptr inbounds i32, i32* %99, i64 %100
  store i32* %101, i32** %14, align 8
  br label %31

; <label>:102:                                    ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAseparate8bittile, i64 0, i64 2)
  %103 = add i64 %pgocount2, 1
  store i64 %103, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAseparate8bittile, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putRGBseparate8bittile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*) #0 {
  %13 = alloca %struct._TIFFRGBAImage*, align 8
  %14 = alloca i32*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i8*, align 8
  %22 = alloca i8*, align 8
  %23 = alloca i8*, align 8
  %24 = alloca i8*, align 8
  %25 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %13, align 8
  store i32* %1, i32** %14, align 8
  store i32 %2, i32* %15, align 4
  store i32 %3, i32* %16, align 4
  store i32 %4, i32* %17, align 4
  store i32 %5, i32* %18, align 4
  store i32 %6, i32* %19, align 4
  store i32 %7, i32* %20, align 4
  store i8* %8, i8** %21, align 8
  store i8* %9, i8** %22, align 8
  store i8* %10, i8** %23, align 8
  store i8* %11, i8** %24, align 8
  %26 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %13, align 8
  %27 = load i32, i32* %15, align 4
  %28 = load i32, i32* %16, align 4
  %29 = load i8*, i8** %24, align 8
  br label %30

; <label>:30:                                     ; preds = %350, %12
  %31 = load i32, i32* %18, align 4
  %32 = add i32 %31, -1
  store i32 %32, i32* %18, align 4
  %33 = icmp ugt i32 %31, 0
  br i1 %33, label %34, label %368

; <label>:34:                                     ; preds = %30
  %35 = load i32, i32* %17, align 4
  store i32 %35, i32* %25, align 4
  br label %36

; <label>:36:                                     ; preds = %192, %34
  %37 = load i32, i32* %25, align 4
  %38 = icmp uge i32 %37, 8
  br i1 %38, label %39, label %196

; <label>:39:                                     ; preds = %36
  %40 = load i8*, i8** %21, align 8
  %41 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %41, i8** %21, align 8
  %42 = load i8, i8* %40, align 1
  %43 = zext i8 %42 to i32
  %44 = load i8*, i8** %22, align 8
  %45 = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %45, i8** %22, align 8
  %46 = load i8, i8* %44, align 1
  %47 = zext i8 %46 to i32
  %48 = shl i32 %47, 8
  %49 = or i32 %43, %48
  %50 = load i8*, i8** %23, align 8
  %51 = getelementptr inbounds i8, i8* %50, i32 1
  store i8* %51, i8** %23, align 8
  %52 = load i8, i8* %50, align 1
  %53 = zext i8 %52 to i32
  %54 = shl i32 %53, 16
  %55 = or i32 %49, %54
  %56 = or i32 %55, -16777216
  %57 = load i32*, i32** %14, align 8
  %58 = getelementptr inbounds i32, i32* %57, i32 1
  store i32* %58, i32** %14, align 8
  store i32 %56, i32* %57, align 4
  %59 = load i8*, i8** %21, align 8
  %60 = getelementptr inbounds i8, i8* %59, i32 1
  store i8* %60, i8** %21, align 8
  %61 = load i8, i8* %59, align 1
  %62 = zext i8 %61 to i32
  %63 = load i8*, i8** %22, align 8
  %64 = getelementptr inbounds i8, i8* %63, i32 1
  store i8* %64, i8** %22, align 8
  %65 = load i8, i8* %63, align 1
  %66 = zext i8 %65 to i32
  %67 = shl i32 %66, 8
  %68 = or i32 %62, %67
  %69 = load i8*, i8** %23, align 8
  %70 = getelementptr inbounds i8, i8* %69, i32 1
  store i8* %70, i8** %23, align 8
  %71 = load i8, i8* %69, align 1
  %72 = zext i8 %71 to i32
  %73 = shl i32 %72, 16
  %74 = or i32 %68, %73
  %75 = or i32 %74, -16777216
  %76 = load i32*, i32** %14, align 8
  %77 = getelementptr inbounds i32, i32* %76, i32 1
  store i32* %77, i32** %14, align 8
  store i32 %75, i32* %76, align 4
  %78 = load i8*, i8** %21, align 8
  %79 = getelementptr inbounds i8, i8* %78, i32 1
  store i8* %79, i8** %21, align 8
  %80 = load i8, i8* %78, align 1
  %81 = zext i8 %80 to i32
  %82 = load i8*, i8** %22, align 8
  %83 = getelementptr inbounds i8, i8* %82, i32 1
  store i8* %83, i8** %22, align 8
  %84 = load i8, i8* %82, align 1
  %85 = zext i8 %84 to i32
  %86 = shl i32 %85, 8
  %87 = or i32 %81, %86
  %88 = load i8*, i8** %23, align 8
  %89 = getelementptr inbounds i8, i8* %88, i32 1
  store i8* %89, i8** %23, align 8
  %90 = load i8, i8* %88, align 1
  %91 = zext i8 %90 to i32
  %92 = shl i32 %91, 16
  %93 = or i32 %87, %92
  %94 = or i32 %93, -16777216
  %95 = load i32*, i32** %14, align 8
  %96 = getelementptr inbounds i32, i32* %95, i32 1
  store i32* %96, i32** %14, align 8
  store i32 %94, i32* %95, align 4
  %97 = load i8*, i8** %21, align 8
  %98 = getelementptr inbounds i8, i8* %97, i32 1
  store i8* %98, i8** %21, align 8
  %99 = load i8, i8* %97, align 1
  %100 = zext i8 %99 to i32
  %101 = load i8*, i8** %22, align 8
  %102 = getelementptr inbounds i8, i8* %101, i32 1
  store i8* %102, i8** %22, align 8
  %103 = load i8, i8* %101, align 1
  %104 = zext i8 %103 to i32
  %105 = shl i32 %104, 8
  %106 = or i32 %100, %105
  %107 = load i8*, i8** %23, align 8
  %108 = getelementptr inbounds i8, i8* %107, i32 1
  store i8* %108, i8** %23, align 8
  %109 = load i8, i8* %107, align 1
  %110 = zext i8 %109 to i32
  %111 = shl i32 %110, 16
  %112 = or i32 %106, %111
  %113 = or i32 %112, -16777216
  %114 = load i32*, i32** %14, align 8
  %115 = getelementptr inbounds i32, i32* %114, i32 1
  store i32* %115, i32** %14, align 8
  store i32 %113, i32* %114, align 4
  %116 = load i8*, i8** %21, align 8
  %117 = getelementptr inbounds i8, i8* %116, i32 1
  store i8* %117, i8** %21, align 8
  %118 = load i8, i8* %116, align 1
  %119 = zext i8 %118 to i32
  %120 = load i8*, i8** %22, align 8
  %121 = getelementptr inbounds i8, i8* %120, i32 1
  store i8* %121, i8** %22, align 8
  %122 = load i8, i8* %120, align 1
  %123 = zext i8 %122 to i32
  %124 = shl i32 %123, 8
  %125 = or i32 %119, %124
  %126 = load i8*, i8** %23, align 8
  %127 = getelementptr inbounds i8, i8* %126, i32 1
  store i8* %127, i8** %23, align 8
  %128 = load i8, i8* %126, align 1
  %129 = zext i8 %128 to i32
  %130 = shl i32 %129, 16
  %131 = or i32 %125, %130
  %132 = or i32 %131, -16777216
  %133 = load i32*, i32** %14, align 8
  %134 = getelementptr inbounds i32, i32* %133, i32 1
  store i32* %134, i32** %14, align 8
  store i32 %132, i32* %133, align 4
  %135 = load i8*, i8** %21, align 8
  %136 = getelementptr inbounds i8, i8* %135, i32 1
  store i8* %136, i8** %21, align 8
  %137 = load i8, i8* %135, align 1
  %138 = zext i8 %137 to i32
  %139 = load i8*, i8** %22, align 8
  %140 = getelementptr inbounds i8, i8* %139, i32 1
  store i8* %140, i8** %22, align 8
  %141 = load i8, i8* %139, align 1
  %142 = zext i8 %141 to i32
  %143 = shl i32 %142, 8
  %144 = or i32 %138, %143
  %145 = load i8*, i8** %23, align 8
  %146 = getelementptr inbounds i8, i8* %145, i32 1
  store i8* %146, i8** %23, align 8
  %147 = load i8, i8* %145, align 1
  %148 = zext i8 %147 to i32
  %149 = shl i32 %148, 16
  %150 = or i32 %144, %149
  %151 = or i32 %150, -16777216
  %152 = load i32*, i32** %14, align 8
  %153 = getelementptr inbounds i32, i32* %152, i32 1
  store i32* %153, i32** %14, align 8
  store i32 %151, i32* %152, align 4
  %154 = load i8*, i8** %21, align 8
  %155 = getelementptr inbounds i8, i8* %154, i32 1
  store i8* %155, i8** %21, align 8
  %156 = load i8, i8* %154, align 1
  %157 = zext i8 %156 to i32
  %158 = load i8*, i8** %22, align 8
  %159 = getelementptr inbounds i8, i8* %158, i32 1
  store i8* %159, i8** %22, align 8
  %160 = load i8, i8* %158, align 1
  %161 = zext i8 %160 to i32
  %162 = shl i32 %161, 8
  %163 = or i32 %157, %162
  %164 = load i8*, i8** %23, align 8
  %165 = getelementptr inbounds i8, i8* %164, i32 1
  store i8* %165, i8** %23, align 8
  %166 = load i8, i8* %164, align 1
  %167 = zext i8 %166 to i32
  %168 = shl i32 %167, 16
  %169 = or i32 %163, %168
  %170 = or i32 %169, -16777216
  %171 = load i32*, i32** %14, align 8
  %172 = getelementptr inbounds i32, i32* %171, i32 1
  store i32* %172, i32** %14, align 8
  store i32 %170, i32* %171, align 4
  %173 = load i8*, i8** %21, align 8
  %174 = getelementptr inbounds i8, i8* %173, i32 1
  store i8* %174, i8** %21, align 8
  %175 = load i8, i8* %173, align 1
  %176 = zext i8 %175 to i32
  %177 = load i8*, i8** %22, align 8
  %178 = getelementptr inbounds i8, i8* %177, i32 1
  store i8* %178, i8** %22, align 8
  %179 = load i8, i8* %177, align 1
  %180 = zext i8 %179 to i32
  %181 = shl i32 %180, 8
  %182 = or i32 %176, %181
  %183 = load i8*, i8** %23, align 8
  %184 = getelementptr inbounds i8, i8* %183, i32 1
  store i8* %184, i8** %23, align 8
  %185 = load i8, i8* %183, align 1
  %186 = zext i8 %185 to i32
  %187 = shl i32 %186, 16
  %188 = or i32 %182, %187
  %189 = or i32 %188, -16777216
  %190 = load i32*, i32** %14, align 8
  %191 = getelementptr inbounds i32, i32* %190, i32 1
  store i32* %191, i32** %14, align 8
  store i32 %189, i32* %190, align 4
  br label %192

; <label>:192:                                    ; preds = %39
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 0)
  %193 = add i64 %pgocount, 1
  store i64 %193, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 0)
  %194 = load i32, i32* %25, align 4
  %195 = sub i32 %194, 8
  store i32 %195, i32* %25, align 4
  br label %36

; <label>:196:                                    ; preds = %36
  %197 = load i32, i32* %25, align 4
  %198 = icmp ugt i32 %197, 0
  br i1 %198, label %199, label %350

; <label>:199:                                    ; preds = %196
  %200 = load i32, i32* %25, align 4
  switch i32 %200, label %348 [
    i32 7, label %201
    i32 6, label %222
    i32 5, label %243
    i32 4, label %264
    i32 3, label %285
    i32 2, label %306
    i32 1, label %327
  ]

; <label>:201:                                    ; preds = %199
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 9)
  %202 = add i64 %pgocount1, 1
  store i64 %202, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 9)
  %203 = load i8*, i8** %21, align 8
  %204 = getelementptr inbounds i8, i8* %203, i32 1
  store i8* %204, i8** %21, align 8
  %205 = load i8, i8* %203, align 1
  %206 = zext i8 %205 to i32
  %207 = load i8*, i8** %22, align 8
  %208 = getelementptr inbounds i8, i8* %207, i32 1
  store i8* %208, i8** %22, align 8
  %209 = load i8, i8* %207, align 1
  %210 = zext i8 %209 to i32
  %211 = shl i32 %210, 8
  %212 = or i32 %206, %211
  %213 = load i8*, i8** %23, align 8
  %214 = getelementptr inbounds i8, i8* %213, i32 1
  store i8* %214, i8** %23, align 8
  %215 = load i8, i8* %213, align 1
  %216 = zext i8 %215 to i32
  %217 = shl i32 %216, 16
  %218 = or i32 %212, %217
  %219 = or i32 %218, -16777216
  %220 = load i32*, i32** %14, align 8
  %221 = getelementptr inbounds i32, i32* %220, i32 1
  store i32* %221, i32** %14, align 8
  store i32 %219, i32* %220, align 4
  br label %222

; <label>:222:                                    ; preds = %201, %199
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 8)
  %223 = add i64 %pgocount2, 1
  store i64 %223, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 8)
  %224 = load i8*, i8** %21, align 8
  %225 = getelementptr inbounds i8, i8* %224, i32 1
  store i8* %225, i8** %21, align 8
  %226 = load i8, i8* %224, align 1
  %227 = zext i8 %226 to i32
  %228 = load i8*, i8** %22, align 8
  %229 = getelementptr inbounds i8, i8* %228, i32 1
  store i8* %229, i8** %22, align 8
  %230 = load i8, i8* %228, align 1
  %231 = zext i8 %230 to i32
  %232 = shl i32 %231, 8
  %233 = or i32 %227, %232
  %234 = load i8*, i8** %23, align 8
  %235 = getelementptr inbounds i8, i8* %234, i32 1
  store i8* %235, i8** %23, align 8
  %236 = load i8, i8* %234, align 1
  %237 = zext i8 %236 to i32
  %238 = shl i32 %237, 16
  %239 = or i32 %233, %238
  %240 = or i32 %239, -16777216
  %241 = load i32*, i32** %14, align 8
  %242 = getelementptr inbounds i32, i32* %241, i32 1
  store i32* %242, i32** %14, align 8
  store i32 %240, i32* %241, align 4
  br label %243

; <label>:243:                                    ; preds = %222, %199
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 7)
  %244 = add i64 %pgocount3, 1
  store i64 %244, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 7)
  %245 = load i8*, i8** %21, align 8
  %246 = getelementptr inbounds i8, i8* %245, i32 1
  store i8* %246, i8** %21, align 8
  %247 = load i8, i8* %245, align 1
  %248 = zext i8 %247 to i32
  %249 = load i8*, i8** %22, align 8
  %250 = getelementptr inbounds i8, i8* %249, i32 1
  store i8* %250, i8** %22, align 8
  %251 = load i8, i8* %249, align 1
  %252 = zext i8 %251 to i32
  %253 = shl i32 %252, 8
  %254 = or i32 %248, %253
  %255 = load i8*, i8** %23, align 8
  %256 = getelementptr inbounds i8, i8* %255, i32 1
  store i8* %256, i8** %23, align 8
  %257 = load i8, i8* %255, align 1
  %258 = zext i8 %257 to i32
  %259 = shl i32 %258, 16
  %260 = or i32 %254, %259
  %261 = or i32 %260, -16777216
  %262 = load i32*, i32** %14, align 8
  %263 = getelementptr inbounds i32, i32* %262, i32 1
  store i32* %263, i32** %14, align 8
  store i32 %261, i32* %262, align 4
  br label %264

; <label>:264:                                    ; preds = %243, %199
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 6)
  %265 = add i64 %pgocount4, 1
  store i64 %265, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 6)
  %266 = load i8*, i8** %21, align 8
  %267 = getelementptr inbounds i8, i8* %266, i32 1
  store i8* %267, i8** %21, align 8
  %268 = load i8, i8* %266, align 1
  %269 = zext i8 %268 to i32
  %270 = load i8*, i8** %22, align 8
  %271 = getelementptr inbounds i8, i8* %270, i32 1
  store i8* %271, i8** %22, align 8
  %272 = load i8, i8* %270, align 1
  %273 = zext i8 %272 to i32
  %274 = shl i32 %273, 8
  %275 = or i32 %269, %274
  %276 = load i8*, i8** %23, align 8
  %277 = getelementptr inbounds i8, i8* %276, i32 1
  store i8* %277, i8** %23, align 8
  %278 = load i8, i8* %276, align 1
  %279 = zext i8 %278 to i32
  %280 = shl i32 %279, 16
  %281 = or i32 %275, %280
  %282 = or i32 %281, -16777216
  %283 = load i32*, i32** %14, align 8
  %284 = getelementptr inbounds i32, i32* %283, i32 1
  store i32* %284, i32** %14, align 8
  store i32 %282, i32* %283, align 4
  br label %285

; <label>:285:                                    ; preds = %264, %199
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 5)
  %286 = add i64 %pgocount5, 1
  store i64 %286, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 5)
  %287 = load i8*, i8** %21, align 8
  %288 = getelementptr inbounds i8, i8* %287, i32 1
  store i8* %288, i8** %21, align 8
  %289 = load i8, i8* %287, align 1
  %290 = zext i8 %289 to i32
  %291 = load i8*, i8** %22, align 8
  %292 = getelementptr inbounds i8, i8* %291, i32 1
  store i8* %292, i8** %22, align 8
  %293 = load i8, i8* %291, align 1
  %294 = zext i8 %293 to i32
  %295 = shl i32 %294, 8
  %296 = or i32 %290, %295
  %297 = load i8*, i8** %23, align 8
  %298 = getelementptr inbounds i8, i8* %297, i32 1
  store i8* %298, i8** %23, align 8
  %299 = load i8, i8* %297, align 1
  %300 = zext i8 %299 to i32
  %301 = shl i32 %300, 16
  %302 = or i32 %296, %301
  %303 = or i32 %302, -16777216
  %304 = load i32*, i32** %14, align 8
  %305 = getelementptr inbounds i32, i32* %304, i32 1
  store i32* %305, i32** %14, align 8
  store i32 %303, i32* %304, align 4
  br label %306

; <label>:306:                                    ; preds = %285, %199
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 4)
  %307 = add i64 %pgocount6, 1
  store i64 %307, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 4)
  %308 = load i8*, i8** %21, align 8
  %309 = getelementptr inbounds i8, i8* %308, i32 1
  store i8* %309, i8** %21, align 8
  %310 = load i8, i8* %308, align 1
  %311 = zext i8 %310 to i32
  %312 = load i8*, i8** %22, align 8
  %313 = getelementptr inbounds i8, i8* %312, i32 1
  store i8* %313, i8** %22, align 8
  %314 = load i8, i8* %312, align 1
  %315 = zext i8 %314 to i32
  %316 = shl i32 %315, 8
  %317 = or i32 %311, %316
  %318 = load i8*, i8** %23, align 8
  %319 = getelementptr inbounds i8, i8* %318, i32 1
  store i8* %319, i8** %23, align 8
  %320 = load i8, i8* %318, align 1
  %321 = zext i8 %320 to i32
  %322 = shl i32 %321, 16
  %323 = or i32 %317, %322
  %324 = or i32 %323, -16777216
  %325 = load i32*, i32** %14, align 8
  %326 = getelementptr inbounds i32, i32* %325, i32 1
  store i32* %326, i32** %14, align 8
  store i32 %324, i32* %325, align 4
  br label %327

; <label>:327:                                    ; preds = %306, %199
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 3)
  %328 = add i64 %pgocount7, 1
  store i64 %328, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 3)
  %329 = load i8*, i8** %21, align 8
  %330 = getelementptr inbounds i8, i8* %329, i32 1
  store i8* %330, i8** %21, align 8
  %331 = load i8, i8* %329, align 1
  %332 = zext i8 %331 to i32
  %333 = load i8*, i8** %22, align 8
  %334 = getelementptr inbounds i8, i8* %333, i32 1
  store i8* %334, i8** %22, align 8
  %335 = load i8, i8* %333, align 1
  %336 = zext i8 %335 to i32
  %337 = shl i32 %336, 8
  %338 = or i32 %332, %337
  %339 = load i8*, i8** %23, align 8
  %340 = getelementptr inbounds i8, i8* %339, i32 1
  store i8* %340, i8** %23, align 8
  %341 = load i8, i8* %339, align 1
  %342 = zext i8 %341 to i32
  %343 = shl i32 %342, 16
  %344 = or i32 %338, %343
  %345 = or i32 %344, -16777216
  %346 = load i32*, i32** %14, align 8
  %347 = getelementptr inbounds i32, i32* %346, i32 1
  store i32* %347, i32** %14, align 8
  store i32 %345, i32* %346, align 4
  br label %348

; <label>:348:                                    ; preds = %327, %199
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 2)
  %349 = add i64 %pgocount8, 1
  store i64 %349, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 2)
  br label %350

; <label>:350:                                    ; preds = %348, %196
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 1)
  %351 = add i64 %pgocount9, 1
  store i64 %351, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 1)
  %352 = load i32, i32* %19, align 4
  %353 = load i8*, i8** %21, align 8
  %354 = sext i32 %352 to i64
  %355 = getelementptr inbounds i8, i8* %353, i64 %354
  store i8* %355, i8** %21, align 8
  %356 = load i32, i32* %19, align 4
  %357 = load i8*, i8** %22, align 8
  %358 = sext i32 %356 to i64
  %359 = getelementptr inbounds i8, i8* %357, i64 %358
  store i8* %359, i8** %22, align 8
  %360 = load i32, i32* %19, align 4
  %361 = load i8*, i8** %23, align 8
  %362 = sext i32 %360 to i64
  %363 = getelementptr inbounds i8, i8* %361, i64 %362
  store i8* %363, i8** %23, align 8
  %364 = load i32, i32* %20, align 4
  %365 = load i32*, i32** %14, align 8
  %366 = sext i32 %364 to i64
  %367 = getelementptr inbounds i32, i32* %365, i64 %366
  store i32* %367, i32** %14, align 8
  br label %30

; <label>:368:                                    ; preds = %30
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 10)
  %369 = add i64 %pgocount10, 1
  store i64 %369, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_putRGBseparate8bittile, i64 0, i64 10)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putRGBseparate8bitMaptile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*) #0 {
  %13 = alloca %struct._TIFFRGBAImage*, align 8
  %14 = alloca i32*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i8*, align 8
  %22 = alloca i8*, align 8
  %23 = alloca i8*, align 8
  %24 = alloca i8*, align 8
  %25 = alloca i8*, align 8
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %13, align 8
  store i32* %1, i32** %14, align 8
  store i32 %2, i32* %15, align 4
  store i32 %3, i32* %16, align 4
  store i32 %4, i32* %17, align 4
  store i32 %5, i32* %18, align 4
  store i32 %6, i32* %19, align 4
  store i32 %7, i32* %20, align 4
  store i8* %8, i8** %21, align 8
  store i8* %9, i8** %22, align 8
  store i8* %10, i8** %23, align 8
  store i8* %11, i8** %24, align 8
  %26 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %13, align 8
  %27 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %26, i32 0, i32 15
  %28 = load i8*, i8** %27, align 8
  store i8* %28, i8** %25, align 8
  %29 = load i32, i32* %16, align 4
  %30 = load i8*, i8** %24, align 8
  br label %31

; <label>:31:                                     ; preds = %76, %12
  %32 = load i32, i32* %18, align 4
  %33 = add i32 %32, -1
  store i32 %33, i32* %18, align 4
  %34 = icmp ugt i32 %32, 0
  br i1 %34, label %35, label %94

; <label>:35:                                     ; preds = %31
  %36 = load i32, i32* %17, align 4
  store i32 %36, i32* %15, align 4
  br label %37

; <label>:37:                                     ; preds = %72, %35
  %38 = load i32, i32* %15, align 4
  %39 = icmp ugt i32 %38, 0
  br i1 %39, label %40, label %76

; <label>:40:                                     ; preds = %37
  %41 = load i8*, i8** %25, align 8
  %42 = load i8*, i8** %21, align 8
  %43 = getelementptr inbounds i8, i8* %42, i32 1
  store i8* %43, i8** %21, align 8
  %44 = load i8, i8* %42, align 1
  %45 = zext i8 %44 to i64
  %46 = getelementptr inbounds i8, i8* %41, i64 %45
  %47 = load i8, i8* %46, align 1
  %48 = zext i8 %47 to i32
  %49 = load i8*, i8** %25, align 8
  %50 = load i8*, i8** %22, align 8
  %51 = getelementptr inbounds i8, i8* %50, i32 1
  store i8* %51, i8** %22, align 8
  %52 = load i8, i8* %50, align 1
  %53 = zext i8 %52 to i64
  %54 = getelementptr inbounds i8, i8* %49, i64 %53
  %55 = load i8, i8* %54, align 1
  %56 = zext i8 %55 to i32
  %57 = shl i32 %56, 8
  %58 = or i32 %48, %57
  %59 = load i8*, i8** %25, align 8
  %60 = load i8*, i8** %23, align 8
  %61 = getelementptr inbounds i8, i8* %60, i32 1
  store i8* %61, i8** %23, align 8
  %62 = load i8, i8* %60, align 1
  %63 = zext i8 %62 to i64
  %64 = getelementptr inbounds i8, i8* %59, i64 %63
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = shl i32 %66, 16
  %68 = or i32 %58, %67
  %69 = or i32 %68, -16777216
  %70 = load i32*, i32** %14, align 8
  %71 = getelementptr inbounds i32, i32* %70, i32 1
  store i32* %71, i32** %14, align 8
  store i32 %69, i32* %70, align 4
  br label %72

; <label>:72:                                     ; preds = %40
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBseparate8bitMaptile, i64 0, i64 0)
  %73 = add i64 %pgocount, 1
  store i64 %73, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBseparate8bitMaptile, i64 0, i64 0)
  %74 = load i32, i32* %15, align 4
  %75 = add i32 %74, -1
  store i32 %75, i32* %15, align 4
  br label %37

; <label>:76:                                     ; preds = %37
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBseparate8bitMaptile, i64 0, i64 1)
  %77 = add i64 %pgocount1, 1
  store i64 %77, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBseparate8bitMaptile, i64 0, i64 1)
  %78 = load i32, i32* %19, align 4
  %79 = load i8*, i8** %21, align 8
  %80 = sext i32 %78 to i64
  %81 = getelementptr inbounds i8, i8* %79, i64 %80
  store i8* %81, i8** %21, align 8
  %82 = load i32, i32* %19, align 4
  %83 = load i8*, i8** %22, align 8
  %84 = sext i32 %82 to i64
  %85 = getelementptr inbounds i8, i8* %83, i64 %84
  store i8* %85, i8** %22, align 8
  %86 = load i32, i32* %19, align 4
  %87 = load i8*, i8** %23, align 8
  %88 = sext i32 %86 to i64
  %89 = getelementptr inbounds i8, i8* %87, i64 %88
  store i8* %89, i8** %23, align 8
  %90 = load i32, i32* %20, align 4
  %91 = load i32*, i32** %14, align 8
  %92 = sext i32 %90 to i64
  %93 = getelementptr inbounds i32, i32* %91, i64 %92
  store i32* %93, i32** %14, align 8
  br label %31

; <label>:94:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBseparate8bitMaptile, i64 0, i64 2)
  %95 = add i64 %pgocount2, 1
  store i64 %95, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBseparate8bitMaptile, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putRGBseparate16bittile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*) #0 {
  %13 = alloca %struct._TIFFRGBAImage*, align 8
  %14 = alloca i32*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i8*, align 8
  %22 = alloca i8*, align 8
  %23 = alloca i8*, align 8
  %24 = alloca i8*, align 8
  %25 = alloca i16*, align 8
  %26 = alloca i16*, align 8
  %27 = alloca i16*, align 8
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %13, align 8
  store i32* %1, i32** %14, align 8
  store i32 %2, i32* %15, align 4
  store i32 %3, i32* %16, align 4
  store i32 %4, i32* %17, align 4
  store i32 %5, i32* %18, align 4
  store i32 %6, i32* %19, align 4
  store i32 %7, i32* %20, align 4
  store i8* %8, i8** %21, align 8
  store i8* %9, i8** %22, align 8
  store i8* %10, i8** %23, align 8
  store i8* %11, i8** %24, align 8
  %28 = load i8*, i8** %21, align 8
  %29 = bitcast i8* %28 to i16*
  store i16* %29, i16** %25, align 8
  %30 = load i8*, i8** %22, align 8
  %31 = bitcast i8* %30 to i16*
  store i16* %31, i16** %26, align 8
  %32 = load i8*, i8** %23, align 8
  %33 = bitcast i8* %32 to i16*
  store i16* %33, i16** %27, align 8
  %34 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %13, align 8
  %35 = load i32, i32* %16, align 4
  %36 = load i8*, i8** %24, align 8
  br label %37

; <label>:37:                                     ; preds = %76, %12
  %38 = load i32, i32* %18, align 4
  %39 = add i32 %38, -1
  store i32 %39, i32* %18, align 4
  %40 = icmp ugt i32 %38, 0
  br i1 %40, label %41, label %94

; <label>:41:                                     ; preds = %37
  store i32 0, i32* %15, align 4
  br label %42

; <label>:42:                                     ; preds = %72, %41
  %43 = load i32, i32* %15, align 4
  %44 = load i32, i32* %17, align 4
  %45 = icmp ult i32 %43, %44
  br i1 %45, label %46, label %76

; <label>:46:                                     ; preds = %42
  %47 = load i16*, i16** %25, align 8
  %48 = getelementptr inbounds i16, i16* %47, i32 1
  store i16* %48, i16** %25, align 8
  %49 = load i16, i16* %47, align 2
  %50 = zext i16 %49 to i32
  %51 = ashr i32 %50, 8
  %52 = and i32 %51, 255
  %53 = load i16*, i16** %26, align 8
  %54 = getelementptr inbounds i16, i16* %53, i32 1
  store i16* %54, i16** %26, align 8
  %55 = load i16, i16* %53, align 2
  %56 = zext i16 %55 to i32
  %57 = ashr i32 %56, 8
  %58 = and i32 %57, 255
  %59 = shl i32 %58, 8
  %60 = or i32 %52, %59
  %61 = load i16*, i16** %27, align 8
  %62 = getelementptr inbounds i16, i16* %61, i32 1
  store i16* %62, i16** %27, align 8
  %63 = load i16, i16* %61, align 2
  %64 = zext i16 %63 to i32
  %65 = ashr i32 %64, 8
  %66 = and i32 %65, 255
  %67 = shl i32 %66, 16
  %68 = or i32 %60, %67
  %69 = or i32 %68, -16777216
  %70 = load i32*, i32** %14, align 8
  %71 = getelementptr inbounds i32, i32* %70, i32 1
  store i32* %71, i32** %14, align 8
  store i32 %69, i32* %70, align 4
  br label %72

; <label>:72:                                     ; preds = %46
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBseparate16bittile, i64 0, i64 0)
  %73 = add i64 %pgocount, 1
  store i64 %73, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBseparate16bittile, i64 0, i64 0)
  %74 = load i32, i32* %15, align 4
  %75 = add i32 %74, 1
  store i32 %75, i32* %15, align 4
  br label %42

; <label>:76:                                     ; preds = %42
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBseparate16bittile, i64 0, i64 1)
  %77 = add i64 %pgocount1, 1
  store i64 %77, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBseparate16bittile, i64 0, i64 1)
  %78 = load i32, i32* %19, align 4
  %79 = load i16*, i16** %25, align 8
  %80 = sext i32 %78 to i64
  %81 = getelementptr inbounds i16, i16* %79, i64 %80
  store i16* %81, i16** %25, align 8
  %82 = load i32, i32* %19, align 4
  %83 = load i16*, i16** %26, align 8
  %84 = sext i32 %82 to i64
  %85 = getelementptr inbounds i16, i16* %83, i64 %84
  store i16* %85, i16** %26, align 8
  %86 = load i32, i32* %19, align 4
  %87 = load i16*, i16** %27, align 8
  %88 = sext i32 %86 to i64
  %89 = getelementptr inbounds i16, i16* %87, i64 %88
  store i16* %89, i16** %27, align 8
  %90 = load i32, i32* %20, align 4
  %91 = load i32*, i32** %14, align 8
  %92 = sext i32 %90 to i64
  %93 = getelementptr inbounds i32, i32* %91, i64 %92
  store i32* %93, i32** %14, align 8
  br label %37

; <label>:94:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBseparate16bittile, i64 0, i64 2)
  %95 = add i64 %pgocount2, 1
  store i64 %95, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBseparate16bittile, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putRGBAAseparate16bittile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*) #0 {
  %13 = alloca %struct._TIFFRGBAImage*, align 8
  %14 = alloca i32*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i8*, align 8
  %22 = alloca i8*, align 8
  %23 = alloca i8*, align 8
  %24 = alloca i8*, align 8
  %25 = alloca i16*, align 8
  %26 = alloca i16*, align 8
  %27 = alloca i16*, align 8
  %28 = alloca i16*, align 8
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %13, align 8
  store i32* %1, i32** %14, align 8
  store i32 %2, i32* %15, align 4
  store i32 %3, i32* %16, align 4
  store i32 %4, i32* %17, align 4
  store i32 %5, i32* %18, align 4
  store i32 %6, i32* %19, align 4
  store i32 %7, i32* %20, align 4
  store i8* %8, i8** %21, align 8
  store i8* %9, i8** %22, align 8
  store i8* %10, i8** %23, align 8
  store i8* %11, i8** %24, align 8
  %29 = load i8*, i8** %21, align 8
  %30 = bitcast i8* %29 to i16*
  store i16* %30, i16** %25, align 8
  %31 = load i8*, i8** %22, align 8
  %32 = bitcast i8* %31 to i16*
  store i16* %32, i16** %26, align 8
  %33 = load i8*, i8** %23, align 8
  %34 = bitcast i8* %33 to i16*
  store i16* %34, i16** %27, align 8
  %35 = load i8*, i8** %24, align 8
  %36 = bitcast i8* %35 to i16*
  store i16* %36, i16** %28, align 8
  %37 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %13, align 8
  %38 = load i32, i32* %16, align 4
  br label %39

; <label>:39:                                     ; preds = %85, %12
  %40 = load i32, i32* %18, align 4
  %41 = add i32 %40, -1
  store i32 %41, i32* %18, align 4
  %42 = icmp ugt i32 %40, 0
  br i1 %42, label %43, label %107

; <label>:43:                                     ; preds = %39
  store i32 0, i32* %15, align 4
  br label %44

; <label>:44:                                     ; preds = %81, %43
  %45 = load i32, i32* %15, align 4
  %46 = load i32, i32* %17, align 4
  %47 = icmp ult i32 %45, %46
  br i1 %47, label %48, label %85

; <label>:48:                                     ; preds = %44
  %49 = load i16*, i16** %25, align 8
  %50 = getelementptr inbounds i16, i16* %49, i32 1
  store i16* %50, i16** %25, align 8
  %51 = load i16, i16* %49, align 2
  %52 = zext i16 %51 to i32
  %53 = ashr i32 %52, 8
  %54 = and i32 %53, 255
  %55 = load i16*, i16** %26, align 8
  %56 = getelementptr inbounds i16, i16* %55, i32 1
  store i16* %56, i16** %26, align 8
  %57 = load i16, i16* %55, align 2
  %58 = zext i16 %57 to i32
  %59 = ashr i32 %58, 8
  %60 = and i32 %59, 255
  %61 = shl i32 %60, 8
  %62 = or i32 %54, %61
  %63 = load i16*, i16** %27, align 8
  %64 = getelementptr inbounds i16, i16* %63, i32 1
  store i16* %64, i16** %27, align 8
  %65 = load i16, i16* %63, align 2
  %66 = zext i16 %65 to i32
  %67 = ashr i32 %66, 8
  %68 = and i32 %67, 255
  %69 = shl i32 %68, 16
  %70 = or i32 %62, %69
  %71 = load i16*, i16** %28, align 8
  %72 = getelementptr inbounds i16, i16* %71, i32 1
  store i16* %72, i16** %28, align 8
  %73 = load i16, i16* %71, align 2
  %74 = zext i16 %73 to i32
  %75 = ashr i32 %74, 8
  %76 = and i32 %75, 255
  %77 = shl i32 %76, 24
  %78 = or i32 %70, %77
  %79 = load i32*, i32** %14, align 8
  %80 = getelementptr inbounds i32, i32* %79, i32 1
  store i32* %80, i32** %14, align 8
  store i32 %78, i32* %79, align 4
  br label %81

; <label>:81:                                     ; preds = %48
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBAAseparate16bittile, i64 0, i64 0)
  %82 = add i64 %pgocount, 1
  store i64 %82, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBAAseparate16bittile, i64 0, i64 0)
  %83 = load i32, i32* %15, align 4
  %84 = add i32 %83, 1
  store i32 %84, i32* %15, align 4
  br label %44

; <label>:85:                                     ; preds = %44
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBAAseparate16bittile, i64 0, i64 1)
  %86 = add i64 %pgocount1, 1
  store i64 %86, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBAAseparate16bittile, i64 0, i64 1)
  %87 = load i32, i32* %19, align 4
  %88 = load i16*, i16** %25, align 8
  %89 = sext i32 %87 to i64
  %90 = getelementptr inbounds i16, i16* %88, i64 %89
  store i16* %90, i16** %25, align 8
  %91 = load i32, i32* %19, align 4
  %92 = load i16*, i16** %26, align 8
  %93 = sext i32 %91 to i64
  %94 = getelementptr inbounds i16, i16* %92, i64 %93
  store i16* %94, i16** %26, align 8
  %95 = load i32, i32* %19, align 4
  %96 = load i16*, i16** %27, align 8
  %97 = sext i32 %95 to i64
  %98 = getelementptr inbounds i16, i16* %96, i64 %97
  store i16* %98, i16** %27, align 8
  %99 = load i32, i32* %19, align 4
  %100 = load i16*, i16** %28, align 8
  %101 = sext i32 %99 to i64
  %102 = getelementptr inbounds i16, i16* %100, i64 %101
  store i16* %102, i16** %28, align 8
  %103 = load i32, i32* %20, align 4
  %104 = load i32*, i32** %14, align 8
  %105 = sext i32 %103 to i64
  %106 = getelementptr inbounds i32, i32* %104, i64 %105
  store i32* %106, i32** %14, align 8
  br label %39

; <label>:107:                                    ; preds = %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBAAseparate16bittile, i64 0, i64 2)
  %108 = add i64 %pgocount2, 1
  store i64 %108, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBAAseparate16bittile, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putRGBUAseparate16bittile(%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*) #0 {
  %13 = alloca %struct._TIFFRGBAImage*, align 8
  %14 = alloca i32*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i8*, align 8
  %22 = alloca i8*, align 8
  %23 = alloca i8*, align 8
  %24 = alloca i8*, align 8
  %25 = alloca i16*, align 8
  %26 = alloca i16*, align 8
  %27 = alloca i16*, align 8
  %28 = alloca i16*, align 8
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  store %struct._TIFFRGBAImage* %0, %struct._TIFFRGBAImage** %13, align 8
  store i32* %1, i32** %14, align 8
  store i32 %2, i32* %15, align 4
  store i32 %3, i32* %16, align 4
  store i32 %4, i32* %17, align 4
  store i32 %5, i32* %18, align 4
  store i32 %6, i32* %19, align 4
  store i32 %7, i32* %20, align 4
  store i8* %8, i8** %21, align 8
  store i8* %9, i8** %22, align 8
  store i8* %10, i8** %23, align 8
  store i8* %11, i8** %24, align 8
  %33 = load i8*, i8** %21, align 8
  %34 = bitcast i8* %33 to i16*
  store i16* %34, i16** %25, align 8
  %35 = load i8*, i8** %22, align 8
  %36 = bitcast i8* %35 to i16*
  store i16* %36, i16** %26, align 8
  %37 = load i8*, i8** %23, align 8
  %38 = bitcast i8* %37 to i16*
  store i16* %38, i16** %27, align 8
  %39 = load i8*, i8** %24, align 8
  %40 = bitcast i8* %39 to i16*
  store i16* %40, i16** %28, align 8
  %41 = load %struct._TIFFRGBAImage*, %struct._TIFFRGBAImage** %13, align 8
  %42 = load i32, i32* %16, align 4
  br label %43

; <label>:43:                                     ; preds = %93, %12
  %44 = load i32, i32* %18, align 4
  %45 = add i32 %44, -1
  store i32 %45, i32* %18, align 4
  %46 = icmp ugt i32 %44, 0
  br i1 %46, label %47, label %115

; <label>:47:                                     ; preds = %43
  %48 = load i32, i32* %17, align 4
  store i32 %48, i32* %15, align 4
  br label %49

; <label>:49:                                     ; preds = %53, %47
  %50 = load i32, i32* %15, align 4
  %51 = add i32 %50, -1
  store i32 %51, i32* %15, align 4
  %52 = icmp ugt i32 %50, 0
  br i1 %52, label %53, label %93

; <label>:53:                                     ; preds = %49
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAseparate16bittile, i64 0, i64 0)
  %54 = add i64 %pgocount, 1
  store i64 %54, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAseparate16bittile, i64 0, i64 0)
  %55 = load i16*, i16** %28, align 8
  %56 = getelementptr inbounds i16, i16* %55, i32 1
  store i16* %56, i16** %28, align 8
  %57 = load i16, i16* %55, align 2
  %58 = zext i16 %57 to i32
  %59 = ashr i32 %58, 4
  store i32 %59, i32* %32, align 4
  %60 = load i16*, i16** %25, align 8
  %61 = getelementptr inbounds i16, i16* %60, i32 1
  store i16* %61, i16** %25, align 8
  %62 = load i16, i16* %60, align 2
  %63 = zext i16 %62 to i32
  %64 = load i32, i32* %32, align 4
  %65 = mul i32 %63, %64
  %66 = udiv i32 %65, 69375
  store i32 %66, i32* %29, align 4
  %67 = load i16*, i16** %26, align 8
  %68 = getelementptr inbounds i16, i16* %67, i32 1
  store i16* %68, i16** %26, align 8
  %69 = load i16, i16* %67, align 2
  %70 = zext i16 %69 to i32
  %71 = load i32, i32* %32, align 4
  %72 = mul i32 %70, %71
  %73 = udiv i32 %72, 69375
  store i32 %73, i32* %30, align 4
  %74 = load i16*, i16** %27, align 8
  %75 = getelementptr inbounds i16, i16* %74, i32 1
  store i16* %75, i16** %27, align 8
  %76 = load i16, i16* %74, align 2
  %77 = zext i16 %76 to i32
  %78 = load i32, i32* %32, align 4
  %79 = mul i32 %77, %78
  %80 = udiv i32 %79, 69375
  store i32 %80, i32* %31, align 4
  %81 = load i32, i32* %29, align 4
  %82 = load i32, i32* %30, align 4
  %83 = shl i32 %82, 8
  %84 = or i32 %81, %83
  %85 = load i32, i32* %31, align 4
  %86 = shl i32 %85, 16
  %87 = or i32 %84, %86
  %88 = load i32, i32* %32, align 4
  %89 = shl i32 %88, 24
  %90 = or i32 %87, %89
  %91 = load i32*, i32** %14, align 8
  %92 = getelementptr inbounds i32, i32* %91, i32 1
  store i32* %92, i32** %14, align 8
  store i32 %90, i32* %91, align 4
  br label %49

; <label>:93:                                     ; preds = %49
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAseparate16bittile, i64 0, i64 1)
  %94 = add i64 %pgocount1, 1
  store i64 %94, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAseparate16bittile, i64 0, i64 1)
  %95 = load i32, i32* %19, align 4
  %96 = load i16*, i16** %25, align 8
  %97 = sext i32 %95 to i64
  %98 = getelementptr inbounds i16, i16* %96, i64 %97
  store i16* %98, i16** %25, align 8
  %99 = load i32, i32* %19, align 4
  %100 = load i16*, i16** %26, align 8
  %101 = sext i32 %99 to i64
  %102 = getelementptr inbounds i16, i16* %100, i64 %101
  store i16* %102, i16** %26, align 8
  %103 = load i32, i32* %19, align 4
  %104 = load i16*, i16** %27, align 8
  %105 = sext i32 %103 to i64
  %106 = getelementptr inbounds i16, i16* %104, i64 %105
  store i16* %106, i16** %27, align 8
  %107 = load i32, i32* %19, align 4
  %108 = load i16*, i16** %28, align 8
  %109 = sext i32 %107 to i64
  %110 = getelementptr inbounds i16, i16* %108, i64 %109
  store i16* %110, i16** %28, align 8
  %111 = load i32, i32* %20, align 4
  %112 = load i32*, i32** %14, align 8
  %113 = sext i32 %111 to i64
  %114 = getelementptr inbounds i32, i32* %112, i64 %113
  store i32* %114, i32** %14, align 8
  br label %43

; <label>:115:                                    ; preds = %43
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAseparate16bittile, i64 0, i64 2)
  %116 = add i64 %pgocount2, 1
  store i64 %116, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_putRGBUAseparate16bittile, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #4

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
