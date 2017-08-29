; ModuleID = 'tmp1.ll'
source_filename = "tif_dirwrite.c"
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

@.str = private unnamed_addr constant [43 x i8] c"Error post-encoding before directory write\00", align 1
@.str.1 = private unnamed_addr constant [43 x i8] c"Error flushing data before directory write\00", align 1
@.str.2 = private unnamed_addr constant [37 x i8] c"Cannot write directory, out of space\00", align 1
@.str.3 = private unnamed_addr constant [30 x i8] c"Error writing directory count\00", align 1
@.str.4 = private unnamed_addr constant [33 x i8] c"Error writing directory contents\00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"Error writing directory link\00", align 1
@tiffDataWidth = external constant [0 x i32], align 4
@.str.6 = private unnamed_addr constant [34 x i8] c"Error writing data for field \22%s\22\00", align 1
@.str.7 = private unnamed_addr constant [65 x i8] c"\22%s\22: Information lost writing value (%g) as (unsigned) RATIONAL\00", align 1
@TIFFLinkDirectory.module = internal constant [18 x i8] c"TIFFLinkDirectory\00", align 16
@.str.8 = private unnamed_addr constant [40 x i8] c"%s: Error writing SubIFD directory link\00", align 1
@.str.9 = private unnamed_addr constant [26 x i8] c"Error writing TIFF header\00", align 1
@.str.10 = private unnamed_addr constant [31 x i8] c"Error fetching directory count\00", align 1
@.str.11 = private unnamed_addr constant [30 x i8] c"Error fetching directory link\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFWriteDirectory = private constant [18 x i8] c"TIFFWriteDirectory"
@__profn_tmp1.ll_TIFFLinkDirectory = private constant [25 x i8] c"tmp1.ll:TIFFLinkDirectory"
@__profn_tmp1.ll_TIFFWriteLongArray = private constant [26 x i8] c"tmp1.ll:TIFFWriteLongArray"
@__profn_tmp1.ll_TIFFSetupShortLong = private constant [26 x i8] c"tmp1.ll:TIFFSetupShortLong"
@__profn_tmp1.ll_TIFFWriteShortTable = private constant [27 x i8] c"tmp1.ll:TIFFWriteShortTable"
@__profn_tmp1.ll_TIFFWriteRationalArray = private constant [30 x i8] c"tmp1.ll:TIFFWriteRationalArray"
@__profn_tmp1.ll_TIFFWritePerSampleShorts = private constant [32 x i8] c"tmp1.ll:TIFFWritePerSampleShorts"
@__profn_tmp1.ll_TIFFWritePerSampleAnys = private constant [30 x i8] c"tmp1.ll:TIFFWritePerSampleAnys"
@__profn_tmp1.ll_TIFFSetupShortPair = private constant [26 x i8] c"tmp1.ll:TIFFSetupShortPair"
@__profn_tmp1.ll_TIFFWriteInkNames = private constant [25 x i8] c"tmp1.ll:TIFFWriteInkNames"
@__profn_tmp1.ll_TIFFWriteTransferFunction = private constant [33 x i8] c"tmp1.ll:TIFFWriteTransferFunction"
@__profn_tmp1.ll_TIFFWriteNormalTag = private constant [26 x i8] c"tmp1.ll:TIFFWriteNormalTag"
@__profn_tmp1.ll_TIFFWriteShortArray = private constant [27 x i8] c"tmp1.ll:TIFFWriteShortArray"
@__profn_tmp1.ll_TIFFWriteFloatArray = private constant [27 x i8] c"tmp1.ll:TIFFWriteFloatArray"
@__profn_tmp1.ll_TIFFWriteDoubleArray = private constant [28 x i8] c"tmp1.ll:TIFFWriteDoubleArray"
@__profn_tmp1.ll_TIFFWriteByteArray = private constant [26 x i8] c"tmp1.ll:TIFFWriteByteArray"
@__profn_tmp1.ll_TIFFWriteData = private constant [21 x i8] c"tmp1.ll:TIFFWriteData"
@__profn_tmp1.ll_TIFFWriteAnyArray = private constant [25 x i8] c"tmp1.ll:TIFFWriteAnyArray"
@__profc_TIFFWriteDirectory = private global [65 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFWriteDirectory = private global [8 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFWriteDirectory = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8646311022596017138, i64 218425287048376224, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFWriteDirectory to i8*), i8* bitcast ([8 x i64]* @__profvp_TIFFWriteDirectory to i8*), i32 65, [1 x i16] [i16 8] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFLinkDirectory = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_TIFFLinkDirectory = private global [11 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_TIFFLinkDirectory = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 757910556353061425, i64 3096413721396128, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i32 0, i32 0), i8* null, i8* bitcast ([11 x i64]* @__profvp_tmp1.ll_TIFFLinkDirectory to i8*), i32 14, [1 x i16] [i16 11] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFWriteLongArray = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFWriteLongArray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1362453750853883409, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFWriteLongArray, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFSetupShortLong = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFSetupShortLong = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7636758440446470024, i64 43969736709, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFSetupShortLong, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFWriteShortTable = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFWriteShortTable = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1496839466131644724, i64 51054561640, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFWriteShortTable, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFWriteRationalArray = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFWriteRationalArray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6878283523198635085, i64 103757241714, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFWriteRationalArray, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFWritePerSampleShorts = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFWritePerSampleShorts = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4284356106780495406, i64 59881859849, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFWritePerSampleShorts, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFWritePerSampleAnys = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFWritePerSampleAnys = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1556484083868893349, i64 59881859849, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFWritePerSampleAnys, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFSetupShortPair = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFSetupShortPair = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5567917947065182651, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_TIFFSetupShortPair, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFWriteInkNames = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFWriteInkNames = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1153128144831958904, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_TIFFWriteInkNames, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFWriteTransferFunction = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFWriteTransferFunction = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1744094495995096621, i64 65689311616, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFWriteTransferFunction, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFWriteNormalTag = private global [41 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFWriteNormalTag = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4814334917195781593, i64 528114180033, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i32 0, i32 0), i8* null, i8* null, i32 41, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFWriteShortArray = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFWriteShortArray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4193966167394239900, i64 69140809139, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFWriteShortArray, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFWriteFloatArray = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFWriteFloatArray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 160802171601497042, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFWriteFloatArray, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFWriteDoubleArray = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFWriteDoubleArray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3102477571071264429, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_TIFFWriteDoubleArray, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFWriteByteArray = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFWriteByteArray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8538139749648242229, i64 45479180430, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFWriteByteArray, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFWriteData = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_TIFFWriteData = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_TIFFWriteData = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4762341949844703807, i64 563054854462128, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_TIFFWriteData to i8*), i32 12, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFWriteAnyArray = private global [25 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFWriteAnyArray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 771522902221477886, i64 364189675993, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i32 0, i32 0), i8* null, i8* null, i32 25, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [21 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [498 x i8] c"\EF\03\00TIFFWriteDirectory\01tmp1.ll:TIFFLinkDirectory\01tmp1.ll:TIFFWriteLongArray\01tmp1.ll:TIFFSetupShortLong\01tmp1.ll:TIFFWriteShortTable\01tmp1.ll:TIFFWriteRationalArray\01tmp1.ll:TIFFWritePerSampleShorts\01tmp1.ll:TIFFWritePerSampleAnys\01tmp1.ll:TIFFSetupShortPair\01tmp1.ll:TIFFWriteInkNames\01tmp1.ll:TIFFWriteTransferFunction\01tmp1.ll:TIFFWriteNormalTag\01tmp1.ll:TIFFWriteShortArray\01tmp1.ll:TIFFWriteFloatArray\01tmp1.ll:TIFFWriteDoubleArray\01tmp1.ll:TIFFWriteByteArray\01tmp1.ll:TIFFWriteData\01tmp1.ll:TIFFWriteAnyArray", section "__llvm_prf_names"
@llvm.used = appending global [20 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteDirectory to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFLinkDirectory to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFWriteLongArray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFSetupShortLong to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFWriteShortTable to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFWriteRationalArray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFWritePerSampleShorts to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFWritePerSampleAnys to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFSetupShortPair to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFWriteInkNames to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFWriteTransferFunction to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFWriteNormalTag to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFWriteShortArray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFWriteFloatArray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFWriteDoubleArray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFWriteByteArray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFWriteData to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFWriteAnyArray to i8*), i8* bitcast ([21 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([498 x i8], [498 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFWriteDirectory(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca i16, align 2
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca %struct.TIFFDirEntry*, align 8
  %11 = alloca %struct.TIFFDirectory*, align 8
  %12 = alloca i64, align 8
  %13 = alloca [3 x i64], align 16
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca %struct.TIFFFieldInfo*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %17 = load %struct.tiff*, %struct.tiff** %3, align 8
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %17, i32 0, i32 2
  %19 = load i32, i32* %18, align 4
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 13)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 13)
  store i32 1, i32* %2, align 4
  br label %688

; <label>:23:                                     ; preds = %1
  %24 = load %struct.tiff*, %struct.tiff** %3, align 8
  %25 = getelementptr inbounds %struct.tiff, %struct.tiff* %24, i32 0, i32 3
  %26 = load i32, i32* %25, align 8
  %27 = and i32 %26, 4096
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %49

; <label>:29:                                     ; preds = %23
  %30 = load %struct.tiff*, %struct.tiff** %3, align 8
  %31 = getelementptr inbounds %struct.tiff, %struct.tiff* %30, i32 0, i32 3
  %32 = load i32, i32* %31, align 8
  %33 = and i32 %32, -4097
  store i32 %33, i32* %31, align 8
  %34 = load %struct.tiff*, %struct.tiff** %3, align 8
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %34, i32 0, i32 25
  %36 = bitcast {}** %35 to i32 (%struct.tiff*)**
  %37 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %36, align 8
  %38 = load %struct.tiff*, %struct.tiff** %3, align 8
  %39 = ptrtoint i32 (%struct.tiff*)* %37 to i64
  call void @__llvm_profile_instrument_target(i64 %39, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteDirectory to i8*), i32 0)
  %40 = call i32 %37(%struct.tiff* %38)
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %47, label %42

; <label>:42:                                     ; preds = %29
  %pgocount7 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 24)
  %43 = add i64 %pgocount7, 1
  store i64 %43, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 24)
  %44 = load %struct.tiff*, %struct.tiff** %3, align 8
  %45 = getelementptr inbounds %struct.tiff, %struct.tiff* %44, i32 0, i32 0
  %46 = load i8*, i8** %45, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %46, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %688

; <label>:47:                                     ; preds = %29
  %pgocount8 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 16)
  %48 = add i64 %pgocount8, 1
  store i64 %48, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 16)
  br label %49

; <label>:49:                                     ; preds = %47, %23
  %50 = load %struct.tiff*, %struct.tiff** %3, align 8
  %51 = getelementptr inbounds %struct.tiff, %struct.tiff* %50, i32 0, i32 32
  %52 = load void (%struct.tiff*)*, void (%struct.tiff*)** %51, align 8
  %53 = load %struct.tiff*, %struct.tiff** %3, align 8
  %54 = ptrtoint void (%struct.tiff*)* %52 to i64
  call void @__llvm_profile_instrument_target(i64 %54, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteDirectory to i8*), i32 1)
  call void %52(%struct.tiff* %53)
  %55 = load %struct.tiff*, %struct.tiff** %3, align 8
  %56 = getelementptr inbounds %struct.tiff, %struct.tiff* %55, i32 0, i32 43
  %57 = load i32, i32* %56, align 8
  %58 = icmp sgt i32 %57, 0
  br i1 %58, label %59, label %69

; <label>:59:                                     ; preds = %49
  %pgocount9 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 14)
  %60 = add i64 %pgocount9, 1
  store i64 %60, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 14)
  %61 = load %struct.tiff*, %struct.tiff** %3, align 8
  %62 = call i32 @TIFFFlushData1(%struct.tiff* %61)
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %69, label %64

; <label>:64:                                     ; preds = %59
  %pgocount10 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 20)
  %65 = add i64 %pgocount10, 1
  store i64 %65, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 20)
  %66 = load %struct.tiff*, %struct.tiff** %3, align 8
  %67 = getelementptr inbounds %struct.tiff, %struct.tiff* %66, i32 0, i32 0
  %68 = load i8*, i8** %67, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %68, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.1, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %688

; <label>:69:                                     ; preds = %59, %49
  %70 = load %struct.tiff*, %struct.tiff** %3, align 8
  %71 = getelementptr inbounds %struct.tiff, %struct.tiff* %70, i32 0, i32 3
  %72 = load i32, i32* %71, align 8
  %73 = and i32 %72, 512
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %90

; <label>:75:                                     ; preds = %69
  %pgocount11 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 17)
  %76 = add i64 %pgocount11, 1
  store i64 %76, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 17)
  %77 = load %struct.tiff*, %struct.tiff** %3, align 8
  %78 = getelementptr inbounds %struct.tiff, %struct.tiff* %77, i32 0, i32 40
  %79 = load i8*, i8** %78, align 8
  %80 = icmp ne i8* %79, null
  br i1 %80, label %81, label %90

; <label>:81:                                     ; preds = %75
  %pgocount12 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 19)
  %82 = add i64 %pgocount12, 1
  store i64 %82, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 19)
  %83 = load %struct.tiff*, %struct.tiff** %3, align 8
  %84 = getelementptr inbounds %struct.tiff, %struct.tiff* %83, i32 0, i32 40
  %85 = load i8*, i8** %84, align 8
  call void @_TIFFfree(i8* %85)
  %86 = load %struct.tiff*, %struct.tiff** %3, align 8
  %87 = getelementptr inbounds %struct.tiff, %struct.tiff* %86, i32 0, i32 40
  store i8* null, i8** %87, align 8
  %88 = load %struct.tiff*, %struct.tiff** %3, align 8
  %89 = getelementptr inbounds %struct.tiff, %struct.tiff* %88, i32 0, i32 43
  store i32 0, i32* %89, align 8
  br label %90

; <label>:90:                                     ; preds = %81, %75, %69
  %91 = load %struct.tiff*, %struct.tiff** %3, align 8
  %92 = getelementptr inbounds %struct.tiff, %struct.tiff* %91, i32 0, i32 3
  %93 = load i32, i32* %92, align 8
  %94 = and i32 %93, -81
  store i32 %94, i32* %92, align 8
  %95 = load %struct.tiff*, %struct.tiff** %3, align 8
  %96 = getelementptr inbounds %struct.tiff, %struct.tiff* %95, i32 0, i32 6
  store %struct.TIFFDirectory* %96, %struct.TIFFDirectory** %11, align 8
  store i32 0, i32* %7, align 4
  store i64 0, i64* %12, align 8
  br label %97

; <label>:97:                                     ; preds = %123, %90
  %98 = load i64, i64* %12, align 8
  %99 = icmp ule i64 %98, 95
  br i1 %99, label %100, label %127

; <label>:100:                                    ; preds = %97
  %101 = load %struct.tiff*, %struct.tiff** %3, align 8
  %102 = getelementptr inbounds %struct.tiff, %struct.tiff* %101, i32 0, i32 6
  %103 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %102, i32 0, i32 0
  %104 = load i64, i64* %12, align 8
  %105 = udiv i64 %104, 32
  %106 = getelementptr inbounds [3 x i64], [3 x i64]* %103, i64 0, i64 %105
  %107 = load i64, i64* %106, align 8
  %108 = load i64, i64* %12, align 8
  %109 = and i64 %108, 31
  %110 = shl i64 1, %109
  %111 = and i64 %107, %110
  %112 = icmp ne i64 %111, 0
  br i1 %112, label %113, label %122

; <label>:113:                                    ; preds = %100
  %pgocount13 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 8)
  %114 = add i64 %pgocount13, 1
  store i64 %114, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 8)
  %115 = load i64, i64* %12, align 8
  %116 = icmp ult i64 %115, 5
  %117 = zext i1 %116 to i64
  %pgocount14 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 62)
  %118 = add i64 %pgocount14, %117
  store i64 %118, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 62)
  %119 = select i1 %116, i32 2, i32 1
  %120 = load i32, i32* %7, align 4
  %121 = add i32 %120, %119
  store i32 %121, i32* %7, align 4
  br label %122

; <label>:122:                                    ; preds = %113, %100
  br label %123

; <label>:123:                                    ; preds = %122
  %pgocount15 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 7)
  %124 = add i64 %pgocount15, 1
  store i64 %124, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 7)
  %125 = load i64, i64* %12, align 8
  %126 = add i64 %125, 1
  store i64 %126, i64* %12, align 8
  br label %97

; <label>:127:                                    ; preds = %97
  %128 = load i32, i32* %7, align 4
  %129 = zext i32 %128 to i64
  %130 = mul i64 %129, 12
  %131 = trunc i64 %130 to i32
  store i32 %131, i32* %8, align 4
  %132 = load i32, i32* %8, align 4
  %133 = call i8* @_TIFFmalloc(i32 %132)
  store i8* %133, i8** %9, align 8
  %134 = load i8*, i8** %9, align 8
  %135 = icmp eq i8* %134, null
  br i1 %135, label %136, label %141

; <label>:136:                                    ; preds = %127
  %pgocount16 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 18)
  %137 = add i64 %pgocount16, 1
  store i64 %137, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 18)
  %138 = load %struct.tiff*, %struct.tiff** %3, align 8
  %139 = getelementptr inbounds %struct.tiff, %struct.tiff* %138, i32 0, i32 0
  %140 = load i8*, i8** %139, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %140, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.2, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %688

; <label>:141:                                    ; preds = %127
  %142 = load %struct.tiff*, %struct.tiff** %3, align 8
  %143 = getelementptr inbounds %struct.tiff, %struct.tiff* %142, i32 0, i32 4
  %144 = load i32, i32* %143, align 4
  %145 = icmp eq i32 %144, 0
  br i1 %145, label %146, label %153

; <label>:146:                                    ; preds = %141
  %pgocount17 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 34)
  %147 = add i64 %pgocount17, 1
  store i64 %147, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 34)
  %148 = load %struct.tiff*, %struct.tiff** %3, align 8
  %149 = call i32 @TIFFLinkDirectory(%struct.tiff* %148)
  %150 = icmp ne i32 %149, 0
  br i1 %150, label %153, label %151

; <label>:151:                                    ; preds = %146
  %pgocount18 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 42)
  %152 = add i64 %pgocount18, 1
  store i64 %152, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 42)
  br label %686

; <label>:153:                                    ; preds = %146, %141
  %154 = load %struct.tiff*, %struct.tiff** %3, align 8
  %155 = getelementptr inbounds %struct.tiff, %struct.tiff* %154, i32 0, i32 4
  %156 = load i32, i32* %155, align 4
  %157 = sext i32 %156 to i64
  %158 = add i64 %157, 2
  %159 = load i32, i32* %8, align 4
  %160 = sext i32 %159 to i64
  %161 = add i64 %158, %160
  %162 = add i64 %161, 4
  %163 = trunc i64 %162 to i32
  %164 = load %struct.tiff*, %struct.tiff** %3, align 8
  %165 = getelementptr inbounds %struct.tiff, %struct.tiff* %164, i32 0, i32 15
  store i32 %163, i32* %165, align 8
  %166 = load %struct.tiff*, %struct.tiff** %3, align 8
  %167 = getelementptr inbounds %struct.tiff, %struct.tiff* %166, i32 0, i32 15
  %168 = load i32, i32* %167, align 8
  %169 = and i32 %168, 1
  %170 = icmp ne i32 %169, 0
  br i1 %170, label %171, label %177

; <label>:171:                                    ; preds = %153
  %pgocount19 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 32)
  %172 = add i64 %pgocount19, 1
  store i64 %172, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 32)
  %173 = load %struct.tiff*, %struct.tiff** %3, align 8
  %174 = getelementptr inbounds %struct.tiff, %struct.tiff* %173, i32 0, i32 15
  %175 = load i32, i32* %174, align 8
  %176 = add nsw i32 %175, 1
  store i32 %176, i32* %174, align 8
  br label %177

; <label>:177:                                    ; preds = %171, %153
  %178 = load %struct.tiff*, %struct.tiff** %3, align 8
  %179 = getelementptr inbounds %struct.tiff, %struct.tiff* %178, i32 0, i32 51
  %180 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %179, align 8
  %181 = load %struct.tiff*, %struct.tiff** %3, align 8
  %182 = getelementptr inbounds %struct.tiff, %struct.tiff* %181, i32 0, i32 48
  %183 = load i8*, i8** %182, align 8
  %184 = load %struct.tiff*, %struct.tiff** %3, align 8
  %185 = getelementptr inbounds %struct.tiff, %struct.tiff* %184, i32 0, i32 15
  %186 = load i32, i32* %185, align 8
  %187 = ptrtoint i32 (i8*, i32, i32)* %180 to i64
  call void @__llvm_profile_instrument_target(i64 %187, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteDirectory to i8*), i32 2)
  %188 = call i32 %180(i8* %183, i32 %186, i32 0)
  %189 = load %struct.tiff*, %struct.tiff** %3, align 8
  %190 = getelementptr inbounds %struct.tiff, %struct.tiff* %189, i32 0, i32 12
  %191 = load i16, i16* %190, align 4
  %192 = add i16 %191, 1
  store i16 %192, i16* %190, align 4
  %193 = load i8*, i8** %9, align 8
  %194 = bitcast i8* %193 to %struct.TIFFDirEntry*
  store %struct.TIFFDirEntry* %194, %struct.TIFFDirEntry** %10, align 8
  %195 = getelementptr inbounds [3 x i64], [3 x i64]* %13, i32 0, i32 0
  %196 = bitcast i64* %195 to i8*
  %197 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %198 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %197, i32 0, i32 0
  %199 = getelementptr inbounds [3 x i64], [3 x i64]* %198, i32 0, i32 0
  %200 = bitcast i64* %199 to i8*
  call void @_TIFFmemcpy(i8* %196, i8* %200, i32 24)
  %201 = getelementptr inbounds [3 x i64], [3 x i64]* %13, i64 0, i64 0
  %202 = load i64, i64* %201, align 16
  %203 = and i64 %202, 2147483648
  %204 = icmp ne i64 %203, 0
  br i1 %204, label %205, label %222

; <label>:205:                                    ; preds = %177
  %pgocount20 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 33)
  %206 = add i64 %pgocount20, 1
  store i64 %206, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 33)
  %207 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %208 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %207, i32 0, i32 30
  %209 = load i16, i16* %208, align 4
  %210 = icmp ne i16 %209, 0
  br i1 %210, label %222, label %211

; <label>:211:                                    ; preds = %205
  %pgocount21 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 41)
  %212 = add i64 %pgocount21, 1
  store i64 %212, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 41)
  %213 = getelementptr inbounds [3 x i64], [3 x i64]* %13, i64 0, i64 0
  %214 = load i64, i64* %213, align 16
  %215 = and i64 %214, -2147483649
  store i64 %215, i64* %213, align 16
  %216 = load i32, i32* %7, align 4
  %217 = add i32 %216, -1
  store i32 %217, i32* %7, align 4
  %218 = load i32, i32* %8, align 4
  %219 = sext i32 %218 to i64
  %220 = sub i64 %219, 12
  %221 = trunc i64 %220 to i32
  store i32 %221, i32* %8, align 4
  br label %222

; <label>:222:                                    ; preds = %211, %205, %177
  store i32 0, i32* %14, align 4
  %223 = load %struct.tiff*, %struct.tiff** %3, align 8
  %224 = getelementptr inbounds %struct.tiff, %struct.tiff* %223, i32 0, i32 56
  %225 = load i32, i32* %224, align 8
  store i32 %225, i32* %15, align 4
  br label %226

; <label>:226:                                    ; preds = %565, %222
  %227 = load i32, i32* %15, align 4
  %228 = icmp sgt i32 %227, 0
  br i1 %228, label %229, label %570

; <label>:229:                                    ; preds = %226
  %230 = load %struct.tiff*, %struct.tiff** %3, align 8
  %231 = getelementptr inbounds %struct.tiff, %struct.tiff* %230, i32 0, i32 55
  %232 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %231, align 8
  %233 = load i32, i32* %14, align 4
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %232, i64 %234
  %236 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %235, align 8
  store %struct.TIFFFieldInfo* %236, %struct.TIFFFieldInfo** %16, align 8
  %237 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %16, align 8
  %238 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %237, i32 0, i32 4
  %239 = load i16, i16* %238, align 4
  %240 = zext i16 %239 to i32
  %241 = sdiv i32 %240, 32
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds [3 x i64], [3 x i64]* %13, i64 0, i64 %242
  %244 = load i64, i64* %243, align 8
  %245 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %16, align 8
  %246 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %245, i32 0, i32 4
  %247 = load i16, i16* %246, align 4
  %248 = zext i16 %247 to i32
  %249 = and i32 %248, 31
  %250 = zext i32 %249 to i64
  %251 = shl i64 1, %250
  %252 = and i64 %244, %251
  %253 = icmp ne i64 %252, 0
  br i1 %253, label %256, label %254

; <label>:254:                                    ; preds = %229
  %pgocount22 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 10)
  %255 = add i64 %pgocount22, 1
  store i64 %255, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 10)
  br label %565

; <label>:256:                                    ; preds = %229
  %257 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %16, align 8
  %258 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %257, i32 0, i32 4
  %259 = load i16, i16* %258, align 4
  %260 = zext i16 %259 to i32
  switch i32 %260, label %535 [
    i32 25, label %268
    i32 24, label %300
    i32 17, label %332
    i32 26, label %339
    i32 1, label %351
    i32 2, label %364
    i32 4, label %377
    i32 3, label %400
    i32 6, label %._crit_edge
    i32 18, label %._crit_edge1
    i32 19, label %._crit_edge2
    i32 32, label %423
    i32 33, label %._crit_edge3
    i32 34, label %435
    i32 23, label %._crit_edge4
    i32 37, label %._crit_edge5
    i32 39, label %._crit_edge6
    i32 47, label %449
    i32 46, label %461
    i32 44, label %470
    i32 49, label %479
  ]

._crit_edge6:                                     ; preds = %256
  %pgocount23 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 6)
  %261 = add i64 %pgocount23, 1
  store i64 %261, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 6)
  br label %449

._crit_edge5:                                     ; preds = %256
  %pgocount24 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 5)
  %262 = add i64 %pgocount24, 1
  store i64 %262, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 5)
  br label %449

._crit_edge4:                                     ; preds = %256
  %pgocount25 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 4)
  %263 = add i64 %pgocount25, 1
  store i64 %263, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 4)
  br label %449

._crit_edge3:                                     ; preds = %256
  %pgocount26 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 3)
  %264 = add i64 %pgocount26, 1
  store i64 %264, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 3)
  br label %435

._crit_edge2:                                     ; preds = %256
  %pgocount27 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 2)
  %265 = add i64 %pgocount27, 1
  store i64 %265, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 2)
  br label %423

._crit_edge1:                                     ; preds = %256
  %pgocount28 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 1)
  %266 = add i64 %pgocount28, 1
  store i64 %266, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 1)
  br label %423

._crit_edge:                                      ; preds = %256
  %pgocount29 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 0)
  %267 = add i64 %pgocount29, 1
  store i64 %267, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 0)
  br label %423

; <label>:268:                                    ; preds = %256
  %269 = load %struct.tiff*, %struct.tiff** %3, align 8
  %270 = getelementptr inbounds %struct.tiff, %struct.tiff* %269, i32 0, i32 3
  %271 = load i32, i32* %270, align 8
  %272 = and i32 %271, 1024
  %273 = icmp ne i32 %272, 0
  %274 = zext i1 %273 to i64
  %pgocount30 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 63)
  %275 = add i64 %pgocount30, %274
  store i64 %275, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 63)
  %276 = select i1 %273, i32 324, i32 273
  store i32 %276, i32* %6, align 4
  %277 = load i32, i32* %6, align 4
  %278 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %16, align 8
  %279 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %278, i32 0, i32 0
  %280 = load i32, i32* %279, align 8
  %281 = icmp ne i32 %277, %280
  br i1 %281, label %282, label %284

; <label>:282:                                    ; preds = %268
  %pgocount31 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 37)
  %283 = add i64 %pgocount31, 1
  store i64 %283, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 37)
  br label %565

; <label>:284:                                    ; preds = %268
  %285 = load %struct.tiff*, %struct.tiff** %3, align 8
  %286 = load i32, i32* %6, align 4
  %287 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %288 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %289 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %288, i32 0, i32 43
  %290 = load i32, i32* %289, align 4
  %291 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %292 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %291, i32 0, i32 44
  %293 = load i32*, i32** %292, align 8
  %294 = call i32 @TIFFWriteLongArray(%struct.tiff* %285, i32 4, i32 %286, %struct.TIFFDirEntry* %287, i32 %290, i32* %293)
  %295 = icmp ne i32 %294, 0
  br i1 %295, label %298, label %296

; <label>:296:                                    ; preds = %284
  %pgocount32 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 60)
  %297 = add i64 %pgocount32, 1
  store i64 %297, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 60)
  br label %686

; <label>:298:                                    ; preds = %284
  %pgocount33 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 39)
  %299 = add i64 %pgocount33, 1
  store i64 %299, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 39)
  br label %545

; <label>:300:                                    ; preds = %256
  %301 = load %struct.tiff*, %struct.tiff** %3, align 8
  %302 = getelementptr inbounds %struct.tiff, %struct.tiff* %301, i32 0, i32 3
  %303 = load i32, i32* %302, align 8
  %304 = and i32 %303, 1024
  %305 = icmp ne i32 %304, 0
  %306 = zext i1 %305 to i64
  %pgocount34 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 64)
  %307 = add i64 %pgocount34, %306
  store i64 %307, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 64)
  %308 = select i1 %305, i32 325, i32 279
  store i32 %308, i32* %6, align 4
  %309 = load i32, i32* %6, align 4
  %310 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %16, align 8
  %311 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %310, i32 0, i32 0
  %312 = load i32, i32* %311, align 8
  %313 = icmp ne i32 %309, %312
  br i1 %313, label %314, label %316

; <label>:314:                                    ; preds = %300
  %pgocount35 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 38)
  %315 = add i64 %pgocount35, 1
  store i64 %315, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 38)
  br label %565

; <label>:316:                                    ; preds = %300
  %317 = load %struct.tiff*, %struct.tiff** %3, align 8
  %318 = load i32, i32* %6, align 4
  %319 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %320 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %321 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %320, i32 0, i32 43
  %322 = load i32, i32* %321, align 4
  %323 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %324 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %323, i32 0, i32 45
  %325 = load i32*, i32** %324, align 8
  %326 = call i32 @TIFFWriteLongArray(%struct.tiff* %317, i32 4, i32 %318, %struct.TIFFDirEntry* %319, i32 %322, i32* %325)
  %327 = icmp ne i32 %326, 0
  br i1 %327, label %330, label %328

; <label>:328:                                    ; preds = %316
  %pgocount36 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 61)
  %329 = add i64 %pgocount36, 1
  store i64 %329, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 61)
  br label %686

; <label>:330:                                    ; preds = %316
  %pgocount37 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 40)
  %331 = add i64 %pgocount37, 1
  store i64 %331, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 40)
  br label %545

; <label>:332:                                    ; preds = %256
  %pgocount38 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 21)
  %333 = add i64 %pgocount38, 1
  store i64 %333, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 21)
  %334 = load %struct.tiff*, %struct.tiff** %3, align 8
  %335 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %336 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %337 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %336, i32 0, i32 16
  %338 = load i32, i32* %337, align 4
  call void @TIFFSetupShortLong(%struct.tiff* %334, i32 278, %struct.TIFFDirEntry* %335, i32 %338)
  br label %545

; <label>:339:                                    ; preds = %256
  %340 = load %struct.tiff*, %struct.tiff** %3, align 8
  %341 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %342 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %343 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %342, i32 0, i32 28
  %344 = getelementptr inbounds [3 x i16*], [3 x i16*]* %343, i32 0, i32 0
  %345 = call i32 @TIFFWriteShortTable(%struct.tiff* %340, i32 320, %struct.TIFFDirEntry* %341, i32 3, i16** %344)
  %346 = icmp ne i32 %345, 0
  br i1 %346, label %349, label %347

; <label>:347:                                    ; preds = %339
  %pgocount39 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 51)
  %348 = add i64 %pgocount39, 1
  store i64 %348, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 51)
  br label %686

; <label>:349:                                    ; preds = %339
  %pgocount40 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 25)
  %350 = add i64 %pgocount40, 1
  store i64 %350, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 25)
  br label %545

; <label>:351:                                    ; preds = %256
  %pgocount41 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 22)
  %352 = add i64 %pgocount41, 1
  store i64 %352, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 22)
  %353 = load %struct.tiff*, %struct.tiff** %3, align 8
  %354 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %355 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %354, i32 1
  store %struct.TIFFDirEntry* %355, %struct.TIFFDirEntry** %10, align 8
  %356 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %357 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %356, i32 0, i32 1
  %358 = load i32, i32* %357, align 8
  call void @TIFFSetupShortLong(%struct.tiff* %353, i32 256, %struct.TIFFDirEntry* %354, i32 %358)
  %359 = load %struct.tiff*, %struct.tiff** %3, align 8
  %360 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %361 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %362 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %361, i32 0, i32 2
  %363 = load i32, i32* %362, align 4
  call void @TIFFSetupShortLong(%struct.tiff* %359, i32 257, %struct.TIFFDirEntry* %360, i32 %363)
  br label %545

; <label>:364:                                    ; preds = %256
  %pgocount42 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 23)
  %365 = add i64 %pgocount42, 1
  store i64 %365, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 23)
  %366 = load %struct.tiff*, %struct.tiff** %3, align 8
  %367 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %368 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %367, i32 1
  store %struct.TIFFDirEntry* %368, %struct.TIFFDirEntry** %10, align 8
  %369 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %370 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %369, i32 0, i32 4
  %371 = load i32, i32* %370, align 4
  call void @TIFFSetupShortLong(%struct.tiff* %366, i32 322, %struct.TIFFDirEntry* %367, i32 %371)
  %372 = load %struct.tiff*, %struct.tiff** %3, align 8
  %373 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %374 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %375 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %374, i32 0, i32 5
  %376 = load i32, i32* %375, align 8
  call void @TIFFSetupShortLong(%struct.tiff* %372, i32 323, %struct.TIFFDirEntry* %373, i32 %376)
  br label %545

; <label>:377:                                    ; preds = %256
  %378 = load %struct.tiff*, %struct.tiff** %3, align 8
  %379 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %380 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %381 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %380, i32 0, i32 25
  %382 = call i32 @TIFFWriteRationalArray(%struct.tiff* %378, i32 5, i32 286, %struct.TIFFDirEntry* %379, i32 1, float* %381)
  %383 = icmp ne i32 %382, 0
  br i1 %383, label %386, label %384

; <label>:384:                                    ; preds = %377
  %pgocount43 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 52)
  %385 = add i64 %pgocount43, 1
  store i64 %385, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 52)
  br label %686

; <label>:386:                                    ; preds = %377
  %387 = load %struct.tiff*, %struct.tiff** %3, align 8
  %388 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %389 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %388, i64 1
  %390 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %391 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %390, i32 0, i32 26
  %392 = call i32 @TIFFWriteRationalArray(%struct.tiff* %387, i32 5, i32 287, %struct.TIFFDirEntry* %389, i32 1, float* %391)
  %393 = icmp ne i32 %392, 0
  br i1 %393, label %396, label %394

; <label>:394:                                    ; preds = %386
  %pgocount44 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 53)
  %395 = add i64 %pgocount44, 1
  store i64 %395, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 53)
  br label %686

; <label>:396:                                    ; preds = %386
  %pgocount45 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 30)
  %397 = add i64 %pgocount45, 1
  store i64 %397, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 30)
  %398 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %399 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %398, i32 1
  store %struct.TIFFDirEntry* %399, %struct.TIFFDirEntry** %10, align 8
  br label %545

; <label>:400:                                    ; preds = %256
  %401 = load %struct.tiff*, %struct.tiff** %3, align 8
  %402 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %403 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %404 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %403, i32 0, i32 21
  %405 = call i32 @TIFFWriteRationalArray(%struct.tiff* %401, i32 5, i32 282, %struct.TIFFDirEntry* %402, i32 1, float* %404)
  %406 = icmp ne i32 %405, 0
  br i1 %406, label %409, label %407

; <label>:407:                                    ; preds = %400
  %pgocount46 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 54)
  %408 = add i64 %pgocount46, 1
  store i64 %408, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 54)
  br label %686

; <label>:409:                                    ; preds = %400
  %410 = load %struct.tiff*, %struct.tiff** %3, align 8
  %411 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %412 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %411, i64 1
  %413 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %414 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %413, i32 0, i32 22
  %415 = call i32 @TIFFWriteRationalArray(%struct.tiff* %410, i32 5, i32 283, %struct.TIFFDirEntry* %412, i32 1, float* %414)
  %416 = icmp ne i32 %415, 0
  br i1 %416, label %419, label %417

; <label>:417:                                    ; preds = %409
  %pgocount47 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 55)
  %418 = add i64 %pgocount47, 1
  store i64 %418, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 55)
  br label %686

; <label>:419:                                    ; preds = %409
  %pgocount48 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 31)
  %420 = add i64 %pgocount48, 1
  store i64 %420, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 31)
  %421 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %422 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %421, i32 1
  store %struct.TIFFDirEntry* %422, %struct.TIFFDirEntry** %10, align 8
  br label %545

; <label>:423:                                    ; preds = %._crit_edge2, %._crit_edge1, %._crit_edge, %256
  %424 = load %struct.tiff*, %struct.tiff** %3, align 8
  %425 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %16, align 8
  %426 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %425, i32 0, i32 0
  %427 = load i32, i32* %426, align 8
  %428 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %429 = call i32 @TIFFWritePerSampleShorts(%struct.tiff* %424, i32 %427, %struct.TIFFDirEntry* %428)
  %430 = icmp ne i32 %429, 0
  br i1 %430, label %433, label %431

; <label>:431:                                    ; preds = %423
  %pgocount49 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 48)
  %432 = add i64 %pgocount49, 1
  store i64 %432, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 48)
  br label %686

; <label>:433:                                    ; preds = %423
  %pgocount50 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 11)
  %434 = add i64 %pgocount50, 1
  store i64 %434, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 11)
  br label %545

; <label>:435:                                    ; preds = %._crit_edge3, %256
  %436 = load %struct.tiff*, %struct.tiff** %3, align 8
  %437 = load %struct.tiff*, %struct.tiff** %3, align 8
  %438 = call i32 @_TIFFSampleToTagType(%struct.tiff* %437)
  %439 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %16, align 8
  %440 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %439, i32 0, i32 0
  %441 = load i32, i32* %440, align 8
  %442 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %443 = call i32 @TIFFWritePerSampleAnys(%struct.tiff* %436, i32 %438, i32 %441, %struct.TIFFDirEntry* %442)
  %444 = icmp ne i32 %443, 0
  br i1 %444, label %447, label %445

; <label>:445:                                    ; preds = %435
  %pgocount51 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 50)
  %446 = add i64 %pgocount51, 1
  store i64 %446, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 50)
  br label %686

; <label>:447:                                    ; preds = %435
  %pgocount52 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 15)
  %448 = add i64 %pgocount52, 1
  store i64 %448, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 15)
  br label %545

; <label>:449:                                    ; preds = %._crit_edge6, %._crit_edge5, %._crit_edge4, %256
  %450 = load %struct.tiff*, %struct.tiff** %3, align 8
  %451 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %16, align 8
  %452 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %451, i32 0, i32 0
  %453 = load i32, i32* %452, align 8
  %454 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %455 = call i32 @TIFFSetupShortPair(%struct.tiff* %450, i32 %453, %struct.TIFFDirEntry* %454)
  %456 = icmp ne i32 %455, 0
  br i1 %456, label %459, label %457

; <label>:457:                                    ; preds = %449
  %pgocount53 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 49)
  %458 = add i64 %pgocount53, 1
  store i64 %458, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 49)
  br label %686

; <label>:459:                                    ; preds = %449
  %pgocount54 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 12)
  %460 = add i64 %pgocount54, 1
  store i64 %460, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 12)
  br label %545

; <label>:461:                                    ; preds = %256
  %462 = load %struct.tiff*, %struct.tiff** %3, align 8
  %463 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %464 = call i32 @TIFFWriteInkNames(%struct.tiff* %462, %struct.TIFFDirEntry* %463)
  %465 = icmp ne i32 %464, 0
  br i1 %465, label %468, label %466

; <label>:466:                                    ; preds = %461
  %pgocount55 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 56)
  %467 = add i64 %pgocount55, 1
  store i64 %467, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 56)
  br label %686

; <label>:468:                                    ; preds = %461
  %pgocount56 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 26)
  %469 = add i64 %pgocount56, 1
  store i64 %469, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 26)
  br label %545

; <label>:470:                                    ; preds = %256
  %471 = load %struct.tiff*, %struct.tiff** %3, align 8
  %472 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %473 = call i32 @TIFFWriteTransferFunction(%struct.tiff* %471, %struct.TIFFDirEntry* %472)
  %474 = icmp ne i32 %473, 0
  br i1 %474, label %477, label %475

; <label>:475:                                    ; preds = %470
  %pgocount57 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 57)
  %476 = add i64 %pgocount57, 1
  store i64 %476, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 57)
  br label %686

; <label>:477:                                    ; preds = %470
  %pgocount58 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 27)
  %478 = add i64 %pgocount58, 1
  store i64 %478, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 27)
  br label %545

; <label>:479:                                    ; preds = %256
  %480 = load %struct.tiff*, %struct.tiff** %3, align 8
  %481 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %482 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %16, align 8
  %483 = call i32 @TIFFWriteNormalTag(%struct.tiff* %480, %struct.TIFFDirEntry* %481, %struct.TIFFFieldInfo* %482)
  %484 = icmp ne i32 %483, 0
  br i1 %484, label %487, label %485

; <label>:485:                                    ; preds = %479
  %pgocount59 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 58)
  %486 = add i64 %pgocount59, 1
  store i64 %486, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 58)
  br label %686

; <label>:487:                                    ; preds = %479
  %488 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %489 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %488, i32 0, i32 2
  %490 = load i32, i32* %489, align 4
  %491 = icmp ugt i32 %490, 0
  br i1 %491, label %492, label %533

; <label>:492:                                    ; preds = %487
  %493 = load %struct.tiff*, %struct.tiff** %3, align 8
  %494 = getelementptr inbounds %struct.tiff, %struct.tiff* %493, i32 0, i32 3
  %495 = load i32, i32* %494, align 8
  %496 = or i32 %495, 8192
  store i32 %496, i32* %494, align 8
  %497 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %498 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %497, i32 0, i32 2
  %499 = load i32, i32* %498, align 4
  %500 = trunc i32 %499 to i16
  %501 = load %struct.tiff*, %struct.tiff** %3, align 8
  %502 = getelementptr inbounds %struct.tiff, %struct.tiff* %501, i32 0, i32 16
  store i16 %500, i16* %502, align 4
  %503 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %504 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %503, i32 0, i32 2
  %505 = load i32, i32* %504, align 4
  %506 = icmp ugt i32 %505, 1
  br i1 %506, label %507, label %514

; <label>:507:                                    ; preds = %492
  %pgocount60 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 44)
  %508 = add i64 %pgocount60, 1
  store i64 %508, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 44)
  %509 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %510 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %509, i32 0, i32 3
  %511 = load i32, i32* %510, align 4
  %512 = load %struct.tiff*, %struct.tiff** %3, align 8
  %513 = getelementptr inbounds %struct.tiff, %struct.tiff* %512, i32 0, i32 17
  store i32 %511, i32* %513, align 8
  br label %532

; <label>:514:                                    ; preds = %492
  %pgocount61 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 45)
  %515 = add i64 %pgocount61, 1
  store i64 %515, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 45)
  %516 = load %struct.tiff*, %struct.tiff** %3, align 8
  %517 = getelementptr inbounds %struct.tiff, %struct.tiff* %516, i32 0, i32 4
  %518 = load i32, i32* %517, align 4
  %519 = sext i32 %518 to i64
  %520 = add i64 %519, 2
  %521 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %522 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %521, i32 0, i32 3
  %523 = bitcast i32* %522 to i8*
  %524 = load i8*, i8** %9, align 8
  %525 = ptrtoint i8* %523 to i64
  %526 = ptrtoint i8* %524 to i64
  %527 = sub i64 %525, %526
  %528 = add i64 %520, %527
  %529 = trunc i64 %528 to i32
  %530 = load %struct.tiff*, %struct.tiff** %3, align 8
  %531 = getelementptr inbounds %struct.tiff, %struct.tiff* %530, i32 0, i32 17
  store i32 %529, i32* %531, align 8
  br label %532

; <label>:532:                                    ; preds = %514, %507
  br label %533

; <label>:533:                                    ; preds = %532, %487
  %pgocount62 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 28)
  %534 = add i64 %pgocount62, 1
  store i64 %534, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 28)
  br label %545

; <label>:535:                                    ; preds = %256
  %536 = load %struct.tiff*, %struct.tiff** %3, align 8
  %537 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %538 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %16, align 8
  %539 = call i32 @TIFFWriteNormalTag(%struct.tiff* %536, %struct.TIFFDirEntry* %537, %struct.TIFFFieldInfo* %538)
  %540 = icmp ne i32 %539, 0
  br i1 %540, label %543, label %541

; <label>:541:                                    ; preds = %535
  %pgocount63 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 59)
  %542 = add i64 %pgocount63, 1
  store i64 %542, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 59)
  br label %686

; <label>:543:                                    ; preds = %535
  %pgocount64 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 29)
  %544 = add i64 %pgocount64, 1
  store i64 %544, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 29)
  br label %545

; <label>:545:                                    ; preds = %543, %533, %477, %468, %459, %447, %433, %419, %396, %364, %351, %349, %332, %330, %298
  %546 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %547 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %546, i32 1
  store %struct.TIFFDirEntry* %547, %struct.TIFFDirEntry** %10, align 8
  %548 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %16, align 8
  %549 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %548, i32 0, i32 4
  %550 = load i16, i16* %549, align 4
  %551 = zext i16 %550 to i32
  %552 = and i32 %551, 31
  %553 = zext i32 %552 to i64
  %554 = shl i64 1, %553
  %555 = xor i64 %554, -1
  %556 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %16, align 8
  %557 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %556, i32 0, i32 4
  %558 = load i16, i16* %557, align 4
  %559 = zext i16 %558 to i32
  %560 = sdiv i32 %559, 32
  %561 = sext i32 %560 to i64
  %562 = getelementptr inbounds [3 x i64], [3 x i64]* %13, i64 0, i64 %561
  %563 = load i64, i64* %562, align 8
  %564 = and i64 %563, %555
  store i64 %564, i64* %562, align 8
  br label %565

; <label>:565:                                    ; preds = %545, %314, %282, %254
  %566 = load i32, i32* %15, align 4
  %567 = add nsw i32 %566, -1
  store i32 %567, i32* %15, align 4
  %568 = load i32, i32* %14, align 4
  %569 = add nsw i32 %568, 1
  store i32 %569, i32* %14, align 4
  br label %226

; <label>:570:                                    ; preds = %226
  %571 = load i32, i32* %7, align 4
  %572 = trunc i32 %571 to i16
  store i16 %572, i16* %4, align 2
  %573 = load %struct.tiff*, %struct.tiff** %3, align 8
  %574 = getelementptr inbounds %struct.tiff, %struct.tiff* %573, i32 0, i32 5
  %575 = load i32, i32* %574, align 8
  store i32 %575, i32* %5, align 4
  %576 = load %struct.tiff*, %struct.tiff** %3, align 8
  %577 = getelementptr inbounds %struct.tiff, %struct.tiff* %576, i32 0, i32 3
  %578 = load i32, i32* %577, align 8
  %579 = and i32 %578, 128
  %580 = icmp ne i32 %579, 0
  br i1 %580, label %581, label %602

; <label>:581:                                    ; preds = %570
  %582 = load i8*, i8** %9, align 8
  %583 = bitcast i8* %582 to %struct.TIFFDirEntry*
  store %struct.TIFFDirEntry* %583, %struct.TIFFDirEntry** %10, align 8
  br label %584

; <label>:584:                                    ; preds = %593, %581
  %585 = load i16, i16* %4, align 2
  %586 = icmp ne i16 %585, 0
  br i1 %586, label %587, label %598

; <label>:587:                                    ; preds = %584
  %pgocount65 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 9)
  %588 = add i64 %pgocount65, 1
  store i64 %588, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 9)
  %589 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %590 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %589, i32 0, i32 0
  call void @TIFFSwabArrayOfShort(i16* %590, i64 2)
  %591 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %592 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %591, i32 0, i32 2
  call void @TIFFSwabArrayOfLong(i32* %592, i64 2)
  br label %593

; <label>:593:                                    ; preds = %587
  %594 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %595 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %594, i32 1
  store %struct.TIFFDirEntry* %595, %struct.TIFFDirEntry** %10, align 8
  %596 = load i16, i16* %4, align 2
  %597 = add i16 %596, -1
  store i16 %597, i16* %4, align 2
  br label %584

; <label>:598:                                    ; preds = %584
  %pgocount66 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 35)
  %599 = add i64 %pgocount66, 1
  store i64 %599, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 35)
  %600 = load i32, i32* %7, align 4
  %601 = trunc i32 %600 to i16
  store i16 %601, i16* %4, align 2
  call void @TIFFSwabShort(i16* %4)
  call void @TIFFSwabLong(i32* %5)
  br label %602

; <label>:602:                                    ; preds = %598, %570
  %603 = load %struct.tiff*, %struct.tiff** %3, align 8
  %604 = getelementptr inbounds %struct.tiff, %struct.tiff* %603, i32 0, i32 51
  %605 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %604, align 8
  %606 = load %struct.tiff*, %struct.tiff** %3, align 8
  %607 = getelementptr inbounds %struct.tiff, %struct.tiff* %606, i32 0, i32 48
  %608 = load i8*, i8** %607, align 8
  %609 = load %struct.tiff*, %struct.tiff** %3, align 8
  %610 = getelementptr inbounds %struct.tiff, %struct.tiff* %609, i32 0, i32 4
  %611 = load i32, i32* %610, align 4
  %612 = ptrtoint i32 (i8*, i32, i32)* %605 to i64
  call void @__llvm_profile_instrument_target(i64 %612, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteDirectory to i8*), i32 3)
  %613 = call i32 %605(i8* %608, i32 %611, i32 0)
  %614 = load %struct.tiff*, %struct.tiff** %3, align 8
  %615 = getelementptr inbounds %struct.tiff, %struct.tiff* %614, i32 0, i32 50
  %616 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %615, align 8
  %617 = load %struct.tiff*, %struct.tiff** %3, align 8
  %618 = getelementptr inbounds %struct.tiff, %struct.tiff* %617, i32 0, i32 48
  %619 = load i8*, i8** %618, align 8
  %620 = bitcast i16* %4 to i8*
  %621 = ptrtoint i32 (i8*, i8*, i32)* %616 to i64
  call void @__llvm_profile_instrument_target(i64 %621, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteDirectory to i8*), i32 4)
  %622 = call i32 %616(i8* %619, i8* %620, i32 2)
  %623 = icmp eq i32 %622, 2
  br i1 %623, label %629, label %624

; <label>:624:                                    ; preds = %602
  %pgocount67 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 36)
  %625 = add i64 %pgocount67, 1
  store i64 %625, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 36)
  %626 = load %struct.tiff*, %struct.tiff** %3, align 8
  %627 = getelementptr inbounds %struct.tiff, %struct.tiff* %626, i32 0, i32 0
  %628 = load i8*, i8** %627, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %628, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.3, i32 0, i32 0))
  br label %686

; <label>:629:                                    ; preds = %602
  %630 = load %struct.tiff*, %struct.tiff** %3, align 8
  %631 = getelementptr inbounds %struct.tiff, %struct.tiff* %630, i32 0, i32 50
  %632 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %631, align 8
  %633 = load %struct.tiff*, %struct.tiff** %3, align 8
  %634 = getelementptr inbounds %struct.tiff, %struct.tiff* %633, i32 0, i32 48
  %635 = load i8*, i8** %634, align 8
  %636 = load i8*, i8** %9, align 8
  %637 = load i32, i32* %8, align 4
  %638 = ptrtoint i32 (i8*, i8*, i32)* %632 to i64
  call void @__llvm_profile_instrument_target(i64 %638, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteDirectory to i8*), i32 5)
  %639 = call i32 %632(i8* %635, i8* %636, i32 %637)
  %640 = load i32, i32* %8, align 4
  %641 = icmp eq i32 %639, %640
  br i1 %641, label %647, label %642

; <label>:642:                                    ; preds = %629
  %pgocount68 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 43)
  %643 = add i64 %pgocount68, 1
  store i64 %643, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 43)
  %644 = load %struct.tiff*, %struct.tiff** %3, align 8
  %645 = getelementptr inbounds %struct.tiff, %struct.tiff* %644, i32 0, i32 0
  %646 = load i8*, i8** %645, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %646, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.4, i32 0, i32 0))
  br label %686

; <label>:647:                                    ; preds = %629
  %648 = load %struct.tiff*, %struct.tiff** %3, align 8
  %649 = getelementptr inbounds %struct.tiff, %struct.tiff* %648, i32 0, i32 50
  %650 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %649, align 8
  %651 = load %struct.tiff*, %struct.tiff** %3, align 8
  %652 = getelementptr inbounds %struct.tiff, %struct.tiff* %651, i32 0, i32 48
  %653 = load i8*, i8** %652, align 8
  %654 = bitcast i32* %5 to i8*
  %655 = ptrtoint i32 (i8*, i8*, i32)* %650 to i64
  call void @__llvm_profile_instrument_target(i64 %655, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteDirectory to i8*), i32 6)
  %656 = call i32 %650(i8* %653, i8* %654, i32 4)
  %657 = icmp eq i32 %656, 4
  br i1 %657, label %663, label %658

; <label>:658:                                    ; preds = %647
  %pgocount69 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 46)
  %659 = add i64 %pgocount69, 1
  store i64 %659, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 46)
  %660 = load %struct.tiff*, %struct.tiff** %3, align 8
  %661 = getelementptr inbounds %struct.tiff, %struct.tiff* %660, i32 0, i32 0
  %662 = load i8*, i8** %661, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %662, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.5, i32 0, i32 0))
  br label %686

; <label>:663:                                    ; preds = %647
  %pgocount70 = load i64, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 47)
  %664 = add i64 %pgocount70, 1
  store i64 %664, i64* getelementptr inbounds ([65 x i64], [65 x i64]* @__profc_TIFFWriteDirectory, i64 0, i64 47)
  %665 = load %struct.tiff*, %struct.tiff** %3, align 8
  call void @TIFFFreeDirectory(%struct.tiff* %665)
  %666 = load i8*, i8** %9, align 8
  call void @_TIFFfree(i8* %666)
  %667 = load %struct.tiff*, %struct.tiff** %3, align 8
  %668 = getelementptr inbounds %struct.tiff, %struct.tiff* %667, i32 0, i32 3
  %669 = load i32, i32* %668, align 8
  %670 = and i32 %669, -9
  store i32 %670, i32* %668, align 8
  %671 = load %struct.tiff*, %struct.tiff** %3, align 8
  %672 = getelementptr inbounds %struct.tiff, %struct.tiff* %671, i32 0, i32 34
  %673 = load void (%struct.tiff*)*, void (%struct.tiff*)** %672, align 8
  %674 = load %struct.tiff*, %struct.tiff** %3, align 8
  %675 = ptrtoint void (%struct.tiff*)* %673 to i64
  call void @__llvm_profile_instrument_target(i64 %675, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteDirectory to i8*), i32 7)
  call void %673(%struct.tiff* %674)
  %676 = load %struct.tiff*, %struct.tiff** %3, align 8
  %677 = call i32 @TIFFDefaultDirectory(%struct.tiff* %676)
  %678 = load %struct.tiff*, %struct.tiff** %3, align 8
  %679 = getelementptr inbounds %struct.tiff, %struct.tiff* %678, i32 0, i32 4
  store i32 0, i32* %679, align 4
  %680 = load %struct.tiff*, %struct.tiff** %3, align 8
  %681 = getelementptr inbounds %struct.tiff, %struct.tiff* %680, i32 0, i32 14
  store i32 0, i32* %681, align 4
  %682 = load %struct.tiff*, %struct.tiff** %3, align 8
  %683 = getelementptr inbounds %struct.tiff, %struct.tiff* %682, i32 0, i32 11
  store i32 -1, i32* %683, align 8
  %684 = load %struct.tiff*, %struct.tiff** %3, align 8
  %685 = getelementptr inbounds %struct.tiff, %struct.tiff* %684, i32 0, i32 13
  store i32 -1, i32* %685, align 8
  store i32 1, i32* %2, align 4
  br label %688

; <label>:686:                                    ; preds = %658, %642, %624, %541, %485, %475, %466, %457, %445, %431, %417, %407, %394, %384, %347, %328, %296, %151
  %687 = load i8*, i8** %9, align 8
  call void @_TIFFfree(i8* %687)
  store i32 0, i32* %2, align 4
  br label %688

; <label>:688:                                    ; preds = %686, %663, %136, %64, %42, %21
  %689 = load i32, i32* %2, align 4
  ret i32 %689
}

declare void @TIFFError(i8*, i8*, ...) #1

declare i32 @TIFFFlushData1(%struct.tiff*) #1

declare void @_TIFFfree(i8*) #1

declare i8* @_TIFFmalloc(i32) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFLinkDirectory(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %7 = load %struct.tiff*, %struct.tiff** %3, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %7, i32 0, i32 51
  %9 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %8, align 8
  %10 = load %struct.tiff*, %struct.tiff** %3, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 48
  %12 = load i8*, i8** %11, align 8
  %13 = ptrtoint i32 (i8*, i32, i32)* %9 to i64
  call void @__llvm_profile_instrument_target(i64 %13, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFLinkDirectory to i8*), i32 0)
  %14 = call i32 %9(i8* %12, i32 0, i32 2)
  %15 = add nsw i32 %14, 1
  %16 = and i32 %15, -2
  %17 = load %struct.tiff*, %struct.tiff** %3, align 8
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %17, i32 0, i32 4
  store i32 %16, i32* %18, align 4
  %19 = load %struct.tiff*, %struct.tiff** %3, align 8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %19, i32 0, i32 4
  %21 = load i32, i32* %20, align 4
  store i32 %21, i32* %5, align 4
  %22 = load %struct.tiff*, %struct.tiff** %3, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %22, i32 0, i32 3
  %24 = load i32, i32* %23, align 8
  %25 = and i32 %24, 128
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 4)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 4)
  call void @TIFFSwabLong(i32* %5)
  br label %29

; <label>:29:                                     ; preds = %27, %1
  %30 = load %struct.tiff*, %struct.tiff** %3, align 8
  %31 = getelementptr inbounds %struct.tiff, %struct.tiff* %30, i32 0, i32 3
  %32 = load i32, i32* %31, align 8
  %33 = and i32 %32, 8192
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %83

; <label>:35:                                     ; preds = %29
  %36 = load %struct.tiff*, %struct.tiff** %3, align 8
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %36, i32 0, i32 51
  %38 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %37, align 8
  %39 = load %struct.tiff*, %struct.tiff** %3, align 8
  %40 = getelementptr inbounds %struct.tiff, %struct.tiff* %39, i32 0, i32 48
  %41 = load i8*, i8** %40, align 8
  %42 = load %struct.tiff*, %struct.tiff** %3, align 8
  %43 = getelementptr inbounds %struct.tiff, %struct.tiff* %42, i32 0, i32 17
  %44 = load i32, i32* %43, align 8
  %45 = ptrtoint i32 (i8*, i32, i32)* %38 to i64
  call void @__llvm_profile_instrument_target(i64 %45, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFLinkDirectory to i8*), i32 1)
  %46 = call i32 %38(i8* %41, i32 %44, i32 0)
  %47 = load %struct.tiff*, %struct.tiff** %3, align 8
  %48 = getelementptr inbounds %struct.tiff, %struct.tiff* %47, i32 0, i32 50
  %49 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %48, align 8
  %50 = load %struct.tiff*, %struct.tiff** %3, align 8
  %51 = getelementptr inbounds %struct.tiff, %struct.tiff* %50, i32 0, i32 48
  %52 = load i8*, i8** %51, align 8
  %53 = bitcast i32* %5 to i8*
  %54 = ptrtoint i32 (i8*, i8*, i32)* %49 to i64
  call void @__llvm_profile_instrument_target(i64 %54, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFLinkDirectory to i8*), i32 2)
  %55 = call i32 %49(i8* %52, i8* %53, i32 4)
  %56 = icmp eq i32 %55, 4
  br i1 %56, label %62, label %57

; <label>:57:                                     ; preds = %35
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 5)
  %58 = add i64 %pgocount1, 1
  store i64 %58, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 5)
  %59 = load %struct.tiff*, %struct.tiff** %3, align 8
  %60 = getelementptr inbounds %struct.tiff, %struct.tiff* %59, i32 0, i32 0
  %61 = load i8*, i8** %60, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFLinkDirectory.module, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.8, i32 0, i32 0), i8* %61)
  store i32 0, i32* %2, align 4
  br label %221

; <label>:62:                                     ; preds = %35
  %63 = load %struct.tiff*, %struct.tiff** %3, align 8
  %64 = getelementptr inbounds %struct.tiff, %struct.tiff* %63, i32 0, i32 16
  %65 = load i16, i16* %64, align 4
  %66 = add i16 %65, -1
  store i16 %66, i16* %64, align 4
  %67 = icmp ne i16 %66, 0
  br i1 %67, label %68, label %76

; <label>:68:                                     ; preds = %62
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 7)
  %69 = add i64 %pgocount2, 1
  store i64 %69, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 7)
  %70 = load %struct.tiff*, %struct.tiff** %3, align 8
  %71 = getelementptr inbounds %struct.tiff, %struct.tiff* %70, i32 0, i32 17
  %72 = load i32, i32* %71, align 8
  %73 = sext i32 %72 to i64
  %74 = add i64 %73, 4
  %75 = trunc i64 %74 to i32
  store i32 %75, i32* %71, align 8
  br label %82

; <label>:76:                                     ; preds = %62
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 10)
  %77 = add i64 %pgocount3, 1
  store i64 %77, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 10)
  %78 = load %struct.tiff*, %struct.tiff** %3, align 8
  %79 = getelementptr inbounds %struct.tiff, %struct.tiff* %78, i32 0, i32 3
  %80 = load i32, i32* %79, align 8
  %81 = and i32 %80, -8193
  store i32 %81, i32* %79, align 8
  br label %82

; <label>:82:                                     ; preds = %76, %68
  store i32 1, i32* %2, align 4
  br label %221

; <label>:83:                                     ; preds = %29
  %84 = load %struct.tiff*, %struct.tiff** %3, align 8
  %85 = getelementptr inbounds %struct.tiff, %struct.tiff* %84, i32 0, i32 7
  %86 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %85, i32 0, i32 2
  %87 = load i32, i32* %86, align 4
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %89, label %121

; <label>:89:                                     ; preds = %83
  %90 = load %struct.tiff*, %struct.tiff** %3, align 8
  %91 = getelementptr inbounds %struct.tiff, %struct.tiff* %90, i32 0, i32 4
  %92 = load i32, i32* %91, align 4
  %93 = load %struct.tiff*, %struct.tiff** %3, align 8
  %94 = getelementptr inbounds %struct.tiff, %struct.tiff* %93, i32 0, i32 7
  %95 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %94, i32 0, i32 2
  store i32 %92, i32* %95, align 4
  %96 = load %struct.tiff*, %struct.tiff** %3, align 8
  %97 = getelementptr inbounds %struct.tiff, %struct.tiff* %96, i32 0, i32 51
  %98 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %97, align 8
  %99 = load %struct.tiff*, %struct.tiff** %3, align 8
  %100 = getelementptr inbounds %struct.tiff, %struct.tiff* %99, i32 0, i32 48
  %101 = load i8*, i8** %100, align 8
  %102 = ptrtoint i32 (i8*, i32, i32)* %98 to i64
  call void @__llvm_profile_instrument_target(i64 %102, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFLinkDirectory to i8*), i32 3)
  %103 = call i32 %98(i8* %101, i32 ptrtoint (i32* getelementptr inbounds (%struct.TIFFHeader, %struct.TIFFHeader* null, i32 0, i32 2) to i32), i32 0)
  %104 = load %struct.tiff*, %struct.tiff** %3, align 8
  %105 = getelementptr inbounds %struct.tiff, %struct.tiff* %104, i32 0, i32 50
  %106 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %105, align 8
  %107 = load %struct.tiff*, %struct.tiff** %3, align 8
  %108 = getelementptr inbounds %struct.tiff, %struct.tiff* %107, i32 0, i32 48
  %109 = load i8*, i8** %108, align 8
  %110 = bitcast i32* %5 to i8*
  %111 = ptrtoint i32 (i8*, i8*, i32)* %106 to i64
  call void @__llvm_profile_instrument_target(i64 %111, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFLinkDirectory to i8*), i32 4)
  %112 = call i32 %106(i8* %109, i8* %110, i32 4)
  %113 = icmp eq i32 %112, 4
  br i1 %113, label %119, label %114

; <label>:114:                                    ; preds = %89
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 8)
  %115 = add i64 %pgocount4, 1
  store i64 %115, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 8)
  %116 = load %struct.tiff*, %struct.tiff** %3, align 8
  %117 = getelementptr inbounds %struct.tiff, %struct.tiff* %116, i32 0, i32 0
  %118 = load i8*, i8** %117, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %118, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.9, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %221

; <label>:119:                                    ; preds = %89
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 9)
  %120 = add i64 %pgocount5, 1
  store i64 %120, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 9)
  store i32 1, i32* %2, align 4
  br label %221

; <label>:121:                                    ; preds = %83
  %122 = load %struct.tiff*, %struct.tiff** %3, align 8
  %123 = getelementptr inbounds %struct.tiff, %struct.tiff* %122, i32 0, i32 7
  %124 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %123, i32 0, i32 2
  %125 = load i32, i32* %124, align 4
  store i32 %125, i32* %4, align 4
  br label %126

; <label>:126:                                    ; preds = %195, %121
  %127 = load %struct.tiff*, %struct.tiff** %3, align 8
  %128 = getelementptr inbounds %struct.tiff, %struct.tiff* %127, i32 0, i32 51
  %129 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %128, align 8
  %130 = load %struct.tiff*, %struct.tiff** %3, align 8
  %131 = getelementptr inbounds %struct.tiff, %struct.tiff* %130, i32 0, i32 48
  %132 = load i8*, i8** %131, align 8
  %133 = load i32, i32* %4, align 4
  %134 = ptrtoint i32 (i8*, i32, i32)* %129 to i64
  call void @__llvm_profile_instrument_target(i64 %134, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFLinkDirectory to i8*), i32 5)
  %135 = call i32 %129(i8* %132, i32 %133, i32 0)
  %136 = load i32, i32* %4, align 4
  %137 = icmp eq i32 %135, %136
  br i1 %137, label %138, label %150

; <label>:138:                                    ; preds = %126
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 0)
  %139 = add i64 %pgocount6, 1
  store i64 %139, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 0)
  %140 = load %struct.tiff*, %struct.tiff** %3, align 8
  %141 = getelementptr inbounds %struct.tiff, %struct.tiff* %140, i32 0, i32 49
  %142 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %141, align 8
  %143 = load %struct.tiff*, %struct.tiff** %3, align 8
  %144 = getelementptr inbounds %struct.tiff, %struct.tiff* %143, i32 0, i32 48
  %145 = load i8*, i8** %144, align 8
  %146 = bitcast i16* %6 to i8*
  %147 = ptrtoint i32 (i8*, i8*, i32)* %142 to i64
  call void @__llvm_profile_instrument_target(i64 %147, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFLinkDirectory to i8*), i32 6)
  %148 = call i32 %142(i8* %145, i8* %146, i32 2)
  %149 = icmp eq i32 %148, 2
  br i1 %149, label %152, label %150

; <label>:150:                                    ; preds = %138, %126
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 6)
  %151 = add i64 %pgocount7, 1
  store i64 %151, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 6)
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFLinkDirectory.module, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.10, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %221

; <label>:152:                                    ; preds = %138
  %153 = load %struct.tiff*, %struct.tiff** %3, align 8
  %154 = getelementptr inbounds %struct.tiff, %struct.tiff* %153, i32 0, i32 3
  %155 = load i32, i32* %154, align 8
  %156 = and i32 %155, 128
  %157 = icmp ne i32 %156, 0
  br i1 %157, label %158, label %160

; <label>:158:                                    ; preds = %152
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 2)
  %159 = add i64 %pgocount8, 1
  store i64 %159, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 2)
  call void @TIFFSwabShort(i16* %6)
  br label %160

; <label>:160:                                    ; preds = %158, %152
  %161 = load %struct.tiff*, %struct.tiff** %3, align 8
  %162 = getelementptr inbounds %struct.tiff, %struct.tiff* %161, i32 0, i32 51
  %163 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %162, align 8
  %164 = load %struct.tiff*, %struct.tiff** %3, align 8
  %165 = getelementptr inbounds %struct.tiff, %struct.tiff* %164, i32 0, i32 48
  %166 = load i8*, i8** %165, align 8
  %167 = load i16, i16* %6, align 2
  %168 = zext i16 %167 to i64
  %169 = mul i64 %168, 12
  %170 = trunc i64 %169 to i32
  %171 = ptrtoint i32 (i8*, i32, i32)* %163 to i64
  call void @__llvm_profile_instrument_target(i64 %171, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFLinkDirectory to i8*), i32 7)
  %172 = call i32 %163(i8* %166, i32 %170, i32 1)
  %173 = load %struct.tiff*, %struct.tiff** %3, align 8
  %174 = getelementptr inbounds %struct.tiff, %struct.tiff* %173, i32 0, i32 49
  %175 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %174, align 8
  %176 = load %struct.tiff*, %struct.tiff** %3, align 8
  %177 = getelementptr inbounds %struct.tiff, %struct.tiff* %176, i32 0, i32 48
  %178 = load i8*, i8** %177, align 8
  %179 = bitcast i32* %4 to i8*
  %180 = ptrtoint i32 (i8*, i8*, i32)* %175 to i64
  call void @__llvm_profile_instrument_target(i64 %180, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFLinkDirectory to i8*), i32 8)
  %181 = call i32 %175(i8* %178, i8* %179, i32 4)
  %182 = icmp eq i32 %181, 4
  br i1 %182, label %185, label %183

; <label>:183:                                    ; preds = %160
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 11)
  %184 = add i64 %pgocount9, 1
  store i64 %184, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 11)
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFLinkDirectory.module, i32 0, i32 0), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.11, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %221

; <label>:185:                                    ; preds = %160
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 1)
  %186 = add i64 %pgocount10, 1
  store i64 %186, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 1)
  %187 = load %struct.tiff*, %struct.tiff** %3, align 8
  %188 = getelementptr inbounds %struct.tiff, %struct.tiff* %187, i32 0, i32 3
  %189 = load i32, i32* %188, align 8
  %190 = and i32 %189, 128
  %191 = icmp ne i32 %190, 0
  br i1 %191, label %192, label %194

; <label>:192:                                    ; preds = %185
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 3)
  %193 = add i64 %pgocount11, 1
  store i64 %193, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 3)
  call void @TIFFSwabLong(i32* %4)
  br label %194

; <label>:194:                                    ; preds = %192, %185
  br label %195

; <label>:195:                                    ; preds = %194
  %196 = load i32, i32* %4, align 4
  %197 = icmp ne i32 %196, 0
  br i1 %197, label %126, label %198

; <label>:198:                                    ; preds = %195
  %199 = load %struct.tiff*, %struct.tiff** %3, align 8
  %200 = getelementptr inbounds %struct.tiff, %struct.tiff* %199, i32 0, i32 51
  %201 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %200, align 8
  %202 = load %struct.tiff*, %struct.tiff** %3, align 8
  %203 = getelementptr inbounds %struct.tiff, %struct.tiff* %202, i32 0, i32 48
  %204 = load i8*, i8** %203, align 8
  %205 = ptrtoint i32 (i8*, i32, i32)* %201 to i64
  call void @__llvm_profile_instrument_target(i64 %205, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFLinkDirectory to i8*), i32 9)
  %206 = call i32 %201(i8* %204, i32 -4, i32 1)
  %207 = load %struct.tiff*, %struct.tiff** %3, align 8
  %208 = getelementptr inbounds %struct.tiff, %struct.tiff* %207, i32 0, i32 50
  %209 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %208, align 8
  %210 = load %struct.tiff*, %struct.tiff** %3, align 8
  %211 = getelementptr inbounds %struct.tiff, %struct.tiff* %210, i32 0, i32 48
  %212 = load i8*, i8** %211, align 8
  %213 = bitcast i32* %5 to i8*
  %214 = ptrtoint i32 (i8*, i8*, i32)* %209 to i64
  call void @__llvm_profile_instrument_target(i64 %214, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFLinkDirectory to i8*), i32 10)
  %215 = call i32 %209(i8* %212, i8* %213, i32 4)
  %216 = icmp eq i32 %215, 4
  br i1 %216, label %219, label %217

; <label>:217:                                    ; preds = %198
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 13)
  %218 = add i64 %pgocount12, 1
  store i64 %218, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 13)
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFLinkDirectory.module, i32 0, i32 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.5, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %221

; <label>:219:                                    ; preds = %198
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 12)
  %220 = add i64 %pgocount13, 1
  store i64 %220, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_TIFFLinkDirectory, i64 0, i64 12)
  store i32 1, i32* %2, align 4
  br label %221

; <label>:221:                                    ; preds = %219, %217, %183, %150, %119, %114, %82, %57
  %222 = load i32, i32* %2, align 4
  ret i32 %222
}

declare void @_TIFFmemcpy(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFWriteLongArray(%struct.tiff*, i32, i32, %struct.TIFFDirEntry*, i32, i32*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca %struct.tiff*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.TIFFDirEntry*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32*, align 8
  store %struct.tiff* %0, %struct.tiff** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32 %2, i32* %10, align 4
  store %struct.TIFFDirEntry* %3, %struct.TIFFDirEntry** %11, align 8
  store i32 %4, i32* %12, align 4
  store i32* %5, i32** %13, align 8
  %14 = load i32, i32* %10, align 4
  %15 = trunc i32 %14 to i16
  %16 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %17 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %16, i32 0, i32 0
  store i16 %15, i16* %17, align 4
  %18 = load i32, i32* %9, align 4
  %19 = trunc i32 %18 to i16
  %20 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %21 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %20, i32 0, i32 1
  store i16 %19, i16* %21, align 2
  %22 = load i32, i32* %12, align 4
  %23 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %24 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %23, i32 0, i32 2
  store i32 %22, i32* %24, align 4
  %25 = load i32, i32* %12, align 4
  %26 = icmp eq i32 %25, 1
  br i1 %26, label %27, label %34

; <label>:27:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFWriteLongArray, i64 0, i64 0)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFWriteLongArray, i64 0, i64 0)
  %29 = load i32*, i32** %13, align 8
  %30 = getelementptr inbounds i32, i32* %29, i64 0
  %31 = load i32, i32* %30, align 4
  %32 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %33 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %32, i32 0, i32 3
  store i32 %31, i32* %33, align 4
  store i32 1, i32* %7, align 4
  br label %41

; <label>:34:                                     ; preds = %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFWriteLongArray, i64 0, i64 1)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFWriteLongArray, i64 0, i64 1)
  %36 = load %struct.tiff*, %struct.tiff** %8, align 8
  %37 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %38 = load i32*, i32** %13, align 8
  %39 = bitcast i32* %38 to i8*
  %40 = call i32 @TIFFWriteData(%struct.tiff* %36, %struct.TIFFDirEntry* %37, i8* %39)
  store i32 %40, i32* %7, align 4
  br label %41

; <label>:41:                                     ; preds = %34, %27
  %42 = load i32, i32* %7, align 4
  ret i32 %42
}

; Function Attrs: noinline nounwind uwtable
define internal void @TIFFSetupShortLong(%struct.tiff*, i32, %struct.TIFFDirEntry*, i32) #0 {
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.TIFFDirEntry*, align 8
  %8 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32 %1, i32* %6, align 4
  store %struct.TIFFDirEntry* %2, %struct.TIFFDirEntry** %7, align 8
  store i32 %3, i32* %8, align 4
  %9 = load i32, i32* %6, align 4
  %10 = trunc i32 %9 to i16
  %11 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %12 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %11, i32 0, i32 0
  store i16 %10, i16* %12, align 4
  %13 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %14 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %13, i32 0, i32 2
  store i32 1, i32* %14, align 4
  %15 = load i32, i32* %8, align 4
  %16 = zext i32 %15 to i64
  %17 = icmp sgt i64 %16, 65535
  br i1 %17, label %18, label %25

; <label>:18:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFSetupShortLong, i64 0, i64 0)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFSetupShortLong, i64 0, i64 0)
  %20 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %21 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %20, i32 0, i32 1
  store i16 4, i16* %21, align 2
  %22 = load i32, i32* %8, align 4
  %23 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %24 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %23, i32 0, i32 3
  store i32 %22, i32* %24, align 4
  br label %66

; <label>:25:                                     ; preds = %4
  %26 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %27 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %26, i32 0, i32 1
  store i16 3, i16* %27, align 2
  %28 = load %struct.tiff*, %struct.tiff** %5, align 8
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %28, i32 0, i32 7
  %30 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %29, i32 0, i32 0
  %31 = load i16, i16* %30, align 8
  %32 = zext i16 %31 to i32
  %33 = icmp eq i32 %32, 19789
  br i1 %33, label %34, label %51

; <label>:34:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFSetupShortLong, i64 0, i64 1)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFSetupShortLong, i64 0, i64 1)
  %36 = load i32, i32* %8, align 4
  %37 = zext i32 %36 to i64
  %38 = load %struct.tiff*, %struct.tiff** %5, align 8
  %39 = getelementptr inbounds %struct.tiff, %struct.tiff* %38, i32 0, i32 10
  %40 = load i64*, i64** %39, align 8
  %41 = getelementptr inbounds i64, i64* %40, i64 3
  %42 = load i64, i64* %41, align 8
  %43 = and i64 %37, %42
  %44 = load %struct.tiff*, %struct.tiff** %5, align 8
  %45 = getelementptr inbounds %struct.tiff, %struct.tiff* %44, i32 0, i32 9
  %46 = load i32*, i32** %45, align 8
  %47 = getelementptr inbounds i32, i32* %46, i64 3
  %48 = load i32, i32* %47, align 4
  %49 = zext i32 %48 to i64
  %50 = shl i64 %43, %49
  br label %61

; <label>:51:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFSetupShortLong, i64 0, i64 2)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFSetupShortLong, i64 0, i64 2)
  %53 = load i32, i32* %8, align 4
  %54 = zext i32 %53 to i64
  %55 = load %struct.tiff*, %struct.tiff** %5, align 8
  %56 = getelementptr inbounds %struct.tiff, %struct.tiff* %55, i32 0, i32 10
  %57 = load i64*, i64** %56, align 8
  %58 = getelementptr inbounds i64, i64* %57, i64 3
  %59 = load i64, i64* %58, align 8
  %60 = and i64 %54, %59
  br label %61

; <label>:61:                                     ; preds = %51, %34
  %62 = phi i64 [ %50, %34 ], [ %60, %51 ]
  %63 = trunc i64 %62 to i32
  %64 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %65 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %64, i32 0, i32 3
  store i32 %63, i32* %65, align 4
  br label %66

; <label>:66:                                     ; preds = %61, %18
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFWriteShortTable(%struct.tiff*, i32, %struct.TIFFDirEntry*, i32, i16**) #0 {
  %6 = alloca i32, align 4
  %7 = alloca %struct.tiff*, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.TIFFDirEntry*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i16**, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %7, align 8
  store i32 %1, i32* %8, align 4
  store %struct.TIFFDirEntry* %2, %struct.TIFFDirEntry** %9, align 8
  store i32 %3, i32* %10, align 4
  store i16** %4, i16*** %11, align 8
  %14 = load i32, i32* %8, align 4
  %15 = trunc i32 %14 to i16
  %16 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %9, align 8
  %17 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %16, i32 0, i32 0
  store i16 %15, i16* %17, align 4
  %18 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %9, align 8
  %19 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %18, i32 0, i32 1
  store i16 3, i16* %19, align 2
  %20 = load %struct.tiff*, %struct.tiff** %7, align 8
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %20, i32 0, i32 6
  %22 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %21, i32 0, i32 8
  %23 = load i16, i16* %22, align 4
  %24 = zext i16 %23 to i32
  %25 = zext i32 %24 to i64
  %26 = shl i64 1, %25
  %27 = trunc i64 %26 to i32
  %28 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %9, align 8
  %29 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %28, i32 0, i32 2
  store i32 %27, i32* %29, align 4
  %30 = load %struct.tiff*, %struct.tiff** %7, align 8
  %31 = getelementptr inbounds %struct.tiff, %struct.tiff* %30, i32 0, i32 15
  %32 = load i32, i32* %31, align 8
  store i32 %32, i32* %13, align 4
  store i32 0, i32* %12, align 4
  br label %33

; <label>:33:                                     ; preds = %51, %5
  %34 = load i32, i32* %12, align 4
  %35 = load i32, i32* %10, align 4
  %36 = icmp ult i32 %34, %35
  br i1 %36, label %37, label %55

; <label>:37:                                     ; preds = %33
  %38 = load %struct.tiff*, %struct.tiff** %7, align 8
  %39 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %9, align 8
  %40 = load i16**, i16*** %11, align 8
  %41 = load i32, i32* %12, align 4
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds i16*, i16** %40, i64 %42
  %44 = load i16*, i16** %43, align 8
  %45 = bitcast i16* %44 to i8*
  %46 = call i32 @TIFFWriteData(%struct.tiff* %38, %struct.TIFFDirEntry* %39, i8* %45)
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %50, label %48

; <label>:48:                                     ; preds = %37
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFWriteShortTable, i64 0, i64 2)
  %49 = add i64 %pgocount, 1
  store i64 %49, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFWriteShortTable, i64 0, i64 2)
  store i32 0, i32* %6, align 4
  br label %65

; <label>:50:                                     ; preds = %37
  br label %51

; <label>:51:                                     ; preds = %50
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFWriteShortTable, i64 0, i64 0)
  %52 = add i64 %pgocount1, 1
  store i64 %52, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFWriteShortTable, i64 0, i64 0)
  %53 = load i32, i32* %12, align 4
  %54 = add i32 %53, 1
  store i32 %54, i32* %12, align 4
  br label %33

; <label>:55:                                     ; preds = %33
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFWriteShortTable, i64 0, i64 1)
  %56 = add i64 %pgocount2, 1
  store i64 %56, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFWriteShortTable, i64 0, i64 1)
  %57 = load i32, i32* %10, align 4
  %58 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %9, align 8
  %59 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %58, i32 0, i32 2
  %60 = load i32, i32* %59, align 4
  %61 = mul i32 %60, %57
  store i32 %61, i32* %59, align 4
  %62 = load i32, i32* %13, align 4
  %63 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %9, align 8
  %64 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %63, i32 0, i32 3
  store i32 %62, i32* %64, align 4
  store i32 1, i32* %6, align 4
  br label %65

; <label>:65:                                     ; preds = %55, %48
  %66 = load i32, i32* %6, align 4
  ret i32 %66
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFWriteRationalArray(%struct.tiff*, i32, i32, %struct.TIFFDirEntry*, i32, float*) #0 {
  %7 = alloca %struct.tiff*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.TIFFDirEntry*, align 8
  %11 = alloca i32, align 4
  %12 = alloca float*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32*, align 8
  %15 = alloca i32, align 4
  %16 = alloca float, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %7, align 8
  store i32 %1, i32* %8, align 4
  store i32 %2, i32* %9, align 4
  store %struct.TIFFDirEntry* %3, %struct.TIFFDirEntry** %10, align 8
  store i32 %4, i32* %11, align 4
  store float* %5, float** %12, align 8
  %19 = load i32, i32* %9, align 4
  %20 = trunc i32 %19 to i16
  %21 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %22 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %21, i32 0, i32 0
  store i16 %20, i16* %22, align 4
  %23 = load i32, i32* %8, align 4
  %24 = trunc i32 %23 to i16
  %25 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %26 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %25, i32 0, i32 1
  store i16 %24, i16* %26, align 2
  %27 = load i32, i32* %11, align 4
  %28 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %29 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %28, i32 0, i32 2
  store i32 %27, i32* %29, align 4
  %30 = load i32, i32* %11, align 4
  %31 = mul i32 2, %30
  %32 = zext i32 %31 to i64
  %33 = mul i64 %32, 4
  %34 = trunc i64 %33 to i32
  %35 = call i8* @_TIFFmalloc(i32 %34)
  %36 = bitcast i8* %35 to i32*
  store i32* %36, i32** %14, align 8
  store i32 0, i32* %13, align 4
  br label %37

; <label>:37:                                     ; preds = %114, %6
  %38 = load i32, i32* %13, align 4
  %39 = load i32, i32* %11, align 4
  %40 = icmp ult i32 %38, %39
  br i1 %40, label %41, label %118

; <label>:41:                                     ; preds = %37
  %42 = load float*, float** %12, align 8
  %43 = load i32, i32* %13, align 4
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float* %42, i64 %44
  %46 = load float, float* %45, align 4
  store float %46, float* %16, align 4
  store i32 1, i32* %17, align 4
  %47 = load float, float* %16, align 4
  %48 = fcmp olt float %47, 0.000000e+00
  br i1 %48, label %49, label %69

; <label>:49:                                     ; preds = %41
  %50 = load i32, i32* %8, align 4
  %51 = icmp eq i32 %50, 5
  br i1 %51, label %52, label %64

; <label>:52:                                     ; preds = %49
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFWriteRationalArray, i64 0, i64 4)
  %53 = add i64 %pgocount, 1
  store i64 %53, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFWriteRationalArray, i64 0, i64 4)
  %54 = load %struct.tiff*, %struct.tiff** %7, align 8
  %55 = getelementptr inbounds %struct.tiff, %struct.tiff* %54, i32 0, i32 0
  %56 = load i8*, i8** %55, align 8
  %57 = load %struct.tiff*, %struct.tiff** %7, align 8
  %58 = load i32, i32* %9, align 4
  %59 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %57, i32 %58)
  %60 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %59, i32 0, i32 7
  %61 = load i8*, i8** %60, align 8
  %62 = load float, float* %16, align 4
  %63 = fpext float %62 to double
  call void (i8*, i8*, ...) @TIFFWarning(i8* %56, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.7, i32 0, i32 0), i8* %61, double %63)
  store float 0.000000e+00, float* %16, align 4
  br label %68

; <label>:64:                                     ; preds = %49
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFWriteRationalArray, i64 0, i64 5)
  %65 = add i64 %pgocount1, 1
  store i64 %65, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFWriteRationalArray, i64 0, i64 5)
  %66 = load float, float* %16, align 4
  %67 = fsub float -0.000000e+00, %66
  store float %67, float* %16, align 4
  store i32 -1, i32* %17, align 4
  br label %68

; <label>:68:                                     ; preds = %64, %52
  br label %69

; <label>:69:                                     ; preds = %68, %41
  store i32 1, i32* %18, align 4
  %70 = load float, float* %16, align 4
  %71 = fcmp ogt float %70, 0.000000e+00
  br i1 %71, label %72, label %93

; <label>:72:                                     ; preds = %69
  br label %73

; <label>:73:                                     ; preds = %83, %72
  %74 = load float, float* %16, align 4
  %75 = fcmp olt float %74, 0x41B0000000000000
  br i1 %75, label %76, label %81

; <label>:76:                                     ; preds = %73
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFWriteRationalArray, i64 0, i64 1)
  %77 = add i64 %pgocount2, 1
  store i64 %77, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFWriteRationalArray, i64 0, i64 1)
  %78 = load i32, i32* %18, align 4
  %79 = zext i32 %78 to i64
  %80 = icmp slt i64 %79, 268435456
  br label %81

; <label>:81:                                     ; preds = %76, %73
  %82 = phi i1 [ false, %73 ], [ %80, %76 ]
  br i1 %82, label %83, label %91

; <label>:83:                                     ; preds = %81
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFWriteRationalArray, i64 0, i64 0)
  %84 = add i64 %pgocount3, 1
  store i64 %84, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFWriteRationalArray, i64 0, i64 0)
  %85 = load float, float* %16, align 4
  %86 = fmul float %85, 8.000000e+00
  store float %86, float* %16, align 4
  %87 = load i32, i32* %18, align 4
  %88 = zext i32 %87 to i64
  %89 = mul nsw i64 %88, 8
  %90 = trunc i64 %89 to i32
  store i32 %90, i32* %18, align 4
  br label %73

; <label>:91:                                     ; preds = %81
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFWriteRationalArray, i64 0, i64 3)
  %92 = add i64 %pgocount4, 1
  store i64 %92, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFWriteRationalArray, i64 0, i64 3)
  br label %93

; <label>:93:                                     ; preds = %91, %69
  %94 = load i32, i32* %17, align 4
  %95 = sitofp i32 %94 to double
  %96 = load float, float* %16, align 4
  %97 = fpext float %96 to double
  %98 = fadd double %97, 5.000000e-01
  %99 = fmul double %95, %98
  %100 = fptoui double %99 to i32
  %101 = load i32*, i32** %14, align 8
  %102 = load i32, i32* %13, align 4
  %103 = mul i32 2, %102
  %104 = add i32 %103, 0
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32* %101, i64 %105
  store i32 %100, i32* %106, align 4
  %107 = load i32, i32* %18, align 4
  %108 = load i32*, i32** %14, align 8
  %109 = load i32, i32* %13, align 4
  %110 = mul i32 2, %109
  %111 = add i32 %110, 1
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds i32, i32* %108, i64 %112
  store i32 %107, i32* %113, align 4
  br label %114

; <label>:114:                                    ; preds = %93
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFWriteRationalArray, i64 0, i64 2)
  %115 = add i64 %pgocount5, 1
  store i64 %115, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFWriteRationalArray, i64 0, i64 2)
  %116 = load i32, i32* %13, align 4
  %117 = add i32 %116, 1
  store i32 %117, i32* %13, align 4
  br label %37

; <label>:118:                                    ; preds = %37
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFWriteRationalArray, i64 0, i64 6)
  %119 = add i64 %pgocount6, 1
  store i64 %119, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_TIFFWriteRationalArray, i64 0, i64 6)
  %120 = load %struct.tiff*, %struct.tiff** %7, align 8
  %121 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %10, align 8
  %122 = load i32*, i32** %14, align 8
  %123 = bitcast i32* %122 to i8*
  %124 = call i32 @TIFFWriteData(%struct.tiff* %120, %struct.TIFFDirEntry* %121, i8* %123)
  store i32 %124, i32* %15, align 4
  %125 = load i32*, i32** %14, align 8
  %126 = bitcast i32* %125 to i8*
  call void @_TIFFfree(i8* %126)
  %127 = load i32, i32* %15, align 4
  ret i32 %127
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFWritePerSampleShorts(%struct.tiff*, i32, %struct.TIFFDirEntry*) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.TIFFDirEntry*, align 8
  %7 = alloca [10 x i16], align 16
  %8 = alloca i16, align 2
  %9 = alloca i16*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  store %struct.TIFFDirEntry* %2, %struct.TIFFDirEntry** %6, align 8
  %13 = getelementptr inbounds [10 x i16], [10 x i16]* %7, i32 0, i32 0
  store i16* %13, i16** %9, align 8
  %14 = load %struct.tiff*, %struct.tiff** %4, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 6
  %16 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %15, i32 0, i32 15
  %17 = load i16, i16* %16, align 2
  %18 = zext i16 %17 to i32
  store i32 %18, i32* %12, align 4
  %19 = load i32, i32* %12, align 4
  %20 = sext i32 %19 to i64
  %21 = icmp ugt i64 %20, 10
  br i1 %21, label %22, label %30

; <label>:22:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFWritePerSampleShorts, i64 0, i64 3)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFWritePerSampleShorts, i64 0, i64 3)
  %24 = load i32, i32* %12, align 4
  %25 = sext i32 %24 to i64
  %26 = mul i64 %25, 2
  %27 = trunc i64 %26 to i32
  %28 = call i8* @_TIFFmalloc(i32 %27)
  %29 = bitcast i8* %28 to i16*
  store i16* %29, i16** %9, align 8
  br label %30

; <label>:30:                                     ; preds = %22, %3
  %31 = load %struct.tiff*, %struct.tiff** %4, align 8
  %32 = load i32, i32* %5, align 4
  %33 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %31, i32 %32, i16* %8)
  store i32 0, i32* %10, align 4
  br label %34

; <label>:34:                                     ; preds = %44, %30
  %35 = load i32, i32* %10, align 4
  %36 = load i32, i32* %12, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %48

; <label>:38:                                     ; preds = %34
  %39 = load i16, i16* %8, align 2
  %40 = load i16*, i16** %9, align 8
  %41 = load i32, i32* %10, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i16, i16* %40, i64 %42
  store i16 %39, i16* %43, align 2
  br label %44

; <label>:44:                                     ; preds = %38
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFWritePerSampleShorts, i64 0, i64 0)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFWritePerSampleShorts, i64 0, i64 0)
  %46 = load i32, i32* %10, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %10, align 4
  br label %34

; <label>:48:                                     ; preds = %34
  %49 = load %struct.tiff*, %struct.tiff** %4, align 8
  %50 = load i32, i32* %5, align 4
  %51 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %52 = load i32, i32* %12, align 4
  %53 = load i16*, i16** %9, align 8
  %54 = call i32 @TIFFWriteShortArray(%struct.tiff* %49, i32 3, i32 %50, %struct.TIFFDirEntry* %51, i32 %52, i16* %53)
  store i32 %54, i32* %11, align 4
  %55 = load i16*, i16** %9, align 8
  %56 = getelementptr inbounds [10 x i16], [10 x i16]* %7, i32 0, i32 0
  %57 = icmp ne i16* %55, %56
  br i1 %57, label %58, label %62

; <label>:58:                                     ; preds = %48
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFWritePerSampleShorts, i64 0, i64 2)
  %59 = add i64 %pgocount2, 1
  store i64 %59, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFWritePerSampleShorts, i64 0, i64 2)
  %60 = load i16*, i16** %9, align 8
  %61 = bitcast i16* %60 to i8*
  call void @_TIFFfree(i8* %61)
  br label %62

; <label>:62:                                     ; preds = %58, %48
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFWritePerSampleShorts, i64 0, i64 1)
  %63 = add i64 %pgocount3, 1
  store i64 %63, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFWritePerSampleShorts, i64 0, i64 1)
  %64 = load i32, i32* %11, align 4
  ret i32 %64
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFWritePerSampleAnys(%struct.tiff*, i32, i32, %struct.TIFFDirEntry*) #0 {
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.TIFFDirEntry*, align 8
  %9 = alloca [10 x double], align 16
  %10 = alloca double, align 8
  %11 = alloca double*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store %struct.TIFFDirEntry* %3, %struct.TIFFDirEntry** %8, align 8
  %15 = getelementptr inbounds [10 x double], [10 x double]* %9, i32 0, i32 0
  store double* %15, double** %11, align 8
  %16 = load %struct.tiff*, %struct.tiff** %5, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %16, i32 0, i32 6
  %18 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %17, i32 0, i32 15
  %19 = load i16, i16* %18, align 2
  %20 = zext i16 %19 to i32
  store i32 %20, i32* %14, align 4
  %21 = load i32, i32* %14, align 4
  %22 = sext i32 %21 to i64
  %23 = icmp ugt i64 %22, 10
  br i1 %23, label %24, label %32

; <label>:24:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFWritePerSampleAnys, i64 0, i64 3)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFWritePerSampleAnys, i64 0, i64 3)
  %26 = load i32, i32* %14, align 4
  %27 = sext i32 %26 to i64
  %28 = mul i64 %27, 8
  %29 = trunc i64 %28 to i32
  %30 = call i8* @_TIFFmalloc(i32 %29)
  %31 = bitcast i8* %30 to double*
  store double* %31, double** %11, align 8
  br label %32

; <label>:32:                                     ; preds = %24, %4
  %33 = load %struct.tiff*, %struct.tiff** %5, align 8
  %34 = load i32, i32* %7, align 4
  %35 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %33, i32 %34, double* %10)
  store i32 0, i32* %12, align 4
  br label %36

; <label>:36:                                     ; preds = %46, %32
  %37 = load i32, i32* %12, align 4
  %38 = load i32, i32* %14, align 4
  %39 = icmp slt i32 %37, %38
  br i1 %39, label %40, label %50

; <label>:40:                                     ; preds = %36
  %41 = load double, double* %10, align 8
  %42 = load double*, double** %11, align 8
  %43 = load i32, i32* %12, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double, double* %42, i64 %44
  store double %41, double* %45, align 8
  br label %46

; <label>:46:                                     ; preds = %40
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFWritePerSampleAnys, i64 0, i64 0)
  %47 = add i64 %pgocount1, 1
  store i64 %47, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFWritePerSampleAnys, i64 0, i64 0)
  %48 = load i32, i32* %12, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %12, align 4
  br label %36

; <label>:50:                                     ; preds = %36
  %51 = load %struct.tiff*, %struct.tiff** %5, align 8
  %52 = load i32, i32* %6, align 4
  %53 = load i32, i32* %7, align 4
  %54 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %8, align 8
  %55 = load i32, i32* %14, align 4
  %56 = load double*, double** %11, align 8
  %57 = call i32 @TIFFWriteAnyArray(%struct.tiff* %51, i32 %52, i32 %53, %struct.TIFFDirEntry* %54, i32 %55, double* %56)
  store i32 %57, i32* %13, align 4
  %58 = load double*, double** %11, align 8
  %59 = getelementptr inbounds [10 x double], [10 x double]* %9, i32 0, i32 0
  %60 = icmp ne double* %58, %59
  br i1 %60, label %61, label %65

; <label>:61:                                     ; preds = %50
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFWritePerSampleAnys, i64 0, i64 2)
  %62 = add i64 %pgocount2, 1
  store i64 %62, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFWritePerSampleAnys, i64 0, i64 2)
  %63 = load double*, double** %11, align 8
  %64 = bitcast double* %63 to i8*
  call void @_TIFFfree(i8* %64)
  br label %65

; <label>:65:                                     ; preds = %61, %50
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFWritePerSampleAnys, i64 0, i64 1)
  %66 = add i64 %pgocount3, 1
  store i64 %66, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFWritePerSampleAnys, i64 0, i64 1)
  %67 = load i32, i32* %13, align 4
  ret i32 %67
}

declare i32 @_TIFFSampleToTagType(%struct.tiff*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFSetupShortPair(%struct.tiff*, i32, %struct.TIFFDirEntry*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_TIFFSetupShortPair, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_TIFFSetupShortPair, i64 0, i64 0)
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.TIFFDirEntry*, align 8
  %8 = alloca [2 x i16], align 2
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32 %1, i32* %6, align 4
  store %struct.TIFFDirEntry* %2, %struct.TIFFDirEntry** %7, align 8
  %9 = load %struct.tiff*, %struct.tiff** %5, align 8
  %10 = load i32, i32* %6, align 4
  %11 = getelementptr inbounds [2 x i16], [2 x i16]* %8, i64 0, i64 0
  %12 = getelementptr inbounds [2 x i16], [2 x i16]* %8, i64 0, i64 1
  %13 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %9, i32 %10, i16* %11, i16* %12)
  %14 = load %struct.tiff*, %struct.tiff** %5, align 8
  %15 = load i32, i32* %6, align 4
  %16 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %7, align 8
  %17 = getelementptr inbounds [2 x i16], [2 x i16]* %8, i32 0, i32 0
  %18 = call i32 @TIFFWriteShortArray(%struct.tiff* %14, i32 3, i32 %15, %struct.TIFFDirEntry* %16, i32 2, i16* %17)
  ret i32 %18
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFWriteInkNames(%struct.tiff*, %struct.TIFFDirEntry*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_TIFFWriteInkNames, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_TIFFWriteInkNames, i64 0, i64 0)
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca %struct.TIFFDirEntry*, align 8
  %6 = alloca %struct.TIFFDirectory*, align 8
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %5, align 8
  %7 = load %struct.tiff*, %struct.tiff** %4, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %7, i32 0, i32 6
  store %struct.TIFFDirectory* %8, %struct.TIFFDirectory** %6, align 8
  %9 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %10 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %9, i32 0, i32 0
  store i16 333, i16* %10, align 4
  %11 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %12 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %11, i32 0, i32 1
  store i16 2, i16* %12, align 2
  %13 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %14 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %13, i32 0, i32 58
  %15 = load i32, i32* %14, align 8
  %16 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %17 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %16, i32 0, i32 2
  store i32 %15, i32* %17, align 4
  %18 = load %struct.tiff*, %struct.tiff** %4, align 8
  %19 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %5, align 8
  %20 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %21 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %20, i32 0, i32 59
  %22 = load i8*, i8** %21, align 8
  %23 = call i32 @TIFFWriteByteArray(%struct.tiff* %18, %struct.TIFFDirEntry* %19, i8* %22)
  ret i32 %23
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFWriteTransferFunction(%struct.tiff*, %struct.TIFFDirEntry*) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.TIFFDirEntry*, align 8
  %5 = alloca %struct.TIFFDirectory*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i16**, align 8
  %8 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %4, align 8
  %9 = load %struct.tiff*, %struct.tiff** %3, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 6
  store %struct.TIFFDirectory* %10, %struct.TIFFDirectory** %5, align 8
  %11 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %12 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %11, i32 0, i32 8
  %13 = load i16, i16* %12, align 4
  %14 = zext i16 %13 to i32
  %15 = zext i32 %14 to i64
  %16 = shl i64 1, %15
  %17 = mul i64 %16, 2
  %18 = trunc i64 %17 to i32
  store i32 %18, i32* %6, align 4
  %19 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %20 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %19, i32 0, i32 54
  %21 = getelementptr inbounds [3 x i16*], [3 x i16*]* %20, i32 0, i32 0
  store i16** %21, i16*** %7, align 8
  %22 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %23 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %22, i32 0, i32 15
  %24 = load i16, i16* %23, align 2
  %25 = zext i16 %24 to i32
  %26 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %27 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %26, i32 0, i32 30
  %28 = load i16, i16* %27, align 4
  %29 = zext i16 %28 to i32
  %30 = sub nsw i32 %25, %29
  switch i32 %30, label %32 [
    i32 2, label %48
    i32 1, label %._crit_edge
    i32 0, label %64
  ]

._crit_edge:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFWriteTransferFunction, i64 0, i64 0)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFWriteTransferFunction, i64 0, i64 0)
  br label %64

; <label>:32:                                     ; preds = %2
  %33 = load i16**, i16*** %7, align 8
  %34 = getelementptr inbounds i16*, i16** %33, i64 0
  %35 = load i16*, i16** %34, align 8
  %36 = bitcast i16* %35 to i8*
  %37 = load i16**, i16*** %7, align 8
  %38 = getelementptr inbounds i16*, i16** %37, i64 2
  %39 = load i16*, i16** %38, align 8
  %40 = bitcast i16* %39 to i8*
  %41 = load i32, i32* %6, align 4
  %42 = call i32 @_TIFFmemcmp(i8* %36, i8* %40, i32 %41)
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %46

; <label>:44:                                     ; preds = %32
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFWriteTransferFunction, i64 0, i64 3)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFWriteTransferFunction, i64 0, i64 3)
  store i32 3, i32* %8, align 4
  br label %66

; <label>:46:                                     ; preds = %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFWriteTransferFunction, i64 0, i64 5)
  %47 = add i64 %pgocount2, 1
  store i64 %47, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFWriteTransferFunction, i64 0, i64 5)
  br label %48

; <label>:48:                                     ; preds = %46, %2
  %49 = load i16**, i16*** %7, align 8
  %50 = getelementptr inbounds i16*, i16** %49, i64 0
  %51 = load i16*, i16** %50, align 8
  %52 = bitcast i16* %51 to i8*
  %53 = load i16**, i16*** %7, align 8
  %54 = getelementptr inbounds i16*, i16** %53, i64 1
  %55 = load i16*, i16** %54, align 8
  %56 = bitcast i16* %55 to i8*
  %57 = load i32, i32* %6, align 4
  %58 = call i32 @_TIFFmemcmp(i8* %52, i8* %56, i32 %57)
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %62

; <label>:60:                                     ; preds = %48
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFWriteTransferFunction, i64 0, i64 2)
  %61 = add i64 %pgocount3, 1
  store i64 %61, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFWriteTransferFunction, i64 0, i64 2)
  store i32 3, i32* %8, align 4
  br label %66

; <label>:62:                                     ; preds = %48
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFWriteTransferFunction, i64 0, i64 4)
  %63 = add i64 %pgocount4, 1
  store i64 %63, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFWriteTransferFunction, i64 0, i64 4)
  br label %64

; <label>:64:                                     ; preds = %._crit_edge, %62, %2
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFWriteTransferFunction, i64 0, i64 1)
  %65 = add i64 %pgocount5, 1
  store i64 %65, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFWriteTransferFunction, i64 0, i64 1)
  store i32 1, i32* %8, align 4
  br label %66

; <label>:66:                                     ; preds = %64, %60, %44
  %67 = load %struct.tiff*, %struct.tiff** %3, align 8
  %68 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %4, align 8
  %69 = load i32, i32* %8, align 4
  %70 = load i16**, i16*** %7, align 8
  %71 = call i32 @TIFFWriteShortTable(%struct.tiff* %67, i32 301, %struct.TIFFDirEntry* %68, i32 %69, i16** %70)
  ret i32 %71
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFWriteNormalTag(%struct.tiff*, %struct.TIFFDirEntry*, %struct.TIFFFieldInfo*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca %struct.TIFFDirEntry*, align 8
  %7 = alloca %struct.TIFFFieldInfo*, align 8
  %8 = alloca i16, align 2
  %9 = alloca i32, align 4
  %10 = alloca i16*, align 8
  %11 = alloca i16, align 2
  %12 = alloca i32*, align 8
  %13 = alloca float*, align 8
  %14 = alloca float, align 4
  %15 = alloca float*, align 8
  %16 = alloca float, align 4
  %17 = alloca double*, align 8
  %18 = alloca double, align 8
  %19 = alloca i8*, align 8
  %20 = alloca i8*, align 8
  %21 = alloca i8, align 1
  %22 = alloca i8*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %6, align 8
  store %struct.TIFFFieldInfo* %2, %struct.TIFFFieldInfo** %7, align 8
  %23 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %24 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %23, i32 0, i32 2
  %25 = load i16, i16* %24, align 2
  store i16 %25, i16* %8, align 2
  %26 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %27 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %26, i32 0, i32 0
  %28 = load i32, i32* %27, align 8
  %29 = trunc i32 %28 to i16
  %30 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %31 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %30, i32 0, i32 0
  store i16 %29, i16* %31, align 4
  %32 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %33 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %32, i32 0, i32 3
  %34 = load i32, i32* %33, align 8
  %35 = trunc i32 %34 to i16
  %36 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %37 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %36, i32 0, i32 1
  store i16 %35, i16* %37, align 2
  %38 = load i16, i16* %8, align 2
  %39 = zext i16 %38 to i32
  %40 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %41 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %40, i32 0, i32 2
  store i32 %39, i32* %41, align 4
  %42 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %43 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %42, i32 0, i32 3
  %44 = load i32, i32* %43, align 8
  switch i32 %44, label %499 [
    i32 3, label %._crit_edge
    i32 8, label %49
    i32 4, label %._crit_edge1
    i32 9, label %145
    i32 5, label %._crit_edge2
    i32 10, label %194
    i32 11, label %256
    i32 12, label %318
    i32 2, label %380
    i32 1, label %._crit_edge3
    i32 6, label %401
    i32 7, label %451
    i32 0, label %497
  ]

._crit_edge3:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 3)
  %45 = add i64 %pgocount, 1
  store i64 %45, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 3)
  br label %401

._crit_edge2:                                     ; preds = %3
  %pgocount4 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 2)
  %46 = add i64 %pgocount4, 1
  store i64 %46, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 2)
  br label %194

._crit_edge1:                                     ; preds = %3
  %pgocount5 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 1)
  %47 = add i64 %pgocount5, 1
  store i64 %47, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 1)
  br label %145

._crit_edge:                                      ; preds = %3
  %pgocount6 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 0)
  %48 = add i64 %pgocount6, 1
  store i64 %48, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 0)
  br label %49

; <label>:49:                                     ; preds = %._crit_edge, %3
  %50 = load i16, i16* %8, align 2
  %51 = zext i16 %50 to i32
  %52 = icmp sgt i32 %51, 1
  br i1 %52, label %53, label %88

; <label>:53:                                     ; preds = %49
  %54 = load i16, i16* %8, align 2
  %55 = zext i16 %54 to i32
  %56 = icmp eq i32 %55, 65535
  br i1 %56, label %57, label %64

; <label>:57:                                     ; preds = %53
  %pgocount7 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 10)
  %58 = add i64 %pgocount7, 1
  store i64 %58, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 10)
  %59 = load %struct.tiff*, %struct.tiff** %5, align 8
  %60 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %61 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %60, i32 0, i32 0
  %62 = load i32, i32* %61, align 8
  %63 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %59, i32 %62, i16* %8, i16** %10)
  br label %71

; <label>:64:                                     ; preds = %53
  %pgocount8 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 11)
  %65 = add i64 %pgocount8, 1
  store i64 %65, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 11)
  %66 = load %struct.tiff*, %struct.tiff** %5, align 8
  %67 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %68 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %67, i32 0, i32 0
  %69 = load i32, i32* %68, align 8
  %70 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %66, i32 %69, i16** %10)
  br label %71

; <label>:71:                                     ; preds = %64, %57
  %72 = load %struct.tiff*, %struct.tiff** %5, align 8
  %73 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %74 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %73, i32 0, i32 3
  %75 = load i32, i32* %74, align 8
  %76 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %77 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %76, i32 0, i32 0
  %78 = load i32, i32* %77, align 8
  %79 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %80 = load i16, i16* %8, align 2
  %81 = zext i16 %80 to i32
  %82 = load i16*, i16** %10, align 8
  %83 = call i32 @TIFFWriteShortArray(%struct.tiff* %72, i32 %75, i32 %78, %struct.TIFFDirEntry* %79, i32 %81, i16* %82)
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %87, label %85

; <label>:85:                                     ; preds = %71
  %pgocount9 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 21)
  %86 = add i64 %pgocount9, 1
  store i64 %86, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 21)
  store i32 0, i32* %4, align 4
  br label %501

; <label>:87:                                     ; preds = %71
  br label %144

; <label>:88:                                     ; preds = %49
  %89 = load %struct.tiff*, %struct.tiff** %5, align 8
  %90 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %91 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %90, i32 0, i32 0
  %92 = load i32, i32* %91, align 8
  %93 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %89, i32 %92, i16* %11)
  %94 = load %struct.tiff*, %struct.tiff** %5, align 8
  %95 = getelementptr inbounds %struct.tiff, %struct.tiff* %94, i32 0, i32 7
  %96 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %95, i32 0, i32 0
  %97 = load i16, i16* %96, align 8
  %98 = zext i16 %97 to i32
  %99 = icmp eq i32 %98, 19789
  br i1 %99, label %100, label %125

; <label>:100:                                    ; preds = %88
  %pgocount10 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 12)
  %101 = add i64 %pgocount10, 1
  store i64 %101, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 12)
  %102 = load i16, i16* %11, align 2
  %103 = zext i16 %102 to i64
  %104 = load %struct.tiff*, %struct.tiff** %5, align 8
  %105 = getelementptr inbounds %struct.tiff, %struct.tiff* %104, i32 0, i32 10
  %106 = load i64*, i64** %105, align 8
  %107 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %108 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %107, i32 0, i32 1
  %109 = load i16, i16* %108, align 2
  %110 = zext i16 %109 to i64
  %111 = getelementptr inbounds i64, i64* %106, i64 %110
  %112 = load i64, i64* %111, align 8
  %113 = and i64 %103, %112
  %114 = load %struct.tiff*, %struct.tiff** %5, align 8
  %115 = getelementptr inbounds %struct.tiff, %struct.tiff* %114, i32 0, i32 9
  %116 = load i32*, i32** %115, align 8
  %117 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %118 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %117, i32 0, i32 1
  %119 = load i16, i16* %118, align 2
  %120 = zext i16 %119 to i64
  %121 = getelementptr inbounds i32, i32* %116, i64 %120
  %122 = load i32, i32* %121, align 4
  %123 = zext i32 %122 to i64
  %124 = shl i64 %113, %123
  br label %139

; <label>:125:                                    ; preds = %88
  %pgocount11 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 13)
  %126 = add i64 %pgocount11, 1
  store i64 %126, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 13)
  %127 = load i16, i16* %11, align 2
  %128 = zext i16 %127 to i64
  %129 = load %struct.tiff*, %struct.tiff** %5, align 8
  %130 = getelementptr inbounds %struct.tiff, %struct.tiff* %129, i32 0, i32 10
  %131 = load i64*, i64** %130, align 8
  %132 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %133 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %132, i32 0, i32 1
  %134 = load i16, i16* %133, align 2
  %135 = zext i16 %134 to i64
  %136 = getelementptr inbounds i64, i64* %131, i64 %135
  %137 = load i64, i64* %136, align 8
  %138 = and i64 %128, %137
  br label %139

; <label>:139:                                    ; preds = %125, %100
  %140 = phi i64 [ %124, %100 ], [ %138, %125 ]
  %141 = trunc i64 %140 to i32
  %142 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %143 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %142, i32 0, i32 3
  store i32 %141, i32* %143, align 4
  br label %144

; <label>:144:                                    ; preds = %139, %87
  br label %499

; <label>:145:                                    ; preds = %._crit_edge1, %3
  %146 = load i16, i16* %8, align 2
  %147 = zext i16 %146 to i32
  %148 = icmp sgt i32 %147, 1
  br i1 %148, label %149, label %184

; <label>:149:                                    ; preds = %145
  %150 = load i16, i16* %8, align 2
  %151 = zext i16 %150 to i32
  %152 = icmp eq i32 %151, 65535
  br i1 %152, label %153, label %160

; <label>:153:                                    ; preds = %149
  %pgocount12 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 14)
  %154 = add i64 %pgocount12, 1
  store i64 %154, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 14)
  %155 = load %struct.tiff*, %struct.tiff** %5, align 8
  %156 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %157 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %156, i32 0, i32 0
  %158 = load i32, i32* %157, align 8
  %159 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %155, i32 %158, i16* %8, i32** %12)
  br label %167

; <label>:160:                                    ; preds = %149
  %pgocount13 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 15)
  %161 = add i64 %pgocount13, 1
  store i64 %161, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 15)
  %162 = load %struct.tiff*, %struct.tiff** %5, align 8
  %163 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %164 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %163, i32 0, i32 0
  %165 = load i32, i32* %164, align 8
  %166 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %162, i32 %165, i32** %12)
  br label %167

; <label>:167:                                    ; preds = %160, %153
  %168 = load %struct.tiff*, %struct.tiff** %5, align 8
  %169 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %170 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %169, i32 0, i32 3
  %171 = load i32, i32* %170, align 8
  %172 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %173 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %172, i32 0, i32 0
  %174 = load i32, i32* %173, align 8
  %175 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %176 = load i16, i16* %8, align 2
  %177 = zext i16 %176 to i32
  %178 = load i32*, i32** %12, align 8
  %179 = call i32 @TIFFWriteLongArray(%struct.tiff* %168, i32 %171, i32 %174, %struct.TIFFDirEntry* %175, i32 %177, i32* %178)
  %180 = icmp ne i32 %179, 0
  br i1 %180, label %183, label %181

; <label>:181:                                    ; preds = %167
  %pgocount14 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 22)
  %182 = add i64 %pgocount14, 1
  store i64 %182, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 22)
  store i32 0, i32* %4, align 4
  br label %501

; <label>:183:                                    ; preds = %167
  br label %193

; <label>:184:                                    ; preds = %145
  %pgocount15 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 5)
  %185 = add i64 %pgocount15, 1
  store i64 %185, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 5)
  %186 = load %struct.tiff*, %struct.tiff** %5, align 8
  %187 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %188 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %187, i32 0, i32 0
  %189 = load i32, i32* %188, align 8
  %190 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %191 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %190, i32 0, i32 3
  %192 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %186, i32 %189, i32* %191)
  br label %193

; <label>:193:                                    ; preds = %184, %183
  br label %499

; <label>:194:                                    ; preds = %._crit_edge2, %3
  %195 = load i16, i16* %8, align 2
  %196 = zext i16 %195 to i32
  %197 = icmp sgt i32 %196, 1
  br i1 %197, label %198, label %233

; <label>:198:                                    ; preds = %194
  %199 = load i16, i16* %8, align 2
  %200 = zext i16 %199 to i32
  %201 = icmp eq i32 %200, 65535
  br i1 %201, label %202, label %209

; <label>:202:                                    ; preds = %198
  %pgocount16 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 16)
  %203 = add i64 %pgocount16, 1
  store i64 %203, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 16)
  %204 = load %struct.tiff*, %struct.tiff** %5, align 8
  %205 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %206 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %205, i32 0, i32 0
  %207 = load i32, i32* %206, align 8
  %208 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %204, i32 %207, i16* %8, float** %13)
  br label %216

; <label>:209:                                    ; preds = %198
  %pgocount17 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 17)
  %210 = add i64 %pgocount17, 1
  store i64 %210, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 17)
  %211 = load %struct.tiff*, %struct.tiff** %5, align 8
  %212 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %213 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %212, i32 0, i32 0
  %214 = load i32, i32* %213, align 8
  %215 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %211, i32 %214, float** %13)
  br label %216

; <label>:216:                                    ; preds = %209, %202
  %217 = load %struct.tiff*, %struct.tiff** %5, align 8
  %218 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %219 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %218, i32 0, i32 3
  %220 = load i32, i32* %219, align 8
  %221 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %222 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %221, i32 0, i32 0
  %223 = load i32, i32* %222, align 8
  %224 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %225 = load i16, i16* %8, align 2
  %226 = zext i16 %225 to i32
  %227 = load float*, float** %13, align 8
  %228 = call i32 @TIFFWriteRationalArray(%struct.tiff* %217, i32 %220, i32 %223, %struct.TIFFDirEntry* %224, i32 %226, float* %227)
  %229 = icmp ne i32 %228, 0
  br i1 %229, label %232, label %230

; <label>:230:                                    ; preds = %216
  %pgocount18 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 23)
  %231 = add i64 %pgocount18, 1
  store i64 %231, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 23)
  store i32 0, i32* %4, align 4
  br label %501

; <label>:232:                                    ; preds = %216
  br label %255

; <label>:233:                                    ; preds = %194
  %234 = load %struct.tiff*, %struct.tiff** %5, align 8
  %235 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %236 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %235, i32 0, i32 0
  %237 = load i32, i32* %236, align 8
  %238 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %234, i32 %237, float* %14)
  %239 = load %struct.tiff*, %struct.tiff** %5, align 8
  %240 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %241 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %240, i32 0, i32 3
  %242 = load i32, i32* %241, align 8
  %243 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %244 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %243, i32 0, i32 0
  %245 = load i32, i32* %244, align 8
  %246 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %247 = load i16, i16* %8, align 2
  %248 = zext i16 %247 to i32
  %249 = call i32 @TIFFWriteRationalArray(%struct.tiff* %239, i32 %242, i32 %245, %struct.TIFFDirEntry* %246, i32 %248, float* %14)
  %250 = icmp ne i32 %249, 0
  br i1 %250, label %253, label %251

; <label>:251:                                    ; preds = %233
  %pgocount19 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 24)
  %252 = add i64 %pgocount19, 1
  store i64 %252, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 24)
  store i32 0, i32* %4, align 4
  br label %501

; <label>:253:                                    ; preds = %233
  %pgocount20 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 7)
  %254 = add i64 %pgocount20, 1
  store i64 %254, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 7)
  br label %255

; <label>:255:                                    ; preds = %253, %232
  br label %499

; <label>:256:                                    ; preds = %3
  %257 = load i16, i16* %8, align 2
  %258 = zext i16 %257 to i32
  %259 = icmp sgt i32 %258, 1
  br i1 %259, label %260, label %295

; <label>:260:                                    ; preds = %256
  %261 = load i16, i16* %8, align 2
  %262 = zext i16 %261 to i32
  %263 = icmp eq i32 %262, 65535
  br i1 %263, label %264, label %271

; <label>:264:                                    ; preds = %260
  %pgocount21 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 31)
  %265 = add i64 %pgocount21, 1
  store i64 %265, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 31)
  %266 = load %struct.tiff*, %struct.tiff** %5, align 8
  %267 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %268 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %267, i32 0, i32 0
  %269 = load i32, i32* %268, align 8
  %270 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %266, i32 %269, i16* %8, float** %15)
  br label %278

; <label>:271:                                    ; preds = %260
  %pgocount22 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 32)
  %272 = add i64 %pgocount22, 1
  store i64 %272, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 32)
  %273 = load %struct.tiff*, %struct.tiff** %5, align 8
  %274 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %275 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %274, i32 0, i32 0
  %276 = load i32, i32* %275, align 8
  %277 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %273, i32 %276, float** %15)
  br label %278

; <label>:278:                                    ; preds = %271, %264
  %279 = load %struct.tiff*, %struct.tiff** %5, align 8
  %280 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %281 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %280, i32 0, i32 3
  %282 = load i32, i32* %281, align 8
  %283 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %284 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %283, i32 0, i32 0
  %285 = load i32, i32* %284, align 8
  %286 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %287 = load i16, i16* %8, align 2
  %288 = zext i16 %287 to i32
  %289 = load float*, float** %15, align 8
  %290 = call i32 @TIFFWriteFloatArray(%struct.tiff* %279, i32 %282, i32 %285, %struct.TIFFDirEntry* %286, i32 %288, float* %289)
  %291 = icmp ne i32 %290, 0
  br i1 %291, label %294, label %292

; <label>:292:                                    ; preds = %278
  %pgocount23 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 37)
  %293 = add i64 %pgocount23, 1
  store i64 %293, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 37)
  store i32 0, i32* %4, align 4
  br label %501

; <label>:294:                                    ; preds = %278
  br label %317

; <label>:295:                                    ; preds = %256
  %296 = load %struct.tiff*, %struct.tiff** %5, align 8
  %297 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %298 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %297, i32 0, i32 0
  %299 = load i32, i32* %298, align 8
  %300 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %296, i32 %299, float* %16)
  %301 = load %struct.tiff*, %struct.tiff** %5, align 8
  %302 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %303 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %302, i32 0, i32 3
  %304 = load i32, i32* %303, align 8
  %305 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %306 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %305, i32 0, i32 0
  %307 = load i32, i32* %306, align 8
  %308 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %309 = load i16, i16* %8, align 2
  %310 = zext i16 %309 to i32
  %311 = call i32 @TIFFWriteFloatArray(%struct.tiff* %301, i32 %304, i32 %307, %struct.TIFFDirEntry* %308, i32 %310, float* %16)
  %312 = icmp ne i32 %311, 0
  br i1 %312, label %315, label %313

; <label>:313:                                    ; preds = %295
  %pgocount24 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 38)
  %314 = add i64 %pgocount24, 1
  store i64 %314, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 38)
  store i32 0, i32* %4, align 4
  br label %501

; <label>:315:                                    ; preds = %295
  %pgocount25 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 29)
  %316 = add i64 %pgocount25, 1
  store i64 %316, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 29)
  br label %317

; <label>:317:                                    ; preds = %315, %294
  br label %499

; <label>:318:                                    ; preds = %3
  %319 = load i16, i16* %8, align 2
  %320 = zext i16 %319 to i32
  %321 = icmp sgt i32 %320, 1
  br i1 %321, label %322, label %357

; <label>:322:                                    ; preds = %318
  %323 = load i16, i16* %8, align 2
  %324 = zext i16 %323 to i32
  %325 = icmp eq i32 %324, 65535
  br i1 %325, label %326, label %333

; <label>:326:                                    ; preds = %322
  %pgocount26 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 33)
  %327 = add i64 %pgocount26, 1
  store i64 %327, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 33)
  %328 = load %struct.tiff*, %struct.tiff** %5, align 8
  %329 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %330 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %329, i32 0, i32 0
  %331 = load i32, i32* %330, align 8
  %332 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %328, i32 %331, i16* %8, double** %17)
  br label %340

; <label>:333:                                    ; preds = %322
  %pgocount27 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 34)
  %334 = add i64 %pgocount27, 1
  store i64 %334, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 34)
  %335 = load %struct.tiff*, %struct.tiff** %5, align 8
  %336 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %337 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %336, i32 0, i32 0
  %338 = load i32, i32* %337, align 8
  %339 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %335, i32 %338, double** %17)
  br label %340

; <label>:340:                                    ; preds = %333, %326
  %341 = load %struct.tiff*, %struct.tiff** %5, align 8
  %342 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %343 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %342, i32 0, i32 3
  %344 = load i32, i32* %343, align 8
  %345 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %346 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %345, i32 0, i32 0
  %347 = load i32, i32* %346, align 8
  %348 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %349 = load i16, i16* %8, align 2
  %350 = zext i16 %349 to i32
  %351 = load double*, double** %17, align 8
  %352 = call i32 @TIFFWriteDoubleArray(%struct.tiff* %341, i32 %344, i32 %347, %struct.TIFFDirEntry* %348, i32 %350, double* %351)
  %353 = icmp ne i32 %352, 0
  br i1 %353, label %356, label %354

; <label>:354:                                    ; preds = %340
  %pgocount28 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 39)
  %355 = add i64 %pgocount28, 1
  store i64 %355, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 39)
  store i32 0, i32* %4, align 4
  br label %501

; <label>:356:                                    ; preds = %340
  br label %379

; <label>:357:                                    ; preds = %318
  %358 = load %struct.tiff*, %struct.tiff** %5, align 8
  %359 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %360 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %359, i32 0, i32 0
  %361 = load i32, i32* %360, align 8
  %362 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %358, i32 %361, double* %18)
  %363 = load %struct.tiff*, %struct.tiff** %5, align 8
  %364 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %365 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %364, i32 0, i32 3
  %366 = load i32, i32* %365, align 8
  %367 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %368 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %367, i32 0, i32 0
  %369 = load i32, i32* %368, align 8
  %370 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %371 = load i16, i16* %8, align 2
  %372 = zext i16 %371 to i32
  %373 = call i32 @TIFFWriteDoubleArray(%struct.tiff* %363, i32 %366, i32 %369, %struct.TIFFDirEntry* %370, i32 %372, double* %18)
  %374 = icmp ne i32 %373, 0
  br i1 %374, label %377, label %375

; <label>:375:                                    ; preds = %357
  %pgocount29 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 40)
  %376 = add i64 %pgocount29, 1
  store i64 %376, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 40)
  store i32 0, i32* %4, align 4
  br label %501

; <label>:377:                                    ; preds = %357
  %pgocount30 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 30)
  %378 = add i64 %pgocount30, 1
  store i64 %378, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 30)
  br label %379

; <label>:379:                                    ; preds = %377, %356
  br label %499

; <label>:380:                                    ; preds = %3
  %381 = load %struct.tiff*, %struct.tiff** %5, align 8
  %382 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %383 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %382, i32 0, i32 0
  %384 = load i32, i32* %383, align 8
  %385 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %381, i32 %384, i8** %19)
  %386 = load i8*, i8** %19, align 8
  %387 = call i64 @strlen(i8* %386) #4
  %388 = add i64 %387, 1
  %389 = trunc i64 %388 to i32
  %390 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %391 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %390, i32 0, i32 2
  store i32 %389, i32* %391, align 4
  %392 = load %struct.tiff*, %struct.tiff** %5, align 8
  %393 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %394 = load i8*, i8** %19, align 8
  %395 = call i32 @TIFFWriteByteArray(%struct.tiff* %392, %struct.TIFFDirEntry* %393, i8* %394)
  %396 = icmp ne i32 %395, 0
  br i1 %396, label %399, label %397

; <label>:397:                                    ; preds = %380
  %pgocount31 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 25)
  %398 = add i64 %pgocount31, 1
  store i64 %398, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 25)
  store i32 0, i32* %4, align 4
  br label %501

; <label>:399:                                    ; preds = %380
  %pgocount32 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 8)
  %400 = add i64 %pgocount32, 1
  store i64 %400, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 8)
  br label %499

; <label>:401:                                    ; preds = %._crit_edge3, %3
  %402 = load i16, i16* %8, align 2
  %403 = zext i16 %402 to i32
  %404 = icmp sgt i32 %403, 1
  br i1 %404, label %405, label %436

; <label>:405:                                    ; preds = %401
  %406 = load i16, i16* %8, align 2
  %407 = zext i16 %406 to i32
  %408 = icmp eq i32 %407, 65535
  br i1 %408, label %409, label %420

; <label>:409:                                    ; preds = %405
  %pgocount33 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 18)
  %410 = add i64 %pgocount33, 1
  store i64 %410, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 18)
  %411 = load %struct.tiff*, %struct.tiff** %5, align 8
  %412 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %413 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %412, i32 0, i32 0
  %414 = load i32, i32* %413, align 8
  %415 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %411, i32 %414, i16* %8, i8** %20)
  %416 = load i16, i16* %8, align 2
  %417 = zext i16 %416 to i32
  %418 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %419 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %418, i32 0, i32 2
  store i32 %417, i32* %419, align 4
  br label %427

; <label>:420:                                    ; preds = %405
  %pgocount34 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 19)
  %421 = add i64 %pgocount34, 1
  store i64 %421, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 19)
  %422 = load %struct.tiff*, %struct.tiff** %5, align 8
  %423 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %424 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %423, i32 0, i32 0
  %425 = load i32, i32* %424, align 8
  %426 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %422, i32 %425, i8** %20)
  br label %427

; <label>:427:                                    ; preds = %420, %409
  %428 = load %struct.tiff*, %struct.tiff** %5, align 8
  %429 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %430 = load i8*, i8** %20, align 8
  %431 = call i32 @TIFFWriteByteArray(%struct.tiff* %428, %struct.TIFFDirEntry* %429, i8* %430)
  %432 = icmp ne i32 %431, 0
  br i1 %432, label %435, label %433

; <label>:433:                                    ; preds = %427
  %pgocount35 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 26)
  %434 = add i64 %pgocount35, 1
  store i64 %434, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 26)
  store i32 0, i32* %4, align 4
  br label %501

; <label>:435:                                    ; preds = %427
  br label %450

; <label>:436:                                    ; preds = %401
  %437 = load %struct.tiff*, %struct.tiff** %5, align 8
  %438 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %439 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %438, i32 0, i32 0
  %440 = load i32, i32* %439, align 8
  %441 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %437, i32 %440, i8* %21)
  %442 = load %struct.tiff*, %struct.tiff** %5, align 8
  %443 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %444 = call i32 @TIFFWriteByteArray(%struct.tiff* %442, %struct.TIFFDirEntry* %443, i8* %21)
  %445 = icmp ne i32 %444, 0
  br i1 %445, label %448, label %446

; <label>:446:                                    ; preds = %436
  %pgocount36 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 27)
  %447 = add i64 %pgocount36, 1
  store i64 %447, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 27)
  store i32 0, i32* %4, align 4
  br label %501

; <label>:448:                                    ; preds = %436
  %pgocount37 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 9)
  %449 = add i64 %pgocount37, 1
  store i64 %449, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 9)
  br label %450

; <label>:450:                                    ; preds = %448, %435
  br label %499

; <label>:451:                                    ; preds = %3
  %452 = load i16, i16* %8, align 2
  %453 = zext i16 %452 to i32
  %454 = icmp eq i32 %453, 65535
  br i1 %454, label %455, label %466

; <label>:455:                                    ; preds = %451
  %pgocount38 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 20)
  %456 = add i64 %pgocount38, 1
  store i64 %456, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 20)
  %457 = load %struct.tiff*, %struct.tiff** %5, align 8
  %458 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %459 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %458, i32 0, i32 0
  %460 = load i32, i32* %459, align 8
  %461 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %457, i32 %460, i16* %8, i8** %22)
  %462 = load i16, i16* %8, align 2
  %463 = zext i16 %462 to i32
  %464 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %465 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %464, i32 0, i32 2
  store i32 %463, i32* %465, align 4
  br label %488

; <label>:466:                                    ; preds = %451
  %467 = load i16, i16* %8, align 2
  %468 = zext i16 %467 to i32
  %469 = icmp eq i32 %468, 65533
  br i1 %469, label %470, label %480

; <label>:470:                                    ; preds = %466
  %pgocount39 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 35)
  %471 = add i64 %pgocount39, 1
  store i64 %471, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 35)
  %472 = load %struct.tiff*, %struct.tiff** %5, align 8
  %473 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %474 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %473, i32 0, i32 0
  %475 = load i32, i32* %474, align 8
  %476 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %472, i32 %475, i32* %9, i8** %22)
  %477 = load i32, i32* %9, align 4
  %478 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %479 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %478, i32 0, i32 2
  store i32 %477, i32* %479, align 4
  br label %487

; <label>:480:                                    ; preds = %466
  %pgocount40 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 36)
  %481 = add i64 %pgocount40, 1
  store i64 %481, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 36)
  %482 = load %struct.tiff*, %struct.tiff** %5, align 8
  %483 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %484 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %483, i32 0, i32 0
  %485 = load i32, i32* %484, align 8
  %486 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %482, i32 %485, i8** %22)
  br label %487

; <label>:487:                                    ; preds = %480, %470
  br label %488

; <label>:488:                                    ; preds = %487, %455
  %489 = load %struct.tiff*, %struct.tiff** %5, align 8
  %490 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %491 = load i8*, i8** %22, align 8
  %492 = call i32 @TIFFWriteByteArray(%struct.tiff* %489, %struct.TIFFDirEntry* %490, i8* %491)
  %493 = icmp ne i32 %492, 0
  br i1 %493, label %496, label %494

; <label>:494:                                    ; preds = %488
  %pgocount41 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 28)
  %495 = add i64 %pgocount41, 1
  store i64 %495, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 28)
  store i32 0, i32* %4, align 4
  br label %501

; <label>:496:                                    ; preds = %488
  br label %499

; <label>:497:                                    ; preds = %3
  %pgocount42 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 6)
  %498 = add i64 %pgocount42, 1
  store i64 %498, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 6)
  br label %499

; <label>:499:                                    ; preds = %497, %496, %450, %399, %379, %317, %255, %193, %144, %3
  %pgocount43 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 4)
  %500 = add i64 %pgocount43, 1
  store i64 %500, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_TIFFWriteNormalTag, i64 0, i64 4)
  store i32 1, i32* %4, align 4
  br label %501

; <label>:501:                                    ; preds = %499, %494, %446, %433, %397, %375, %354, %313, %292, %251, %230, %181, %85
  %502 = load i32, i32* %4, align 4
  ret i32 %502
}

declare void @TIFFSwabArrayOfShort(i16*, i64) #1

declare void @TIFFSwabArrayOfLong(i32*, i64) #1

declare void @TIFFSwabShort(i16*) #1

declare void @TIFFSwabLong(i32*) #1

declare void @TIFFFreeDirectory(%struct.tiff*) #1

declare i32 @TIFFDefaultDirectory(%struct.tiff*) #1

declare i32 @TIFFGetField(%struct.tiff*, i32, ...) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFWriteShortArray(%struct.tiff*, i32, i32, %struct.TIFFDirEntry*, i32, i16*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca %struct.tiff*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.TIFFDirEntry*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i16*, align 8
  store %struct.tiff* %0, %struct.tiff** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32 %2, i32* %10, align 4
  store %struct.TIFFDirEntry* %3, %struct.TIFFDirEntry** %11, align 8
  store i32 %4, i32* %12, align 4
  store i16* %5, i16** %13, align 8
  %14 = load i32, i32* %10, align 4
  %15 = trunc i32 %14 to i16
  %16 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %17 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %16, i32 0, i32 0
  store i16 %15, i16* %17, align 4
  %18 = load i32, i32* %9, align 4
  %19 = trunc i32 %18 to i16
  %20 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %21 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %20, i32 0, i32 1
  store i16 %19, i16* %21, align 2
  %22 = load i32, i32* %12, align 4
  %23 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %24 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %23, i32 0, i32 2
  store i32 %22, i32* %24, align 4
  %25 = load i32, i32* %12, align 4
  %26 = icmp ule i32 %25, 2
  br i1 %26, label %27, label %84

; <label>:27:                                     ; preds = %6
  %28 = load %struct.tiff*, %struct.tiff** %8, align 8
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %28, i32 0, i32 7
  %30 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %29, i32 0, i32 0
  %31 = load i16, i16* %30, align 8
  %32 = zext i16 %31 to i32
  %33 = icmp eq i32 %32, 19789
  br i1 %33, label %34, label %58

; <label>:34:                                     ; preds = %27
  %35 = load i16*, i16** %13, align 8
  %36 = getelementptr inbounds i16, i16* %35, i64 0
  %37 = load i16, i16* %36, align 2
  %38 = zext i16 %37 to i64
  %39 = shl i64 %38, 16
  %40 = trunc i64 %39 to i32
  %41 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %42 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %41, i32 0, i32 3
  store i32 %40, i32* %42, align 4
  %43 = load i32, i32* %12, align 4
  %44 = icmp eq i32 %43, 2
  br i1 %44, label %45, label %56

; <label>:45:                                     ; preds = %34
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFWriteShortArray, i64 0, i64 3)
  %46 = add i64 %pgocount, 1
  store i64 %46, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFWriteShortArray, i64 0, i64 3)
  %47 = load i16*, i16** %13, align 8
  %48 = getelementptr inbounds i16, i16* %47, i64 1
  %49 = load i16, i16* %48, align 2
  %50 = zext i16 %49 to i32
  %51 = and i32 %50, 65535
  %52 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %53 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %52, i32 0, i32 3
  %54 = load i32, i32* %53, align 4
  %55 = or i32 %54, %51
  store i32 %55, i32* %53, align 4
  br label %56

; <label>:56:                                     ; preds = %45, %34
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFWriteShortArray, i64 0, i64 1)
  %57 = add i64 %pgocount1, 1
  store i64 %57, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFWriteShortArray, i64 0, i64 1)
  br label %83

; <label>:58:                                     ; preds = %27
  %59 = load i16*, i16** %13, align 8
  %60 = getelementptr inbounds i16, i16* %59, i64 0
  %61 = load i16, i16* %60, align 2
  %62 = zext i16 %61 to i32
  %63 = and i32 %62, 65535
  %64 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %65 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %64, i32 0, i32 3
  store i32 %63, i32* %65, align 4
  %66 = load i32, i32* %12, align 4
  %67 = icmp eq i32 %66, 2
  br i1 %67, label %68, label %81

; <label>:68:                                     ; preds = %58
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFWriteShortArray, i64 0, i64 4)
  %69 = add i64 %pgocount2, 1
  store i64 %69, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFWriteShortArray, i64 0, i64 4)
  %70 = load i16*, i16** %13, align 8
  %71 = getelementptr inbounds i16, i16* %70, i64 1
  %72 = load i16, i16* %71, align 2
  %73 = zext i16 %72 to i64
  %74 = shl i64 %73, 16
  %75 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %76 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %75, i32 0, i32 3
  %77 = load i32, i32* %76, align 4
  %78 = zext i32 %77 to i64
  %79 = or i64 %78, %74
  %80 = trunc i64 %79 to i32
  store i32 %80, i32* %76, align 4
  br label %81

; <label>:81:                                     ; preds = %68, %58
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFWriteShortArray, i64 0, i64 2)
  %82 = add i64 %pgocount3, 1
  store i64 %82, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFWriteShortArray, i64 0, i64 2)
  br label %83

; <label>:83:                                     ; preds = %81, %56
  store i32 1, i32* %7, align 4
  br label %91

; <label>:84:                                     ; preds = %6
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFWriteShortArray, i64 0, i64 0)
  %85 = add i64 %pgocount4, 1
  store i64 %85, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_TIFFWriteShortArray, i64 0, i64 0)
  %86 = load %struct.tiff*, %struct.tiff** %8, align 8
  %87 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %88 = load i16*, i16** %13, align 8
  %89 = bitcast i16* %88 to i8*
  %90 = call i32 @TIFFWriteData(%struct.tiff* %86, %struct.TIFFDirEntry* %87, i8* %89)
  store i32 %90, i32* %7, align 4
  br label %91

; <label>:91:                                     ; preds = %84, %83
  %92 = load i32, i32* %7, align 4
  ret i32 %92
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFWriteFloatArray(%struct.tiff*, i32, i32, %struct.TIFFDirEntry*, i32, float*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca %struct.tiff*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.TIFFDirEntry*, align 8
  %12 = alloca i32, align 4
  %13 = alloca float*, align 8
  store %struct.tiff* %0, %struct.tiff** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32 %2, i32* %10, align 4
  store %struct.TIFFDirEntry* %3, %struct.TIFFDirEntry** %11, align 8
  store i32 %4, i32* %12, align 4
  store float* %5, float** %13, align 8
  %14 = load i32, i32* %10, align 4
  %15 = trunc i32 %14 to i16
  %16 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %17 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %16, i32 0, i32 0
  store i16 %15, i16* %17, align 4
  %18 = load i32, i32* %9, align 4
  %19 = trunc i32 %18 to i16
  %20 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %21 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %20, i32 0, i32 1
  store i16 %19, i16* %21, align 2
  %22 = load i32, i32* %12, align 4
  %23 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %24 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %23, i32 0, i32 2
  store i32 %22, i32* %24, align 4
  %25 = load i32, i32* %12, align 4
  %26 = icmp eq i32 %25, 1
  br i1 %26, label %27, label %35

; <label>:27:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFWriteFloatArray, i64 0, i64 0)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFWriteFloatArray, i64 0, i64 0)
  %29 = load float*, float** %13, align 8
  %30 = getelementptr inbounds float, float* %29, i64 0
  %31 = bitcast float* %30 to i32*
  %32 = load i32, i32* %31, align 4
  %33 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %34 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %33, i32 0, i32 3
  store i32 %32, i32* %34, align 4
  store i32 1, i32* %7, align 4
  br label %42

; <label>:35:                                     ; preds = %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFWriteFloatArray, i64 0, i64 1)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFWriteFloatArray, i64 0, i64 1)
  %37 = load %struct.tiff*, %struct.tiff** %8, align 8
  %38 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %39 = load float*, float** %13, align 8
  %40 = bitcast float* %39 to i8*
  %41 = call i32 @TIFFWriteData(%struct.tiff* %37, %struct.TIFFDirEntry* %38, i8* %40)
  store i32 %41, i32* %7, align 4
  br label %42

; <label>:42:                                     ; preds = %35, %27
  %43 = load i32, i32* %7, align 4
  ret i32 %43
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFWriteDoubleArray(%struct.tiff*, i32, i32, %struct.TIFFDirEntry*, i32, double*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_TIFFWriteDoubleArray, i64 0, i64 0)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_TIFFWriteDoubleArray, i64 0, i64 0)
  %8 = alloca %struct.tiff*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.TIFFDirEntry*, align 8
  %12 = alloca i32, align 4
  %13 = alloca double*, align 8
  store %struct.tiff* %0, %struct.tiff** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32 %2, i32* %10, align 4
  store %struct.TIFFDirEntry* %3, %struct.TIFFDirEntry** %11, align 8
  store i32 %4, i32* %12, align 4
  store double* %5, double** %13, align 8
  %14 = load i32, i32* %10, align 4
  %15 = trunc i32 %14 to i16
  %16 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %17 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %16, i32 0, i32 0
  store i16 %15, i16* %17, align 4
  %18 = load i32, i32* %9, align 4
  %19 = trunc i32 %18 to i16
  %20 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %21 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %20, i32 0, i32 1
  store i16 %19, i16* %21, align 2
  %22 = load i32, i32* %12, align 4
  %23 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %24 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %23, i32 0, i32 2
  store i32 %22, i32* %24, align 4
  %25 = load %struct.tiff*, %struct.tiff** %8, align 8
  %26 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %27 = load double*, double** %13, align 8
  %28 = bitcast double* %27 to i8*
  %29 = call i32 @TIFFWriteData(%struct.tiff* %25, %struct.TIFFDirEntry* %26, i8* %28)
  ret i32 %29
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFWriteByteArray(%struct.tiff*, %struct.TIFFDirEntry*, i8*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca %struct.TIFFDirEntry*, align 8
  %7 = alloca i8*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %6, align 8
  store i8* %2, i8** %7, align 8
  %8 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %9 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %8, i32 0, i32 2
  %10 = load i32, i32* %9, align 4
  %11 = icmp ugt i32 %10, 4
  br i1 %11, label %12, label %22

; <label>:12:                                     ; preds = %3
  %13 = load %struct.tiff*, %struct.tiff** %5, align 8
  %14 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %15 = load i8*, i8** %7, align 8
  %16 = call i32 @TIFFWriteData(%struct.tiff* %13, %struct.TIFFDirEntry* %14, i8* %15)
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %20, label %18

; <label>:18:                                     ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFWriteByteArray, i64 0, i64 2)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFWriteByteArray, i64 0, i64 2)
  store i32 0, i32* %4, align 4
  br label %32

; <label>:20:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFWriteByteArray, i64 0, i64 1)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFWriteByteArray, i64 0, i64 1)
  br label %31

; <label>:22:                                     ; preds = %3
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFWriteByteArray, i64 0, i64 0)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFWriteByteArray, i64 0, i64 0)
  %24 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %25 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %24, i32 0, i32 3
  %26 = bitcast i32* %25 to i8*
  %27 = load i8*, i8** %7, align 8
  %28 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %29 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %28, i32 0, i32 2
  %30 = load i32, i32* %29, align 4
  call void @_TIFFmemcpy(i8* %26, i8* %27, i32 %30)
  br label %31

; <label>:31:                                     ; preds = %22, %20
  store i32 1, i32* %4, align 4
  br label %32

; <label>:32:                                     ; preds = %31, %18
  %33 = load i32, i32* %4, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFWriteData(%struct.tiff*, %struct.TIFFDirEntry*, i8*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca %struct.TIFFDirEntry*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store %struct.TIFFDirEntry* %1, %struct.TIFFDirEntry** %6, align 8
  store i8* %2, i8** %7, align 8
  %9 = load %struct.tiff*, %struct.tiff** %5, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 3
  %11 = load i32, i32* %10, align 8
  %12 = and i32 %11, 128
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %58

; <label>:14:                                     ; preds = %3
  %15 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %16 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %15, i32 0, i32 1
  %17 = load i16, i16* %16, align 2
  %18 = zext i16 %17 to i32
  switch i32 %18, label %56 [
    i32 3, label %._crit_edge
    i32 8, label %23
    i32 4, label %._crit_edge1
    i32 9, label %._crit_edge2
    i32 11, label %31
    i32 5, label %._crit_edge3
    i32 10, label %39
    i32 12, label %48
  ]

._crit_edge3:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 3)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 3)
  br label %39

._crit_edge2:                                     ; preds = %14
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 2)
  %20 = add i64 %pgocount4, 1
  store i64 %20, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 2)
  br label %31

._crit_edge1:                                     ; preds = %14
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 1)
  %21 = add i64 %pgocount5, 1
  store i64 %21, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 1)
  br label %31

._crit_edge:                                      ; preds = %14
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 0)
  %22 = add i64 %pgocount6, 1
  store i64 %22, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 0)
  br label %23

; <label>:23:                                     ; preds = %._crit_edge, %14
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 9)
  %24 = add i64 %pgocount7, 1
  store i64 %24, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 9)
  %25 = load i8*, i8** %7, align 8
  %26 = bitcast i8* %25 to i16*
  %27 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %28 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %27, i32 0, i32 2
  %29 = load i32, i32* %28, align 4
  %30 = zext i32 %29 to i64
  call void @TIFFSwabArrayOfShort(i16* %26, i64 %30)
  br label %56

; <label>:31:                                     ; preds = %._crit_edge2, %._crit_edge1, %14
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 8)
  %32 = add i64 %pgocount8, 1
  store i64 %32, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 8)
  %33 = load i8*, i8** %7, align 8
  %34 = bitcast i8* %33 to i32*
  %35 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %36 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %35, i32 0, i32 2
  %37 = load i32, i32* %36, align 4
  %38 = zext i32 %37 to i64
  call void @TIFFSwabArrayOfLong(i32* %34, i64 %38)
  br label %56

; <label>:39:                                     ; preds = %._crit_edge3, %14
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 10)
  %40 = add i64 %pgocount9, 1
  store i64 %40, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 10)
  %41 = load i8*, i8** %7, align 8
  %42 = bitcast i8* %41 to i32*
  %43 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %44 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %43, i32 0, i32 2
  %45 = load i32, i32* %44, align 4
  %46 = mul i32 2, %45
  %47 = zext i32 %46 to i64
  call void @TIFFSwabArrayOfLong(i32* %42, i64 %47)
  br label %56

; <label>:48:                                     ; preds = %14
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 11)
  %49 = add i64 %pgocount10, 1
  store i64 %49, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 11)
  %50 = load i8*, i8** %7, align 8
  %51 = bitcast i8* %50 to double*
  %52 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %53 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %52, i32 0, i32 2
  %54 = load i32, i32* %53, align 4
  %55 = zext i32 %54 to i64
  call void @TIFFSwabArrayOfDouble(double* %51, i64 %55)
  br label %56

; <label>:56:                                     ; preds = %48, %39, %31, %23, %14
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 5)
  %57 = add i64 %pgocount11, 1
  store i64 %57, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 5)
  br label %58

; <label>:58:                                     ; preds = %56, %3
  %59 = load %struct.tiff*, %struct.tiff** %5, align 8
  %60 = getelementptr inbounds %struct.tiff, %struct.tiff* %59, i32 0, i32 15
  %61 = load i32, i32* %60, align 8
  %62 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %63 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %62, i32 0, i32 3
  store i32 %61, i32* %63, align 4
  %64 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %65 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %64, i32 0, i32 2
  %66 = load i32, i32* %65, align 4
  %67 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %68 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %67, i32 0, i32 1
  %69 = load i16, i16* %68, align 2
  %70 = zext i16 %69 to i64
  %71 = getelementptr inbounds [0 x i32], [0 x i32]* @tiffDataWidth, i64 0, i64 %70
  %72 = load i32, i32* %71, align 4
  %73 = mul i32 %66, %72
  store i32 %73, i32* %8, align 4
  %74 = load %struct.tiff*, %struct.tiff** %5, align 8
  %75 = getelementptr inbounds %struct.tiff, %struct.tiff* %74, i32 0, i32 51
  %76 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %75, align 8
  %77 = load %struct.tiff*, %struct.tiff** %5, align 8
  %78 = getelementptr inbounds %struct.tiff, %struct.tiff* %77, i32 0, i32 48
  %79 = load i8*, i8** %78, align 8
  %80 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %81 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %80, i32 0, i32 3
  %82 = load i32, i32* %81, align 4
  %83 = ptrtoint i32 (i8*, i32, i32)* %76 to i64
  call void @__llvm_profile_instrument_target(i64 %83, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFWriteData to i8*), i32 0)
  %84 = call i32 %76(i8* %79, i32 %82, i32 0)
  %85 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %86 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %85, i32 0, i32 3
  %87 = load i32, i32* %86, align 4
  %88 = icmp eq i32 %84, %87
  br i1 %88, label %89, label %112

; <label>:89:                                     ; preds = %58
  %pgocount12 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 6)
  %90 = add i64 %pgocount12, 1
  store i64 %90, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 6)
  %91 = load %struct.tiff*, %struct.tiff** %5, align 8
  %92 = getelementptr inbounds %struct.tiff, %struct.tiff* %91, i32 0, i32 50
  %93 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %92, align 8
  %94 = load %struct.tiff*, %struct.tiff** %5, align 8
  %95 = getelementptr inbounds %struct.tiff, %struct.tiff* %94, i32 0, i32 48
  %96 = load i8*, i8** %95, align 8
  %97 = load i8*, i8** %7, align 8
  %98 = load i32, i32* %8, align 4
  %99 = ptrtoint i32 (i8*, i8*, i32)* %93 to i64
  call void @__llvm_profile_instrument_target(i64 %99, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFWriteData to i8*), i32 1)
  %100 = call i32 %93(i8* %96, i8* %97, i32 %98)
  %101 = load i32, i32* %8, align 4
  %102 = icmp eq i32 %100, %101
  br i1 %102, label %103, label %112

; <label>:103:                                    ; preds = %89
  %pgocount13 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 7)
  %104 = add i64 %pgocount13, 1
  store i64 %104, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 7)
  %105 = load i32, i32* %8, align 4
  %106 = add nsw i32 %105, 1
  %107 = and i32 %106, -2
  %108 = load %struct.tiff*, %struct.tiff** %5, align 8
  %109 = getelementptr inbounds %struct.tiff, %struct.tiff* %108, i32 0, i32 15
  %110 = load i32, i32* %109, align 8
  %111 = add nsw i32 %110, %107
  store i32 %111, i32* %109, align 8
  store i32 1, i32* %4, align 4
  br label %125

; <label>:112:                                    ; preds = %89, %58
  %pgocount14 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 4)
  %113 = add i64 %pgocount14, 1
  store i64 %113, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_TIFFWriteData, i64 0, i64 4)
  %114 = load %struct.tiff*, %struct.tiff** %5, align 8
  %115 = getelementptr inbounds %struct.tiff, %struct.tiff* %114, i32 0, i32 0
  %116 = load i8*, i8** %115, align 8
  %117 = load %struct.tiff*, %struct.tiff** %5, align 8
  %118 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %6, align 8
  %119 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %118, i32 0, i32 0
  %120 = load i16, i16* %119, align 4
  %121 = zext i16 %120 to i32
  %122 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %117, i32 %121)
  %123 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %122, i32 0, i32 7
  %124 = load i8*, i8** %123, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %116, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.6, i32 0, i32 0), i8* %124)
  store i32 0, i32* %4, align 4
  br label %125

; <label>:125:                                    ; preds = %112, %103
  %126 = load i32, i32* %4, align 4
  ret i32 %126
}

declare void @TIFFSwabArrayOfDouble(double*, i64) #1

declare %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff*, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFWriteAnyArray(%struct.tiff*, i32, i32, %struct.TIFFDirEntry*, i32, double*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca %struct.tiff*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.TIFFDirEntry*, align 8
  %12 = alloca i32, align 4
  %13 = alloca double*, align 8
  %14 = alloca [80 x i8], align 16
  %15 = alloca i8*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca i8*, align 8
  %20 = alloca i16*, align 8
  %21 = alloca i16*, align 8
  %22 = alloca i32*, align 8
  %23 = alloca i32*, align 8
  %24 = alloca float*, align 8
  store %struct.tiff* %0, %struct.tiff** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32 %2, i32* %10, align 4
  store %struct.TIFFDirEntry* %3, %struct.TIFFDirEntry** %11, align 8
  store i32 %4, i32* %12, align 4
  store double* %5, double** %13, align 8
  %25 = getelementptr inbounds [80 x i8], [80 x i8]* %14, i32 0, i32 0
  store i8* %25, i8** %15, align 8
  store i32 0, i32* %17, align 4
  %26 = load i32, i32* %12, align 4
  %27 = load i32, i32* %9, align 4
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds [0 x i32], [0 x i32]* @tiffDataWidth, i64 0, i64 %28
  %30 = load i32, i32* %29, align 4
  %31 = mul i32 %26, %30
  %32 = zext i32 %31 to i64
  %33 = icmp ugt i64 %32, 80
  br i1 %33, label %34, label %43

; <label>:34:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 8)
  %35 = add i64 %pgocount, 1
  store i64 %35, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 8)
  %36 = load i32, i32* %12, align 4
  %37 = load i32, i32* %9, align 4
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds [0 x i32], [0 x i32]* @tiffDataWidth, i64 0, i64 %38
  %40 = load i32, i32* %39, align 4
  %41 = mul i32 %36, %40
  %42 = call i8* @_TIFFmalloc(i32 %41)
  store i8* %42, i8** %15, align 8
  br label %43

; <label>:43:                                     ; preds = %34, %6
  %44 = load i32, i32* %9, align 4
  switch i32 %44, label %313 [
    i32 1, label %45
    i32 6, label %87
    i32 3, label %129
    i32 8, label %164
    i32 4, label %199
    i32 9, label %234
    i32 11, label %269
    i32 12, label %304
  ]

; <label>:45:                                     ; preds = %43
  %46 = load i8*, i8** %15, align 8
  store i8* %46, i8** %18, align 8
  store i32 0, i32* %16, align 4
  br label %47

; <label>:47:                                     ; preds = %63, %45
  %48 = load i32, i32* %16, align 4
  %49 = load i32, i32* %12, align 4
  %50 = icmp slt i32 %48, %49
  br i1 %50, label %51, label %66

; <label>:51:                                     ; preds = %47
  %pgocount1 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 0)
  %52 = add i64 %pgocount1, 1
  store i64 %52, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 0)
  %53 = load double*, double** %13, align 8
  %54 = load i32, i32* %16, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds double, double* %53, i64 %55
  %57 = load double, double* %56, align 8
  %58 = fptoui double %57 to i8
  %59 = load i8*, i8** %18, align 8
  %60 = load i32, i32* %16, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i8, i8* %59, i64 %61
  store i8 %58, i8* %62, align 1
  br label %63

; <label>:63:                                     ; preds = %51
  %64 = load i32, i32* %16, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %16, align 4
  br label %47

; <label>:66:                                     ; preds = %47
  %67 = load i32, i32* %10, align 4
  %68 = trunc i32 %67 to i16
  %69 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %70 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %69, i32 0, i32 0
  store i16 %68, i16* %70, align 4
  %71 = load i32, i32* %9, align 4
  %72 = trunc i32 %71 to i16
  %73 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %74 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %73, i32 0, i32 1
  store i16 %72, i16* %74, align 2
  %75 = load i32, i32* %12, align 4
  %76 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %77 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %76, i32 0, i32 2
  store i32 %75, i32* %77, align 4
  %78 = load %struct.tiff*, %struct.tiff** %8, align 8
  %79 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %80 = load i8*, i8** %18, align 8
  %81 = call i32 @TIFFWriteByteArray(%struct.tiff* %78, %struct.TIFFDirEntry* %79, i8* %80)
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %85, label %83

; <label>:83:                                     ; preds = %66
  %pgocount2 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 18)
  %84 = add i64 %pgocount2, 1
  store i64 %84, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 18)
  br label %316

; <label>:85:                                     ; preds = %66
  %pgocount3 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 11)
  %86 = add i64 %pgocount3, 1
  store i64 %86, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 11)
  br label %315

; <label>:87:                                     ; preds = %43
  %88 = load i8*, i8** %15, align 8
  store i8* %88, i8** %19, align 8
  store i32 0, i32* %16, align 4
  br label %89

; <label>:89:                                     ; preds = %105, %87
  %90 = load i32, i32* %16, align 4
  %91 = load i32, i32* %12, align 4
  %92 = icmp slt i32 %90, %91
  br i1 %92, label %93, label %108

; <label>:93:                                     ; preds = %89
  %pgocount4 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 1)
  %94 = add i64 %pgocount4, 1
  store i64 %94, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 1)
  %95 = load double*, double** %13, align 8
  %96 = load i32, i32* %16, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds double, double* %95, i64 %97
  %99 = load double, double* %98, align 8
  %100 = fptosi double %99 to i8
  %101 = load i8*, i8** %19, align 8
  %102 = load i32, i32* %16, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i8, i8* %101, i64 %103
  store i8 %100, i8* %104, align 1
  br label %105

; <label>:105:                                    ; preds = %93
  %106 = load i32, i32* %16, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, i32* %16, align 4
  br label %89

; <label>:108:                                    ; preds = %89
  %109 = load i32, i32* %10, align 4
  %110 = trunc i32 %109 to i16
  %111 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %112 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %111, i32 0, i32 0
  store i16 %110, i16* %112, align 4
  %113 = load i32, i32* %9, align 4
  %114 = trunc i32 %113 to i16
  %115 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %116 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %115, i32 0, i32 1
  store i16 %114, i16* %116, align 2
  %117 = load i32, i32* %12, align 4
  %118 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %119 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %118, i32 0, i32 2
  store i32 %117, i32* %119, align 4
  %120 = load %struct.tiff*, %struct.tiff** %8, align 8
  %121 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %122 = load i8*, i8** %19, align 8
  %123 = call i32 @TIFFWriteByteArray(%struct.tiff* %120, %struct.TIFFDirEntry* %121, i8* %122)
  %124 = icmp ne i32 %123, 0
  br i1 %124, label %127, label %125

; <label>:125:                                    ; preds = %108
  %pgocount5 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 19)
  %126 = add i64 %pgocount5, 1
  store i64 %126, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 19)
  br label %316

; <label>:127:                                    ; preds = %108
  %pgocount6 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 12)
  %128 = add i64 %pgocount6, 1
  store i64 %128, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 12)
  br label %315

; <label>:129:                                    ; preds = %43
  %130 = load i8*, i8** %15, align 8
  %131 = bitcast i8* %130 to i16*
  store i16* %131, i16** %20, align 8
  store i32 0, i32* %16, align 4
  br label %132

; <label>:132:                                    ; preds = %148, %129
  %133 = load i32, i32* %16, align 4
  %134 = load i32, i32* %12, align 4
  %135 = icmp slt i32 %133, %134
  br i1 %135, label %136, label %151

; <label>:136:                                    ; preds = %132
  %pgocount7 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 2)
  %137 = add i64 %pgocount7, 1
  store i64 %137, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 2)
  %138 = load double*, double** %13, align 8
  %139 = load i32, i32* %16, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds double, double* %138, i64 %140
  %142 = load double, double* %141, align 8
  %143 = fptoui double %142 to i16
  %144 = load i16*, i16** %20, align 8
  %145 = load i32, i32* %16, align 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i16, i16* %144, i64 %146
  store i16 %143, i16* %147, align 2
  br label %148

; <label>:148:                                    ; preds = %136
  %149 = load i32, i32* %16, align 4
  %150 = add nsw i32 %149, 1
  store i32 %150, i32* %16, align 4
  br label %132

; <label>:151:                                    ; preds = %132
  %152 = load %struct.tiff*, %struct.tiff** %8, align 8
  %153 = load i32, i32* %9, align 4
  %154 = load i32, i32* %10, align 4
  %155 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %156 = load i32, i32* %12, align 4
  %157 = load i16*, i16** %20, align 8
  %158 = call i32 @TIFFWriteShortArray(%struct.tiff* %152, i32 %153, i32 %154, %struct.TIFFDirEntry* %155, i32 %156, i16* %157)
  %159 = icmp ne i32 %158, 0
  br i1 %159, label %162, label %160

; <label>:160:                                    ; preds = %151
  %pgocount8 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 20)
  %161 = add i64 %pgocount8, 1
  store i64 %161, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 20)
  br label %316

; <label>:162:                                    ; preds = %151
  %pgocount9 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 13)
  %163 = add i64 %pgocount9, 1
  store i64 %163, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 13)
  br label %315

; <label>:164:                                    ; preds = %43
  %165 = load i8*, i8** %15, align 8
  %166 = bitcast i8* %165 to i16*
  store i16* %166, i16** %21, align 8
  store i32 0, i32* %16, align 4
  br label %167

; <label>:167:                                    ; preds = %183, %164
  %168 = load i32, i32* %16, align 4
  %169 = load i32, i32* %12, align 4
  %170 = icmp slt i32 %168, %169
  br i1 %170, label %171, label %186

; <label>:171:                                    ; preds = %167
  %pgocount10 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 3)
  %172 = add i64 %pgocount10, 1
  store i64 %172, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 3)
  %173 = load double*, double** %13, align 8
  %174 = load i32, i32* %16, align 4
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds double, double* %173, i64 %175
  %177 = load double, double* %176, align 8
  %178 = fptosi double %177 to i16
  %179 = load i16*, i16** %21, align 8
  %180 = load i32, i32* %16, align 4
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds i16, i16* %179, i64 %181
  store i16 %178, i16* %182, align 2
  br label %183

; <label>:183:                                    ; preds = %171
  %184 = load i32, i32* %16, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, i32* %16, align 4
  br label %167

; <label>:186:                                    ; preds = %167
  %187 = load %struct.tiff*, %struct.tiff** %8, align 8
  %188 = load i32, i32* %9, align 4
  %189 = load i32, i32* %10, align 4
  %190 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %191 = load i32, i32* %12, align 4
  %192 = load i16*, i16** %21, align 8
  %193 = call i32 @TIFFWriteShortArray(%struct.tiff* %187, i32 %188, i32 %189, %struct.TIFFDirEntry* %190, i32 %191, i16* %192)
  %194 = icmp ne i32 %193, 0
  br i1 %194, label %197, label %195

; <label>:195:                                    ; preds = %186
  %pgocount11 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 21)
  %196 = add i64 %pgocount11, 1
  store i64 %196, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 21)
  br label %316

; <label>:197:                                    ; preds = %186
  %pgocount12 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 14)
  %198 = add i64 %pgocount12, 1
  store i64 %198, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 14)
  br label %315

; <label>:199:                                    ; preds = %43
  %200 = load i8*, i8** %15, align 8
  %201 = bitcast i8* %200 to i32*
  store i32* %201, i32** %22, align 8
  store i32 0, i32* %16, align 4
  br label %202

; <label>:202:                                    ; preds = %218, %199
  %203 = load i32, i32* %16, align 4
  %204 = load i32, i32* %12, align 4
  %205 = icmp slt i32 %203, %204
  br i1 %205, label %206, label %221

; <label>:206:                                    ; preds = %202
  %pgocount13 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 4)
  %207 = add i64 %pgocount13, 1
  store i64 %207, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 4)
  %208 = load double*, double** %13, align 8
  %209 = load i32, i32* %16, align 4
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds double, double* %208, i64 %210
  %212 = load double, double* %211, align 8
  %213 = fptoui double %212 to i32
  %214 = load i32*, i32** %22, align 8
  %215 = load i32, i32* %16, align 4
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds i32, i32* %214, i64 %216
  store i32 %213, i32* %217, align 4
  br label %218

; <label>:218:                                    ; preds = %206
  %219 = load i32, i32* %16, align 4
  %220 = add nsw i32 %219, 1
  store i32 %220, i32* %16, align 4
  br label %202

; <label>:221:                                    ; preds = %202
  %222 = load %struct.tiff*, %struct.tiff** %8, align 8
  %223 = load i32, i32* %9, align 4
  %224 = load i32, i32* %10, align 4
  %225 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %226 = load i32, i32* %12, align 4
  %227 = load i32*, i32** %22, align 8
  %228 = call i32 @TIFFWriteLongArray(%struct.tiff* %222, i32 %223, i32 %224, %struct.TIFFDirEntry* %225, i32 %226, i32* %227)
  %229 = icmp ne i32 %228, 0
  br i1 %229, label %232, label %230

; <label>:230:                                    ; preds = %221
  %pgocount14 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 22)
  %231 = add i64 %pgocount14, 1
  store i64 %231, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 22)
  br label %316

; <label>:232:                                    ; preds = %221
  %pgocount15 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 15)
  %233 = add i64 %pgocount15, 1
  store i64 %233, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 15)
  br label %315

; <label>:234:                                    ; preds = %43
  %235 = load i8*, i8** %15, align 8
  %236 = bitcast i8* %235 to i32*
  store i32* %236, i32** %23, align 8
  store i32 0, i32* %16, align 4
  br label %237

; <label>:237:                                    ; preds = %253, %234
  %238 = load i32, i32* %16, align 4
  %239 = load i32, i32* %12, align 4
  %240 = icmp slt i32 %238, %239
  br i1 %240, label %241, label %256

; <label>:241:                                    ; preds = %237
  %pgocount16 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 5)
  %242 = add i64 %pgocount16, 1
  store i64 %242, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 5)
  %243 = load double*, double** %13, align 8
  %244 = load i32, i32* %16, align 4
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds double, double* %243, i64 %245
  %247 = load double, double* %246, align 8
  %248 = fptosi double %247 to i32
  %249 = load i32*, i32** %23, align 8
  %250 = load i32, i32* %16, align 4
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds i32, i32* %249, i64 %251
  store i32 %248, i32* %252, align 4
  br label %253

; <label>:253:                                    ; preds = %241
  %254 = load i32, i32* %16, align 4
  %255 = add nsw i32 %254, 1
  store i32 %255, i32* %16, align 4
  br label %237

; <label>:256:                                    ; preds = %237
  %257 = load %struct.tiff*, %struct.tiff** %8, align 8
  %258 = load i32, i32* %9, align 4
  %259 = load i32, i32* %10, align 4
  %260 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %261 = load i32, i32* %12, align 4
  %262 = load i32*, i32** %23, align 8
  %263 = call i32 @TIFFWriteLongArray(%struct.tiff* %257, i32 %258, i32 %259, %struct.TIFFDirEntry* %260, i32 %261, i32* %262)
  %264 = icmp ne i32 %263, 0
  br i1 %264, label %267, label %265

; <label>:265:                                    ; preds = %256
  %pgocount17 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 23)
  %266 = add i64 %pgocount17, 1
  store i64 %266, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 23)
  br label %316

; <label>:267:                                    ; preds = %256
  %pgocount18 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 16)
  %268 = add i64 %pgocount18, 1
  store i64 %268, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 16)
  br label %315

; <label>:269:                                    ; preds = %43
  %270 = load i8*, i8** %15, align 8
  %271 = bitcast i8* %270 to float*
  store float* %271, float** %24, align 8
  store i32 0, i32* %16, align 4
  br label %272

; <label>:272:                                    ; preds = %288, %269
  %273 = load i32, i32* %16, align 4
  %274 = load i32, i32* %12, align 4
  %275 = icmp slt i32 %273, %274
  br i1 %275, label %276, label %291

; <label>:276:                                    ; preds = %272
  %pgocount19 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 6)
  %277 = add i64 %pgocount19, 1
  store i64 %277, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 6)
  %278 = load double*, double** %13, align 8
  %279 = load i32, i32* %16, align 4
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds double, double* %278, i64 %280
  %282 = load double, double* %281, align 8
  %283 = fptrunc double %282 to float
  %284 = load float*, float** %24, align 8
  %285 = load i32, i32* %16, align 4
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds float, float* %284, i64 %286
  store float %283, float* %287, align 4
  br label %288

; <label>:288:                                    ; preds = %276
  %289 = load i32, i32* %16, align 4
  %290 = add nsw i32 %289, 1
  store i32 %290, i32* %16, align 4
  br label %272

; <label>:291:                                    ; preds = %272
  %292 = load %struct.tiff*, %struct.tiff** %8, align 8
  %293 = load i32, i32* %9, align 4
  %294 = load i32, i32* %10, align 4
  %295 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %296 = load i32, i32* %12, align 4
  %297 = load float*, float** %24, align 8
  %298 = call i32 @TIFFWriteFloatArray(%struct.tiff* %292, i32 %293, i32 %294, %struct.TIFFDirEntry* %295, i32 %296, float* %297)
  %299 = icmp ne i32 %298, 0
  br i1 %299, label %302, label %300

; <label>:300:                                    ; preds = %291
  %pgocount20 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 24)
  %301 = add i64 %pgocount20, 1
  store i64 %301, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 24)
  br label %316

; <label>:302:                                    ; preds = %291
  %pgocount21 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 17)
  %303 = add i64 %pgocount21, 1
  store i64 %303, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 17)
  br label %315

; <label>:304:                                    ; preds = %43
  %pgocount22 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 9)
  %305 = add i64 %pgocount22, 1
  store i64 %305, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 9)
  %306 = load %struct.tiff*, %struct.tiff** %8, align 8
  %307 = load i32, i32* %9, align 4
  %308 = load i32, i32* %10, align 4
  %309 = load %struct.TIFFDirEntry*, %struct.TIFFDirEntry** %11, align 8
  %310 = load i32, i32* %12, align 4
  %311 = load double*, double** %13, align 8
  %312 = call i32 @TIFFWriteDoubleArray(%struct.tiff* %306, i32 %307, i32 %308, %struct.TIFFDirEntry* %309, i32 %310, double* %311)
  store i32 %312, i32* %7, align 4
  br label %325

; <label>:313:                                    ; preds = %43
  %pgocount23 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 10)
  %314 = add i64 %pgocount23, 1
  store i64 %314, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 10)
  br label %316

; <label>:315:                                    ; preds = %302, %267, %232, %197, %162, %127, %85
  store i32 1, i32* %17, align 4
  br label %316

; <label>:316:                                    ; preds = %315, %313, %300, %265, %230, %195, %160, %125, %83
  %317 = load i8*, i8** %15, align 8
  %318 = getelementptr inbounds [80 x i8], [80 x i8]* %14, i32 0, i32 0
  %319 = icmp ne i8* %317, %318
  br i1 %319, label %320, label %323

; <label>:320:                                    ; preds = %316
  %pgocount24 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 7)
  %321 = add i64 %pgocount24, 1
  store i64 %321, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_TIFFWriteAnyArray, i64 0, i64 7)
  %322 = load i8*, i8** %15, align 8
  call void @_TIFFfree(i8* %322)
  br label %323

; <label>:323:                                    ; preds = %320, %316
  %324 = load i32, i32* %17, align 4
  store i32 %324, i32* %7, align 4
  br label %325

; <label>:325:                                    ; preds = %323, %304
  %326 = load i32, i32* %7, align 4
  ret i32 %326
}

declare void @TIFFWarning(i8*, i8*, ...) #1

declare i32 @_TIFFmemcmp(i8*, i8*, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #3

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
