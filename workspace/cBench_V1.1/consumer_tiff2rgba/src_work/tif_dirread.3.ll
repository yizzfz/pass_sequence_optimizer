; ModuleID = 'tif_dirread.2.ll'
source_filename = "tif_dirread.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, {}*, i32 (%struct.tiff*, i16)*, {}*, i32 (%struct.tiff*, i16)*, {}*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.TIFFDirEntry = type { i16, i16, i32, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [36 x i8] c"Seek error accessing TIFF directory\00", align 1
@.str.1 = private unnamed_addr constant [34 x i8] c"Can not read TIFF directory count\00", align 1
@.str.2 = private unnamed_addr constant [23 x i8] c"to read TIFF directory\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"Can not read TIFF directory\00", align 1
@.str.4 = private unnamed_addr constant [63 x i8] c"invalid TIFF directory; tags are not sorted in ascending order\00", align 1
@.str.5 = private unnamed_addr constant [41 x i8] c"unknown field with tag %d (0x%x) ignored\00", align 1
@.str.6 = private unnamed_addr constant [41 x i8] c"wrong data type %d for \22%s\22; tag ignored\00", align 1
@.str.7 = private unnamed_addr constant [12 x i8] c"ImageLength\00", align 1
@.str.8 = private unnamed_addr constant [20 x i8] c"PlanarConfiguration\00", align 1
@.str.9 = private unnamed_addr constant [12 x i8] c"TileOffsets\00", align 1
@.str.10 = private unnamed_addr constant [13 x i8] c"StripOffsets\00", align 1
@.str.11 = private unnamed_addr constant [31 x i8] c"to read \22TransferFunction\22 tag\00", align 1
@.str.12 = private unnamed_addr constant [9 x i8] c"Colormap\00", align 1
@.str.13 = private unnamed_addr constant [16 x i8] c"StripByteCounts\00", align 1
@.str.14 = private unnamed_addr constant [76 x i8] c"TIFF directory is missing required \22%s\22 field, calculating from imagelength\00", align 1
@.str.15 = private unnamed_addr constant [60 x i8] c"Bogus \22%s\22 field, ignoring and calculating from imagelength\00", align 1
@.str.16 = private unnamed_addr constant [12 x i8] c"No space %s\00", align 1
@.str.17 = private unnamed_addr constant [28 x i8] c"for \22StripByteCounts\22 array\00", align 1
@tiffDataWidth = external constant [0 x i32], align 4
@.str.18 = private unnamed_addr constant [46 x i8] c"TIFF directory is missing required \22%s\22 field\00", align 1
@.str.19 = private unnamed_addr constant [65 x i8] c"incorrect count for field \22%s\22 (%lu, expecting %lu); tag ignored\00", align 1
@.str.20 = private unnamed_addr constant [35 x i8] c"Error fetching data for field \22%s\22\00", align 1
@TIFFFetchNormalTag.mesg = internal constant [19 x i8] c"to fetch tag value\00", align 16
@.str.21 = private unnamed_addr constant [28 x i8] c"to fetch array of rationals\00", align 1
@.str.22 = private unnamed_addr constant [47 x i8] c"%s: Rational with zero denominator (num = %lu)\00", align 1
@.str.23 = private unnamed_addr constant [57 x i8] c"Cannot handle different per-sample values for field \22%s\22\00", align 1
@.str.24 = private unnamed_addr constant [44 x i8] c"Cannot read TIFF_ANY type %d for field \22%s\22\00", align 1
@.str.25 = private unnamed_addr constant [16 x i8] c"for strip array\00", align 1
@.str.26 = private unnamed_addr constant [19 x i8] c"to fetch strip tag\00", align 1
@TIFFFetchRefBlackWhite.mesg = internal constant [32 x i8] c"for \22ReferenceBlackWhite\22 array\00", align 16
@.str.27 = private unnamed_addr constant [36 x i8] c"for chopped \22StripByteCounts\22 array\00", align 1
@.str.28 = private unnamed_addr constant [33 x i8] c"for chopped \22StripOffsets\22 array\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFReadDirectory = private constant [17 x i8] c"TIFFReadDirectory"
@__profn_tmp1.ll_CheckMalloc = private constant [19 x i8] c"tmp1.ll:CheckMalloc"
@__profn_tmp1.ll_TIFFFetchNormalTag = private constant [26 x i8] c"tmp1.ll:TIFFFetchNormalTag"
@__profn_tmp1.ll_CheckDirCount = private constant [21 x i8] c"tmp1.ll:CheckDirCount"
@__profn_tmp1.ll_TIFFFetchPerSampleShorts = private constant [32 x i8] c"tmp1.ll:TIFFFetchPerSampleShorts"
@__profn_tmp1.ll_TIFFFetchExtraSamples = private constant [29 x i8] c"tmp1.ll:TIFFFetchExtraSamples"
@__profn_tmp1.ll_MissingRequired = private constant [23 x i8] c"tmp1.ll:MissingRequired"
@__profn_tmp1.ll_TIFFFetchPerSampleAnys = private constant [30 x i8] c"tmp1.ll:TIFFFetchPerSampleAnys"
@__profn_tmp1.ll_TIFFFetchStripThing = private constant [27 x i8] c"tmp1.ll:TIFFFetchStripThing"
@__profn_tmp1.ll_TIFFFetchData = private constant [21 x i8] c"tmp1.ll:TIFFFetchData"
@__profn_tmp1.ll_TIFFFetchShortPair = private constant [26 x i8] c"tmp1.ll:TIFFFetchShortPair"
@__profn_tmp1.ll_TIFFFetchRefBlackWhite = private constant [30 x i8] c"tmp1.ll:TIFFFetchRefBlackWhite"
@__profn_tmp1.ll_EstimateStripByteCounts = private constant [31 x i8] c"tmp1.ll:EstimateStripByteCounts"
@__profn_tmp1.ll_ChopUpSingleUncompressedStrip = private constant [37 x i8] c"tmp1.ll:ChopUpSingleUncompressedStrip"
@__profn_tmp1.ll_TIFFFetchShortArray = private constant [27 x i8] c"tmp1.ll:TIFFFetchShortArray"
@__profn_tmp1.ll_TIFFFetchByteArray = private constant [26 x i8] c"tmp1.ll:TIFFFetchByteArray"
@__profn_tmp1.ll_TIFFFetchLongArray = private constant [26 x i8] c"tmp1.ll:TIFFFetchLongArray"
@__profn_tmp1.ll_TIFFFetchRationalArray = private constant [30 x i8] c"tmp1.ll:TIFFFetchRationalArray"
@__profn_tmp1.ll_TIFFFetchFloatArray = private constant [27 x i8] c"tmp1.ll:TIFFFetchFloatArray"
@__profn_tmp1.ll_TIFFFetchDoubleArray = private constant [28 x i8] c"tmp1.ll:TIFFFetchDoubleArray"
@__profn_tmp1.ll_TIFFFetchString = private constant [23 x i8] c"tmp1.ll:TIFFFetchString"
@__profn_tmp1.ll_TIFFFetchFloat = private constant [22 x i8] c"tmp1.ll:TIFFFetchFloat"
@__profn_tmp1.ll_TIFFFetchRational = private constant [25 x i8] c"tmp1.ll:TIFFFetchRational"
@__profn_tmp1.ll_cvtRational = private constant [19 x i8] c"tmp1.ll:cvtRational"
@__profn_tmp1.ll_TIFFFetchAnyArray = private constant [25 x i8] c"tmp1.ll:TIFFFetchAnyArray"
@__profc_TIFFReadDirectory = private global [119 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFReadDirectory = private global [6 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFReadDirectory = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5114957493578756778, i64 73747763283661808, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFReadDirectory to i8*), i8* bitcast ([6 x i64]* @__profvp_TIFFReadDirectory to i8*), i32 119, [1 x i16] [i16 6] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_CheckMalloc = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_CheckMalloc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5954213479470834958, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_CheckMalloc, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFetchNormalTag = private global [49 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFFetchNormalTag = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4495329111272507132, i64 518450921933, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i32 0, i32 0), i8* null, i8* null, i32 49, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_CheckDirCount = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_CheckDirCount = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1934548380089738844, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_CheckDirCount, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFetchPerSampleShorts = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFFetchPerSampleShorts = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8910274743635081459, i64 102747353738, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleShorts, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFetchExtraSamples = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFFetchExtraSamples = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -408590854391086654, i64 65862179724, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchExtraSamples, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_MissingRequired = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_MissingRequired = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8961239338823203106, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_MissingRequired, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFetchPerSampleAnys = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFFetchPerSampleAnys = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 487203980658209971, i64 102747353738, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleAnys, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFetchStripThing = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFFetchStripThing = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4448676221299513142, i64 109268909150, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TIFFFetchStripThing, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFetchData = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_TIFFFetchData = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_TIFFFetchData = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5107161141736868588, i64 563094849887979, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_TIFFFetchData to i8*), i32 14, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFetchShortPair = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFFetchShortPair = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8816396240859237011, i64 53268482895, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFFetchShortPair, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFetchRefBlackWhite = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFFetchRefBlackWhite = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4941492445675227172, i64 102237450923, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchRefBlackWhite, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_EstimateStripByteCounts = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_EstimateStripByteCounts = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_EstimateStripByteCounts = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4003795974540425114, i64 281632485120952, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_EstimateStripByteCounts to i8*), i32 10, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_ChopUpSingleUncompressedStrip = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_ChopUpSingleUncompressedStrip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 290003050361686897, i64 125148478568, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_ChopUpSingleUncompressedStrip, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFetchShortArray = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFFetchShortArray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1053459610169768355, i64 89754072826, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchShortArray, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFetchByteArray = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFFetchByteArray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7844412927964070040, i64 121113032875, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i32 0, i32 0), i8* null, i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFetchLongArray = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFFetchLongArray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8330706764054252183, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFFetchLongArray, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFetchRationalArray = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFFetchRationalArray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8142567178383871652, i64 69904267673, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchRationalArray, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFetchFloatArray = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFFetchFloatArray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8019608233960562112, i64 42754363654, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchFloatArray, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFetchDoubleArray = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFFetchDoubleArray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3096184605828346815, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFFetchDoubleArray, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFetchString = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFFetchString = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1979169180594836490, i64 40465189888, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchString, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFetchFloat = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFFetchFloat = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2148898331003465597, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFFetchFloat, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFetchRational = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFFetchRational = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8302260320343408218, i64 38490985531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchRational, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_cvtRational = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_cvtRational = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2812785037392539908, i64 43969736709, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_cvtRational, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFFetchAnyArray = private global [27 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFFetchAnyArray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2017826993027073978, i64 381296807458, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i32 0, i32 0), i8* null, i8* null, i32 27, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [18 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [242 x i8] c"\9F\05\EE\01x\DA}\91AO\C30\0C\85\C5\1FB\E2\CAm[W\09\89\A1\A9\ED\C4\D9\A4\A6\8D\E6\C6\99\E3\22\FA\EFI\8BT@i\B8\FA{~\EF\C5i\9E\CA\B2Bh\0B+h\94e\BA\D3\C1?\DC\13=\1Ez4\D7\13\10\B1YgMT\97\A8\A6\7Fa\19\80\1A\E8\FE\CA\A3\CB\81G\A7\E9\C2\19\A5\86\C1\13\D6=\8B\86Tp\FCT\81o\C9\0F=\D9\10\AC\EB*\BC\8D\B1_\FB\8F\ED\CEM\1B\A6\B5\8A\F5M\1F-RV\80\C2\C6\C6\5C\EF\0CVRT\E1\FB\9E\C0\5C_{\AB\B8\E2cP;\80\E2\12\B5\9F\14\97\03\84_wa\7F\F1u\AC@xq\86\07/\18\02\B6\8B>\93\BF\13\81)e\B3{\06=\B3\EB2\A8\02\B5\EC\802\B8$\86\5C`\C1\E3\1B\E5\22\E7\07l\DDu1\CC\D7X\89\F9\D0d\B6\AA\E3w.\B1_\D6O\EE\22", section "__llvm_prf_names"
@llvm.used = appending global [27 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadDirectory to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_CheckMalloc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchNormalTag to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_CheckDirCount to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchPerSampleShorts to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchExtraSamples to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_MissingRequired to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchPerSampleAnys to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchStripThing to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchData to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchShortPair to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchRefBlackWhite to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_EstimateStripByteCounts to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_ChopUpSingleUncompressedStrip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchShortArray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchByteArray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchLongArray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchRationalArray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchFloatArray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchDoubleArray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchString to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchFloat to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchRational to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_cvtRational to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchAnyArray to i8*), i8* bitcast ([18 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([242 x i8], [242 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @TIFFReadDirectory(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.TIFFDirEntry*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.TIFFDirectory*, align 8
  %7 = alloca %struct.TIFFDirEntry*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  %10 = alloca double, align 8
  %11 = alloca %struct.TIFFFieldInfo*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i16, align 2
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store i32 0, i32* %16, align 4
  %20 = load %struct.tiff*, %struct.tiff** %3, align 8
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %20, i32 0, i32 5
  %22 = load i32, i32* %21, align 8
  %23 = load %struct.tiff*, %struct.tiff** %3, align 8
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %23, i32 0, i32 4
  store i32 %22, i32* %24, align 4
  %25 = load %struct.tiff*, %struct.tiff** %3, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %25, i32 0, i32 4
  %27 = load i32, i32* %26, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 32)
  %30 = add i64 %pgocount, 1
  store i64 %30, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 32)
  store i32 0, i32* %2, align 4
  br label %1352

; <label>:31:                                     ; preds = %1
  %32 = load %struct.tiff*, %struct.tiff** %3, align 8
  %33 = getelementptr inbounds %struct.tiff, %struct.tiff* %32, i32 0, i32 34
  %34 = load void (%struct.tiff*)*, void (%struct.tiff*)** %33, align 8
  %35 = load %struct.tiff*, %struct.tiff** %3, align 8
  %36 = ptrtoint void (%struct.tiff*)* %34 to i64
  call void @__llvm_profile_instrument_target(i64 %36, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadDirectory to i8*), i32 0)
  call void %34(%struct.tiff* %35)
  %37 = load %struct.tiff*, %struct.tiff** %3, align 8
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %37, i32 0, i32 12
  %39 = load i16, i16* %38, align 4
  %40 = add i16 %39, 1
  store i16 %40, i16* %38, align 4
  store i32 0, i32* %14, align 4
  %41 = load %struct.tiff*, %struct.tiff** %3, align 8
  %42 = getelementptr inbounds %struct.tiff, %struct.tiff* %41, i32 0, i32 3
  %43 = load i32, i32* %42, align 8
  %44 = and i32 %43, 2048
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %143, label %46

; <label>:46:                                     ; preds = %31
  %47 = load %struct.tiff*, %struct.tiff** %3, align 8
  %48 = getelementptr inbounds %struct.tiff, %struct.tiff* %47, i32 0, i32 51
  %49 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %48, align 8
  %50 = load %struct.tiff*, %struct.tiff** %3, align 8
  %51 = getelementptr inbounds %struct.tiff, %struct.tiff* %50, i32 0, i32 48
  %52 = load i8*, i8** %51, align 8
  %53 = load %struct.tiff*, %struct.tiff** %3, align 8
  %54 = getelementptr inbounds %struct.tiff, %struct.tiff* %53, i32 0, i32 4
  %55 = load i32, i32* %54, align 4
  %56 = ptrtoint i32 (i8*, i32, i32)* %49 to i64
  call void @__llvm_profile_instrument_target(i64 %56, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadDirectory to i8*), i32 1)
  %57 = call i32 %49(i8* %52, i32 %55, i32 0)
  %58 = load %struct.tiff*, %struct.tiff** %3, align 8
  %59 = getelementptr inbounds %struct.tiff, %struct.tiff* %58, i32 0, i32 4
  %60 = load i32, i32* %59, align 4
  %61 = icmp eq i32 %57, %60
  br i1 %61, label %67, label %62

; <label>:62:                                     ; preds = %46
  %pgocount21 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 35)
  %63 = add i64 %pgocount21, 1
  store i64 %63, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 35)
  %64 = load %struct.tiff*, %struct.tiff** %3, align 8
  %65 = getelementptr inbounds %struct.tiff, %struct.tiff* %64, i32 0, i32 0
  %66 = load i8*, i8** %65, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %66, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %1352

; <label>:67:                                     ; preds = %46
  %68 = load %struct.tiff*, %struct.tiff** %3, align 8
  %69 = getelementptr inbounds %struct.tiff, %struct.tiff* %68, i32 0, i32 49
  %70 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %69, align 8
  %71 = load %struct.tiff*, %struct.tiff** %3, align 8
  %72 = getelementptr inbounds %struct.tiff, %struct.tiff* %71, i32 0, i32 48
  %73 = load i8*, i8** %72, align 8
  %74 = bitcast i16* %13 to i8*
  %75 = ptrtoint i32 (i8*, i8*, i32)* %70 to i64
  call void @__llvm_profile_instrument_target(i64 %75, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadDirectory to i8*), i32 2)
  %76 = call i32 %70(i8* %73, i8* %74, i32 2)
  %77 = icmp eq i32 %76, 2
  br i1 %77, label %83, label %78

; <label>:78:                                     ; preds = %67
  %pgocount22 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 39)
  %79 = add i64 %pgocount22, 1
  store i64 %79, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 39)
  %80 = load %struct.tiff*, %struct.tiff** %3, align 8
  %81 = getelementptr inbounds %struct.tiff, %struct.tiff* %80, i32 0, i32 0
  %82 = load i8*, i8** %81, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %82, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.1, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %1352

; <label>:83:                                     ; preds = %67
  %84 = load %struct.tiff*, %struct.tiff** %3, align 8
  %85 = getelementptr inbounds %struct.tiff, %struct.tiff* %84, i32 0, i32 3
  %86 = load i32, i32* %85, align 8
  %87 = and i32 %86, 128
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %89, label %91

; <label>:89:                                     ; preds = %83
  %pgocount23 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 46)
  %90 = add i64 %pgocount23, 1
  store i64 %90, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 46)
  call void @TIFFSwabShort(i16* %13)
  br label %91

; <label>:91:                                     ; preds = %89, %83
  %92 = load %struct.tiff*, %struct.tiff** %3, align 8
  %93 = load i16, i16* %13, align 2
  %94 = zext i16 %93 to i64
  %95 = mul i64 %94, 12
  %96 = trunc i64 %95 to i32
  %97 = call i8* @CheckMalloc(%struct.tiff* %92, i32 %96, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.2, i32 0, i32 0))
  %98 = bitcast i8* %97 to %struct.TIFFDirEntry*
  store %struct.TIFFDirEntry* %98, %struct.TIFFDirEntry** %7, align 8
  %99 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %100 = icmp eq %struct.TIFFDirEntry* %99, null
  br i1 %100, label %101, label %103

; <label>:101:                                    ; preds = %91
  %pgocount24 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 50)
  %102 = add i64 %pgocount24, 1
  store i64 %102, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 50)
  store i32 0, i32* %2, align 4
  br label %1352

; <label>:103:                                    ; preds = %91
  %104 = load %struct.tiff*, %struct.tiff** %3, align 8
  %105 = getelementptr inbounds %struct.tiff, %struct.tiff* %104, i32 0, i32 49
  %106 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %105, align 8
  %107 = load %struct.tiff*, %struct.tiff** %3, align 8
  %108 = getelementptr inbounds %struct.tiff, %struct.tiff* %107, i32 0, i32 48
  %109 = load i8*, i8** %108, align 8
  %110 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %111 = bitcast %struct.TIFFDirEntry* %110 to i8*
  %112 = load i16, i16* %13, align 2
  %113 = zext i16 %112 to i32
  %114 = sext i32 %113 to i64
  %115 = mul i64 %114, 12
  %116 = trunc i64 %115 to i32
  %117 = ptrtoint i32 (i8*, i8*, i32)* %106 to i64
  call void @__llvm_profile_instrument_target(i64 %117, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadDirectory to i8*), i32 3)
  %118 = call i32 %106(i8* %109, i8* %111, i32 %116)
  %119 = sext i32 %118 to i64
  %120 = load i16, i16* %13, align 2
  %121 = zext i16 %120 to i32
  %122 = sext i32 %121 to i64
  %123 = mul i64 %122, 12
  %124 = icmp eq i64 %119, %123
  br i1 %124, label %130, label %125

; <label>:125:                                    ; preds = %103
  %pgocount25 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 51)
  %126 = add i64 %pgocount25, 1
  store i64 %126, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 51)
  %127 = load %struct.tiff*, %struct.tiff** %3, align 8
  %128 = getelementptr inbounds %struct.tiff, %struct.tiff* %127, i32 0, i32 0
  %129 = load i8*, i8** %128, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %129, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i32 0, i32 0))
  br label %1344

; <label>:130:                                    ; preds = %103
  %pgocount26 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 52)
  %131 = add i64 %pgocount26, 1
  store i64 %131, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 52)
  %132 = load %struct.tiff*, %struct.tiff** %3, align 8
  %133 = getelementptr inbounds %struct.tiff, %struct.tiff* %132, i32 0, i32 49
  %134 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %133, align 8
  %135 = load %struct.tiff*, %struct.tiff** %3, align 8
  %136 = getelementptr inbounds %struct.tiff, %struct.tiff* %135, i32 0, i32 48
  %137 = load i8*, i8** %136, align 8
  %138 = bitcast i32* %14 to i8*
  %139 = ptrtoint i32 (i8*, i8*, i32)* %134 to i64
  call void @__llvm_profile_instrument_target(i64 %139, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadDirectory to i8*), i32 4)
  %140 = call i32 %134(i8* %137, i8* %138, i32 4)
  %141 = icmp eq i32 %140, 4
  %142 = zext i1 %141 to i32
  br label %248

; <label>:143:                                    ; preds = %31
  %144 = load %struct.tiff*, %struct.tiff** %3, align 8
  %145 = getelementptr inbounds %struct.tiff, %struct.tiff* %144, i32 0, i32 4
  %146 = load i32, i32* %145, align 4
  store i32 %146, i32* %17, align 4
  %147 = load i32, i32* %17, align 4
  %148 = sext i32 %147 to i64
  %149 = add i64 %148, 2
  %150 = trunc i64 %149 to i32
  %151 = load %struct.tiff*, %struct.tiff** %3, align 8
  %152 = getelementptr inbounds %struct.tiff, %struct.tiff* %151, i32 0, i32 45
  %153 = load i32, i32* %152, align 8
  %154 = icmp sgt i32 %150, %153
  br i1 %154, label %155, label %160

; <label>:155:                                    ; preds = %143
  %pgocount27 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 36)
  %156 = add i64 %pgocount27, 1
  store i64 %156, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 36)
  %157 = load %struct.tiff*, %struct.tiff** %3, align 8
  %158 = getelementptr inbounds %struct.tiff, %struct.tiff* %157, i32 0, i32 0
  %159 = load i8*, i8** %158, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %159, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.1, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %1352

; <label>:160:                                    ; preds = %143
  %161 = bitcast i16* %13 to i8*
  %162 = load %struct.tiff*, %struct.tiff** %3, align 8
  %163 = getelementptr inbounds %struct.tiff, %struct.tiff* %162, i32 0, i32 44
  %164 = load i8*, i8** %163, align 8
  %165 = load i32, i32* %17, align 4
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds i8, i8* %164, i64 %166
  call void @_TIFFmemcpy(i8* %161, i8* %167, i32 2)
  br label %168

; <label>:168:                                    ; preds = %160
  %169 = load i32, i32* %17, align 4
  %170 = sext i32 %169 to i64
  %171 = add i64 %170, 2
  %172 = trunc i64 %171 to i32
  store i32 %172, i32* %17, align 4
  %173 = load %struct.tiff*, %struct.tiff** %3, align 8
  %174 = getelementptr inbounds %struct.tiff, %struct.tiff* %173, i32 0, i32 3
  %175 = load i32, i32* %174, align 8
  %176 = and i32 %175, 128
  %177 = icmp ne i32 %176, 0
  br i1 %177, label %178, label %180

; <label>:178:                                    ; preds = %168
  %pgocount28 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 40)
  %179 = add i64 %pgocount28, 1
  store i64 %179, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 40)
  call void @TIFFSwabShort(i16* %13)
  br label %180

; <label>:180:                                    ; preds = %178, %168
  %181 = load %struct.tiff*, %struct.tiff** %3, align 8
  %182 = load i16, i16* %13, align 2
  %183 = zext i16 %182 to i64
  %184 = mul i64 %183, 12
  %185 = trunc i64 %184 to i32
  %186 = call i8* @CheckMalloc(%struct.tiff* %181, i32 %185, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.2, i32 0, i32 0))
  %187 = bitcast i8* %186 to %struct.TIFFDirEntry*
  store %struct.TIFFDirEntry* %187, %struct.TIFFDirEntry** %7, align 8
  %188 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %189 = icmp eq %struct.TIFFDirEntry* %188, null
  br i1 %189, label %190, label %192

; <label>:190:                                    ; preds = %180
  %pgocount29 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 42)
  %191 = add i64 %pgocount29, 1
  store i64 %191, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 42)
  store i32 0, i32* %2, align 4
  br label %1352

; <label>:192:                                    ; preds = %180
  %193 = load i32, i32* %17, align 4
  %194 = sext i32 %193 to i64
  %195 = load i16, i16* %13, align 2
  %196 = zext i16 %195 to i64
  %197 = mul i64 %196, 12
  %198 = add i64 %194, %197
  %199 = trunc i64 %198 to i32
  %200 = load %struct.tiff*, %struct.tiff** %3, align 8
  %201 = getelementptr inbounds %struct.tiff, %struct.tiff* %200, i32 0, i32 45
  %202 = load i32, i32* %201, align 8
  %203 = icmp sgt i32 %199, %202
  br i1 %203, label %204, label %209

; <label>:204:                                    ; preds = %192
  %pgocount30 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 44)
  %205 = add i64 %pgocount30, 1
  store i64 %205, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 44)
  %206 = load %struct.tiff*, %struct.tiff** %3, align 8
  %207 = getelementptr inbounds %struct.tiff, %struct.tiff* %206, i32 0, i32 0
  %208 = load i8*, i8** %207, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %208, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i32 0, i32 0))
  br label %1344

; <label>:209:                                    ; preds = %192
  %210 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %211 = bitcast %struct.TIFFDirEntry* %210 to i8*
  %212 = load %struct.tiff*, %struct.tiff** %3, align 8
  %213 = getelementptr inbounds %struct.tiff, %struct.tiff* %212, i32 0, i32 44
  %214 = load i8*, i8** %213, align 8
  %215 = load i32, i32* %17, align 4
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds i8, i8* %214, i64 %216
  %218 = load i16, i16* %13, align 2
  %219 = zext i16 %218 to i64
  %220 = mul i64 %219, 12
  %221 = trunc i64 %220 to i32
  call void @_TIFFmemcpy(i8* %211, i8* %217, i32 %221)
  br label %222

; <label>:222:                                    ; preds = %209
  %223 = load i16, i16* %13, align 2
  %224 = zext i16 %223 to i64
  %225 = mul i64 %224, 12
  %226 = load i32, i32* %17, align 4
  %227 = sext i32 %226 to i64
  %228 = add i64 %227, %225
  %229 = trunc i64 %228 to i32
  store i32 %229, i32* %17, align 4
  %230 = load i32, i32* %17, align 4
  %231 = sext i32 %230 to i64
  %232 = add i64 %231, 4
  %233 = trunc i64 %232 to i32
  %234 = load %struct.tiff*, %struct.tiff** %3, align 8
  %235 = getelementptr inbounds %struct.tiff, %struct.tiff* %234, i32 0, i32 45
  %236 = load i32, i32* %235, align 8
  %237 = icmp sle i32 %233, %236
  br i1 %237, label %238, label %247

; <label>:238:                                    ; preds = %222
  %pgocount31 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 53)
  %239 = add i64 %pgocount31, 1
  store i64 %239, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 53)
  %240 = bitcast i32* %14 to i8*
  %241 = load %struct.tiff*, %struct.tiff** %3, align 8
  %242 = getelementptr inbounds %struct.tiff, %struct.tiff* %241, i32 0, i32 44
  %243 = load i8*, i8** %242, align 8
  %244 = load i32, i32* %17, align 4
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds i8, i8* %243, i64 %245
  call void @_TIFFmemcpy(i8* %240, i8* %246, i32 4)
  br label %247

; <label>:247:                                    ; preds = %238, %222
  br label %248

; <label>:248:                                    ; preds = %247, %130
  %249 = load %struct.tiff*, %struct.tiff** %3, align 8
  %250 = getelementptr inbounds %struct.tiff, %struct.tiff* %249, i32 0, i32 3
  %251 = load i32, i32* %250, align 8
  %252 = and i32 %251, 128
  %253 = icmp ne i32 %252, 0
  br i1 %253, label %254, label %256

; <label>:254:                                    ; preds = %248
  %pgocount32 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 48)
  %255 = add i64 %pgocount32, 1
  store i64 %255, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 48)
  call void @TIFFSwabLong(i32* %14)
  br label %256

; <label>:256:                                    ; preds = %254, %248
  %257 = load i32, i32* %14, align 4
  %258 = load %struct.tiff*, %struct.tiff** %3, align 8
  %259 = getelementptr inbounds %struct.tiff, %struct.tiff* %258, i32 0, i32 5
  store i32 %257, i32* %259, align 8
  %260 = load %struct.tiff*, %struct.tiff** %3, align 8
  %261 = getelementptr inbounds %struct.tiff, %struct.tiff* %260, i32 0, i32 3
  %262 = load i32, i32* %261, align 8
  %263 = and i32 %262, -65
  store i32 %263, i32* %261, align 8
  %264 = load %struct.tiff*, %struct.tiff** %3, align 8
  %265 = getelementptr inbounds %struct.tiff, %struct.tiff* %264, i32 0, i32 6
  store %struct.TIFFDirectory* %265, %struct.TIFFDirectory** %6, align 8
  %266 = load %struct.tiff*, %struct.tiff** %3, align 8
  call void @TIFFFreeDirectory(%struct.tiff* %266)
  %267 = load %struct.tiff*, %struct.tiff** %3, align 8
  %268 = call i32 @TIFFDefaultDirectory(%struct.tiff* %267)
  %269 = load %struct.tiff*, %struct.tiff** %3, align 8
  %270 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %269, i32 284, i32 1)
  %271 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  store %struct.TIFFDirEntry* %271, %struct.TIFFDirEntry** %4, align 8
  %272 = load i16, i16* %13, align 2
  %273 = zext i16 %272 to i32
  store i32 %273, i32* %5, align 4
  br label %274

; <label>:274:                                    ; preds = %307, %256
  %275 = load i32, i32* %5, align 4
  %276 = icmp sgt i32 %275, 0
  br i1 %276, label %277, label %313

; <label>:277:                                    ; preds = %274
  %278 = load %struct.tiff*, %struct.tiff** %3, align 8
  %279 = getelementptr inbounds %struct.tiff, %struct.tiff* %278, i32 0, i32 3
  %280 = load i32, i32* %279, align 8
  %281 = and i32 %280, 128
  %282 = icmp ne i32 %281, 0
  br i1 %282, label %283, label %289

; <label>:283:                                    ; preds = %277
  %pgocount33 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 26)
  %284 = add i64 %pgocount33, 1
  store i64 %284, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 26)
  %285 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %286 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %285, i32 0, i32 0
  call void @TIFFSwabArrayOfShort(i16* %286, i64 2)
  %287 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %288 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %287, i32 0, i32 2
  call void @TIFFSwabArrayOfLong(i32* %288, i64 2)
  br label %289

; <label>:289:                                    ; preds = %283, %277
  %290 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %291 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %290, i32 0, i32 0
  %292 = load i16, i16* %291, align 4
  %293 = zext i16 %292 to i32
  %294 = icmp eq i32 %293, 277
  br i1 %294, label %295, label %306

; <label>:295:                                    ; preds = %289
  %296 = load %struct.tiff*, %struct.tiff** %3, align 8
  %297 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %298 = call i32 @TIFFFetchNormalTag(%struct.tiff* %296, %struct.TIFFDirEntry* %297)
  %299 = icmp ne i32 %298, 0
  br i1 %299, label %302, label %300

; <label>:300:                                    ; preds = %295
  %pgocount34 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 55)
  %301 = add i64 %pgocount34, 1
  store i64 %301, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 55)
  br label %1344

; <label>:302:                                    ; preds = %295
  %pgocount35 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 27)
  %303 = add i64 %pgocount35, 1
  store i64 %303, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 27)
  %304 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %305 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %304, i32 0, i32 0
  store i16 0, i16* %305, align 4
  br label %306

; <label>:306:                                    ; preds = %302, %289
  br label %307

; <label>:307:                                    ; preds = %306
  %pgocount36 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 22)
  %308 = add i64 %pgocount36, 1
  store i64 %308, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 22)
  %309 = load i32, i32* %5, align 4
  %310 = add nsw i32 %309, -1
  store i32 %310, i32* %5, align 4
  %311 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %312 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %311, i32 1
  store %struct.TIFFDirEntry* %312, %struct.TIFFDirEntry** %4, align 8
  br label %274

; <label>:313:                                    ; preds = %274
  store i32 0, i32* %12, align 4
  %314 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  store %struct.TIFFDirEntry* %314, %struct.TIFFDirEntry** %4, align 8
  %315 = load i16, i16* %13, align 2
  %316 = zext i16 %315 to i32
  store i32 %316, i32* %5, align 4
  br label %317

; <label>:317:                                    ; preds = %689, %313
  %318 = load i32, i32* %5, align 4
  %319 = icmp sgt i32 %318, 0
  br i1 %319, label %320, label %694

; <label>:320:                                    ; preds = %317
  %321 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %322 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %321, i32 0, i32 0
  %323 = load i16, i16* %322, align 4
  %324 = zext i16 %323 to i32
  %325 = call i32 @TIFFReassignTagToIgnore(i32 1, i32 %324)
  %326 = icmp ne i32 %325, 0
  br i1 %326, label %327, label %331

; <label>:327:                                    ; preds = %320
  %pgocount37 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 25)
  %328 = add i64 %pgocount37, 1
  store i64 %328, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 25)
  %329 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %330 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %329, i32 0, i32 0
  store i16 0, i16* %330, align 4
  br label %331

; <label>:331:                                    ; preds = %327, %320
  %332 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %333 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %332, i32 0, i32 0
  %334 = load i16, i16* %333, align 4
  %335 = zext i16 %334 to i32
  %336 = icmp eq i32 %335, 0
  br i1 %336, label %337, label %339

; <label>:337:                                    ; preds = %331
  %pgocount38 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 29)
  %338 = add i64 %pgocount38, 1
  store i64 %338, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 29)
  br label %689

; <label>:339:                                    ; preds = %331
  %340 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %341 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %340, i32 0, i32 0
  %342 = load i16, i16* %341, align 4
  %343 = zext i16 %342 to i32
  %344 = load %struct.tiff*, %struct.tiff** %3, align 8
  %345 = getelementptr inbounds %struct.tiff, %struct.tiff* %344, i32 0, i32 55
  %346 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %345, align 8
  %347 = load i32, i32* %12, align 4
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %346, i64 %348
  %350 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %349, align 8
  %351 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %350, i32 0, i32 0
  %352 = load i32, i32* %351, align 8
  %353 = icmp ult i32 %343, %352
  br i1 %353, label %354, label %364

; <label>:354:                                    ; preds = %339
  %355 = load i32, i32* %16, align 4
  %356 = icmp ne i32 %355, 0
  br i1 %356, label %362, label %357

; <label>:357:                                    ; preds = %354
  %pgocount39 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 34)
  %358 = add i64 %pgocount39, 1
  store i64 %358, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 34)
  %359 = load %struct.tiff*, %struct.tiff** %3, align 8
  %360 = getelementptr inbounds %struct.tiff, %struct.tiff* %359, i32 0, i32 0
  %361 = load i8*, i8** %360, align 8
  call void (i8*, i8*, ...) @TIFFWarning(i8* %361, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.4, i32 0, i32 0))
  store i32 1, i32* %16, align 4
  br label %362

; <label>:362:                                    ; preds = %357, %354
  %pgocount40 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 30)
  %363 = add i64 %pgocount40, 1
  store i64 %363, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 30)
  store i32 0, i32* %12, align 4
  br label %364

; <label>:364:                                    ; preds = %362, %339
  br label %365

; <label>:365:                                    ; preds = %389, %364
  %366 = load i32, i32* %12, align 4
  %367 = load %struct.tiff*, %struct.tiff** %3, align 8
  %368 = getelementptr inbounds %struct.tiff, %struct.tiff* %367, i32 0, i32 56
  %369 = load i32, i32* %368, align 8
  %370 = icmp slt i32 %366, %369
  br i1 %370, label %371, label %387

; <label>:371:                                    ; preds = %365
  %pgocount41 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 1)
  %372 = add i64 %pgocount41, 1
  store i64 %372, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 1)
  %373 = load %struct.tiff*, %struct.tiff** %3, align 8
  %374 = getelementptr inbounds %struct.tiff, %struct.tiff* %373, i32 0, i32 55
  %375 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %374, align 8
  %376 = load i32, i32* %12, align 4
  %377 = sext i32 %376 to i64
  %378 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %375, i64 %377
  %379 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %378, align 8
  %380 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %379, i32 0, i32 0
  %381 = load i32, i32* %380, align 8
  %382 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %383 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %382, i32 0, i32 0
  %384 = load i16, i16* %383, align 4
  %385 = zext i16 %384 to i32
  %386 = icmp ult i32 %381, %385
  br label %387

; <label>:387:                                    ; preds = %371, %365
  %388 = phi i1 [ false, %365 ], [ %386, %371 ]
  br i1 %388, label %389, label %393

; <label>:389:                                    ; preds = %387
  %pgocount42 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 0)
  %390 = add i64 %pgocount42, 1
  store i64 %390, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 0)
  %391 = load i32, i32* %12, align 4
  %392 = add nsw i32 %391, 1
  store i32 %392, i32* %12, align 4
  br label %365

; <label>:393:                                    ; preds = %387
  %394 = load i32, i32* %12, align 4
  %395 = load %struct.tiff*, %struct.tiff** %3, align 8
  %396 = getelementptr inbounds %struct.tiff, %struct.tiff* %395, i32 0, i32 56
  %397 = load i32, i32* %396, align 8
  %398 = icmp eq i32 %394, %397
  br i1 %398, label %415, label %399

; <label>:399:                                    ; preds = %393
  %pgocount43 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 31)
  %400 = add i64 %pgocount43, 1
  store i64 %400, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 31)
  %401 = load %struct.tiff*, %struct.tiff** %3, align 8
  %402 = getelementptr inbounds %struct.tiff, %struct.tiff* %401, i32 0, i32 55
  %403 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %402, align 8
  %404 = load i32, i32* %12, align 4
  %405 = sext i32 %404 to i64
  %406 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %403, i64 %405
  %407 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %406, align 8
  %408 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %407, i32 0, i32 0
  %409 = load i32, i32* %408, align 8
  %410 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %411 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %410, i32 0, i32 0
  %412 = load i16, i16* %411, align 4
  %413 = zext i16 %412 to i32
  %414 = icmp ne i32 %409, %413
  br i1 %414, label %415, label %430

; <label>:415:                                    ; preds = %399, %393
  %pgocount44 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 28)
  %416 = add i64 %pgocount44, 1
  store i64 %416, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 28)
  %417 = load %struct.tiff*, %struct.tiff** %3, align 8
  %418 = getelementptr inbounds %struct.tiff, %struct.tiff* %417, i32 0, i32 0
  %419 = load i8*, i8** %418, align 8
  %420 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %421 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %420, i32 0, i32 0
  %422 = load i16, i16* %421, align 4
  %423 = zext i16 %422 to i32
  %424 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %425 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %424, i32 0, i32 0
  %426 = load i16, i16* %425, align 4
  %427 = zext i16 %426 to i32
  call void (i8*, i8*, ...) @TIFFWarning(i8* %419, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.5, i32 0, i32 0), i32 %423, i32 %427)
  %428 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %429 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %428, i32 0, i32 0
  store i16 0, i16* %429, align 4
  store i32 0, i32* %12, align 4
  br label %689

; <label>:430:                                    ; preds = %399
  %431 = load %struct.tiff*, %struct.tiff** %3, align 8
  %432 = getelementptr inbounds %struct.tiff, %struct.tiff* %431, i32 0, i32 55
  %433 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %432, align 8
  %434 = load i32, i32* %12, align 4
  %435 = sext i32 %434 to i64
  %436 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %433, i64 %435
  %437 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %436, align 8
  %438 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %437, i32 0, i32 4
  %439 = load i16, i16* %438, align 4
  %440 = zext i16 %439 to i32
  %441 = icmp eq i32 %440, 0
  br i1 %441, label %442, label %447

; <label>:442:                                    ; preds = %430
  %pgocount45 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 38)
  %443 = add i64 %pgocount45, 1
  store i64 %443, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 38)
  br label %444

; <label>:444:                                    ; preds = %539, %493, %442
  %445 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %446 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %445, i32 0, i32 0
  store i16 0, i16* %446, align 4
  br label %689

; <label>:447:                                    ; preds = %430
  %448 = load %struct.tiff*, %struct.tiff** %3, align 8
  %449 = getelementptr inbounds %struct.tiff, %struct.tiff* %448, i32 0, i32 55
  %450 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %449, align 8
  %451 = load i32, i32* %12, align 4
  %452 = sext i32 %451 to i64
  %453 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %450, i64 %452
  %454 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %453, align 8
  store %struct.TIFFFieldInfo* %454, %struct.TIFFFieldInfo** %11, align 8
  br label %455

; <label>:455:                                    ; preds = %506, %447
  %456 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %457 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %456, i32 0, i32 1
  %458 = load i16, i16* %457, align 2
  %459 = zext i16 %458 to i32
  %460 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %11, align 8
  %461 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %460, i32 0, i32 3
  %462 = load i32, i32* %461, align 8
  %463 = trunc i32 %462 to i16
  %464 = zext i16 %463 to i32
  %465 = icmp ne i32 %459, %464
  br i1 %465, label %466, label %508

; <label>:466:                                    ; preds = %455
  %467 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %11, align 8
  %468 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %467, i32 0, i32 3
  %469 = load i32, i32* %468, align 8
  %470 = icmp eq i32 %469, 0
  br i1 %470, label %471, label %473

; <label>:471:                                    ; preds = %466
  %pgocount46 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 47)
  %472 = add i64 %pgocount46, 1
  store i64 %472, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 47)
  br label %508

; <label>:473:                                    ; preds = %466
  %474 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %11, align 8
  %475 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %474, i32 1
  store %struct.TIFFFieldInfo* %475, %struct.TIFFFieldInfo** %11, align 8
  %476 = load i32, i32* %12, align 4
  %477 = add nsw i32 %476, 1
  store i32 %477, i32* %12, align 4
  %478 = load i32, i32* %12, align 4
  %479 = load %struct.tiff*, %struct.tiff** %3, align 8
  %480 = getelementptr inbounds %struct.tiff, %struct.tiff* %479, i32 0, i32 56
  %481 = load i32, i32* %480, align 8
  %482 = icmp eq i32 %478, %481
  br i1 %482, label %493, label %483

; <label>:483:                                    ; preds = %473
  %pgocount47 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 23)
  %484 = add i64 %pgocount47, 1
  store i64 %484, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 23)
  %485 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %11, align 8
  %486 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %485, i32 0, i32 0
  %487 = load i32, i32* %486, align 8
  %488 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %489 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %488, i32 0, i32 0
  %490 = load i16, i16* %489, align 4
  %491 = zext i16 %490 to i32
  %492 = icmp ne i32 %487, %491
  br i1 %492, label %493, label %506

; <label>:493:                                    ; preds = %483, %473
  %pgocount48 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 41)
  %494 = add i64 %pgocount48, 1
  store i64 %494, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 41)
  %495 = load %struct.tiff*, %struct.tiff** %3, align 8
  %496 = getelementptr inbounds %struct.tiff, %struct.tiff* %495, i32 0, i32 0
  %497 = load i8*, i8** %496, align 8
  %498 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %499 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %498, i32 0, i32 1
  %500 = load i16, i16* %499, align 2
  %501 = zext i16 %500 to i32
  %502 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %11, align 8
  %503 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %502, i64 -1
  %504 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %503, i32 0, i32 7
  %505 = load i8*, i8** %504, align 8
  call void (i8*, i8*, ...) @TIFFWarning(i8* %497, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.6, i32 0, i32 0), i32 %501, i8* %505)
  br label %444

; <label>:506:                                    ; preds = %483
  %pgocount49 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 24)
  %507 = add i64 %pgocount49, 1
  store i64 %507, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 24)
  br label %455

; <label>:508:                                    ; preds = %471, %455
  %509 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %11, align 8
  %510 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %509, i32 0, i32 1
  %511 = load i16, i16* %510, align 4
  %512 = sext i16 %511 to i32
  %513 = icmp ne i32 %512, -1
  br i1 %513, label %514, label %542

; <label>:514:                                    ; preds = %508
  %515 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %11, align 8
  %516 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %515, i32 0, i32 1
  %517 = load i16, i16* %516, align 4
  %518 = sext i16 %517 to i32
  %519 = icmp eq i32 %518, -2
  br i1 %519, label %520, label %526

; <label>:520:                                    ; preds = %514
  %pgocount50 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 56)
  %521 = add i64 %pgocount50, 1
  store i64 %521, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 56)
  %522 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %523 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %522, i32 0, i32 15
  %524 = load i16, i16* %523, align 2
  %525 = zext i16 %524 to i32
  br label %532

; <label>:526:                                    ; preds = %514
  %pgocount51 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 57)
  %527 = add i64 %pgocount51, 1
  store i64 %527, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 57)
  %528 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %11, align 8
  %529 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %528, i32 0, i32 1
  %530 = load i16, i16* %529, align 4
  %531 = sext i16 %530 to i32
  br label %532

; <label>:532:                                    ; preds = %526, %520
  %533 = phi i32 [ %525, %520 ], [ %531, %526 ]
  store i32 %533, i32* %18, align 4
  %534 = load %struct.tiff*, %struct.tiff** %3, align 8
  %535 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %536 = load i32, i32* %18, align 4
  %537 = call i32 @CheckDirCount(%struct.tiff* %534, %struct.TIFFDirEntry* %535, i32 %536)
  %538 = icmp ne i32 %537, 0
  br i1 %538, label %541, label %539

; <label>:539:                                    ; preds = %532
  %pgocount52 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 58)
  %540 = add i64 %pgocount52, 1
  store i64 %540, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 58)
  br label %444

; <label>:541:                                    ; preds = %532
  br label %542

; <label>:542:                                    ; preds = %541, %508
  %543 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %544 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %543, i32 0, i32 0
  %545 = load i16, i16* %544, align 4
  %546 = zext i16 %545 to i32
  switch i32 %546, label %687 [
    i32 259, label %557
    i32 273, label %._crit_edge10
    i32 279, label %._crit_edge11
    i32 324, label %._crit_edge12
    i32 325, label %648
    i32 256, label %._crit_edge13
    i32 257, label %._crit_edge14
    i32 32997, label %._crit_edge15
    i32 323, label %._crit_edge16
    i32 322, label %._crit_edge17
    i32 32998, label %._crit_edge18
    i32 284, label %._crit_edge19
    i32 278, label %669
    i32 338, label %680
  ]

._crit_edge19:                                    ; preds = %542
  %pgocount53 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 21)
  %547 = add i64 %pgocount53, 1
  store i64 %547, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 21)
  br label %669

._crit_edge18:                                    ; preds = %542
  %pgocount54 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 20)
  %548 = add i64 %pgocount54, 1
  store i64 %548, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 20)
  br label %669

._crit_edge17:                                    ; preds = %542
  %pgocount55 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 19)
  %549 = add i64 %pgocount55, 1
  store i64 %549, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 19)
  br label %669

._crit_edge16:                                    ; preds = %542
  %pgocount56 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 18)
  %550 = add i64 %pgocount56, 1
  store i64 %550, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 18)
  br label %669

._crit_edge15:                                    ; preds = %542
  %pgocount57 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 17)
  %551 = add i64 %pgocount57, 1
  store i64 %551, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 17)
  br label %669

._crit_edge14:                                    ; preds = %542
  %pgocount58 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 16)
  %552 = add i64 %pgocount58, 1
  store i64 %552, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 16)
  br label %669

._crit_edge13:                                    ; preds = %542
  %pgocount59 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 15)
  %553 = add i64 %pgocount59, 1
  store i64 %553, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 15)
  br label %669

._crit_edge12:                                    ; preds = %542
  %pgocount60 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 14)
  %554 = add i64 %pgocount60, 1
  store i64 %554, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 14)
  br label %648

._crit_edge11:                                    ; preds = %542
  %pgocount61 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 13)
  %555 = add i64 %pgocount61, 1
  store i64 %555, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 13)
  br label %648

._crit_edge10:                                    ; preds = %542
  %pgocount62 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 12)
  %556 = add i64 %pgocount62, 1
  store i64 %556, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 12)
  br label %648

; <label>:557:                                    ; preds = %542
  %558 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %559 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %558, i32 0, i32 2
  %560 = load i32, i32* %559, align 4
  %561 = icmp eq i32 %560, 1
  br i1 %561, label %562, label %627

; <label>:562:                                    ; preds = %557
  %563 = load %struct.tiff*, %struct.tiff** %3, align 8
  %564 = getelementptr inbounds %struct.tiff, %struct.tiff* %563, i32 0, i32 7
  %565 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %564, i32 0, i32 0
  %566 = load i16, i16* %565, align 8
  %567 = zext i16 %566 to i32
  %568 = icmp eq i32 %567, 19789
  br i1 %568, label %569, label %595

; <label>:569:                                    ; preds = %562
  %pgocount63 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 98)
  %570 = add i64 %pgocount63, 1
  store i64 %570, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 98)
  %571 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %572 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %571, i32 0, i32 3
  %573 = load i32, i32* %572, align 4
  %574 = load %struct.tiff*, %struct.tiff** %3, align 8
  %575 = getelementptr inbounds %struct.tiff, %struct.tiff* %574, i32 0, i32 9
  %576 = load i32*, i32** %575, align 8
  %577 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %578 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %577, i32 0, i32 1
  %579 = load i16, i16* %578, align 2
  %580 = zext i16 %579 to i64
  %581 = getelementptr inbounds i32, i32* %576, i64 %580
  %582 = load i32, i32* %581, align 4
  %583 = lshr i32 %573, %582
  %584 = zext i32 %583 to i64
  %585 = load %struct.tiff*, %struct.tiff** %3, align 8
  %586 = getelementptr inbounds %struct.tiff, %struct.tiff* %585, i32 0, i32 10
  %587 = load i64*, i64** %586, align 8
  %588 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %589 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %588, i32 0, i32 1
  %590 = load i16, i16* %589, align 2
  %591 = zext i16 %590 to i64
  %592 = getelementptr inbounds i64, i64* %587, i64 %591
  %593 = load i64, i64* %592, align 8
  %594 = and i64 %584, %593
  br label %611

; <label>:595:                                    ; preds = %562
  %pgocount64 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 99)
  %596 = add i64 %pgocount64, 1
  store i64 %596, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 99)
  %597 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %598 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %597, i32 0, i32 3
  %599 = load i32, i32* %598, align 4
  %600 = zext i32 %599 to i64
  %601 = load %struct.tiff*, %struct.tiff** %3, align 8
  %602 = getelementptr inbounds %struct.tiff, %struct.tiff* %601, i32 0, i32 10
  %603 = load i64*, i64** %602, align 8
  %604 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %605 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %604, i32 0, i32 1
  %606 = load i16, i16* %605, align 2
  %607 = zext i16 %606 to i64
  %608 = getelementptr inbounds i64, i64* %603, i64 %607
  %609 = load i64, i64* %608, align 8
  %610 = and i64 %600, %609
  br label %611

; <label>:611:                                    ; preds = %595, %569
  %612 = phi i64 [ %594, %569 ], [ %610, %595 ]
  %613 = trunc i64 %612 to i32
  %614 = zext i32 %613 to i64
  store i64 %614, i64* %9, align 8
  %615 = load %struct.tiff*, %struct.tiff** %3, align 8
  %616 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %617 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %616, i32 0, i32 0
  %618 = load i16, i16* %617, align 4
  %619 = zext i16 %618 to i32
  %620 = load i64, i64* %9, align 8
  %621 = trunc i64 %620 to i32
  %622 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %615, i32 %619, i32 %621)
  %623 = icmp ne i32 %622, 0
  br i1 %623, label %626, label %624

; <label>:624:                                    ; preds = %611
  %pgocount65 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 117)
  %625 = add i64 %pgocount65, 1
  store i64 %625, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 117)
  br label %1344

; <label>:626:                                    ; preds = %611
  br label %687

; <label>:627:                                    ; preds = %557
  %628 = load %struct.tiff*, %struct.tiff** %3, align 8
  %629 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %630 = call i32 @TIFFFetchPerSampleShorts(%struct.tiff* %628, %struct.TIFFDirEntry* %629, i32* %8)
  %631 = icmp ne i32 %630, 0
  br i1 %631, label %632, label %642

; <label>:632:                                    ; preds = %627
  %pgocount66 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 87)
  %633 = add i64 %pgocount66, 1
  store i64 %633, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 87)
  %634 = load %struct.tiff*, %struct.tiff** %3, align 8
  %635 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %636 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %635, i32 0, i32 0
  %637 = load i16, i16* %636, align 4
  %638 = zext i16 %637 to i32
  %639 = load i32, i32* %8, align 4
  %640 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %634, i32 %638, i32 %639)
  %641 = icmp ne i32 %640, 0
  br i1 %641, label %644, label %642

; <label>:642:                                    ; preds = %632, %627
  %pgocount67 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 116)
  %643 = add i64 %pgocount67, 1
  store i64 %643, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 116)
  br label %1344

; <label>:644:                                    ; preds = %632
  %pgocount68 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 88)
  %645 = add i64 %pgocount68, 1
  store i64 %645, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 88)
  %646 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %647 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %646, i32 0, i32 0
  store i16 0, i16* %647, align 4
  br label %687

; <label>:648:                                    ; preds = %._crit_edge10, %._crit_edge11, %._crit_edge12, %542
  %pgocount69 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 60)
  %649 = add i64 %pgocount69, 1
  store i64 %649, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 60)
  %650 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %11, align 8
  %651 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %650, i32 0, i32 4
  %652 = load i16, i16* %651, align 4
  %653 = zext i16 %652 to i32
  %654 = and i32 %653, 31
  %655 = zext i32 %654 to i64
  %656 = shl i64 1, %655
  %657 = load %struct.tiff*, %struct.tiff** %3, align 8
  %658 = getelementptr inbounds %struct.tiff, %struct.tiff* %657, i32 0, i32 6
  %659 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %658, i32 0, i32 0
  %660 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %11, align 8
  %661 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %660, i32 0, i32 4
  %662 = load i16, i16* %661, align 4
  %663 = zext i16 %662 to i32
  %664 = sdiv i32 %663, 32
  %665 = sext i32 %664 to i64
  %666 = getelementptr inbounds [3 x i64], [3 x i64]* %659, i64 0, i64 %665
  %667 = load i64, i64* %666, align 8
  %668 = or i64 %667, %656
  store i64 %668, i64* %666, align 8
  br label %687

; <label>:669:                                    ; preds = %._crit_edge13, %._crit_edge14, %._crit_edge15, %._crit_edge16, %._crit_edge17, %._crit_edge18, %._crit_edge19, %542
  %670 = load %struct.tiff*, %struct.tiff** %3, align 8
  %671 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %672 = call i32 @TIFFFetchNormalTag(%struct.tiff* %670, %struct.TIFFDirEntry* %671)
  %673 = icmp ne i32 %672, 0
  br i1 %673, label %676, label %674

; <label>:674:                                    ; preds = %669
  %pgocount70 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 100)
  %675 = add i64 %pgocount70, 1
  store i64 %675, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 100)
  br label %1344

; <label>:676:                                    ; preds = %669
  %pgocount71 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 49)
  %677 = add i64 %pgocount71, 1
  store i64 %677, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 49)
  %678 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %679 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %678, i32 0, i32 0
  store i16 0, i16* %679, align 4
  br label %687

; <label>:680:                                    ; preds = %542
  %pgocount72 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 76)
  %681 = add i64 %pgocount72, 1
  store i64 %681, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 76)
  %682 = load %struct.tiff*, %struct.tiff** %3, align 8
  %683 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %684 = call i32 @TIFFFetchExtraSamples(%struct.tiff* %682, %struct.TIFFDirEntry* %683)
  %685 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %686 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %685, i32 0, i32 0
  store i16 0, i16* %686, align 4
  br label %687

; <label>:687:                                    ; preds = %680, %676, %648, %644, %626, %542
  %pgocount73 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 43)
  %688 = add i64 %pgocount73, 1
  store i64 %688, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 43)
  br label %689

; <label>:689:                                    ; preds = %687, %444, %415, %337
  %690 = load i32, i32* %5, align 4
  %691 = add nsw i32 %690, -1
  store i32 %691, i32* %5, align 4
  %692 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %693 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %692, i32 1
  store %struct.TIFFDirEntry* %693, %struct.TIFFDirEntry** %4, align 8
  br label %317

; <label>:694:                                    ; preds = %317
  %695 = load %struct.tiff*, %struct.tiff** %3, align 8
  %696 = getelementptr inbounds %struct.tiff, %struct.tiff* %695, i32 0, i32 6
  %697 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %696, i32 0, i32 0
  %698 = getelementptr inbounds [3 x i64], [3 x i64]* %697, i64 0, i64 0
  %699 = load i64, i64* %698, align 8
  %700 = and i64 %699, 2
  %701 = icmp ne i64 %700, 0
  br i1 %701, label %705, label %702

; <label>:702:                                    ; preds = %694
  %pgocount74 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 54)
  %703 = add i64 %pgocount74, 1
  store i64 %703, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 54)
  %704 = load %struct.tiff*, %struct.tiff** %3, align 8
  call void @MissingRequired(%struct.tiff* %704, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.7, i32 0, i32 0))
  br label %1344

; <label>:705:                                    ; preds = %694
  %706 = load %struct.tiff*, %struct.tiff** %3, align 8
  %707 = getelementptr inbounds %struct.tiff, %struct.tiff* %706, i32 0, i32 6
  %708 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %707, i32 0, i32 0
  %709 = getelementptr inbounds [3 x i64], [3 x i64]* %708, i64 0, i64 0
  %710 = load i64, i64* %709, align 8
  %711 = and i64 %710, 1048576
  %712 = icmp ne i64 %711, 0
  br i1 %712, label %716, label %713

; <label>:713:                                    ; preds = %705
  %pgocount75 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 63)
  %714 = add i64 %pgocount75, 1
  store i64 %714, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 63)
  %715 = load %struct.tiff*, %struct.tiff** %3, align 8
  call void @MissingRequired(%struct.tiff* %715, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i32 0, i32 0))
  br label %1344

; <label>:716:                                    ; preds = %705
  %717 = load %struct.tiff*, %struct.tiff** %3, align 8
  %718 = getelementptr inbounds %struct.tiff, %struct.tiff* %717, i32 0, i32 6
  %719 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %718, i32 0, i32 0
  %720 = getelementptr inbounds [3 x i64], [3 x i64]* %719, i64 0, i64 0
  %721 = load i64, i64* %720, align 8
  %722 = and i64 %721, 4
  %723 = icmp ne i64 %722, 0
  br i1 %723, label %748, label %724

; <label>:724:                                    ; preds = %716
  %725 = load %struct.tiff*, %struct.tiff** %3, align 8
  %726 = call i32 @TIFFNumberOfStrips(%struct.tiff* %725)
  %727 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %728 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %727, i32 0, i32 43
  store i32 %726, i32* %728, align 4
  %729 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %730 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %729, i32 0, i32 1
  %731 = load i32, i32* %730, align 8
  %732 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %733 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %732, i32 0, i32 4
  store i32 %731, i32* %733, align 4
  %734 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %735 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %734, i32 0, i32 16
  %736 = load i32, i32* %735, align 4
  %737 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %738 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %737, i32 0, i32 5
  store i32 %736, i32* %738, align 8
  %739 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %740 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %739, i32 0, i32 3
  %741 = load i32, i32* %740, align 8
  %742 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %743 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %742, i32 0, i32 6
  store i32 %741, i32* %743, align 4
  %744 = load %struct.tiff*, %struct.tiff** %3, align 8
  %745 = getelementptr inbounds %struct.tiff, %struct.tiff* %744, i32 0, i32 3
  %746 = load i32, i32* %745, align 8
  %747 = and i32 %746, -1025
  store i32 %747, i32* %745, align 8
  br label %758

; <label>:748:                                    ; preds = %716
  %pgocount76 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 68)
  %749 = add i64 %pgocount76, 1
  store i64 %749, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 68)
  %750 = load %struct.tiff*, %struct.tiff** %3, align 8
  %751 = call i32 @TIFFNumberOfTiles(%struct.tiff* %750)
  %752 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %753 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %752, i32 0, i32 43
  store i32 %751, i32* %753, align 4
  %754 = load %struct.tiff*, %struct.tiff** %3, align 8
  %755 = getelementptr inbounds %struct.tiff, %struct.tiff* %754, i32 0, i32 3
  %756 = load i32, i32* %755, align 8
  %757 = or i32 %756, 1024
  store i32 %757, i32* %755, align 8
  br label %758

; <label>:758:                                    ; preds = %748, %724
  %759 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %760 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %759, i32 0, i32 43
  %761 = load i32, i32* %760, align 4
  %762 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %763 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %762, i32 0, i32 42
  store i32 %761, i32* %763, align 8
  %764 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %765 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %764, i32 0, i32 24
  %766 = load i16, i16* %765, align 2
  %767 = zext i16 %766 to i32
  %768 = icmp eq i32 %767, 2
  br i1 %768, label %769, label %779

; <label>:769:                                    ; preds = %758
  %pgocount77 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 69)
  %770 = add i64 %pgocount77, 1
  store i64 %770, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 69)
  %771 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %772 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %771, i32 0, i32 15
  %773 = load i16, i16* %772, align 2
  %774 = zext i16 %773 to i32
  %775 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %776 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %775, i32 0, i32 42
  %777 = load i32, i32* %776, align 8
  %778 = udiv i32 %777, %774
  store i32 %778, i32* %776, align 8
  br label %779

; <label>:779:                                    ; preds = %769, %758
  %780 = load %struct.tiff*, %struct.tiff** %3, align 8
  %781 = getelementptr inbounds %struct.tiff, %struct.tiff* %780, i32 0, i32 6
  %782 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %781, i32 0, i32 0
  %783 = getelementptr inbounds [3 x i64], [3 x i64]* %782, i64 0, i64 0
  %784 = load i64, i64* %783, align 8
  %785 = and i64 %784, 33554432
  %786 = icmp ne i64 %785, 0
  br i1 %786, label %798, label %787

; <label>:787:                                    ; preds = %779
  %pgocount78 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 70)
  %788 = add i64 %pgocount78, 1
  store i64 %788, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 70)
  %789 = load %struct.tiff*, %struct.tiff** %3, align 8
  %790 = load %struct.tiff*, %struct.tiff** %3, align 8
  %791 = getelementptr inbounds %struct.tiff, %struct.tiff* %790, i32 0, i32 3
  %792 = load i32, i32* %791, align 8
  %793 = and i32 %792, 1024
  %794 = icmp ne i32 %793, 0
  %795 = zext i1 %794 to i64
  %pgocount79 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 118)
  %796 = add i64 %pgocount79, %795
  store i64 %796, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 118)
  %797 = select i1 %794, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i32 0, i32 0)
  call void @MissingRequired(%struct.tiff* %789, i8* %797)
  br label %1344

; <label>:798:                                    ; preds = %779
  %799 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  store %struct.TIFFDirEntry* %799, %struct.TIFFDirEntry** %4, align 8
  %800 = load i16, i16* %13, align 2
  %801 = zext i16 %800 to i32
  store i32 %801, i32* %5, align 4
  br label %802

; <label>:802:                                    ; preds = %1135, %798
  %803 = load i32, i32* %5, align 4
  %804 = icmp sgt i32 %803, 0
  br i1 %804, label %805, label %1140

; <label>:805:                                    ; preds = %802
  %806 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %807 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %806, i32 0, i32 0
  %808 = load i16, i16* %807, align 4
  %809 = zext i16 %808 to i32
  %810 = icmp eq i32 %809, 0
  br i1 %810, label %811, label %813

; <label>:811:                                    ; preds = %805
  %pgocount80 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 45)
  %812 = add i64 %pgocount80, 1
  store i64 %812, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 45)
  br label %1135

; <label>:813:                                    ; preds = %805
  %814 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %815 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %814, i32 0, i32 0
  %816 = load i16, i16* %815, align 4
  %817 = zext i16 %816 to i32
  switch i32 %817, label %1129 [
    i32 280, label %._crit_edge
    i32 281, label %._crit_edge1
    i32 258, label %828
    i32 32996, label %._crit_edge2
    i32 339, label %900
    i32 340, label %._crit_edge3
    i32 341, label %919
    i32 273, label %._crit_edge4
    i32 324, label %938
    i32 279, label %._crit_edge5
    i32 325, label %953
    i32 320, label %._crit_edge6
    i32 301, label %968
    i32 297, label %._crit_edge7
    i32 321, label %._crit_edge8
    i32 530, label %._crit_edge9
    i32 336, label %1053
    i32 532, label %1058
    i32 255, label %1063
  ]

._crit_edge9:                                     ; preds = %813
  %pgocount81 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 11)
  %818 = add i64 %pgocount81, 1
  store i64 %818, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 11)
  br label %1053

._crit_edge8:                                     ; preds = %813
  %pgocount82 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 10)
  %819 = add i64 %pgocount82, 1
  store i64 %819, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 10)
  br label %1053

._crit_edge7:                                     ; preds = %813
  %pgocount83 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 9)
  %820 = add i64 %pgocount83, 1
  store i64 %820, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 9)
  br label %1053

._crit_edge6:                                     ; preds = %813
  %pgocount84 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 8)
  %821 = add i64 %pgocount84, 1
  store i64 %821, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 8)
  br label %968

._crit_edge5:                                     ; preds = %813
  %pgocount85 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 7)
  %822 = add i64 %pgocount85, 1
  store i64 %822, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 7)
  br label %953

._crit_edge4:                                     ; preds = %813
  %pgocount86 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 6)
  %823 = add i64 %pgocount86, 1
  store i64 %823, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 6)
  br label %938

._crit_edge3:                                     ; preds = %813
  %pgocount87 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 5)
  %824 = add i64 %pgocount87, 1
  store i64 %824, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 5)
  br label %919

._crit_edge2:                                     ; preds = %813
  %pgocount88 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 4)
  %825 = add i64 %pgocount88, 1
  store i64 %825, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 4)
  br label %900

._crit_edge1:                                     ; preds = %813
  %pgocount89 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 3)
  %826 = add i64 %pgocount89, 1
  store i64 %826, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 3)
  br label %828

._crit_edge:                                      ; preds = %813
  %pgocount90 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 2)
  %827 = add i64 %pgocount90, 1
  store i64 %827, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 2)
  br label %828

; <label>:828:                                    ; preds = %._crit_edge, %._crit_edge1, %813
  %829 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %830 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %829, i32 0, i32 2
  %831 = load i32, i32* %830, align 4
  %832 = icmp eq i32 %831, 1
  br i1 %832, label %833, label %898

; <label>:833:                                    ; preds = %828
  %834 = load %struct.tiff*, %struct.tiff** %3, align 8
  %835 = getelementptr inbounds %struct.tiff, %struct.tiff* %834, i32 0, i32 7
  %836 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %835, i32 0, i32 0
  %837 = load i16, i16* %836, align 8
  %838 = zext i16 %837 to i32
  %839 = icmp eq i32 %838, 19789
  br i1 %839, label %840, label %866

; <label>:840:                                    ; preds = %833
  %pgocount91 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 79)
  %841 = add i64 %pgocount91, 1
  store i64 %841, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 79)
  %842 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %843 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %842, i32 0, i32 3
  %844 = load i32, i32* %843, align 4
  %845 = load %struct.tiff*, %struct.tiff** %3, align 8
  %846 = getelementptr inbounds %struct.tiff, %struct.tiff* %845, i32 0, i32 9
  %847 = load i32*, i32** %846, align 8
  %848 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %849 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %848, i32 0, i32 1
  %850 = load i16, i16* %849, align 2
  %851 = zext i16 %850 to i64
  %852 = getelementptr inbounds i32, i32* %847, i64 %851
  %853 = load i32, i32* %852, align 4
  %854 = lshr i32 %844, %853
  %855 = zext i32 %854 to i64
  %856 = load %struct.tiff*, %struct.tiff** %3, align 8
  %857 = getelementptr inbounds %struct.tiff, %struct.tiff* %856, i32 0, i32 10
  %858 = load i64*, i64** %857, align 8
  %859 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %860 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %859, i32 0, i32 1
  %861 = load i16, i16* %860, align 2
  %862 = zext i16 %861 to i64
  %863 = getelementptr inbounds i64, i64* %858, i64 %862
  %864 = load i64, i64* %863, align 8
  %865 = and i64 %855, %864
  br label %882

; <label>:866:                                    ; preds = %833
  %pgocount92 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 80)
  %867 = add i64 %pgocount92, 1
  store i64 %867, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 80)
  %868 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %869 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %868, i32 0, i32 3
  %870 = load i32, i32* %869, align 4
  %871 = zext i32 %870 to i64
  %872 = load %struct.tiff*, %struct.tiff** %3, align 8
  %873 = getelementptr inbounds %struct.tiff, %struct.tiff* %872, i32 0, i32 10
  %874 = load i64*, i64** %873, align 8
  %875 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %876 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %875, i32 0, i32 1
  %877 = load i16, i16* %876, align 2
  %878 = zext i16 %877 to i64
  %879 = getelementptr inbounds i64, i64* %874, i64 %878
  %880 = load i64, i64* %879, align 8
  %881 = and i64 %871, %880
  br label %882

; <label>:882:                                    ; preds = %866, %840
  %883 = phi i64 [ %865, %840 ], [ %881, %866 ]
  %884 = trunc i64 %883 to i32
  %885 = zext i32 %884 to i64
  store i64 %885, i64* %9, align 8
  %886 = load %struct.tiff*, %struct.tiff** %3, align 8
  %887 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %888 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %887, i32 0, i32 0
  %889 = load i16, i16* %888, align 4
  %890 = zext i16 %889 to i32
  %891 = load i64, i64* %9, align 8
  %892 = trunc i64 %891 to i32
  %893 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %886, i32 %890, i32 %892)
  %894 = icmp ne i32 %893, 0
  br i1 %894, label %897, label %895

; <label>:895:                                    ; preds = %882
  %pgocount93 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 115)
  %896 = add i64 %pgocount93, 1
  store i64 %896, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 115)
  br label %1344

; <label>:897:                                    ; preds = %882
  br label %1134

; <label>:898:                                    ; preds = %828
  %pgocount94 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 71)
  %899 = add i64 %pgocount94, 1
  store i64 %899, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 71)
  br label %900

; <label>:900:                                    ; preds = %898, %._crit_edge2, %813
  %901 = load %struct.tiff*, %struct.tiff** %3, align 8
  %902 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %903 = call i32 @TIFFFetchPerSampleShorts(%struct.tiff* %901, %struct.TIFFDirEntry* %902, i32* %8)
  %904 = icmp ne i32 %903, 0
  br i1 %904, label %905, label %915

; <label>:905:                                    ; preds = %900
  %pgocount95 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 61)
  %906 = add i64 %pgocount95, 1
  store i64 %906, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 61)
  %907 = load %struct.tiff*, %struct.tiff** %3, align 8
  %908 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %909 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %908, i32 0, i32 0
  %910 = load i16, i16* %909, align 4
  %911 = zext i16 %910 to i32
  %912 = load i32, i32* %8, align 4
  %913 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %907, i32 %911, i32 %912)
  %914 = icmp ne i32 %913, 0
  br i1 %914, label %917, label %915

; <label>:915:                                    ; preds = %905, %900
  %pgocount96 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 102)
  %916 = add i64 %pgocount96, 1
  store i64 %916, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 102)
  br label %1344

; <label>:917:                                    ; preds = %905
  %pgocount97 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 62)
  %918 = add i64 %pgocount97, 1
  store i64 %918, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 62)
  br label %1134

; <label>:919:                                    ; preds = %._crit_edge3, %813
  %920 = load %struct.tiff*, %struct.tiff** %3, align 8
  %921 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %922 = call i32 @TIFFFetchPerSampleAnys(%struct.tiff* %920, %struct.TIFFDirEntry* %921, double* %10)
  %923 = icmp ne i32 %922, 0
  br i1 %923, label %924, label %934

; <label>:924:                                    ; preds = %919
  %pgocount98 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 64)
  %925 = add i64 %pgocount98, 1
  store i64 %925, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 64)
  %926 = load %struct.tiff*, %struct.tiff** %3, align 8
  %927 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %928 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %927, i32 0, i32 0
  %929 = load i16, i16* %928, align 4
  %930 = zext i16 %929 to i32
  %931 = load double, double* %10, align 8
  %932 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %926, i32 %930, double %931)
  %933 = icmp ne i32 %932, 0
  br i1 %933, label %936, label %934

; <label>:934:                                    ; preds = %924, %919
  %pgocount99 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 108)
  %935 = add i64 %pgocount99, 1
  store i64 %935, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 108)
  br label %1344

; <label>:936:                                    ; preds = %924
  %pgocount100 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 67)
  %937 = add i64 %pgocount100, 1
  store i64 %937, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 67)
  br label %1134

; <label>:938:                                    ; preds = %._crit_edge4, %813
  %939 = load %struct.tiff*, %struct.tiff** %3, align 8
  %940 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %941 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %942 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %941, i32 0, i32 43
  %943 = load i32, i32* %942, align 4
  %944 = zext i32 %943 to i64
  %945 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %946 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %945, i32 0, i32 44
  %947 = call i32 @TIFFFetchStripThing(%struct.tiff* %939, %struct.TIFFDirEntry* %940, i64 %944, i32** %946)
  %948 = icmp ne i32 %947, 0
  br i1 %948, label %951, label %949

; <label>:949:                                    ; preds = %938
  %pgocount101 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 112)
  %950 = add i64 %pgocount101, 1
  store i64 %950, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 112)
  br label %1344

; <label>:951:                                    ; preds = %938
  %pgocount102 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 65)
  %952 = add i64 %pgocount102, 1
  store i64 %952, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 65)
  br label %1134

; <label>:953:                                    ; preds = %._crit_edge5, %813
  %954 = load %struct.tiff*, %struct.tiff** %3, align 8
  %955 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %956 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %957 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %956, i32 0, i32 43
  %958 = load i32, i32* %957, align 4
  %959 = zext i32 %958 to i64
  %960 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %961 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %960, i32 0, i32 45
  %962 = call i32 @TIFFFetchStripThing(%struct.tiff* %954, %struct.TIFFDirEntry* %955, i64 %959, i32** %961)
  %963 = icmp ne i32 %962, 0
  br i1 %963, label %966, label %964

; <label>:964:                                    ; preds = %953
  %pgocount103 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 113)
  %965 = add i64 %pgocount103, 1
  store i64 %965, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 113)
  br label %1344

; <label>:966:                                    ; preds = %953
  %pgocount104 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 66)
  %967 = add i64 %pgocount104, 1
  store i64 %967, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 66)
  br label %1134

; <label>:968:                                    ; preds = %._crit_edge6, %813
  %969 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %970 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %969, i32 0, i32 8
  %971 = load i16, i16* %970, align 4
  %972 = zext i16 %971 to i32
  %973 = zext i32 %972 to i64
  %974 = shl i64 1, %973
  store i64 %974, i64* %9, align 8
  %975 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %976 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %975, i32 0, i32 0
  %977 = load i16, i16* %976, align 4
  %978 = zext i16 %977 to i32
  %979 = icmp eq i32 %978, 320
  br i1 %979, label %988, label %980

; <label>:980:                                    ; preds = %968
  %pgocount105 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 73)
  %981 = add i64 %pgocount105, 1
  store i64 %981, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 73)
  %982 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %983 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %982, i32 0, i32 2
  %984 = load i32, i32* %983, align 4
  %985 = load i64, i64* %9, align 8
  %986 = trunc i64 %985 to i32
  %987 = icmp ne i32 %984, %986
  br i1 %987, label %988, label %1000

; <label>:988:                                    ; preds = %980, %968
  %989 = load %struct.tiff*, %struct.tiff** %3, align 8
  %990 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %991 = load i64, i64* %9, align 8
  %992 = mul nsw i64 3, %991
  %993 = trunc i64 %992 to i32
  %994 = call i32 @CheckDirCount(%struct.tiff* %989, %struct.TIFFDirEntry* %990, i32 %993)
  %995 = icmp ne i32 %994, 0
  br i1 %995, label %998, label %996

; <label>:996:                                    ; preds = %988
  %pgocount106 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 82)
  %997 = add i64 %pgocount106, 1
  store i64 %997, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 82)
  br label %1134

; <label>:998:                                    ; preds = %988
  %pgocount107 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 77)
  %999 = add i64 %pgocount107, 1
  store i64 %999, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 77)
  br label %1000

; <label>:1000:                                   ; preds = %998, %980
  %1001 = load i64, i64* %9, align 8
  %1002 = mul i64 %1001, 2
  store i64 %1002, i64* %9, align 8
  %1003 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1004 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %1005 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1004, i32 0, i32 2
  %1006 = load i32, i32* %1005, align 4
  %1007 = zext i32 %1006 to i64
  %1008 = mul i64 %1007, 2
  %1009 = trunc i64 %1008 to i32
  %1010 = call i8* @CheckMalloc(%struct.tiff* %1003, i32 %1009, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.11, i32 0, i32 0))
  store i8* %1010, i8** %15, align 8
  %1011 = load i8*, i8** %15, align 8
  %1012 = icmp ne i8* %1011, null
  br i1 %1012, label %1013, label %1051

; <label>:1013:                                   ; preds = %1000
  %1014 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1015 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %1016 = load i8*, i8** %15, align 8
  %1017 = call i32 @TIFFFetchData(%struct.tiff* %1014, %struct.TIFFDirEntry* %1015, i8* %1016)
  %1018 = icmp ne i32 %1017, 0
  br i1 %1018, label %1019, label %1048

; <label>:1019:                                   ; preds = %1013
  %pgocount108 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 83)
  %1020 = add i64 %pgocount108, 1
  store i64 %1020, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 83)
  %1021 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %1022 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1021, i32 0, i32 8
  %1023 = load i16, i16* %1022, align 4
  %1024 = zext i16 %1023 to i32
  %1025 = shl i32 1, %1024
  store i32 %1025, i32* %19, align 4
  %1026 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %1027 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1026, i32 0, i32 2
  %1028 = load i32, i32* %1027, align 4
  %1029 = load i32, i32* %19, align 4
  %1030 = icmp eq i32 %1028, %1029
  br i1 %1030, label %1031, label %1033

; <label>:1031:                                   ; preds = %1019
  %pgocount109 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 96)
  %1032 = add i64 %pgocount109, 1
  store i64 %1032, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 96)
  store i64 0, i64* %9, align 8
  br label %1033

; <label>:1033:                                   ; preds = %1031, %1019
  %1034 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1035 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %1036 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1035, i32 0, i32 0
  %1037 = load i16, i16* %1036, align 4
  %1038 = zext i16 %1037 to i32
  %1039 = load i8*, i8** %15, align 8
  %1040 = load i8*, i8** %15, align 8
  %1041 = load i64, i64* %9, align 8
  %1042 = getelementptr inbounds i8, i8* %1040, i64 %1041
  %1043 = load i8*, i8** %15, align 8
  %1044 = load i64, i64* %9, align 8
  %1045 = mul nsw i64 2, %1044
  %1046 = getelementptr inbounds i8, i8* %1043, i64 %1045
  %1047 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1034, i32 %1038, i8* %1039, i8* %1042, i8* %1046)
  br label %1048

; <label>:1048:                                   ; preds = %1033, %1013
  %pgocount110 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 78)
  %1049 = add i64 %pgocount110, 1
  store i64 %1049, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 78)
  %1050 = load i8*, i8** %15, align 8
  call void @_TIFFfree(i8* %1050)
  br label %1051

; <label>:1051:                                   ; preds = %1048, %1000
  %pgocount111 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 72)
  %1052 = add i64 %pgocount111, 1
  store i64 %1052, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 72)
  br label %1134

; <label>:1053:                                   ; preds = %._crit_edge7, %._crit_edge8, %._crit_edge9, %813
  %pgocount112 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 59)
  %1054 = add i64 %pgocount112, 1
  store i64 %1054, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 59)
  %1055 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1056 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %1057 = call i32 @TIFFFetchShortPair(%struct.tiff* %1055, %struct.TIFFDirEntry* %1056)
  br label %1134

; <label>:1058:                                   ; preds = %813
  %pgocount113 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 74)
  %1059 = add i64 %pgocount113, 1
  store i64 %1059, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 74)
  %1060 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1061 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %1062 = call i32 @TIFFFetchRefBlackWhite(%struct.tiff* %1060, %struct.TIFFDirEntry* %1061)
  br label %1134

; <label>:1063:                                   ; preds = %813
  store i64 0, i64* %9, align 8
  %1064 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1065 = getelementptr inbounds %struct.tiff, %struct.tiff* %1064, i32 0, i32 7
  %1066 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %1065, i32 0, i32 0
  %1067 = load i16, i16* %1066, align 8
  %1068 = zext i16 %1067 to i32
  %1069 = icmp eq i32 %1068, 19789
  br i1 %1069, label %1070, label %1096

; <label>:1070:                                   ; preds = %1063
  %pgocount114 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 85)
  %1071 = add i64 %pgocount114, 1
  store i64 %1071, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 85)
  %1072 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %1073 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1072, i32 0, i32 3
  %1074 = load i32, i32* %1073, align 4
  %1075 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1076 = getelementptr inbounds %struct.tiff, %struct.tiff* %1075, i32 0, i32 9
  %1077 = load i32*, i32** %1076, align 8
  %1078 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %1079 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1078, i32 0, i32 1
  %1080 = load i16, i16* %1079, align 2
  %1081 = zext i16 %1080 to i64
  %1082 = getelementptr inbounds i32, i32* %1077, i64 %1081
  %1083 = load i32, i32* %1082, align 4
  %1084 = lshr i32 %1074, %1083
  %1085 = zext i32 %1084 to i64
  %1086 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1087 = getelementptr inbounds %struct.tiff, %struct.tiff* %1086, i32 0, i32 10
  %1088 = load i64*, i64** %1087, align 8
  %1089 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %1090 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1089, i32 0, i32 1
  %1091 = load i16, i16* %1090, align 2
  %1092 = zext i16 %1091 to i64
  %1093 = getelementptr inbounds i64, i64* %1088, i64 %1092
  %1094 = load i64, i64* %1093, align 8
  %1095 = and i64 %1085, %1094
  br label %1112

; <label>:1096:                                   ; preds = %1063
  %pgocount115 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 86)
  %1097 = add i64 %pgocount115, 1
  store i64 %1097, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 86)
  %1098 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %1099 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1098, i32 0, i32 3
  %1100 = load i32, i32* %1099, align 4
  %1101 = zext i32 %1100 to i64
  %1102 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1103 = getelementptr inbounds %struct.tiff, %struct.tiff* %1102, i32 0, i32 10
  %1104 = load i64*, i64** %1103, align 8
  %1105 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %1106 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1105, i32 0, i32 1
  %1107 = load i16, i16* %1106, align 2
  %1108 = zext i16 %1107 to i64
  %1109 = getelementptr inbounds i64, i64* %1104, i64 %1108
  %1110 = load i64, i64* %1109, align 8
  %1111 = and i64 %1101, %1110
  br label %1112

; <label>:1112:                                   ; preds = %1096, %1070
  %1113 = phi i64 [ %1095, %1070 ], [ %1111, %1096 ]
  %1114 = trunc i64 %1113 to i32
  switch i32 %1114, label %1119 [
    i32 2, label %1115
    i32 3, label %1117
  ]

; <label>:1115:                                   ; preds = %1112
  %pgocount116 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 91)
  %1116 = add i64 %pgocount116, 1
  store i64 %1116, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 91)
  store i64 1, i64* %9, align 8
  br label %1119

; <label>:1117:                                   ; preds = %1112
  %pgocount117 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 92)
  %1118 = add i64 %pgocount117, 1
  store i64 %1118, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 92)
  store i64 2, i64* %9, align 8
  br label %1119

; <label>:1119:                                   ; preds = %1117, %1115, %1112
  %1120 = load i64, i64* %9, align 8
  %1121 = icmp ne i64 %1120, 0
  br i1 %1121, label %1122, label %1128

; <label>:1122:                                   ; preds = %1119
  %pgocount118 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 81)
  %1123 = add i64 %pgocount118, 1
  store i64 %1123, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 81)
  %1124 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1125 = load i64, i64* %9, align 8
  %1126 = trunc i64 %1125 to i32
  %1127 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1124, i32 254, i32 %1126)
  br label %1128

; <label>:1128:                                   ; preds = %1122, %1119
  br label %1134

; <label>:1129:                                   ; preds = %813
  %pgocount119 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 75)
  %1130 = add i64 %pgocount119, 1
  store i64 %1130, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 75)
  %1131 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1132 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %1133 = call i32 @TIFFFetchNormalTag(%struct.tiff* %1131, %struct.TIFFDirEntry* %1132)
  br label %1134

; <label>:1134:                                   ; preds = %1129, %1128, %1058, %1053, %1051, %996, %966, %951, %936, %917, %897
  br label %1135

; <label>:1135:                                   ; preds = %1134, %811
  %1136 = load i32, i32* %5, align 4
  %1137 = add nsw i32 %1136, -1
  store i32 %1137, i32* %5, align 4
  %1138 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %1139 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1138, i32 1
  store %struct.TIFFDirEntry* %1139, %struct.TIFFDirEntry** %4, align 8
  br label %802

; <label>:1140:                                   ; preds = %802
  %1141 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %1142 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1141, i32 0, i32 11
  %1143 = load i16, i16* %1142, align 2
  %1144 = zext i16 %1143 to i32
  %1145 = icmp eq i32 %1144, 3
  br i1 %1145, label %1146, label %1158

; <label>:1146:                                   ; preds = %1140
  %pgocount120 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 84)
  %1147 = add i64 %pgocount120, 1
  store i64 %1147, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 84)
  %1148 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1149 = getelementptr inbounds %struct.tiff, %struct.tiff* %1148, i32 0, i32 6
  %1150 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1149, i32 0, i32 0
  %1151 = getelementptr inbounds [3 x i64], [3 x i64]* %1150, i64 0, i64 0
  %1152 = load i64, i64* %1151, align 8
  %1153 = and i64 %1152, 67108864
  %1154 = icmp ne i64 %1153, 0
  br i1 %1154, label %1158, label %1155

; <label>:1155:                                   ; preds = %1146
  %pgocount121 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 97)
  %1156 = add i64 %pgocount121, 1
  store i64 %1156, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 97)
  %1157 = load %struct.tiff*, %struct.tiff** %3, align 8
  call void @MissingRequired(%struct.tiff* %1157, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.12, i32 0, i32 0))
  br label %1344

; <label>:1158:                                   ; preds = %1146, %1140
  %1159 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1160 = getelementptr inbounds %struct.tiff, %struct.tiff* %1159, i32 0, i32 6
  %1161 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1160, i32 0, i32 0
  %1162 = getelementptr inbounds [3 x i64], [3 x i64]* %1161, i64 0, i64 0
  %1163 = load i64, i64* %1162, align 8
  %1164 = and i64 %1163, 16777216
  %1165 = icmp ne i64 %1164, 0
  br i1 %1165, label %1210, label %1166

; <label>:1166:                                   ; preds = %1158
  %1167 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %1168 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1167, i32 0, i32 24
  %1169 = load i16, i16* %1168, align 2
  %1170 = zext i16 %1169 to i32
  %1171 = icmp eq i32 %1170, 1
  br i1 %1171, label %1172, label %1178

; <label>:1172:                                   ; preds = %1166
  %pgocount122 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 103)
  %1173 = add i64 %pgocount122, 1
  store i64 %1173, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 103)
  %1174 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %1175 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1174, i32 0, i32 43
  %1176 = load i32, i32* %1175, align 4
  %1177 = icmp ugt i32 %1176, 1
  br i1 %1177, label %1195, label %1178

; <label>:1178:                                   ; preds = %1172, %1166
  %1179 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %1180 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1179, i32 0, i32 24
  %1181 = load i16, i16* %1180, align 2
  %1182 = zext i16 %1181 to i32
  %1183 = icmp eq i32 %1182, 2
  br i1 %1183, label %1184, label %1198

; <label>:1184:                                   ; preds = %1178
  %pgocount123 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 107)
  %1185 = add i64 %pgocount123, 1
  store i64 %1185, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 107)
  %1186 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %1187 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1186, i32 0, i32 43
  %1188 = load i32, i32* %1187, align 4
  %1189 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %1190 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1189, i32 0, i32 15
  %1191 = load i16, i16* %1190, align 2
  %1192 = zext i16 %1191 to i32
  %1193 = icmp ne i32 %1188, %1192
  br i1 %1193, label %1195, label %._crit_edge20

._crit_edge20:                                    ; preds = %1184
  %pgocount124 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 33)
  %1194 = add i64 %pgocount124, 1
  store i64 %1194, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 33)
  br label %1198

; <label>:1195:                                   ; preds = %1184, %1172
  %pgocount125 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 105)
  %1196 = add i64 %pgocount125, 1
  store i64 %1196, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 105)
  %1197 = load %struct.tiff*, %struct.tiff** %3, align 8
  call void @MissingRequired(%struct.tiff* %1197, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.13, i32 0, i32 0))
  br label %1344

; <label>:1198:                                   ; preds = %._crit_edge20, %1178
  %pgocount126 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 101)
  %1199 = add i64 %pgocount126, 1
  store i64 %1199, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 101)
  %1200 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1201 = getelementptr inbounds %struct.tiff, %struct.tiff* %1200, i32 0, i32 0
  %1202 = load i8*, i8** %1201, align 8
  %1203 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1204 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %1203, i32 279)
  %1205 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %1204, i32 0, i32 7
  %1206 = load i8*, i8** %1205, align 8
  call void (i8*, i8*, ...) @TIFFWarning(i8* %1202, i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.14, i32 0, i32 0), i8* %1206)
  %1207 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1208 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %1209 = load i16, i16* %13, align 2
  call void @EstimateStripByteCounts(%struct.tiff* %1207, %struct.TIFFDirEntry* %1208, i16 zeroext %1209)
  br label %1266

; <label>:1210:                                   ; preds = %1158
  %1211 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %1212 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1211, i32 0, i32 43
  %1213 = load i32, i32* %1212, align 4
  %1214 = icmp eq i32 %1213, 1
  br i1 %1214, label %1215, label %1264

; <label>:1215:                                   ; preds = %1210
  %pgocount127 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 104)
  %1216 = add i64 %pgocount127, 1
  store i64 %1216, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 104)
  %1217 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %1218 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1217, i32 0, i32 45
  %1219 = load i32*, i32** %1218, align 8
  %1220 = getelementptr inbounds i32, i32* %1219, i64 0
  %1221 = load i32, i32* %1220, align 4
  %1222 = icmp eq i32 %1221, 0
  br i1 %1222, label %1252, label %1223

; <label>:1223:                                   ; preds = %1215
  %pgocount128 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 109)
  %1224 = add i64 %pgocount128, 1
  store i64 %1224, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 109)
  %1225 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %1226 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1225, i32 0, i32 10
  %1227 = load i16, i16* %1226, align 8
  %1228 = zext i16 %1227 to i32
  %1229 = icmp eq i32 %1228, 1
  br i1 %1229, label %1230, label %1264

; <label>:1230:                                   ; preds = %1223
  %pgocount129 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 114)
  %1231 = add i64 %pgocount129, 1
  store i64 %1231, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 114)
  %1232 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %1233 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1232, i32 0, i32 45
  %1234 = load i32*, i32** %1233, align 8
  %1235 = getelementptr inbounds i32, i32* %1234, i64 0
  %1236 = load i32, i32* %1235, align 4
  %1237 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1238 = getelementptr inbounds %struct.tiff, %struct.tiff* %1237, i32 0, i32 53
  %1239 = load i32 (i8*)*, i32 (i8*)** %1238, align 8
  %1240 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1241 = getelementptr inbounds %struct.tiff, %struct.tiff* %1240, i32 0, i32 48
  %1242 = load i8*, i8** %1241, align 8
  %1243 = ptrtoint i32 (i8*)* %1239 to i64
  call void @__llvm_profile_instrument_target(i64 %1243, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReadDirectory to i8*), i32 5)
  %1244 = call i32 %1239(i8* %1242)
  %1245 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %1246 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1245, i32 0, i32 44
  %1247 = load i32*, i32** %1246, align 8
  %1248 = getelementptr inbounds i32, i32* %1247, i64 0
  %1249 = load i32, i32* %1248, align 4
  %1250 = sub i32 %1244, %1249
  %1251 = icmp ugt i32 %1236, %1250
  br i1 %1251, label %1252, label %1264

; <label>:1252:                                   ; preds = %1230, %1215
  %pgocount130 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 110)
  %1253 = add i64 %pgocount130, 1
  store i64 %1253, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 110)
  %1254 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1255 = getelementptr inbounds %struct.tiff, %struct.tiff* %1254, i32 0, i32 0
  %1256 = load i8*, i8** %1255, align 8
  %1257 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1258 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %1257, i32 279)
  %1259 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %1258, i32 0, i32 7
  %1260 = load i8*, i8** %1259, align 8
  call void (i8*, i8*, ...) @TIFFWarning(i8* %1256, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.15, i32 0, i32 0), i8* %1260)
  %1261 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1262 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %1263 = load i16, i16* %13, align 2
  call void @EstimateStripByteCounts(%struct.tiff* %1261, %struct.TIFFDirEntry* %1262, i16 zeroext %1263)
  br label %1264

; <label>:1264:                                   ; preds = %1252, %1230, %1223, %1210
  %pgocount131 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 89)
  %1265 = add i64 %pgocount131, 1
  store i64 %1265, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 89)
  br label %1266

; <label>:1266:                                   ; preds = %1264, %1198
  %1267 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %1268 = icmp ne %struct.TIFFDirEntry* %1267, null
  br i1 %1268, label %1269, label %1273

; <label>:1269:                                   ; preds = %1266
  %pgocount132 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 90)
  %1270 = add i64 %pgocount132, 1
  store i64 %1270, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 90)
  %1271 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %1272 = bitcast %struct.TIFFDirEntry* %1271 to i8*
  call void @_TIFFfree(i8* %1272)
  br label %1273

; <label>:1273:                                   ; preds = %1269, %1266
  %1274 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1275 = getelementptr inbounds %struct.tiff, %struct.tiff* %1274, i32 0, i32 6
  %1276 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1275, i32 0, i32 0
  %1277 = getelementptr inbounds [3 x i64], [3 x i64]* %1276, i64 0, i64 0
  %1278 = load i64, i64* %1277, align 8
  %1279 = and i64 %1278, 524288
  %1280 = icmp ne i64 %1279, 0
  br i1 %1280, label %1293, label %1281

; <label>:1281:                                   ; preds = %1273
  %pgocount133 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 93)
  %1282 = add i64 %pgocount133, 1
  store i64 %1282, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 93)
  %1283 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %1284 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1283, i32 0, i32 8
  %1285 = load i16, i16* %1284, align 4
  %1286 = zext i16 %1285 to i32
  %1287 = zext i32 %1286 to i64
  %1288 = shl i64 1, %1287
  %1289 = sub nsw i64 %1288, 1
  %1290 = trunc i64 %1289 to i16
  %1291 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %1292 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1291, i32 0, i32 18
  store i16 %1290, i16* %1292, align 2
  br label %1293

; <label>:1293:                                   ; preds = %1281, %1273
  %1294 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1295 = getelementptr inbounds %struct.tiff, %struct.tiff* %1294, i32 0, i32 6
  %1296 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1295, i32 0, i32 0
  %1297 = getelementptr inbounds [3 x i64], [3 x i64]* %1296, i64 0, i64 0
  %1298 = load i64, i64* %1297, align 8
  %1299 = and i64 %1298, 128
  %1300 = icmp ne i64 %1299, 0
  br i1 %1300, label %1305, label %1301

; <label>:1301:                                   ; preds = %1293
  %pgocount134 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 94)
  %1302 = add i64 %pgocount134, 1
  store i64 %1302, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 94)
  %1303 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1304 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1303, i32 259, i32 1)
  br label %1305

; <label>:1305:                                   ; preds = %1301, %1293
  %1306 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %1307 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1306, i32 0, i32 43
  %1308 = load i32, i32* %1307, align 4
  %1309 = icmp eq i32 %1308, 1
  br i1 %1309, label %1310, label %1327

; <label>:1310:                                   ; preds = %1305
  %pgocount135 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 95)
  %1311 = add i64 %pgocount135, 1
  store i64 %1311, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 95)
  %1312 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %1313 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1312, i32 0, i32 10
  %1314 = load i16, i16* %1313, align 8
  %1315 = zext i16 %1314 to i32
  %1316 = icmp eq i32 %1315, 1
  br i1 %1316, label %1317, label %1327

; <label>:1317:                                   ; preds = %1310
  %pgocount136 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 106)
  %1318 = add i64 %pgocount136, 1
  store i64 %1318, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 106)
  %1319 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1320 = getelementptr inbounds %struct.tiff, %struct.tiff* %1319, i32 0, i32 3
  %1321 = load i32, i32* %1320, align 8
  %1322 = and i32 %1321, 33792
  %1323 = icmp eq i32 %1322, 32768
  br i1 %1323, label %1324, label %1327

; <label>:1324:                                   ; preds = %1317
  %pgocount137 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 111)
  %1325 = add i64 %pgocount137, 1
  store i64 %1325, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 111)
  %1326 = load %struct.tiff*, %struct.tiff** %3, align 8
  call void @ChopUpSingleUncompressedStrip(%struct.tiff* %1326)
  br label %1327

; <label>:1327:                                   ; preds = %1324, %1317, %1310, %1305
  %1328 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1329 = getelementptr inbounds %struct.tiff, %struct.tiff* %1328, i32 0, i32 11
  store i32 -1, i32* %1329, align 8
  %1330 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1331 = getelementptr inbounds %struct.tiff, %struct.tiff* %1330, i32 0, i32 13
  store i32 -1, i32* %1331, align 8
  %1332 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1333 = getelementptr inbounds %struct.tiff, %struct.tiff* %1332, i32 0, i32 18
  store i32 -1, i32* %1333, align 4
  %1334 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1335 = getelementptr inbounds %struct.tiff, %struct.tiff* %1334, i32 0, i32 19
  store i32 -1, i32* %1335, align 8
  %1336 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1337 = call i32 @TIFFTileSize(%struct.tiff* %1336)
  %1338 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1339 = getelementptr inbounds %struct.tiff, %struct.tiff* %1338, i32 0, i32 20
  store i32 %1337, i32* %1339, align 4
  %1340 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1341 = call i32 @TIFFScanlineSize(%struct.tiff* %1340)
  %1342 = load %struct.tiff*, %struct.tiff** %3, align 8
  %1343 = getelementptr inbounds %struct.tiff, %struct.tiff* %1342, i32 0, i32 38
  store i32 %1341, i32* %1343, align 8
  store i32 1, i32* %2, align 4
  br label %1352

; <label>:1344:                                   ; preds = %1195, %1155, %964, %949, %934, %915, %895, %787, %713, %702, %674, %642, %624, %300, %204, %125
  %1345 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %1346 = icmp ne %struct.TIFFDirEntry* %1345, null
  br i1 %1346, label %1347, label %1351

; <label>:1347:                                   ; preds = %1344
  %pgocount138 = load i64, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 37)
  %1348 = add i64 %pgocount138, 1
  store i64 %1348, i64* getelementptr inbounds ([119 x i64], [119 x i64]* @__profc_TIFFReadDirectory, i64 0, i64 37)
  %1349 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %1350 = bitcast %struct.TIFFDirEntry* %1349 to i8*
  call void @_TIFFfree(i8* %1350)
  br label %1351

; <label>:1351:                                   ; preds = %1347, %1344
  store i32 0, i32* %2, align 4
  br label %1352

; <label>:1352:                                   ; preds = %1351, %1327, %190, %155, %101, %78, %62, %29
  %1353 = load i32, i32* %2, align 4
  ret i32 %1353
}

declare void @TIFFError(i8*, i8*, ...) #1

declare void @TIFFSwabShort(i16*) #1

; Function Attrs: nounwind uwtable
define internal i8* @CheckMalloc(%struct.tiff*, i32, i8*) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  store i8* %2, i8** %6, align 8
  %8 = load i32, i32* %5, align 4
  %9 = call i8* @_TIFFmalloc(i32 %8)
  store i8* %9, i8** %7, align 8
  %10 = load i8*, i8** %7, align 8
  %11 = icmp eq i8* %10, null
  br i1 %11, label %12, label %18

; <label>:12:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_CheckMalloc, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_CheckMalloc, i64 0, i64 1)
  %14 = load %struct.tiff*, %struct.tiff** %4, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 0
  %16 = load i8*, i8** %15, align 8
  %17 = load i8*, i8** %6, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %16, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.16, i32 0, i32 0), i8* %17)
  br label %18

; <label>:18:                                     ; preds = %12, %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_CheckMalloc, i64 0, i64 0)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_CheckMalloc, i64 0, i64 0)
  %20 = load i8*, i8** %7, align 8
  ret i8* %20
}

declare void @_TIFFmemcpy(i8*, i8*, i32) #1

declare void @TIFFSwabLong(i32*) #1

declare void @TIFFFreeDirectory(%struct.tiff*) #1

declare i32 @TIFFDefaultDirectory(%struct.tiff*) #1

declare i32 @TIFFSetField(%struct.tiff*, i32, ...) #1

declare void @TIFFSwabArrayOfShort(i16*, i64) #1

declare void @TIFFSwabArrayOfLong(i32*, i64) #1

; Function Attrs: nounwind uwtable
define internal i32 @TIFFFetchNormalTag(%struct.tiff*, %struct.TIFFDirEntry*) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.TIFFDirEntry*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.TIFFFieldInfo*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca i32, align 4
  %11 = alloca float, align 4
  %12 = alloca double, align 8
  %13 = alloca [2 x i8], align 1
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %4, align 8
  store i32 0, i32* %5, align 4
  %14 = load %struct.tiff*, %struct.tiff** %3, align 8
  %15 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %16 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %15, i32 0, i32 0
  %17 = load i16, i16* %16, align 4
  %18 = zext i16 %17 to i32
  %19 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %14, i32 %18)
  store %struct.TIFFFieldInfo* %19, %struct.TIFFFieldInfo** %6, align 8
  %20 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %21 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %20, i32 0, i32 2
  %22 = load i32, i32* %21, align 4
  %23 = icmp ugt i32 %22, 1
  br i1 %23, label %24, label %242

; <label>:24:                                     ; preds = %2
  store i8* null, i8** %7, align 8
  %25 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %26 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %25, i32 0, i32 1
  %27 = load i16, i16* %26, align 2
  %28 = zext i16 %27 to i32
  switch i32 %28, label %202 [
    i32 1, label %._crit_edge
    i32 6, label %34
    i32 3, label %._crit_edge1
    i32 8, label %57
    i32 4, label %._crit_edge2
    i32 9, label %80
    i32 5, label %._crit_edge3
    i32 10, label %103
    i32 11, label %126
    i32 12, label %149
    i32 2, label %._crit_edge4
    i32 7, label %172
  ]

._crit_edge4:                                     ; preds = %24
  %pgocount = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 4)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 4)
  br label %172

._crit_edge3:                                     ; preds = %24
  %pgocount12 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 3)
  %30 = add i64 %pgocount12, 1
  store i64 %30, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 3)
  br label %103

._crit_edge2:                                     ; preds = %24
  %pgocount13 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 2)
  %31 = add i64 %pgocount13, 1
  store i64 %31, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 2)
  br label %80

._crit_edge1:                                     ; preds = %24
  %pgocount14 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 1)
  %32 = add i64 %pgocount14, 1
  store i64 %32, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 1)
  br label %57

._crit_edge:                                      ; preds = %24
  %pgocount15 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 0)
  %33 = add i64 %pgocount15, 1
  store i64 %33, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 0)
  br label %34

; <label>:34:                                     ; preds = %._crit_edge, %24
  %35 = load %struct.tiff*, %struct.tiff** %3, align 8
  %36 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %37 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %36, i32 0, i32 2
  %38 = load i32, i32* %37, align 4
  %39 = zext i32 %38 to i64
  %40 = mul i64 %39, 2
  %41 = trunc i64 %40 to i32
  %42 = call i8* @CheckMalloc(%struct.tiff* %35, i32 %41, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @TIFFFetchNormalTag.mesg, i32 0, i32 0))
  store i8* %42, i8** %7, align 8
  %43 = load i8*, i8** %7, align 8
  %44 = icmp ne i8* %43, null
  br i1 %44, label %45, label %53

; <label>:45:                                     ; preds = %34
  %pgocount16 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 26)
  %46 = add i64 %pgocount16, 1
  store i64 %46, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 26)
  %47 = load %struct.tiff*, %struct.tiff** %3, align 8
  %48 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %49 = load i8*, i8** %7, align 8
  %50 = bitcast i8* %49 to i16*
  %51 = call i32 @TIFFFetchByteArray(%struct.tiff* %47, %struct.TIFFDirEntry* %48, i16* %50)
  %52 = icmp ne i32 %51, 0
  br label %53

; <label>:53:                                     ; preds = %45, %34
  %54 = phi i1 [ false, %34 ], [ %52, %45 ]
  %pgocount17 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 18)
  %55 = add i64 %pgocount17, 1
  store i64 %55, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 18)
  %56 = zext i1 %54 to i32
  store i32 %56, i32* %5, align 4
  br label %202

; <label>:57:                                     ; preds = %._crit_edge1, %24
  %58 = load %struct.tiff*, %struct.tiff** %3, align 8
  %59 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %60 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %59, i32 0, i32 2
  %61 = load i32, i32* %60, align 4
  %62 = zext i32 %61 to i64
  %63 = mul i64 %62, 2
  %64 = trunc i64 %63 to i32
  %65 = call i8* @CheckMalloc(%struct.tiff* %58, i32 %64, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @TIFFFetchNormalTag.mesg, i32 0, i32 0))
  store i8* %65, i8** %7, align 8
  %66 = load i8*, i8** %7, align 8
  %67 = icmp ne i8* %66, null
  br i1 %67, label %68, label %76

; <label>:68:                                     ; preds = %57
  %pgocount18 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 27)
  %69 = add i64 %pgocount18, 1
  store i64 %69, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 27)
  %70 = load %struct.tiff*, %struct.tiff** %3, align 8
  %71 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %72 = load i8*, i8** %7, align 8
  %73 = bitcast i8* %72 to i16*
  %74 = call i32 @TIFFFetchShortArray(%struct.tiff* %70, %struct.TIFFDirEntry* %71, i16* %73)
  %75 = icmp ne i32 %74, 0
  br label %76

; <label>:76:                                     ; preds = %68, %57
  %77 = phi i1 [ false, %57 ], [ %75, %68 ]
  %pgocount19 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 19)
  %78 = add i64 %pgocount19, 1
  store i64 %78, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 19)
  %79 = zext i1 %77 to i32
  store i32 %79, i32* %5, align 4
  br label %202

; <label>:80:                                     ; preds = %._crit_edge2, %24
  %81 = load %struct.tiff*, %struct.tiff** %3, align 8
  %82 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %83 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %82, i32 0, i32 2
  %84 = load i32, i32* %83, align 4
  %85 = zext i32 %84 to i64
  %86 = mul i64 %85, 4
  %87 = trunc i64 %86 to i32
  %88 = call i8* @CheckMalloc(%struct.tiff* %81, i32 %87, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @TIFFFetchNormalTag.mesg, i32 0, i32 0))
  store i8* %88, i8** %7, align 8
  %89 = load i8*, i8** %7, align 8
  %90 = icmp ne i8* %89, null
  br i1 %90, label %91, label %99

; <label>:91:                                     ; preds = %80
  %pgocount20 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 28)
  %92 = add i64 %pgocount20, 1
  store i64 %92, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 28)
  %93 = load %struct.tiff*, %struct.tiff** %3, align 8
  %94 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %95 = load i8*, i8** %7, align 8
  %96 = bitcast i8* %95 to i32*
  %97 = call i32 @TIFFFetchLongArray(%struct.tiff* %93, %struct.TIFFDirEntry* %94, i32* %96)
  %98 = icmp ne i32 %97, 0
  br label %99

; <label>:99:                                     ; preds = %91, %80
  %100 = phi i1 [ false, %80 ], [ %98, %91 ]
  %pgocount21 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 20)
  %101 = add i64 %pgocount21, 1
  store i64 %101, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 20)
  %102 = zext i1 %100 to i32
  store i32 %102, i32* %5, align 4
  br label %202

; <label>:103:                                    ; preds = %._crit_edge3, %24
  %104 = load %struct.tiff*, %struct.tiff** %3, align 8
  %105 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %106 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %105, i32 0, i32 2
  %107 = load i32, i32* %106, align 4
  %108 = zext i32 %107 to i64
  %109 = mul i64 %108, 4
  %110 = trunc i64 %109 to i32
  %111 = call i8* @CheckMalloc(%struct.tiff* %104, i32 %110, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @TIFFFetchNormalTag.mesg, i32 0, i32 0))
  store i8* %111, i8** %7, align 8
  %112 = load i8*, i8** %7, align 8
  %113 = icmp ne i8* %112, null
  br i1 %113, label %114, label %122

; <label>:114:                                    ; preds = %103
  %pgocount22 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 29)
  %115 = add i64 %pgocount22, 1
  store i64 %115, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 29)
  %116 = load %struct.tiff*, %struct.tiff** %3, align 8
  %117 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %118 = load i8*, i8** %7, align 8
  %119 = bitcast i8* %118 to float*
  %120 = call i32 @TIFFFetchRationalArray(%struct.tiff* %116, %struct.TIFFDirEntry* %117, float* %119)
  %121 = icmp ne i32 %120, 0
  br label %122

; <label>:122:                                    ; preds = %114, %103
  %123 = phi i1 [ false, %103 ], [ %121, %114 ]
  %pgocount23 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 21)
  %124 = add i64 %pgocount23, 1
  store i64 %124, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 21)
  %125 = zext i1 %123 to i32
  store i32 %125, i32* %5, align 4
  br label %202

; <label>:126:                                    ; preds = %24
  %127 = load %struct.tiff*, %struct.tiff** %3, align 8
  %128 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %129 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %128, i32 0, i32 2
  %130 = load i32, i32* %129, align 4
  %131 = zext i32 %130 to i64
  %132 = mul i64 %131, 4
  %133 = trunc i64 %132 to i32
  %134 = call i8* @CheckMalloc(%struct.tiff* %127, i32 %133, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @TIFFFetchNormalTag.mesg, i32 0, i32 0))
  store i8* %134, i8** %7, align 8
  %135 = load i8*, i8** %7, align 8
  %136 = icmp ne i8* %135, null
  br i1 %136, label %137, label %145

; <label>:137:                                    ; preds = %126
  %pgocount24 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 42)
  %138 = add i64 %pgocount24, 1
  store i64 %138, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 42)
  %139 = load %struct.tiff*, %struct.tiff** %3, align 8
  %140 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %141 = load i8*, i8** %7, align 8
  %142 = bitcast i8* %141 to float*
  %143 = call i32 @TIFFFetchFloatArray(%struct.tiff* %139, %struct.TIFFDirEntry* %140, float* %142)
  %144 = icmp ne i32 %143, 0
  br label %145

; <label>:145:                                    ; preds = %137, %126
  %146 = phi i1 [ false, %126 ], [ %144, %137 ]
  %pgocount25 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 35)
  %147 = add i64 %pgocount25, 1
  store i64 %147, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 35)
  %148 = zext i1 %146 to i32
  store i32 %148, i32* %5, align 4
  br label %202

; <label>:149:                                    ; preds = %24
  %150 = load %struct.tiff*, %struct.tiff** %3, align 8
  %151 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %152 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %151, i32 0, i32 2
  %153 = load i32, i32* %152, align 4
  %154 = zext i32 %153 to i64
  %155 = mul i64 %154, 8
  %156 = trunc i64 %155 to i32
  %157 = call i8* @CheckMalloc(%struct.tiff* %150, i32 %156, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @TIFFFetchNormalTag.mesg, i32 0, i32 0))
  store i8* %157, i8** %7, align 8
  %158 = load i8*, i8** %7, align 8
  %159 = icmp ne i8* %158, null
  br i1 %159, label %160, label %168

; <label>:160:                                    ; preds = %149
  %pgocount26 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 43)
  %161 = add i64 %pgocount26, 1
  store i64 %161, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 43)
  %162 = load %struct.tiff*, %struct.tiff** %3, align 8
  %163 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %164 = load i8*, i8** %7, align 8
  %165 = bitcast i8* %164 to double*
  %166 = call i32 @TIFFFetchDoubleArray(%struct.tiff* %162, %struct.TIFFDirEntry* %163, double* %165)
  %167 = icmp ne i32 %166, 0
  br label %168

; <label>:168:                                    ; preds = %160, %149
  %169 = phi i1 [ false, %149 ], [ %167, %160 ]
  %pgocount27 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 36)
  %170 = add i64 %pgocount27, 1
  store i64 %170, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 36)
  %171 = zext i1 %169 to i32
  store i32 %171, i32* %5, align 4
  br label %202

; <label>:172:                                    ; preds = %._crit_edge4, %24
  %173 = load %struct.tiff*, %struct.tiff** %3, align 8
  %174 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %175 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %174, i32 0, i32 2
  %176 = load i32, i32* %175, align 4
  %177 = add i32 %176, 1
  %178 = call i8* @CheckMalloc(%struct.tiff* %173, i32 %177, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @TIFFFetchNormalTag.mesg, i32 0, i32 0))
  store i8* %178, i8** %7, align 8
  %179 = load i8*, i8** %7, align 8
  %180 = icmp ne i8* %179, null
  br i1 %180, label %181, label %188

; <label>:181:                                    ; preds = %172
  %pgocount28 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 30)
  %182 = add i64 %pgocount28, 1
  store i64 %182, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 30)
  %183 = load %struct.tiff*, %struct.tiff** %3, align 8
  %184 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %185 = load i8*, i8** %7, align 8
  %186 = call i32 @TIFFFetchString(%struct.tiff* %183, %struct.TIFFDirEntry* %184, i8* %185)
  %187 = icmp ne i32 %186, 0
  br label %188

; <label>:188:                                    ; preds = %181, %172
  %189 = phi i1 [ false, %172 ], [ %187, %181 ]
  %190 = zext i1 %189 to i32
  store i32 %190, i32* %5, align 4
  %191 = icmp ne i32 %190, 0
  br i1 %191, label %192, label %200

; <label>:192:                                    ; preds = %188
  %pgocount29 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 31)
  %193 = add i64 %pgocount29, 1
  store i64 %193, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 31)
  %194 = load i8*, i8** %7, align 8
  %195 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %196 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %195, i32 0, i32 2
  %197 = load i32, i32* %196, align 4
  %198 = zext i32 %197 to i64
  %199 = getelementptr inbounds i8, i8* %194, i64 %198
  store i8 0, i8* %199, align 1
  br label %200

; <label>:200:                                    ; preds = %192, %188
  %pgocount30 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 22)
  %201 = add i64 %pgocount30, 1
  store i64 %201, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 22)
  br label %202

; <label>:202:                                    ; preds = %200, %168, %145, %122, %99, %76, %53, %24
  %203 = load i32, i32* %5, align 4
  %204 = icmp ne i32 %203, 0
  br i1 %204, label %205, label %234

; <label>:205:                                    ; preds = %202
  %206 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %207 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %206, i32 0, i32 6
  %208 = load i8, i8* %207, align 1
  %209 = zext i8 %208 to i32
  %210 = icmp ne i32 %209, 0
  br i1 %210, label %211, label %223

; <label>:211:                                    ; preds = %205
  %pgocount31 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 16)
  %212 = add i64 %pgocount31, 1
  store i64 %212, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 16)
  %213 = load %struct.tiff*, %struct.tiff** %3, align 8
  %214 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %215 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %214, i32 0, i32 0
  %216 = load i16, i16* %215, align 4
  %217 = zext i16 %216 to i32
  %218 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %219 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %218, i32 0, i32 2
  %220 = load i32, i32* %219, align 4
  %221 = load i8*, i8** %7, align 8
  %222 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %213, i32 %217, i32 %220, i8* %221)
  br label %232

; <label>:223:                                    ; preds = %205
  %pgocount32 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 17)
  %224 = add i64 %pgocount32, 1
  store i64 %224, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 17)
  %225 = load %struct.tiff*, %struct.tiff** %3, align 8
  %226 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %227 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %226, i32 0, i32 0
  %228 = load i16, i16* %227, align 4
  %229 = zext i16 %228 to i32
  %230 = load i8*, i8** %7, align 8
  %231 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %225, i32 %229, i8* %230)
  br label %232

; <label>:232:                                    ; preds = %223, %211
  %233 = phi i32 [ %222, %211 ], [ %231, %223 ]
  store i32 %233, i32* %5, align 4
  br label %234

; <label>:234:                                    ; preds = %232, %202
  %235 = load i8*, i8** %7, align 8
  %236 = icmp ne i8* %235, null
  br i1 %236, label %237, label %240

; <label>:237:                                    ; preds = %234
  %pgocount33 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 14)
  %238 = add i64 %pgocount33, 1
  store i64 %238, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 14)
  %239 = load i8*, i8** %7, align 8
  call void @_TIFFfree(i8* %239)
  br label %240

; <label>:240:                                    ; preds = %237, %234
  %pgocount34 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 12)
  %241 = add i64 %pgocount34, 1
  store i64 %241, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 12)
  br label %524

; <label>:242:                                    ; preds = %2
  %243 = load %struct.tiff*, %struct.tiff** %3, align 8
  %244 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %245 = call i32 @CheckDirCount(%struct.tiff* %243, %struct.TIFFDirEntry* %244, i32 1)
  %246 = icmp ne i32 %245, 0
  br i1 %246, label %247, label %522

; <label>:247:                                    ; preds = %242
  %248 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %249 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %248, i32 0, i32 1
  %250 = load i16, i16* %249, align 2
  %251 = zext i16 %250 to i32
  switch i32 %251, label %520 [
    i32 1, label %._crit_edge5
    i32 6, label %._crit_edge6
    i32 3, label %._crit_edge7
    i32 8, label %259
    i32 4, label %._crit_edge8
    i32 9, label %348
    i32 5, label %._crit_edge9
    i32 10, label %._crit_edge10
    i32 11, label %423
    i32 12, label %465
    i32 2, label %._crit_edge11
    i32 7, label %500
  ]

._crit_edge11:                                    ; preds = %247
  %pgocount35 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 11)
  %252 = add i64 %pgocount35, 1
  store i64 %252, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 11)
  br label %500

._crit_edge10:                                    ; preds = %247
  %pgocount36 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 10)
  %253 = add i64 %pgocount36, 1
  store i64 %253, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 10)
  br label %423

._crit_edge9:                                     ; preds = %247
  %pgocount37 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 9)
  %254 = add i64 %pgocount37, 1
  store i64 %254, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 9)
  br label %423

._crit_edge8:                                     ; preds = %247
  %pgocount38 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 8)
  %255 = add i64 %pgocount38, 1
  store i64 %255, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 8)
  br label %348

._crit_edge7:                                     ; preds = %247
  %pgocount39 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 7)
  %256 = add i64 %pgocount39, 1
  store i64 %256, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 7)
  br label %259

._crit_edge6:                                     ; preds = %247
  %pgocount40 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 6)
  %257 = add i64 %pgocount40, 1
  store i64 %257, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 6)
  br label %259

._crit_edge5:                                     ; preds = %247
  %pgocount41 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 5)
  %258 = add i64 %pgocount41, 1
  store i64 %258, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 5)
  br label %259

; <label>:259:                                    ; preds = %._crit_edge5, %._crit_edge6, %._crit_edge7, %247
  %260 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %261 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %260, i32 0, i32 3
  %262 = load i32, i32* %261, align 8
  store i32 %262, i32* %8, align 4
  %263 = load i32, i32* %8, align 4
  %264 = icmp ne i32 %263, 4
  br i1 %264, label %265, label %346

; <label>:265:                                    ; preds = %259
  %pgocount42 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 32)
  %266 = add i64 %pgocount42, 1
  store i64 %266, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 32)
  %267 = load i32, i32* %8, align 4
  %268 = icmp ne i32 %267, 9
  br i1 %268, label %269, label %346

; <label>:269:                                    ; preds = %265
  %270 = load %struct.tiff*, %struct.tiff** %3, align 8
  %271 = getelementptr inbounds %struct.tiff, %struct.tiff* %270, i32 0, i32 7
  %272 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %271, i32 0, i32 0
  %273 = load i16, i16* %272, align 8
  %274 = zext i16 %273 to i32
  %275 = icmp eq i32 %274, 19789
  br i1 %275, label %276, label %302

; <label>:276:                                    ; preds = %269
  %pgocount43 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 44)
  %277 = add i64 %pgocount43, 1
  store i64 %277, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 44)
  %278 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %279 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %278, i32 0, i32 3
  %280 = load i32, i32* %279, align 4
  %281 = load %struct.tiff*, %struct.tiff** %3, align 8
  %282 = getelementptr inbounds %struct.tiff, %struct.tiff* %281, i32 0, i32 9
  %283 = load i32*, i32** %282, align 8
  %284 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %285 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %284, i32 0, i32 1
  %286 = load i16, i16* %285, align 2
  %287 = zext i16 %286 to i64
  %288 = getelementptr inbounds i32, i32* %283, i64 %287
  %289 = load i32, i32* %288, align 4
  %290 = lshr i32 %280, %289
  %291 = zext i32 %290 to i64
  %292 = load %struct.tiff*, %struct.tiff** %3, align 8
  %293 = getelementptr inbounds %struct.tiff, %struct.tiff* %292, i32 0, i32 10
  %294 = load i64*, i64** %293, align 8
  %295 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %296 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %295, i32 0, i32 1
  %297 = load i16, i16* %296, align 2
  %298 = zext i16 %297 to i64
  %299 = getelementptr inbounds i64, i64* %294, i64 %298
  %300 = load i64, i64* %299, align 8
  %301 = and i64 %291, %300
  br label %318

; <label>:302:                                    ; preds = %269
  %pgocount44 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 45)
  %303 = add i64 %pgocount44, 1
  store i64 %303, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 45)
  %304 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %305 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %304, i32 0, i32 3
  %306 = load i32, i32* %305, align 4
  %307 = zext i32 %306 to i64
  %308 = load %struct.tiff*, %struct.tiff** %3, align 8
  %309 = getelementptr inbounds %struct.tiff, %struct.tiff* %308, i32 0, i32 10
  %310 = load i64*, i64** %309, align 8
  %311 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %312 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %311, i32 0, i32 1
  %313 = load i16, i16* %312, align 2
  %314 = zext i16 %313 to i64
  %315 = getelementptr inbounds i64, i64* %310, i64 %314
  %316 = load i64, i64* %315, align 8
  %317 = and i64 %307, %316
  br label %318

; <label>:318:                                    ; preds = %302, %276
  %319 = phi i64 [ %301, %276 ], [ %317, %302 ]
  %320 = trunc i64 %319 to i32
  %321 = trunc i32 %320 to i16
  store i16 %321, i16* %9, align 2
  %322 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %323 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %322, i32 0, i32 6
  %324 = load i8, i8* %323, align 1
  %325 = zext i8 %324 to i32
  %326 = icmp ne i32 %325, 0
  br i1 %326, label %327, label %334

; <label>:327:                                    ; preds = %318
  %328 = load %struct.tiff*, %struct.tiff** %3, align 8
  %329 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %330 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %329, i32 0, i32 0
  %331 = load i16, i16* %330, align 4
  %332 = zext i16 %331 to i32
  %333 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %328, i32 %332, i32 1, i16* %9)
  br label %344

; <label>:334:                                    ; preds = %318
  %pgocount45 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 47)
  %335 = add i64 %pgocount45, 1
  store i64 %335, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 47)
  %336 = load %struct.tiff*, %struct.tiff** %3, align 8
  %337 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %338 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %337, i32 0, i32 0
  %339 = load i16, i16* %338, align 4
  %340 = zext i16 %339 to i32
  %341 = load i16, i16* %9, align 2
  %342 = zext i16 %341 to i32
  %343 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %336, i32 %340, i32 %342)
  br label %344

; <label>:344:                                    ; preds = %334, %327
  %345 = phi i32 [ %333, %327 ], [ %343, %334 ]
  store i32 %345, i32* %5, align 4
  br label %520

; <label>:346:                                    ; preds = %265, %259
  %pgocount46 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 23)
  %347 = add i64 %pgocount46, 1
  store i64 %347, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 23)
  br label %348

; <label>:348:                                    ; preds = %346, %._crit_edge8, %247
  %349 = load %struct.tiff*, %struct.tiff** %3, align 8
  %350 = getelementptr inbounds %struct.tiff, %struct.tiff* %349, i32 0, i32 7
  %351 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %350, i32 0, i32 0
  %352 = load i16, i16* %351, align 8
  %353 = zext i16 %352 to i32
  %354 = icmp eq i32 %353, 19789
  br i1 %354, label %355, label %381

; <label>:355:                                    ; preds = %348
  %pgocount47 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 24)
  %356 = add i64 %pgocount47, 1
  store i64 %356, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 24)
  %357 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %358 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %357, i32 0, i32 3
  %359 = load i32, i32* %358, align 4
  %360 = load %struct.tiff*, %struct.tiff** %3, align 8
  %361 = getelementptr inbounds %struct.tiff, %struct.tiff* %360, i32 0, i32 9
  %362 = load i32*, i32** %361, align 8
  %363 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %364 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %363, i32 0, i32 1
  %365 = load i16, i16* %364, align 2
  %366 = zext i16 %365 to i64
  %367 = getelementptr inbounds i32, i32* %362, i64 %366
  %368 = load i32, i32* %367, align 4
  %369 = lshr i32 %359, %368
  %370 = zext i32 %369 to i64
  %371 = load %struct.tiff*, %struct.tiff** %3, align 8
  %372 = getelementptr inbounds %struct.tiff, %struct.tiff* %371, i32 0, i32 10
  %373 = load i64*, i64** %372, align 8
  %374 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %375 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %374, i32 0, i32 1
  %376 = load i16, i16* %375, align 2
  %377 = zext i16 %376 to i64
  %378 = getelementptr inbounds i64, i64* %373, i64 %377
  %379 = load i64, i64* %378, align 8
  %380 = and i64 %370, %379
  br label %397

; <label>:381:                                    ; preds = %348
  %pgocount48 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 25)
  %382 = add i64 %pgocount48, 1
  store i64 %382, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 25)
  %383 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %384 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %383, i32 0, i32 3
  %385 = load i32, i32* %384, align 4
  %386 = zext i32 %385 to i64
  %387 = load %struct.tiff*, %struct.tiff** %3, align 8
  %388 = getelementptr inbounds %struct.tiff, %struct.tiff* %387, i32 0, i32 10
  %389 = load i64*, i64** %388, align 8
  %390 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %391 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %390, i32 0, i32 1
  %392 = load i16, i16* %391, align 2
  %393 = zext i16 %392 to i64
  %394 = getelementptr inbounds i64, i64* %389, i64 %393
  %395 = load i64, i64* %394, align 8
  %396 = and i64 %386, %395
  br label %397

; <label>:397:                                    ; preds = %381, %355
  %398 = phi i64 [ %380, %355 ], [ %396, %381 ]
  %399 = trunc i64 %398 to i32
  store i32 %399, i32* %10, align 4
  %400 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %401 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %400, i32 0, i32 6
  %402 = load i8, i8* %401, align 1
  %403 = zext i8 %402 to i32
  %404 = icmp ne i32 %403, 0
  br i1 %404, label %405, label %412

; <label>:405:                                    ; preds = %397
  %406 = load %struct.tiff*, %struct.tiff** %3, align 8
  %407 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %408 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %407, i32 0, i32 0
  %409 = load i16, i16* %408, align 4
  %410 = zext i16 %409 to i32
  %411 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %406, i32 %410, i32 1, i32* %10)
  br label %421

; <label>:412:                                    ; preds = %397
  %pgocount49 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 34)
  %413 = add i64 %pgocount49, 1
  store i64 %413, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 34)
  %414 = load %struct.tiff*, %struct.tiff** %3, align 8
  %415 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %416 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %415, i32 0, i32 0
  %417 = load i16, i16* %416, align 4
  %418 = zext i16 %417 to i32
  %419 = load i32, i32* %10, align 4
  %420 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %414, i32 %418, i32 %419)
  br label %421

; <label>:421:                                    ; preds = %412, %405
  %422 = phi i32 [ %411, %405 ], [ %420, %412 ]
  store i32 %422, i32* %5, align 4
  br label %520

; <label>:423:                                    ; preds = %._crit_edge9, %._crit_edge10, %247
  %424 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %425 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %424, i32 0, i32 1
  %426 = load i16, i16* %425, align 2
  %427 = zext i16 %426 to i32
  %428 = icmp eq i32 %427, 11
  br i1 %428, label %429, label %434

; <label>:429:                                    ; preds = %423
  %pgocount50 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 37)
  %430 = add i64 %pgocount50, 1
  store i64 %430, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 37)
  %431 = load %struct.tiff*, %struct.tiff** %3, align 8
  %432 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %433 = call float @TIFFFetchFloat(%struct.tiff* %431, %struct.TIFFDirEntry* %432)
  br label %439

; <label>:434:                                    ; preds = %423
  %pgocount51 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 38)
  %435 = add i64 %pgocount51, 1
  store i64 %435, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 38)
  %436 = load %struct.tiff*, %struct.tiff** %3, align 8
  %437 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %438 = call float @TIFFFetchRational(%struct.tiff* %436, %struct.TIFFDirEntry* %437)
  br label %439

; <label>:439:                                    ; preds = %434, %429
  %440 = phi float [ %433, %429 ], [ %438, %434 ]
  store float %440, float* %11, align 4
  %441 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %442 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %441, i32 0, i32 6
  %443 = load i8, i8* %442, align 1
  %444 = zext i8 %443 to i32
  %445 = icmp ne i32 %444, 0
  br i1 %445, label %446, label %453

; <label>:446:                                    ; preds = %439
  %447 = load %struct.tiff*, %struct.tiff** %3, align 8
  %448 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %449 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %448, i32 0, i32 0
  %450 = load i16, i16* %449, align 4
  %451 = zext i16 %450 to i32
  %452 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %447, i32 %451, i32 1, float* %11)
  br label %463

; <label>:453:                                    ; preds = %439
  %pgocount52 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 40)
  %454 = add i64 %pgocount52, 1
  store i64 %454, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 40)
  %455 = load %struct.tiff*, %struct.tiff** %3, align 8
  %456 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %457 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %456, i32 0, i32 0
  %458 = load i16, i16* %457, align 4
  %459 = zext i16 %458 to i32
  %460 = load float, float* %11, align 4
  %461 = fpext float %460 to double
  %462 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %455, i32 %459, double %461)
  br label %463

; <label>:463:                                    ; preds = %453, %446
  %464 = phi i32 [ %452, %446 ], [ %462, %453 ]
  store i32 %464, i32* %5, align 4
  br label %520

; <label>:465:                                    ; preds = %247
  %466 = load %struct.tiff*, %struct.tiff** %3, align 8
  %467 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %468 = call i32 @TIFFFetchDoubleArray(%struct.tiff* %466, %struct.TIFFDirEntry* %467, double* %12)
  %469 = icmp ne i32 %468, 0
  br i1 %469, label %470, label %496

; <label>:470:                                    ; preds = %465
  %471 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %472 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %471, i32 0, i32 6
  %473 = load i8, i8* %472, align 1
  %474 = zext i8 %473 to i32
  %475 = icmp ne i32 %474, 0
  br i1 %475, label %476, label %484

; <label>:476:                                    ; preds = %470
  %pgocount53 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 46)
  %477 = add i64 %pgocount53, 1
  store i64 %477, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 46)
  %478 = load %struct.tiff*, %struct.tiff** %3, align 8
  %479 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %480 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %479, i32 0, i32 0
  %481 = load i16, i16* %480, align 4
  %482 = zext i16 %481 to i32
  %483 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %478, i32 %482, i32 1, double* %12)
  br label %493

; <label>:484:                                    ; preds = %470
  %pgocount54 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 48)
  %485 = add i64 %pgocount54, 1
  store i64 %485, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 48)
  %486 = load %struct.tiff*, %struct.tiff** %3, align 8
  %487 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %488 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %487, i32 0, i32 0
  %489 = load i16, i16* %488, align 4
  %490 = zext i16 %489 to i32
  %491 = load double, double* %12, align 8
  %492 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %486, i32 %490, double %491)
  br label %493

; <label>:493:                                    ; preds = %484, %476
  %494 = phi i32 [ %483, %476 ], [ %492, %484 ]
  %495 = icmp ne i32 %494, 0
  br label %496

; <label>:496:                                    ; preds = %493, %465
  %497 = phi i1 [ false, %465 ], [ %495, %493 ]
  %pgocount55 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 41)
  %498 = add i64 %pgocount55, 1
  store i64 %498, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 41)
  %499 = zext i1 %497 to i32
  store i32 %499, i32* %5, align 4
  br label %520

; <label>:500:                                    ; preds = %._crit_edge11, %247
  %501 = load %struct.tiff*, %struct.tiff** %3, align 8
  %502 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %503 = getelementptr inbounds [2 x i8], [2 x i8]* %13, i32 0, i32 0
  %504 = call i32 @TIFFFetchString(%struct.tiff* %501, %struct.TIFFDirEntry* %502, i8* %503)
  %505 = icmp ne i32 %504, 0
  %506 = zext i1 %505 to i32
  store i32 %506, i32* %5, align 4
  %507 = icmp ne i32 %506, 0
  br i1 %507, label %508, label %518

; <label>:508:                                    ; preds = %500
  %pgocount56 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 39)
  %509 = add i64 %pgocount56, 1
  store i64 %509, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 39)
  %510 = getelementptr inbounds [2 x i8], [2 x i8]* %13, i64 0, i64 1
  store i8 0, i8* %510, align 1
  %511 = load %struct.tiff*, %struct.tiff** %3, align 8
  %512 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %513 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %512, i32 0, i32 0
  %514 = load i16, i16* %513, align 4
  %515 = zext i16 %514 to i32
  %516 = getelementptr inbounds [2 x i8], [2 x i8]* %13, i32 0, i32 0
  %517 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %511, i32 %515, i8* %516)
  store i32 %517, i32* %5, align 4
  br label %518

; <label>:518:                                    ; preds = %508, %500
  %pgocount57 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 33)
  %519 = add i64 %pgocount57, 1
  store i64 %519, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 33)
  br label %520

; <label>:520:                                    ; preds = %518, %496, %463, %421, %344, %247
  %pgocount58 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 15)
  %521 = add i64 %pgocount58, 1
  store i64 %521, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 15)
  br label %522

; <label>:522:                                    ; preds = %520, %242
  %pgocount59 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 13)
  %523 = add i64 %pgocount59, 1
  store i64 %523, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_TIFFFetchNormalTag, i64 0, i64 13)
  br label %524

; <label>:524:                                    ; preds = %522, %240
  %525 = load i32, i32* %5, align 4
  ret i32 %525
}

declare i32 @TIFFReassignTagToIgnore(i32, i32) #1

declare void @TIFFWarning(i8*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal i32 @CheckDirCount(%struct.tiff*, %struct.TIFFDirEntry*, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca %struct.TIFFDirEntry*, align 8
  %7 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %6, align 8
  store i32 %2, i32* %7, align 4
  %8 = load i32, i32* %7, align 4
  %9 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %10 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %9, i32 0, i32 2
  %11 = load i32, i32* %10, align 4
  %12 = icmp ne i32 %8, %11
  br i1 %12, label %13, label %30

; <label>:13:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_CheckDirCount, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_CheckDirCount, i64 0, i64 0)
  %15 = load %struct.tiff*, %struct.tiff** %5, align 8
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %15, i32 0, i32 0
  %17 = load i8*, i8** %16, align 8
  %18 = load %struct.tiff*, %struct.tiff** %5, align 8
  %19 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %20 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %19, i32 0, i32 0
  %21 = load i16, i16* %20, align 4
  %22 = zext i16 %21 to i32
  %23 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %18, i32 %22)
  %24 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %23, i32 0, i32 7
  %25 = load i8*, i8** %24, align 8
  %26 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %27 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %26, i32 0, i32 2
  %28 = load i32, i32* %27, align 4
  %29 = load i32, i32* %7, align 4
  call void (i8*, i8*, ...) @TIFFWarning(i8* %17, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.19, i32 0, i32 0), i8* %25, i32 %28, i32 %29)
  store i32 0, i32* %4, align 4
  br label %32

; <label>:30:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_CheckDirCount, i64 0, i64 1)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_CheckDirCount, i64 0, i64 1)
  store i32 1, i32* %4, align 4
  br label %32

; <label>:32:                                     ; preds = %30, %13
  %33 = load i32, i32* %4, align 4
  ret i32 %33
}

; Function Attrs: nounwind uwtable
define internal i32 @TIFFFetchPerSampleShorts(%struct.tiff*, %struct.TIFFDirEntry*, i32*) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca %struct.TIFFDirEntry*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [10 x i16], align 16
  %10 = alloca i16*, align 8
  %11 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %5, align 8
  store i32* %2, i32** %6, align 8
  %12 = load %struct.tiff*, %struct.tiff** %4, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 6
  %14 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %13, i32 0, i32 15
  %15 = load i16, i16* %14, align 2
  %16 = zext i16 %15 to i32
  store i32 %16, i32* %7, align 4
  store i32 0, i32* %8, align 4
  %17 = load %struct.tiff*, %struct.tiff** %4, align 8
  %18 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %19 = load i32, i32* %7, align 4
  %20 = call i32 @CheckDirCount(%struct.tiff* %17, %struct.TIFFDirEntry* %18, i32 %19)
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %94

; <label>:22:                                     ; preds = %3
  %23 = getelementptr inbounds [10 x i16], [10 x i16]* %9, i32 0, i32 0
  store i16* %23, i16** %10, align 8
  %24 = load i32, i32* %7, align 4
  %25 = sext i32 %24 to i64
  %26 = icmp ugt i64 %25, 10
  br i1 %26, label %27, label %35

; <label>:27:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleShorts, i64 0, i64 4)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleShorts, i64 0, i64 4)
  %29 = load i32, i32* %7, align 4
  %30 = sext i32 %29 to i64
  %31 = mul i64 %30, 2
  %32 = trunc i64 %31 to i32
  %33 = call i8* @_TIFFmalloc(i32 %32)
  %34 = bitcast i8* %33 to i16*
  store i16* %34, i16** %10, align 8
  br label %35

; <label>:35:                                     ; preds = %27, %22
  %36 = load %struct.tiff*, %struct.tiff** %4, align 8
  %37 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %38 = load i16*, i16** %10, align 8
  %39 = call i32 @TIFFFetchShortArray(%struct.tiff* %36, %struct.TIFFDirEntry* %37, i16* %38)
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %83

; <label>:41:                                     ; preds = %35
  store i32 1, i32* %11, align 4
  br label %42

; <label>:42:                                     ; preds = %72, %41
  %43 = load i32, i32* %11, align 4
  %44 = load i32, i32* %7, align 4
  %45 = icmp slt i32 %43, %44
  br i1 %45, label %46, label %76

; <label>:46:                                     ; preds = %42
  %47 = load i16*, i16** %10, align 8
  %48 = load i32, i32* %11, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i16, i16* %47, i64 %49
  %51 = load i16, i16* %50, align 2
  %52 = zext i16 %51 to i32
  %53 = load i16*, i16** %10, align 8
  %54 = getelementptr inbounds i16, i16* %53, i64 0
  %55 = load i16, i16* %54, align 2
  %56 = zext i16 %55 to i32
  %57 = icmp ne i32 %52, %56
  br i1 %57, label %58, label %71

; <label>:58:                                     ; preds = %46
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleShorts, i64 0, i64 6)
  %59 = add i64 %pgocount1, 1
  store i64 %59, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleShorts, i64 0, i64 6)
  %60 = load %struct.tiff*, %struct.tiff** %4, align 8
  %61 = getelementptr inbounds %struct.tiff, %struct.tiff* %60, i32 0, i32 0
  %62 = load i8*, i8** %61, align 8
  %63 = load %struct.tiff*, %struct.tiff** %4, align 8
  %64 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %65 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %64, i32 0, i32 0
  %66 = load i16, i16* %65, align 4
  %67 = zext i16 %66 to i32
  %68 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %63, i32 %67)
  %69 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %68, i32 0, i32 7
  %70 = load i8*, i8** %69, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %62, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.23, i32 0, i32 0), i8* %70)
  br label %85

; <label>:71:                                     ; preds = %46
  br label %72

; <label>:72:                                     ; preds = %71
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleShorts, i64 0, i64 0)
  %73 = add i64 %pgocount2, 1
  store i64 %73, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleShorts, i64 0, i64 0)
  %74 = load i32, i32* %11, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %11, align 4
  br label %42

; <label>:76:                                     ; preds = %42
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleShorts, i64 0, i64 5)
  %77 = add i64 %pgocount3, 1
  store i64 %77, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleShorts, i64 0, i64 5)
  %78 = load i16*, i16** %10, align 8
  %79 = getelementptr inbounds i16, i16* %78, i64 0
  %80 = load i16, i16* %79, align 2
  %81 = zext i16 %80 to i32
  %82 = load i32*, i32** %6, align 8
  store i32 %81, i32* %82, align 4
  store i32 1, i32* %8, align 4
  br label %83

; <label>:83:                                     ; preds = %76, %35
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleShorts, i64 0, i64 2)
  %84 = add i64 %pgocount4, 1
  store i64 %84, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleShorts, i64 0, i64 2)
  br label %85

; <label>:85:                                     ; preds = %83, %58
  %86 = load i16*, i16** %10, align 8
  %87 = getelementptr inbounds [10 x i16], [10 x i16]* %9, i32 0, i32 0
  %88 = icmp ne i16* %86, %87
  br i1 %88, label %89, label %93

; <label>:89:                                     ; preds = %85
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleShorts, i64 0, i64 3)
  %90 = add i64 %pgocount5, 1
  store i64 %90, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleShorts, i64 0, i64 3)
  %91 = load i16*, i16** %10, align 8
  %92 = bitcast i16* %91 to i8*
  call void @_TIFFfree(i8* %92)
  br label %93

; <label>:93:                                     ; preds = %89, %85
  br label %94

; <label>:94:                                     ; preds = %93, %3
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleShorts, i64 0, i64 1)
  %95 = add i64 %pgocount6, 1
  store i64 %95, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleShorts, i64 0, i64 1)
  %96 = load i32, i32* %8, align 4
  ret i32 %96
}

; Function Attrs: nounwind uwtable
define internal i32 @TIFFFetchExtraSamples(%struct.tiff*, %struct.TIFFDirEntry*) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.TIFFDirEntry*, align 8
  %5 = alloca [10 x i16], align 16
  %6 = alloca i16*, align 8
  %7 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %4, align 8
  %8 = getelementptr inbounds [10 x i16], [10 x i16]* %5, i32 0, i32 0
  store i16* %8, i16** %6, align 8
  %9 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %10 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %9, i32 0, i32 2
  %11 = load i32, i32* %10, align 4
  %12 = zext i32 %11 to i64
  %13 = icmp ugt i64 %12, 10
  br i1 %13, label %14, label %24

; <label>:14:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchExtraSamples, i64 0, i64 2)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchExtraSamples, i64 0, i64 2)
  %16 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %17 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %16, i32 0, i32 2
  %18 = load i32, i32* %17, align 4
  %19 = zext i32 %18 to i64
  %20 = mul i64 %19, 2
  %21 = trunc i64 %20 to i32
  %22 = call i8* @_TIFFmalloc(i32 %21)
  %23 = bitcast i8* %22 to i16*
  store i16* %23, i16** %6, align 8
  br label %24

; <label>:24:                                     ; preds = %14, %2
  %25 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %26 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %25, i32 0, i32 1
  %27 = load i16, i16* %26, align 2
  %28 = zext i16 %27 to i32
  %29 = icmp eq i32 %28, 1
  br i1 %29, label %30, label %36

; <label>:30:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchExtraSamples, i64 0, i64 3)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchExtraSamples, i64 0, i64 3)
  %32 = load %struct.tiff*, %struct.tiff** %3, align 8
  %33 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %34 = load i16*, i16** %6, align 8
  %35 = call i32 @TIFFFetchByteArray(%struct.tiff* %32, %struct.TIFFDirEntry* %33, i16* %34)
  store i32 %35, i32* %7, align 4
  br label %42

; <label>:36:                                     ; preds = %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchExtraSamples, i64 0, i64 4)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchExtraSamples, i64 0, i64 4)
  %38 = load %struct.tiff*, %struct.tiff** %3, align 8
  %39 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %40 = load i16*, i16** %6, align 8
  %41 = call i32 @TIFFFetchShortArray(%struct.tiff* %38, %struct.TIFFDirEntry* %39, i16* %40)
  store i32 %41, i32* %7, align 4
  br label %42

; <label>:42:                                     ; preds = %36, %30
  %43 = load i32, i32* %7, align 4
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %57

; <label>:45:                                     ; preds = %42
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchExtraSamples, i64 0, i64 0)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchExtraSamples, i64 0, i64 0)
  %47 = load %struct.tiff*, %struct.tiff** %3, align 8
  %48 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %49 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %48, i32 0, i32 0
  %50 = load i16, i16* %49, align 4
  %51 = zext i16 %50 to i32
  %52 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %53 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %52, i32 0, i32 2
  %54 = load i32, i32* %53, align 4
  %55 = load i16*, i16** %6, align 8
  %56 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %47, i32 %51, i32 %54, i16* %55)
  store i32 %56, i32* %7, align 4
  br label %57

; <label>:57:                                     ; preds = %45, %42
  %58 = load i16*, i16** %6, align 8
  %59 = getelementptr inbounds [10 x i16], [10 x i16]* %5, i32 0, i32 0
  %60 = icmp ne i16* %58, %59
  br i1 %60, label %61, label %65

; <label>:61:                                     ; preds = %57
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchExtraSamples, i64 0, i64 1)
  %62 = add i64 %pgocount4, 1
  store i64 %62, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchExtraSamples, i64 0, i64 1)
  %63 = load i16*, i16** %6, align 8
  %64 = bitcast i16* %63 to i8*
  call void @_TIFFfree(i8* %64)
  br label %65

; <label>:65:                                     ; preds = %61, %57
  %66 = load i32, i32* %7, align 4
  ret i32 %66
}

; Function Attrs: nounwind uwtable
define internal void @MissingRequired(%struct.tiff*, i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_MissingRequired, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_MissingRequired, i64 0, i64 0)
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i8*, align 8
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i8* %1, i8** %5, align 8
  %6 = load %struct.tiff*, %struct.tiff** %4, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 0
  %8 = load i8*, i8** %7, align 8
  %9 = load i8*, i8** %5, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %8, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.18, i32 0, i32 0), i8* %9)
  ret void
}

declare i32 @TIFFNumberOfStrips(%struct.tiff*) #1

declare i32 @TIFFNumberOfTiles(%struct.tiff*) #1

; Function Attrs: nounwind uwtable
define internal i32 @TIFFFetchPerSampleAnys(%struct.tiff*, %struct.TIFFDirEntry*, double*) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca %struct.TIFFDirEntry*, align 8
  %6 = alloca double*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [10 x double], align 16
  %10 = alloca double*, align 8
  %11 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %5, align 8
  store double* %2, double** %6, align 8
  %12 = load %struct.tiff*, %struct.tiff** %4, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 6
  %14 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %13, i32 0, i32 15
  %15 = load i16, i16* %14, align 2
  %16 = zext i16 %15 to i32
  store i32 %16, i32* %7, align 4
  store i32 0, i32* %8, align 4
  %17 = load %struct.tiff*, %struct.tiff** %4, align 8
  %18 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %19 = load i32, i32* %7, align 4
  %20 = call i32 @CheckDirCount(%struct.tiff* %17, %struct.TIFFDirEntry* %18, i32 %19)
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %91

; <label>:22:                                     ; preds = %3
  %23 = getelementptr inbounds [10 x double], [10 x double]* %9, i32 0, i32 0
  store double* %23, double** %10, align 8
  %24 = load i32, i32* %7, align 4
  %25 = sext i32 %24 to i64
  %26 = icmp ugt i64 %25, 10
  br i1 %26, label %27, label %35

; <label>:27:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleAnys, i64 0, i64 4)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleAnys, i64 0, i64 4)
  %29 = load i32, i32* %7, align 4
  %30 = sext i32 %29 to i64
  %31 = mul i64 %30, 8
  %32 = trunc i64 %31 to i32
  %33 = call i8* @_TIFFmalloc(i32 %32)
  %34 = bitcast i8* %33 to double*
  store double* %34, double** %10, align 8
  br label %35

; <label>:35:                                     ; preds = %27, %22
  %36 = load %struct.tiff*, %struct.tiff** %4, align 8
  %37 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %38 = load double*, double** %10, align 8
  %39 = call i32 @TIFFFetchAnyArray(%struct.tiff* %36, %struct.TIFFDirEntry* %37, double* %38)
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %80

; <label>:41:                                     ; preds = %35
  store i32 1, i32* %11, align 4
  br label %42

; <label>:42:                                     ; preds = %70, %41
  %43 = load i32, i32* %11, align 4
  %44 = load i32, i32* %7, align 4
  %45 = icmp slt i32 %43, %44
  br i1 %45, label %46, label %74

; <label>:46:                                     ; preds = %42
  %47 = load double*, double** %10, align 8
  %48 = load i32, i32* %11, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds double, double* %47, i64 %49
  %51 = load double, double* %50, align 8
  %52 = load double*, double** %10, align 8
  %53 = getelementptr inbounds double, double* %52, i64 0
  %54 = load double, double* %53, align 8
  %55 = fcmp une double %51, %54
  br i1 %55, label %56, label %69

; <label>:56:                                     ; preds = %46
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleAnys, i64 0, i64 6)
  %57 = add i64 %pgocount1, 1
  store i64 %57, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleAnys, i64 0, i64 6)
  %58 = load %struct.tiff*, %struct.tiff** %4, align 8
  %59 = getelementptr inbounds %struct.tiff, %struct.tiff* %58, i32 0, i32 0
  %60 = load i8*, i8** %59, align 8
  %61 = load %struct.tiff*, %struct.tiff** %4, align 8
  %62 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %63 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %62, i32 0, i32 0
  %64 = load i16, i16* %63, align 4
  %65 = zext i16 %64 to i32
  %66 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %61, i32 %65)
  %67 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %66, i32 0, i32 7
  %68 = load i8*, i8** %67, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %60, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.23, i32 0, i32 0), i8* %68)
  br label %82

; <label>:69:                                     ; preds = %46
  br label %70

; <label>:70:                                     ; preds = %69
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleAnys, i64 0, i64 0)
  %71 = add i64 %pgocount2, 1
  store i64 %71, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleAnys, i64 0, i64 0)
  %72 = load i32, i32* %11, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* %11, align 4
  br label %42

; <label>:74:                                     ; preds = %42
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleAnys, i64 0, i64 5)
  %75 = add i64 %pgocount3, 1
  store i64 %75, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleAnys, i64 0, i64 5)
  %76 = load double*, double** %10, align 8
  %77 = getelementptr inbounds double, double* %76, i64 0
  %78 = load double, double* %77, align 8
  %79 = load double*, double** %6, align 8
  store double %78, double* %79, align 8
  store i32 1, i32* %8, align 4
  br label %80

; <label>:80:                                     ; preds = %74, %35
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleAnys, i64 0, i64 2)
  %81 = add i64 %pgocount4, 1
  store i64 %81, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleAnys, i64 0, i64 2)
  br label %82

; <label>:82:                                     ; preds = %80, %56
  %83 = load double*, double** %10, align 8
  %84 = getelementptr inbounds [10 x double], [10 x double]* %9, i32 0, i32 0
  %85 = icmp ne double* %83, %84
  br i1 %85, label %86, label %90

; <label>:86:                                     ; preds = %82
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleAnys, i64 0, i64 3)
  %87 = add i64 %pgocount5, 1
  store i64 %87, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleAnys, i64 0, i64 3)
  %88 = load double*, double** %10, align 8
  %89 = bitcast double* %88 to i8*
  call void @_TIFFfree(i8* %89)
  br label %90

; <label>:90:                                     ; preds = %86, %82
  br label %91

; <label>:91:                                     ; preds = %90, %3
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleAnys, i64 0, i64 1)
  %92 = add i64 %pgocount6, 1
  store i64 %92, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchPerSampleAnys, i64 0, i64 1)
  %93 = load i32, i32* %8, align 4
  ret i32 %93
}

; Function Attrs: nounwind uwtable
define internal i32 @TIFFFetchStripThing(%struct.tiff*, %struct.TIFFDirEntry*, i64, i32**) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca %struct.TIFFDirEntry*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32**, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i16*, align 8
  %13 = alloca i16*, align 8
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %7, align 8
  store i64 %2, i64* %8, align 8
  store i32** %3, i32*** %9, align 8
  %14 = load %struct.tiff*, %struct.tiff** %6, align 8
  %15 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %16 = load i64, i64* %8, align 8
  %17 = trunc i64 %16 to i32
  %18 = call i32 @CheckDirCount(%struct.tiff* %14, %struct.TIFFDirEntry* %15, i32 %17)
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TIFFFetchStripThing, i64 0, i64 1)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TIFFFetchStripThing, i64 0, i64 1)
  store i32 0, i32* %5, align 4
  br label %94

; <label>:22:                                     ; preds = %4
  %23 = load i32**, i32*** %9, align 8
  %24 = load i32*, i32** %23, align 8
  %25 = icmp eq i32* %24, null
  br i1 %25, label %26, label %38

; <label>:26:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TIFFFetchStripThing, i64 0, i64 3)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TIFFFetchStripThing, i64 0, i64 3)
  %28 = load %struct.tiff*, %struct.tiff** %6, align 8
  %29 = load i64, i64* %8, align 8
  %30 = mul i64 %29, 4
  %31 = trunc i64 %30 to i32
  %32 = call i8* @CheckMalloc(%struct.tiff* %28, i32 %31, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.25, i32 0, i32 0))
  %33 = bitcast i8* %32 to i32*
  %34 = load i32**, i32*** %9, align 8
  store i32* %33, i32** %34, align 8
  %35 = icmp eq i32* %33, null
  br i1 %35, label %36, label %38

; <label>:36:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TIFFFetchStripThing, i64 0, i64 7)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TIFFFetchStripThing, i64 0, i64 7)
  store i32 0, i32* %5, align 4
  br label %94

; <label>:38:                                     ; preds = %26, %22
  %39 = load i32**, i32*** %9, align 8
  %40 = load i32*, i32** %39, align 8
  store i32* %40, i32** %10, align 8
  %41 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %42 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %41, i32 0, i32 1
  %43 = load i16, i16* %42, align 2
  %44 = zext i16 %43 to i32
  %45 = icmp eq i32 %44, 3
  br i1 %45, label %46, label %86

; <label>:46:                                     ; preds = %38
  %47 = load %struct.tiff*, %struct.tiff** %6, align 8
  %48 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %49 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %48, i32 0, i32 2
  %50 = load i32, i32* %49, align 4
  %51 = zext i32 %50 to i64
  %52 = mul i64 %51, 2
  %53 = trunc i64 %52 to i32
  %54 = call i8* @CheckMalloc(%struct.tiff* %47, i32 %53, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.26, i32 0, i32 0))
  %55 = bitcast i8* %54 to i16*
  store i16* %55, i16** %12, align 8
  %56 = load i16*, i16** %12, align 8
  %57 = icmp eq i16* %56, null
  br i1 %57, label %58, label %60

; <label>:58:                                     ; preds = %46
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TIFFFetchStripThing, i64 0, i64 5)
  %59 = add i64 %pgocount3, 1
  store i64 %59, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TIFFFetchStripThing, i64 0, i64 5)
  store i32 0, i32* %5, align 4
  br label %94

; <label>:60:                                     ; preds = %46
  %61 = load %struct.tiff*, %struct.tiff** %6, align 8
  %62 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %63 = load i16*, i16** %12, align 8
  %64 = call i32 @TIFFFetchShortArray(%struct.tiff* %61, %struct.TIFFDirEntry* %62, i16* %63)
  store i32 %64, i32* %11, align 4
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %66, label %82

; <label>:66:                                     ; preds = %60
  %67 = load i16*, i16** %12, align 8
  store i16* %67, i16** %13, align 8
  br label %68

; <label>:68:                                     ; preds = %72, %66
  %69 = load i64, i64* %8, align 8
  %70 = add nsw i64 %69, -1
  store i64 %70, i64* %8, align 8
  %71 = icmp sgt i64 %69, 0
  br i1 %71, label %72, label %80

; <label>:72:                                     ; preds = %68
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TIFFFetchStripThing, i64 0, i64 0)
  %73 = add i64 %pgocount4, 1
  store i64 %73, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TIFFFetchStripThing, i64 0, i64 0)
  %74 = load i16*, i16** %13, align 8
  %75 = getelementptr inbounds i16, i16* %74, i32 1
  store i16* %75, i16** %13, align 8
  %76 = load i16, i16* %74, align 2
  %77 = zext i16 %76 to i32
  %78 = load i32*, i32** %10, align 8
  %79 = getelementptr inbounds i32, i32* %78, i32 1
  store i32* %79, i32** %10, align 8
  store i32 %77, i32* %78, align 4
  br label %68

; <label>:80:                                     ; preds = %68
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TIFFFetchStripThing, i64 0, i64 6)
  %81 = add i64 %pgocount5, 1
  store i64 %81, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TIFFFetchStripThing, i64 0, i64 6)
  br label %82

; <label>:82:                                     ; preds = %80, %60
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TIFFFetchStripThing, i64 0, i64 4)
  %83 = add i64 %pgocount6, 1
  store i64 %83, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TIFFFetchStripThing, i64 0, i64 4)
  %84 = load i16*, i16** %12, align 8
  %85 = bitcast i16* %84 to i8*
  call void @_TIFFfree(i8* %85)
  br label %92

; <label>:86:                                     ; preds = %38
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TIFFFetchStripThing, i64 0, i64 2)
  %87 = add i64 %pgocount7, 1
  store i64 %87, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_TIFFFetchStripThing, i64 0, i64 2)
  %88 = load %struct.tiff*, %struct.tiff** %6, align 8
  %89 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %90 = load i32*, i32** %10, align 8
  %91 = call i32 @TIFFFetchLongArray(%struct.tiff* %88, %struct.TIFFDirEntry* %89, i32* %90)
  store i32 %91, i32* %11, align 4
  br label %92

; <label>:92:                                     ; preds = %86, %82
  %93 = load i32, i32* %11, align 4
  store i32 %93, i32* %5, align 4
  br label %94

; <label>:94:                                     ; preds = %92, %58, %36, %20
  %95 = load i32, i32* %5, align 4
  ret i32 %95
}

; Function Attrs: nounwind uwtable
define internal i32 @TIFFFetchData(%struct.tiff*, %struct.TIFFDirEntry*, i8*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca %struct.TIFFDirEntry*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %6, align 8
  store i8* %2, i8** %7, align 8
  %10 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %11 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %10, i32 0, i32 1
  %12 = load i16, i16* %11, align 2
  %13 = zext i16 %12 to i64
  %14 = getelementptr inbounds [0 x i32], [0 x i32]* @tiffDataWidth, i64 0, i64 %13
  %15 = load i32, i32* %14, align 4
  store i32 %15, i32* %8, align 4
  %16 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %17 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %16, i32 0, i32 2
  %18 = load i32, i32* %17, align 4
  %19 = load i32, i32* %8, align 4
  %20 = mul i32 %18, %19
  store i32 %20, i32* %9, align 4
  %21 = load %struct.tiff*, %struct.tiff** %5, align 8
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %21, i32 0, i32 3
  %23 = load i32, i32* %22, align 8
  %24 = and i32 %23, 2048
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %61, label %26

; <label>:26:                                     ; preds = %3
  %27 = load %struct.tiff*, %struct.tiff** %5, align 8
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %27, i32 0, i32 51
  %29 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %28, align 8
  %30 = load %struct.tiff*, %struct.tiff** %5, align 8
  %31 = getelementptr inbounds %struct.tiff, %struct.tiff* %30, i32 0, i32 48
  %32 = load i8*, i8** %31, align 8
  %33 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %34 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %33, i32 0, i32 3
  %35 = load i32, i32* %34, align 4
  %36 = ptrtoint i32 (i8*, i32, i32)* %29 to i64
  call void @__llvm_profile_instrument_target(i64 %36, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchData to i8*), i32 0)
  %37 = call i32 %29(i8* %32, i32 %35, i32 0)
  %38 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %39 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %38, i32 0, i32 3
  %40 = load i32, i32* %39, align 4
  %41 = icmp eq i32 %37, %40
  br i1 %41, label %44, label %42

; <label>:42:                                     ; preds = %26
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 4)
  %43 = add i64 %pgocount, 1
  store i64 %43, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 4)
  br label %137

; <label>:44:                                     ; preds = %26
  %45 = load %struct.tiff*, %struct.tiff** %5, align 8
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %45, i32 0, i32 49
  %47 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %46, align 8
  %48 = load %struct.tiff*, %struct.tiff** %5, align 8
  %49 = getelementptr inbounds %struct.tiff, %struct.tiff* %48, i32 0, i32 48
  %50 = load i8*, i8** %49, align 8
  %51 = load i8*, i8** %7, align 8
  %52 = load i32, i32* %9, align 4
  %53 = ptrtoint i32 (i8*, i8*, i32)* %47 to i64
  call void @__llvm_profile_instrument_target(i64 %53, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFFetchData to i8*), i32 1)
  %54 = call i32 %47(i8* %50, i8* %51, i32 %52)
  %55 = load i32, i32* %9, align 4
  %56 = icmp eq i32 %54, %55
  br i1 %56, label %59, label %57

; <label>:57:                                     ; preds = %44
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 8)
  %58 = add i64 %pgocount4, 1
  store i64 %58, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 8)
  br label %137

; <label>:59:                                     ; preds = %44
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 9)
  %60 = add i64 %pgocount5, 1
  store i64 %60, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 9)
  br label %85

; <label>:61:                                     ; preds = %3
  %62 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %63 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %62, i32 0, i32 3
  %64 = load i32, i32* %63, align 4
  %65 = load i32, i32* %9, align 4
  %66 = add i32 %64, %65
  %67 = load %struct.tiff*, %struct.tiff** %5, align 8
  %68 = getelementptr inbounds %struct.tiff, %struct.tiff* %67, i32 0, i32 45
  %69 = load i32, i32* %68, align 8
  %70 = icmp sgt i32 %66, %69
  br i1 %70, label %71, label %73

; <label>:71:                                     ; preds = %61
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 5)
  %72 = add i64 %pgocount6, 1
  store i64 %72, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 5)
  br label %137

; <label>:73:                                     ; preds = %61
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 6)
  %74 = add i64 %pgocount7, 1
  store i64 %74, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 6)
  %75 = load i8*, i8** %7, align 8
  %76 = load %struct.tiff*, %struct.tiff** %5, align 8
  %77 = getelementptr inbounds %struct.tiff, %struct.tiff* %76, i32 0, i32 44
  %78 = load i8*, i8** %77, align 8
  %79 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %80 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %79, i32 0, i32 3
  %81 = load i32, i32* %80, align 4
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds i8, i8* %78, i64 %82
  %84 = load i32, i32* %9, align 4
  call void @_TIFFmemcpy(i8* %75, i8* %83, i32 %84)
  br label %85

; <label>:85:                                     ; preds = %73, %59
  %86 = load %struct.tiff*, %struct.tiff** %5, align 8
  %87 = getelementptr inbounds %struct.tiff, %struct.tiff* %86, i32 0, i32 3
  %88 = load i32, i32* %87, align 8
  %89 = and i32 %88, 128
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %135

; <label>:91:                                     ; preds = %85
  %92 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %93 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %92, i32 0, i32 1
  %94 = load i16, i16* %93, align 2
  %95 = zext i16 %94 to i32
  switch i32 %95, label %133 [
    i32 3, label %._crit_edge
    i32 8, label %100
    i32 4, label %._crit_edge1
    i32 9, label %._crit_edge2
    i32 11, label %108
    i32 5, label %._crit_edge3
    i32 10, label %116
    i32 12, label %125
  ]

._crit_edge3:                                     ; preds = %91
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 3)
  %96 = add i64 %pgocount8, 1
  store i64 %96, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 3)
  br label %116

._crit_edge2:                                     ; preds = %91
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 2)
  %97 = add i64 %pgocount9, 1
  store i64 %97, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 2)
  br label %108

._crit_edge1:                                     ; preds = %91
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 1)
  %98 = add i64 %pgocount10, 1
  store i64 %98, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 1)
  br label %108

._crit_edge:                                      ; preds = %91
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 0)
  %99 = add i64 %pgocount11, 1
  store i64 %99, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 0)
  br label %100

; <label>:100:                                    ; preds = %._crit_edge, %91
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 11)
  %101 = add i64 %pgocount12, 1
  store i64 %101, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 11)
  %102 = load i8*, i8** %7, align 8
  %103 = bitcast i8* %102 to i16*
  %104 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %105 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %104, i32 0, i32 2
  %106 = load i32, i32* %105, align 4
  %107 = zext i32 %106 to i64
  call void @TIFFSwabArrayOfShort(i16* %103, i64 %107)
  br label %133

; <label>:108:                                    ; preds = %._crit_edge1, %._crit_edge2, %91
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 10)
  %109 = add i64 %pgocount13, 1
  store i64 %109, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 10)
  %110 = load i8*, i8** %7, align 8
  %111 = bitcast i8* %110 to i32*
  %112 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %113 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %112, i32 0, i32 2
  %114 = load i32, i32* %113, align 4
  %115 = zext i32 %114 to i64
  call void @TIFFSwabArrayOfLong(i32* %111, i64 %115)
  br label %133

; <label>:116:                                    ; preds = %._crit_edge3, %91
  %pgocount14 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 12)
  %117 = add i64 %pgocount14, 1
  store i64 %117, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 12)
  %118 = load i8*, i8** %7, align 8
  %119 = bitcast i8* %118 to i32*
  %120 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %121 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %120, i32 0, i32 2
  %122 = load i32, i32* %121, align 4
  %123 = mul i32 2, %122
  %124 = zext i32 %123 to i64
  call void @TIFFSwabArrayOfLong(i32* %119, i64 %124)
  br label %133

; <label>:125:                                    ; preds = %91
  %pgocount15 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 13)
  %126 = add i64 %pgocount15, 1
  store i64 %126, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 13)
  %127 = load i8*, i8** %7, align 8
  %128 = bitcast i8* %127 to double*
  %129 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %130 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %129, i32 0, i32 2
  %131 = load i32, i32* %130, align 4
  %132 = zext i32 %131 to i64
  call void @TIFFSwabArrayOfDouble(double* %128, i64 %132)
  br label %133

; <label>:133:                                    ; preds = %125, %116, %108, %100, %91
  %pgocount16 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 7)
  %134 = add i64 %pgocount16, 1
  store i64 %134, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFFetchData, i64 0, i64 7)
  br label %135

; <label>:135:                                    ; preds = %133, %85
  %136 = load i32, i32* %9, align 4
  store i32 %136, i32* %4, align 4
  br label %149

; <label>:137:                                    ; preds = %71, %57, %42
  %138 = load %struct.tiff*, %struct.tiff** %5, align 8
  %139 = getelementptr inbounds %struct.tiff, %struct.tiff* %138, i32 0, i32 0
  %140 = load i8*, i8** %139, align 8
  %141 = load %struct.tiff*, %struct.tiff** %5, align 8
  %142 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %143 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %142, i32 0, i32 0
  %144 = load i16, i16* %143, align 4
  %145 = zext i16 %144 to i32
  %146 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %141, i32 %145)
  %147 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %146, i32 0, i32 7
  %148 = load i8*, i8** %147, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %140, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.20, i32 0, i32 0), i8* %148)
  store i32 0, i32* %4, align 4
  br label %149

; <label>:149:                                    ; preds = %137, %135
  %150 = load i32, i32* %4, align 4
  ret i32 %150
}

declare void @_TIFFfree(i8*) #1

; Function Attrs: nounwind uwtable
define internal i32 @TIFFFetchShortPair(%struct.tiff*, %struct.TIFFDirEntry*) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.TIFFDirEntry*, align 8
  %5 = alloca [2 x i16], align 2
  %6 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %4, align 8
  store i32 0, i32* %6, align 4
  %7 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %8 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %7, i32 0, i32 1
  %9 = load i16, i16* %8, align 2
  %10 = zext i16 %9 to i32
  switch i32 %10, label %25 [
    i32 3, label %._crit_edge
    i32 8, label %13
    i32 1, label %._crit_edge1
    i32 6, label %19
  ]

._crit_edge1:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFFetchShortPair, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFFetchShortPair, i64 0, i64 1)
  br label %19

._crit_edge:                                      ; preds = %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFFetchShortPair, i64 0, i64 0)
  %12 = add i64 %pgocount2, 1
  store i64 %12, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFFetchShortPair, i64 0, i64 0)
  br label %13

; <label>:13:                                     ; preds = %._crit_edge, %2
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFFetchShortPair, i64 0, i64 4)
  %14 = add i64 %pgocount3, 1
  store i64 %14, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFFetchShortPair, i64 0, i64 4)
  %15 = load %struct.tiff*, %struct.tiff** %3, align 8
  %16 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %17 = getelementptr inbounds [2 x i16], [2 x i16]* %5, i32 0, i32 0
  %18 = call i32 @TIFFFetchShortArray(%struct.tiff* %15, %struct.TIFFDirEntry* %16, i16* %17)
  store i32 %18, i32* %6, align 4
  br label %25

; <label>:19:                                     ; preds = %._crit_edge1, %2
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFFetchShortPair, i64 0, i64 5)
  %20 = add i64 %pgocount4, 1
  store i64 %20, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFFetchShortPair, i64 0, i64 5)
  %21 = load %struct.tiff*, %struct.tiff** %3, align 8
  %22 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %23 = getelementptr inbounds [2 x i16], [2 x i16]* %5, i32 0, i32 0
  %24 = call i32 @TIFFFetchByteArray(%struct.tiff* %21, %struct.TIFFDirEntry* %22, i16* %23)
  store i32 %24, i32* %6, align 4
  br label %25

; <label>:25:                                     ; preds = %19, %13, %2
  %26 = load i32, i32* %6, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %42

; <label>:28:                                     ; preds = %25
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFFetchShortPair, i64 0, i64 3)
  %29 = add i64 %pgocount5, 1
  store i64 %29, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFFetchShortPair, i64 0, i64 3)
  %30 = load %struct.tiff*, %struct.tiff** %3, align 8
  %31 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %32 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %31, i32 0, i32 0
  %33 = load i16, i16* %32, align 4
  %34 = zext i16 %33 to i32
  %35 = getelementptr inbounds [2 x i16], [2 x i16]* %5, i64 0, i64 0
  %36 = load i16, i16* %35, align 2
  %37 = zext i16 %36 to i32
  %38 = getelementptr inbounds [2 x i16], [2 x i16]* %5, i64 0, i64 1
  %39 = load i16, i16* %38, align 2
  %40 = zext i16 %39 to i32
  %41 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %30, i32 %34, i32 %37, i32 %40)
  br label %42

; <label>:42:                                     ; preds = %28, %25
  %pgocount6 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFFetchShortPair, i64 0, i64 2)
  %43 = add i64 %pgocount6, 1
  store i64 %43, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFFetchShortPair, i64 0, i64 2)
  %44 = load i32, i32* %6, align 4
  ret i32 %44
}

; Function Attrs: nounwind uwtable
define internal i32 @TIFFFetchRefBlackWhite(%struct.tiff*, %struct.TIFFDirEntry*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca %struct.TIFFDirEntry*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca float*, align 8
  %9 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %5, align 8
  %10 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %11 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %10, i32 0, i32 1
  %12 = load i16, i16* %11, align 2
  %13 = zext i16 %12 to i32
  %14 = icmp eq i32 %13, 5
  br i1 %14, label %15, label %20

; <label>:15:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchRefBlackWhite, i64 0, i64 1)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchRefBlackWhite, i64 0, i64 1)
  %17 = load %struct.tiff*, %struct.tiff** %4, align 8
  %18 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %19 = call i32 @TIFFFetchNormalTag(%struct.tiff* %17, %struct.TIFFDirEntry* %18)
  store i32 %19, i32* %3, align 4
  br label %102

; <label>:20:                                     ; preds = %2
  %21 = load %struct.tiff*, %struct.tiff** %4, align 8
  %22 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %23 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %22, i32 0, i32 2
  %24 = load i32, i32* %23, align 4
  %25 = zext i32 %24 to i64
  %26 = mul i64 %25, 4
  %27 = trunc i64 %26 to i32
  %28 = call i8* @CheckMalloc(%struct.tiff* %21, i32 %27, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @TIFFFetchRefBlackWhite.mesg, i32 0, i32 0))
  store i8* %28, i8** %6, align 8
  %29 = load i8*, i8** %6, align 8
  %30 = icmp ne i8* %29, null
  br i1 %30, label %31, label %39

; <label>:31:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchRefBlackWhite, i64 0, i64 3)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchRefBlackWhite, i64 0, i64 3)
  %33 = load %struct.tiff*, %struct.tiff** %4, align 8
  %34 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %35 = load i8*, i8** %6, align 8
  %36 = bitcast i8* %35 to i32*
  %37 = call i32 @TIFFFetchLongArray(%struct.tiff* %33, %struct.TIFFDirEntry* %34, i32* %36)
  %38 = icmp ne i32 %37, 0
  br label %39

; <label>:39:                                     ; preds = %31, %20
  %40 = phi i1 [ false, %20 ], [ %38, %31 ]
  %41 = zext i1 %40 to i32
  store i32 %41, i32* %7, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %93

; <label>:43:                                     ; preds = %39
  %44 = load %struct.tiff*, %struct.tiff** %4, align 8
  %45 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %46 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %45, i32 0, i32 2
  %47 = load i32, i32* %46, align 4
  %48 = zext i32 %47 to i64
  %49 = mul i64 %48, 4
  %50 = trunc i64 %49 to i32
  %51 = call i8* @CheckMalloc(%struct.tiff* %44, i32 %50, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @TIFFFetchRefBlackWhite.mesg, i32 0, i32 0))
  %52 = bitcast i8* %51 to float*
  store float* %52, float** %8, align 8
  %53 = load float*, float** %8, align 8
  %54 = icmp ne float* %53, null
  %55 = zext i1 %54 to i32
  store i32 %55, i32* %7, align 4
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %91

; <label>:57:                                     ; preds = %43
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchRefBlackWhite, i64 0, i64 6)
  %58 = add i64 %pgocount2, 1
  store i64 %58, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchRefBlackWhite, i64 0, i64 6)
  store i32 0, i32* %9, align 4
  br label %59

; <label>:59:                                     ; preds = %77, %57
  %60 = load i32, i32* %9, align 4
  %61 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %62 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %61, i32 0, i32 2
  %63 = load i32, i32* %62, align 4
  %64 = icmp ult i32 %60, %63
  br i1 %64, label %65, label %81

; <label>:65:                                     ; preds = %59
  %66 = load i8*, i8** %6, align 8
  %67 = bitcast i8* %66 to i32*
  %68 = load i32, i32* %9, align 4
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32* %67, i64 %69
  %71 = load i32, i32* %70, align 4
  %72 = uitofp i32 %71 to float
  %73 = load float*, float** %8, align 8
  %74 = load i32, i32* %9, align 4
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds float, float* %73, i64 %75
  store float %72, float* %76, align 4
  br label %77

; <label>:77:                                     ; preds = %65
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchRefBlackWhite, i64 0, i64 0)
  %78 = add i64 %pgocount3, 1
  store i64 %78, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchRefBlackWhite, i64 0, i64 0)
  %79 = load i32, i32* %9, align 4
  %80 = add i32 %79, 1
  store i32 %80, i32* %9, align 4
  br label %59

; <label>:81:                                     ; preds = %59
  %82 = load %struct.tiff*, %struct.tiff** %4, align 8
  %83 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %84 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %83, i32 0, i32 0
  %85 = load i16, i16* %84, align 4
  %86 = zext i16 %85 to i32
  %87 = load float*, float** %8, align 8
  %88 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %82, i32 %86, float* %87)
  store i32 %88, i32* %7, align 4
  %89 = load float*, float** %8, align 8
  %90 = bitcast float* %89 to i8*
  call void @_TIFFfree(i8* %90)
  br label %91

; <label>:91:                                     ; preds = %81, %43
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchRefBlackWhite, i64 0, i64 4)
  %92 = add i64 %pgocount4, 1
  store i64 %92, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchRefBlackWhite, i64 0, i64 4)
  br label %93

; <label>:93:                                     ; preds = %91, %39
  %94 = load i8*, i8** %6, align 8
  %95 = icmp ne i8* %94, null
  br i1 %95, label %96, label %99

; <label>:96:                                     ; preds = %93
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchRefBlackWhite, i64 0, i64 5)
  %97 = add i64 %pgocount5, 1
  store i64 %97, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchRefBlackWhite, i64 0, i64 5)
  %98 = load i8*, i8** %6, align 8
  call void @_TIFFfree(i8* %98)
  br label %99

; <label>:99:                                     ; preds = %96, %93
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchRefBlackWhite, i64 0, i64 2)
  %100 = add i64 %pgocount6, 1
  store i64 %100, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchRefBlackWhite, i64 0, i64 2)
  %101 = load i32, i32* %7, align 4
  store i32 %101, i32* %3, align 4
  br label %102

; <label>:102:                                    ; preds = %99, %15
  %103 = load i32, i32* %3, align 4
  ret i32 %103
}

declare %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff*, i32) #1

; Function Attrs: nounwind uwtable
define internal void @EstimateStripByteCounts(%struct.tiff*, %struct.TIFFDirEntry*, i16 zeroext) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca %struct.TIFFDirEntry*, align 8
  %6 = alloca i16, align 2
  %7 = alloca %struct.TIFFDirEntry*, align 8
  %8 = alloca %struct.TIFFDirectory*, align 8
  %9 = alloca i16, align 2
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i16, align 2
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %5, align 8
  store i16 %2, i16* %6, align 2
  %16 = load %struct.tiff*, %struct.tiff** %4, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %16, i32 0, i32 6
  store %struct.TIFFDirectory* %17, %struct.TIFFDirectory** %8, align 8
  %18 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %19 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %18, i32 0, i32 45
  %20 = load i32*, i32** %19, align 8
  %21 = icmp ne i32* %20, null
  br i1 %21, label %22, label %28

; <label>:22:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 4)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 4)
  %24 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %25 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %24, i32 0, i32 45
  %26 = load i32*, i32** %25, align 8
  %27 = bitcast i32* %26 to i8*
  call void @_TIFFfree(i8* %27)
  br label %28

; <label>:28:                                     ; preds = %22, %3
  %29 = load %struct.tiff*, %struct.tiff** %4, align 8
  %30 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %31 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %30, i32 0, i32 43
  %32 = load i32, i32* %31, align 4
  %33 = zext i32 %32 to i64
  %34 = mul i64 %33, 4
  %35 = trunc i64 %34 to i32
  %36 = call i8* @CheckMalloc(%struct.tiff* %29, i32 %35, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.17, i32 0, i32 0))
  %37 = bitcast i8* %36 to i32*
  %38 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %39 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %38, i32 0, i32 45
  store i32* %37, i32** %39, align 8
  %40 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %41 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %40, i32 0, i32 10
  %42 = load i16, i16* %41, align 8
  %43 = zext i16 %42 to i32
  %44 = icmp ne i32 %43, 1
  br i1 %44, label %45, label %168

; <label>:45:                                     ; preds = %28
  %46 = load i16, i16* %6, align 2
  %47 = zext i16 %46 to i64
  %48 = mul i64 %47, 12
  %49 = add i64 10, %48
  %50 = add i64 %49, 4
  %51 = trunc i64 %50 to i32
  store i32 %51, i32* %10, align 4
  %52 = load %struct.tiff*, %struct.tiff** %4, align 8
  %53 = getelementptr inbounds %struct.tiff, %struct.tiff* %52, i32 0, i32 53
  %54 = load i32 (i8*)*, i32 (i8*)** %53, align 8
  %55 = load %struct.tiff*, %struct.tiff** %4, align 8
  %56 = getelementptr inbounds %struct.tiff, %struct.tiff* %55, i32 0, i32 48
  %57 = load i8*, i8** %56, align 8
  %58 = ptrtoint i32 (i8*)* %54 to i64
  call void @__llvm_profile_instrument_target(i64 %58, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_EstimateStripByteCounts to i8*), i32 0)
  %59 = call i32 %54(i8* %57)
  store i32 %59, i32* %11, align 4
  %60 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  store %struct.TIFFDirEntry* %60, %struct.TIFFDirEntry** %7, align 8
  %61 = load i16, i16* %6, align 2
  store i16 %61, i16* %12, align 2
  br label %62

; <label>:62:                                     ; preds = %86, %45
  %63 = load i16, i16* %12, align 2
  %64 = zext i16 %63 to i32
  %65 = icmp sgt i32 %64, 0
  br i1 %65, label %66, label %92

; <label>:66:                                     ; preds = %62
  %67 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %68 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %67, i32 0, i32 2
  %69 = load i32, i32* %68, align 4
  %70 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %71 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %70, i32 0, i32 1
  %72 = load i16, i16* %71, align 2
  %73 = zext i16 %72 to i64
  %74 = getelementptr inbounds [0 x i32], [0 x i32]* @tiffDataWidth, i64 0, i64 %73
  %75 = load i32, i32* %74, align 4
  %76 = mul i32 %69, %75
  store i32 %76, i32* %13, align 4
  %77 = load i32, i32* %13, align 4
  %78 = zext i32 %77 to i64
  %79 = icmp ugt i64 %78, 4
  br i1 %79, label %80, label %85

; <label>:80:                                     ; preds = %66
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 3)
  %81 = add i64 %pgocount1, 1
  store i64 %81, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 3)
  %82 = load i32, i32* %13, align 4
  %83 = load i32, i32* %10, align 4
  %84 = add i32 %83, %82
  store i32 %84, i32* %10, align 4
  br label %85

; <label>:85:                                     ; preds = %80, %66
  br label %86

; <label>:86:                                     ; preds = %85
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 0)
  %87 = add i64 %pgocount2, 1
  store i64 %87, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 0)
  %88 = load i16, i16* %12, align 2
  %89 = add i16 %88, -1
  store i16 %89, i16* %12, align 2
  %90 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %91 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %90, i32 1
  store %struct.TIFFDirEntry* %91, %struct.TIFFDirEntry** %7, align 8
  br label %62

; <label>:92:                                     ; preds = %62
  %93 = load i32, i32* %11, align 4
  %94 = load i32, i32* %10, align 4
  %95 = sub i32 %93, %94
  store i32 %95, i32* %10, align 4
  %96 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %97 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %96, i32 0, i32 24
  %98 = load i16, i16* %97, align 2
  %99 = zext i16 %98 to i32
  %100 = icmp eq i32 %99, 2
  br i1 %100, label %101, label %109

; <label>:101:                                    ; preds = %92
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 8)
  %102 = add i64 %pgocount3, 1
  store i64 %102, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 8)
  %103 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %104 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %103, i32 0, i32 15
  %105 = load i16, i16* %104, align 2
  %106 = zext i16 %105 to i32
  %107 = load i32, i32* %10, align 4
  %108 = udiv i32 %107, %106
  store i32 %108, i32* %10, align 4
  br label %109

; <label>:109:                                    ; preds = %101, %92
  store i16 0, i16* %9, align 2
  br label %110

; <label>:110:                                    ; preds = %125, %109
  %111 = load i16, i16* %9, align 2
  %112 = zext i16 %111 to i32
  %113 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %114 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %113, i32 0, i32 43
  %115 = load i32, i32* %114, align 4
  %116 = icmp ult i32 %112, %115
  br i1 %116, label %117, label %129

; <label>:117:                                    ; preds = %110
  %118 = load i32, i32* %10, align 4
  %119 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %120 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %119, i32 0, i32 45
  %121 = load i32*, i32** %120, align 8
  %122 = load i16, i16* %9, align 2
  %123 = zext i16 %122 to i64
  %124 = getelementptr inbounds i32, i32* %121, i64 %123
  store i32 %118, i32* %124, align 4
  br label %125

; <label>:125:                                    ; preds = %117
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 1)
  %126 = add i64 %pgocount4, 1
  store i64 %126, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 1)
  %127 = load i16, i16* %9, align 2
  %128 = add i16 %127, 1
  store i16 %128, i16* %9, align 2
  br label %110

; <label>:129:                                    ; preds = %110
  %130 = load i16, i16* %9, align 2
  %131 = add i16 %130, -1
  store i16 %131, i16* %9, align 2
  %132 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %133 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %132, i32 0, i32 44
  %134 = load i32*, i32** %133, align 8
  %135 = load i16, i16* %9, align 2
  %136 = zext i16 %135 to i64
  %137 = getelementptr inbounds i32, i32* %134, i64 %136
  %138 = load i32, i32* %137, align 4
  %139 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %140 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %139, i32 0, i32 45
  %141 = load i32*, i32** %140, align 8
  %142 = load i16, i16* %9, align 2
  %143 = zext i16 %142 to i64
  %144 = getelementptr inbounds i32, i32* %141, i64 %143
  %145 = load i32, i32* %144, align 4
  %146 = add i32 %138, %145
  %147 = load i32, i32* %11, align 4
  %148 = icmp sgt i32 %146, %147
  br i1 %148, label %149, label %166

; <label>:149:                                    ; preds = %129
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 9)
  %150 = add i64 %pgocount5, 1
  store i64 %150, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 9)
  %151 = load i32, i32* %11, align 4
  %152 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %153 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %152, i32 0, i32 44
  %154 = load i32*, i32** %153, align 8
  %155 = load i16, i16* %9, align 2
  %156 = zext i16 %155 to i64
  %157 = getelementptr inbounds i32, i32* %154, i64 %156
  %158 = load i32, i32* %157, align 4
  %159 = sub i32 %151, %158
  %160 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %161 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %160, i32 0, i32 45
  %162 = load i32*, i32** %161, align 8
  %163 = load i16, i16* %9, align 2
  %164 = zext i16 %163 to i64
  %165 = getelementptr inbounds i32, i32* %162, i64 %164
  store i32 %159, i32* %165, align 4
  br label %166

; <label>:166:                                    ; preds = %149, %129
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 5)
  %167 = add i64 %pgocount6, 1
  store i64 %167, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 5)
  br label %201

; <label>:168:                                    ; preds = %28
  %169 = load %struct.tiff*, %struct.tiff** %4, align 8
  %170 = call i32 @TIFFScanlineSize(%struct.tiff* %169)
  store i32 %170, i32* %14, align 4
  %171 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %172 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %171, i32 0, i32 2
  %173 = load i32, i32* %172, align 4
  %174 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %175 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %174, i32 0, i32 42
  %176 = load i32, i32* %175, align 8
  %177 = udiv i32 %173, %176
  store i32 %177, i32* %15, align 4
  store i16 0, i16* %9, align 2
  br label %178

; <label>:178:                                    ; preds = %195, %168
  %179 = load i16, i16* %9, align 2
  %180 = zext i16 %179 to i32
  %181 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %182 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %181, i32 0, i32 43
  %183 = load i32, i32* %182, align 4
  %184 = icmp ult i32 %180, %183
  br i1 %184, label %185, label %199

; <label>:185:                                    ; preds = %178
  %186 = load i32, i32* %14, align 4
  %187 = load i32, i32* %15, align 4
  %188 = mul i32 %186, %187
  %189 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %190 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %189, i32 0, i32 45
  %191 = load i32*, i32** %190, align 8
  %192 = load i16, i16* %9, align 2
  %193 = zext i16 %192 to i64
  %194 = getelementptr inbounds i32, i32* %191, i64 %193
  store i32 %188, i32* %194, align 4
  br label %195

; <label>:195:                                    ; preds = %185
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 2)
  %196 = add i64 %pgocount7, 1
  store i64 %196, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 2)
  %197 = load i16, i16* %9, align 2
  %198 = add i16 %197, 1
  store i16 %198, i16* %9, align 2
  br label %178

; <label>:199:                                    ; preds = %178
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 6)
  %200 = add i64 %pgocount8, 1
  store i64 %200, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 6)
  br label %201

; <label>:201:                                    ; preds = %199, %166
  %202 = load %struct.tiff*, %struct.tiff** %4, align 8
  %203 = getelementptr inbounds %struct.tiff, %struct.tiff* %202, i32 0, i32 6
  %204 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %203, i32 0, i32 0
  %205 = getelementptr inbounds [3 x i64], [3 x i64]* %204, i64 0, i64 0
  %206 = load i64, i64* %205, align 8
  %207 = or i64 %206, 16777216
  store i64 %207, i64* %205, align 8
  %208 = load %struct.tiff*, %struct.tiff** %4, align 8
  %209 = getelementptr inbounds %struct.tiff, %struct.tiff* %208, i32 0, i32 6
  %210 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %209, i32 0, i32 0
  %211 = getelementptr inbounds [3 x i64], [3 x i64]* %210, i64 0, i64 0
  %212 = load i64, i64* %211, align 8
  %213 = and i64 %212, 131072
  %214 = icmp ne i64 %213, 0
  br i1 %214, label %222, label %215

; <label>:215:                                    ; preds = %201
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 7)
  %216 = add i64 %pgocount9, 1
  store i64 %216, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_EstimateStripByteCounts, i64 0, i64 7)
  %217 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %218 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %217, i32 0, i32 2
  %219 = load i32, i32* %218, align 4
  %220 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %221 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %220, i32 0, i32 16
  store i32 %219, i32* %221, align 4
  br label %222

; <label>:222:                                    ; preds = %215, %201
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @ChopUpSingleUncompressedStrip(%struct.tiff*) #0 {
  %2 = alloca %struct.tiff*, align 8
  %3 = alloca %struct.TIFFDirectory*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32*, align 8
  %12 = alloca i32*, align 8
  store %struct.tiff* %0, %struct.tiff** %2, align 8
  %13 = load %struct.tiff*, %struct.tiff** %2, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %13, i32 0, i32 6
  store %struct.TIFFDirectory* %14, %struct.TIFFDirectory** %3, align 8
  %15 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %16 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %15, i32 0, i32 45
  %17 = load i32*, i32** %16, align 8
  %18 = getelementptr inbounds i32, i32* %17, i64 0
  %19 = load i32, i32* %18, align 4
  store i32 %19, i32* %4, align 4
  %20 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %21 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %20, i32 0, i32 44
  %22 = load i32*, i32** %21, align 8
  %23 = getelementptr inbounds i32, i32* %22, i64 0
  %24 = load i32, i32* %23, align 4
  store i32 %24, i32* %5, align 4
  %25 = load %struct.tiff*, %struct.tiff** %2, align 8
  %26 = call i32 @TIFFVTileSize(%struct.tiff* %25, i32 1)
  store i32 %26, i32* %6, align 4
  %27 = load i32, i32* %6, align 4
  %28 = icmp sgt i32 %27, 8192
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %1
  %30 = load i32, i32* %6, align 4
  store i32 %30, i32* %7, align 4
  store i32 1, i32* %10, align 4
  br label %38

; <label>:31:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_ChopUpSingleUncompressedStrip, i64 0, i64 2)
  %32 = add i64 %pgocount, 1
  store i64 %32, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_ChopUpSingleUncompressedStrip, i64 0, i64 2)
  %33 = load i32, i32* %6, align 4
  %34 = sdiv i32 8192, %33
  store i32 %34, i32* %10, align 4
  %35 = load i32, i32* %6, align 4
  %36 = load i32, i32* %10, align 4
  %37 = mul i32 %35, %36
  store i32 %37, i32* %7, align 4
  br label %38

; <label>:38:                                     ; preds = %31, %29
  %39 = load i32, i32* %10, align 4
  %40 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %41 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %40, i32 0, i32 16
  %42 = load i32, i32* %41, align 4
  %43 = icmp uge i32 %39, %42
  br i1 %43, label %44, label %46

; <label>:44:                                     ; preds = %38
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_ChopUpSingleUncompressedStrip, i64 0, i64 3)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_ChopUpSingleUncompressedStrip, i64 0, i64 3)
  br label %146

; <label>:46:                                     ; preds = %38
  %47 = load i32, i32* %4, align 4
  %48 = load i32, i32* %7, align 4
  %49 = sub i32 %48, 1
  %50 = add i32 %47, %49
  %51 = load i32, i32* %7, align 4
  %52 = udiv i32 %50, %51
  store i32 %52, i32* %9, align 4
  %53 = load %struct.tiff*, %struct.tiff** %2, align 8
  %54 = load i32, i32* %9, align 4
  %55 = zext i32 %54 to i64
  %56 = mul i64 %55, 4
  %57 = trunc i64 %56 to i32
  %58 = call i8* @CheckMalloc(%struct.tiff* %53, i32 %57, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.27, i32 0, i32 0))
  %59 = bitcast i8* %58 to i32*
  store i32* %59, i32** %11, align 8
  %60 = load %struct.tiff*, %struct.tiff** %2, align 8
  %61 = load i32, i32* %9, align 4
  %62 = zext i32 %61 to i64
  %63 = mul i64 %62, 4
  %64 = trunc i64 %63 to i32
  %65 = call i8* @CheckMalloc(%struct.tiff* %60, i32 %64, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.28, i32 0, i32 0))
  %66 = bitcast i8* %65 to i32*
  store i32* %66, i32** %12, align 8
  %67 = load i32*, i32** %11, align 8
  %68 = icmp eq i32* %67, null
  br i1 %68, label %73, label %69

; <label>:69:                                     ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_ChopUpSingleUncompressedStrip, i64 0, i64 4)
  %70 = add i64 %pgocount2, 1
  store i64 %70, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_ChopUpSingleUncompressedStrip, i64 0, i64 4)
  %71 = load i32*, i32** %12, align 8
  %72 = icmp eq i32* %71, null
  br i1 %72, label %73, label %89

; <label>:73:                                     ; preds = %69, %46
  %74 = load i32*, i32** %11, align 8
  %75 = icmp ne i32* %74, null
  br i1 %75, label %76, label %80

; <label>:76:                                     ; preds = %73
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_ChopUpSingleUncompressedStrip, i64 0, i64 7)
  %77 = add i64 %pgocount3, 1
  store i64 %77, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_ChopUpSingleUncompressedStrip, i64 0, i64 7)
  %78 = load i32*, i32** %11, align 8
  %79 = bitcast i32* %78 to i8*
  call void @_TIFFfree(i8* %79)
  br label %80

; <label>:80:                                     ; preds = %76, %73
  %81 = load i32*, i32** %12, align 8
  %82 = icmp ne i32* %81, null
  br i1 %82, label %83, label %87

; <label>:83:                                     ; preds = %80
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_ChopUpSingleUncompressedStrip, i64 0, i64 8)
  %84 = add i64 %pgocount4, 1
  store i64 %84, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_ChopUpSingleUncompressedStrip, i64 0, i64 8)
  %85 = load i32*, i32** %12, align 8
  %86 = bitcast i32* %85 to i8*
  call void @_TIFFfree(i8* %86)
  br label %87

; <label>:87:                                     ; preds = %83, %80
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_ChopUpSingleUncompressedStrip, i64 0, i64 5)
  %88 = add i64 %pgocount5, 1
  store i64 %88, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_ChopUpSingleUncompressedStrip, i64 0, i64 5)
  br label %146

; <label>:89:                                     ; preds = %69
  store i32 0, i32* %8, align 4
  br label %90

; <label>:90:                                     ; preds = %119, %89
  %91 = load i32, i32* %8, align 4
  %92 = load i32, i32* %9, align 4
  %93 = icmp ult i32 %91, %92
  br i1 %93, label %94, label %122

; <label>:94:                                     ; preds = %90
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_ChopUpSingleUncompressedStrip, i64 0, i64 0)
  %95 = add i64 %pgocount6, 1
  store i64 %95, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_ChopUpSingleUncompressedStrip, i64 0, i64 0)
  %96 = load i32, i32* %7, align 4
  %97 = load i32, i32* %4, align 4
  %98 = icmp sgt i32 %96, %97
  br i1 %98, label %99, label %102

; <label>:99:                                     ; preds = %94
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_ChopUpSingleUncompressedStrip, i64 0, i64 1)
  %100 = add i64 %pgocount7, 1
  store i64 %100, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_ChopUpSingleUncompressedStrip, i64 0, i64 1)
  %101 = load i32, i32* %4, align 4
  store i32 %101, i32* %7, align 4
  br label %102

; <label>:102:                                    ; preds = %99, %94
  %103 = load i32, i32* %7, align 4
  %104 = load i32*, i32** %11, align 8
  %105 = load i32, i32* %8, align 4
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32* %104, i64 %106
  store i32 %103, i32* %107, align 4
  %108 = load i32, i32* %5, align 4
  %109 = load i32*, i32** %12, align 8
  %110 = load i32, i32* %8, align 4
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32* %109, i64 %111
  store i32 %108, i32* %112, align 4
  %113 = load i32, i32* %7, align 4
  %114 = load i32, i32* %5, align 4
  %115 = add i32 %114, %113
  store i32 %115, i32* %5, align 4
  %116 = load i32, i32* %7, align 4
  %117 = load i32, i32* %4, align 4
  %118 = sub i32 %117, %116
  store i32 %118, i32* %4, align 4
  br label %119

; <label>:119:                                    ; preds = %102
  %120 = load i32, i32* %8, align 4
  %121 = add i32 %120, 1
  store i32 %121, i32* %8, align 4
  br label %90

; <label>:122:                                    ; preds = %90
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_ChopUpSingleUncompressedStrip, i64 0, i64 6)
  %123 = add i64 %pgocount8, 1
  store i64 %123, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_ChopUpSingleUncompressedStrip, i64 0, i64 6)
  %124 = load i32, i32* %9, align 4
  %125 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %126 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %125, i32 0, i32 43
  store i32 %124, i32* %126, align 4
  %127 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %128 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %127, i32 0, i32 42
  store i32 %124, i32* %128, align 8
  %129 = load %struct.tiff*, %struct.tiff** %2, align 8
  %130 = load i32, i32* %10, align 4
  %131 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %129, i32 278, i32 %130)
  %132 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %133 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %132, i32 0, i32 45
  %134 = load i32*, i32** %133, align 8
  %135 = bitcast i32* %134 to i8*
  call void @_TIFFfree(i8* %135)
  %136 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %137 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %136, i32 0, i32 44
  %138 = load i32*, i32** %137, align 8
  %139 = bitcast i32* %138 to i8*
  call void @_TIFFfree(i8* %139)
  %140 = load i32*, i32** %11, align 8
  %141 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %142 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %141, i32 0, i32 45
  store i32* %140, i32** %142, align 8
  %143 = load i32*, i32** %12, align 8
  %144 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %145 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %144, i32 0, i32 44
  store i32* %143, i32** %145, align 8
  br label %146

; <label>:146:                                    ; preds = %122, %87, %44
  ret void
}

declare i32 @TIFFTileSize(%struct.tiff*) #1

declare i32 @TIFFScanlineSize(%struct.tiff*) #1

declare i8* @_TIFFmalloc(i32) #1

declare void @TIFFSwabArrayOfDouble(double*, i64) #1

; Function Attrs: nounwind uwtable
define internal i32 @TIFFFetchShortArray(%struct.tiff*, %struct.TIFFDirEntry*, i16*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca %struct.TIFFDirEntry*, align 8
  %7 = alloca i16*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %6, align 8
  store i16* %2, i16** %7, align 8
  %8 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %9 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %8, i32 0, i32 2
  %10 = load i32, i32* %9, align 4
  %11 = icmp ule i32 %10, 2
  br i1 %11, label %12, label %68

; <label>:12:                                     ; preds = %3
  %13 = load %struct.tiff*, %struct.tiff** %5, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %13, i32 0, i32 7
  %15 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %14, i32 0, i32 0
  %16 = load i16, i16* %15, align 8
  %17 = zext i16 %16 to i32
  %18 = icmp eq i32 %17, 19789
  br i1 %18, label %19, label %43

; <label>:19:                                     ; preds = %12
  %20 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %21 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %20, i32 0, i32 2
  %22 = load i32, i32* %21, align 4
  switch i32 %22, label %41 [
    i32 2, label %23
    i32 1, label %32
  ]

; <label>:23:                                     ; preds = %19
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchShortArray, i64 0, i64 5)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchShortArray, i64 0, i64 5)
  %25 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %26 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %25, i32 0, i32 3
  %27 = load i32, i32* %26, align 4
  %28 = and i32 %27, 65535
  %29 = trunc i32 %28 to i16
  %30 = load i16*, i16** %7, align 8
  %31 = getelementptr inbounds i16, i16* %30, i64 1
  store i16 %29, i16* %31, align 2
  br label %32

; <label>:32:                                     ; preds = %23, %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchShortArray, i64 0, i64 3)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchShortArray, i64 0, i64 3)
  %34 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %35 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %34, i32 0, i32 3
  %36 = load i32, i32* %35, align 4
  %37 = lshr i32 %36, 16
  %38 = trunc i32 %37 to i16
  %39 = load i16*, i16** %7, align 8
  %40 = getelementptr inbounds i16, i16* %39, i64 0
  store i16 %38, i16* %40, align 2
  br label %41

; <label>:41:                                     ; preds = %32, %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchShortArray, i64 0, i64 1)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchShortArray, i64 0, i64 1)
  br label %67

; <label>:43:                                     ; preds = %12
  %44 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %45 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %44, i32 0, i32 2
  %46 = load i32, i32* %45, align 4
  switch i32 %46, label %65 [
    i32 2, label %47
    i32 1, label %56
  ]

; <label>:47:                                     ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchShortArray, i64 0, i64 6)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchShortArray, i64 0, i64 6)
  %49 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %50 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %49, i32 0, i32 3
  %51 = load i32, i32* %50, align 4
  %52 = lshr i32 %51, 16
  %53 = trunc i32 %52 to i16
  %54 = load i16*, i16** %7, align 8
  %55 = getelementptr inbounds i16, i16* %54, i64 1
  store i16 %53, i16* %55, align 2
  br label %56

; <label>:56:                                     ; preds = %47, %43
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchShortArray, i64 0, i64 4)
  %57 = add i64 %pgocount4, 1
  store i64 %57, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchShortArray, i64 0, i64 4)
  %58 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %59 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %58, i32 0, i32 3
  %60 = load i32, i32* %59, align 4
  %61 = and i32 %60, 65535
  %62 = trunc i32 %61 to i16
  %63 = load i16*, i16** %7, align 8
  %64 = getelementptr inbounds i16, i16* %63, i64 0
  store i16 %62, i16* %64, align 2
  br label %65

; <label>:65:                                     ; preds = %56, %43
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchShortArray, i64 0, i64 2)
  %66 = add i64 %pgocount5, 1
  store i64 %66, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchShortArray, i64 0, i64 2)
  br label %67

; <label>:67:                                     ; preds = %65, %41
  store i32 1, i32* %4, align 4
  br label %77

; <label>:68:                                     ; preds = %3
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchShortArray, i64 0, i64 0)
  %69 = add i64 %pgocount6, 1
  store i64 %69, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFFetchShortArray, i64 0, i64 0)
  %70 = load %struct.tiff*, %struct.tiff** %5, align 8
  %71 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %72 = load i16*, i16** %7, align 8
  %73 = bitcast i16* %72 to i8*
  %74 = call i32 @TIFFFetchData(%struct.tiff* %70, %struct.TIFFDirEntry* %71, i8* %73)
  %75 = icmp ne i32 %74, 0
  %76 = zext i1 %75 to i32
  store i32 %76, i32* %4, align 4
  br label %77

; <label>:77:                                     ; preds = %68, %67
  %78 = load i32, i32* %4, align 4
  ret i32 %78
}

; Function Attrs: nounwind uwtable
define internal i32 @TIFFFetchByteArray(%struct.tiff*, %struct.TIFFDirEntry*, i16*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca %struct.TIFFDirEntry*, align 8
  %7 = alloca i16*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %6, align 8
  store i16* %2, i16** %7, align 8
  %8 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %9 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %8, i32 0, i32 2
  %10 = load i32, i32* %9, align 4
  %11 = icmp ule i32 %10, 4
  br i1 %11, label %12, label %108

; <label>:12:                                     ; preds = %3
  %13 = load %struct.tiff*, %struct.tiff** %5, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %13, i32 0, i32 7
  %15 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %14, i32 0, i32 0
  %16 = load i16, i16* %15, align 8
  %17 = zext i16 %16 to i32
  %18 = icmp eq i32 %17, 19789
  br i1 %18, label %19, label %63

; <label>:19:                                     ; preds = %12
  %20 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %21 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %20, i32 0, i32 2
  %22 = load i32, i32* %21, align 4
  switch i32 %22, label %61 [
    i32 4, label %23
    i32 3, label %32
    i32 2, label %42
    i32 1, label %52
  ]

; <label>:23:                                     ; preds = %19
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 9)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 9)
  %25 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %26 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %25, i32 0, i32 3
  %27 = load i32, i32* %26, align 4
  %28 = and i32 %27, 255
  %29 = trunc i32 %28 to i16
  %30 = load i16*, i16** %7, align 8
  %31 = getelementptr inbounds i16, i16* %30, i64 3
  store i16 %29, i16* %31, align 2
  br label %32

; <label>:32:                                     ; preds = %23, %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 7)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 7)
  %34 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %35 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %34, i32 0, i32 3
  %36 = load i32, i32* %35, align 4
  %37 = lshr i32 %36, 8
  %38 = and i32 %37, 255
  %39 = trunc i32 %38 to i16
  %40 = load i16*, i16** %7, align 8
  %41 = getelementptr inbounds i16, i16* %40, i64 2
  store i16 %39, i16* %41, align 2
  br label %42

; <label>:42:                                     ; preds = %32, %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 5)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 5)
  %44 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %45 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %44, i32 0, i32 3
  %46 = load i32, i32* %45, align 4
  %47 = lshr i32 %46, 16
  %48 = and i32 %47, 255
  %49 = trunc i32 %48 to i16
  %50 = load i16*, i16** %7, align 8
  %51 = getelementptr inbounds i16, i16* %50, i64 1
  store i16 %49, i16* %51, align 2
  br label %52

; <label>:52:                                     ; preds = %42, %19
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 3)
  %53 = add i64 %pgocount3, 1
  store i64 %53, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 3)
  %54 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %55 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %54, i32 0, i32 3
  %56 = load i32, i32* %55, align 4
  %57 = lshr i32 %56, 24
  %58 = trunc i32 %57 to i16
  %59 = load i16*, i16** %7, align 8
  %60 = getelementptr inbounds i16, i16* %59, i64 0
  store i16 %58, i16* %60, align 2
  br label %61

; <label>:61:                                     ; preds = %52, %19
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 1)
  %62 = add i64 %pgocount4, 1
  store i64 %62, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 1)
  br label %107

; <label>:63:                                     ; preds = %12
  %64 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %65 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %64, i32 0, i32 2
  %66 = load i32, i32* %65, align 4
  switch i32 %66, label %105 [
    i32 4, label %67
    i32 3, label %76
    i32 2, label %86
    i32 1, label %96
  ]

; <label>:67:                                     ; preds = %63
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 10)
  %68 = add i64 %pgocount5, 1
  store i64 %68, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 10)
  %69 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %70 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %69, i32 0, i32 3
  %71 = load i32, i32* %70, align 4
  %72 = lshr i32 %71, 24
  %73 = trunc i32 %72 to i16
  %74 = load i16*, i16** %7, align 8
  %75 = getelementptr inbounds i16, i16* %74, i64 3
  store i16 %73, i16* %75, align 2
  br label %76

; <label>:76:                                     ; preds = %67, %63
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 8)
  %77 = add i64 %pgocount6, 1
  store i64 %77, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 8)
  %78 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %79 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %78, i32 0, i32 3
  %80 = load i32, i32* %79, align 4
  %81 = lshr i32 %80, 16
  %82 = and i32 %81, 255
  %83 = trunc i32 %82 to i16
  %84 = load i16*, i16** %7, align 8
  %85 = getelementptr inbounds i16, i16* %84, i64 2
  store i16 %83, i16* %85, align 2
  br label %86

; <label>:86:                                     ; preds = %76, %63
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 6)
  %87 = add i64 %pgocount7, 1
  store i64 %87, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 6)
  %88 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %89 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %88, i32 0, i32 3
  %90 = load i32, i32* %89, align 4
  %91 = lshr i32 %90, 8
  %92 = and i32 %91, 255
  %93 = trunc i32 %92 to i16
  %94 = load i16*, i16** %7, align 8
  %95 = getelementptr inbounds i16, i16* %94, i64 1
  store i16 %93, i16* %95, align 2
  br label %96

; <label>:96:                                     ; preds = %86, %63
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 4)
  %97 = add i64 %pgocount8, 1
  store i64 %97, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 4)
  %98 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %99 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %98, i32 0, i32 3
  %100 = load i32, i32* %99, align 4
  %101 = and i32 %100, 255
  %102 = trunc i32 %101 to i16
  %103 = load i16*, i16** %7, align 8
  %104 = getelementptr inbounds i16, i16* %103, i64 0
  store i16 %102, i16* %104, align 2
  br label %105

; <label>:105:                                    ; preds = %96, %63
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 2)
  %106 = add i64 %pgocount9, 1
  store i64 %106, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 2)
  br label %107

; <label>:107:                                    ; preds = %105, %61
  store i32 1, i32* %4, align 4
  br label %117

; <label>:108:                                    ; preds = %3
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 0)
  %109 = add i64 %pgocount10, 1
  store i64 %109, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_TIFFFetchByteArray, i64 0, i64 0)
  %110 = load %struct.tiff*, %struct.tiff** %5, align 8
  %111 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %112 = load i16*, i16** %7, align 8
  %113 = bitcast i16* %112 to i8*
  %114 = call i32 @TIFFFetchData(%struct.tiff* %110, %struct.TIFFDirEntry* %111, i8* %113)
  %115 = icmp ne i32 %114, 0
  %116 = zext i1 %115 to i32
  store i32 %116, i32* %4, align 4
  br label %117

; <label>:117:                                    ; preds = %108, %107
  %118 = load i32, i32* %4, align 4
  ret i32 %118
}

; Function Attrs: nounwind uwtable
define internal i32 @TIFFFetchLongArray(%struct.tiff*, %struct.TIFFDirEntry*, i32*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca %struct.TIFFDirEntry*, align 8
  %7 = alloca i32*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %6, align 8
  store i32* %2, i32** %7, align 8
  %8 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %9 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %8, i32 0, i32 2
  %10 = load i32, i32* %9, align 4
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %12, label %19

; <label>:12:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFFetchLongArray, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFFetchLongArray, i64 0, i64 0)
  %14 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %15 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %14, i32 0, i32 3
  %16 = load i32, i32* %15, align 4
  %17 = load i32*, i32** %7, align 8
  %18 = getelementptr inbounds i32, i32* %17, i64 0
  store i32 %16, i32* %18, align 4
  store i32 1, i32* %4, align 4
  br label %28

; <label>:19:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFFetchLongArray, i64 0, i64 1)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFFetchLongArray, i64 0, i64 1)
  %21 = load %struct.tiff*, %struct.tiff** %5, align 8
  %22 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %23 = load i32*, i32** %7, align 8
  %24 = bitcast i32* %23 to i8*
  %25 = call i32 @TIFFFetchData(%struct.tiff* %21, %struct.TIFFDirEntry* %22, i8* %24)
  %26 = icmp ne i32 %25, 0
  %27 = zext i1 %26 to i32
  store i32 %27, i32* %4, align 4
  br label %28

; <label>:28:                                     ; preds = %19, %12
  %29 = load i32, i32* %4, align 4
  ret i32 %29
}

; Function Attrs: nounwind uwtable
define internal i32 @TIFFFetchRationalArray(%struct.tiff*, %struct.TIFFDirEntry*, float*) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca %struct.TIFFDirEntry*, align 8
  %6 = alloca float*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %9 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %5, align 8
  store float* %2, float** %6, align 8
  store i32 0, i32* %7, align 4
  %10 = load %struct.tiff*, %struct.tiff** %4, align 8
  %11 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %12 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %11, i32 0, i32 2
  %13 = load i32, i32* %12, align 4
  %14 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %15 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %14, i32 0, i32 1
  %16 = load i16, i16* %15, align 2
  %17 = zext i16 %16 to i64
  %18 = getelementptr inbounds [0 x i32], [0 x i32]* @tiffDataWidth, i64 0, i64 %17
  %19 = load i32, i32* %18, align 4
  %20 = mul i32 %13, %19
  %21 = call i8* @CheckMalloc(%struct.tiff* %10, i32 %20, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.21, i32 0, i32 0))
  %22 = bitcast i8* %21 to i32*
  store i32* %22, i32** %8, align 8
  %23 = load i32*, i32** %8, align 8
  %24 = icmp ne i32* %23, null
  br i1 %24, label %25, label %76

; <label>:25:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchRationalArray, i64 0, i64 2)
  %26 = add i64 %pgocount, 1
  store i64 %26, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchRationalArray, i64 0, i64 2)
  %27 = load %struct.tiff*, %struct.tiff** %4, align 8
  %28 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %29 = load i32*, i32** %8, align 8
  %30 = bitcast i32* %29 to i8*
  %31 = call i32 @TIFFFetchData(%struct.tiff* %27, %struct.TIFFDirEntry* %28, i8* %30)
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %73

; <label>:33:                                     ; preds = %25
  store i32 0, i32* %9, align 4
  br label %34

; <label>:34:                                     ; preds = %67, %33
  %35 = load i32, i32* %9, align 4
  %36 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %37 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %36, i32 0, i32 2
  %38 = load i32, i32* %37, align 4
  %39 = icmp ult i32 %35, %38
  br i1 %39, label %40, label %71

; <label>:40:                                     ; preds = %34
  %41 = load %struct.tiff*, %struct.tiff** %4, align 8
  %42 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %43 = load i32*, i32** %8, align 8
  %44 = load i32, i32* %9, align 4
  %45 = mul i32 2, %44
  %46 = add i32 %45, 0
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32* %43, i64 %47
  %49 = load i32, i32* %48, align 4
  %50 = load i32*, i32** %8, align 8
  %51 = load i32, i32* %9, align 4
  %52 = mul i32 2, %51
  %53 = add i32 %52, 1
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32* %50, i64 %54
  %56 = load i32, i32* %55, align 4
  %57 = load float*, float** %6, align 8
  %58 = load i32, i32* %9, align 4
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds float, float* %57, i64 %59
  %61 = call i32 @cvtRational(%struct.tiff* %41, %struct.TIFFDirEntry* %42, i32 %49, i32 %56, float* %60)
  store i32 %61, i32* %7, align 4
  %62 = load i32, i32* %7, align 4
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %66, label %64

; <label>:64:                                     ; preds = %40
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchRationalArray, i64 0, i64 4)
  %65 = add i64 %pgocount1, 1
  store i64 %65, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchRationalArray, i64 0, i64 4)
  br label %71

; <label>:66:                                     ; preds = %40
  br label %67

; <label>:67:                                     ; preds = %66
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchRationalArray, i64 0, i64 0)
  %68 = add i64 %pgocount2, 1
  store i64 %68, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchRationalArray, i64 0, i64 0)
  %69 = load i32, i32* %9, align 4
  %70 = add i32 %69, 1
  store i32 %70, i32* %9, align 4
  br label %34

; <label>:71:                                     ; preds = %64, %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchRationalArray, i64 0, i64 3)
  %72 = add i64 %pgocount3, 1
  store i64 %72, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchRationalArray, i64 0, i64 3)
  br label %73

; <label>:73:                                     ; preds = %71, %25
  %74 = load i32*, i32** %8, align 8
  %75 = bitcast i32* %74 to i8*
  call void @_TIFFfree(i8* %75)
  br label %76

; <label>:76:                                     ; preds = %73, %3
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchRationalArray, i64 0, i64 1)
  %77 = add i64 %pgocount4, 1
  store i64 %77, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFFetchRationalArray, i64 0, i64 1)
  %78 = load i32, i32* %7, align 4
  ret i32 %78
}

; Function Attrs: nounwind uwtable
define internal i32 @TIFFFetchFloatArray(%struct.tiff*, %struct.TIFFDirEntry*, float*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca %struct.TIFFDirEntry*, align 8
  %7 = alloca float*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %6, align 8
  store float* %2, float** %7, align 8
  %8 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %9 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %8, i32 0, i32 2
  %10 = load i32, i32* %9, align 4
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %12, label %20

; <label>:12:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchFloatArray, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchFloatArray, i64 0, i64 0)
  %14 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %15 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %14, i32 0, i32 3
  %16 = bitcast i32* %15 to float*
  %17 = load float, float* %16, align 4
  %18 = load float*, float** %7, align 8
  %19 = getelementptr inbounds float, float* %18, i64 0
  store float %17, float* %19, align 4
  store i32 1, i32* %4, align 4
  br label %31

; <label>:20:                                     ; preds = %3
  %21 = load %struct.tiff*, %struct.tiff** %5, align 8
  %22 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %23 = load float*, float** %7, align 8
  %24 = bitcast float* %23 to i8*
  %25 = call i32 @TIFFFetchData(%struct.tiff* %21, %struct.TIFFDirEntry* %22, i8* %24)
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchFloatArray, i64 0, i64 1)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchFloatArray, i64 0, i64 1)
  store i32 1, i32* %4, align 4
  br label %31

; <label>:29:                                     ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchFloatArray, i64 0, i64 2)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchFloatArray, i64 0, i64 2)
  store i32 0, i32* %4, align 4
  br label %31

; <label>:31:                                     ; preds = %29, %27, %12
  %32 = load i32, i32* %4, align 4
  ret i32 %32
}

; Function Attrs: nounwind uwtable
define internal i32 @TIFFFetchDoubleArray(%struct.tiff*, %struct.TIFFDirEntry*, double*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca %struct.TIFFDirEntry*, align 8
  %7 = alloca double*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %6, align 8
  store double* %2, double** %7, align 8
  %8 = load %struct.tiff*, %struct.tiff** %5, align 8
  %9 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %10 = load double*, double** %7, align 8
  %11 = bitcast double* %10 to i8*
  %12 = call i32 @TIFFFetchData(%struct.tiff* %8, %struct.TIFFDirEntry* %9, i8* %11)
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFFetchDoubleArray, i64 0, i64 0)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFFetchDoubleArray, i64 0, i64 0)
  store i32 1, i32* %4, align 4
  br label %18

; <label>:16:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFFetchDoubleArray, i64 0, i64 1)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFFetchDoubleArray, i64 0, i64 1)
  store i32 0, i32* %4, align 4
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = load i32, i32* %4, align 4
  ret i32 %19
}

; Function Attrs: nounwind uwtable
define internal i32 @TIFFFetchString(%struct.tiff*, %struct.TIFFDirEntry*, i8*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca %struct.TIFFDirEntry*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %6, align 8
  store i8* %2, i8** %7, align 8
  %9 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %10 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %9, i32 0, i32 2
  %11 = load i32, i32* %10, align 4
  %12 = icmp ule i32 %11, 4
  br i1 %12, label %13, label %31

; <label>:13:                                     ; preds = %3
  %14 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %15 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %14, i32 0, i32 3
  %16 = load i32, i32* %15, align 4
  store i32 %16, i32* %8, align 4
  %17 = load %struct.tiff*, %struct.tiff** %5, align 8
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %17, i32 0, i32 3
  %19 = load i32, i32* %18, align 8
  %20 = and i32 %19, 128
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchString, i64 0, i64 2)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchString, i64 0, i64 2)
  call void @TIFFSwabLong(i32* %8)
  br label %24

; <label>:24:                                     ; preds = %22, %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchString, i64 0, i64 0)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchString, i64 0, i64 0)
  %26 = load i8*, i8** %7, align 8
  %27 = bitcast i32* %8 to i8*
  %28 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %29 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %28, i32 0, i32 2
  %30 = load i32, i32* %29, align 4
  call void @_TIFFmemcpy(i8* %26, i8* %27, i32 %30)
  store i32 1, i32* %4, align 4
  br label %37

; <label>:31:                                     ; preds = %3
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchString, i64 0, i64 1)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchString, i64 0, i64 1)
  %33 = load %struct.tiff*, %struct.tiff** %5, align 8
  %34 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %35 = load i8*, i8** %7, align 8
  %36 = call i32 @TIFFFetchData(%struct.tiff* %33, %struct.TIFFDirEntry* %34, i8* %35)
  store i32 %36, i32* %4, align 4
  br label %37

; <label>:37:                                     ; preds = %31, %24
  %38 = load i32, i32* %4, align 4
  ret i32 %38
}

; Function Attrs: nounwind uwtable
define internal float @TIFFFetchFloat(%struct.tiff*, %struct.TIFFDirEntry*) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.TIFFDirEntry*, align 8
  %5 = alloca i64, align 8
  %6 = alloca float, align 4
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %4, align 8
  %7 = load %struct.tiff*, %struct.tiff** %3, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %7, i32 0, i32 7
  %9 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %8, i32 0, i32 0
  %10 = load i16, i16* %9, align 8
  %11 = zext i16 %10 to i32
  %12 = icmp eq i32 %11, 19789
  br i1 %12, label %13, label %39

; <label>:13:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFFetchFloat, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFFetchFloat, i64 0, i64 0)
  %15 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %16 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %15, i32 0, i32 3
  %17 = load i32, i32* %16, align 4
  %18 = load %struct.tiff*, %struct.tiff** %3, align 8
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %18, i32 0, i32 9
  %20 = load i32*, i32** %19, align 8
  %21 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %22 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %21, i32 0, i32 1
  %23 = load i16, i16* %22, align 2
  %24 = zext i16 %23 to i64
  %25 = getelementptr inbounds i32, i32* %20, i64 %24
  %26 = load i32, i32* %25, align 4
  %27 = lshr i32 %17, %26
  %28 = zext i32 %27 to i64
  %29 = load %struct.tiff*, %struct.tiff** %3, align 8
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %29, i32 0, i32 10
  %31 = load i64*, i64** %30, align 8
  %32 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %33 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %32, i32 0, i32 1
  %34 = load i16, i16* %33, align 2
  %35 = zext i16 %34 to i64
  %36 = getelementptr inbounds i64, i64* %31, i64 %35
  %37 = load i64, i64* %36, align 8
  %38 = and i64 %28, %37
  br label %55

; <label>:39:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFFetchFloat, i64 0, i64 1)
  %40 = add i64 %pgocount1, 1
  store i64 %40, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFFetchFloat, i64 0, i64 1)
  %41 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %42 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %41, i32 0, i32 3
  %43 = load i32, i32* %42, align 4
  %44 = zext i32 %43 to i64
  %45 = load %struct.tiff*, %struct.tiff** %3, align 8
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %45, i32 0, i32 10
  %47 = load i64*, i64** %46, align 8
  %48 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %49 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %48, i32 0, i32 1
  %50 = load i16, i16* %49, align 2
  %51 = zext i16 %50 to i64
  %52 = getelementptr inbounds i64, i64* %47, i64 %51
  %53 = load i64, i64* %52, align 8
  %54 = and i64 %44, %53
  br label %55

; <label>:55:                                     ; preds = %39, %13
  %56 = phi i64 [ %38, %13 ], [ %54, %39 ]
  %57 = trunc i64 %56 to i32
  %58 = zext i32 %57 to i64
  store i64 %58, i64* %5, align 8
  %59 = bitcast i64* %5 to float*
  %60 = load float, float* %59, align 8
  store float %60, float* %6, align 4
  %61 = load float, float* %6, align 4
  ret float %61
}

; Function Attrs: nounwind uwtable
define internal float @TIFFFetchRational(%struct.tiff*, %struct.TIFFDirEntry*) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.TIFFDirEntry*, align 8
  %5 = alloca [2 x i32], align 4
  %6 = alloca float, align 4
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %4, align 8
  %7 = load %struct.tiff*, %struct.tiff** %3, align 8
  %8 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %9 = getelementptr inbounds [2 x i32], [2 x i32]* %5, i32 0, i32 0
  %10 = bitcast i32* %9 to i8*
  %11 = call i32 @TIFFFetchData(%struct.tiff* %7, %struct.TIFFDirEntry* %8, i8* %10)
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %23

; <label>:13:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchRational, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchRational, i64 0, i64 0)
  %15 = load %struct.tiff*, %struct.tiff** %3, align 8
  %16 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %17 = getelementptr inbounds [2 x i32], [2 x i32]* %5, i64 0, i64 0
  %18 = load i32, i32* %17, align 4
  %19 = getelementptr inbounds [2 x i32], [2 x i32]* %5, i64 0, i64 1
  %20 = load i32, i32* %19, align 4
  %21 = call i32 @cvtRational(%struct.tiff* %15, %struct.TIFFDirEntry* %16, i32 %18, i32 %20, float* %6)
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %25, label %23

; <label>:23:                                     ; preds = %13, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchRational, i64 0, i64 1)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchRational, i64 0, i64 1)
  br label %28

; <label>:25:                                     ; preds = %13
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchRational, i64 0, i64 2)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFFetchRational, i64 0, i64 2)
  %27 = load float, float* %6, align 4
  br label %28

; <label>:28:                                     ; preds = %25, %23
  %29 = phi float [ 1.000000e+00, %23 ], [ %27, %25 ]
  ret float %29
}

; Function Attrs: nounwind uwtable
define internal i32 @cvtRational(%struct.tiff*, %struct.TIFFDirEntry*, i32, i32, float*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca %struct.tiff*, align 8
  %8 = alloca %struct.TIFFDirEntry*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca float*, align 8
  store %struct.tiff* %0, %struct.tiff** %7, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %8, align 8
  store i32 %2, i32* %9, align 4
  store i32 %3, i32* %10, align 4
  store float* %4, float** %11, align 8
  %12 = load i32, i32* %10, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %28

; <label>:14:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_cvtRational, i64 0, i64 0)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_cvtRational, i64 0, i64 0)
  %16 = load %struct.tiff*, %struct.tiff** %7, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %16, i32 0, i32 0
  %18 = load i8*, i8** %17, align 8
  %19 = load %struct.tiff*, %struct.tiff** %7, align 8
  %20 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %8, align 8
  %21 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %20, i32 0, i32 0
  %22 = load i16, i16* %21, align 4
  %23 = zext i16 %22 to i32
  %24 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %19, i32 %23)
  %25 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %24, i32 0, i32 7
  %26 = load i8*, i8** %25, align 8
  %27 = load i32, i32* %9, align 4
  call void (i8*, i8*, ...) @TIFFError(i8* %18, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.22, i32 0, i32 0), i8* %26, i32 %27)
  store i32 0, i32* %6, align 4
  br label %51

; <label>:28:                                     ; preds = %5
  %29 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %8, align 8
  %30 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %29, i32 0, i32 1
  %31 = load i16, i16* %30, align 2
  %32 = zext i16 %31 to i32
  %33 = icmp eq i32 %32, 5
  br i1 %33, label %34, label %42

; <label>:34:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_cvtRational, i64 0, i64 1)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_cvtRational, i64 0, i64 1)
  %36 = load i32, i32* %9, align 4
  %37 = uitofp i32 %36 to float
  %38 = load i32, i32* %10, align 4
  %39 = uitofp i32 %38 to float
  %40 = fdiv float %37, %39
  %41 = load float*, float** %11, align 8
  store float %40, float* %41, align 4
  br label %50

; <label>:42:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_cvtRational, i64 0, i64 2)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_cvtRational, i64 0, i64 2)
  %44 = load i32, i32* %9, align 4
  %45 = sitofp i32 %44 to float
  %46 = load i32, i32* %10, align 4
  %47 = sitofp i32 %46 to float
  %48 = fdiv float %45, %47
  %49 = load float*, float** %11, align 8
  store float %48, float* %49, align 4
  br label %50

; <label>:50:                                     ; preds = %42, %34
  store i32 1, i32* %6, align 4
  br label %51

; <label>:51:                                     ; preds = %50, %14
  %52 = load i32, i32* %6, align 4
  ret i32 %52
}

; Function Attrs: nounwind uwtable
define internal i32 @TIFFFetchAnyArray(%struct.tiff*, %struct.TIFFDirEntry*, double*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca %struct.TIFFDirEntry*, align 8
  %7 = alloca double*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca i16*, align 8
  %13 = alloca i32*, align 8
  %14 = alloca i32*, align 8
  %15 = alloca float*, align 8
  %16 = alloca float*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %6, align 8
  store double* %2, double** %7, align 8
  %17 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %18 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %17, i32 0, i32 1
  %19 = load i16, i16* %18, align 2
  %20 = zext i16 %19 to i32
  switch i32 %20, label %313 [
    i32 1, label %._crit_edge
    i32 6, label %25
    i32 3, label %._crit_edge1
    i32 8, label %95
    i32 4, label %._crit_edge2
    i32 9, label %165
    i32 5, label %._crit_edge3
    i32 10, label %235
    i32 11, label %271
    i32 12, label %307
  ]

._crit_edge3:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 3)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 3)
  br label %235

._crit_edge2:                                     ; preds = %3
  %pgocount4 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 2)
  %22 = add i64 %pgocount4, 1
  store i64 %22, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 2)
  br label %165

._crit_edge1:                                     ; preds = %3
  %pgocount5 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 1)
  %23 = add i64 %pgocount5, 1
  store i64 %23, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 1)
  br label %95

._crit_edge:                                      ; preds = %3
  %pgocount6 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 0)
  %24 = add i64 %pgocount6, 1
  store i64 %24, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 0)
  br label %25

; <label>:25:                                     ; preds = %._crit_edge, %3
  %26 = load %struct.tiff*, %struct.tiff** %5, align 8
  %27 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %28 = load double*, double** %7, align 8
  %29 = bitcast double* %28 to i16*
  %30 = call i32 @TIFFFetchByteArray(%struct.tiff* %26, %struct.TIFFDirEntry* %27, i16* %29)
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %34, label %32

; <label>:32:                                     ; preds = %25
  %pgocount7 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 15)
  %33 = add i64 %pgocount7, 1
  store i64 %33, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 15)
  store i32 0, i32* %4, align 4
  br label %327

; <label>:34:                                     ; preds = %25
  %35 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %36 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %35, i32 0, i32 1
  %37 = load i16, i16* %36, align 2
  %38 = zext i16 %37 to i32
  %39 = icmp eq i32 %38, 1
  br i1 %39, label %40, label %67

; <label>:40:                                     ; preds = %34
  %41 = load double*, double** %7, align 8
  %42 = bitcast double* %41 to i16*
  store i16* %42, i16** %9, align 8
  %43 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %44 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %43, i32 0, i32 2
  %45 = load i32, i32* %44, align 4
  %46 = sub i32 %45, 1
  store i32 %46, i32* %8, align 4
  br label %47

; <label>:47:                                     ; preds = %62, %40
  %48 = load i32, i32* %8, align 4
  %49 = icmp sge i32 %48, 0
  br i1 %49, label %50, label %65

; <label>:50:                                     ; preds = %47
  %pgocount8 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 5)
  %51 = add i64 %pgocount8, 1
  store i64 %51, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 5)
  %52 = load i16*, i16** %9, align 8
  %53 = load i32, i32* %8, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i16, i16* %52, i64 %54
  %56 = load i16, i16* %55, align 2
  %57 = uitofp i16 %56 to double
  %58 = load double*, double** %7, align 8
  %59 = load i32, i32* %8, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double, double* %58, i64 %60
  store double %57, double* %61, align 8
  br label %62

; <label>:62:                                     ; preds = %50
  %63 = load i32, i32* %8, align 4
  %64 = add nsw i32 %63, -1
  store i32 %64, i32* %8, align 4
  br label %47

; <label>:65:                                     ; preds = %47
  %pgocount9 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 19)
  %66 = add i64 %pgocount9, 1
  store i64 %66, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 19)
  br label %94

; <label>:67:                                     ; preds = %34
  %68 = load double*, double** %7, align 8
  %69 = bitcast double* %68 to i16*
  store i16* %69, i16** %10, align 8
  %70 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %71 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %70, i32 0, i32 2
  %72 = load i32, i32* %71, align 4
  %73 = sub i32 %72, 1
  store i32 %73, i32* %8, align 4
  br label %74

; <label>:74:                                     ; preds = %89, %67
  %75 = load i32, i32* %8, align 4
  %76 = icmp sge i32 %75, 0
  br i1 %76, label %77, label %92

; <label>:77:                                     ; preds = %74
  %pgocount10 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 6)
  %78 = add i64 %pgocount10, 1
  store i64 %78, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 6)
  %79 = load i16*, i16** %10, align 8
  %80 = load i32, i32* %8, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i16, i16* %79, i64 %81
  %83 = load i16, i16* %82, align 2
  %84 = sitofp i16 %83 to double
  %85 = load double*, double** %7, align 8
  %86 = load i32, i32* %8, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds double, double* %85, i64 %87
  store double %84, double* %88, align 8
  br label %89

; <label>:89:                                     ; preds = %77
  %90 = load i32, i32* %8, align 4
  %91 = add nsw i32 %90, -1
  store i32 %91, i32* %8, align 4
  br label %74

; <label>:92:                                     ; preds = %74
  %pgocount11 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 20)
  %93 = add i64 %pgocount11, 1
  store i64 %93, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 20)
  br label %94

; <label>:94:                                     ; preds = %92, %65
  br label %326

; <label>:95:                                     ; preds = %._crit_edge1, %3
  %96 = load %struct.tiff*, %struct.tiff** %5, align 8
  %97 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %98 = load double*, double** %7, align 8
  %99 = bitcast double* %98 to i16*
  %100 = call i32 @TIFFFetchShortArray(%struct.tiff* %96, %struct.TIFFDirEntry* %97, i16* %99)
  %101 = icmp ne i32 %100, 0
  br i1 %101, label %104, label %102

; <label>:102:                                    ; preds = %95
  %pgocount12 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 16)
  %103 = add i64 %pgocount12, 1
  store i64 %103, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 16)
  store i32 0, i32* %4, align 4
  br label %327

; <label>:104:                                    ; preds = %95
  %105 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %106 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %105, i32 0, i32 1
  %107 = load i16, i16* %106, align 2
  %108 = zext i16 %107 to i32
  %109 = icmp eq i32 %108, 3
  br i1 %109, label %110, label %137

; <label>:110:                                    ; preds = %104
  %111 = load double*, double** %7, align 8
  %112 = bitcast double* %111 to i16*
  store i16* %112, i16** %11, align 8
  %113 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %114 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %113, i32 0, i32 2
  %115 = load i32, i32* %114, align 4
  %116 = sub i32 %115, 1
  store i32 %116, i32* %8, align 4
  br label %117

; <label>:117:                                    ; preds = %132, %110
  %118 = load i32, i32* %8, align 4
  %119 = icmp sge i32 %118, 0
  br i1 %119, label %120, label %135

; <label>:120:                                    ; preds = %117
  %pgocount13 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 7)
  %121 = add i64 %pgocount13, 1
  store i64 %121, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 7)
  %122 = load i16*, i16** %11, align 8
  %123 = load i32, i32* %8, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i16, i16* %122, i64 %124
  %126 = load i16, i16* %125, align 2
  %127 = uitofp i16 %126 to double
  %128 = load double*, double** %7, align 8
  %129 = load i32, i32* %8, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds double, double* %128, i64 %130
  store double %127, double* %131, align 8
  br label %132

; <label>:132:                                    ; preds = %120
  %133 = load i32, i32* %8, align 4
  %134 = add nsw i32 %133, -1
  store i32 %134, i32* %8, align 4
  br label %117

; <label>:135:                                    ; preds = %117
  %pgocount14 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 21)
  %136 = add i64 %pgocount14, 1
  store i64 %136, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 21)
  br label %164

; <label>:137:                                    ; preds = %104
  %138 = load double*, double** %7, align 8
  %139 = bitcast double* %138 to i16*
  store i16* %139, i16** %12, align 8
  %140 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %141 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %140, i32 0, i32 2
  %142 = load i32, i32* %141, align 4
  %143 = sub i32 %142, 1
  store i32 %143, i32* %8, align 4
  br label %144

; <label>:144:                                    ; preds = %159, %137
  %145 = load i32, i32* %8, align 4
  %146 = icmp sge i32 %145, 0
  br i1 %146, label %147, label %162

; <label>:147:                                    ; preds = %144
  %pgocount15 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 8)
  %148 = add i64 %pgocount15, 1
  store i64 %148, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 8)
  %149 = load i16*, i16** %12, align 8
  %150 = load i32, i32* %8, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i16, i16* %149, i64 %151
  %153 = load i16, i16* %152, align 2
  %154 = sitofp i16 %153 to double
  %155 = load double*, double** %7, align 8
  %156 = load i32, i32* %8, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds double, double* %155, i64 %157
  store double %154, double* %158, align 8
  br label %159

; <label>:159:                                    ; preds = %147
  %160 = load i32, i32* %8, align 4
  %161 = add nsw i32 %160, -1
  store i32 %161, i32* %8, align 4
  br label %144

; <label>:162:                                    ; preds = %144
  %pgocount16 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 22)
  %163 = add i64 %pgocount16, 1
  store i64 %163, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 22)
  br label %164

; <label>:164:                                    ; preds = %162, %135
  br label %326

; <label>:165:                                    ; preds = %._crit_edge2, %3
  %166 = load %struct.tiff*, %struct.tiff** %5, align 8
  %167 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %168 = load double*, double** %7, align 8
  %169 = bitcast double* %168 to i32*
  %170 = call i32 @TIFFFetchLongArray(%struct.tiff* %166, %struct.TIFFDirEntry* %167, i32* %169)
  %171 = icmp ne i32 %170, 0
  br i1 %171, label %174, label %172

; <label>:172:                                    ; preds = %165
  %pgocount17 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 17)
  %173 = add i64 %pgocount17, 1
  store i64 %173, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 17)
  store i32 0, i32* %4, align 4
  br label %327

; <label>:174:                                    ; preds = %165
  %175 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %176 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %175, i32 0, i32 1
  %177 = load i16, i16* %176, align 2
  %178 = zext i16 %177 to i32
  %179 = icmp eq i32 %178, 4
  br i1 %179, label %180, label %207

; <label>:180:                                    ; preds = %174
  %181 = load double*, double** %7, align 8
  %182 = bitcast double* %181 to i32*
  store i32* %182, i32** %13, align 8
  %183 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %184 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %183, i32 0, i32 2
  %185 = load i32, i32* %184, align 4
  %186 = sub i32 %185, 1
  store i32 %186, i32* %8, align 4
  br label %187

; <label>:187:                                    ; preds = %202, %180
  %188 = load i32, i32* %8, align 4
  %189 = icmp sge i32 %188, 0
  br i1 %189, label %190, label %205

; <label>:190:                                    ; preds = %187
  %pgocount18 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 9)
  %191 = add i64 %pgocount18, 1
  store i64 %191, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 9)
  %192 = load i32*, i32** %13, align 8
  %193 = load i32, i32* %8, align 4
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds i32, i32* %192, i64 %194
  %196 = load i32, i32* %195, align 4
  %197 = uitofp i32 %196 to double
  %198 = load double*, double** %7, align 8
  %199 = load i32, i32* %8, align 4
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds double, double* %198, i64 %200
  store double %197, double* %201, align 8
  br label %202

; <label>:202:                                    ; preds = %190
  %203 = load i32, i32* %8, align 4
  %204 = add nsw i32 %203, -1
  store i32 %204, i32* %8, align 4
  br label %187

; <label>:205:                                    ; preds = %187
  %pgocount19 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 23)
  %206 = add i64 %pgocount19, 1
  store i64 %206, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 23)
  br label %234

; <label>:207:                                    ; preds = %174
  %208 = load double*, double** %7, align 8
  %209 = bitcast double* %208 to i32*
  store i32* %209, i32** %14, align 8
  %210 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %211 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %210, i32 0, i32 2
  %212 = load i32, i32* %211, align 4
  %213 = sub i32 %212, 1
  store i32 %213, i32* %8, align 4
  br label %214

; <label>:214:                                    ; preds = %229, %207
  %215 = load i32, i32* %8, align 4
  %216 = icmp sge i32 %215, 0
  br i1 %216, label %217, label %232

; <label>:217:                                    ; preds = %214
  %pgocount20 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 10)
  %218 = add i64 %pgocount20, 1
  store i64 %218, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 10)
  %219 = load i32*, i32** %14, align 8
  %220 = load i32, i32* %8, align 4
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds i32, i32* %219, i64 %221
  %223 = load i32, i32* %222, align 4
  %224 = sitofp i32 %223 to double
  %225 = load double*, double** %7, align 8
  %226 = load i32, i32* %8, align 4
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds double, double* %225, i64 %227
  store double %224, double* %228, align 8
  br label %229

; <label>:229:                                    ; preds = %217
  %230 = load i32, i32* %8, align 4
  %231 = add nsw i32 %230, -1
  store i32 %231, i32* %8, align 4
  br label %214

; <label>:232:                                    ; preds = %214
  %pgocount21 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 24)
  %233 = add i64 %pgocount21, 1
  store i64 %233, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 24)
  br label %234

; <label>:234:                                    ; preds = %232, %205
  br label %326

; <label>:235:                                    ; preds = %._crit_edge3, %3
  %236 = load %struct.tiff*, %struct.tiff** %5, align 8
  %237 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %238 = load double*, double** %7, align 8
  %239 = bitcast double* %238 to float*
  %240 = call i32 @TIFFFetchRationalArray(%struct.tiff* %236, %struct.TIFFDirEntry* %237, float* %239)
  %241 = icmp ne i32 %240, 0
  br i1 %241, label %244, label %242

; <label>:242:                                    ; preds = %235
  %pgocount22 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 18)
  %243 = add i64 %pgocount22, 1
  store i64 %243, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 18)
  store i32 0, i32* %4, align 4
  br label %327

; <label>:244:                                    ; preds = %235
  %245 = load double*, double** %7, align 8
  %246 = bitcast double* %245 to float*
  store float* %246, float** %15, align 8
  %247 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %248 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %247, i32 0, i32 2
  %249 = load i32, i32* %248, align 4
  %250 = sub i32 %249, 1
  store i32 %250, i32* %8, align 4
  br label %251

; <label>:251:                                    ; preds = %265, %244
  %252 = load i32, i32* %8, align 4
  %253 = icmp sge i32 %252, 0
  br i1 %253, label %254, label %269

; <label>:254:                                    ; preds = %251
  %255 = load float*, float** %15, align 8
  %256 = load i32, i32* %8, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds float, float* %255, i64 %257
  %259 = load float, float* %258, align 4
  %260 = fpext float %259 to double
  %261 = load double*, double** %7, align 8
  %262 = load i32, i32* %8, align 4
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds double, double* %261, i64 %263
  store double %260, double* %264, align 8
  br label %265

; <label>:265:                                    ; preds = %254
  %pgocount23 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 4)
  %266 = add i64 %pgocount23, 1
  store i64 %266, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 4)
  %267 = load i32, i32* %8, align 4
  %268 = add nsw i32 %267, -1
  store i32 %268, i32* %8, align 4
  br label %251

; <label>:269:                                    ; preds = %251
  %pgocount24 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 12)
  %270 = add i64 %pgocount24, 1
  store i64 %270, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 12)
  br label %326

; <label>:271:                                    ; preds = %3
  %272 = load %struct.tiff*, %struct.tiff** %5, align 8
  %273 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %274 = load double*, double** %7, align 8
  %275 = bitcast double* %274 to float*
  %276 = call i32 @TIFFFetchFloatArray(%struct.tiff* %272, %struct.TIFFDirEntry* %273, float* %275)
  %277 = icmp ne i32 %276, 0
  br i1 %277, label %280, label %278

; <label>:278:                                    ; preds = %271
  %pgocount25 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 26)
  %279 = add i64 %pgocount25, 1
  store i64 %279, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 26)
  store i32 0, i32* %4, align 4
  br label %327

; <label>:280:                                    ; preds = %271
  %281 = load double*, double** %7, align 8
  %282 = bitcast double* %281 to float*
  store float* %282, float** %16, align 8
  %283 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %284 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %283, i32 0, i32 2
  %285 = load i32, i32* %284, align 4
  %286 = sub i32 %285, 1
  store i32 %286, i32* %8, align 4
  br label %287

; <label>:287:                                    ; preds = %302, %280
  %288 = load i32, i32* %8, align 4
  %289 = icmp sge i32 %288, 0
  br i1 %289, label %290, label %305

; <label>:290:                                    ; preds = %287
  %pgocount26 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 11)
  %291 = add i64 %pgocount26, 1
  store i64 %291, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 11)
  %292 = load float*, float** %16, align 8
  %293 = load i32, i32* %8, align 4
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds float, float* %292, i64 %294
  %296 = load float, float* %295, align 4
  %297 = fpext float %296 to double
  %298 = load double*, double** %7, align 8
  %299 = load i32, i32* %8, align 4
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds double, double* %298, i64 %300
  store double %297, double* %301, align 8
  br label %302

; <label>:302:                                    ; preds = %290
  %303 = load i32, i32* %8, align 4
  %304 = add nsw i32 %303, -1
  store i32 %304, i32* %8, align 4
  br label %287

; <label>:305:                                    ; preds = %287
  %pgocount27 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 25)
  %306 = add i64 %pgocount27, 1
  store i64 %306, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 25)
  br label %326

; <label>:307:                                    ; preds = %3
  %pgocount28 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 13)
  %308 = add i64 %pgocount28, 1
  store i64 %308, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 13)
  %309 = load %struct.tiff*, %struct.tiff** %5, align 8
  %310 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %311 = load double*, double** %7, align 8
  %312 = call i32 @TIFFFetchDoubleArray(%struct.tiff* %309, %struct.TIFFDirEntry* %310, double* %311)
  store i32 %312, i32* %4, align 4
  br label %327

; <label>:313:                                    ; preds = %3
  %pgocount29 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 14)
  %314 = add i64 %pgocount29, 1
  store i64 %314, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_TIFFFetchAnyArray, i64 0, i64 14)
  %315 = load %struct.tiff*, %struct.tiff** %5, align 8
  %316 = getelementptr inbounds %struct.tiff, %struct.tiff* %315, i32 0, i32 0
  %317 = load i8*, i8** %316, align 8
  %318 = load %struct.tiff*, %struct.tiff** %5, align 8
  %319 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %320 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %319, i32 0, i32 0
  %321 = load i16, i16* %320, align 4
  %322 = zext i16 %321 to i32
  %323 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %318, i32 %322)
  %324 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %323, i32 0, i32 7
  %325 = load i8*, i8** %324, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %317, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.24, i32 0, i32 0), i8* %325)
  store i32 0, i32* %4, align 4
  br label %327

; <label>:326:                                    ; preds = %305, %269, %234, %164, %94
  store i32 1, i32* %4, align 4
  br label %327

; <label>:327:                                    ; preds = %326, %313, %307, %278, %242, %172, %102, %32
  %328 = load i32, i32* %4, align 4
  ret i32 %328
}

declare i32 @TIFFVTileSize(%struct.tiff*, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #2

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
