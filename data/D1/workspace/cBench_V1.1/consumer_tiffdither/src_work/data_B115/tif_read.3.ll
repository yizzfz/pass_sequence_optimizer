; ModuleID = 'tif_read.2.ll'
source_filename = "tif_read.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [33 x i8] c"%ld: Strip out of range, max %ld\00", align 1
@TIFFReadRawStrip.module = internal constant [17 x i8] c"TIFFReadRawStrip\00", align 16
@.str.1 = private unnamed_addr constant [33 x i8] c"%lu: Strip out of range, max %lu\00", align 1
@.str.2 = private unnamed_addr constant [41 x i8] c"%lu: Invalid strip byte count, strip %lu\00", align 1
@.str.3 = private unnamed_addr constant [32 x i8] c"%ld: Tile out of range, max %ld\00", align 1
@TIFFReadRawTile.module = internal constant [16 x i8] c"TIFFReadRawTile\00", align 16
@.str.4 = private unnamed_addr constant [32 x i8] c"%lu: Tile out of range, max %lu\00", align 1
@TIFFReadBufferSetup.module = internal constant [20 x i8] c"TIFFReadBufferSetup\00", align 16
@.str.5 = private unnamed_addr constant [45 x i8] c"%s: No space for data buffer at scanline %ld\00", align 1
@.str.6 = private unnamed_addr constant [14 x i8] c"(cc & 1) == 0\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"tif_read.c\00", align 1
@__PRETTY_FUNCTION__._TIFFSwab16BitData = private unnamed_addr constant [51 x i8] c"void _TIFFSwab16BitData(TIFF *, tidata_t, tsize_t)\00", align 1
@.str.8 = private unnamed_addr constant [14 x i8] c"(cc & 3) == 0\00", align 1
@__PRETTY_FUNCTION__._TIFFSwab32BitData = private unnamed_addr constant [51 x i8] c"void _TIFFSwab32BitData(TIFF *, tidata_t, tsize_t)\00", align 1
@.str.9 = private unnamed_addr constant [14 x i8] c"(cc & 7) == 0\00", align 1
@__PRETTY_FUNCTION__._TIFFSwab64BitData = private unnamed_addr constant [51 x i8] c"void _TIFFSwab64BitData(TIFF *, tidata_t, tsize_t)\00", align 1
@.str.10 = private unnamed_addr constant [31 x i8] c"%lu: Row out of range, max %lu\00", align 1
@.str.11 = private unnamed_addr constant [34 x i8] c"%lu: Sample out of range, max %lu\00", align 1
@.str.12 = private unnamed_addr constant [42 x i8] c"%s: Seek error at scanline %lu, strip %lu\00", align 1
@.str.13 = private unnamed_addr constant [60 x i8] c"%s: Read error at scanline %lu; got %lu bytes, expected %lu\00", align 1
@.str.14 = private unnamed_addr constant [71 x i8] c"%s: Read error at scanline %lu, strip %lu; got %lu bytes, expected %lu\00", align 1
@TIFFFillStrip.module = internal constant [14 x i8] c"TIFFFillStrip\00", align 1
@.str.15 = private unnamed_addr constant [57 x i8] c"%s: Read error on strip %lu; got %lu bytes, expected %lu\00", align 1
@.str.16 = private unnamed_addr constant [44 x i8] c"%s: Data buffer too small to hold strip %lu\00", align 1
@.str.17 = private unnamed_addr constant [45 x i8] c"%s: Seek error at row %ld, col %ld, tile %ld\00", align 1
@.str.18 = private unnamed_addr constant [64 x i8] c"%s: Read error at row %ld, col %ld; got %lu bytes, expected %lu\00", align 1
@.str.19 = private unnamed_addr constant [74 x i8] c"%s: Read error at row %ld, col %ld, tile %ld; got %lu bytes, expected %lu\00", align 1
@TIFFFillTile.module = internal constant [13 x i8] c"TIFFFillTile\00", align 1
@.str.20 = private unnamed_addr constant [39 x i8] c"%lu: Invalid tile byte count, tile %lu\00", align 1
@.str.21 = private unnamed_addr constant [43 x i8] c"%s: Data buffer too small to hold tile %ld\00", align 1
@.str.22 = private unnamed_addr constant [26 x i8] c"File not open for reading\00", align 1
@.str.23 = private unnamed_addr constant [41 x i8] c"Can not read tiles from a stripped image\00", align 1
@.str.24 = private unnamed_addr constant [42 x i8] c"Can not read scanlines from a tiled image\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFReadScanline = private constant [16 x i8] c"TIFFReadScanline"
@__profn_tmp1.ll_TIFFCheckRead = private constant [21 x i8] c"tmp1.ll:TIFFCheckRead"
@__profn_tmp1.ll_TIFFSeek = private constant [16 x i8] c"tmp1.ll:TIFFSeek"
@__profn_TIFFReadEncodedStrip = private constant [20 x i8] c"TIFFReadEncodedStrip"
@__profn_tmp1.ll_TIFFFillStrip = private constant [21 x i8] c"tmp1.ll:TIFFFillStrip"
@__profn_TIFFReadRawStrip = private constant [16 x i8] c"TIFFReadRawStrip"
@__profn_tmp1.ll_TIFFReadRawStrip1 = private constant [25 x i8] c"tmp1.ll:TIFFReadRawStrip1"
@__profn_TIFFReadTile = private constant [12 x i8] c"TIFFReadTile"
@__profn_TIFFReadEncodedTile = private constant [19 x i8] c"TIFFReadEncodedTile"
@__profn_tmp1.ll_TIFFFillTile = private constant [20 x i8] c"tmp1.ll:TIFFFillTile"
@__profn_TIFFReadRawTile = private constant [15 x i8] c"TIFFReadRawTile"
@__profn_tmp1.ll_TIFFReadRawTile1 = private constant [24 x i8] c"tmp1.ll:TIFFReadRawTile1"
@__profn_TIFFReadBufferSetup = private constant [19 x i8] c"TIFFReadBufferSetup"
@__profn__TIFFNoPostDecode = private constant [17 x i8] c"_TIFFNoPostDecode"
@__profn__TIFFSwab16BitData = private constant [18 x i8] c"_TIFFSwab16BitData"
@__profn__TIFFSwab32BitData = private constant [18 x i8] c"_TIFFSwab32BitData"
@__profn__TIFFSwab64BitData = private constant [18 x i8] c"_TIFFSwab64BitData"
@__profn_tmp1.ll_TIFFStartStrip = private constant [22 x i8] c"tmp1.ll:TIFFStartStrip"
@__profn_tmp1.ll_TIFFStartTile = private constant [21 x i8] c"tmp1.ll:TIFFStartTile"
@__profc_TIFFReadScanline = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFReadScanline = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFReadScanline = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1332632148872660309, i64 72620599499295646, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadScanline, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @TIFFReadScanline to i8*), i8* bitcast ([2 x i64]* @__profvp_TIFFReadScanline to i8*), i32 5, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFCheckRead = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFCheckRead = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7896831328457015659, i64 72057636792291590, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFCheckRead, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFSeek = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_TIFFSeek = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_TIFFSeek = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4393570578482816101, i64 281615888328522, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_TIFFSeek to i8*), i32 10, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_TIFFReadEncodedStrip = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFReadEncodedStrip = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFReadEncodedStrip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6113730509573288478, i64 563065556997953, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReadEncodedStrip, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, i8*, i32)* @TIFFReadEncodedStrip to i8*), i8* bitcast ([2 x i64]* @__profvp_TIFFReadEncodedStrip to i8*), i32 9, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFillStrip = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFFillStrip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2578800717831926146, i64 170289170888, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i32 0, i32 0), i8* null, i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFReadRawStrip = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFReadRawStrip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9103451934681989435, i64 73480106038, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFReadRawStrip, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, i8*, i32)* @TIFFReadRawStrip to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFReadRawStrip1 = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_TIFFReadRawStrip1 = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_TIFFReadRawStrip1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2644772792078604573, i64 563021853841659, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawStrip1, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_TIFFReadRawStrip1 to i8*), i32 5, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_TIFFReadTile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFReadTile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6293659099475563791, i64 38490985531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFReadTile, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i32, i32, i16)* @TIFFReadTile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFReadEncodedTile = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFReadEncodedTile = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFReadEncodedTile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3549280398375023195, i64 563043921606778, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFReadEncodedTile, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, i8*, i32)* @TIFFReadEncodedTile to i8*), i8* bitcast ([2 x i64]* @__profvp_TIFFReadEncodedTile to i8*), i32 7, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFillTile = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFFillTile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4216402272077749108, i64 170289170888, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i32 0, i32 0), i8* null, i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFReadRawTile = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFReadRawTile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1890751007147950299, i64 60421498085, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRawTile, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, i8*, i32)* @TIFFReadRawTile to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFReadRawTile1 = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_TIFFReadRawTile1 = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_TIFFReadRawTile1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5237781343391253938, i64 563021853841659, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawTile1, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_TIFFReadRawTile1 to i8*), i32 5, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_TIFFReadBufferSetup = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFReadBufferSetup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3400029532425975649, i64 70826445435, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadBufferSetup, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32)* @TIFFReadBufferSetup to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFNoPostDecode = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFNoPostDecode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4785936540121177751, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoPostDecode, i32 0, i32 0), i8* bitcast (void (%struct.tiff*, i8*, i32)* @_TIFFNoPostDecode to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFSwab16BitData = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFSwab16BitData = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2660414173927978901, i64 33962515092, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSwab16BitData, i32 0, i32 0), i8* bitcast (void (%struct.tiff*, i8*, i32)* @_TIFFSwab16BitData to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFSwab32BitData = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFSwab32BitData = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9021815055066728468, i64 33962515092, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSwab32BitData, i32 0, i32 0), i8* bitcast (void (%struct.tiff*, i8*, i32)* @_TIFFSwab32BitData to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFSwab64BitData = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFSwab64BitData = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7757340366519886388, i64 33962515092, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSwab64BitData, i32 0, i32 0), i8* bitcast (void (%struct.tiff*, i8*, i32)* @_TIFFSwab64BitData to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFStartStrip = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_TIFFStartStrip = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_TIFFStartStrip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6558611799507632931, i64 562990027313300, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFStartStrip, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_TIFFStartStrip to i8*), i32 3, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFStartTile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_TIFFStartTile = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_TIFFStartTile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4312232875596858466, i64 562990027313300, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFStartTile, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_TIFFStartTile to i8*), i32 3, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [15 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [379 x i8] c"\F8\02\00TIFFReadScanline\01tmp1.ll:TIFFCheckRead\01tmp1.ll:TIFFSeek\01TIFFReadEncodedStrip\01tmp1.ll:TIFFFillStrip\01TIFFReadRawStrip\01tmp1.ll:TIFFReadRawStrip1\01TIFFReadTile\01TIFFReadEncodedTile\01tmp1.ll:TIFFFillTile\01TIFFReadRawTile\01tmp1.ll:TIFFReadRawTile1\01TIFFReadBufferSetup\01_TIFFNoPostDecode\01_TIFFSwab16BitData\01_TIFFSwab32BitData\01_TIFFSwab64BitData\01tmp1.ll:TIFFStartStrip\01tmp1.ll:TIFFStartTile", section "__llvm_prf_names"
@llvm.used = appending global [21 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadScanline to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFCheckRead to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFSeek to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadEncodedStrip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFillStrip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadRawStrip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFReadRawStrip1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadTile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadEncodedTile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFillTile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadRawTile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFReadRawTile1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadBufferSetup to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFNoPostDecode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFSwab16BitData to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFSwab32BitData to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFSwab64BitData to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFStartStrip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFStartTile to i8*), i8* bitcast ([15 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([379 x i8], [379 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadScanline(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %11 = load %struct.tiff*, %struct.tiff** %6, align 8
  %12 = call i32 @TIFFCheckRead(%struct.tiff* %11, i32 0)
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %16, label %14

; <label>:14:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadScanline, i64 0, i64 1)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadScanline, i64 0, i64 1)
  store i32 -1, i32* %5, align 4
  br label %60

; <label>:16:                                     ; preds = %4
  %17 = load %struct.tiff*, %struct.tiff** %6, align 8
  %18 = load i32, i32* %8, align 4
  %19 = load i16, i16* %9, align 2
  %20 = call i32 @TIFFSeek(%struct.tiff* %17, i32 %18, i16 zeroext %19)
  store i32 %20, i32* %10, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %53

; <label>:22:                                     ; preds = %16
  %23 = load %struct.tiff*, %struct.tiff** %6, align 8
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %23, i32 0, i32 26
  %25 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %24, align 8
  %26 = load %struct.tiff*, %struct.tiff** %6, align 8
  %27 = load i8*, i8** %7, align 8
  %28 = load %struct.tiff*, %struct.tiff** %6, align 8
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %28, i32 0, i32 38
  %30 = load i32, i32* %29, align 8
  %31 = load i16, i16* %9, align 2
  %32 = ptrtoint i32 (%struct.tiff*, i8*, i32, i16)* %25 to i64
  call void @__llvm_profile_instrument_target(i64 %32, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadScanline to i8*), i32 0)
  %33 = call i32 %25(%struct.tiff* %26, i8* %27, i32 %30, i16 zeroext %31)
  store i32 %33, i32* %10, align 4
  %34 = load %struct.tiff*, %struct.tiff** %6, align 8
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %34, i32 0, i32 11
  %36 = load i32, i32* %35, align 8
  %37 = add i32 %36, 1
  store i32 %37, i32* %35, align 8
  %38 = load i32, i32* %10, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %51

; <label>:40:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadScanline, i64 0, i64 3)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadScanline, i64 0, i64 3)
  %42 = load %struct.tiff*, %struct.tiff** %6, align 8
  %43 = getelementptr inbounds %struct.tiff, %struct.tiff* %42, i32 0, i32 54
  %44 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %43, align 8
  %45 = load %struct.tiff*, %struct.tiff** %6, align 8
  %46 = load i8*, i8** %7, align 8
  %47 = load %struct.tiff*, %struct.tiff** %6, align 8
  %48 = getelementptr inbounds %struct.tiff, %struct.tiff* %47, i32 0, i32 38
  %49 = load i32, i32* %48, align 8
  %50 = ptrtoint void (%struct.tiff*, i8*, i32)* %44 to i64
  call void @__llvm_profile_instrument_target(i64 %50, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadScanline to i8*), i32 1)
  call void %44(%struct.tiff* %45, i8* %46, i32 %49)
  br label %51

; <label>:51:                                     ; preds = %40, %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadScanline, i64 0, i64 2)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadScanline, i64 0, i64 2)
  br label %53

; <label>:53:                                     ; preds = %51, %16
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadScanline, i64 0, i64 0)
  %54 = add i64 %pgocount3, 1
  store i64 %54, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadScanline, i64 0, i64 0)
  %55 = load i32, i32* %10, align 4
  %56 = icmp sgt i32 %55, 0
  %57 = zext i1 %56 to i64
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadScanline, i64 0, i64 4)
  %58 = add i64 %pgocount4, %57
  store i64 %58, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadScanline, i64 0, i64 4)
  %59 = select i1 %56, i32 1, i32 -1
  store i32 %59, i32* %5, align 4
  br label %60

; <label>:60:                                     ; preds = %53, %14
  %61 = load i32, i32* %5, align 4
  ret i32 %61
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFCheckRead(%struct.tiff*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load %struct.tiff*, %struct.tiff** %4, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 2
  %8 = load i32, i32* %7, align 4
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFCheckRead, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFCheckRead, i64 0, i64 0)
  %12 = load %struct.tiff*, %struct.tiff** %4, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 0
  %14 = load i8*, i8** %13, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %14, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.22, i32 0, i32 0))
  store i32 0, i32* %3, align 4
  br label %37

; <label>:15:                                     ; preds = %2
  %16 = load i32, i32* %5, align 4
  %17 = load %struct.tiff*, %struct.tiff** %4, align 8
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %17, i32 0, i32 3
  %19 = load i32, i32* %18, align 8
  %20 = and i32 %19, 1024
  %21 = icmp ne i32 %20, 0
  %22 = zext i1 %21 to i32
  %23 = xor i32 %16, %22
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %35

; <label>:25:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFCheckRead, i64 0, i64 1)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFCheckRead, i64 0, i64 1)
  %27 = load %struct.tiff*, %struct.tiff** %4, align 8
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %27, i32 0, i32 0
  %29 = load i8*, i8** %28, align 8
  %30 = load i32, i32* %5, align 4
  %31 = icmp ne i32 %30, 0
  %32 = zext i1 %31 to i64
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFCheckRead, i64 0, i64 3)
  %33 = add i64 %pgocount2, %32
  store i64 %33, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFCheckRead, i64 0, i64 3)
  %34 = select i1 %31, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.24, i32 0, i32 0)
  call void (i8*, i8*, ...) @TIFFError(i8* %29, i8* %34)
  store i32 0, i32* %3, align 4
  br label %37

; <label>:35:                                     ; preds = %15
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFCheckRead, i64 0, i64 2)
  %36 = add i64 %pgocount3, 1
  store i64 %36, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFCheckRead, i64 0, i64 2)
  store i32 1, i32* %3, align 4
  br label %37

; <label>:37:                                     ; preds = %35, %25, %10
  %38 = load i32, i32* %3, align 4
  ret i32 %38
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFSeek(%struct.tiff*, i32, i16 zeroext) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i16, align 2
  %8 = alloca %struct.TIFFDirectory*, align 8
  %9 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32 %1, i32* %6, align 4
  store i16 %2, i16* %7, align 2
  %10 = load %struct.tiff*, %struct.tiff** %5, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 6
  store %struct.TIFFDirectory* %11, %struct.TIFFDirectory** %8, align 8
  %12 = load i32, i32* %6, align 4
  %13 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %14 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %13, i32 0, i32 2
  %15 = load i32, i32* %14, align 4
  %16 = icmp uge i32 %12, %15
  br i1 %16, label %17, label %28

; <label>:17:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 0)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 0)
  %19 = load %struct.tiff*, %struct.tiff** %5, align 8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %19, i32 0, i32 0
  %21 = load i8*, i8** %20, align 8
  %22 = load i32, i32* %6, align 4
  %23 = zext i32 %22 to i64
  %24 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %25 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %24, i32 0, i32 2
  %26 = load i32, i32* %25, align 4
  %27 = zext i32 %26 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %21, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.10, i32 0, i32 0), i64 %23, i64 %27)
  store i32 0, i32* %4, align 4
  br label %132

; <label>:28:                                     ; preds = %3
  %29 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %30 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %29, i32 0, i32 24
  %31 = load i16, i16* %30, align 2
  %32 = zext i16 %31 to i32
  %33 = icmp eq i32 %32, 2
  br i1 %33, label %34, label %67

; <label>:34:                                     ; preds = %28
  %35 = load i16, i16* %7, align 2
  %36 = zext i16 %35 to i32
  %37 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %38 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %37, i32 0, i32 15
  %39 = load i16, i16* %38, align 2
  %40 = zext i16 %39 to i32
  %41 = icmp sge i32 %36, %40
  br i1 %41, label %42, label %53

; <label>:42:                                     ; preds = %34
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 2)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 2)
  %44 = load %struct.tiff*, %struct.tiff** %5, align 8
  %45 = getelementptr inbounds %struct.tiff, %struct.tiff* %44, i32 0, i32 0
  %46 = load i8*, i8** %45, align 8
  %47 = load i16, i16* %7, align 2
  %48 = zext i16 %47 to i64
  %49 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %50 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %49, i32 0, i32 15
  %51 = load i16, i16* %50, align 2
  %52 = zext i16 %51 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %46, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.11, i32 0, i32 0), i64 %48, i64 %52)
  store i32 0, i32* %4, align 4
  br label %132

; <label>:53:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 3)
  %54 = add i64 %pgocount2, 1
  store i64 %54, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 3)
  %55 = load i16, i16* %7, align 2
  %56 = zext i16 %55 to i32
  %57 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %58 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %57, i32 0, i32 42
  %59 = load i32, i32* %58, align 8
  %60 = mul i32 %56, %59
  %61 = load i32, i32* %6, align 4
  %62 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %63 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %62, i32 0, i32 16
  %64 = load i32, i32* %63, align 4
  %65 = udiv i32 %61, %64
  %66 = add i32 %60, %65
  store i32 %66, i32* %9, align 4
  br label %73

; <label>:67:                                     ; preds = %28
  %68 = load i32, i32* %6, align 4
  %69 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %70 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %69, i32 0, i32 16
  %71 = load i32, i32* %70, align 4
  %72 = udiv i32 %68, %71
  store i32 %72, i32* %9, align 4
  br label %73

; <label>:73:                                     ; preds = %67, %53
  %74 = load i32, i32* %9, align 4
  %75 = load %struct.tiff*, %struct.tiff** %5, align 8
  %76 = getelementptr inbounds %struct.tiff, %struct.tiff* %75, i32 0, i32 13
  %77 = load i32, i32* %76, align 8
  %78 = icmp ne i32 %74, %77
  br i1 %78, label %79, label %88

; <label>:79:                                     ; preds = %73
  %80 = load %struct.tiff*, %struct.tiff** %5, align 8
  %81 = load i32, i32* %9, align 4
  %82 = call i32 @TIFFFillStrip(%struct.tiff* %80, i32 %81)
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %86, label %84

; <label>:84:                                     ; preds = %79
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 6)
  %85 = add i64 %pgocount3, 1
  store i64 %85, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 6)
  store i32 0, i32* %4, align 4
  br label %132

; <label>:86:                                     ; preds = %79
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 4)
  %87 = add i64 %pgocount4, 1
  store i64 %87, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 4)
  br label %105

; <label>:88:                                     ; preds = %73
  %89 = load i32, i32* %6, align 4
  %90 = load %struct.tiff*, %struct.tiff** %5, align 8
  %91 = getelementptr inbounds %struct.tiff, %struct.tiff* %90, i32 0, i32 11
  %92 = load i32, i32* %91, align 8
  %93 = icmp ult i32 %89, %92
  br i1 %93, label %94, label %103

; <label>:94:                                     ; preds = %88
  %95 = load %struct.tiff*, %struct.tiff** %5, align 8
  %96 = load i32, i32* %9, align 4
  %97 = call i32 @TIFFStartStrip(%struct.tiff* %95, i32 %96)
  %98 = icmp ne i32 %97, 0
  br i1 %98, label %101, label %99

; <label>:99:                                     ; preds = %94
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 9)
  %100 = add i64 %pgocount5, 1
  store i64 %100, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 9)
  store i32 0, i32* %4, align 4
  br label %132

; <label>:101:                                    ; preds = %94
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 7)
  %102 = add i64 %pgocount6, 1
  store i64 %102, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 7)
  br label %103

; <label>:103:                                    ; preds = %101, %88
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 1)
  %104 = add i64 %pgocount7, 1
  store i64 %104, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 1)
  br label %105

; <label>:105:                                    ; preds = %103, %86
  %106 = load i32, i32* %6, align 4
  %107 = load %struct.tiff*, %struct.tiff** %5, align 8
  %108 = getelementptr inbounds %struct.tiff, %struct.tiff* %107, i32 0, i32 11
  %109 = load i32, i32* %108, align 8
  %110 = icmp ne i32 %106, %109
  br i1 %110, label %111, label %131

; <label>:111:                                    ; preds = %105
  %112 = load %struct.tiff*, %struct.tiff** %5, align 8
  %113 = getelementptr inbounds %struct.tiff, %struct.tiff* %112, i32 0, i32 33
  %114 = load i32 (%struct.tiff*, i32)*, i32 (%struct.tiff*, i32)** %113, align 8
  %115 = load %struct.tiff*, %struct.tiff** %5, align 8
  %116 = load i32, i32* %6, align 4
  %117 = load %struct.tiff*, %struct.tiff** %5, align 8
  %118 = getelementptr inbounds %struct.tiff, %struct.tiff* %117, i32 0, i32 11
  %119 = load i32, i32* %118, align 8
  %120 = sub i32 %116, %119
  %121 = ptrtoint i32 (%struct.tiff*, i32)* %114 to i64
  call void @__llvm_profile_instrument_target(i64 %121, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFSeek to i8*), i32 0)
  %122 = call i32 %114(%struct.tiff* %115, i32 %120)
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %126, label %124

; <label>:124:                                    ; preds = %111
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 8)
  %125 = add i64 %pgocount8, 1
  store i64 %125, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 8)
  store i32 0, i32* %4, align 4
  br label %132

; <label>:126:                                    ; preds = %111
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 5)
  %127 = add i64 %pgocount9, 1
  store i64 %127, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_TIFFSeek, i64 0, i64 5)
  %128 = load i32, i32* %6, align 4
  %129 = load %struct.tiff*, %struct.tiff** %5, align 8
  %130 = getelementptr inbounds %struct.tiff, %struct.tiff* %129, i32 0, i32 11
  store i32 %128, i32* %130, align 8
  br label %131

; <label>:131:                                    ; preds = %126, %105
  store i32 1, i32* %4, align 4
  br label %132

; <label>:132:                                    ; preds = %131, %124, %99, %84, %42, %17
  %133 = load i32, i32* %4, align 4
  ret i32 %133
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadEncodedStrip(%struct.tiff*, i32, i8*, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.TIFFDirectory*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i32 %1, i32* %7, align 4
  store i8* %2, i8** %8, align 8
  store i32 %3, i32* %9, align 4
  %13 = load %struct.tiff*, %struct.tiff** %6, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %13, i32 0, i32 6
  store %struct.TIFFDirectory* %14, %struct.TIFFDirectory** %10, align 8
  %15 = load %struct.tiff*, %struct.tiff** %6, align 8
  %16 = call i32 @TIFFCheckRead(%struct.tiff* %15, i32 0)
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %20, label %18

; <label>:18:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReadEncodedStrip, i64 0, i64 0)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReadEncodedStrip, i64 0, i64 0)
  store i32 -1, i32* %5, align 4
  br label %110

; <label>:20:                                     ; preds = %4
  %21 = load i32, i32* %7, align 4
  %22 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %23 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %22, i32 0, i32 43
  %24 = load i32, i32* %23, align 4
  %25 = icmp uge i32 %21, %24
  br i1 %25, label %26, label %37

; <label>:26:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReadEncodedStrip, i64 0, i64 1)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReadEncodedStrip, i64 0, i64 1)
  %28 = load %struct.tiff*, %struct.tiff** %6, align 8
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %28, i32 0, i32 0
  %30 = load i8*, i8** %29, align 8
  %31 = load i32, i32* %7, align 4
  %32 = zext i32 %31 to i64
  %33 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %34 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %33, i32 0, i32 43
  %35 = load i32, i32* %34, align 4
  %36 = zext i32 %35 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %30, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str, i32 0, i32 0), i64 %32, i64 %36)
  store i32 -1, i32* %5, align 4
  br label %110

; <label>:37:                                     ; preds = %20
  %38 = load i32, i32* %7, align 4
  %39 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %40 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %39, i32 0, i32 43
  %41 = load i32, i32* %40, align 4
  %42 = sub i32 %41, 1
  %43 = icmp ne i32 %38, %42
  br i1 %43, label %54, label %44

; <label>:44:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReadEncodedStrip, i64 0, i64 5)
  %45 = add i64 %pgocount2, 1
  store i64 %45, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReadEncodedStrip, i64 0, i64 5)
  %46 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %47 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %46, i32 0, i32 2
  %48 = load i32, i32* %47, align 4
  %49 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %50 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %49, i32 0, i32 16
  %51 = load i32, i32* %50, align 4
  %52 = urem i32 %48, %51
  store i32 %52, i32* %11, align 4
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %59

; <label>:54:                                     ; preds = %44, %37
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReadEncodedStrip, i64 0, i64 2)
  %55 = add i64 %pgocount3, 1
  store i64 %55, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReadEncodedStrip, i64 0, i64 2)
  %56 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %57 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %56, i32 0, i32 16
  %58 = load i32, i32* %57, align 4
  store i32 %58, i32* %11, align 4
  br label %59

; <label>:59:                                     ; preds = %54, %44
  %60 = load %struct.tiff*, %struct.tiff** %6, align 8
  %61 = load i32, i32* %11, align 4
  %62 = call i32 @TIFFVStripSize(%struct.tiff* %60, i32 %61)
  store i32 %62, i32* %12, align 4
  %63 = load i32, i32* %9, align 4
  %64 = icmp eq i32 %63, -1
  br i1 %64, label %65, label %68

; <label>:65:                                     ; preds = %59
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReadEncodedStrip, i64 0, i64 6)
  %66 = add i64 %pgocount4, 1
  store i64 %66, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReadEncodedStrip, i64 0, i64 6)
  %67 = load i32, i32* %12, align 4
  store i32 %67, i32* %9, align 4
  br label %76

; <label>:68:                                     ; preds = %59
  %69 = load i32, i32* %9, align 4
  %70 = load i32, i32* %12, align 4
  %71 = icmp sgt i32 %69, %70
  br i1 %71, label %72, label %75

; <label>:72:                                     ; preds = %68
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReadEncodedStrip, i64 0, i64 8)
  %73 = add i64 %pgocount5, 1
  store i64 %73, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReadEncodedStrip, i64 0, i64 8)
  %74 = load i32, i32* %12, align 4
  store i32 %74, i32* %9, align 4
  br label %75

; <label>:75:                                     ; preds = %72, %68
  br label %76

; <label>:76:                                     ; preds = %75, %65
  %77 = load %struct.tiff*, %struct.tiff** %6, align 8
  %78 = load i32, i32* %7, align 4
  %79 = call i32 @TIFFFillStrip(%struct.tiff* %77, i32 %78)
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %81, label %108

; <label>:81:                                     ; preds = %76
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReadEncodedStrip, i64 0, i64 3)
  %82 = add i64 %pgocount6, 1
  store i64 %82, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReadEncodedStrip, i64 0, i64 3)
  %83 = load %struct.tiff*, %struct.tiff** %6, align 8
  %84 = getelementptr inbounds %struct.tiff, %struct.tiff* %83, i32 0, i32 28
  %85 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %84, align 8
  %86 = load %struct.tiff*, %struct.tiff** %6, align 8
  %87 = load i8*, i8** %8, align 8
  %88 = load i32, i32* %9, align 4
  %89 = load i32, i32* %7, align 4
  %90 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %91 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %90, i32 0, i32 42
  %92 = load i32, i32* %91, align 8
  %93 = udiv i32 %89, %92
  %94 = trunc i32 %93 to i16
  %95 = ptrtoint i32 (%struct.tiff*, i8*, i32, i16)* %85 to i64
  call void @__llvm_profile_instrument_target(i64 %95, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadEncodedStrip to i8*), i32 0)
  %96 = call i32 %85(%struct.tiff* %86, i8* %87, i32 %88, i16 zeroext %94)
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %98, label %108

; <label>:98:                                     ; preds = %81
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReadEncodedStrip, i64 0, i64 7)
  %99 = add i64 %pgocount7, 1
  store i64 %99, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReadEncodedStrip, i64 0, i64 7)
  %100 = load %struct.tiff*, %struct.tiff** %6, align 8
  %101 = getelementptr inbounds %struct.tiff, %struct.tiff* %100, i32 0, i32 54
  %102 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %101, align 8
  %103 = load %struct.tiff*, %struct.tiff** %6, align 8
  %104 = load i8*, i8** %8, align 8
  %105 = load i32, i32* %9, align 4
  %106 = ptrtoint void (%struct.tiff*, i8*, i32)* %102 to i64
  call void @__llvm_profile_instrument_target(i64 %106, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadEncodedStrip to i8*), i32 1)
  call void %102(%struct.tiff* %103, i8* %104, i32 %105)
  %107 = load i32, i32* %9, align 4
  store i32 %107, i32* %5, align 4
  br label %110

; <label>:108:                                    ; preds = %81, %76
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReadEncodedStrip, i64 0, i64 4)
  %109 = add i64 %pgocount8, 1
  store i64 %109, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReadEncodedStrip, i64 0, i64 4)
  store i32 -1, i32* %5, align 4
  br label %110

; <label>:110:                                    ; preds = %108, %98, %26, %18
  %111 = load i32, i32* %5, align 4
  ret i32 %111
}

declare void @TIFFError(i8*, i8*, ...) #1

declare i32 @TIFFVStripSize(%struct.tiff*, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFFillStrip(%struct.tiff*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.TIFFDirectory*, align 8
  %7 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %8 = load %struct.tiff*, %struct.tiff** %4, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %8, i32 0, i32 6
  store %struct.TIFFDirectory* %9, %struct.TIFFDirectory** %6, align 8
  %10 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %11 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %10, i32 0, i32 45
  %12 = load i32*, i32** %11, align 8
  %13 = load i32, i32* %5, align 4
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32* %12, i64 %14
  %16 = load i32, i32* %15, align 4
  store i32 %16, i32* %7, align 4
  %17 = load i32, i32* %7, align 4
  %18 = icmp sle i32 %17, 0
  br i1 %18, label %19, label %28

; <label>:19:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 0)
  %21 = load %struct.tiff*, %struct.tiff** %4, align 8
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %21, i32 0, i32 0
  %23 = load i8*, i8** %22, align 8
  %24 = load i32, i32* %7, align 4
  %25 = sext i32 %24 to i64
  %26 = load i32, i32* %5, align 4
  %27 = zext i32 %26 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %23, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.2, i32 0, i32 0), i64 %25, i64 %27)
  store i32 0, i32* %3, align 4
  br label %205

; <label>:28:                                     ; preds = %2
  %29 = load %struct.tiff*, %struct.tiff** %4, align 8
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %29, i32 0, i32 3
  %31 = load i32, i32* %30, align 8
  %32 = and i32 %31, 2048
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %130

; <label>:34:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 1)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 1)
  %36 = load %struct.tiff*, %struct.tiff** %4, align 8
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %36, i32 0, i32 3
  %38 = load i32, i32* %37, align 8
  %39 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %40 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %39, i32 0, i32 13
  %41 = load i16, i16* %40, align 2
  %42 = zext i16 %41 to i32
  %43 = and i32 %38, %42
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %52, label %45

; <label>:45:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 7)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 7)
  %47 = load %struct.tiff*, %struct.tiff** %4, align 8
  %48 = getelementptr inbounds %struct.tiff, %struct.tiff* %47, i32 0, i32 3
  %49 = load i32, i32* %48, align 8
  %50 = and i32 %49, 256
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %130

; <label>:52:                                     ; preds = %45, %34
  %53 = load %struct.tiff*, %struct.tiff** %4, align 8
  %54 = getelementptr inbounds %struct.tiff, %struct.tiff* %53, i32 0, i32 3
  %55 = load i32, i32* %54, align 8
  %56 = and i32 %55, 512
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %58, label %69

; <label>:58:                                     ; preds = %52
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 2)
  %59 = add i64 %pgocount3, 1
  store i64 %59, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 2)
  %60 = load %struct.tiff*, %struct.tiff** %4, align 8
  %61 = getelementptr inbounds %struct.tiff, %struct.tiff* %60, i32 0, i32 40
  %62 = load i8*, i8** %61, align 8
  %63 = icmp ne i8* %62, null
  br i1 %63, label %64, label %69

; <label>:64:                                     ; preds = %58
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 9)
  %65 = add i64 %pgocount4, 1
  store i64 %65, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 9)
  %66 = load %struct.tiff*, %struct.tiff** %4, align 8
  %67 = getelementptr inbounds %struct.tiff, %struct.tiff* %66, i32 0, i32 40
  %68 = load i8*, i8** %67, align 8
  call void @_TIFFfree(i8* %68)
  br label %69

; <label>:69:                                     ; preds = %64, %58, %52
  %70 = load %struct.tiff*, %struct.tiff** %4, align 8
  %71 = getelementptr inbounds %struct.tiff, %struct.tiff* %70, i32 0, i32 3
  %72 = load i32, i32* %71, align 8
  %73 = and i32 %72, -513
  store i32 %73, i32* %71, align 8
  %74 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %75 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %74, i32 0, i32 44
  %76 = load i32*, i32** %75, align 8
  %77 = load i32, i32* %5, align 4
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32* %76, i64 %78
  %80 = load i32, i32* %79, align 4
  %81 = load i32, i32* %7, align 4
  %82 = add nsw i32 %80, %81
  %83 = load %struct.tiff*, %struct.tiff** %4, align 8
  %84 = getelementptr inbounds %struct.tiff, %struct.tiff* %83, i32 0, i32 45
  %85 = load i32, i32* %84, align 8
  %86 = icmp sgt i32 %82, %85
  br i1 %86, label %87, label %111

; <label>:87:                                     ; preds = %69
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 3)
  %88 = add i64 %pgocount5, 1
  store i64 %88, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 3)
  %89 = load %struct.tiff*, %struct.tiff** %4, align 8
  %90 = getelementptr inbounds %struct.tiff, %struct.tiff* %89, i32 0, i32 0
  %91 = load i8*, i8** %90, align 8
  %92 = load i32, i32* %5, align 4
  %93 = zext i32 %92 to i64
  %94 = load %struct.tiff*, %struct.tiff** %4, align 8
  %95 = getelementptr inbounds %struct.tiff, %struct.tiff* %94, i32 0, i32 45
  %96 = load i32, i32* %95, align 8
  %97 = sext i32 %96 to i64
  %98 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %99 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %98, i32 0, i32 44
  %100 = load i32*, i32** %99, align 8
  %101 = load i32, i32* %5, align 4
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds i32, i32* %100, i64 %102
  %104 = load i32, i32* %103, align 4
  %105 = zext i32 %104 to i64
  %106 = sub i64 %97, %105
  %107 = load i32, i32* %7, align 4
  %108 = sext i32 %107 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @TIFFFillStrip.module, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.15, i32 0, i32 0), i8* %91, i64 %93, i64 %106, i64 %108)
  %109 = load %struct.tiff*, %struct.tiff** %4, align 8
  %110 = getelementptr inbounds %struct.tiff, %struct.tiff* %109, i32 0, i32 13
  store i32 -1, i32* %110, align 8
  store i32 0, i32* %3, align 4
  br label %205

; <label>:111:                                    ; preds = %69
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 4)
  %112 = add i64 %pgocount6, 1
  store i64 %112, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 4)
  %113 = load i32, i32* %7, align 4
  %114 = load %struct.tiff*, %struct.tiff** %4, align 8
  %115 = getelementptr inbounds %struct.tiff, %struct.tiff* %114, i32 0, i32 41
  store i32 %113, i32* %115, align 8
  %116 = load %struct.tiff*, %struct.tiff** %4, align 8
  %117 = getelementptr inbounds %struct.tiff, %struct.tiff* %116, i32 0, i32 44
  %118 = load i8*, i8** %117, align 8
  %119 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %120 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %119, i32 0, i32 44
  %121 = load i32*, i32** %120, align 8
  %122 = load i32, i32* %5, align 4
  %123 = zext i32 %122 to i64
  %124 = getelementptr inbounds i32, i32* %121, i64 %123
  %125 = load i32, i32* %124, align 4
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds i8, i8* %118, i64 %126
  %128 = load %struct.tiff*, %struct.tiff** %4, align 8
  %129 = getelementptr inbounds %struct.tiff, %struct.tiff* %128, i32 0, i32 40
  store i8* %127, i8** %129, align 8
  br label %201

; <label>:130:                                    ; preds = %45, %28
  %131 = load i32, i32* %7, align 4
  %132 = load %struct.tiff*, %struct.tiff** %4, align 8
  %133 = getelementptr inbounds %struct.tiff, %struct.tiff* %132, i32 0, i32 41
  %134 = load i32, i32* %133, align 8
  %135 = icmp sgt i32 %131, %134
  br i1 %135, label %136, label %163

; <label>:136:                                    ; preds = %130
  %137 = load %struct.tiff*, %struct.tiff** %4, align 8
  %138 = getelementptr inbounds %struct.tiff, %struct.tiff* %137, i32 0, i32 13
  store i32 -1, i32* %138, align 8
  %139 = load %struct.tiff*, %struct.tiff** %4, align 8
  %140 = getelementptr inbounds %struct.tiff, %struct.tiff* %139, i32 0, i32 3
  %141 = load i32, i32* %140, align 8
  %142 = and i32 %141, 512
  %143 = icmp eq i32 %142, 0
  br i1 %143, label %144, label %151

; <label>:144:                                    ; preds = %136
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 8)
  %145 = add i64 %pgocount7, 1
  store i64 %145, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 8)
  %146 = load %struct.tiff*, %struct.tiff** %4, align 8
  %147 = getelementptr inbounds %struct.tiff, %struct.tiff* %146, i32 0, i32 0
  %148 = load i8*, i8** %147, align 8
  %149 = load i32, i32* %5, align 4
  %150 = zext i32 %149 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @TIFFFillStrip.module, i32 0, i32 0), i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.16, i32 0, i32 0), i8* %148, i64 %150)
  store i32 0, i32* %3, align 4
  br label %205

; <label>:151:                                    ; preds = %136
  %152 = load %struct.tiff*, %struct.tiff** %4, align 8
  %153 = load i32, i32* %7, align 4
  %154 = add i32 %153, 1023
  %155 = udiv i32 %154, 1024
  %156 = mul i32 %155, 1024
  %157 = call i32 @TIFFReadBufferSetup(%struct.tiff* %152, i8* null, i32 %156)
  %158 = icmp ne i32 %157, 0
  br i1 %158, label %161, label %159

; <label>:159:                                    ; preds = %151
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 12)
  %160 = add i64 %pgocount8, 1
  store i64 %160, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 12)
  store i32 0, i32* %3, align 4
  br label %205

; <label>:161:                                    ; preds = %151
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 10)
  %162 = add i64 %pgocount9, 1
  store i64 %162, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 10)
  br label %163

; <label>:163:                                    ; preds = %161, %130
  %164 = load %struct.tiff*, %struct.tiff** %4, align 8
  %165 = load i32, i32* %5, align 4
  %166 = load %struct.tiff*, %struct.tiff** %4, align 8
  %167 = getelementptr inbounds %struct.tiff, %struct.tiff* %166, i32 0, i32 40
  %168 = load i8*, i8** %167, align 8
  %169 = load i32, i32* %7, align 4
  %170 = call i32 @TIFFReadRawStrip1(%struct.tiff* %164, i32 %165, i8* %168, i32 %169, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @TIFFFillStrip.module, i32 0, i32 0))
  %171 = load i32, i32* %7, align 4
  %172 = icmp ne i32 %170, %171
  br i1 %172, label %173, label %175

; <label>:173:                                    ; preds = %163
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 5)
  %174 = add i64 %pgocount10, 1
  store i64 %174, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 5)
  store i32 0, i32* %3, align 4
  br label %205

; <label>:175:                                    ; preds = %163
  %176 = load %struct.tiff*, %struct.tiff** %4, align 8
  %177 = getelementptr inbounds %struct.tiff, %struct.tiff* %176, i32 0, i32 3
  %178 = load i32, i32* %177, align 8
  %179 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %180 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %179, i32 0, i32 13
  %181 = load i16, i16* %180, align 2
  %182 = zext i16 %181 to i32
  %183 = and i32 %178, %182
  %184 = icmp ne i32 %183, 0
  br i1 %184, label %199, label %185

; <label>:185:                                    ; preds = %175
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 11)
  %186 = add i64 %pgocount11, 1
  store i64 %186, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 11)
  %187 = load %struct.tiff*, %struct.tiff** %4, align 8
  %188 = getelementptr inbounds %struct.tiff, %struct.tiff* %187, i32 0, i32 3
  %189 = load i32, i32* %188, align 8
  %190 = and i32 %189, 256
  %191 = icmp eq i32 %190, 0
  br i1 %191, label %192, label %199

; <label>:192:                                    ; preds = %185
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 13)
  %193 = add i64 %pgocount12, 1
  store i64 %193, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 13)
  %194 = load %struct.tiff*, %struct.tiff** %4, align 8
  %195 = getelementptr inbounds %struct.tiff, %struct.tiff* %194, i32 0, i32 40
  %196 = load i8*, i8** %195, align 8
  %197 = load i32, i32* %7, align 4
  %198 = sext i32 %197 to i64
  call void @TIFFReverseBits(i8* %196, i64 %198)
  br label %199

; <label>:199:                                    ; preds = %192, %185, %175
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 6)
  %200 = add i64 %pgocount13, 1
  store i64 %200, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillStrip, i64 0, i64 6)
  br label %201

; <label>:201:                                    ; preds = %199, %111
  %202 = load %struct.tiff*, %struct.tiff** %4, align 8
  %203 = load i32, i32* %5, align 4
  %204 = call i32 @TIFFStartStrip(%struct.tiff* %202, i32 %203)
  store i32 %204, i32* %3, align 4
  br label %205

; <label>:205:                                    ; preds = %201, %173, %159, %144, %87, %19
  %206 = load i32, i32* %3, align 4
  ret i32 %206
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadRawStrip(%struct.tiff*, i32, i8*, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.TIFFDirectory*, align 8
  %11 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i32 %1, i32* %7, align 4
  store i8* %2, i8** %8, align 8
  store i32 %3, i32* %9, align 4
  %12 = load %struct.tiff*, %struct.tiff** %6, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 6
  store %struct.TIFFDirectory* %13, %struct.TIFFDirectory** %10, align 8
  %14 = load %struct.tiff*, %struct.tiff** %6, align 8
  %15 = call i32 @TIFFCheckRead(%struct.tiff* %14, i32 0)
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %19, label %17

; <label>:17:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFReadRawStrip, i64 0, i64 0)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFReadRawStrip, i64 0, i64 0)
  store i32 -1, i32* %5, align 4
  br label %73

; <label>:19:                                     ; preds = %4
  %20 = load i32, i32* %7, align 4
  %21 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %22 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %21, i32 0, i32 43
  %23 = load i32, i32* %22, align 4
  %24 = icmp uge i32 %20, %23
  br i1 %24, label %25, label %36

; <label>:25:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFReadRawStrip, i64 0, i64 1)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFReadRawStrip, i64 0, i64 1)
  %27 = load %struct.tiff*, %struct.tiff** %6, align 8
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %27, i32 0, i32 0
  %29 = load i8*, i8** %28, align 8
  %30 = load i32, i32* %7, align 4
  %31 = zext i32 %30 to i64
  %32 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %33 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %32, i32 0, i32 43
  %34 = load i32, i32* %33, align 4
  %35 = zext i32 %34 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %29, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.1, i32 0, i32 0), i64 %31, i64 %35)
  store i32 -1, i32* %5, align 4
  br label %73

; <label>:36:                                     ; preds = %19
  %37 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %38 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %37, i32 0, i32 45
  %39 = load i32*, i32** %38, align 8
  %40 = load i32, i32* %7, align 4
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32* %39, i64 %41
  %43 = load i32, i32* %42, align 4
  store i32 %43, i32* %11, align 4
  %44 = load i32, i32* %11, align 4
  %45 = icmp sle i32 %44, 0
  br i1 %45, label %46, label %55

; <label>:46:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFReadRawStrip, i64 0, i64 2)
  %47 = add i64 %pgocount2, 1
  store i64 %47, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFReadRawStrip, i64 0, i64 2)
  %48 = load %struct.tiff*, %struct.tiff** %6, align 8
  %49 = getelementptr inbounds %struct.tiff, %struct.tiff* %48, i32 0, i32 0
  %50 = load i8*, i8** %49, align 8
  %51 = load i32, i32* %11, align 4
  %52 = sext i32 %51 to i64
  %53 = load i32, i32* %7, align 4
  %54 = zext i32 %53 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %50, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.2, i32 0, i32 0), i64 %52, i64 %54)
  store i32 -1, i32* %5, align 4
  br label %73

; <label>:55:                                     ; preds = %36
  %56 = load i32, i32* %9, align 4
  %57 = icmp ne i32 %56, -1
  br i1 %57, label %58, label %66

; <label>:58:                                     ; preds = %55
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFReadRawStrip, i64 0, i64 4)
  %59 = add i64 %pgocount3, 1
  store i64 %59, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFReadRawStrip, i64 0, i64 4)
  %60 = load i32, i32* %9, align 4
  %61 = load i32, i32* %11, align 4
  %62 = icmp slt i32 %60, %61
  br i1 %62, label %63, label %66

; <label>:63:                                     ; preds = %58
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFReadRawStrip, i64 0, i64 5)
  %64 = add i64 %pgocount4, 1
  store i64 %64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFReadRawStrip, i64 0, i64 5)
  %65 = load i32, i32* %9, align 4
  store i32 %65, i32* %11, align 4
  br label %66

; <label>:66:                                     ; preds = %63, %58, %55
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFReadRawStrip, i64 0, i64 3)
  %67 = add i64 %pgocount5, 1
  store i64 %67, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFReadRawStrip, i64 0, i64 3)
  %68 = load %struct.tiff*, %struct.tiff** %6, align 8
  %69 = load i32, i32* %7, align 4
  %70 = load i8*, i8** %8, align 8
  %71 = load i32, i32* %11, align 4
  %72 = call i32 @TIFFReadRawStrip1(%struct.tiff* %68, i32 %69, i8* %70, i32 %71, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @TIFFReadRawStrip.module, i32 0, i32 0))
  store i32 %72, i32* %5, align 4
  br label %73

; <label>:73:                                     ; preds = %66, %46, %25, %17
  %74 = load i32, i32* %5, align 4
  ret i32 %74
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFReadRawStrip1(%struct.tiff*, i32, i8*, i32, i8*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca %struct.tiff*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca %struct.TIFFDirectory*, align 8
  %13 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %7, align 8
  store i32 %1, i32* %8, align 4
  store i8* %2, i8** %9, align 8
  store i32 %3, i32* %10, align 4
  store i8* %4, i8** %11, align 8
  %14 = load %struct.tiff*, %struct.tiff** %7, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 6
  store %struct.TIFFDirectory* %15, %struct.TIFFDirectory** %12, align 8
  %16 = load %struct.tiff*, %struct.tiff** %7, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %16, i32 0, i32 3
  %18 = load i32, i32* %17, align 8
  %19 = and i32 %18, 2048
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %87, label %21

; <label>:21:                                     ; preds = %5
  %22 = load %struct.tiff*, %struct.tiff** %7, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %22, i32 0, i32 51
  %24 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %23, align 8
  %25 = load %struct.tiff*, %struct.tiff** %7, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %25, i32 0, i32 48
  %27 = load i8*, i8** %26, align 8
  %28 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %12, align 8
  %29 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %28, i32 0, i32 44
  %30 = load i32*, i32** %29, align 8
  %31 = load i32, i32* %8, align 4
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32* %30, i64 %32
  %34 = load i32, i32* %33, align 4
  %35 = ptrtoint i32 (i8*, i32, i32)* %24 to i64
  call void @__llvm_profile_instrument_target(i64 %35, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFReadRawStrip1 to i8*), i32 0)
  %36 = call i32 %24(i8* %27, i32 %34, i32 0)
  %37 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %12, align 8
  %38 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %37, i32 0, i32 44
  %39 = load i32*, i32** %38, align 8
  %40 = load i32, i32* %8, align 4
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32* %39, i64 %41
  %43 = load i32, i32* %42, align 4
  %44 = icmp eq i32 %36, %43
  br i1 %44, label %57, label %45

; <label>:45:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawStrip1, i64 0, i64 0)
  %46 = add i64 %pgocount, 1
  store i64 %46, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawStrip1, i64 0, i64 0)
  %47 = load i8*, i8** %11, align 8
  %48 = load %struct.tiff*, %struct.tiff** %7, align 8
  %49 = getelementptr inbounds %struct.tiff, %struct.tiff* %48, i32 0, i32 0
  %50 = load i8*, i8** %49, align 8
  %51 = load %struct.tiff*, %struct.tiff** %7, align 8
  %52 = getelementptr inbounds %struct.tiff, %struct.tiff* %51, i32 0, i32 11
  %53 = load i32, i32* %52, align 8
  %54 = zext i32 %53 to i64
  %55 = load i32, i32* %8, align 4
  %56 = zext i32 %55 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %47, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.12, i32 0, i32 0), i8* %50, i64 %54, i64 %56)
  store i32 -1, i32* %6, align 4
  br label %146

; <label>:57:                                     ; preds = %21
  %58 = load %struct.tiff*, %struct.tiff** %7, align 8
  %59 = getelementptr inbounds %struct.tiff, %struct.tiff* %58, i32 0, i32 49
  %60 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %59, align 8
  %61 = load %struct.tiff*, %struct.tiff** %7, align 8
  %62 = getelementptr inbounds %struct.tiff, %struct.tiff* %61, i32 0, i32 48
  %63 = load i8*, i8** %62, align 8
  %64 = load i8*, i8** %9, align 8
  %65 = load i32, i32* %10, align 4
  %66 = ptrtoint i32 (i8*, i8*, i32)* %60 to i64
  call void @__llvm_profile_instrument_target(i64 %66, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFReadRawStrip1 to i8*), i32 1)
  %67 = call i32 %60(i8* %63, i8* %64, i32 %65)
  store i32 %67, i32* %13, align 4
  %68 = load i32, i32* %13, align 4
  %69 = load i32, i32* %10, align 4
  %70 = icmp ne i32 %68, %69
  br i1 %70, label %71, label %85

; <label>:71:                                     ; preds = %57
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawStrip1, i64 0, i64 3)
  %72 = add i64 %pgocount1, 1
  store i64 %72, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawStrip1, i64 0, i64 3)
  %73 = load i8*, i8** %11, align 8
  %74 = load %struct.tiff*, %struct.tiff** %7, align 8
  %75 = getelementptr inbounds %struct.tiff, %struct.tiff* %74, i32 0, i32 0
  %76 = load i8*, i8** %75, align 8
  %77 = load %struct.tiff*, %struct.tiff** %7, align 8
  %78 = getelementptr inbounds %struct.tiff, %struct.tiff* %77, i32 0, i32 11
  %79 = load i32, i32* %78, align 8
  %80 = zext i32 %79 to i64
  %81 = load i32, i32* %13, align 4
  %82 = sext i32 %81 to i64
  %83 = load i32, i32* %10, align 4
  %84 = sext i32 %83 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %73, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.13, i32 0, i32 0), i8* %76, i64 %80, i64 %82, i64 %84)
  store i32 -1, i32* %6, align 4
  br label %146

; <label>:85:                                     ; preds = %57
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawStrip1, i64 0, i64 4)
  %86 = add i64 %pgocount2, 1
  store i64 %86, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawStrip1, i64 0, i64 4)
  br label %144

; <label>:87:                                     ; preds = %5
  %88 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %12, align 8
  %89 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %88, i32 0, i32 44
  %90 = load i32*, i32** %89, align 8
  %91 = load i32, i32* %8, align 4
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32* %90, i64 %92
  %94 = load i32, i32* %93, align 4
  %95 = load i32, i32* %10, align 4
  %96 = add i32 %94, %95
  %97 = load %struct.tiff*, %struct.tiff** %7, align 8
  %98 = getelementptr inbounds %struct.tiff, %struct.tiff* %97, i32 0, i32 45
  %99 = load i32, i32* %98, align 8
  %100 = icmp sgt i32 %96, %99
  br i1 %100, label %101, label %128

; <label>:101:                                    ; preds = %87
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawStrip1, i64 0, i64 1)
  %102 = add i64 %pgocount3, 1
  store i64 %102, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawStrip1, i64 0, i64 1)
  %103 = load i8*, i8** %11, align 8
  %104 = load %struct.tiff*, %struct.tiff** %7, align 8
  %105 = getelementptr inbounds %struct.tiff, %struct.tiff* %104, i32 0, i32 0
  %106 = load i8*, i8** %105, align 8
  %107 = load %struct.tiff*, %struct.tiff** %7, align 8
  %108 = getelementptr inbounds %struct.tiff, %struct.tiff* %107, i32 0, i32 11
  %109 = load i32, i32* %108, align 8
  %110 = zext i32 %109 to i64
  %111 = load i32, i32* %8, align 4
  %112 = zext i32 %111 to i64
  %113 = load %struct.tiff*, %struct.tiff** %7, align 8
  %114 = getelementptr inbounds %struct.tiff, %struct.tiff* %113, i32 0, i32 45
  %115 = load i32, i32* %114, align 8
  %116 = sext i32 %115 to i64
  %117 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %12, align 8
  %118 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %117, i32 0, i32 44
  %119 = load i32*, i32** %118, align 8
  %120 = load i32, i32* %8, align 4
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds i32, i32* %119, i64 %121
  %123 = load i32, i32* %122, align 4
  %124 = zext i32 %123 to i64
  %125 = sub i64 %116, %124
  %126 = load i32, i32* %10, align 4
  %127 = sext i32 %126 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %103, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.14, i32 0, i32 0), i8* %106, i64 %110, i64 %112, i64 %125, i64 %127)
  store i32 -1, i32* %6, align 4
  br label %146

; <label>:128:                                    ; preds = %87
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawStrip1, i64 0, i64 2)
  %129 = add i64 %pgocount4, 1
  store i64 %129, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawStrip1, i64 0, i64 2)
  %130 = load i8*, i8** %9, align 8
  %131 = load %struct.tiff*, %struct.tiff** %7, align 8
  %132 = getelementptr inbounds %struct.tiff, %struct.tiff* %131, i32 0, i32 44
  %133 = load i8*, i8** %132, align 8
  %134 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %12, align 8
  %135 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %134, i32 0, i32 44
  %136 = load i32*, i32** %135, align 8
  %137 = load i32, i32* %8, align 4
  %138 = zext i32 %137 to i64
  %139 = getelementptr inbounds i32, i32* %136, i64 %138
  %140 = load i32, i32* %139, align 4
  %141 = zext i32 %140 to i64
  %142 = getelementptr inbounds i8, i8* %133, i64 %141
  %143 = load i32, i32* %10, align 4
  call void @_TIFFmemcpy(i8* %130, i8* %142, i32 %143)
  br label %144

; <label>:144:                                    ; preds = %128, %85
  %145 = load i32, i32* %10, align 4
  store i32 %145, i32* %6, align 4
  br label %146

; <label>:146:                                    ; preds = %144, %101, %71, %45
  %147 = load i32, i32* %6, align 4
  ret i32 %147
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadTile(%struct.tiff*, i8*, i32, i32, i32, i16 zeroext) #0 {
  %7 = alloca i32, align 4
  %8 = alloca %struct.tiff*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %8, align 8
  store i8* %1, i8** %9, align 8
  store i32 %2, i32* %10, align 4
  store i32 %3, i32* %11, align 4
  store i32 %4, i32* %12, align 4
  store i16 %5, i16* %13, align 2
  %14 = load %struct.tiff*, %struct.tiff** %8, align 8
  %15 = call i32 @TIFFCheckRead(%struct.tiff* %14, i32 1)
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %26

; <label>:17:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFReadTile, i64 0, i64 0)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFReadTile, i64 0, i64 0)
  %19 = load %struct.tiff*, %struct.tiff** %8, align 8
  %20 = load i32, i32* %10, align 4
  %21 = load i32, i32* %11, align 4
  %22 = load i32, i32* %12, align 4
  %23 = load i16, i16* %13, align 2
  %24 = call i32 @TIFFCheckTile(%struct.tiff* %19, i32 %20, i32 %21, i32 %22, i16 zeroext %23)
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %28, label %26

; <label>:26:                                     ; preds = %17, %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFReadTile, i64 0, i64 1)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFReadTile, i64 0, i64 1)
  store i32 -1, i32* %7, align 4
  br label %39

; <label>:28:                                     ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFReadTile, i64 0, i64 2)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFReadTile, i64 0, i64 2)
  %30 = load %struct.tiff*, %struct.tiff** %8, align 8
  %31 = load %struct.tiff*, %struct.tiff** %8, align 8
  %32 = load i32, i32* %10, align 4
  %33 = load i32, i32* %11, align 4
  %34 = load i32, i32* %12, align 4
  %35 = load i16, i16* %13, align 2
  %36 = call i32 @TIFFComputeTile(%struct.tiff* %31, i32 %32, i32 %33, i32 %34, i16 zeroext %35)
  %37 = load i8*, i8** %9, align 8
  %38 = call i32 @TIFFReadEncodedTile(%struct.tiff* %30, i32 %36, i8* %37, i32 -1)
  store i32 %38, i32* %7, align 4
  br label %39

; <label>:39:                                     ; preds = %28, %26
  %40 = load i32, i32* %7, align 4
  ret i32 %40
}

declare i32 @TIFFCheckTile(%struct.tiff*, i32, i32, i32, i16 zeroext) #1

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadEncodedTile(%struct.tiff*, i32, i8*, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.TIFFDirectory*, align 8
  %11 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i32 %1, i32* %7, align 4
  store i8* %2, i8** %8, align 8
  store i32 %3, i32* %9, align 4
  %12 = load %struct.tiff*, %struct.tiff** %6, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 6
  store %struct.TIFFDirectory* %13, %struct.TIFFDirectory** %10, align 8
  %14 = load %struct.tiff*, %struct.tiff** %6, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 20
  %16 = load i32, i32* %15, align 4
  store i32 %16, i32* %11, align 4
  %17 = load %struct.tiff*, %struct.tiff** %6, align 8
  %18 = call i32 @TIFFCheckRead(%struct.tiff* %17, i32 1)
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFReadEncodedTile, i64 0, i64 0)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFReadEncodedTile, i64 0, i64 0)
  store i32 -1, i32* %5, align 4
  br label %87

; <label>:22:                                     ; preds = %4
  %23 = load i32, i32* %7, align 4
  %24 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %25 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %24, i32 0, i32 43
  %26 = load i32, i32* %25, align 4
  %27 = icmp uge i32 %23, %26
  br i1 %27, label %28, label %39

; <label>:28:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFReadEncodedTile, i64 0, i64 1)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFReadEncodedTile, i64 0, i64 1)
  %30 = load %struct.tiff*, %struct.tiff** %6, align 8
  %31 = getelementptr inbounds %struct.tiff, %struct.tiff* %30, i32 0, i32 0
  %32 = load i8*, i8** %31, align 8
  %33 = load i32, i32* %7, align 4
  %34 = zext i32 %33 to i64
  %35 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %36 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %35, i32 0, i32 43
  %37 = load i32, i32* %36, align 4
  %38 = zext i32 %37 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %32, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.3, i32 0, i32 0), i64 %34, i64 %38)
  store i32 -1, i32* %5, align 4
  br label %87

; <label>:39:                                     ; preds = %22
  %40 = load i32, i32* %9, align 4
  %41 = icmp eq i32 %40, -1
  br i1 %41, label %42, label %45

; <label>:42:                                     ; preds = %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFReadEncodedTile, i64 0, i64 4)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFReadEncodedTile, i64 0, i64 4)
  %44 = load i32, i32* %11, align 4
  store i32 %44, i32* %9, align 4
  br label %53

; <label>:45:                                     ; preds = %39
  %46 = load i32, i32* %9, align 4
  %47 = load i32, i32* %11, align 4
  %48 = icmp sgt i32 %46, %47
  br i1 %48, label %49, label %52

; <label>:49:                                     ; preds = %45
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFReadEncodedTile, i64 0, i64 6)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFReadEncodedTile, i64 0, i64 6)
  %51 = load i32, i32* %11, align 4
  store i32 %51, i32* %9, align 4
  br label %52

; <label>:52:                                     ; preds = %49, %45
  br label %53

; <label>:53:                                     ; preds = %52, %42
  %54 = load %struct.tiff*, %struct.tiff** %6, align 8
  %55 = load i32, i32* %7, align 4
  %56 = call i32 @TIFFFillTile(%struct.tiff* %54, i32 %55)
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %58, label %85

; <label>:58:                                     ; preds = %53
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFReadEncodedTile, i64 0, i64 2)
  %59 = add i64 %pgocount4, 1
  store i64 %59, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFReadEncodedTile, i64 0, i64 2)
  %60 = load %struct.tiff*, %struct.tiff** %6, align 8
  %61 = getelementptr inbounds %struct.tiff, %struct.tiff* %60, i32 0, i32 30
  %62 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %61, align 8
  %63 = load %struct.tiff*, %struct.tiff** %6, align 8
  %64 = load i8*, i8** %8, align 8
  %65 = load i32, i32* %9, align 4
  %66 = load i32, i32* %7, align 4
  %67 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %68 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %67, i32 0, i32 42
  %69 = load i32, i32* %68, align 8
  %70 = udiv i32 %66, %69
  %71 = trunc i32 %70 to i16
  %72 = ptrtoint i32 (%struct.tiff*, i8*, i32, i16)* %62 to i64
  call void @__llvm_profile_instrument_target(i64 %72, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadEncodedTile to i8*), i32 0)
  %73 = call i32 %62(%struct.tiff* %63, i8* %64, i32 %65, i16 zeroext %71)
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %85

; <label>:75:                                     ; preds = %58
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFReadEncodedTile, i64 0, i64 5)
  %76 = add i64 %pgocount5, 1
  store i64 %76, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFReadEncodedTile, i64 0, i64 5)
  %77 = load %struct.tiff*, %struct.tiff** %6, align 8
  %78 = getelementptr inbounds %struct.tiff, %struct.tiff* %77, i32 0, i32 54
  %79 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %78, align 8
  %80 = load %struct.tiff*, %struct.tiff** %6, align 8
  %81 = load i8*, i8** %8, align 8
  %82 = load i32, i32* %9, align 4
  %83 = ptrtoint void (%struct.tiff*, i8*, i32)* %79 to i64
  call void @__llvm_profile_instrument_target(i64 %83, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadEncodedTile to i8*), i32 1)
  call void %79(%struct.tiff* %80, i8* %81, i32 %82)
  %84 = load i32, i32* %9, align 4
  store i32 %84, i32* %5, align 4
  br label %87

; <label>:85:                                     ; preds = %58, %53
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFReadEncodedTile, i64 0, i64 3)
  %86 = add i64 %pgocount6, 1
  store i64 %86, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFReadEncodedTile, i64 0, i64 3)
  store i32 -1, i32* %5, align 4
  br label %87

; <label>:87:                                     ; preds = %85, %75, %28, %20
  %88 = load i32, i32* %5, align 4
  ret i32 %88
}

declare i32 @TIFFComputeTile(%struct.tiff*, i32, i32, i32, i16 zeroext) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFFillTile(%struct.tiff*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.TIFFDirectory*, align 8
  %7 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %8 = load %struct.tiff*, %struct.tiff** %4, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %8, i32 0, i32 6
  store %struct.TIFFDirectory* %9, %struct.TIFFDirectory** %6, align 8
  %10 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %11 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %10, i32 0, i32 45
  %12 = load i32*, i32** %11, align 8
  %13 = load i32, i32* %5, align 4
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32* %12, i64 %14
  %16 = load i32, i32* %15, align 4
  store i32 %16, i32* %7, align 4
  %17 = load i32, i32* %7, align 4
  %18 = icmp sle i32 %17, 0
  br i1 %18, label %19, label %28

; <label>:19:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 0)
  %21 = load %struct.tiff*, %struct.tiff** %4, align 8
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %21, i32 0, i32 0
  %23 = load i8*, i8** %22, align 8
  %24 = load i32, i32* %7, align 4
  %25 = sext i32 %24 to i64
  %26 = load i32, i32* %5, align 4
  %27 = zext i32 %26 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %23, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.20, i32 0, i32 0), i64 %25, i64 %27)
  store i32 0, i32* %3, align 4
  br label %185

; <label>:28:                                     ; preds = %2
  %29 = load %struct.tiff*, %struct.tiff** %4, align 8
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %29, i32 0, i32 3
  %31 = load i32, i32* %30, align 8
  %32 = and i32 %31, 2048
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %110

; <label>:34:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 1)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 1)
  %36 = load %struct.tiff*, %struct.tiff** %4, align 8
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %36, i32 0, i32 3
  %38 = load i32, i32* %37, align 8
  %39 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %40 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %39, i32 0, i32 13
  %41 = load i16, i16* %40, align 2
  %42 = zext i16 %41 to i32
  %43 = and i32 %38, %42
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %52, label %45

; <label>:45:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 7)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 7)
  %47 = load %struct.tiff*, %struct.tiff** %4, align 8
  %48 = getelementptr inbounds %struct.tiff, %struct.tiff* %47, i32 0, i32 3
  %49 = load i32, i32* %48, align 8
  %50 = and i32 %49, 256
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %110

; <label>:52:                                     ; preds = %45, %34
  %53 = load %struct.tiff*, %struct.tiff** %4, align 8
  %54 = getelementptr inbounds %struct.tiff, %struct.tiff* %53, i32 0, i32 3
  %55 = load i32, i32* %54, align 8
  %56 = and i32 %55, 512
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %58, label %69

; <label>:58:                                     ; preds = %52
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 2)
  %59 = add i64 %pgocount3, 1
  store i64 %59, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 2)
  %60 = load %struct.tiff*, %struct.tiff** %4, align 8
  %61 = getelementptr inbounds %struct.tiff, %struct.tiff* %60, i32 0, i32 40
  %62 = load i8*, i8** %61, align 8
  %63 = icmp ne i8* %62, null
  br i1 %63, label %64, label %69

; <label>:64:                                     ; preds = %58
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 9)
  %65 = add i64 %pgocount4, 1
  store i64 %65, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 9)
  %66 = load %struct.tiff*, %struct.tiff** %4, align 8
  %67 = getelementptr inbounds %struct.tiff, %struct.tiff* %66, i32 0, i32 40
  %68 = load i8*, i8** %67, align 8
  call void @_TIFFfree(i8* %68)
  br label %69

; <label>:69:                                     ; preds = %64, %58, %52
  %70 = load %struct.tiff*, %struct.tiff** %4, align 8
  %71 = getelementptr inbounds %struct.tiff, %struct.tiff* %70, i32 0, i32 3
  %72 = load i32, i32* %71, align 8
  %73 = and i32 %72, -513
  store i32 %73, i32* %71, align 8
  %74 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %75 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %74, i32 0, i32 44
  %76 = load i32*, i32** %75, align 8
  %77 = load i32, i32* %5, align 4
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32* %76, i64 %78
  %80 = load i32, i32* %79, align 4
  %81 = load i32, i32* %7, align 4
  %82 = add i32 %80, %81
  %83 = load %struct.tiff*, %struct.tiff** %4, align 8
  %84 = getelementptr inbounds %struct.tiff, %struct.tiff* %83, i32 0, i32 45
  %85 = load i32, i32* %84, align 8
  %86 = icmp sgt i32 %82, %85
  br i1 %86, label %87, label %91

; <label>:87:                                     ; preds = %69
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 3)
  %88 = add i64 %pgocount5, 1
  store i64 %88, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 3)
  %89 = load %struct.tiff*, %struct.tiff** %4, align 8
  %90 = getelementptr inbounds %struct.tiff, %struct.tiff* %89, i32 0, i32 19
  store i32 -1, i32* %90, align 8
  store i32 0, i32* %3, align 4
  br label %185

; <label>:91:                                     ; preds = %69
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 4)
  %92 = add i64 %pgocount6, 1
  store i64 %92, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 4)
  %93 = load i32, i32* %7, align 4
  %94 = load %struct.tiff*, %struct.tiff** %4, align 8
  %95 = getelementptr inbounds %struct.tiff, %struct.tiff* %94, i32 0, i32 41
  store i32 %93, i32* %95, align 8
  %96 = load %struct.tiff*, %struct.tiff** %4, align 8
  %97 = getelementptr inbounds %struct.tiff, %struct.tiff* %96, i32 0, i32 44
  %98 = load i8*, i8** %97, align 8
  %99 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %100 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %99, i32 0, i32 44
  %101 = load i32*, i32** %100, align 8
  %102 = load i32, i32* %5, align 4
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32* %101, i64 %103
  %105 = load i32, i32* %104, align 4
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds i8, i8* %98, i64 %106
  %108 = load %struct.tiff*, %struct.tiff** %4, align 8
  %109 = getelementptr inbounds %struct.tiff, %struct.tiff* %108, i32 0, i32 40
  store i8* %107, i8** %109, align 8
  br label %181

; <label>:110:                                    ; preds = %45, %28
  %111 = load i32, i32* %7, align 4
  %112 = load %struct.tiff*, %struct.tiff** %4, align 8
  %113 = getelementptr inbounds %struct.tiff, %struct.tiff* %112, i32 0, i32 41
  %114 = load i32, i32* %113, align 8
  %115 = icmp sgt i32 %111, %114
  br i1 %115, label %116, label %143

; <label>:116:                                    ; preds = %110
  %117 = load %struct.tiff*, %struct.tiff** %4, align 8
  %118 = getelementptr inbounds %struct.tiff, %struct.tiff* %117, i32 0, i32 19
  store i32 -1, i32* %118, align 8
  %119 = load %struct.tiff*, %struct.tiff** %4, align 8
  %120 = getelementptr inbounds %struct.tiff, %struct.tiff* %119, i32 0, i32 3
  %121 = load i32, i32* %120, align 8
  %122 = and i32 %121, 512
  %123 = icmp eq i32 %122, 0
  br i1 %123, label %124, label %131

; <label>:124:                                    ; preds = %116
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 8)
  %125 = add i64 %pgocount7, 1
  store i64 %125, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 8)
  %126 = load %struct.tiff*, %struct.tiff** %4, align 8
  %127 = getelementptr inbounds %struct.tiff, %struct.tiff* %126, i32 0, i32 0
  %128 = load i8*, i8** %127, align 8
  %129 = load i32, i32* %5, align 4
  %130 = zext i32 %129 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @TIFFFillTile.module, i32 0, i32 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.21, i32 0, i32 0), i8* %128, i64 %130)
  store i32 0, i32* %3, align 4
  br label %185

; <label>:131:                                    ; preds = %116
  %132 = load %struct.tiff*, %struct.tiff** %4, align 8
  %133 = load i32, i32* %7, align 4
  %134 = add i32 %133, 1023
  %135 = udiv i32 %134, 1024
  %136 = mul i32 %135, 1024
  %137 = call i32 @TIFFReadBufferSetup(%struct.tiff* %132, i8* null, i32 %136)
  %138 = icmp ne i32 %137, 0
  br i1 %138, label %141, label %139

; <label>:139:                                    ; preds = %131
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 12)
  %140 = add i64 %pgocount8, 1
  store i64 %140, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 12)
  store i32 0, i32* %3, align 4
  br label %185

; <label>:141:                                    ; preds = %131
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 10)
  %142 = add i64 %pgocount9, 1
  store i64 %142, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 10)
  br label %143

; <label>:143:                                    ; preds = %141, %110
  %144 = load %struct.tiff*, %struct.tiff** %4, align 8
  %145 = load i32, i32* %5, align 4
  %146 = load %struct.tiff*, %struct.tiff** %4, align 8
  %147 = getelementptr inbounds %struct.tiff, %struct.tiff* %146, i32 0, i32 40
  %148 = load i8*, i8** %147, align 8
  %149 = load i32, i32* %7, align 4
  %150 = call i32 @TIFFReadRawTile1(%struct.tiff* %144, i32 %145, i8* %148, i32 %149, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @TIFFFillTile.module, i32 0, i32 0))
  %151 = load i32, i32* %7, align 4
  %152 = icmp ne i32 %150, %151
  br i1 %152, label %153, label %155

; <label>:153:                                    ; preds = %143
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 5)
  %154 = add i64 %pgocount10, 1
  store i64 %154, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 5)
  store i32 0, i32* %3, align 4
  br label %185

; <label>:155:                                    ; preds = %143
  %156 = load %struct.tiff*, %struct.tiff** %4, align 8
  %157 = getelementptr inbounds %struct.tiff, %struct.tiff* %156, i32 0, i32 3
  %158 = load i32, i32* %157, align 8
  %159 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %160 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %159, i32 0, i32 13
  %161 = load i16, i16* %160, align 2
  %162 = zext i16 %161 to i32
  %163 = and i32 %158, %162
  %164 = icmp ne i32 %163, 0
  br i1 %164, label %179, label %165

; <label>:165:                                    ; preds = %155
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 11)
  %166 = add i64 %pgocount11, 1
  store i64 %166, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 11)
  %167 = load %struct.tiff*, %struct.tiff** %4, align 8
  %168 = getelementptr inbounds %struct.tiff, %struct.tiff* %167, i32 0, i32 3
  %169 = load i32, i32* %168, align 8
  %170 = and i32 %169, 256
  %171 = icmp eq i32 %170, 0
  br i1 %171, label %172, label %179

; <label>:172:                                    ; preds = %165
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 13)
  %173 = add i64 %pgocount12, 1
  store i64 %173, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 13)
  %174 = load %struct.tiff*, %struct.tiff** %4, align 8
  %175 = getelementptr inbounds %struct.tiff, %struct.tiff* %174, i32 0, i32 40
  %176 = load i8*, i8** %175, align 8
  %177 = load i32, i32* %7, align 4
  %178 = sext i32 %177 to i64
  call void @TIFFReverseBits(i8* %176, i64 %178)
  br label %179

; <label>:179:                                    ; preds = %172, %165, %155
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 6)
  %180 = add i64 %pgocount13, 1
  store i64 %180, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFillTile, i64 0, i64 6)
  br label %181

; <label>:181:                                    ; preds = %179, %91
  %182 = load %struct.tiff*, %struct.tiff** %4, align 8
  %183 = load i32, i32* %5, align 4
  %184 = call i32 @TIFFStartTile(%struct.tiff* %182, i32 %183)
  store i32 %184, i32* %3, align 4
  br label %185

; <label>:185:                                    ; preds = %181, %153, %139, %124, %87, %19
  %186 = load i32, i32* %3, align 4
  ret i32 %186
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadRawTile(%struct.tiff*, i32, i8*, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.TIFFDirectory*, align 8
  %11 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i32 %1, i32* %7, align 4
  store i8* %2, i8** %8, align 8
  store i32 %3, i32* %9, align 4
  %12 = load %struct.tiff*, %struct.tiff** %6, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 6
  store %struct.TIFFDirectory* %13, %struct.TIFFDirectory** %10, align 8
  %14 = load %struct.tiff*, %struct.tiff** %6, align 8
  %15 = call i32 @TIFFCheckRead(%struct.tiff* %14, i32 1)
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %19, label %17

; <label>:17:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRawTile, i64 0, i64 0)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRawTile, i64 0, i64 0)
  store i32 -1, i32* %5, align 4
  br label %61

; <label>:19:                                     ; preds = %4
  %20 = load i32, i32* %7, align 4
  %21 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %22 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %21, i32 0, i32 43
  %23 = load i32, i32* %22, align 4
  %24 = icmp uge i32 %20, %23
  br i1 %24, label %25, label %36

; <label>:25:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRawTile, i64 0, i64 1)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRawTile, i64 0, i64 1)
  %27 = load %struct.tiff*, %struct.tiff** %6, align 8
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %27, i32 0, i32 0
  %29 = load i8*, i8** %28, align 8
  %30 = load i32, i32* %7, align 4
  %31 = zext i32 %30 to i64
  %32 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %33 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %32, i32 0, i32 43
  %34 = load i32, i32* %33, align 4
  %35 = zext i32 %34 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %29, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i32 0, i32 0), i64 %31, i64 %35)
  store i32 -1, i32* %5, align 4
  br label %61

; <label>:36:                                     ; preds = %19
  %37 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %38 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %37, i32 0, i32 45
  %39 = load i32*, i32** %38, align 8
  %40 = load i32, i32* %7, align 4
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32* %39, i64 %41
  %43 = load i32, i32* %42, align 4
  store i32 %43, i32* %11, align 4
  %44 = load i32, i32* %9, align 4
  %45 = icmp ne i32 %44, -1
  br i1 %45, label %46, label %54

; <label>:46:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRawTile, i64 0, i64 3)
  %47 = add i64 %pgocount2, 1
  store i64 %47, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRawTile, i64 0, i64 3)
  %48 = load i32, i32* %9, align 4
  %49 = load i32, i32* %11, align 4
  %50 = icmp slt i32 %48, %49
  br i1 %50, label %51, label %54

; <label>:51:                                     ; preds = %46
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRawTile, i64 0, i64 4)
  %52 = add i64 %pgocount3, 1
  store i64 %52, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRawTile, i64 0, i64 4)
  %53 = load i32, i32* %9, align 4
  store i32 %53, i32* %11, align 4
  br label %54

; <label>:54:                                     ; preds = %51, %46, %36
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRawTile, i64 0, i64 2)
  %55 = add i64 %pgocount4, 1
  store i64 %55, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadRawTile, i64 0, i64 2)
  %56 = load %struct.tiff*, %struct.tiff** %6, align 8
  %57 = load i32, i32* %7, align 4
  %58 = load i8*, i8** %8, align 8
  %59 = load i32, i32* %11, align 4
  %60 = call i32 @TIFFReadRawTile1(%struct.tiff* %56, i32 %57, i8* %58, i32 %59, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @TIFFReadRawTile.module, i32 0, i32 0))
  store i32 %60, i32* %5, align 4
  br label %61

; <label>:61:                                     ; preds = %54, %25, %17
  %62 = load i32, i32* %5, align 4
  ret i32 %62
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFReadRawTile1(%struct.tiff*, i32, i8*, i32, i8*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca %struct.tiff*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca %struct.TIFFDirectory*, align 8
  %13 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %7, align 8
  store i32 %1, i32* %8, align 4
  store i8* %2, i8** %9, align 8
  store i32 %3, i32* %10, align 4
  store i8* %4, i8** %11, align 8
  %14 = load %struct.tiff*, %struct.tiff** %7, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 6
  store %struct.TIFFDirectory* %15, %struct.TIFFDirectory** %12, align 8
  %16 = load %struct.tiff*, %struct.tiff** %7, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %16, i32 0, i32 3
  %18 = load i32, i32* %17, align 8
  %19 = and i32 %18, 2048
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %95, label %21

; <label>:21:                                     ; preds = %5
  %22 = load %struct.tiff*, %struct.tiff** %7, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %22, i32 0, i32 51
  %24 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %23, align 8
  %25 = load %struct.tiff*, %struct.tiff** %7, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %25, i32 0, i32 48
  %27 = load i8*, i8** %26, align 8
  %28 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %12, align 8
  %29 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %28, i32 0, i32 44
  %30 = load i32*, i32** %29, align 8
  %31 = load i32, i32* %8, align 4
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32* %30, i64 %32
  %34 = load i32, i32* %33, align 4
  %35 = ptrtoint i32 (i8*, i32, i32)* %24 to i64
  call void @__llvm_profile_instrument_target(i64 %35, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFReadRawTile1 to i8*), i32 0)
  %36 = call i32 %24(i8* %27, i32 %34, i32 0)
  %37 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %12, align 8
  %38 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %37, i32 0, i32 44
  %39 = load i32*, i32** %38, align 8
  %40 = load i32, i32* %8, align 4
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32* %39, i64 %41
  %43 = load i32, i32* %42, align 4
  %44 = icmp eq i32 %36, %43
  br i1 %44, label %61, label %45

; <label>:45:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawTile1, i64 0, i64 0)
  %46 = add i64 %pgocount, 1
  store i64 %46, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawTile1, i64 0, i64 0)
  %47 = load i8*, i8** %11, align 8
  %48 = load %struct.tiff*, %struct.tiff** %7, align 8
  %49 = getelementptr inbounds %struct.tiff, %struct.tiff* %48, i32 0, i32 0
  %50 = load i8*, i8** %49, align 8
  %51 = load %struct.tiff*, %struct.tiff** %7, align 8
  %52 = getelementptr inbounds %struct.tiff, %struct.tiff* %51, i32 0, i32 11
  %53 = load i32, i32* %52, align 8
  %54 = zext i32 %53 to i64
  %55 = load %struct.tiff*, %struct.tiff** %7, align 8
  %56 = getelementptr inbounds %struct.tiff, %struct.tiff* %55, i32 0, i32 18
  %57 = load i32, i32* %56, align 4
  %58 = zext i32 %57 to i64
  %59 = load i32, i32* %8, align 4
  %60 = zext i32 %59 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %47, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.17, i32 0, i32 0), i8* %50, i64 %54, i64 %58, i64 %60)
  store i32 -1, i32* %6, align 4
  br label %158

; <label>:61:                                     ; preds = %21
  %62 = load %struct.tiff*, %struct.tiff** %7, align 8
  %63 = getelementptr inbounds %struct.tiff, %struct.tiff* %62, i32 0, i32 49
  %64 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %63, align 8
  %65 = load %struct.tiff*, %struct.tiff** %7, align 8
  %66 = getelementptr inbounds %struct.tiff, %struct.tiff* %65, i32 0, i32 48
  %67 = load i8*, i8** %66, align 8
  %68 = load i8*, i8** %9, align 8
  %69 = load i32, i32* %10, align 4
  %70 = ptrtoint i32 (i8*, i8*, i32)* %64 to i64
  call void @__llvm_profile_instrument_target(i64 %70, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFReadRawTile1 to i8*), i32 1)
  %71 = call i32 %64(i8* %67, i8* %68, i32 %69)
  store i32 %71, i32* %13, align 4
  %72 = load i32, i32* %13, align 4
  %73 = load i32, i32* %10, align 4
  %74 = icmp ne i32 %72, %73
  br i1 %74, label %75, label %93

; <label>:75:                                     ; preds = %61
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawTile1, i64 0, i64 3)
  %76 = add i64 %pgocount1, 1
  store i64 %76, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawTile1, i64 0, i64 3)
  %77 = load i8*, i8** %11, align 8
  %78 = load %struct.tiff*, %struct.tiff** %7, align 8
  %79 = getelementptr inbounds %struct.tiff, %struct.tiff* %78, i32 0, i32 0
  %80 = load i8*, i8** %79, align 8
  %81 = load %struct.tiff*, %struct.tiff** %7, align 8
  %82 = getelementptr inbounds %struct.tiff, %struct.tiff* %81, i32 0, i32 11
  %83 = load i32, i32* %82, align 8
  %84 = zext i32 %83 to i64
  %85 = load %struct.tiff*, %struct.tiff** %7, align 8
  %86 = getelementptr inbounds %struct.tiff, %struct.tiff* %85, i32 0, i32 18
  %87 = load i32, i32* %86, align 4
  %88 = zext i32 %87 to i64
  %89 = load i32, i32* %13, align 4
  %90 = sext i32 %89 to i64
  %91 = load i32, i32* %10, align 4
  %92 = sext i32 %91 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %77, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.18, i32 0, i32 0), i8* %80, i64 %84, i64 %88, i64 %90, i64 %92)
  store i32 -1, i32* %6, align 4
  br label %158

; <label>:93:                                     ; preds = %61
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawTile1, i64 0, i64 4)
  %94 = add i64 %pgocount2, 1
  store i64 %94, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawTile1, i64 0, i64 4)
  br label %156

; <label>:95:                                     ; preds = %5
  %96 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %12, align 8
  %97 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %96, i32 0, i32 44
  %98 = load i32*, i32** %97, align 8
  %99 = load i32, i32* %8, align 4
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32* %98, i64 %100
  %102 = load i32, i32* %101, align 4
  %103 = load i32, i32* %10, align 4
  %104 = add i32 %102, %103
  %105 = load %struct.tiff*, %struct.tiff** %7, align 8
  %106 = getelementptr inbounds %struct.tiff, %struct.tiff* %105, i32 0, i32 45
  %107 = load i32, i32* %106, align 8
  %108 = icmp sgt i32 %104, %107
  br i1 %108, label %109, label %140

; <label>:109:                                    ; preds = %95
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawTile1, i64 0, i64 1)
  %110 = add i64 %pgocount3, 1
  store i64 %110, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawTile1, i64 0, i64 1)
  %111 = load i8*, i8** %11, align 8
  %112 = load %struct.tiff*, %struct.tiff** %7, align 8
  %113 = getelementptr inbounds %struct.tiff, %struct.tiff* %112, i32 0, i32 0
  %114 = load i8*, i8** %113, align 8
  %115 = load %struct.tiff*, %struct.tiff** %7, align 8
  %116 = getelementptr inbounds %struct.tiff, %struct.tiff* %115, i32 0, i32 11
  %117 = load i32, i32* %116, align 8
  %118 = zext i32 %117 to i64
  %119 = load %struct.tiff*, %struct.tiff** %7, align 8
  %120 = getelementptr inbounds %struct.tiff, %struct.tiff* %119, i32 0, i32 18
  %121 = load i32, i32* %120, align 4
  %122 = zext i32 %121 to i64
  %123 = load i32, i32* %8, align 4
  %124 = zext i32 %123 to i64
  %125 = load %struct.tiff*, %struct.tiff** %7, align 8
  %126 = getelementptr inbounds %struct.tiff, %struct.tiff* %125, i32 0, i32 45
  %127 = load i32, i32* %126, align 8
  %128 = sext i32 %127 to i64
  %129 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %12, align 8
  %130 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %129, i32 0, i32 44
  %131 = load i32*, i32** %130, align 8
  %132 = load i32, i32* %8, align 4
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds i32, i32* %131, i64 %133
  %135 = load i32, i32* %134, align 4
  %136 = zext i32 %135 to i64
  %137 = sub i64 %128, %136
  %138 = load i32, i32* %10, align 4
  %139 = sext i32 %138 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %111, i8* getelementptr inbounds ([74 x i8], [74 x i8]* @.str.19, i32 0, i32 0), i8* %114, i64 %118, i64 %122, i64 %124, i64 %137, i64 %139)
  store i32 -1, i32* %6, align 4
  br label %158

; <label>:140:                                    ; preds = %95
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawTile1, i64 0, i64 2)
  %141 = add i64 %pgocount4, 1
  store i64 %141, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFReadRawTile1, i64 0, i64 2)
  %142 = load i8*, i8** %9, align 8
  %143 = load %struct.tiff*, %struct.tiff** %7, align 8
  %144 = getelementptr inbounds %struct.tiff, %struct.tiff* %143, i32 0, i32 44
  %145 = load i8*, i8** %144, align 8
  %146 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %12, align 8
  %147 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %146, i32 0, i32 44
  %148 = load i32*, i32** %147, align 8
  %149 = load i32, i32* %8, align 4
  %150 = zext i32 %149 to i64
  %151 = getelementptr inbounds i32, i32* %148, i64 %150
  %152 = load i32, i32* %151, align 4
  %153 = zext i32 %152 to i64
  %154 = getelementptr inbounds i8, i8* %145, i64 %153
  %155 = load i32, i32* %10, align 4
  call void @_TIFFmemcpy(i8* %142, i8* %154, i32 %155)
  br label %156

; <label>:156:                                    ; preds = %140, %93
  %157 = load i32, i32* %10, align 4
  store i32 %157, i32* %6, align 4
  br label %158

; <label>:158:                                    ; preds = %156, %109, %75, %45
  %159 = load i32, i32* %6, align 4
  ret i32 %159
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadBufferSetup(%struct.tiff*, i8*, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  %8 = load %struct.tiff*, %struct.tiff** %5, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %8, i32 0, i32 40
  %10 = load i8*, i8** %9, align 8
  %11 = icmp ne i8* %10, null
  br i1 %11, label %12, label %27

; <label>:12:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadBufferSetup, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadBufferSetup, i64 0, i64 0)
  %14 = load %struct.tiff*, %struct.tiff** %5, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 3
  %16 = load i32, i32* %15, align 8
  %17 = and i32 %16, 512
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %24

; <label>:19:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadBufferSetup, i64 0, i64 4)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadBufferSetup, i64 0, i64 4)
  %21 = load %struct.tiff*, %struct.tiff** %5, align 8
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %21, i32 0, i32 40
  %23 = load i8*, i8** %22, align 8
  call void @_TIFFfree(i8* %23)
  br label %24

; <label>:24:                                     ; preds = %19, %12
  %25 = load %struct.tiff*, %struct.tiff** %5, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %25, i32 0, i32 40
  store i8* null, i8** %26, align 8
  br label %27

; <label>:27:                                     ; preds = %24, %3
  %28 = load i8*, i8** %6, align 8
  %29 = icmp ne i8* %28, null
  br i1 %29, label %30, label %41

; <label>:30:                                     ; preds = %27
  %31 = load i32, i32* %7, align 4
  %32 = load %struct.tiff*, %struct.tiff** %5, align 8
  %33 = getelementptr inbounds %struct.tiff, %struct.tiff* %32, i32 0, i32 41
  store i32 %31, i32* %33, align 8
  %34 = load i8*, i8** %6, align 8
  %35 = load %struct.tiff*, %struct.tiff** %5, align 8
  %36 = getelementptr inbounds %struct.tiff, %struct.tiff* %35, i32 0, i32 40
  store i8* %34, i8** %36, align 8
  %37 = load %struct.tiff*, %struct.tiff** %5, align 8
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %37, i32 0, i32 3
  %39 = load i32, i32* %38, align 8
  %40 = and i32 %39, -513
  store i32 %40, i32* %38, align 8
  br label %59

; <label>:41:                                     ; preds = %27
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadBufferSetup, i64 0, i64 2)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadBufferSetup, i64 0, i64 2)
  %43 = load i32, i32* %7, align 4
  %44 = add i32 %43, 1023
  %45 = udiv i32 %44, 1024
  %46 = mul i32 %45, 1024
  %47 = load %struct.tiff*, %struct.tiff** %5, align 8
  %48 = getelementptr inbounds %struct.tiff, %struct.tiff* %47, i32 0, i32 41
  store i32 %46, i32* %48, align 8
  %49 = load %struct.tiff*, %struct.tiff** %5, align 8
  %50 = getelementptr inbounds %struct.tiff, %struct.tiff* %49, i32 0, i32 41
  %51 = load i32, i32* %50, align 8
  %52 = call i8* @_TIFFmalloc(i32 %51)
  %53 = load %struct.tiff*, %struct.tiff** %5, align 8
  %54 = getelementptr inbounds %struct.tiff, %struct.tiff* %53, i32 0, i32 40
  store i8* %52, i8** %54, align 8
  %55 = load %struct.tiff*, %struct.tiff** %5, align 8
  %56 = getelementptr inbounds %struct.tiff, %struct.tiff* %55, i32 0, i32 3
  %57 = load i32, i32* %56, align 8
  %58 = or i32 %57, 512
  store i32 %58, i32* %56, align 8
  br label %59

; <label>:59:                                     ; preds = %41, %30
  %60 = load %struct.tiff*, %struct.tiff** %5, align 8
  %61 = getelementptr inbounds %struct.tiff, %struct.tiff* %60, i32 0, i32 40
  %62 = load i8*, i8** %61, align 8
  %63 = icmp eq i8* %62, null
  br i1 %63, label %64, label %75

; <label>:64:                                     ; preds = %59
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadBufferSetup, i64 0, i64 3)
  %65 = add i64 %pgocount3, 1
  store i64 %65, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadBufferSetup, i64 0, i64 3)
  %66 = load %struct.tiff*, %struct.tiff** %5, align 8
  %67 = getelementptr inbounds %struct.tiff, %struct.tiff* %66, i32 0, i32 0
  %68 = load i8*, i8** %67, align 8
  %69 = load %struct.tiff*, %struct.tiff** %5, align 8
  %70 = getelementptr inbounds %struct.tiff, %struct.tiff* %69, i32 0, i32 11
  %71 = load i32, i32* %70, align 8
  %72 = zext i32 %71 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @TIFFReadBufferSetup.module, i32 0, i32 0), i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.5, i32 0, i32 0), i8* %68, i64 %72)
  %73 = load %struct.tiff*, %struct.tiff** %5, align 8
  %74 = getelementptr inbounds %struct.tiff, %struct.tiff* %73, i32 0, i32 41
  store i32 0, i32* %74, align 8
  store i32 0, i32* %4, align 4
  br label %77

; <label>:75:                                     ; preds = %59
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadBufferSetup, i64 0, i64 1)
  %76 = add i64 %pgocount4, 1
  store i64 %76, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFReadBufferSetup, i64 0, i64 1)
  store i32 1, i32* %4, align 4
  br label %77

; <label>:77:                                     ; preds = %75, %64
  %78 = load i32, i32* %4, align 4
  ret i32 %78
}

declare void @_TIFFfree(i8*) #1

declare i8* @_TIFFmalloc(i32) #1

; Function Attrs: noinline nounwind uwtable
define void @_TIFFNoPostDecode(%struct.tiff*, i8*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoPostDecode, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoPostDecode, i64 0, i64 0)
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  %8 = load %struct.tiff*, %struct.tiff** %5, align 8
  %9 = load i8*, i8** %6, align 8
  %10 = load i32, i32* %7, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @_TIFFSwab16BitData(%struct.tiff*, i8*, i32) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %7 = load %struct.tiff*, %struct.tiff** %4, align 8
  %8 = load i32, i32* %6, align 4
  %9 = and i32 %8, 1
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %3
  br label %15

; <label>:12:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSwab16BitData, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSwab16BitData, i64 0, i64 1)
  call void @__assert_fail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0), i32 608, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__PRETTY_FUNCTION__._TIFFSwab16BitData, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %15

; <label>:15:                                     ; preds = %14, %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSwab16BitData, i64 0, i64 0)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSwab16BitData, i64 0, i64 0)
  %17 = load i8*, i8** %5, align 8
  %18 = bitcast i8* %17 to i16*
  %19 = load i32, i32* %6, align 4
  %20 = sdiv i32 %19, 2
  %21 = sext i32 %20 to i64
  call void @TIFFSwabArrayOfShort(i16* %18, i64 %21)
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #2

declare void @TIFFSwabArrayOfShort(i16*, i64) #1

; Function Attrs: noinline nounwind uwtable
define void @_TIFFSwab32BitData(%struct.tiff*, i8*, i32) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %7 = load %struct.tiff*, %struct.tiff** %4, align 8
  %8 = load i32, i32* %6, align 4
  %9 = and i32 %8, 3
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %3
  br label %15

; <label>:12:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSwab32BitData, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSwab32BitData, i64 0, i64 1)
  call void @__assert_fail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0), i32 616, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__PRETTY_FUNCTION__._TIFFSwab32BitData, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %15

; <label>:15:                                     ; preds = %14, %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSwab32BitData, i64 0, i64 0)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSwab32BitData, i64 0, i64 0)
  %17 = load i8*, i8** %5, align 8
  %18 = bitcast i8* %17 to i32*
  %19 = load i32, i32* %6, align 4
  %20 = sdiv i32 %19, 4
  %21 = sext i32 %20 to i64
  call void @TIFFSwabArrayOfLong(i32* %18, i64 %21)
  ret void
}

declare void @TIFFSwabArrayOfLong(i32*, i64) #1

; Function Attrs: noinline nounwind uwtable
define void @_TIFFSwab64BitData(%struct.tiff*, i8*, i32) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %7 = load %struct.tiff*, %struct.tiff** %4, align 8
  %8 = load i32, i32* %6, align 4
  %9 = and i32 %8, 7
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %3
  br label %15

; <label>:12:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSwab64BitData, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSwab64BitData, i64 0, i64 1)
  call void @__assert_fail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0), i32 624, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__PRETTY_FUNCTION__._TIFFSwab64BitData, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %15

; <label>:15:                                     ; preds = %14, %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSwab64BitData, i64 0, i64 0)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSwab64BitData, i64 0, i64 0)
  %17 = load i8*, i8** %5, align 8
  %18 = bitcast i8* %17 to double*
  %19 = load i32, i32* %6, align 4
  %20 = sdiv i32 %19, 8
  %21 = sext i32 %20 to i64
  call void @TIFFSwabArrayOfDouble(double* %18, i64 %21)
  ret void
}

declare void @TIFFSwabArrayOfDouble(double*, i64) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFStartStrip(%struct.tiff*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.TIFFDirectory*, align 8
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %7 = load %struct.tiff*, %struct.tiff** %4, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %7, i32 0, i32 6
  store %struct.TIFFDirectory* %8, %struct.TIFFDirectory** %6, align 8
  %9 = load %struct.tiff*, %struct.tiff** %4, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 3
  %11 = load i32, i32* %10, align 8
  %12 = and i32 %11, 32
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %30

; <label>:14:                                     ; preds = %2
  %15 = load %struct.tiff*, %struct.tiff** %4, align 8
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %15, i32 0, i32 21
  %17 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %16, align 8
  %18 = load %struct.tiff*, %struct.tiff** %4, align 8
  %19 = ptrtoint i32 (%struct.tiff*)* %17 to i64
  call void @__llvm_profile_instrument_target(i64 %19, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFStartStrip to i8*), i32 0)
  %20 = call i32 %17(%struct.tiff* %18)
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %24, label %22

; <label>:22:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFStartStrip, i64 0, i64 2)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFStartStrip, i64 0, i64 2)
  store i32 0, i32* %3, align 4
  br label %72

; <label>:24:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFStartStrip, i64 0, i64 1)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFStartStrip, i64 0, i64 1)
  %26 = load %struct.tiff*, %struct.tiff** %4, align 8
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %26, i32 0, i32 3
  %28 = load i32, i32* %27, align 8
  %29 = or i32 %28, 32
  store i32 %29, i32* %27, align 8
  br label %30

; <label>:30:                                     ; preds = %24, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFStartStrip, i64 0, i64 0)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFStartStrip, i64 0, i64 0)
  %32 = load i32, i32* %5, align 4
  %33 = load %struct.tiff*, %struct.tiff** %4, align 8
  %34 = getelementptr inbounds %struct.tiff, %struct.tiff* %33, i32 0, i32 13
  store i32 %32, i32* %34, align 8
  %35 = load i32, i32* %5, align 4
  %36 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %37 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %36, i32 0, i32 42
  %38 = load i32, i32* %37, align 8
  %39 = urem i32 %35, %38
  %40 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %41 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %40, i32 0, i32 16
  %42 = load i32, i32* %41, align 4
  %43 = mul i32 %39, %42
  %44 = load %struct.tiff*, %struct.tiff** %4, align 8
  %45 = getelementptr inbounds %struct.tiff, %struct.tiff* %44, i32 0, i32 11
  store i32 %43, i32* %45, align 8
  %46 = load %struct.tiff*, %struct.tiff** %4, align 8
  %47 = getelementptr inbounds %struct.tiff, %struct.tiff* %46, i32 0, i32 40
  %48 = load i8*, i8** %47, align 8
  %49 = load %struct.tiff*, %struct.tiff** %4, align 8
  %50 = getelementptr inbounds %struct.tiff, %struct.tiff* %49, i32 0, i32 42
  store i8* %48, i8** %50, align 8
  %51 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %52 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %51, i32 0, i32 45
  %53 = load i32*, i32** %52, align 8
  %54 = load i32, i32* %5, align 4
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32* %53, i64 %55
  %57 = load i32, i32* %56, align 4
  %58 = load %struct.tiff*, %struct.tiff** %4, align 8
  %59 = getelementptr inbounds %struct.tiff, %struct.tiff* %58, i32 0, i32 43
  store i32 %57, i32* %59, align 8
  %60 = load %struct.tiff*, %struct.tiff** %4, align 8
  %61 = getelementptr inbounds %struct.tiff, %struct.tiff* %60, i32 0, i32 22
  %62 = load i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*, i16)** %61, align 8
  %63 = load %struct.tiff*, %struct.tiff** %4, align 8
  %64 = load i32, i32* %5, align 4
  %65 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %66 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %65, i32 0, i32 42
  %67 = load i32, i32* %66, align 8
  %68 = udiv i32 %64, %67
  %69 = trunc i32 %68 to i16
  %70 = ptrtoint i32 (%struct.tiff*, i16)* %62 to i64
  call void @__llvm_profile_instrument_target(i64 %70, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFStartStrip to i8*), i32 1)
  %71 = call i32 %62(%struct.tiff* %63, i16 zeroext %69)
  store i32 %71, i32* %3, align 4
  br label %72

; <label>:72:                                     ; preds = %30, %22
  %73 = load i32, i32* %3, align 4
  ret i32 %73
}

declare void @_TIFFmemcpy(i8*, i8*, i32) #1

declare void @TIFFReverseBits(i8*, i64) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFStartTile(%struct.tiff*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.TIFFDirectory*, align 8
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %7 = load %struct.tiff*, %struct.tiff** %4, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %7, i32 0, i32 6
  store %struct.TIFFDirectory* %8, %struct.TIFFDirectory** %6, align 8
  %9 = load %struct.tiff*, %struct.tiff** %4, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 3
  %11 = load i32, i32* %10, align 8
  %12 = and i32 %11, 32
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %30

; <label>:14:                                     ; preds = %2
  %15 = load %struct.tiff*, %struct.tiff** %4, align 8
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %15, i32 0, i32 21
  %17 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %16, align 8
  %18 = load %struct.tiff*, %struct.tiff** %4, align 8
  %19 = ptrtoint i32 (%struct.tiff*)* %17 to i64
  call void @__llvm_profile_instrument_target(i64 %19, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFStartTile to i8*), i32 0)
  %20 = call i32 %17(%struct.tiff* %18)
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %24, label %22

; <label>:22:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFStartTile, i64 0, i64 2)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFStartTile, i64 0, i64 2)
  store i32 0, i32* %3, align 4
  br label %101

; <label>:24:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFStartTile, i64 0, i64 1)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFStartTile, i64 0, i64 1)
  %26 = load %struct.tiff*, %struct.tiff** %4, align 8
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %26, i32 0, i32 3
  %28 = load i32, i32* %27, align 8
  %29 = or i32 %28, 32
  store i32 %29, i32* %27, align 8
  br label %30

; <label>:30:                                     ; preds = %24, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFStartTile, i64 0, i64 0)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFStartTile, i64 0, i64 0)
  %32 = load i32, i32* %5, align 4
  %33 = load %struct.tiff*, %struct.tiff** %4, align 8
  %34 = getelementptr inbounds %struct.tiff, %struct.tiff* %33, i32 0, i32 19
  store i32 %32, i32* %34, align 8
  %35 = load i32, i32* %5, align 4
  %36 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %37 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %36, i32 0, i32 1
  %38 = load i32, i32* %37, align 8
  %39 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %40 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %39, i32 0, i32 4
  %41 = load i32, i32* %40, align 4
  %42 = sub i32 %41, 1
  %43 = add i32 %38, %42
  %44 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %45 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %44, i32 0, i32 4
  %46 = load i32, i32* %45, align 4
  %47 = udiv i32 %43, %46
  %48 = urem i32 %35, %47
  %49 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %50 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %49, i32 0, i32 5
  %51 = load i32, i32* %50, align 8
  %52 = mul i32 %48, %51
  %53 = load %struct.tiff*, %struct.tiff** %4, align 8
  %54 = getelementptr inbounds %struct.tiff, %struct.tiff* %53, i32 0, i32 11
  store i32 %52, i32* %54, align 8
  %55 = load i32, i32* %5, align 4
  %56 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %57 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %56, i32 0, i32 2
  %58 = load i32, i32* %57, align 4
  %59 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %60 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %59, i32 0, i32 5
  %61 = load i32, i32* %60, align 8
  %62 = sub i32 %61, 1
  %63 = add i32 %58, %62
  %64 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %65 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %64, i32 0, i32 5
  %66 = load i32, i32* %65, align 8
  %67 = udiv i32 %63, %66
  %68 = urem i32 %55, %67
  %69 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %70 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %69, i32 0, i32 4
  %71 = load i32, i32* %70, align 4
  %72 = mul i32 %68, %71
  %73 = load %struct.tiff*, %struct.tiff** %4, align 8
  %74 = getelementptr inbounds %struct.tiff, %struct.tiff* %73, i32 0, i32 18
  store i32 %72, i32* %74, align 4
  %75 = load %struct.tiff*, %struct.tiff** %4, align 8
  %76 = getelementptr inbounds %struct.tiff, %struct.tiff* %75, i32 0, i32 40
  %77 = load i8*, i8** %76, align 8
  %78 = load %struct.tiff*, %struct.tiff** %4, align 8
  %79 = getelementptr inbounds %struct.tiff, %struct.tiff* %78, i32 0, i32 42
  store i8* %77, i8** %79, align 8
  %80 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %81 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %80, i32 0, i32 45
  %82 = load i32*, i32** %81, align 8
  %83 = load i32, i32* %5, align 4
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32* %82, i64 %84
  %86 = load i32, i32* %85, align 4
  %87 = load %struct.tiff*, %struct.tiff** %4, align 8
  %88 = getelementptr inbounds %struct.tiff, %struct.tiff* %87, i32 0, i32 43
  store i32 %86, i32* %88, align 8
  %89 = load %struct.tiff*, %struct.tiff** %4, align 8
  %90 = getelementptr inbounds %struct.tiff, %struct.tiff* %89, i32 0, i32 22
  %91 = load i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*, i16)** %90, align 8
  %92 = load %struct.tiff*, %struct.tiff** %4, align 8
  %93 = load i32, i32* %5, align 4
  %94 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %95 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %94, i32 0, i32 42
  %96 = load i32, i32* %95, align 8
  %97 = udiv i32 %93, %96
  %98 = trunc i32 %97 to i16
  %99 = ptrtoint i32 (%struct.tiff*, i16)* %91 to i64
  call void @__llvm_profile_instrument_target(i64 %99, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFStartTile to i8*), i32 1)
  %100 = call i32 %91(%struct.tiff* %92, i16 zeroext %98)
  store i32 %100, i32* %3, align 4
  br label %101

; <label>:101:                                    ; preds = %30, %22
  %102 = load i32, i32* %3, align 4
  ret i32 %102
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #3

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
